# This is the view file for the analytics.mattermost.nps_server_monthly_score table.
view: nps_server_monthly_score {
  sql_table_name: mattermost.nps_server_monthly_score ;;
  view_label: "Nps Server Monthly Score"

  # FILTERS

  # DIMENSIONS
  dimension: server_id {
    description: "" 
    type: string
    sql: ${TABLE}.server_id ;;
    hidden: no
  }

  dimension: id {
    description: "" 
    type: string
    sql: ${TABLE}.id ;;
    hidden: no
  }

  dimension: promoters {
    description: "" 
    type: number
    sql: ${TABLE}.promoters ;;
    hidden: no
  }

  dimension: detractors {
    description: "" 
    type: number
    sql: ${TABLE}.detractors ;;
    hidden: no
  }

  dimension: passives {
    description: "" 
    type: number
    sql: ${TABLE}.passives ;;
    hidden: no
  }

  dimension: nps_users {
    description: "" 
    type: number
    sql: ${TABLE}.nps_users ;;
    hidden: no
  }

  dimension: avg_score {
    description: "" 
    type: number
    sql: ${TABLE}.avg_score ;;
    hidden: no
  }

  dimension: nps_score {
    description: "" 
    type: number
    sql: ${TABLE}.nps_score ;;
    hidden: no
  }

  
  # DIMENSION GROUPS/DATES
  dimension_group: month {
    description: "" 
    type: time
    timeframes: [date, month, year]
    sql: ${TABLE}.month ;;
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

  measure: nps_users_sum {
    description: "The sum of Nps Users per grouping."
    type: sum
    sql: ${nps_users} ;;
  }


}