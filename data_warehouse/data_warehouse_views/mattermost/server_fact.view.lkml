view: server_fact {
sql_table_name: mattermost.server_fact ;;
  view_label: "Server Fact"

  # Dimensions
  dimension: server_id {
    description: "The unique server ID for each server."
    type: string
    sql: ${TABLE}.server_id ;;
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
    sql: ${TABLE}.account_sfid ;;
  }

  dimension_group: first_active {
    description: "The date the server was first active (first recorded instance of server appearing server logging data)."
    type: time
    timeframes: [date, month, year]
    sql: ${TABLE}.first_active_date ;;
  }

  dimension_group: last_active {
    description: "The date the server was last active (last recorded instance of server appearing server logging data)."
    type: time
    timeframes: [date, month, year]
    sql: ${TABLE}.last_active_date ;;
  }

  dimension_group: first_telemetry_active {
    description: "The date the server was first active (first recorded telemetry enabled date)."
    type: time
    timeframes: [date, month, year]
    sql: ${TABLE}.first_telemetry_active_date ;;
  }

  dimension_group: last_telemetry_active {
    description: "The date the server was last active (last recorded telemetry enabled date)."
    type: time
    timeframes: [date, month, year]
    sql: ${TABLE}.last_telemetry_active_date ;;
  }

  dimension: max_active_user_count {
    description: "The all-time maximum number of active users logged on the server."
    type: number
    sql: ${TABLE}.max_active_user_count;;
  }

  dimension_group: last_active_user {
    description: "The date the server was first active (first recorded telemetry enabled date)."
    type: time
    timeframes: [date, month, year]
    sql: ${TABLE}.last_active_user_date ;;
  }

  # Measures
  measure: server_count {
    description: "Use this for counting distinct Server ID's across many servers, days, or dates."
    type: count_distinct
    sql: ${server_id} ;;
  }
}
