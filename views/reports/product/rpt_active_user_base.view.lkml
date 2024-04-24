view: rpt_active_user_base {
  sql_table_name: "REPORTS_PRODUCT".rpt_active_user_base ;;
  label: " * Server: Information"


  # IDs

  dimension: server_id {
    type: string
    sql: ${TABLE}.server_id ;;
    primary_key: yes
    label: "Server ID"
    description: "The server's ID"

  }

  measure: count_distinct_servers {
    type: count_distinct
    drill_fields: [server_id, company_name, contact_email, sku, cloud_plan_name]
    label: "Total Unique Servers"
    view_label: " * Metrics: Server"
  }

  ###
  ### Server Information
  ###

  dimension: last_known_server_ip {
    type: string
    sql: ${TABLE}.last_known_server_ip;;
    label: "Last known server IP"
    description: "Last recorded IP address for the server. IP address may originate either from security update endpoint or telemetry."
  }


  ###
  ### Active Users
  ###

  dimension: client_daily_active_users {
    type: number
    sql: ${TABLE}.client_daily_active_users ;;
    label: "DAU (Client)"
    description: "Number of unique users for current date, reported by client telemetry. Equals to the number of unique users that performed an action in the given calendar date."
    view_label: " * Server: Active Users"

  }

  measure: total_client_daily_active_users {
    type: sum
    sql: ${client_daily_active_users} ;;
    label: "Total DAU (Client)"
    view_label: " * Server: Active Users"
  }

  dimension: client_monthly_active_users {
    type: number
    sql: ${TABLE}."CLIENT_MONTHLY_ACTIVE_USERS" ;;
    label: "MAU (Client)"
    description: "Number of unique users for the past 30 days, reported by client telemetry. Equals to the number of unique users that performed an action in the given date and previous 29 days."
    view_label: " * Server: Active Users"
  }

  measure: total_client_monthly_active_users {
    type: sum
    sql: ${client_daily_active_users} ;;
    label: "Total MAU (Client)"
    view_label: " * Server: Active Users"
  }

  dimension: server_monthly_active_users {
    type: number
    sql: ${TABLE}.server_monthly_active_users ;;
    label: "MAU (Server)"
    description: "MAU reported by MM server activity. Defined as the number of unique users that performed an action in the 31 days previous to sending the telemetry data."
    view_label: " * Server: Active Users"

  }

  measure: total_server_monthly_active_users {
    type: sum
    sql: ${server_monthly_active_users} ;;
    label: "Total MAU (Server)"
    view_label: " * Server: Active Users"
  }

  dimension: server_mau_bucket {
    type: string
    sql: ${TABLE}.server_mau_bucket ;;
    label: "MAU Bucket"
    description: " Group size for the given server, based on server-reported MAU. Valid values are `1-50`, `50-500`, `500-1000`, `>= 1000`. Lower bound is inclusive while upper bound is exclusive."
    view_label: " * Server: Active Users"
  }

  dimension: count_registered_users {
    type: number
    sql: ${TABLE}.count_registered_users ;;
    label: "Registered users"
    description: "Total number of registered users. Includes deleted users."
    view_label: " * Server: Active Users"
  }

  measure: total_count_registered_users {
    type: sum
    sql: ${count_registered_users} ;;
    label: "Total Registered Users"
    view_label: " * Server: Active Users"
    }

  dimension: count_registered_deactivated_users {
    type: number
    sql: ${TABLE}.count_registered_deactivated_users ;;
    label: "Deactivated Users"
    description: "Total number of inactive (deleted) users."
    view_label: " * Server: Active Users"
  }

  measure: total_count_registered_deactivated_users {
    type: sum
    sql: ${count_registered_deactivated_users} ;;
    label: "Total Deactivated Users"
    view_label: " * Server: Active Users"
  }

  dimension: count_registered_active_users {
    type: number
    sql: ${TABLE}.count_registered_users - ${TABLE}.count_registered_deactivated_users;;
    label: "Active Registered Users"
    description: "Total number of active registered users. Does not include deleted users."
    view_label: " * Server: Active Users"
  }

  measure: total_count_registered_active_users {
    type: sum
    sql: ${count_registered_active_users} ;;
    label: "Total Active Registered Users"
    view_label: " * Server: Active Users"
  }

  ###
  ### License information
  ###

  dimension: license_id {
    type: string
    sql: ${TABLE}.license_id ;;
    label: "License ID"
    view_label: "License: Information"
  }

  dimension: installation_id {
    type: string
    sql: ${TABLE}.installation_id ;;
    label: "Installation Id"
    view_label: "License: Information"
  }

  dimension: is_trial_license {
    type: yesno
    sql: ${TABLE}.is_trial_license ;;
    label: "Trial license?"
    description: "Whether the license is a trial license. Null in case license is missing."
    view_label: "License: Information"
  }

  dimension_group: license_expire {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.license_expire_at ;;
    label: "License Expiration"
    description: "The expiration date of the license. Exists only if license data have been found."
    view_label: "License: Information"
  }

  dimension: cloud_plan_name {
    type: string
    sql: ${TABLE}.cloud_plan_name ;;
    label: "Cloud Plan"
    description: "The name of the cloud plan."
    view_label: "License: Information"
  }

  dimension: sku {
    type: string
    sql: ${TABLE}.sku ;;
    label: "SKU"
    description: "The SKU for the license or `Unknown` if it's not known (i.e. in legacy licenses)."
    view_label: "License: Information"

  }

  ###
  ### Customer information
  ###

  dimension: company_name {
    type: string
    sql: ${TABLE}.company_name ;;
    label: "Company name"
    description: "The name of the company that this license has been issued for."
    view_label: "Customer: Information"
  }

  dimension: contact_email {
    type: string
    sql: ${TABLE}.contact_email ;;
    description: "The name of the company that this license has been issued for."
    view_label: "Customer: Information"
  }

  ###
  ### Metadata
  ###

  dimension: source {
    type: string
    sql: ${TABLE}.source ;;
    label: "License Source"
    description: "The source of the license data. One of `CWS`, `Legacy`,  `CWS and Legacy`, 'Stripe'."
    view_label: "Metadata"
  }


  dimension: found_matching_license_data {
    type: yesno
    sql: ${TABLE}.found_matching_license_data ;;
    label: "Found license data?"
    description: "Boolean flag, indicating whether license data have been found for the current license id.
    - True if matching data have been found.
    - False if no license id has been found or if no matching license exists."
    view_label: "Metadata"
  }

  dimension: found_matching_stripe_entry {
    type: yesno
    sql: ${TABLE}.found_matching_stripe_entry ;;
    label: "Found Stripe Entry?"
    description: "Boolean flag, indicating whether data for the current installation ID are available in Stripe.
      - True if matching data have been found.
      - False if no data have been found or if there's no installation ID."
    view_label: "Metadata"
  }

  dimension_group: last_installation_id {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.last_installation_id_date ;;
    label: "Last Installation ID"
    description: "The last date that installation id data was available for the current server ID over telemetry."
    view_label: "Metadata"
  }

  dimension_group: last_known_server_ip {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.last_known_server_ip_date ;;
    label: "Last Known IP"
    description: "Date that the last known server IP was recorded."
    view_label: "Metadata"

  }

  dimension_group: last_license_telemetry {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}. last_license_telemetry_date;;
    label: "Last License Telemetry"
    description: "The last date that license data was available for the current server ID over telemetry."
    view_label: "Metadata"
  }
}
