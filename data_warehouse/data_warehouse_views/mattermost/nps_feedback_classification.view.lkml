# This is the view file for the analytics.mattermost.nps_feedback_classification table.
view: nps_feedback_classification {
  sql_table_name: mattermost.nps_feedback_classification ;;
  view_label: "Nps Feedback Classification"

  # FILTERS

  # DIMENSIONS
  dimension: id {
    description: "Unique ID for each categorization record."
    type: string
    sql: MD5(${last_feedback_date}::varchar, ${server_id}::varchar, ${user_id}::varchar, ${category}::varchar, ${subcategory}::varchar,
          ${categorized_at_date}::varchar, ${categorized_at_time}::varchar, ${categorized_by}::varchar) ;;
    primary_key: yes
  }

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
    group_label: "Feedback Categorization"
    description: ""
    type: string
    sql: ${TABLE}.category ;;
    hidden: no
  }

  dimension: subcategory {
    label: "Feedback Subcategory"
    group_label: "Feedback Categorization"
    description: ""
    type: string
    sql: ${TABLE}.subcategory ;;
    hidden: no
  }

  dimension: categorized_by {
    label: "Categorized By"
    group_label: "Feedback Categorization"
    description: "The email or name of person or automation responsible for categorizing the NPS feedback."
    type: string
    sql: ${TABLE}.categorized_by ;;
  }

  dimension: category_rank {
    description: "Ranking of Category by priority. Rank = 1 when it's the latest categorization for the feedback."
    group_label: "Feedback Categorization"
    type: number
    sql: ${TABLE}.category_rank ;;
  }


  # DIMENSION GROUPS/DATES
  dimension_group: last_feedback {
    description: "The date the feedback was provided by the NPS User."
    type: time
    timeframes: [date, month, year, week]
    sql: ${TABLE}.last_feedback_date ;;
    hidden: no
  }

  dimension_group: categorized_at {
    description: "The date/time the feedback category was categorized for each record contained in the data."
    label: "Feedback Categorized Date"
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
