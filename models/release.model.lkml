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


  # Custom dimensions reusing releases to mark version that an issue falls within its release timeframe.
  # A release timeframe is the time from previous month to the planned release date (17th-16th).
  join: dim_release_timeframe_version {
    from: dim_releases
    view_label: "Release Timeframe"
    relationship: many_to_one
    sql_on: ${fct_issues_daily_snapshot.release_timeframe_version} = ${dim_release_timeframe_version.version};;
    fields: [dim_release_timeframe_version.version, dim_release_timeframe_version.short_version]
  }

  # Week following release is the 7 days after the actual release date.
  join: dim_week_following_release {
    from: dim_releases
    view_label: "Week Following Release"
    relationship: many_to_one
    sql_on: (${fct_issues_daily_snapshot.created_after_release_version} = ${dim_week_following_release.version};;
    fields: [dim_week_following_release.version, dim_week_following_release.short_version]
  }

}
