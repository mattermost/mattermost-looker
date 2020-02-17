## Install Dependencies
`pip install -r requirements.txt`

## Script to find missing fields
`./cli.py find_missing_fields`

## Script to search queries for a string
Ability to search Looks and Dashboard Tile URLs for a given string.  Helps with finding content including a phrase such as "Joyce Martinez"
https://mattermost.looker.com/dashboards-next/13?Remove+Staging+Data=-Joyce+Martinez

`./cli.py search "nicol" --context_length=50`

## Get publicly accessible Looks
`./cli.py public_looks`

## Validate the code in the project
`./cli.py validate_project`
