view: github_contributors {
  sql_table_name: mattermost.github_contributors ;;

  dimension: author {
    type: number
    sql: ${TABLE}.author ;;
  }

  dimension_group: min_contribution {
    description: "The date when each user last ordered"
    type: time
    timeframes: [
      time,
      date,
      week,
      month,
      fiscal_quarter,
      year,
      fiscal_year
    ]
    sql: ${TABLE}.min_contribution ;;
  }

  dimension_group: max_contribution {
    type: time
    timeframes: [
      time,
      date,
      week,
      month,
      fiscal_quarter,
      year,
      fiscal_year
    ]
    sql: ${TABLE}.max_contribution ;;
  }

  dimension: total_contributions {
    type: number
    sql: ${TABLE}.total_contributions ;;
  }
}
