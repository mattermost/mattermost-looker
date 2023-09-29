view: fct_board_activity {
  label: "   * Server: Boards Telemetry"
  sql_table_name: "MART_PRODUCT"."FCT_BOARD_ACTIVITY" ;;

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
    description: "The date current Board data were captured at"
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
    description: "Number of unique users for current date, reported by Boards client telemetry. Equals to the number of unique users that performed an action in the given calendar date."
  }

  measure: total_daily_active_users {
    type: sum
    sql: ${daily_active_users} ;;
    label: "Total DAU (Client)"
    view_label: "  * Metrics. Active Users"
  }

  dimension: server_daily_active_users {
    type: number
    sql: ${TABLE}.server_daily_active_users ;;
    label: "DAU (Server)"
    description: "DAU reported by Boards server activity. Defined as the number of unique users that performed an action in the 24 hours previous to sending the telemetry data."
  }

  measure: total_server_daily_active_users {
    type: sum
    sql: ${server_daily_active_users} ;;
    label: "Total DAU (Server)"
    view_label: "  * Metrics. Active Users"
  }

  ###
  ### WAU
  ###

  dimension: weekly_active_users {
    type: number
    sql: ${TABLE}.weekly_active_users ;;
    label: "WAU (Client)"
    description: "Number of unique user ids reported for the past 7 days, reported by Boards client telemetry. Equals to the number of unique users that performed an action in the given date and previous 7 days."
  }

  measure: total_weekly_active_users {
    type: sum
    sql: ${weekly_active_users} ;;
    label: "Total WAU (Client)"
    view_label: "  * Metrics. Active Users"
  }

  dimension: server_weekly_active_users {
    type: number
    sql: ${TABLE}.server_weekly_active_users ;;
    label: "WAU (Server)"
    description: "WAU reported by Boards server activity. Defined as the number of unique users that performed an action in the 24 hours previous to sending the telemetry data."
  }

  measure: total_server_weekly_active_users {
    type: sum
    sql: ${server_weekly_active_users} ;;
    label: "Total WAU (Server)"
    view_label: "  * Metrics. Active Users"
  }

  ###
  ### MAU
  ###

  dimension: monthly_active_users {
    type: number
    sql: ${TABLE}.monthly_active_users ;;
    label: "MAU (Client)"
    description: "Number of unique users for the past 30 days, reported by Boards client telemetry. Equals to the number of unique users that performed an action in the given date and previous 29 days."
  }

  measure: total_monthly_active_users {
    type: sum
    sql: ${monthly_active_users} ;;
    label: "Total MAU (Client)"
    view_label: "  * Metrics. Active Users"
  }

  dimension: server_monthly_active_users {
    type: number
    sql: ${TABLE}.server_monthly_active_users ;;
    label: "MAU (Server)"
    description: "MAU reported by Boards server activity. Defined as the number of unique users that performed an action in the 30 days previous to sending the telemetry data."
  }

  measure: total_server_monthly_active_users {
    type: sum
    sql: ${server_monthly_active_users} ;;
    label: "Total MAU (Server)"
    view_label: "  * Metrics. Active Users"
  }


  ###
  ### Other server metrics
  ###

  dimension: count_registered_users {
    type: number
    sql: ${TABLE}.count_registered_users ;;
    label: "Registered users"
    description: "Total number of registered users on the Boards servers. Excludes deleted users."
  }

  measure: total_count_registered_users {
    type: sum
    sql: ${count_registered_users} ;;
    label: "Total Board Registered Users"
    view_label: " * Metrics. Registered Users"
  }

  ###
  ### Metadata
  ###


  dimension: has_client_data {
    type: yesno
    sql: ${TABLE}.has_client_data ;;
    label: "Has client data?"
    description: "Whether Boards telemetry data were reported from any client at the current date."
    view_label: "Metadata: Data Source Info"
  }


  dimension: has_server_data {
    type: yesno
    sql: ${TABLE}.has_server_data ;;
    label: "Has server data?"
    description: "Whether Boards telemetry data were reported from Boards server at the current date."
    view_label: "Metadata: Data Source Info"
  }


  measure: count {
    type: count
    label: "Server Count"
    view_label: " * Metrics: Active Boards"
  }
}
