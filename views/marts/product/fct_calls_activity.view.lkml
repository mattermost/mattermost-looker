view: fct_calls_activity {
  label: "   * Server: Calls Telemetry"
  sql_table_name: "MART_PRODUCT"."FCT_CALLS_ACTIVITY" ;;

  dimension: daily_server_id {
    type: string
    sql: ${TABLE}.daily_server_id ;;
    primary_key: yes
    hidden: yes
  }

  dimension: server_id {
    type: string
    sql: ${TABLE}.server_id ;;
  }

  dimension_group: activity {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.activity_date ;;
    label: "Server Telemetry Activity" # Remember that `Date` is automatically appended by looker
    description: "The date current Calls data were captured at"
  }

  ###
  ### Facts
  ###

  ###
  ### DAU
  ###

  dimension: daily_active_users {
    type: number
    sql: ${TABLE}.daily_active_users ;;
    label: "DAU (Client)"
    description: "Number of unique users for current date, reported by Calls telemetry. Equals to the number of unique users that performed an action in the given calendar date."
  }

  measure: total_daily_active_users {
    type: sum
    sql: ${daily_active_users} ;;
    label: "Total DAU (Client)"
    view_label: "  * Metrics. Active Users"
  }

  ###
  ### WAU
  ###

  dimension: weekly_active_users {
    type: number
    sql: ${TABLE}.weekly_active_users ;;
    label: "WAU (Client)"
    description: "Number of unique user ids reported for the past 7 days, reported by Calls telemetry. Equals to the number of unique users that performed an action in the given date and previous 7 days."
  }

  measure: total_weekly_active_users {
    type: sum
    sql: ${weekly_active_users} ;;
    label: "Total WAU (Client)"
    view_label: "  * Metrics. Active Users"
  }

  ###
  ### MAU
  ###

  dimension: monthly_active_users {
    type: number
    sql: ${TABLE}.monthly_active_users ;;
    label: "MAU (Client)"
    description: "Number of unique users for the past 30 days, reported by Calls telemetry. Equals to the number of unique users that performed an action in the given date and previous 29 days."
  }

  measure: total_monthly_active_users {
    type: sum
    sql: ${monthly_active_users} ;;
    label: "Total MAU (Client)"
    view_label: "  * Metrics. Active Users"
  }

  ###
  ### Metadata
  ###

  measure: count {
    type: count
    label: "Server Count"
    view_label: " * Metrics: Active Calls"
  }
}
