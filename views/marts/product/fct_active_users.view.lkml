view: fct_active_users {

  sql_table_name: "mart_product"."fct_active_users" ;;
  label: "Telemetry Active Users"


  ###
  ### IDs and dates
  ###

  dimension: daily_server_id {
    type: string
    sql: ${TABLE}."daily_server_id" ;;
    primary_key: yes
    hidden: yes
  }

  dimension: server_id {
    type: string
    sql: ${TABLE}."server_id" ;;
    label: "Server ID"
    description: "The server's ID"
  }

  dimension_group: activity {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."activity_date" ;;
    label: "Server Telemetry Activity" # Remember that `Date` is automatically appended by looker
    description: "The date current data were captured at"
  }

  ###
  ### DAU
  ###

  dimension: daily_active_users {
    type: number
    sql: ${TABLE}."daily_active_users" ;;
    label: "DAU"
    description: "Number of unique users for current date"
    view_label: "1. DAU"
  }

  measure: total_daily_active_users {
    type: sum
    sql: ${daily_active_users} ;;
    label: "Total DAU"
    view_label: "1. DAU"
  }

  dimension: daily_desktop_active_users {
    type: number
    sql: ${TABLE}."daily_desktop_active_users" ;;
    label: "Desktop/Client DAU"
    description: "DAU reported by Rudderstack telemetry."
    view_label: "1. DAU"
  }

  measure: total_daily_desktop_active_users {
    type: sum
    sql: ${daily_desktop_active_users} ;;
    label: "Total Desktop/Client DAU"
    view_label: "1. DAU"
  }

  dimension: daily_legacy_active_users {
    type: number
    sql: ${TABLE}."daily_legacy_active_users" ;;
    label: "Legacy Desktop/Client DAU"
    description: "DAU reported by Segment telemetry."
    view_label: "1. DAU"
  }

  measure: total_daily_legacy_active_users {
    type: sum
    sql: ${daily_legacy_active_users} ;;
    label: "Total Legacy Desktop/Client DAU"
    view_label: "1. DAU"
  }

  dimension: daily_mobile_active_users {
    type: number
    sql: ${TABLE}."daily_mobile_active_users" ;;
    label: "Mobile DAU"
    description: "DAU reported from Mobile source of Rudderstack"
    view_label: "1. DAU"
  }

  measure: total_daily_mobile_active_users {
    type: sum
    sql: ${daily_mobile_active_users} ;;
    label: "Total Mobile DAU"
    view_label: "1. DAU"
  }


  ###
  ### WAU
  ###

  dimension: weekly_active_users {
    type: number
    sql: ${TABLE}."weekly_active_users" ;;
    label: "WAU"
    description: "Number of unique user ids reported for the past 7 days"
    view_label: "2. WAU"
  }

  measure: total_weekly_active_users {
    type: sum
    sql: ${weekly_active_users} ;;
    label: "Total WAU"
    view_label: "2. WAU"
  }

  dimension: weekly_desktop_active_users {
    type: number
    sql: ${TABLE}."weekly_desktop_active_users" ;;
    label: "Desktop/Client WAU"
    description: "WAU reported from Rudderstack"
    view_label: "2. WAU"
  }

  measure: total_weekly_desktop_active_users {
    type: sum
    sql: ${weekly_desktop_active_users} ;;
    label: "Total Desktop/Client WAU"
    view_label: "2. WAU"
  }

  dimension: weekly_legacy_active_users {
    type: number
    sql: ${TABLE}."weekly_legacy_active_users" ;;
    label: "Legacy Desktop/Client WAU"
    description: "WAU reported from Segment"
    view_label: "2. WAU"
  }

  measure: total_weekly_legacy_active_users {
    type: sum
    sql: ${weekly_legacy_active_users} ;;
    label: "Total Legacy Desktop/Client WAU"
    view_label: "2. WAU"
  }

  dimension: weekly_mobile_active_users {
    type: number
    sql: ${TABLE}."weekly_mobile_active_users" ;;
    label: "Mobile WAU"
    description: "WAU reported from Mobile source of Rudderstack"
    view_label: "2. WAU"
  }

  measure: total_weekly_mobile_active_users {
    type: sum
    sql: ${weekly_mobile_active_users} ;;
    label: "Total Mobile WAU"
    view_label: "2. WAU"
  }

  ###
  ### MAU
  ###

  dimension: monthly_active_users {
    type: number
    sql: ${TABLE}."monthly_active_users" ;;
    label: "MAU"
    description: "Number of unique users for the past 30 days"
    view_label: "3. MAU"
  }

  measure: total_monthly_active_users {
    type: sum
    sql: ${monthly_active_users} ;;
    label: "Total MAU"
    view_label: "3. MAU"
  }

  dimension: monthly_desktop_active_users {
    type: number
    sql: ${TABLE}."monthly_desktop_active_users" ;;
    label: "Desktop/Client MAU"
    description: "MAU reported from Rudderstack"
    view_label: "3. MAU"
  }

  measure: total_monthly_desktop_active_users {
    type: sum
    sql: ${monthly_desktop_active_users} ;;
    label: "Total Desktop/Client MAU"
    view_label: "3. MAU"
  }

  dimension: monthly_legacy_active_users {
    type: number
    sql: ${TABLE}."monthly_legacy_active_users" ;;
    label: "Legacy Desktop/Client MAU"
    description: "MAU reported from Segment"
    view_label: "3. MAU"
  }

  measure: total_monthly_legacy_active_users {
    type: sum
    sql: ${monthly_legacy_active_users} ;;
    label: "Total Legacy Desktop/Client MAU"
    view_label: "3. MAU"
  }

  dimension: monthly_mobile_active_users {
    type: number
    sql: ${TABLE}."monthly_mobile_active_users" ;;
    label: "Mobile MAU"
    description: "MAU reported from Mobile source of Rudderstack"
    view_label: "3. MAU"
  }

  measure: total_monthly_mobile_active_users {
    type: sum
    sql: ${monthly_mobile_active_users} ;;
    label: "Total Mobile MAU"
    view_label: "3. MAU"
  }

}
