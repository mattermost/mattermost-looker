import re
import urllib.parse
from looker_utils import model_api, query_api, look_api, dashboard_api

# Get the queries being executed OR get the stored queries parameters

DEFAULT_CONTEXT_LENGTH = 10

def get_search_results(input_str, str_to_search, context_length=None, strip=True):
    '''
    Finds all occurances of an input_str in the search string and returns an array of results with context
    '''
    # Set context_length to the default if needed
    if context_length is None:
        context_length = DEFAULT_CONTEXT_LENGTH

    results = []
    for m in re.finditer(input_str.lower(), str_to_search.lower()):
        # Calc the start index
        snippet_start_index = m.start() - context_length
        if snippet_start_index < 0:
            snippet_start_index = 0

        # Calc the end index
        snippet_end_index = m.end() + context_length
        if snippet_end_index > len(str_to_search):
            snippet_end_index = len(str_to_search)

        search_result = str_to_search[snippet_start_index:snippet_end_index]
        if strip:
            search_result = search_result.strip()

        results.append(search_result)

    return results


def print_matches_for_url(url, input_str, object_description, context_length=None):
    '''
    Print all the matches of the input_str found in the provided url
    '''
    unparsed_url = urllib.parse.unquote_plus(url)

    search_results = get_search_results(input_str, unparsed_url, context_length=context_length)
    if len(search_results) > 0:
        print('***')
        print('Found match for {}'.format(object_description))
        print('URL: {}'.format(unparsed_url))
        for sr in search_results:
            print('- {}'.format(sr))


def search_looks(input_str, context_length=None):
    '''
    Looks in all the look URLs to see if they match input_str
    '''
    input_str = input_str.lower()

    # Get all the looks in the system
    looks = look_api.all_looks()

    # Loop over all the looks
    for look in looks:
        look_details = look_api.look(look.id)
        print_matches_for_url(look_details.url, input_str, 'Look Title="{}", Look URL={}'.format(look_details.title, look_details.short_url), context_length=context_length)


def search_dashboards(input_str, context_length=None):
    '''
    Looks in all dashboard tile URLs to see if they match input_str
    '''
    input_str = input_str.lower()

    # Get all the dashboards in the system
    dashboards = dashboard_api.all_dashboards()

    # Loop over all the dashboards
    for dashboard in dashboards:
        # Get the dashboard details
        dashboard_details = dashboard_api.dashboard(dashboard.id)

        # Loop over the dashboard elements
        for e in dashboard_details.dashboard_elements:

            # We're looking at looks separately so skip if linked to a look
            if e.look_id is None and e.query is not None:
                print_matches_for_url(e.query.url, input_str, 'Dashboard Title="{}", Title Title="{}", URL={}'.format(dashboard_details.title, e.title, 'dashboards/{}'.format(dashboard.id)), context_length=context_length)


def search_looker(input_str, context_length=None):
    '''
    The starting for searching Looker for the input_str
    '''
    print('Searching for: "{}"'.format(input_str))
    search_looks(input_str, context_length=context_length)
    search_dashboards(input_str, context_length=context_length)


# Run the script
if __name__ == '__main__':
    search_looker('test')
