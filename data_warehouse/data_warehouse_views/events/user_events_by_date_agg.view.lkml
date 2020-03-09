# This is the view file for the analytics.events.user_events_by_date_agg table.
view: user_events_by_date_agg {
  sql_table_name: events.user_events_by_date_agg ;;
  view_label: "User Events By Date Agg"

  # FILTERS

  # DIMENSIONS
  dimension: user_id {
    description: ""
    type: string
    sql: ${TABLE}.user_id ;;
    hidden: no
  }

  dimension: server_id {
    description: ""
    type: string
    sql: ${TABLE}.server_id ;;
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

  dimension: active {
    description: ""
    type: yesno
    sql: ${TABLE}.active ;;
    hidden: no
  }

  dimension: total_events {
    label: " Total Events"
    group_label: "Events"
    description: "The total # of Events performed by the user on the record date."
    type: number
    sql: ${TABLE}.total_events ;;
    hidden: no
  }

  dimension: desktop_events {
    description: "The total # of Desktop App Events performed by the user on the record date."
    group_label: "Events by App Type"
    type: number
    sql: ${TABLE}.desktop_events ;;
    hidden: no
  }

  dimension: web_app_events {
    description: "The total # of Web App Events performed by the user on the record date."
    group_label: "Events by App Type"
    type: number
    sql: ${TABLE}.web_app_events ;;
    hidden: no
  }

  dimension: mobile_events {
    description: "The total # of Mobile App Events performed by the user on the record date."
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

  dimension: mau_segment {
    description: ""
    type: string
    sql: ${TABLE}.mau_segment ;;
    hidden: no
  }

  dimension: mau {
    description: ""
    type: yesno
    sql: ${TABLE}.mau ;;
    hidden: no
  }

  dimension: events_last_30_days {
    description: "The total # of Events performed by the user in the last 30 days."
    group_label: "Events"
    type: number
    sql: ${TABLE}.events_last_30_days ;;
    hidden: no
  }

  dimension: events_last_31_days {
    description: "The total # of Events performed by the user in the last 31 days."
    group_label: "Events"
    type: number
    sql: ${TABLE}.events_last_31_days ;;
    hidden: yes
  }

  dimension: events_alltime {
    label: "Events (All Time)"
    description: "The total # of Events performed by the user their entire lifetime (on or before the current record date)."
    group_label: "Events"
    type: number
    sql: ${TABLE}.events_alltime ;;
    hidden: no
  }

  dimension: max_events {
    label: "Max Events"
    description: "The maximum number of events performed by the user in a single day (on or before the current record date)."
    group_label: "Events"
    type: number
    sql: ${TABLE}.max_events ;;
    hidden: no
  }

  dimension: mobile_events_last_30_days {
    description: "The total # of Mobile Events performed by the user in the last 30 days."
    group_label: "Events"
    type: number
    sql: ${TABLE}.mobile_events_last_30_days ;;
    hidden: no
  }

  dimension: mobile_events_alltime {
    description: "The total # of Mobile Events performed by the user their entire lifetime (on or before the current record date)."
    group_label: "Events"
    type: number
    sql: ${TABLE}.mobile_events_alltime ;;
    hidden: no
  }

  dimension: max_mobile_events {
    description: "The maximum number of Mobile Events performed by the user in a single day (on or before the current record date)."
    group_label: "Events"
    type: number
    sql: ${TABLE}.max_mobile_events ;;
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

  measure: user_count {
    label: " User Count"
    description: "The distinct count of Users per grouping."
    type: count_distinct
    sql: ${user_id} ;;
  }

  measure: server_count {
    label: " Server Count"
    description: "The distinct count of Servers per grouping."
    type: count_distinct
    sql: ${server_id} ;;
  }

  measure: system_user_count {
    label: "System Users"
    description: "The count of System Users."
    group_label: "User Counts"
    type: count_distinct
    sql: case when ${system_user} then ${user_id} else null end ;;
  }

  measure: system_admin_count {
    label: "System Admins"
    description: "The count of System Admins."
    group_label: "User Counts"
    type: count_distinct
    sql: case when ${system_admin} then ${user_id} else null end ;;
  }

  measure: active_count {
    label: " Total DAU"
    description: "The count of all daily active users i.e. performed >= 1 event on the current record date."
    group_label: " DAU"
    type: count_distinct
    sql: case when ${active} then ${user_id} else null end ;;
  }

  measure: active_admin_count {
    label: "System Admin DAU"
    description: "The count of all daily active system admin users (role) i.e. performed >= 1 event on the current record date."
    group_label: " DAU"
    type: count_distinct
    sql: case when ${active} and ${system_admin} then ${user_id} else null end ;;
  }

  measure: active_user_count {
    label: "System User DAU"
    description: "The count of all daily active system users (role) i.e. performed >= 1 event on the current record date."
    group_label: " DAU"
    type: count_distinct
    sql: case when ${active} and ${system_user} then ${user_id} else null end ;;
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

  measure: mau_count {
    label: " Total MAU"
    description: "The count of users in MAU i.e. performed >= 1 event in the last 30 days."
    group_label: " MAU"
    type: count_distinct
    sql: case when ${mau} then ${user_id} else null end ;;
  }

  measure: first_time_mau {
    label: "First Time MAU"
    description: "The count of users that entered MAU for the first time on the record date."
    group_label: " MAU"
    type: count_distinct
    sql: case when ${mau} and ${mau_segment} = 'First Time MAU' then ${user_id} else null end ;;
  }

  measure: reengaged_mau {
    label: "Reengaged MAU"
    description: "The count of users that were previously disengaged (Previous Day MAU Segment = Disengaged) and reengaged (performed >= 1 event) on the record date."
    group_label: " MAU"
    type: count_distinct
    sql: case when ${mau} and ${mau_segment} = 'Reengaged MAU' then ${user_id} else null end ;;
  }

  measure: current_mau {
    label: "Current MAU"
    description: "The count of users that are currently in MAU and that are not First Time Active or Reengaged MAU (performed >= 1 event in the last 30 days)."
    group_label: " MAU"
    type: count_distinct
    sql: case when ${mau} and ${mau_segment} = 'First Time MAU' then ${user_id} else null end ;;
  }

  measure: max_events_max {
    description: "The max of Max Events per grouping."
    group_label: "Events (Max)"
    type: max
    sql: ${max_events} ;;
  }

  measure: mobile_events_last_30_days_sum {
    description: "The sum of Mobile Events Last 30 Days per grouping."
    group_label: "Events Last 30 Days (Sums)"
    type: sum
    sql: ${mobile_events_last_30_days} ;;
  }

  measure: mobile_events_alltime_sum {
    description: "The sum of Mobile Events Alltime per grouping."
    group_label: "Event All Time (Sums)"
    type: sum
    sql: ${mobile_events_alltime} ;;
  }

  measure: max_mobile_events_max {
    description: "The max of Max Mobile Events per grouping."
    group_label: "Events (Max)"
    type: max
    sql: ${max_mobile_events} ;;
  }

  measure: mobile_dau {
    label: "Mobile DAU"
    description: "The count of all user that performed >= 1 mobile event on the record date."
    group_label: " DAU"
    filters: {
      field: mobile_events
      value: "> 0"
    }
    type: count_distinct
    sql: ${user_id} ;;
  }


}
