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

  dimension: event_client {
    description: "The Mattermost Application client that was used to perform the event (Desktop, Mobile, or Web App)."
    type: string
    sql: ${TABLE}.event_type ;;
    hidden: no
  }

  dimension: user_role {
    description: "The role of the user, if logged (system_user, system admin, or null)."
    type: string
    sql: ${TABLE}.user_role ;;
    hidden: no
  }

  dimension: system_admin {
    description: "Boolean indicating the user performing the event is a system admin (system_admin)."
    type: yesno
    sql: ${TABLE}.system_admin ;;
    hidden: no
  }

  dimension: system_user {
    description: "Boolean indicating the user perfoming the event is an end user (system_user)."
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
    description: "The name of the event performed by the user."
    type: string
    sql: ${TABLE}.event_name ;;
    hidden: no
  }

  dimension: total_events {
    label: " Total Events"
    description: "The total number of events performed by a specific user on a given date."
    group_label: "Event Dimensions"
    type: number
    sql: ${TABLE}.total_events ;;
    hidden: no
  }

  dimension: desktop_events {
    description: "The total number of Desktop events performed by a specific user on a given date."
    group_label: "Event Dimensions"
    type: number
    sql: ${TABLE}.desktop_events ;;
    hidden: no
  }

  dimension: web_app_events {
    description: "The total number of Web App events performed by a specific user on a given date."
    group_label: "Event Dimensions"
    type: number
    sql: ${TABLE}.web_app_events ;;
    hidden: no
  }

  dimension: mobile_events {
    description: "The total number of Mobile events performed by a specific user on a given date."
    group_label: "Event Dimensions"
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

  dimension: os_version {
    description: "The operating system version used to perform the event."
    type: string
    sql: ${TABLE}.os_version ;;
    hidden: no
  }

  dimension: os_and_version {
    label: "OS + OS Version"
    description: "The operating system and operating system version used to perform the event."
    type: string
    sql: ${os} || ' ' || ${os_version} ;;
    hidden: no
  }

  dimension: licensed_server {
    description: "Indicates whether the server associated with the user performing the event has been provisioned a license."
    type: yesno
    sql: CASE WHEN ${server_daily_details.license_id} IS NOT NULL THEN true ELSE false end  ;;
    hidden: no
  }

  dimension: os_and_browser {
    label: "OS + Browser"
    description: "The OS + Browser concatenated for visualization purposes."
    type: string
    sql: ${os} || ' ' || ${browser} ;;
    hidden: no
  }

  dimension: os_browser_version {
    label: "OS + Browser + Browser Version"
    description: "The OS + Browser + Version concatenated for visualization purposes."
    type: string
    sql: ${os} || ' ' || ${browser} || ' ' || ${browser_version} ;;
    hidden: no
  }


  # DIMENSION GROUPS/DATES
  dimension_group: logging {
    description: "The logging date that each event was performed."
    type: time
    timeframes: [date, week, month, year]
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
    label: " User Count (DAU)"
    description: "The distinct count of Users  per grouping."
    type: count_distinct
    sql: ${user_id} ;;
  }

  measure: mobile_dau {
    label: " Mobile DAU"
    description: "The distinct count of Users  per grouping."
    type: count_distinct
    filters: [mobile_events: ">0"]
    sql: ${user_id} ;;
  }

  measure: webapp_dau {
    label: " WebApp DAU"
    description: "The distinct count of Users  per grouping."
    type: count_distinct
    filters: [web_app_events: ">0"]
    sql: ${user_id} ;;
  }

  measure: desktop_dau {
    label: " Desktop DAU"
    description: "The distinct count of Users  per grouping."
    type: count_distinct
    filters: [desktop_events: ">0"]
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
