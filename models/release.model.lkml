connection: "snowflake"

# Limit include only to the ones really needed by this explore
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

  join: dim_release_timeframe {
    from:  dim_fix_versions
    view_label: "Release Timeframe"
    relationship: many_to_one
    sql_on: (${fct_issues_daily_snapshot.created_date} > DATEADD(month, -1, ${dim_release_timeframe.planned_release_date_date})) and  (${fct_issues_daily_snapshot.created_date} <= ${dim_release_timeframe.planned_release_date_date});;
  }
}
