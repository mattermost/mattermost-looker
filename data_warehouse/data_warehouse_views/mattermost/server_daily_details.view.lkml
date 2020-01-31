view: server_daily_details {
  sql_table_name: mattermost.server_daily_details ;;
  view_label: "Server Daily Details"

  # Dimensions
  dimension: id {
    description: "The unique server ID for each telemetry-enabled active server."
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension_group: logging {
    description: "The date the server details were logged."
    type: time
    timeframes: [date, month, year]
    sql: ${TABLE}.date ;;
  }

  dimension: hour {
    description: "The hour in the day the server details were logged."
    type: number
    sql: ${TABLE}.hour ;;
  }

  dimension: ip_address {
    label: "IP Address"
    description: "The server's IP Address."
    type: string
    sql: ${TABLE}.ip_address ;;
  }

  dimension: grouping {
    description: "The grouping representing the time of day that the server details were logged (A=AM, B=PM)."
    type: string
    sql: ${TABLE}.grouping ;;
  }

  dimension: location {
    description: "The 3 digit ISO code of the city or area that server resides in."
    type: string
    sql: ${TABLE}.location ;;
  }

  dimension: active_user_count {
    description: "The count of users that have visited the Mattermost site in the last 24 hours on the server."
    type: number
    sql: ${TABLE}.active_user_count ;;
  }

  dimension: user_count {
    description: "The count of all users provisioned to/associated with the server."
    type: number
    sql: ${TABLE}.user_count ;;
  }

  dimension: version {
    description: "The version of Mattermost the server is currently using (example: 5.9.0.5.9.8)"
    type: string
    sql: ${TABLE}.version ;;
  }

  dimension: db_type {
    label: "Database Type"
    description: "The type of database the server is currently using (postgres vs. mysql)"
    type: string
    sql: ${TABLE}.db_type ;;
  }

  dimension: os_type {
    label: "Operating System"
    description: "The operating system the server is currently using (linux, darwin, windows, etc.)"
    type: string
    sql: ${TABLE}.os_type ;;
  }

  dimension: account_sfid {
    label: "Account SFID"
    description: "The Salesforce Account ID of the Mattermost customer associated with the server (null if no Salesforce Account found)."
    type: string
    sql: ${TABLE}.account_sfid ;;
  }

  dimension: license_id {
    label: "License ID"
    description: "The Mattermost Customer License ID associated with the server (null if no license found)."
    type: string
    sql: ${TABLE}.license_id ;;
  }

  dimension: license_status {
    label: "License Status"
    description: "Indicates whether the server is registered/paired with a licensed customer (If licensed status = 'licensed' else 'unlicensed)."
    type: string
    sql: case when ${license_id} is not null then 'licensed' else 'unlicensed' end ;;
  }


  # Measures
  measure: server_count {
    description: "Use this for counting distinct Server ID's across many servers or an entire day. This measure is used to calculate TEDAS (Telemetry-Enabled Daily Active Servers) when aggregated at the daily level."
    type: count_distinct
    sql: ${id} ;;
  }

  measure: total_active_user_count {
    description: "Use this for summing active user counts across many servers. This measure is used to calculate TEDAU (Telemetry-Enabled Daily Active Users) when aggregated at the daily level."
    type: sum
    sql: ${active_user_count} ;;
  }

  measure: total_user_count {
    description: "Use this for summing user counts across many servers."
    type: sum
    sql: ${user_count} ;;
  }
}
