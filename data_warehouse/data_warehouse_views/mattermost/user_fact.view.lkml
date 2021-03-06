# This is the view file for the analytics.mattermost.user_fact table.
view: user_fact {
  sql_table_name: mattermost.user_fact ;;
  view_label: "User Fact"

  # DRILL SETS

  set: user_drill1 {
    fields: [server_id, first_server_id, user_id, first_active_date, last_active_date, days_first_to_last_active, days_active, server_fact2.first_server_version_major, server_fact.server_version, servers, events_alltime, avg_events_per_day]
  }

  # FILTERS

  # DIMENSIONS
  dimension: user_id {
    description: "A user's unique identifier."
    type: string
    sql: ${TABLE}.user_id ;;
    hidden: no
  }

  dimension: server_id {
    description: "The current server ID associated with a user."
    type: string
    sql: ${TABLE}.server_id ;;
    hidden: no
  }

  dimension: first_server_id {
    description: "The first server ID associated with a user."
    type: string
    sql: ${TABLE}.first_server_id ;;
    hidden: no
  }

  dimension: servers {
    description: "The number of servers a user has been associated with during their active lifetime."
    type: number
    sql: ${TABLE}.server_count ;;
    hidden: no
  }

  dimension: account_sfid {
    description: "The Salesforce Account ID associated with a user."
    type: string
    link: {
      label: "Salesforce Account Record"
      url: "https://mattermost.lightning.force.com/lightning/r/{{ value }}/view"
      icon_url: "https://mattermost.my.salesforce.com/favicon.ico"
    }
    sql: ${TABLE}.account_sfid ;;
    hidden: no
  }

  dimension: license_id {
    description: "The license ID associated with a user."
    type: string
    sql: ${TABLE}.license_id ;;
    hidden: no
  }

  dimension: user_role {
    description: "The role of the user (Admin vs. End User)."
    type: string
    sql: CASE WHEN ${TABLE}.user_role LIKE 'system_admin%' THEN 'Admin' ELSE 'End User' END ;;
  }

  dimension: first_event_name {
    label: " 1st Event"
    group_label: " First Event Details"
    description: "The name of the 1st event performed by the user."
    type: string
    sql: ${TABLE}.first_event ;;
    hidden: no
  }

  dimension: second_event_name {
    label: " 2nd Event"
    group_label: " First Event Details"
    description: "The name of the 2nd event performed by the user."
    type: string
    sql: ${TABLE}.second_event ;;
    hidden: no
  }

  dimension: third_event_name {
    label: " 3rd Event"
    group_label: " First Event Details"
    description: "The name of the 3rd event performed by the user."
    type: string
    sql: ${TABLE}.third_event ;;
    hidden: no
  }

  dimension: fourth_event_name {
    label: " 4th Event"
    group_label: " First Event Details"
    description: "The name of the 4th event performed by the user."
    type: string
    sql: ${TABLE}.fourth_event ;;
    hidden: no
  }

  dimension: fifth_event_name {
    label: " 5th Event"
    group_label: " First Event Details"
    description: "The name of the 5th event performed by the user."
    type: string
    sql: ${TABLE}.fifth_event ;;
    hidden: no
  }

  dimension: sixth_event_name {
    label: " 6th Event"
    group_label: " First Event Details"
    description: "The name of the 6th event performed by the user."
    type: string
    sql: ${TABLE}.sixth_event ;;
    hidden: no
  }
  dimension: seventh_event_name {
    label: " 7th Event"
    group_label: " First Event Details"
    description: "The name of the 7th event performed by the user."
    type: string
    sql: ${TABLE}.seventh_event ;;
    hidden: no
  }

  dimension: eighth_event_name {
    label: " 8th Event"
    group_label: " First Event Details"
    description: "The name of the 8th event performed by the user."
    type: string
    sql: ${TABLE}.eighth_event ;;
    hidden: no
  }

  dimension: ninth_event_name {
    label: " 9th Event"
    group_label: " First Event Details"
    description: "The name of the 9th event performed by the user."
    type: string
    sql: ${TABLE}.ninth_event ;;
    hidden: no
  }

  dimension: tenth_event_name {
    label: "10th Event"
    group_label: " First Event Details"
    description: "The name of the 10th event performed by the user."
    type: string
    sql: ${TABLE}.tenth_event ;;
    hidden: no
  }

  dimension: distinct_events_performed {
    label: "Distinct Events Performed"
    group_label: " First Event Details"
    description: "The number of distinct events performed, up to 10 distinct event name, by the user"
    type: number
    sql: ${TABLE}.events_performed ;;
    hidden: no
  }

  dimension: days_first_to_last_active {
    description: "The number of days from a user's first active date to their last active date."
    type: number
    sql: ${TABLE}.days_first_to_last_active ;;
    hidden: no
  }

  dimension: days_since_first_active {
    description: "The number of days from a user's first active date (first event date) to the current date."
    type: number
    sql: DATEDIFF(DAY, ${first_active_date}, CURRENT_DATE) ;;
    hidden: no
  }

  dimension: webapp_active_days {
    description: "The number of days the user has performed >= 1 WebApp event."
    group_label: " WebApp Client Activity"
    type: number
    sql: ${TABLE}.webapp_active_days ;;
    hidden: no
  }

  dimension: desktop_active_days {
    description: "The number of days the user has performed >= 1 Desktop event."
    group_label: " Desktop Client Activity"
    type: number
    sql: ${TABLE}.desktop_active_days ;;
    hidden: no
  }

  dimension: mobile_active_days {
    description: "The number of days the user has performed >= 1 Mobile event."
    group_label: " Mobile Client Activity"
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

  dimension: days_reengaged {
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

  dimension: days_newly_disengaged {
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
    group_label: " WebApp Client Activity"
    type: number
    sql: ${TABLE}.webapp_events_alltime ;;
    hidden: no
  }

  dimension: avg_webapp_events_per_day {
    description: "The average number of WebApp events a user performed each day they performed at least 1 or more events."
    group_label: " WebApp Client Activity"
    type: number
    sql: ${TABLE}.avg_webapp_events_per_day ;;
    hidden: no
  }

  dimension: desktop_events_alltime {
    description: "The total number of Desktop events a user performed over their entire lifetime on the Mattermost platform."
    group_label: " Desktop Client Activity"
    type: number
    sql: ${TABLE}.desktop_events_alltime ;;
    hidden: no
  }

  dimension: avg_desktop_events_per_day {
    description: "The average number of Desktop events a user performed each day they performed at least 1 or more events"
    group_label: " Desktop Client Activity"
    type: number
    sql: ${TABLE}.avg_desktop_events_per_day ;;
    hidden: no
  }

  dimension: mobile_events_alltime {
    description: "The total number of Mobile events a user performed over their entire lifetime on the Mattermost platform."
    group_label: " Mobile Client Activity"
    type: number
    sql: ${TABLE}.mobile_events_alltime ;;
    hidden: no
  }

  dimension: avg_mobile_events_per_day {
    description: "The average number of Mobile events a user performed each day they performed at least 1 or more events."
    group_label: " Mobile Client Activity"
    type: number
    sql: ${TABLE}.avg_mobile_events_per_day ;;
    hidden: no
  }

  dimension: first_nps_score {
    description: "The first nps score the user has submitted via the NPS survey (same as last score if only one NPS submission ever received)."
    group_label: "NPS Info."
    type: number
    sql: ${TABLE}.first_nps_score ;;
    hidden: no
  }

  dimension: last_nps_score {
    description: "The last nps score the user has submitted via the NPS survey (same as last score if only one NPS submission ever received)."
    group_label: "NPS Info."
    type: number
    sql: ${TABLE}.last_nps_score ;;
    hidden: no
  }

  dimension: avg_nps_score {
    description: "The average NPS score receieved by the user over their entire liftetime of NPS score submissions."
    group_label: "NPS Info."
    type: number
    sql: ${TABLE}.avg_nps_score ;;
    hidden: no
  }

  dimension: nps_responses_alltime {
    description: "The total number of NPS responses received by the user over their entire lifetime of NPS score submissions."
    group_label: "NPS Info."
    type: number
    sql: ${TABLE}.nps_responses_alltime ;;
    hidden: no
  }

  dimension: all_nps_feedback {
    description: "The aggregate list of all feedback ever received by the user over their entire lifetime of NPS score submissions."
    group_label: "NPS Info."
    type: string
    sql: ${TABLE}.all_nps_feedback ;;
    hidden: no
  }

  dimension: user_age {
    label: "Days Since First Active"
    description: "The number of days between a user's created at date and the current date."
    type: number
    sql: DATEDIFF(DAY, ${first_active_date}, CURRENT_DATE - INTERVAL '1 DAY') ;;
    hidden: no
  }

  dimension: days_since_first_active_band {
    label: "Days First to Last Active"
    description: "Displays the age in days of the user (since first active) bucketed into groupings. Age is calculated as days between the first active date and logging date of the record."
    type: tier
    style: integer
    tiers: [1,7,31,61,91,181,366,731]
    sql: ${days_first_to_last_active} ;;
  }


  # DIMENSION GROUPS/DATES
  dimension_group: user_created_at {
    description: "The coalesced date representing the user created at date from NPS response data or the first event date if no NPS submissions."
    type: time
    timeframes: [date, week, month, year]
    sql: ${TABLE}.user_created_at ;;
    hidden: no
  }

  dimension_group: server_install {
    description: "The server install date. The coalesced date representing the server install date from NPS response data or the first date the server was logged in our telemetry data."
    type: time
    timeframes: [date, week, month, year]
    sql: ${TABLE}.server_install_date ;;
    hidden: no
  }

  dimension_group: first_active {
    description: "The first date a user performed an event."
    type: time
    timeframes: [date, week, month, year]
    sql: ${TABLE}.first_active_date ;;
    hidden: no
  }

  dimension_group: last_active {
    description: "The last date a user performed an event."
    type: time
    timeframes: [date, week, month, year]
    sql: ${TABLE}.last_active_date ;;
    hidden: no
  }

  dimension_group: first_webapp {
    description: "The first date a user performed a WebApp event."
    type: time
    timeframes: [date, week, month, year]
    sql: ${TABLE}.first_webapp_date ;;
    hidden: no
  }

  dimension_group: last_webapp {
    description: "The last date a user performed a WebApp event."
    type: time
    timeframes: [date, week, month, year]
    sql: ${TABLE}.last_webapp_date ;;
    hidden: no
  }

  dimension: days_first_to_last_active_webapp {
    description: "The number of days between a users first active WebApp date and last active WebApp date."
    group_label: " WebApp Client Activity"
    type: number
    sql: DATEDIFF(DAY, ${first_webapp_date}, ${last_webapp_date}) ;;
    hidden: no
  }

  dimension: days_since_first_webapp_active {
    description: "The number of days between a users first active WebApp date and the current date."
    group_label: " WebApp Client Activity"
    type: number
    sql: DATEDIFF(DAY, ${first_webapp_date}, CURRENT_DATE) ;;
    hidden: no
  }

  dimension_group: first_desktop {
    description: "The first date a user performed a Desktop event."
    type: time
    timeframes: [date, week, month, year]
    sql: ${TABLE}.first_desktop_date ;;
    hidden: no
  }

  dimension_group: last_desktop {
    description: "The last date a user performed a Desktop event."
    type: time
    timeframes: [date, week, month, year]
    sql: ${TABLE}.last_desktop_date ;;
    hidden: no
  }

  dimension: days_first_to_last_active_desktop {
    description: "The number of days between a users first active desktop date and last active desktop date."
    group_label: " Desktop Client Activity"
    type: number
    sql: DATEDIFF(DAY, ${first_desktop_date}, ${last_desktop_date}) ;;
    hidden: no
  }

  dimension: days_first_to_now_desktop {
    label: "Days Desktop First Active to Now"
    group_label: " Desktop Client Activity"
    description: "The number of days between a users first active desktop date and the current date."
    type: number
    sql: DATEDIFF(DAY, ${first_desktop_date}, CURRENT_DATE) ;;
    hidden: no
  }

  dimension_group: first_mobile {
    description: "The first date a user performed a Mobile event."
    type: time
    timeframes: [date, week, month, year]
    sql: ${TABLE}.first_mobile_date ;;
    hidden: no
  }

  dimension_group: last_mobile {
    description: "The last date a user performed a Mobile event."
    type: time
    timeframes: [date, week, month, year]
    sql: ${TABLE}.last_mobile_date ;;
    hidden: no
  }

  dimension: days_first_to_last_active_mobile {
    description: "The number of days between a users first active mobile date and last active mobile date."
    group_label: " Mobile Client Activity"
    type: number
    sql: DATEDIFF(DAY, ${first_mobile_date}, ${last_mobile_date}) ;;
    hidden: no
  }

  dimension: days_since_first_mobile_active {
    description: "The number of days since a user's first active mobile date and the current date."
    group_label: " Mobile Client Activity"
    type: number
    sql: DATEDIFF(DAY, ${first_mobile_date}, CURRENT_DATE) ;;
    hidden: no
  }

  dimension_group: first_nps {
    description: "The first date a user submitted an NPS score."
    type: time
    timeframes: [date, week, month, year]
    sql: ${TABLE}.first_nps_date ;;
    hidden: no
  }

  dimension_group: last_nps {
    description: "The last date a user submitted an NPS score."
    type: time
    timeframes: [date, week, month, year]
    sql: ${TABLE}.last_nps_date ;;
    hidden: no
  }

  dimension_group: first_nps_feedback {
    description: "The first date a user submitted NPS Feedback."
    type: time
    timeframes: [date, week, month, year]
    sql: ${TABLE}.first_nps_feedback_date ;;
    hidden: no
  }

  dimension_group: last_nps_feedback {
    description: "The last date a user submitted NPS Feedback."
    type: time
    timeframes: [date, week, month, year]
    sql: ${TABLE}.last_nps_feedback_date ;;
    hidden: no
  }


  # MEASURES
  measure: count {
    description: "Count of rows/occurrences."
    type: count
  }

  measure: user_count {
    label: "  User Count"
    group_label: " User Counts"
    description: "The distinct count of Users per grouping."
    type: count_distinct
    drill_fields: [user_drill1*]
    sql: ${user_id} ;;
  }

  measure: user_1day_active_count {
    label: " 1-Day Active User Count"
    group_label: " User Counts"
    description: "The distinct count of Users that have been active on the platform for >= 7 days per grouping (Days between first and last active >= 7)."
    type: count_distinct
    drill_fields: [user_drill1*]
    filters: [days_first_to_last_active: ">=1"]
    sql: ${user_id} ;;
  }

  measure: user_8week_active_count {
    label: " 8-Week Active User Count"
    group_label: " User Counts"
    description: "The distinct count of Users that have been active on the platform for >= 7 days per grouping (Days between first and last active >= 7)."
    type: count_distinct
    drill_fields: [user_drill1*]
    filters: [days_first_to_last_active: ">=56"]
    sql: ${user_id} ;;
  }

  measure: user_7day_active_count {
    label: " 7-Day Active User Count"
    group_label: " User Counts"
    description: "The distinct count of Users that have been active on the platform for >= 7 days per grouping (Days between first and last active >= 7)."
    type: count_distinct
    drill_fields: [user_drill1*]
    filters: [days_first_to_last_active: ">=7"]
    sql: ${user_id} ;;
  }

  measure: user_28day_active_count {
    label: " 4-Week Active User Count"
    group_label: " User Counts"
    description: "The distinct count of Users that have been active on the platform for >= 28 days per grouping (Days between first and last active >= 28)."
    type: count_distinct
    drill_fields: [user_drill1*]
    filters: [days_first_to_last_active: ">=28"]
    sql: ${user_id} ;;
  }

  measure: desktop_7day_active_user_count {
    label: "Desktop 7-Day Active User Count"
    group_label: " User Counts"
    description: "The distinct count of Users that have been active on the Mattermost Desktop Client for >= 7 distinct days."
    type: count_distinct
    drill_fields: [user_drill1*]
    filters: [days_first_to_last_active_desktop: ">=7"]
    sql: ${user_id} ;;
  }

  measure: desktop_28day_active_user_count {
    label: "Desktop 4-Week Active User Count"
    group_label: " User Counts"
    description: "The distinct count of Users that have been active on the Mattermost Desktop Client for >= 28 distinct days."
    type: count_distinct
    filters: [days_first_to_last_active_desktop: ">=28"]
    drill_fields: [user_drill1*]
    sql: ${user_id} ;;
  }

  measure: webapp_7day_active_user_count {
    label: "WebApp 7-Day Active User Count"
    group_label: " User Counts"
    description: "The distinct count of Users that have been active on the Mattermost WebApp Client for >= 7 distinct days."
    type: count_distinct
    filters: [days_first_to_last_active_webapp: ">=7"]
    drill_fields: [user_drill1*]
    sql: ${user_id} ;;
  }

  measure: webapp_28day_active_user_count {
    label: "WebApp 4-Week Active User Count"
    group_label: " User Counts"
    description: "The distinct count of Users that have been active on the Mattermost WebApp Client for >= 28 distinct days."
    type: count_distinct
    filters: [days_first_to_last_active_webapp: ">=28"]
    drill_fields: [user_drill1*]
    sql: ${user_id} ;;
  }

  measure: mobile_7day_active_user_count {
    label: "Mobile 7-Day Active User Count"
    group_label: " User Counts"
    description: "The distinct count of Users that have been active on the Mattermost Mobile Client for >= 7 distinct days."
    type: count_distinct
    filters: [days_first_to_last_active_mobile: ">=7"]
    sql: ${user_id} ;;
  }

  measure: mobile_28day_active_user_count {
    label: "Mobile 4-Week Active User Count"
    group_label: " User Counts"
    description: "The distinct count of Users that have been active on the Mattermost Mobile Client for >= 28 distinct days."
    type: count_distinct
    filters: [days_first_to_last_active_mobile: ">=28"]
    drill_fields: [user_drill1*]
    sql: ${user_id} ;;
  }

  measure: server_count {
    label: " Server Count"
    description: "The distinct count of Servers per grouping."
    type: count_distinct
    drill_fields: [user_drill1*]
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
    sql: ${days_reengaged} ;;
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
    sql: ${days_newly_disengaged} ;;
  }

  measure: avg_events_per_day_avg {
    label: "Avg. Events per Day"
    group_label: "Events Per Day"
    description: "The Avg Total Events Performed by Users Per Day Per Grouping."
    type: average
    value_format_name: decimal_1
    drill_fields: [user_drill1*]
    sql: ${avg_events_per_day} ;;
  }

  measure: avg_events_per_day_median {
    label: "Median Events per Day"
    group_label: "Events Per Day"
    description: "The Median Total Events Performed by Users Per Day Per Grouping."
    type: median
    value_format_name: decimal_1
    drill_fields: [user_drill1*]
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
    group_label: "WebApp Events Per Day"
    description: "The Avg Webapp Events Performed by Users Per Day Per Grouping."
    type: average
    value_format_name: decimal_1
    drill_fields: [user_drill1*]
    sql: ${avg_webapp_events_per_day} ;;
  }

  measure: avg_webapp_events_per_day_median {
    label: "Median WebApp Events per Day"
    group_label: "WebApp Events Per Day"
    description: "The Median Webapp Events Performed by Users Per Day Per Grouping."
    type: median
    value_format_name: decimal_1
    drill_fields: [user_drill1*]
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
    group_label: "Desktop Events Per Day"
    description: "The Avg Desktop Events Performed by Users Per Day Per Grouping."
    type: average
    value_format_name: decimal_1
    drill_fields: [user_drill1*]
    sql: ${avg_desktop_events_per_day} ;;
  }

  measure: avg_desktop_events_per_day_median {
    label: "Median Desktop Events per Day"
    group_label: "Desktop Events Per Day"
    description: "The Median Desktop Events Performed by Users Per Day Per Grouping."
    type: median
    value_format_name: decimal_1
    drill_fields: [user_drill1*]
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
    group_label: "Mobile Events Per Day"
    description: "The Avg Mobile Events Per Day per grouping."
    type: average
    value_format_name: decimal_1
    drill_fields: [user_drill1*]
    sql: ${avg_mobile_events_per_day} ;;
  }

  measure: avg_mobile_events_per_day_median {
    label: "Median Mobile Events per Day"
    group_label: "Mobile Events Per Day"
    description: "The Median Mobile Events Performed by Users Per Day Per Grouping."
    type: median
    value_format_name: decimal_1
    drill_fields: [user_drill1*]
    sql: ${avg_mobile_events_per_day} ;;
  }

  measure: avg_days_first_to_last_active {
    label: "Avg. Days First to Last Active"
    description: "The average number of days between a user's first active date to their last active date."
    type: average
    value_format_name: decimal_1
    drill_fields: [user_drill1*]
    sql: ${days_first_to_last_active} ;;
  }

  measure: days_active_sum {
    label: "Days Active (Sum)"
    description: "The sum of days where users performed >= 1 event per grouping."
    type: sum
    value_format_name: decimal_0
    sql: ${days_active} ;;
  }

  measure: days_inactive_sum {
    label: "Days Inactive (Sum)"
    description: "The sum of days where users performed 0 events per grouping."
    type: sum
    value_format_name: decimal_0
    sql: ${days_inactive} ;;
  }

  measure: days_first_to_last_active_sum {
    label: "Days First to Last Active (Sum)"
    description: "The sum of days from a users first active date to their last active date per grouping."
    type: sum
    value_format_name: decimal_0
    sql: ${days_first_to_last_active} ;;
    hidden: yes
  }

  measure: days_first_active_to_now_sum {
    label: "Days First to Now (Sum)"
    description: "The sum of days where from a users first active date to now per grouping."
    type: sum
    value_format_name: decimal_0
    sql: ${days_since_first_active} ;;
    hidden: no
  }

  measure: pct_days_active {
    label: "Active Days %"
    description: "The percent of total days (first active to now) that a user performed >= 1 event per grouping."
    type: number
    value_format: "0.0\%"
    drill_fields: [user_drill1*]
    sql: (${days_active_sum}/nullif(${days_first_active_to_now_sum},0))*100.0 ;;
  }

  measure: pct_days_inactive {
    label: "Inactive Days %"
    description: "The percent of total days (first active to now) that a user did not perform an event per grouping."
    type: number
    value_format: "0.0\%"
    drill_fields: [user_drill1*]
    sql: (${days_inactive_sum}/nullif(${days_first_active_to_now_sum},0))*100.0 ;;
  }

  measure: days_active_to_inactive_ratio {
    label: "Active:Inactive Days Ratio"
    description: "The ratio of days a user is active to days a user is inactive."
    type: number
    value_format_name: decimal_2
    drill_fields: [user_drill1*]
    sql: (${days_active_sum}/nullif(${days_inactive_sum},0)) ;;
  }

  measure: avg_events_performed {
    label: "Avg. Distinct Events Performed"
    type: number
    value_format_name: decimal_1
    drill_fields: [user_drill1*]
    sql: avg(${distinct_events_performed}) ;;
  }

  measure: median_events_performed {
    label: "Median Distinct Events Performed"
    type: number
    value_format_name: decimal_1
    drill_fields: [user_drill1*]
    sql: median(${distinct_events_performed}) ;;
  }


}
