# This is the view file for the analytics.mattermost.user_fact table.
view: user_fact {
  sql_table_name: mattermost.user_fact ;;
  view_label: "User Fact"

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

  dimension: account_sfid {
    description: "" 
    type: string
    sql: ${TABLE}.account_sfid ;;
    hidden: no
  }

  dimension: license_id {
    description: "" 
    type: string
    sql: ${TABLE}.license_id ;;
    hidden: no
  }

  dimension: days_first_to_last_active {
    description: "" 
    type: number
    sql: ${TABLE}.days_first_to_last_active ;;
    hidden: no
  }

  dimension: days_in_mau {
    description: "" 
    type: number
    sql: ${TABLE}.days_in_mau ;;
    hidden: no
  }

  dimension: reengaged_count {
    description: "" 
    type: number
    sql: ${TABLE}.reengaged_count ;;
    hidden: no
  }

  dimension: days_not_in_mau {
    description: "" 
    type: number
    sql: ${TABLE}.days_not_in_mau ;;
    hidden: no
  }

  dimension: disengaged_count {
    description: "" 
    type: number
    sql: ${TABLE}.disengaged_count ;;
    hidden: no
  }

  dimension: events_alltime {
    description: "" 
    type: number
    sql: ${TABLE}.events_alltime ;;
    hidden: no
  }

  dimension: avg_events_per_day {
    description: "" 
    type: number
    sql: ${TABLE}.avg_events_per_day ;;
    hidden: no
  }

  dimension: webapp_events_alltime {
    description: "" 
    type: number
    sql: ${TABLE}.webapp_events_alltime ;;
    hidden: no
  }

  dimension: avg_webapp_events_per_day {
    description: "" 
    type: number
    sql: ${TABLE}.avg_webapp_events_per_day ;;
    hidden: no
  }

  dimension: desktop_events_alltime {
    description: "" 
    type: number
    sql: ${TABLE}.desktop_events_alltime ;;
    hidden: no
  }

  dimension: avg_desktop_events_per_day {
    description: "" 
    type: number
    sql: ${TABLE}.avg_desktop_events_per_day ;;
    hidden: no
  }

  dimension: mobile_events_alltime {
    description: "" 
    type: number
    sql: ${TABLE}.mobile_events_alltime ;;
    hidden: no
  }

  dimension: avg_mobile_events_per_day {
    description: "" 
    type: number
    sql: ${TABLE}.avg_mobile_events_per_day ;;
    hidden: no
  }

  dimension: first_nps_score {
    description: "" 
    type: number
    sql: ${TABLE}.first_nps_score ;;
    hidden: no
  }

  dimension: last_nps_score {
    description: "" 
    type: number
    sql: ${TABLE}.last_nps_score ;;
    hidden: no
  }

  dimension: avg_nps_score {
    description: "" 
    type: number
    sql: ${TABLE}.avg_nps_score ;;
    hidden: no
  }

  dimension: nps_responses_alltime {
    description: "" 
    type: number
    sql: ${TABLE}.nps_responses_alltime ;;
    hidden: no
  }

  dimension: all_nps_feedback {
    description: "" 
    type: string
    sql: ${TABLE}.all_nps_feedback ;;
    hidden: no
  }

  
  # DIMENSION GROUPS/DATES
  dimension_group: user_created_at {
    description: "" 
    type: time
    timeframes: [date, month, year]
    sql: ${TABLE}.user_created_at ;;
    hidden: no
  }

  dimension_group: server_install {
    description: "" 
    type: time
    timeframes: [date, month, year]
    sql: ${TABLE}.server_install_date ;;
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

  dimension_group: first_webapp {
    description: "" 
    type: time
    timeframes: [date, month, year]
    sql: ${TABLE}.first_webapp_date ;;
    hidden: no
  }

  dimension_group: first_desktop {
    description: "" 
    type: time
    timeframes: [date, month, year]
    sql: ${TABLE}.first_desktop_date ;;
    hidden: no
  }

  dimension_group: first_mobile {
    description: "" 
    type: time
    timeframes: [date, month, year]
    sql: ${TABLE}.first_mobile_date ;;
    hidden: no
  }

  dimension_group: first_nps {
    description: "" 
    type: time
    timeframes: [date, month, year]
    sql: ${TABLE}.first_nps_date ;;
    hidden: no
  }

  dimension_group: last_nps {
    description: "" 
    type: time
    timeframes: [date, month, year]
    sql: ${TABLE}.last_nps_date ;;
    hidden: no
  }

  dimension_group: first_nps_feedback {
    description: "" 
    type: time
    timeframes: [date, month, year]
    sql: ${TABLE}.first_nps_feedback_date ;;
    hidden: no
  }

  dimension_group: last_nps_feedback {
    description: "" 
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

  measure: days_in_mau_sum {
    description: "The sum of Days In Mau per grouping."
    type: sum
    sql: ${days_in_mau} ;;
  }

  measure: reengaged_count_sum {
    description: "The sum of Reengaged Count per grouping."
    type: sum
    sql: ${reengaged_count} ;;
  }

  measure: days_not_in_mau_sum {
    description: "The sum of Days Not In Mau per grouping."
    type: sum
    sql: ${days_not_in_mau} ;;
  }

  measure: disengaged_count_sum {
    description: "The sum of Disengaged Count per grouping."
    type: sum
    sql: ${disengaged_count} ;;
  }

  measure: avg_events_per_day_sum {
    description: "The sum of Avg Events Per Day per grouping."
    type: sum
    sql: ${avg_events_per_day} ;;
  }

  measure: webapp_events_alltime_sum {
    description: "The sum of Webapp Events Alltime per grouping."
    type: sum
    sql: ${webapp_events_alltime} ;;
  }

  measure: avg_webapp_events_per_day_sum {
    description: "The sum of Avg Webapp Events Per Day per grouping."
    type: sum
    sql: ${avg_webapp_events_per_day} ;;
  }

  measure: desktop_events_alltime_sum {
    description: "The sum of Desktop Events Alltime per grouping."
    type: sum
    sql: ${desktop_events_alltime} ;;
  }

  measure: avg_desktop_events_per_day_sum {
    description: "The sum of Avg Desktop Events Per Day per grouping."
    type: sum
    sql: ${avg_desktop_events_per_day} ;;
  }

  measure: mobile_events_alltime_sum {
    description: "The sum of Mobile Events Alltime per grouping."
    type: sum
    sql: ${mobile_events_alltime} ;;
  }

  measure: avg_mobile_events_per_day_sum {
    description: "The sum of Avg Mobile Events Per Day per grouping."
    type: sum
    sql: ${avg_mobile_events_per_day} ;;
  }


}