view: fct_active_users {

  sql_table_name: "MART_PRODUCT"."FCT_ACTIVE_USERS" ;;
  label: "   * Users: Telemetry Active Users"


  ###
  ### IDs and dates
  ###

  dimension: daily_server_id {
    type: string
    sql: ${TABLE}.daily_server_id ;;
    primary_key: yes
    hidden: yes
  }

  dimension: server_id {
    type: string
    sql: ${TABLE}.server_id ;;
    label: "Server ID"
    description: "The server's ID"
  }

  dimension_group: activity {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.activity_date ;;
    label: "Server Telemetry Activity" # Remember that `Date` is automatically appended by looker
    description: "The date current data were captured at"
  }


  dimension: version_id {
    type: string
    sql: ${TABLE}.version_id ;;
    label: "Version ID"
    description: "The server's version for the specific date"
    hidden: yes
  }

  ###
  ### DAU
  ###

  dimension: daily_active_users {
    type: number
    sql: ${TABLE}.daily_active_users ;;
    label: "DAU (Client)"
    description: "Number of unique users for current date, reported by client telemetry. Equals to the number of unique users that performed an action in the given calendar date."
  }

  measure: total_daily_active_users {
    type: sum
    sql: ${daily_active_users} ;;
    label: "Total DAU (Client)"
    view_label: "  * Metrics. DAU"
  }

  dimension: server_daily_active_users {
    type: number
    sql: ${TABLE}.server_daily_active_users ;;
    label: "DAU (Server)"
    description: "DAU reported by MM server activity. Defined as the number of unique users that performed an action in the 24 hours previous to sending the telemetry data."
  }

  measure: total_server_daily_active_users {
    type: sum
    sql: ${server_daily_active_users} ;;
    label: "Total DAU (Server)"
    view_label: "  * Metrics. DAU"
  }

  dimension: daily_desktop_active_users {
    type: number
    sql: ${TABLE}.daily_desktop_active_users ;;
    label: "Desktop/Client DAU"
    description: "DAU reported by Rudderstack telemetry."
  }

  measure: total_daily_desktop_active_users {
    type: sum
    sql: ${daily_desktop_active_users} ;;
    label: "Total Desktop/Client DAU"
    view_label: "  * Metrics. DAU"
  }

  dimension: daily_legacy_active_users {
    type: number
    sql: ${TABLE}.daily_legacy_active_users ;;
    label: "Legacy Desktop/Client DAU"
    description: "DAU reported by Segment telemetry."
  }

  measure: total_daily_legacy_active_users {
    type: sum
    sql: ${daily_legacy_active_users} ;;
    label: "Total Legacy Desktop/Client DAU"
    view_label: "  * Metrics. DAU"
  }


  ###
  ### WAU
  ###

  dimension: weekly_active_users {
    type: number
    sql: ${TABLE}.weekly_active_users ;;
    label: "WAU (Client)"
    description: "Number of unique user ids reported for the past 7 days"
  }

  measure: total_weekly_active_users {
    type: sum
    sql: ${weekly_active_users} ;;
    label: "Total WAU (Client)"
    view_label: "  * Metrics. WAU"
  }

  dimension: weekly_desktop_active_users {
    type: number
    sql: ${TABLE}.weekly_desktop_active_users ;;
    label: "Desktop/Client WAU"
    description: "WAU reported from Rudderstack"
  }

  measure: total_weekly_desktop_active_users {
    type: sum
    sql: ${weekly_desktop_active_users} ;;
    label: "Total Desktop/Client WAU"
    view_label: "  * Metrics. WAU"
  }

  dimension: weekly_legacy_active_users {
    type: number
    sql: ${TABLE}.weekly_legacy_active_users ;;
    label: "Legacy Desktop/Client WAU"
    description: "WAU reported from Segment"
  }

  measure: total_weekly_legacy_active_users {
    type: sum
    sql: ${weekly_legacy_active_users} ;;
    label: "Total Legacy Desktop/Client WAU"
    view_label: "  * Metrics. WAU"
  }

  ###
  ### MAU
  ###

  dimension: monthly_active_users {
    type: number
    sql: ${TABLE}.monthly_active_users ;;
    label: "MAU (Client)"
    description: "Number of unique users for the past 30 days, reported by client telemetry. Equals to the number of unique users that performed an action in the given date and previous 29 days."
  }

  measure: total_monthly_active_users {
    type: sum
    sql: ${monthly_active_users} ;;
    label: "Total MAU (Client)"
    view_label: "  * Metrics. MAU"
  }

  dimension: server_monthly_active_users {
    type: number
    sql: ${TABLE}.server_monthly_active_users ;;
    label: "MAU (Server)"
    description: "MAU reported by MM server activity. Defined as the number of unique users that performed an action in the 31 days previous to sending the telemetry data."
  }

  measure: total_server_monthly_active_users {
    type: sum
    sql: ${server_monthly_active_users} ;;
    label: "Total MAU (Server)"
    view_label: "  * Metrics. MAU"
  }

  dimension: monthly_desktop_active_users {
    type: number
    sql: ${TABLE}.monthly_desktop_active_users ;;
    label: "Desktop/Client MAU"
    description: "MAU reported from Rudderstack"
  }

  measure: total_monthly_desktop_active_users {
    type: sum
    sql: ${monthly_desktop_active_users} ;;
    label: "Total Desktop/Client MAU"
    view_label: "  * Metrics. MAU"
  }

  dimension: monthly_legacy_active_users {
    type: number
    sql: ${TABLE}.monthly_legacy_active_users ;;
    label: "Legacy Desktop/Client MAU"
    description: "MAU reported from Segment"
  }

  measure: total_monthly_legacy_active_users {
    type: sum
    sql: ${monthly_legacy_active_users} ;;
    label: "Total Legacy Desktop/Client MAU"
    view_label: "  * Metrics. MAU"
  }

  ###
  ### Other server metrics
  ###

  dimension: count_registered_users {
    type: number
    sql: ${TABLE}.count_registered_users ;;
    label: "Registered users"
    description: "Total number of registered users. Includes deleted users."
  }

  measure: total_count_registered_users {
    type: sum
    sql: ${count_registered_users} ;;
    label: "Total Registered Users"
    view_label: " * Metrics. Registered Users"
  }

  dimension: count_registered_deactivated_users {
    type: number
    sql: ${TABLE}.count_registered_deactivated_users ;;
    label: "Deactivated Users"
    description: "Total number of inactive (deleted) users."
  }

  measure: total_count_registered_deactivated_users {
    type: sum
    sql: ${count_registered_deactivated_users} ;;
    label: "Total Deactivated Users"
    view_label: " * Metrics. Registered Users"
  }

  dimension: count_registered_active_users {
    type: number
    sql: ${TABLE}.count_registered_users - ${TABLE}.count_registered_deactivated_users;;
    label: "Active Registered Users"
    description: "Total number of active registered users. Does not include deleted users."
  }

  measure: total_count_registered_active_users {
    type: sum
    sql: ${count_registered_active_users} ;;
    label: "Total Active Registered Users"
    view_label: " * Metrics. Registered Users"
  }


  measure: count_distinct_servers {
    type: count_distinct
    sql: ${server_id} ;;
    label: "Total Unique Servers"
    view_label: " * Metrics: Server"
  }
}
