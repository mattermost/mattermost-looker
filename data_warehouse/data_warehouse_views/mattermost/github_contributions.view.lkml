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

  dimension: is_first_contribution {
    sql: ${github_contributors.min_contribution_time} = ${merged_time} ;;
    type: yesno
    label: "Is First Contribution?"
  }

  dimension: is_first_time_contributor {
    sql: ${github_contributors.min_contribution_month} = ${merged_month} ;;
    type: yesno
    label: "Is First Time Contributor?"
  }

  dimension: is_last_contribution {
    sql: ${github_contributors.max_contribution_time} = ${merged_time} ;;
    type: yesno
    label: "Is Last Contribution?"
  }

  dimension: compound_primary {
    type: string
    sql: ${author} || '-' || ${pr_nunmber} ;;
    hidden: yes
    primary_key: yes
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
  }

  measure: count_contributions {
    type: count
  }

  measure: count_users {
    type: count_distinct
    sql: ${author} ;;
  }
}
