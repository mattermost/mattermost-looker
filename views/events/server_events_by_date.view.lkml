# This is the view file for the analytics.events.server_events_by_date table.
view: server_events_by_date {
  sql_table_name: events.server_events_by_date ;;
  view_label: "Server Events By Date"

  # FILTERS

  # DIMENSIONS
  dimension: server_id {
    description: "" 
    type: string
    sql: ${TABLE}.server_id ;;
    hidden: no
  }

  dimension: id {
    description: "" 
    type: string
    sql: ${TABLE}.id ;;
    hidden: no
  }

  dimension: dau_total {
    description: "" 
    type: number
    sql: ${TABLE}.dau_total ;;
    hidden: no
  }

  dimension: mobile_dau {
    description: "" 
    type: number
    sql: ${TABLE}.mobile_dau ;;
    hidden: no
  }

  dimension: system_admin_dau {
    description: "" 
    type: number
    sql: ${TABLE}.system_admin_dau ;;
    hidden: no
  }

  dimension: mau_total {
    description: "" 
    type: number
    sql: ${TABLE}.mau_total ;;
    hidden: no
  }

  dimension: first_time_mau {
    description: "" 
    type: number
    sql: ${TABLE}.first_time_mau ;;
    hidden: no
  }

  dimension: reengaged_mau {
    description: "" 
    type: number
    sql: ${TABLE}.reengaged_mau ;;
    hidden: no
  }

  dimension: current_mau {
    description: "" 
    type: number
    sql: ${TABLE}.current_mau ;;
    hidden: no
  }

  dimension: system_admin_mau {
    description: "" 
    type: number
    sql: ${TABLE}.system_admin_mau ;;
    hidden: no
  }

  dimension: total_events {
    description: "" 
    type: number
    sql: ${TABLE}.total_events ;;
    hidden: no
  }

  dimension: desktop_events {
    description: "" 
    group_label: "Events by App Type"
    type: number
    sql: ${TABLE}.desktop_events ;;
    hidden: no
  }

  dimension: web_app_events {
    description: "" 
    group_label: "Events by App Type"
    type: number
    sql: ${TABLE}.web_app_events ;;
    hidden: no
  }

  dimension: mobile_events {
    description: "" 
    group_label: "Events by App Type"
    type: number
    sql: ${TABLE}.mobile_events ;;
    hidden: no
  }

  dimension: action_events {
    description: "" 
    group_label: "Events by Event Categories"
    type: number
    sql: ${TABLE}.action_events ;;
    hidden: no
  }

  dimension: api_events {
    description: "" 
    group_label: "Events by Event Categories"
    type: number
    sql: ${TABLE}.api_events ;;
    hidden: no
  }

  dimension: gfycat_events {
    description: "" 
    group_label: "Events by Event Categories"
    type: number
    sql: ${TABLE}.gfycat_events ;;
    hidden: no
  }

  dimension: performance_events {
    description: "" 
    group_label: "Events by Event Categories"
    type: number
    sql: ${TABLE}.performance_events ;;
    hidden: no
  }

  dimension: plugins_events {
    description: "" 
    group_label: "Events by Event Categories"
    type: number
    sql: ${TABLE}.plugins_events ;;
    hidden: no
  }

  dimension: settings_events {
    description: "" 
    group_label: "Events by Event Categories"
    type: number
    sql: ${TABLE}.settings_events ;;
    hidden: no
  }

  dimension: signup_events {
    description: "" 
    group_label: "Events by Event Categories"
    type: number
    sql: ${TABLE}.signup_events ;;
    hidden: no
  }

  dimension: system_console_events {
    description: "" 
    group_label: "Events by Event Categories"
    type: number
    sql: ${TABLE}.system_console_events ;;
    hidden: no
  }

  dimension: tutorial_events {
    description: "" 
    group_label: "Events by Event Categories"
    type: number
    sql: ${TABLE}.tutorial_events ;;
    hidden: no
  }

  dimension: ui_events {
    description: "" 
    group_label: "Events by Event Categories"
    type: number
    sql: ${TABLE}.ui_events ;;
    hidden: no
  }

  dimension: events_last_30_days {
    description: "" 
    type: number
    sql: ${TABLE}.events_last_30_days ;;
    hidden: no
  }

  dimension: events_last_31_days {
    description: "" 
    type: number
    sql: ${TABLE}.events_last_31_days ;;
    hidden: no
  }

  dimension: events_alltime {
    description: "" 
    type: number
    sql: ${TABLE}.events_alltime ;;
    hidden: no
  }

  dimension: mobile_events_last_30_days {
    description: "" 
    type: number
    sql: ${TABLE}.mobile_events_last_30_days ;;
    hidden: no
  }

  dimension: mobile_events_alltime {
    description: "" 
    type: number
    sql: ${TABLE}.mobile_events_alltime ;;
    hidden: no
  }

  dimension: users {
    description: "" 
    type: number
    sql: ${TABLE}.users ;;
    hidden: no
  }

  dimension: post_events {
    description: "" 
    type: number
    sql: ${TABLE}.post_events ;;
    hidden: no
  }

  
  # DIMENSION GROUPS/DATES
  dimension_group: logging {
    description: "" 
    type: time
    timeframes: [date, month, year]
    sql: ${TABLE}.date ;;
    hidden: no
  }

  dimension_group: first_active {
    description: "" 
    type: time
    timeframes: [date, month, year]
    sql: ${TABLE}.first_active_date ;;
    hidden: no
  }

  dimension_group: last_active {
    description: "" 
    type: time
    timeframes: [date, month, year]
    sql: ${TABLE}.last_active_date ;;
    hidden: no
  }

  
  # MEASURES
  measure: count {
    description: "Count of rows/occurrences."
    type: count
  }

  measure: server_count {
    label: " Server Count"
    description: "The distinct count of Servers per grouping."
    type: count_distinct
    sql: ${server_id} ;;
  }

  measure: dau_total_sum {
    description: "The sum of Dau Total per grouping."
    type: sum
    sql: ${dau_total} ;;
  }

  measure: mobile_dau_sum {
    description: "The sum of Mobile Dau per grouping."
    type: sum
    sql: ${mobile_dau} ;;
  }

  measure: system_admin_dau_sum {
    description: "The sum of System Admin Dau per grouping."
    type: sum
    sql: ${system_admin_dau} ;;
  }

  measure: mau_total_sum {
    description: "The sum of Mau Total per grouping."
    type: sum
    sql: ${mau_total} ;;
  }

  measure: first_time_mau_sum {
    description: "The sum of First Time Mau per grouping."
    type: sum
    sql: ${first_time_mau} ;;
  }

  measure: reengaged_mau_sum {
    description: "The sum of Reengaged Mau per grouping."
    type: sum
    sql: ${reengaged_mau} ;;
  }

  measure: current_mau_sum {
    description: "The sum of Current Mau per grouping."
    type: sum
    sql: ${current_mau} ;;
  }

  measure: system_admin_mau_sum {
    description: "The sum of System Admin Mau per grouping."
    type: sum
    sql: ${system_admin_mau} ;;
  }

  measure: total_events_sum {
    description: "The sum of Total Events per grouping."
    label: " Total Events Sum"
    type: sum
    sql: ${total_events} ;;
  }

  measure: desktop_events_sum {
    description: "The sum of Desktop Events per grouping."
    group_label: "Event Sums by App Type"
    type: sum
    sql: ${desktop_events} ;;
  }

  measure: web_app_events_sum {
    description: "The sum of Web App Events per grouping."
    group_label: "Event Sums by App Type"
    type: sum
    sql: ${web_app_events} ;;
  }

  measure: mobile_events_sum {
    description: "The sum of Mobile Events per grouping."
    group_label: "Event Sums by App Type"
    type: sum
    sql: ${mobile_events} ;;
  }

  measure: action_events_sum {
    description: "The sum of Action Events per grouping."
    group_label: "Event Sums by Event Categories"
    type: sum
    sql: ${action_events} ;;
  }

  measure: api_events_sum {
    description: "The sum of Api Events per grouping."
    group_label: "Event Sums by Event Categories"
    type: sum
    sql: ${api_events} ;;
  }

  measure: gfycat_events_sum {
    description: "The sum of Gfycat Events per grouping."
    group_label: "Event Sums by Event Categories"
    type: sum
    sql: ${gfycat_events} ;;
  }

  measure: performance_events_sum {
    description: "The sum of Performance Events per grouping."
    group_label: "Event Sums by Event Categories"
    type: sum
    sql: ${performance_events} ;;
  }

  measure: plugins_events_sum {
    description: "The sum of Plugins Events per grouping."
    group_label: "Event Sums by Event Categories"
    type: sum
    sql: ${plugins_events} ;;
  }

  measure: settings_events_sum {
    description: "The sum of Settings Events per grouping."
    group_label: "Event Sums by Event Categories"
    type: sum
    sql: ${settings_events} ;;
  }

  measure: signup_events_sum {
    description: "The sum of Signup Events per grouping."
    group_label: "Event Sums by Event Categories"
    type: sum
    sql: ${signup_events} ;;
  }

  measure: system_console_events_sum {
    description: "The sum of System Console Events per grouping."
    group_label: "Event Sums by Event Categories"
    type: sum
    sql: ${system_console_events} ;;
  }

  measure: tutorial_events_sum {
    description: "The sum of Tutorial Events per grouping."
    group_label: "Event Sums by Event Categories"
    type: sum
    sql: ${tutorial_events} ;;
  }

  measure: ui_events_sum {
    description: "The sum of Ui Events per grouping."
    group_label: "Event Sums by Event Categories"
    type: sum
    sql: ${ui_events} ;;
  }

  measure: mobile_events_last_30_days_sum {
    description: "The sum of Mobile Events Last 30 Days per grouping."
    type: sum
    sql: ${mobile_events_last_30_days} ;;
  }

  measure: mobile_events_alltime_sum {
    description: "The sum of Mobile Events Alltime per grouping."
    type: sum
    sql: ${mobile_events_alltime} ;;
  }

  measure: users_sum {
    description: "The sum of Users per grouping."
    type: sum
    sql: ${users} ;;
  }

  measure: post_events_sum {
    description: "The sum of Post Events per grouping."
    type: sum
    sql: ${post_events} ;;
  }


}