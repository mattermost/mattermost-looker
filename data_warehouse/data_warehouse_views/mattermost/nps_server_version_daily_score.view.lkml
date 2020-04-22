# This is the view file for the analytics.mattermost.nps_server_version_daily_score table.
view: nps_server_version_daily_score {
  sql_table_name: mattermost.nps_server_version_daily_score ;;
  view_label: "Nps Server Version Daily Score"

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

  dimension: responses_alltime {
    description: "" 
    type: number
    sql: ${TABLE}.responses_alltime ;;
    hidden: no
  }

  dimension: id {
    description: "" 
    type: string
    sql: ${TABLE}.id ;;
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

  dimension_group: last_score {
    description: "" 
    type: time
    timeframes: [date, month, year]
    sql: ${TABLE}.last_score_date ;;
    hidden: no
  }

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

  measure: user_count {
    label: " User Count"
    description: "The distinct count of Users per grouping."
    type: count_distinct
    sql: ${user_id} ;;
  }

  measure: license_count {
    label: " License Count"
    description: "The distinct count of Licenses per grouping."
    type: count_distinct
    sql: ${license_id} ;;
  }


}