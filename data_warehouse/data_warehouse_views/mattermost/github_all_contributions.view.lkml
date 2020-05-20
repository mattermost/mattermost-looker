view: github_all_contributions {
  sql_table_name: MATTERMOST.GITHUB_ALL_CONTRIBUTIONS ;;
  label: "GitHub Contributions"

  dimension: author {
    type: string
    sql: ${TABLE}."AUTHOR" ;;
    description: "Username of GitHub contribution"
  }

  dimension: is_staff {
    sql: ${staff_github_usernames.username} IS NOT NULL ;;
    type: yesno
    label: "Staff?"
    description: "The contributor is a Mattermost employee"
  }

  dimension: is_first_contribution {
    sql: ${github_all_contributors.min_contribution_time} = ${TABLE}."MERGED_AT" ;;
    type: yesno
    label: "First Contribution?"
    description: "The first time someone contributed."
  }

  dimension: is_first_time_contributor {
    sql: ${github_all_contributors.min_contribution_month} = ${merged_month} ;;
    type: yesno
    label: "First Time Contributor?"
    description: "The first month someone contributes, they considered a First Time Contributor the whole month."
  }

  dimension: is_last_contribution {
    sql: ${github_all_contributors.max_contribution_time} = ${TABLE}."MERGED_AT" ;;
    type: yesno
    label: "Last Contribution?"
    description: "The last time someone contributed."
  }

  dimension: compound_primary {
    type: string
    sql: ${author} || '-' || ${pr_number} ;;
    hidden: yes
    primary_key: yes
  }

  dimension_group: merged {
    type: time
    timeframes: [
      date,
      month,
      fiscal_quarter,
      fiscal_year
    ]
    sql: ${TABLE}."MERGED_AT" ;;
  }

  dimension: pr_number {
    label: "PR Number"
    type: number
    sql: ${TABLE}."PR_NUMBER" ;;
    link: {
      label: "View PR"
      url: "https://github.com/mattermost/{{repo}}/pull/{{value}}"
    }
  }

  dimension: repo {
    label: "GitHub Repo"
    type: string
    sql: ${TABLE}."REPO" ;;
  }

  measure: count_contributions {
    label: "# of Contributions"
    type: count
    drill_fields: [author,repo,merged_date,pr_number]
  }

  measure: count_users {
    label: "# of Contributors"
    type: count_distinct
    sql: ${author} ;;
  }
}
