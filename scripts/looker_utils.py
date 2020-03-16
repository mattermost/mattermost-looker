import os, sys
from looker_sdk import client


# This depends on either having the environment variables or the looker.ini file
looker_client = client.setup()


def do_on_all_models(func, *args):
    models = looker_client.all_lookml_models()

    for model in models:
        func(model, *args)


def do_on_all_explores(func, *args):
    def loop_over_explores(model):
        for explore in model.explores:
            func(model, explore, *args)

    do_on_all_models(loop_over_explores)


# do_on_all_models(lambda model: print(model.name))
# do_on_all_explores(lambda model, explore: print(model.name, explore.name))
