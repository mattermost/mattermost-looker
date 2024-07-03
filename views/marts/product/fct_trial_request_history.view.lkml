view: fct_trial_request_history {
  sql_table_name: "MART_PRODUCT".fct_trial_request_history ;;
  label: "Trial Request History"

  ###
  ###
  ###

  dimension: trial_request_id {
    type: string
    sql: ${TABLE}.trial_request_id ;;
    primary_key: yes
    label: "Trial Request ID"
  }


  ###
  ### Requestor information
  ###

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
    description: "The user's first name."
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
    description: "The user's last name."
  }

  dimension: company_name {
    type: string
    sql: ${TABLE}.company_name ;;
    description: "The company's name. If not provided, 'Unknown' is used."
  }


  dimension: site_url {
    type: string
    sql: ${TABLE}.site_url ;;
    label: "Site URL"
    description: "The URL of the installation."
  }

  dimension: trial_email {
    type: string
    sql: ${TABLE}."TRIAL_EMAIL" ;;
    description: "The email requesting the trial. It is the contact email provided in the signup form. If not filled in, it's  the email of the user requesting the trial."
  }

  dimension: email_domain {
    type: string
    sql: ${TABLE}.email_domain ;;
    description: "The domain part of the email."
  }

  dimension: contact_email {
    type: string
    sql: ${TABLE}.contact_email ;;
    group_label: "Extra information"
    description: "The contact email in the signup form (if any)."
  }

  dimension: user_email {
    type: string
    sql: ${TABLE}.user_email ;;
    group_label: "Extra information"
    description: "The email of the user requesting the trial request. Not to be confused with contact email. Available only in on-prem trial requests."
  }

  ###
  ### Dates
  ###

  dimension_group: created {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.created_at ;;
    description: "Date when trial request was created."
  }


  dimension_group: start_at {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: CAST(${TABLE}.start_at AS TIMESTAMP_NTZ) ;;
    description: "The time when the trial started at."
  }

  dimension_group: end {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: CAST(${TABLE}.end_at AS TIMESTAMP_NTZ) ;;
    description: "The time when the trial ends at."
  }


  dimension_group: first_trial_start {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: CAST(${TABLE}.first_trial_start AS TIMESTAMP_NTZ) ;;
    description: "The start time of the first trial for the given trial email."
  }

  dimension_group: last_trial_start {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: CAST(${TABLE}.last_trial_start_at AS TIMESTAMP_NTZ) ;;
    description: "The start time of the last trial for the given trial email."
  }

  ###
  ### Company type
  ###

  dimension: marked_as_academic {
    type: yesno
    sql: ${TABLE}.marked_as_academic ;;
    label: "Academic"
    description: "Whether a lead with Academic company type exists for the given trial email"
    group_label: "Company Type"
  }

  dimension: marked_as_enterprise {
    type: yesno
    sql: ${TABLE}.marked_as_enterprise;;
    label: "Enterprise"
    description: "Whether a lead with Enterprise company type exists for the given trial email"
    group_label: "Company Type"
  }

  dimension: marked_as_federal {
    type: yesno
    sql: ${TABLE}.marked_as_federal ;;
    label: "Federal"
    description: "Whether a lead with Federal company type exists for the given trial email"
    group_label: "Company Type"
  }

  dimension: marked_as_midmarket {
    type: yesno
    sql: ${TABLE}."marked_as_midmarket" ;;
    label: "Midmarket"
    description: "Whether a lead with Midmarket company type exists for the given trial email"
    group_label: "Company Type"
  }

  dimension: marked_as_mme {
    type: yesno
    sql: ${TABLE}.marked_as_mme ;;
    label: "MME"
    description: "Whether a lead with MME company type exists for the given trial email"
    group_label: "Company Type"
  }

  dimension: marked_as_non_profit {
    type: yesno
    sql: ${TABLE}.marked_as_non_profit ;;
    label: "Non-profit"
    description: "Whether a lead with Non-profit company type exists for the given trial email"
    group_label: "Company Type"
  }

  dimension: marked_as_smb {
    type: yesno
    sql: ${TABLE}.marked_as_smb ;;
    label: "SMB"
    description: "Whether a lead with SMB company type exists for the given trial email"
    group_label: "Company Type"
  }


  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  ###
  ### Metadata
  ###

  dimension: request_source {
    type: string
    sql: ${TABLE}.request_source ;;
    label: "Request Source"
    description: "The source of the request. Can be `In-Product`, `Website` or `Stripe`."
  }

  dimension: request_type {
    type: string
    sql: ${TABLE}.request_type ;;
    label: "Request Type"
    description: "The type of the request. Can be `cloud` or `in-product`."
  }


  dimension: num_company_types {
    type: number
    sql: ${TABLE}.num_company_types ;;
  }

  measure: count {
    type: count
    drill_fields: [trial_request_id, trial_email, first_name, last_name, company_name]
    label: "Total Trial Requests"
  }


  measure: count_unique_email {
    type: count_distinct
    sql: ${trial_email} ;;
    drill_fields: [trial_request_id, trial_email, first_name, last_name, company_name]
    label: "Total Unique Emails"
  }

  measure: count_unique_email_domain {
    type: count_distinct
    sql: ${email_domain} ;;
    drill_fields: [trial_request_id, trial_email, first_name, last_name, company_name]
    label: "Total Unique Email Domain"
  }
}
