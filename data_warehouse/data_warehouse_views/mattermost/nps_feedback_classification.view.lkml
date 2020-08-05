# This is the view file for the analytics.mattermost.nps_feedback_classification table.
view: nps_feedback_classification {
  sql_table_name: mattermost.nps_feedback_classification ;;
  view_label: "Nps Feedback Classification"

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

  dimension: id {
    description: "" 
    type: string
    sql: ${TABLE}.id ;;
    hidden: no
  }

  dimension: category {
    description: "" 
    type: string
    sql: ${TABLE}.category ;;
    hidden: no
  }

  dimension: subcategory {
    description: "" 
    type: string
    sql: ${TABLE}.subcategory ;;
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


}