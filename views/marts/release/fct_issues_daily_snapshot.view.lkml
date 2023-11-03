view: fct_issues_daily_snapshot {
  label: "JIRA Issues"

  sql_table_name: "MART_RELEASE"."FCT_ISSUES_DAILY_SNAPSHOT"
    ;;

  dimension: issue_id {
    type: string
    hidden: yes
    sql: ${TABLE}."ISSUE_ID" ;;
    primary_key: yes
  }

  dimension: issue_key {
    type: string
    sql: ${TABLE}."ISSUE_KEY" ;;
    # Add a link to JIRA to make it easier to open specific issues directly from Looker
    link: {
      label: "Open in JIRA"
      url: "https://mattermost.atlassian.net/browse/{{ value }}"
    }
  }

  dimension: resolution {
    type: string
    sql: ${TABLE}."RESOLUTION" ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}."STATUS" ;;
  }

  dimension: issue_type {
    type: string
    sql:  ${TABLE}.issue_type ;;
  }

  dimension: project_id {
    type: string
    hidden: yes
    sql: ${TABLE}."PROJECT_ID" ;;
  }

  dimension_group: created {
    description: "The timestamp that the issue was created."
    type: time
    timeframes: [
      raw,
      date,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."CREATED_AT" ;;
  }

  dimension_group: closed {
    description: "The timestamp that the issue was closed."
    type: time
    timeframes: [
      raw,
      date,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."CLOSED_AT" ;;
  }

  # References to versions

  dimension: release_timeframe_version {
    type: string
    description: "The version that this issue was created during its release timeframe (17th to planned release date - dates are inclusive)"
    hidden: yes
  }

  dimension: is_created_after_rc1_cut {
    type: yesno
    label: "Created after RC1 is cut?"
    description: "True if the issue has been created after RC1 cut date of the release timeframe, False if between 17th (inclusive) and RC1 cut date (exclusive)."
  }

  dimension: created_after_release_version {
    type: string
    description: "Reference to the version that this issue was created during the week after its actual release date (actual release date + 7 days - dates are inclusive)"
    hidden: yes
  }

  dimension: lead_time_in_days {
    description: "The time (in days) between created and closed. "
    type: number
    sql: ${TABLE}."LEAD_TIME_IN_DAYS" ;;
  }

  measure: average_lead_time_in_days {
    type: average
    sql: ${lead_time_in_days} ;;
  }

  measure: median_lead_time_in_days {
    type: median
    sql: ${lead_time_in_days} ;;
  }

  measure: count {
    type: count
    drill_fields: [issue_key, issue_type, created_date, status]
  }
}
