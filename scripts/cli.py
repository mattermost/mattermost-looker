#!/usr/bin/env python

from flask_script import Manager
import pprint, os
from find_missing_fields import check_explores_for_missing_fields
from search import search_looker
from looker_utils import looker_client


pp = pprint.PrettyPrinter(indent=4)


#
# Flask required for command line manager
#
from flask import Flask
app = Flask(__name__)
manager = Manager(app)


@manager.command
def find_missing_fields():
    '''
    Loops over all explores in all models and then executes a query using all fields.
    If an error occurs it does some basic field matching to determine the offending dimension(s).
    It removes that dimension(s) and then proceeds tries the query again, removing bad dimensions, until it can successfully execute.
    Note this method will report the same dimension problem multiple times if it's included in multiple different explores.
    '''
    check_explores_for_missing_fields()


@manager.command
def search(input_str, context_length=None):
    '''
    Look in the url's for Looks and Dashboard Tiles for the input_str
    '''
    if context_length:
        context_length = int(context_length)

    search_looker(input_str, context_length=context_length)


@manager.command
def public_looks():
    '''
    Finds public looks
    '''
    looks = looker_client.all_looks()

    # Loop over all the looks
    for look in looks:
        # look_details = look_api.look(look.id)
        if look.public:
            print('Look Title="{}", Look URL={}'.format(look.title, look.short_url))



@manager.command
def validate_project():
    '''
    Finds problems with the data_warehouse project
    '''
    validate_results = looker_client.validate_project('data_warehouse')
    print(validate_results)


@manager.command
def validate_content():
    '''
    Finds problems with content
    '''
    content_validation = looker_client.content_validation()
    if content_validation.content_with_errors:
        for e in content_validation.content_with_errors:
            pp.pprint(e.look)
    else:
        print('No content validation errors')


# @manager.command
# def get_api_sample(obj):
#     '''
#     Get a sample object from the API
#     '''
#     data = None
#     if obj == 'model':
#         pass
#     elif obj == 'explore':
#         pass
#     else:
#         print('Unknown API object: {}'.format(obj))
#         return
#     pp.print(data)


if __name__ == "__main__":
    manager.run()
