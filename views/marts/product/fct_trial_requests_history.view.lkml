view: fct_trial_requests_history {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "MART_PRODUCT".fct_trial_request_history ;;
  label: "  * Trial Requests"


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

  dimension: installation_id {
    type: string
    sql: ${TABLE}.installation_id ;;
    label: "Installation ID"
    description: "The ID of the server's installation. Exists only if server is a cloud server."
  }

  ###
  ### Basic trial information
  ###


  dimension: trial_email {
    type: string
    sql: ${TABLE}.trial_email ;;
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
    label: "Company Name"
    description: "The name of the company requesting the trial."
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
    label: "First Name"
    description: "The first name of the user who requested the trial."
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
    label: "Last Name"
    description: "The last name of the user who requested the trial."
  }

  dimension: request_source {
    type: string
    sql: ${TABLE}.request_source ;;
    label: "Request Source"
    description: "Whether this trial request is originating from In-app or from Mattermost website. For Cloud it is 'Stripe'"
  }

  dimension: request_type {
    type: string
    sql: ${TABLE}.request_type ;;
    label: "Request Type"
    description: "For Self-Hosted it is 'in-product'. For Cloud it is 'cloud'"
  }

  dimension: site_url {
    type: string
    sql: ${TABLE}.site_url ;;
    label: "Site URL"
    description: "The URL of the installation set via the system console in Mattermost by the user, or https://mattermost.com if trial was requested from mattermost.com/trial."
  }

  ###
  ### Dates for the current trial
  ###

  dimension_group: created_at {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    sql: CAST(${TABLE}.start_at AS TIMESTAMP_NTZ) ;;
    label: "Created At"
    description: "Date when trial was created at. Note that trials start as soon as the trial request is created, making this date similar to trial start timestamp."
  }

  dimension_group: start_at {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    sql: CAST(${TABLE}.start_at AS TIMESTAMP_NTZ) ;;
    label: "Start At"
    description: "Date when trial starts at. Note that trials start as soon as the trial request is created, making this date similar to trial creation timestamp."
  }


  dimension_group: end_at {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    sql: CAST(${TABLE}.end_at AS TIMESTAMP_NTZ) ;;
    label: "End At"
    description: "Date when trial ends at."
  }

  ###
  ### Company type
  ###

  dimension: marked_as_smb {
    type: yesno
    sql: ${TABLE}.marked_as_smb;;
    label: "Marked as SMB?"
    description: "Whether a lead with company type equals to SMB for the same email exists."
  }

  dimension: marked_as_enterprise {
    type: yesno
    sql: ${TABLE}.marked_as_enterprise;;
    label: "Marked as Enterprise?"
    description: "Whether a lead with company type equals to Enterprise for the same email exists."
  }

  dimension: marked_as_midmarket {
    type: yesno
    sql: ${TABLE}.marked_as_midmarket;;
    label: "Marked as Midmarket?"
    description: "Whether a lead with company type equals to Midmarket for the same email exists."
  }

  dimension: marked_as_federal {
    type: yesno
    sql: ${TABLE}.marked_as_federal;;
    label: "Marked as Federal?"
    description: "Whether a lead with company type equals to Federal for the same email exists."
  }

  dimension: marked_as_academic {
    type: yesno
    sql: ${TABLE}.marked_as_academic;;
    label: "Marked as Academic?"
    description: "Whether a lead with company type equals to Academic for the same email exists."
  }

  dimension: marked_as_mme {
    type: yesno
    sql: ${TABLE}.marked_as_mme;;
    label: "Marked as MME?"
    description: "Whether a lead with company type equals to MME for the same email exists."
  }

  dimension: marked_as_non_profit {
    type: yesno
    sql: ${TABLE}.marked_as_non_profit;;
    label: "Marked as Non-Profit?"
    description: "Whether a lead with company type equals to Non-Profit for the same email exists."
  }

  dimension: num_company_types {
    type: number
    sql: ${TABLE}.num_company_types;;
    label: "Number of Company Types"
    description: "The number of different company types that are matching the current trial request."
  }

  ###
  ### Extra dimensions
  ###


  dimension: contact_email {
    type: string
    sql: ${TABLE}.contact_email ;;
    label: "Contact Email"
    description: "The contact email, as filled in in the input box in the trial request form. Prefer trial email."
    view_label: " * Trial Request: Source data"
  }

  dimension: user_email {
    type: string
    sql: ${TABLE}.user_email ;;
    label: "User Email"
    description: "The user email (not available for Cloud)"
    view_label: " * Trial Request: Source data"
  }

  dimension: stripe_product_id {
    type: string
    sql: ${TABLE}.stripe_product_id ;;
    label: "Product Id (from Stripe)"
    description: "Product id"
    view_label: " * Trial Request: Source data"
  }

  dimension_group: converted_to_paid_at {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    sql: ${TABLE}.converted_to_paid_at ;;
    label: "Converted to Paid Date (from Stripe)"
    description: "The timestamp when the subscription was converted to paid status."
    view_label: " * Trial Request: Source data"
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
    label: "Status (from Stripe)"
    description: "The status of the subscription."
    view_label: " * Trial Request: Source data"
  }

  ###
  ### Metadata related to all trial request history from current email.
  ###

  dimension_group: first_trial_start {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    sql: CAST(${TABLE}.first_trial_start_at AS TIMESTAMP_NTZ) ;;
    label: "First Trial Started At"
    view_label: " * History: Summary"
    description: "The start date of the first trial (in chronological order) for the current email."
  }

  dimension_group: last_trial_start {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    sql: CAST(${TABLE}.last_trial_start_at AS TIMESTAMP_NTZ) ;;
    label: "Last Trial Started At"
    view_label: " * History: Summary"
    description: "The start date of the latest trial (in chronological order) for the current email."
  }

  ###
  ### Measures
  ###

  measure: count {
    type: count
    drill_fields: [trial_request_id, start_at_date, trial_email, company_name, server_id, installation_id]
    label: "Count Trial Requests"
    view_label: " * Metrics: Trial Requests"
  }
}
