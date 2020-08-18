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

  dimension: category {
    label: "Feedback Category"
    description: ""
    type: string
    sql: ${TABLE}.category ;;
    hidden: no
  }

  dimension: subcategory {
    label: "Feedback Subcategory"
    description: ""
    type: string
    sql: ${TABLE}.subcategory ;;
    hidden: no
  }

  dimension: categorized_by {
    label: "Categorized By"
    description: "The email or name of person or automation responsible for categorizing the NPS feedback."
    type: string
    sql: ${TABLE}.categorized_by ;;
  }

  dimension: category_rank {
    description: "Ranking of Category by priority. Rank = 1 when it's the latest categorization for the feedback."
  }


  # DIMENSION GROUPS/DATES
  dimension_group: last_feedback {
    description: ""
    type: time
    timeframes: [date, month, year, week]
    sql: ${TABLE}.last_feedback_date ;;
    hidden: no
  }

  dimension_group: categorized_at {
  description: ""
  type: time
  timeframes: [date, month, year, week, time]
  sql: ${TABLE}.last_feedback_date ;;
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
