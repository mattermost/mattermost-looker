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

  dimension: lead_time_in_days {
    description: "The time (in days) between created and closed. "
    type: number
    sql: ${TABLE}."LEAD_TIME_IN_DAYS" ;;
  }

  measure: average_lead_time_in_days {
    type: average
    sql: ${lead_time_in_days} ;;
  }


  measure: count {
    type: count
    drill_fields: []
  }
}
