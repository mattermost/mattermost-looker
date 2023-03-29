connection: "snowflake"
include: "/views/marts/release/*.view.lkml"

explore:  fct_issues_daily_snapshot {
  label: "JIRA Issues - Daily Snapshot"
  group_label: "JIRA Issues"

  join: dim_projects {
    relationship: one_to_one
    type: inner
    sql_on: ${fct_issues_daily_snapshot.project_id} = ${dim_projects.project_id} ;;
  }

  join: dim_labels {
    relationship: one_to_many
    sql_on: ${fct_issues_daily_snapshot.issue_id} = ${dim_labels.issue_id} ;;
  }

  join: dim_fix_versions {
    relationship: one_to_many
    sql_on: ${fct_issues_daily_snapshot.issue_id} = ${dim_fix_versions.issue_id} ;;
  }
}
