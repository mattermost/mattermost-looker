import re
from looker_utils import model_api, query_api, do_on_all_explores


# Regex to be used to grab the invalid identifier in sql error messages.
# This is known to work for snowflake but could work with other databases as well.
INVALID_IDENTIFIER_REGEX = re.compile('invalid identifier \'(\\w+.\\w+)\'')


def is_dimension_match_for_invalid_identifier(dimension, invalid_identifier):
    '''
    This function determines if the dimension provided is a match for the error's invalid identifer

    The dimension param will have the following shape:
    {
        'name': 'account_owner.username',
        'view': 'account_owner',
        'sql': '${TABLE}.USERNAME ',
    }

    error will looks like account_owner.username
    '''

    # Break the error into its parts
    invalid_identifier_parts = invalid_identifier.strip().split('.')
    
    # Make sure we only have two parts
    assert len(invalid_identifier_parts) == 2

    error_table_alias = invalid_identifier_parts[0]
    error_column_name = invalid_identifier_parts[1]

    # Ensure the table alias match
    if error_table_alias.lower() != dimension['view'].lower():
        return False

    # Ensure the column names match
    return dimension['sql'].endswith(error_column_name.lower())


def check_explore(model, explore):
    '''
    A function which checks an individual explore for invalid identifiers.
    It does this by trying to run an explore with all dimensions selected and then 
    '''
    model_name = model.name
    explore_name = explore.name

    # Get all fields from the explore
    explore = model_api.lookml_model_explore(model_name, explore_name)

    # Build a look up table 
    dimensions = [{
        'name': d.name.strip().lower(),
        'view': d.view.strip().lower(),
        'sql': d.sql.strip().lower()
    } for d in explore.fields.dimensions]

    # Initialize to start loop
    error_found = True

    # Continue running queries until all errors have been removed
    while error_found:
        # Run the query
        body = {
            'model': model_name,
            'view': explore_name,
            'fields': [d['name'] for d in dimensions],
            # "fields": ['account_owner.start_raw'],
            'limit':'1'
        }

        resp = query_api.run_inline_query('txt', body)
        # Look for an errors
        # resp_first_row = resp.split('\n')[0]
        error_found = False
        if resp:
            # Determine if it's a SQL error
            # Error string looks like the following
            if resp.startswith('SQL Error:'):
                # SQL Error: SQL Syntax Error: SQL compilation error: error line 11 at position 1\ninvalid identifier 'ACCOUNT_OWNER._HC_ERR'
                matches = INVALID_IDENTIFIER_REGEX.search(resp)
                if matches:
                    # The table name will always be the view name because of table aliasing but the field will be the raw sql
                    invalid_identifier = matches.group(1).lower()
                    
                    error_found = True

                    # Remove from dimensions list
                    # dimensions = list(filter(lambda d: d['name'] != invalid_identifier, dimensions))
                    dimensions_to_keep = []
                    dimension_names_to_toss = []

                    for d in dimensions:
                        if is_dimension_match_for_invalid_identifier(d, invalid_identifier):
                            dimension_names_to_toss.append(d['name'])
                        else:
                            dimensions_to_keep.append(d)

                    print('Found a problem with {}, tossing {}'.format(invalid_identifier, dimension_names_to_toss))
                    dimensions = dimensions_to_keep

                    # Check to make sure we were able to identify the problem dimension(s)
                    if len(dimension_names_to_toss) == 0:
                        print('ERROR: An invalid identifier was found but is_dimension_match_for_invalid_identifier was unable to determine which field was the problem.')
                        print('Skipping the rest of this explore to avoid an infinite loop but is_dimension_match_for_invalid_identifier should be updated to handle this case')
                        error_found = False

                else:
                    # It's an error but not an invalid identifier
                    print('*** Other unknown SQL error: {}'.format(resp))


def check_explores_for_missing_fields():
    '''
    Loops over all the explores in a Looker instance and checks that there are no
    invalid identifiers in the LookML
    '''
    def func(model, explore):
        print('Checking {}/{}'.format(model.name, explore.name))
        check_explore(model, explore)

    do_on_all_explores(func)


# Run the script
if __name__ == '__main__':
    check_explores_for_missing_fields()

    # Use the following code if you'd like to just check a single explore
    # check_explore('model_name', 'explore_name')
