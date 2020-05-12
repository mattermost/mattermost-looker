# Useful API Docs
# Users: https://docs.looker.com/reference/api-and-integration/api-reference/v3.1/user
# User Attributes: https://docs.looker.com/reference/api-and-integration/api-reference/v3.1/user_attributes

import csv, json, pprint, os, re, shutil
from looker_utils import looker_client
import looker_sdk

pp = pprint.PrettyPrinter(indent=4)

USER_FILE_NAME = 'users.csv'

USER_FIELDS = [
    'created_at',
    'display_name',
    'first_name',
    'group_ids',
    'id',
    'is_disabled',
    'last_name',
    'logged_in_at',
]

# !!!
# NOTE: Do NOT add a new user attributes columns here without first deleting the user file first
# If you do, it will assume that this new user attribute should be blank for all users
# which will cause the sync part of this script to delete all existing user attribute values in Looker
# If you delete the user file and add your user attributes here, this script pull everything from Looker
# and make a new users file which you can update as you wish.
# !!!
USER_ATTRIBUTE_FIELDS = [
    'test_ua_string',
    'test_ua_number',
]

ALL_FIELDS = [
    'email',
] \
+ USER_FIELDS \
+ USER_ATTRIBUTE_FIELDS


def get_user_attribute_details(user_attribute_name):
    """
    A helper function to get the user attribute details dict given the user attribute's name
    """
    user_attributes_by_name = get_user_attributes_dict()
    if user_attribute_name not in user_attributes_by_name:
        print('ERROR: Trying to get unknown user attribute {}'.format(user_attribute_name))
        return None

    return user_attributes_by_name[user_attribute_name]


# This function follows a singleton pattern to only get the list of user attributes once
USER_ATTRIBUTES_BY_NAME = None
def get_user_attributes_dict():
    """
    A function which gets a list of all the user attributes in the Looker instance.
    This populates a singleton object so it's performant if you call it multiple times
    """
    global USER_ATTRIBUTES_BY_NAME

    if not USER_ATTRIBUTES_BY_NAME:
        # Get a list of user attributes
        USER_ATTRIBUTES_BY_NAME = {}
        for ua in looker_client.all_user_attributes():
            USER_ATTRIBUTES_BY_NAME[ua.name] = {
                'default_value': ua.default_value,
                'id': ua.id,
                'label': ua.label,
                'name': ua.name,
                'is_permanent': ua.is_permanent,
                'is_system': ua.is_system,
                'type': ua.type,
                'value_is_hidden': ua.value_is_hidden,
                'user_can_edit': ua.user_can_edit,
                'user_can_view': ua.user_can_view,
            }

    return USER_ATTRIBUTES_BY_NAME


def get_looker_users():
    """
    A function which gets a list of users from Looker
    """
    looker_users = []

    # Get a list of users from Looker
    # TODO: Deal with paging?
    users = looker_client.all_users()

    for u in users:
        # Skip Looker employees
        if u.verified_looker_employee:
            continue

        looker_user = {}

        # Add in the user fields
        for uf in USER_FIELDS + ['email']:
            looker_user[uf] = getattr(u, uf, None)

        # Separately add in nested created_at and logged_in which are in credentials
        creds = None
        if u.credentials_saml:
            creds = u.credentials_saml
        elif u.credentials_google:
            creds = u.credentials_google
        elif u.credentials_email:
            creds = u.credentials_email

        if creds:
            looker_user['created_at'] = creds.created_at
            looker_user['logged_in_at'] = creds.logged_in_at

        # Add in the user attributes
        looker_user['user_attributes'] = {}
        user_attributes = looker_client.user_attribute_user_values(looker_user['id'])

        # Get the looker user attribute value for this user
        for ua in user_attributes:
            if ua.name in USER_ATTRIBUTE_FIELDS:
                looker_user[ua.name] = ua.value

        looker_users.append(looker_user)

    return looker_users


def read_users_from_file(user_file):
    """
    Reads in the existing user file
    """
    users = []

    # Check to see if the user files already exists
    if not os.path.exists(user_file):
        print('WARNING: User file does not exist, going to create a new one using Looker data')
        return users

    with open(user_file) as csvfile:
        # Loop over file to build data structure
        reader = csv.DictReader(csvfile, fieldnames=ALL_FIELDS)

        # Skip the header
        next(reader)

        for row in reader:
            user = {}
            for f in ALL_FIELDS:
                user[f] = row[f]

            users.append(user)

    return users


def write_users_to_file(user_file, users):
    """
    Function to save the list of users back to the file with any necessary changes
    """
    # Backup the existing file, just in case
    if os.path.exists(user_file):
        shutil.copyfile(user_file, user_file + '.backup')

    # Sort users by their email address to keep file diffs in git correct
    users = sorted(users, key = lambda u: u['email'])

    with open(user_file, 'w') as csvfile:
        writer = csv.DictWriter(csvfile, fieldnames=ALL_FIELDS)

        writer.writeheader()
        for u in users:
            writer.writerow(u)


def _get_email_categories(file_users, looker_users):
    """
    Returns a tuple of all the emails broken into categories
    """
    file_emails_set = set([u['email'] for u in file_users])
    looker_emails_set = set([u['email'] for u in looker_users])

    emails_in_file_and_looker = list(file_emails_set.intersection(looker_emails_set))
    emails_only_in_file = list(file_emails_set-looker_emails_set)
    emails_only_in_looker = list(looker_emails_set-file_emails_set)

    return (emails_in_file_and_looker, emails_only_in_file, emails_only_in_looker)


def copy_fields_into_dict(src_dict, target_dict, fields):
    """
    A helper function which copies all the fields in the fields parameter from the src to the target dict
    """
    for f in fields:
        target_dict[f] = src_dict.get(f, None)


def convert_list_into_email_dict(input_list):
    output_dict = {}
    for obj in input_list:
        output_dict[obj['email']] = obj

    return output_dict


def sync_with_looker(file_users):
    """
    Updates looker appropriately and returns a list of file users with necessary changes
    """
    # new file_users
    new_file_users = []

    file_users_by_email = convert_list_into_email_dict(file_users)

    # Get a list of users from Looker
    looker_users = get_looker_users()
    looker_users_by_email = convert_list_into_email_dict(looker_users)

    # Get emails in both, only looker, and only file
    (emails_in_file_and_looker, emails_only_in_file, emails_only_in_looker) = _get_email_categories(file_users, looker_users)

    # Deal with emails in both
    for email in emails_in_file_and_looker:
        new_user = {
            'email': email
        }

        # copy user fields from from looker and attributes from file
        copy_fields_into_dict(looker_users_by_email[email], new_user, USER_FIELDS)
        copy_fields_into_dict(file_users_by_email[email], new_user, USER_ATTRIBUTE_FIELDS)

        # Add user
        new_file_users.append(new_user)

    # Deal with only in Looker, copy all values into the spreadsheet
    for email in emails_only_in_looker:
        new_user = {
            'email': email
        }

        # copy both from looker
        copy_fields_into_dict(looker_users_by_email[email], new_user, USER_FIELDS)
        copy_fields_into_dict(looker_users_by_email[email], new_user, USER_ATTRIBUTE_FIELDS)

        # Add user
        new_file_users.append(new_user)


    # Deal with only in file
    if len(emails_only_in_file) > 0:
        print('The following emails are only in the file, need to create user in Looker, copying values blindly: {}'.format(emails_only_in_file))

        for email in emails_only_in_file:
            new_user = {
                'email': email
            }

            # copy both from the file
            copy_fields_into_dict(file_users_by_email[email], new_user, USER_FIELDS)
            copy_fields_into_dict(file_users_by_email[email], new_user, USER_ATTRIBUTE_FIELDS)

            # Add user
            new_file_users.append(new_user)

    # Sync user attributes which are different in the file to looker
    for email in emails_in_file_and_looker:
        for ua in USER_ATTRIBUTE_FIELDS:
            looker_ua_val = looker_users_by_email[email][ua]
            file_ua_val = file_users_by_email[email][ua]
            both_are_unset = looker_ua_val is None and file_ua_val is ''

            # NOTE: User attributes cannot be set to the empty string in the UI so an file's empty string means unset
            if looker_ua_val != file_ua_val and not both_are_unset:
                print('User {} has differing {} user attribute value (old={} vs new={}), changing in Looker'.format(
                    email,
                    ua,
                    looker_ua_val,
                    file_ua_val
                ))

                # Get the user attributes details, specifically the id for the later api calls
                ua_details = get_user_attribute_details(ua)

                if file_ua_val == '':
                    # Need to unset the user attribute, so use the delete api
                    looker_client.delete_user_attribute_user_value(looker_users_by_email[email]['id'], ua_details['id'])

                else:
                    # Set the value to the new value
                    looker_client.set_user_attribute_user_value(
                        looker_users_by_email[email]['id'],
                        ua_details['id'], looker_sdk.models.WriteUserAttributeWithValue(
                            value=file_ua_val
                        )
                    )

    return new_file_users


def main():
    # Create list of users from file
    file_users = read_users_from_file(USER_FILE_NAME)

    # Sync data
    new_file_users = sync_with_looker(file_users)

    # Write file output
    write_users_to_file(USER_FILE_NAME, new_file_users)


# Run the script
if __name__ == '__main__':
    main()
