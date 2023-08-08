view: fct_active_users {

  sql_table_name: "MART_PRODUCT"."FCT_ACTIVE_USERS" ;;
  label: "Telemetry Active Users"


  ###
  ### IDs and dates
  ###

  dimension: daily_server_id {
    type: string
    sql: ${TABLE}."DAILY_SERVER_ID" ;;
    primary_key: yes
    hidden: yes
  }

  dimension: server_id {
    type: string
    sql: ${TABLE}."SERVER_ID" ;;
    label: "Server ID"
    description: "The server's ID"
  }

  dimension_group: activity {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."ACTIVITY_DATE" ;;
    label: "Server Telemetry Activity date"
    description: "The date current data were captured at"
  }

  ###
  ### DAU
  ###

  dimension: daily_active_users {
    type: number
    sql: ${TABLE}."DAILY_ACTIVE_USERS" ;;
    label: "DAU"
    description: "Number of unique users for current date"
    view_label: "DAU"
  }

  measure: total_daily_active_users {
    type: sum
    sql: ${daily_active_users} ;;
    label: "Total DAU"
    view_label: "DAU"
  }

  dimension: daily_desktop_active_users {
    type: number
    sql: ${TABLE}."DAILY_DESKTOP_ACTIVE_USERS" ;;
    label: "Desktop/Client DAU"
    description: "DAU reported by Rudderstack telemetry."
    view_label: "DAU"
  }

  measure: total_daily_desktop_active_users {
    type: sum
    sql: ${daily_desktop_active_users} ;;
    label: "Total Desktop/Client DAU"
    view_label: "DAU"
  }

  dimension: daily_legacy_active_users {
    type: number
    sql: ${TABLE}."DAILY_LEGACY_ACTIVE_USERS" ;;
    label: "Legacy Desktop/Client DAU"
    description: "DAU reported by Segment telemetry."
    view_label: "DAU"
  }

  measure: total_daily_legacy_active_users {
    type: sum
    sql: ${daily_legacy_active_users} ;;
    label: "Total Legacy Desktop/Client DAU"
    view_label: "DAU"
  }

  dimension: daily_mobile_active_users {
    type: number
    sql: ${TABLE}."DAILY_MOBILE_ACTIVE_USERS" ;;
    label: "Mobile DAU"
    description: "DAU reported from Mobile source of Rudderstack"
    view_label: "DAU"

  }

  measure: total_daily_mobile_active_users {
    type: sum
    sql: ${daily_mobile_active_users} ;;
    label: "Total Mobile DAU"
    view_label: "DAU"
  }


  ###
  ### WAU
  ###

  dimension: weekly_active_users {
    type: number
    sql: ${TABLE}."WEEKLY_ACTIVE_USERS" ;;
    label: "WAU"
    description: "Number of unique user ids reported for the past 7 days"
    view_label: "WAU"
  }

  measure: total_weekly_active_users {
    type: sum
    sql: ${weekly_active_users} ;;
    label: "Total WAU"
    view_label: "WAU"
  }

  dimension: weekly_desktop_active_users {
    type: number
    sql: ${TABLE}."WEEKLY_DESKTOP_ACTIVE_USERS" ;;
    label: "Desktop/Client WAU"
    description: "WAU reported from Rudderstack"
    view_label: "WAU"
  }

  measure: total_weekly_desktop_active_users {
    type: sum
    sql: ${weekly_desktop_active_users} ;;
    label: "Total Desktop/Client WAU"
    view_label: "WAU"
  }

  dimension: weekly_legacy_active_users {
    type: number
    sql: ${TABLE}."WEEKLY_LEGACY_ACTIVE_USERS" ;;
    label: "Legacy Desktop/Client WAU"
    description: "WAU reported from Segment"
    view_label: "WAU"
  }

  measure: total_weekly_legacy_active_users {
    type: sum
    sql: ${weekly_legacy_active_users} ;;
    label: "Total Legacy Desktop/Client WAU"
    view_label: "WAU"
  }

  dimension: weekly_mobile_active_users {
    type: number
    sql: ${TABLE}."WEEKLY_MOBILE_ACTIVE_USERS" ;;
    label: "Mobile WAU"
    description: "WAU reported from Mobile source of Rudderstack"
    view_label: "WAU"
  }

  measure: total_weekly_mobile_active_users {
    type: sum
    sql: ${weekly_mobile_active_users} ;;
    label: "Total Mobile WAU"
    view_label: "WAU"
  }

  ###
  ### MAU
  ###

  dimension: monthly_active_users {
    type: number
    sql: ${TABLE}."MONTHLY_ACTIVE_USERS" ;;
    label: "MAU"
    description: "Number of unique users for the past 30 days"
    view_label: "MAU"
  }

  measure: total_monthly_active_users {
    type: sum
    sql: ${monthly_active_users} ;;
    label: "Total MAU"
    view_label: "MAU"
  }

  dimension: monthly_desktop_active_users {
    type: number
    sql: ${TABLE}."MONTHLY_DESKTOP_ACTIVE_USERS" ;;
    label: "Desktop/Client MAU"
    description: "MAU reported from Rudderstack"
    view_label: "MAU"
  }

  measure: total_monthly_desktop_active_users {
    type: sum
    sql: ${monthly_desktop_active_users} ;;
    label: "Total Desktop/Client MAU"
    view_label: "MAU"
  }

  dimension: monthly_legacy_active_users {
    type: number
    sql: ${TABLE}."MONTHLY_LEGACY_ACTIVE_USERS" ;;
    label: "Legacy Desktop/Client MAU"
    description: "MAU reported from Segment"
    view_label: "MAU"
  }

  measure: total_monthly_legacy_active_users {
    type: sum
    sql: ${monthly_legacy_active_users} ;;
    label: "Total Legacy Desktop/Client MAU"
    view_label: "MAU"
  }

  dimension: monthly_mobile_active_users {
    type: number
    sql: ${TABLE}."MONTHLY_MOBILE_ACTIVE_USERS" ;;
    label: "Mobile MAU"
    description: "MAU reported from Mobile source of Rudderstack"
    view_label: "MAU"
  }

  measure: total_monthly_mobile_active_users {
    type: sum
    sql: ${monthly_mobile_active_users} ;;
    label: "Total Mobile MAU"
    view_label: "MAU"
  }

}
