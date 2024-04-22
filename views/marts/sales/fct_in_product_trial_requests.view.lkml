view: fct_in_product_trial_requests {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "MART_SALES"."FCT_IN_PRODUCT_TRIAL_REQUESTS" ;;
  label: "Trial Requests"

  dimension: trial_request_id {
    type: string
    sql: ${TABLE}.trial_request_id ;;
    primary_key: yes
    label: "Trial Request ID"
    hidden: yes
  }

  # Trial information


  dimension: request_source {
    type: string
    sql: ${TABLE}.request_source ;;
    label: "Source"
    description: "Source of trial request. Either in-app or website."
    view_label: "* Trial Request"
  }

  dimension: license_id {
    type: string
    sql: ${TABLE}.license_id ;;
    label: "License ID"
    description: "The ID of the license associated with the current trial request."
    view_label: "* Trial Request"
  }


  dimension_group: license_activation {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.license_activation_date ;;
    label: "License Activation"
    description: "The first date that telemetry was received from a server matching this trial request's license."
    view_label: "* Trial Request"
  }


  dimension_group: trial_start {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: CAST(${TABLE}.trial_start_at AS TIMESTAMP_NTZ) ;;
    label: "Trial Start"
    description: "The start date of the trial."
    view_label: "* Trial Request"
  }

  # Company information


  dimension: company_name {
    type: string
    sql: ${TABLE}.company_name ;;
    label: "Company Name"
    description: "The company's name. If not provided, 'Unknown' is used."
    view_label: "Company: Information"
  }

  dimension: company_size {
    type: number
    sql: CASE
      WHEN  ${TABLE}.company_size = 1 THEN '1-50'
      WHEN  ${TABLE}.company_size = 50 THEN '50-100'
      WHEN  ${TABLE}.company_size = 100 THEN '100-500'
      WHEN  ${TABLE}.company_size = 500 THEN '500-1000'
      WHEN  ${TABLE}.company_size = 1000 THEN '1000-2500'
      WHEN  ${TABLE}.company_size = 2500 THEN 'More than 2500'
      ELSE 'Unknown'
    END ;;
    label: "Company Size"
    description: "The size of the company."
    view_label: "Company: Information"
  }


  dimension: country_name {
    type: string
    sql: iff(${TABLE}.country_name = '', 'Unknown', ${TABLE}.country_name);;
    label: "Country Name"
    description: "The name of the country."
    view_label: "Company: Information"
  }


  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
    label: "Full Name"
    description: "The user's full name."
    view_label: "Company: Information"
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
    label: "First Name"
    description: "The user's first name. This value may originate from:
    - First name (if directly provided).
    - By splitting the name string on first space and keeping the first part.
    - If none of the above are available, the first 40 characters of the 'username' part of the email."
    view_label: "Company: Information"

  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
    label: "Last Name"
    description: "The user's last name. This value may originate from:
      - Last name (if directly provided).
      - By splitting the name string on first space and keeping the second part.
      - If none of the above are available, the first 40 characters of the 'username' part of the email.
    "
    view_label: "Company: Information"
  }

  dimension: num_users {
    type: number
    sql: ${TABLE}.num_users ;;
    label: "Number of users"
    description: "Number of end users for the server."
    view_label: "Company: Information"
  }


  dimension: normalized_email {
    type: string
    sql: ${TABLE}.normalized_email ;;
    label: "Email"
    description: "The contact email provided in the signup form. If not filled in, it's the email of the user requesting the trial. Email is lowercased in order to match Salesforce lowercased emails."
    view_label: "Company: Information"
  }


  dimension: is_valid_email {
    type: yesno
    sql: ${TABLE}.is_valid_email ;;
    label: "Is valid email?"
    view_label: "Company: Information"
  }

  # Metadata

  dimension: server_ids {
    type: string
    sql: ${TABLE}.server_ids ;;
    label: "Server IDs"
    description: "List of server IDs that reported the license matching the current trial request."
    view_label: "Metadata"
  }

  # Measures

  measure: count {
    type: count
    drill_fields: [license_id, country_name, first_name, last_name, name, company_name, num_users, server_ids]
    label: "Total trial requests"
    description: "Count of trial requests."
    view_label: "* Trial Request"
  }

  ### Hidden dimensions - intended for holding Salesforce Sync status

  dimension: campaign_id {
    type: string
    sql: ${TABLE}.campaign_id ;;
    # Always the same since all are assigned to the same campaign.
    hidden: yes
  }

  dimension: campaign_member_status {
    type: string
    sql: ${TABLE}.campaign_member_status ;;
    # Sync status with Salesforce campaign. Not useful in looker.
    hidden: yes
  }

  dimension: is_existing_campaign_member {
    type: yesno
    sql: ${TABLE}.is_existing_campaign_member ;;
    # Helper for sync status with Salesforce campaign. Not useful in looker.
    hidden: yes
  }

  dimension: lead_id {
    type: string
    sql: ${TABLE}.lead_id ;;
    # Sync status with Salesforce lead. Not useful in looker.
    hidden: yes
  }

  dimension: is_existing_lead {
    type: yesno
    sql: ${TABLE}.is_existing_lead ;;
    # Helper for sync status with Salesforce campaign. Not useful in looker.
    hidden: yes
  }
}
