# This is the view file for the analytics.mattermost.nps_user_monthly_score table.
view: nps_user_monthly_score {
  sql_table_name: mattermost.nps_user_monthly_score ;;
  view_label: "Nps User Monthly Score"

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

  dimension: server_version {
    description: ""
    type: string
    sql: ${TABLE}.server_version ;;
    hidden: no
  }

  dimension: score {
    description: ""
    type: number
    sql: ${TABLE}.score ;;
    hidden: no
  }

  dimension: license_id {
    description: ""
    type: string
    sql: ${TABLE}.license_id ;;
    hidden: no
  }

  dimension: license_sku {
    description: ""
    type: string
    sql: ${TABLE}.license_sku ;;
    hidden: no
  }

  dimension: promoter_type {
    description: ""
    type: string
    sql: ${TABLE}.promoter_type ;;
    hidden: no
  }

  dimension: feedback {
    description: ""
    type: string
    sql: ${TABLE}.feedback ;;
    hidden: no
  }

  dimension: id {
    description: ""
    type: string
    sql: ${TABLE}.id ;;
    hidden: no
  }


  # DIMENSION GROUPS/DATES
  dimension_group: month {
    label: "NPS Logging"
    description: ""
    type: time
    timeframes: [date, month, year]
    sql: ${TABLE}.month ;;
    hidden: no
  }

  dimension_group: score_submission_date {
    description: ""
    type: time
    timeframes: [date, month, year]
    sql: ${TABLE}.score_submission_date ;;
    hidden: no
  }

  dimension_group: user_created_at {
    description: ""
    type: time
    timeframes: [date, month, year]
    sql: ${TABLE}.user_created_at ;;
    hidden: no
  }

  dimension_group: server_install_date {
    description: ""
    type: time
    timeframes: [date, month, year]
    sql: ${TABLE}.server_install_date ;;
    hidden: no
  }

  dimension_group: feedback_submission_date {
    description: ""
    type: time
    timeframes: [date, month, year]
    sql: ${TABLE}.feedback_submission_date ;;
    hidden: no
  }

  dimension: responses {
    description: "NPS responses sent by the user in the record month."
    type: string
    sql: ${TABLE}.responses ;;
  }

  dimension: responses_alltime {
    label: "Responses (All Time)"
    description: "All NPS responses sent by the user in or before the record month."
    type: string
    sql: ${TABLE}.responses_alltime ;;
  }


  # MEASURES
  measure: count {
    description: "Count of rows/occurrences."
    type: count
  }

  measure: count_servers {
    group_label: "Servers"
    description: "The distinct count of Server Id's per grouping."
    type: count_distinct
    sql: ${server_id} ;;
  }

  measure: count_users {
    group_label: "Users"
    description: "The distinct count of User Id's per grouping."
    type: count_distinct
    sql: ${user_id} ;;
  }

  measure: count_promoters {
    group_label: "Users"
    filters: {
      field: promoter_type
      value: "Promoter"
    }
    type: count_distinct
    sql: ${user_id} ;;
  }

  measure: count_detractors {
    group_label: "Users"
    filters: {
      field: promoter_type
      value: "Detractor"
    }
    type: count_distinct
    sql: ${user_id} ;;
  }

  measure: count_passive {
    group_label: "Users"
    filters: {
      field: promoter_type
      value: "Passive"
    }
    type: count_distinct
    sql: ${user_id} ;;
  }

  measure: pct_promoter_score {
    group_label: "Percents"
    type: number
    value_format: "@{percent}"
    sql: ${count_promoters}::float/${count_users}::float ;;
  }

  measure: pct_detractor_score {
    group_label: "Percents"
    type: number
    value_format: "@{percent}"
    sql: ${count_detractors}::float/${count_users}::float ;;
  }

  measure: pct_passive_score {
    group_label: "Percents"
    type: number
    value_format: "@{percent}"
    sql: ${count_passive}::float/${count_users}::float ;;
  }

  measure: nps_score {
    label: "NPS Score"
    value_format: "@{decimal}"
    type: number
    sql: 100*(${pct_promoter_score} - ${pct_detractor_score}) ;;
  }

  measure: avg_score {
    group_label: "Averages"
    value_format: "@{decimal}"
    type: average
    sql: ${score} ;;
  }

  measure: avg_promoter_score {
    group_label: "Averages"
    value_format: "@{decimal}"
    filters: {
      field: promoter_type
      value: "Promoter"
    }
    type: average
    sql: ${score} ;;
  }

  measure: avg_detractor_score {
    group_label: "Averages"
    value_format: "@{decimal}"
    filters: {
      field: promoter_type
      value: "Detractor"
    }
    type: average
    sql: ${score} ;;
  }

  measure: avg_passive_score {
    group_label: "Averages"
    value_format: "@{decimal}"
    filters: {
      field: promoter_type
      value: "Passive"
    }
    type: average
    sql: ${score} ;;
  }

  measure: sum_responses {
    group_label: "Responses"
    label: "Responses"
    description: "Sum of responses received in the record month."
    value_format_name: decimal_0
    type: sum
    sql: ${responses} ;;
  }

  measure: sum_responses_all_time {
    group_label: "Responses"
    label: "Responses (All Time)"
    description: "Sum of responses received all time (before or during record month)."
    value_format_name: decimal_0
    type: sum
    sql: ${responses_alltime} ;;
  }

}
