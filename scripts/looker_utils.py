import lookerapi as looker
import os, sys


def get_required_env_var(env_var_name):
    '''
    A function which checks for an environment variable and quits the script if it does not exist
    '''
    var = os.environ.get(env_var_name)

    # Check if it exists, otherwise exit
    if not var:
        print('ERROR: Missing required environment variable {}'.format(env_var_name))
        sys.exit(-1)

    return var


# Initialize Looker connection info
BASE_URL = get_required_env_var('LOOKER_BASE_URL')
CLIENT_ID = get_required_env_var('LOOKER_CLIENT_ID')
CLIENT_SECRET = get_required_env_var('LOOKER_CLIENT_SECRET')


# Instantiate Auth API
unauthenticated_client = looker.ApiClient(BASE_URL)
unauthenticated_authApi = looker.ApiAuthApi(unauthenticated_client)


# Create authenticate client
token = unauthenticated_authApi.login(client_id=CLIENT_ID, client_secret=CLIENT_SECRET)
client = looker.ApiClient(BASE_URL, 'Authorization', 'token ' + token.access_token)


# Setup APIs
model_api = looker.LookmlModelApi(client)
query_api = looker.QueryApi(client)
look_api = looker.LookApi(client)
dashboard_api = looker.DashboardApi(client)
content_api = looker.ContentApi(client)
project_api = looker.ProjectApi(client)


def do_on_all_models(func, *args):
    models = model_api.all_lookml_models()

    for model in models:
        func(model, *args)


def do_on_all_explores(func, *args):
    def loop_over_explores(model):
        for explore in model.explores:
            func(model, explore, *args)

    do_on_all_models(loop_over_explores)


# do_on_all_models(lambda model: print(model.name))
# do_on_all_explores(lambda model, explore: print(model.name, explore.name))
