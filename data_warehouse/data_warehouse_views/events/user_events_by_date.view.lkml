# This is the view file for the analytics.events.user_events_by_date table.
view: user_events_by_date {
  sql_table_name: events.user_events_by_date ;;
  view_label: "User Events By Date"

  # FILTERS

  # DIMENSIONS
  dimension: server_id {
    description: ""
    type: string
    sql: ${TABLE}.server_id ;;
    hidden: no
  }

  dimension: user_id {
    description: ""
    type: string
    sql: ${TABLE}.user_id ;;
    hidden: no
  }

  dimension: user_role {
    description: ""
    type: string
    sql: ${TABLE}.user_role ;;
    hidden: no
  }

  dimension: system_admin {
    description: ""
    type: yesno
    sql: ${TABLE}.system_admin ;;
    hidden: no
  }

  dimension: system_user {
    description: ""
    type: yesno
    sql: ${TABLE}.system_user ;;
    hidden: no
  }

  dimension: event_id {
    description: ""
    type: string
    sql: ${TABLE}.event_id ;;
    hidden: no
  }

  dimension: event_name {
    description: ""
    type: string
    sql: ${TABLE}.event_name ;;
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
    type: number
    sql: ${TABLE}.desktop_events ;;
    hidden: no
  }

  dimension: web_app_events {
    description: ""
    type: number
    sql: ${TABLE}.web_app_events ;;
    hidden: no
  }

  dimension: mobile_events {
    description: ""
    type: number
    sql: ${TABLE}.mobile_events ;;
    hidden: no
  }

  dimension: browser {
    description: "The browser used to perform the event (If from mobile event logging table brwoser = device + app i.e. iPhone App."
    type: string
    sql: ${TABLE}.browser ;;
    hidden: no
  }

  dimension: browser_version {
    description: "The browser version used to perform the event."
    type: string
    sql: ${TABLE}.browser_version ;;
    hidden: no
  }

  dimension: os {
    description: "The operating system used to perform the event."
    type: string
    sql: ${TABLE}.os ;;
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


  # MEASURES
  measure: count {
    description: "Count of rows/occurrences."
    type: count
  }

  measure: server_count {
    label: " Server Count"
    description: "The distinct count of Servers  per grouping."
    type: count_distinct
    sql: ${server_id} ;;
  }

  measure: user_count {
    label: " User Count"
    description: "The distinct count of Users  per grouping."
    type: count_distinct
    sql: ${user_id} ;;
  }

  measure: event_count {
    label: " Distinct Events Triggered"
    description: "The distinct count of Events (Event Name) per grouping."
    type: count_distinct
    sql: ${event_id} ;;
  }

  measure: total_events_sum {
    description: "The sum of Total Events per grouping."
    label: " Total Events Sum"
    type: sum
    sql: ${total_events} ;;
  }

  measure: desktop_events_sum {
    description: "The sum of Desktop Events per grouping."
    group_label: "Event Sums by Application Type"
    type: sum
    sql: ${desktop_events} ;;
  }

  measure: web_app_events_sum {
    description: "The sum of Web App Events per grouping."
    group_label: "Event Sums by Application Type"
    type: sum
    sql: ${web_app_events} ;;
  }

  measure: mobile_events_sum {
    description: "The sum of Mobile Events per grouping."
    group_label: "Event Sums by Application Type"
    type: sum
    sql: ${mobile_events} ;;
  }


}
