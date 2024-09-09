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


  # Week following release is the 7 days after the actual release date.
  join: dim_week_following_release {
    from: dim_releases
    view_label: "Week Following Release"
    relationship: many_to_one
    sql_on: ${fct_issues_daily_snapshot.created_after_release_version} = ${dim_week_following_release.version};;
    fields: [dim_week_following_release.version, dim_week_following_release.short_version, dim_week_following_release.version_major, dim_week_following_release.version_minor]
  }

  # Custom dimension, using releases to join on release date range window.
  join: dim_release_window {
    from: dim_releases
    view_label: "Release Window"
    relationship: many_to_many
    # Note that this might result in issues being counted for multiple releases if releases with overlapping release dates exist.
    sql_on: ${fct_issues_daily_snapshot.created_date} >= least(${dim_release_window.rc1_date}, ${dim_release_window.release_start_date})  and ${fct_issues_daily_snapshot.created_date} < ${dim_release_window.planned_release_date} ;;
  }

}
