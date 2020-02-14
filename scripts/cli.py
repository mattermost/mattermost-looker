#!/usr/bin/env python

from flask_script import Manager
import pprint, os
from find_missing_fields import check_explores_for_missing_fields
from search import search_looker


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
