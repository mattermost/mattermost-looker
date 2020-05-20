view: github_all_contributors {
  sql_table_name: mattermost.github_all_contributors ;;
  label: "GitHub Contributors"

  dimension: author {
    type: number
    sql: ${TABLE}.author ;;
  }

  dimension_group: min_contribution {
    description: "The first time a contributor contributed."
    type: time
    timeframes: [
      time,
      month,
    ]
    sql: ${TABLE}.min_contribution ;;
  }

  dimension_group: max_contribution {
    description: "The last time a contributor contributed."
    type: time
    timeframes: [
      time,
      month,
    ]
    sql: ${TABLE}.max_contribution ;;
  }

  dimension: total_contributions {
    description: "Total Contributions by a Contributor"
    type: number
    sql: ${TABLE}.total_contributions ;;
  }
}
