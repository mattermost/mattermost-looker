# This is the view file for the analytics.mattermost.user_fact table.
view: user_fact {
  sql_table_name: mattermost.user_fact ;;
  view_label: "User Fact"

  # FILTERS

  # DIMENSIONS
  dimension: user_id {
    description: "A user's unique identifier."
    type: string
    sql: ${TABLE}.user_id ;;
    hidden: no
  }

  dimension: server_id {
    description: "The server ID associated with a user."
    type: string
    sql: ${TABLE}.server_id ;;
    hidden: no
  }

  dimension: account_sfid {
    description: "The Salesforce Account ID associated with a user."
    type: string
    sql: ${TABLE}.account_sfid ;;
    hidden: no
  }

  dimension: license_id {
    description: "The license ID associated with a user."
    type: string
    sql: ${TABLE}.license_id ;;
    hidden: no
  }

  dimension: days_first_to_last_active {
    description: "The number of days from a user's first active date to their last active date."
    type: number
    sql: ${TABLE}.days_first_to_last_active ;;
    hidden: no
  }

  dimension: webapp_active_days {
    description: "The number of days the user has performed >= 1 WebApp event."
    type: number
    sql: ${TABLE}.webapp_active_days ;;
    hidden: no
  }

  dimension: desktop_active_days {
    description: "The number of days the user has performed >= 1 Desktop event."
    type: number
    sql: ${TABLE}.desktop_active_days ;;
    hidden: no
  }

  dimension: mobile_active_days {
    description: "The number of days the user has performed >= 1 Mobile event."
    type: number
    sql: ${TABLE}.mobile_active_days ;;
    hidden: no
  }

  dimension: days_in_mau {
    description: "The number of days a user has fallen into any of the active MAU segments ie was in MAU."
    type: number
    sql: ${TABLE}.days_in_mau ;;
    hidden: no
  }

  dimension: reengaged_count {
    description: "The number of times (days) a user has reengaged on the Mattermost platform after > 30 days of inactivity."
    type: number
    sql: ${TABLE}.reengaged_count ;;
    hidden: no
  }

  dimension: days_not_in_mau {
    description: "The number of days a user has become inactive and fallen out of the active MAU segments ie disengaged or newly disengaged."
    type: number
    sql: ${TABLE}.days_not_in_mau ;;
    hidden: no
  }

  dimension: disengaged_count {
    description: "The number of time (days) a user has disengaged on the Mattermost platform after having been a part of MAU."
    type: number
    sql: ${TABLE}.disengaged_count ;;
    hidden: no
  }

  dimension: days_active {
    description: "The number of days a user performed >= 1 event."
    type: number
    sql: ${TABLE}.days_active ;;
    hidden: no
  }

  dimension: days_inactive {
    description: "The number of days a user performed 0 events."
    type: number
    sql: ${TABLE}.days_inactive ;;
    hidden: no
  }

  dimension: events_alltime {
    description: "The total number of events on the Mattermost Platform that a user has performed over their entire lifetime."
    type: number
    sql: ${TABLE}.events_alltime ;;
    hidden: no
  }

  dimension: avg_events_per_day {
    description: "The average number of event a user performed each day they performed at least 1 or more events."
    type: number
    sql: ${TABLE}.avg_events_per_day ;;
    hidden: no
  }

  dimension: webapp_events_alltime {
    description: "The totoal number of WebApp events a user performed over their entire lifetime."
    type: number
    sql: ${TABLE}.webapp_events_alltime ;;
    hidden: no
  }

  dimension: avg_webapp_events_per_day {
    description: "The average number of WebApp events a user performed each day they performed at least 1 or more events."
    type: number
    sql: ${TABLE}.avg_webapp_events_per_day ;;
    hidden: no
  }

  dimension: desktop_events_alltime {
    description: "The total number of Desktop events a user performed over their entire lifetime on the Mattermost platform."
    type: number
    sql: ${TABLE}.desktop_events_alltime ;;
    hidden: no
  }

  dimension: avg_desktop_events_per_day {
    description: "The average number of Desktop events a user performed each day they performed at least 1 or more events"
    type: number
    sql: ${TABLE}.avg_desktop_events_per_day ;;
    hidden: no
  }

  dimension: mobile_events_alltime {
    description: "The total number of Mobile events a user performed over their entire lifetime on the Mattermost platform."
    type: number
    sql: ${TABLE}.mobile_events_alltime ;;
    hidden: no
  }

  dimension: avg_mobile_events_per_day {
    description: "The average number of Mobile events a user performed each day they performed at least 1 or more events."
    type: number
    sql: ${TABLE}.avg_mobile_events_per_day ;;
    hidden: no
  }

  dimension: first_nps_score {
    description: "The first nps score the user has submitted via the NPS survey (same as last score if only one NPS submission ever received)."
    type: number
    sql: ${TABLE}.first_nps_score ;;
    hidden: no
  }

  dimension: last_nps_score {
    description: "The last nps score the user has submitted via the NPS survey (same as last score if only one NPS submission ever received)."
    type: number
    sql: ${TABLE}.last_nps_score ;;
    hidden: no
  }

  dimension: avg_nps_score {
    description: "The average NPS score receieved by the user over their entire liftetime of NPS score submissions."
    type: number
    sql: ${TABLE}.avg_nps_score ;;
    hidden: no
  }

  dimension: nps_responses_alltime {
    description: "The total number of NPS responses received by the user over their entire lifetime of NPS score submissions."
    type: number
    sql: ${TABLE}.nps_responses_alltime ;;
    hidden: no
  }

  dimension: all_nps_feedback {
    description: "The aggregate list of all feedback ever received by the user over their entire lifetime of NPS score submissions."
    type: string
    sql: ${TABLE}.all_nps_feedback ;;
    hidden: no
  }


  # DIMENSION GROUPS/DATES
  dimension_group: user_created_at {
    description: "The coalesced date representing the user created at date from NPS response data or the first event date if no NPS submissions."
    type: time
    timeframes: [date, month, year]
    sql: ${TABLE}.user_created_at ;;
    hidden: no
  }

  dimension_group: server_install {
    description: "The server install date. The coalesced date representing the server install date from NPS response data or the first date the server was logged in our telemetry data."
    type: time
    timeframes: [date, month, year]
    sql: ${TABLE}.server_install_date ;;
    hidden: no
  }

  dimension_group: first_active {
    description: "The first date a user performed an event."
    type: time
    timeframes: [date, month, year]
    sql: ${TABLE}.first_active_date ;;
    hidden: no
  }

  dimension_group: last_active {
    description: "The last date a user performed an event."
    type: time
    timeframes: [date, month, year]
    sql: ${TABLE}.last_active_date ;;
    hidden: no
  }

  dimension_group: first_webapp {
    description: "The first date a user performed a WebApp event."
    type: time
    timeframes: [date, month, year]
    sql: ${TABLE}.first_webapp_date ;;
    hidden: no
  }

  dimension_group: last_webapp {
    description: "The last date a user performed a WebApp event."
    type: time
    timeframes: [date, month, year]
    sql: ${TABLE}.lastt_webapp_date ;;
    hidden: no
  }

  dimension_group: first_desktop {
    description: "The first date a user performed a Desktop event."
    type: time
    timeframes: [date, month, year]
    sql: ${TABLE}.first_desktop_date ;;
    hidden: no
  }

  dimension_group: last_desktop {
    description: "The last date a user performed a Desktop event."
    type: time
    timeframes: [date, month, year]
    sql: ${TABLE}.last_desktop_date ;;
    hidden: no
  }

  dimension_group: first_mobile {
    description: "The first date a user performed a Mobile event."
    type: time
    timeframes: [date, month, year]
    sql: ${TABLE}.first_mobile_date ;;
    hidden: no
  }

  dimension_group: last_mobile {
    description: "The last date a user performed a Mobile event."
    type: time
    timeframes: [date, month, year]
    sql: ${TABLE}.last_mobile_date ;;
    hidden: no
  }

  dimension_group: first_nps {
    description: "The first date a user submitted an NPS score."
    type: time
    timeframes: [date, month, year]
    sql: ${TABLE}.first_nps_date ;;
    hidden: no
  }

  dimension_group: last_nps {
    description: "The last date a user submitted an NPS score."
    type: time
    timeframes: [date, month, year]
    sql: ${TABLE}.last_nps_date ;;
    hidden: no
  }

  dimension_group: first_nps_feedback {
    description: "The first date a user submitted NPS Feedback."
    type: time
    timeframes: [date, month, year]
    sql: ${TABLE}.first_nps_feedback_date ;;
    hidden: no
  }

  dimension_group: last_nps_feedback {
    description: "The last date a user submitted NPS Feedback."
    type: time
    timeframes: [date, month, year]
    sql: ${TABLE}.last_nps_feedback_date ;;
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

  measure: license_count {
    label: " License Count"
    description: "The distinct count of Licenses per grouping."
    type: count_distinct
    sql: ${license_id} ;;
  }

  measure: days_in_mau_avg {
    label: "Avg. Days in MAU"
    description: "The average number of days that all user[s] (per grouping) were in Mau."
    type: average
    value_format_name: decimal_1
    sql: ${days_in_mau} ;;
  }

  measure: days_in_mau_sum {
    label: "Days In MAU (Sum)"
    description: "The sum of the number of days that all user[s] (per grouping) were in Mau."
    type: sum
    sql: ${days_in_mau} ;;
  }

  measure: reengaged_count_sum {
    label: "Avg. Reengagement Count"
    description: "The average number of days that all user[s] (per grouping) 'Reengaged' in MAU i.e. number of times users have reengaged on the platform after 30 days."
    type: average
    value_format_name: decimal_1
    sql: ${reengaged_count} ;;
  }

  measure: days_not_in_mau_avg {
    label: "Avg. Days Not In MAU"
    description: "The average number of days that all user[s] (per grouping) did not fall into Mau."
    type: average
    value_format_name: decimal_1
    sql: ${days_not_in_mau} ;;
  }

  measure: days_not_in_mau_sum {
    label: "Days Not In MAU (Sum)"
    description: "The sum of the number of days that all user[s] (per grouping) did not fall into Mau."
    type: sum
    sql: ${days_not_in_mau} ;;
  }

  measure: disengaged_count_sum {
    label: "Avg. Disengagement Count"
    description: "The average number of days that user[s] has 'Disengaged' ('Newly Disengaged' MAU Segment) per grouping."
    type: average
    value_format_name: decimal_1
    sql: ${disengaged_count} ;;
  }

  measure: avg_events_per_day_avg {
    label: "Avg. Events per Day"
    description: "The Avg Total Events Per Day per grouping."
    type: average
    value_format_name: decimal_1
    sql: ${avg_events_per_day} ;;
  }

  measure: webapp_events_alltime_sum {
    label: "WebApp Events (Sum)"
    description: "The sum of Webapp Events per grouping."
    type: sum
    sql: ${webapp_events_alltime} ;;
  }

  measure: avg_webapp_events_per_day_avg {
    label: "Avg. WebApp Events per Day"
    description: "The Avg Webapp Events Per Day per grouping."
    type: average
    value_format_name: decimal_1
    sql: ${avg_webapp_events_per_day} ;;
  }

  measure: desktop_events_alltime_sum {
    label: "Desktop Events (Sum)"
    description: "The sum of Desktop Events per grouping."
    type: sum
    sql: ${desktop_events_alltime} ;;
  }

  measure: avg_desktop_events_per_day_avg {
    label: "Avg. Desktop Events per Day"
    description: "The Avg Desktop Events Per Day per grouping."
    type: average
    value_format_name: decimal_1
    sql: ${avg_desktop_events_per_day} ;;
  }

  measure: mobile_events_alltime_sum {
    label: "Mobile Events (Sum)"
    description: "The sum of Mobile Events across per per grouping."
    type: sum
    sql: ${mobile_events_alltime} ;;
  }

  measure: avg_mobile_events_per_day_avg {
    label: "Avg. Mobile Events per Day"
    description: "The Avg Mobile Events Per Day per grouping."
    type: average
    value_format_name: decimal_1
    sql: ${avg_mobile_events_per_day} ;;
  }

  measure: avg_days_first_to_last_active {
    label: "Avg. Days First to Last Active"
    description: "The average number of days between a user's first active date to their last active date."
    type: average
    value_format_name: decimal_1
    sql: ${days_first_to_last_active} ;;
  }


}
