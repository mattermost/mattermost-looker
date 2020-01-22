view: github_contributions {
  sql_table_name: MATTERMOST.GITHUB_CONTRIBUTIONS ;;

  dimension: author {
    type: string
    sql: ${TABLE}."AUTHOR" ;;
  }

  dimension: is_staff {
    sql: ${staff_github_usernames.username} IS NOT NULL ;;
    type: yesno
    label: "Is Staff?"
  }

  dimension: compound_primary {
    type: string
    sql: ${author} || '-' || ${pr_nunmber} ;;
  }

  dimension_group: merged {
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
    sql: ${TABLE}."MERGED_AT" ;;
  }

  dimension: pr_nunmber {
    type: number
    sql: ${TABLE}."PR_NUNMBER" ;;
    hidden: yes
  }

  measure: count_contributions {
    type: count
  }

  measure: count_users {
    type: count_distinct
    sql: ${author} ;;
  }
}
