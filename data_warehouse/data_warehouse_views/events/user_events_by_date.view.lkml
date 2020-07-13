# This is the view file for the analytics.events.user_events_by_date table.
view: user_events_by_date {
  sql_table_name: events.user_events_by_date ;;
  view_label: " User Events By Date"

  # DRILL SETS
  set: event_name_drill {
    fields: [logging_date, event_name, os, server_count, user_count, total_events_sum]
  }

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

  dimension: user_age_at_event {
    type: number
    value_format_name: decimal_0
    sql: datediff(days,  ${user_fact.first_active_date}, ${TABLE}.min_timestamp) ;;
  }

  dimension: user_agent {
    view_label: "User Agent Details"
    description: "The User Agent string denoting the browser, os, and device of the user when performing the event."
    type: string
    sql: ${TABLE}.context_user_agent ;;
  }

  dimension: desktop_client_version{
    view_label: "User Agent Details"
    description: "The Mattermost Desktop Client Version used to perform the event."
    type: string
    sql: REGEXP_SUBSTR(SPLIT_PART(SPLIT_PART(${TABLE}.context_user_agent, 'Mattermost/', 2), ' ', 1), '^[0-9]{1,2}.[0-9]{1,2}') ;;
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
    view_label: "User Agent Details"
    description: "The browser used to perform the event (If from mobile event logging table brwoser = device + app i.e. iPhone App."
    type: string
    sql: COALESCE(nullif(${user_agent_registry.browser}, 'Other'), ${TABLE}.browser) ;;
    hidden: no
  }

  dimension: browser_version {
    view_label: "User Agent Details"
    description: "The browser version used to perform the event."
    type: string
    sql: COALESCE(nullif(${user_agent_registry.browser_version}, 'Other'), ${TABLE}.browser_version) ;;
    hidden: no
  }

  dimension: os {
    view_label: "User Agent Details"
    description: "The operating system used to perform the event."
    type: string
    sql: COALESCE(nullif(${user_agent_registry.operating_system}, 'Other'), CASE WHEN ${TABLE}.os = 'iPhone' THEN 'iOS' ELSE ${TABLE}.os END) ;;
    hidden: no
  }

  dimension: os_version {
    view_label: "User Agent Details"
    description: "The operating system version used to perform the event."
    type: string
    sql: COALESCE(nullif(${user_agent_registry.os_version}, 'Other'), ${TABLE}.os_version) ;;
    hidden: no
  }

  dimension: os_and_version {
    view_label: "User Agent Details"
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
    view_label: "User Agent Details"
    label: "OS + Browser"
    description: "The OS + Browser concatenated for visualization purposes."
    type: string
    sql: ${os} || ' ' || ${browser} ;;
    hidden: no
  }

  dimension: os_browser_version {
    view_label: "User Agent Details"
    label: "OS + Browser + Browser Version"
    description: "The OS + Browser + Version concatenated for visualization purposes."
    type: string
    sql: ${os} || ' ' || ${browser} || ' ' || ${browser_version} ;;
    hidden: no
  }

  dimension: chronological_sequence {
    description: "Integer value representing the chronological order this event was performed among all events performed during a users lifetime."
    type: number
    sql: ${TABLE}.chronological_sequence ;;
    hidden: no
  }

  dimension: seconds_after_prev_event {
    label: "Seconds Since Last Event"
    description: "Integer value representing the number of seconds between the current event and the previously performed event."
    type: number
    sql: ${TABLE}.seconds_after_prev_event ;;
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
    drill_fields: [event_name_drill*]
  }

  measure: user_count {
    label: " User Count"
    description: "The distinct count of Users  per grouping."
    type: count_distinct
    sql: ${user_id} ;;
    drill_fields: [event_name_drill*]
  }

  measure: mobile_dau {
    label: " Mobile User Count"
    description: "The distinct count of Users  per grouping."
    type: count_distinct
    filters: [mobile_events: ">0"]
    sql: ${user_id} ;;
    drill_fields: [event_name_drill*]
  }

  measure: webapp_dau {
    label: " WebApp User Count"
    description: "The distinct count of Users  per grouping."
    type: count_distinct
    filters: [web_app_events: ">0"]
    sql: ${user_id} ;;
    drill_fields: [event_name_drill*]
  }

  measure: desktop_dau {
    label: " Desktop User Count"
    description: "The distinct count of Users  per grouping."
    type: count_distinct
    filters: [desktop_events: ">0"]
    sql: ${user_id} ;;
    drill_fields: [event_name_drill*]
  }

  measure: event_count {
    label: " Distinct Events Triggered"
    description: "The distinct count of Events (Event Name) per grouping."
    type: count_distinct
    sql: ${event_id} ;;
    drill_fields: [event_name_drill*]
  }

  measure: total_events_sum {
    description: "The sum of Total Events per grouping."
    label: " Total Events Sum"
    type: sum
    sql: ${total_events} ;;
    drill_fields: [event_name_drill*]
  }

  measure: desktop_events_sum {
    description: "The sum of Desktop Events per grouping."
    group_label: "Event Sums by Application Type"
    type: sum
    sql: ${desktop_events} ;;
    drill_fields: [event_name_drill*]
  }

  measure: web_app_events_sum {
    description: "The sum of Web App Events per grouping."
    group_label: "Event Sums by Application Type"
    type: sum
    sql: ${web_app_events} ;;
    drill_fields: [event_name_drill*]
  }

  measure: mobile_events_sum {
    description: "The sum of Mobile Events per grouping."
    group_label: "Event Sums by Application Type"
    type: sum
    sql: ${mobile_events} ;;
    drill_fields: [event_name_drill*]
  }

  measure: seconds_since_last_event_med {
    label: "Median Seconds Since Last Event"
    description: "The median 'seconds since last event' across the grouped dimensions."
    group_label: "Seconds Since Last Event"
    type: median
    value_format_name: decimal_1

    sql: ${seconds_after_prev_event} ;;
  }

  measure: seconds_since_last_event_avg {
    label: "Avg. Seconds Since Last Event"
    description: "The average 'seconds since last event' across the grouped dimensions."
    group_label: "Seconds Since Last Event"
    type: average
    value_format_name: decimal_1
    sql: ${seconds_after_prev_event} ;;
  }


}
