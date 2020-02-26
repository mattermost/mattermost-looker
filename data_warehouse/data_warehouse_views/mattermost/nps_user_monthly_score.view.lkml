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

  dimension: nps_score {
    description: ""
    type: number
    sql: ${TABLE}.nps_score ;;
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


  # MEASURES
  measure: count {
    description: "Count of rows/occurrences."
    type: count
  }

  measure: server_id_count {
    description: "The distinct count of Server Id's per grouping."
    type: count_distinct
    sql: ${server_id} ;;
  }

  measure: user_id_count {
    description: "The distinct count of User Id's per grouping."
    type: count_distinct
    sql: ${user_id} ;;
  }

  measure: avg_nps_score {
    description: "The average NPS score per grouped field."
    type: average
    sql: ${nps_score} ;;
  }


}
