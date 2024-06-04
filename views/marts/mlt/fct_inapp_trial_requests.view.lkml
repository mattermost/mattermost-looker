# The name of this view in Looker is "Fct Inapp Trial Requests"
view: fct_inapp_trial_requests {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "MART_MLT".fct_inapp_trial_requests ;;
  label: "  * Trial Request: On-prem"


  ###
  ### IDs
  ###

  dimension: trial_request_id {
    type: string
    sql: ${TABLE}.trial_request_id ;;
    primary_key: yes
    hidden: no
  }


  dimension: server_id {
    type: string
    sql: ${TABLE}.server_id ;;
    label: "Server ID"
    description: "The id of the server where the trial request originates from."
  }


  ###
  ### Basic trial information
  ###


  dimension: trial_email {
    type: string
    sql: ${TABLE}."TRIAL_EMAIL" ;;
  }

  dimension: email_domain {
    type: string
    sql: ${TABLE}.email_domain ;;
    label: "Email Domain"
    description: "The domain part of the email. Useful for grouping requests from same companies."
  }

  dimension: company_name {
    type: string
    sql: ${TABLE}.company_name ;;
    label: "Company name"
    description: "The name of the company requesting the tria.l"
  }

  dimension: company_size_bucket {
    type: string
    sql: ${TABLE}.company_size_bucket ;;
    label: "Company Size (Bucket)"
    description: "Company size, belonging in one of the following buckets: 1-50, 50-100, 100-500, 500-1000, 1000-2500, 2500+."
  }

  dimension: country_name {
    type: string
    sql: ${TABLE}.country_name ;;
    label: "Country"
    description: "The name of the country, as filled in in the trial request from."
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
    label: "Name"
    description: "The display name of the user who requested the trial."
  }

  dimension: request_source {
    type: string
    sql: ${TABLE}.request_source ;;
    label: "Request source"
    description: "Whether this trial request is originating from In-app or from Mattermost website."
  }

  dimension: site_name {
    type: string
    sql: ${TABLE}.site_name ;;
    label: "Site Name"
    description: "The name of the Mattermost installation, as defined in the administrator view."
  }

  dimension: site_url {
    type: string
    sql: ${TABLE}.site_url ;;
    label: "Site URL"
    description: "The URL of the installation set via the system console in Mattermost by the user, or https://mattermost.com if trial was requested from mattermost.com/trial."
  }

  dimension: num_users {
    type: number
    sql: ${TABLE}.num_users ;;
    label: "Number of users"
    description: "The number of users."
  }


  dimension: is_valid_trial_email {
    type: yesno
    sql: ${TABLE}.is_valid_trial_email ;;
    label: "Is Valid Email?"
    description: "Whether the current email is valid. Emails are considered valid if they match format `%_@__%.__%`` and don't contain any of the characters `'\/()&$^!`."
  }

  dimension: is_first_trial {
    type: yesno
    sql: ${TABLE}.is_first_trial ;;
    label: "Is First Trial?"
    description: "Whether this is the first trial (in chronological order) requested by this email."
  }

  dimension: is_last_trial {
    type: yesno
    sql: ${TABLE}.is_last_trial ;;
    label: "Is last trial?"
    description: "Whether this is the first trial (in chronological order) requested by this email."
  }


  ###
  ### Dates for the current trial
  ###

  dimension_group: start_at {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    sql: CAST(${TABLE}.start_at AS TIMESTAMP_NTZ) ;;
    label: "Start At"
    description: "Date when trial starts at. Note that trials start as soon as the trial request is created, making this date similar to trial creation timestamp."
  }


  dimension_group: end {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    sql: CAST(${TABLE}.end_at AS TIMESTAMP_NTZ) ;;
    label: "End At"
    description: "Date when trial ends at."
  }


  ###
  ### Extra dimensions
  ###


  dimension: contact_email {
    type: string
    sql: ${TABLE}.contact_email ;;
    label: "Contact Email"
    description: "The contact email, as filled in in the input box in the trial request form Prefer trial email."
    view_label: "* Trial Request: Source data"
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
    label: "Email"
    description: "Used for backwards compatibility. Should be the same with contact email if contact email is not null. Prefer trial email."
    view_label: "* Trial Request: Source data"
  }


  ###
  ### Metadata related to all trial request history from current email.
  ###

  dimension_group: first_trial_start {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    sql: CAST(${TABLE}.first_trial_start_at AS TIMESTAMP_NTZ) ;;
    label: "First trial started at"
    view_label: " # History: Summary"
    description: "The start date of the first trial (in chronological order) for the current email."
  }

  dimension_group: last_trial_start {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    sql: CAST(${TABLE}.last_trial_start_at AS TIMESTAMP_NTZ) ;;
    label: "Last trial started at"
    view_label: " # History: Summary"
    description: "The start date of the latest trial (in chronological order) for the current email."
  }

  dimension: total_trial_requests {
    type: number
    sql: ${TABLE}.total_trial_requests ;;
    label: "Total Trial Requests"
    view_label: " # History: Summary"
    description: "The total number of trial requests for the current email."
  }


  ###
  ### Measures
  ###
  measure: total_num_users {
    type: sum
    sql: ${num_users} ;;
    label: "Total number of users"
    view_label: " * Metrics: trial requests"
  }



  measure: count {
    type: count
    drill_fields: [trial_request_id, trial_email, name, company_name, site_name, country_name]
    label: "Count Trial Requests"
    view_label: " * Metrics: trial requests"
  }
}
