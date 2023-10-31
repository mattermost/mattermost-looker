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


  join: dim_release_timeframe_version {
    from: dim_releases
    view_label: "Release Timeframe"
    relationship: many_to_one
    sql_on: (${fct_issues_daily_snapshot.created_date} > DATEADD(month, -1, ${dim_release_timeframe_version.planned_release_date})) and  (${fct_issues_daily_snapshot.created_date} <= ${dim_release_timeframe_version.planned_release_date});;
    fields: [dim_release_timeframe_version.version, dim_release_timeframe_version.short_version, dim_release_timeframe_version.actual_release_date, dim_release_timeframe_version.version_major, dim_release_timeframe_version.version_minor, dim_release_timeframe_version.version_patch]
  }

  join: dim_week_following_release {
    from: dim_releases
    view_label: "Week Following Release"
    relationship: many_to_one
    sql_on: (${fct_issues_daily_snapshot.created_date} <= DATEADD(day, 7, ${dim_week_following_release.actual_release_date})) and  (${fct_issues_daily_snapshot.created_date} > ${dim_week_following_release.actual_release_date});;
    fields: [dim_week_following_release.version, dim_week_following_release.short_version, dim_week_following_release.actual_release_date, dim_week_following_release.version_major, dim_week_following_release.version_minor, dim_week_following_release.version_patch]
  }

  join: dim_rc1_cut_to_release {
    from: dim_releases
    view_label: "After RC1 cut"
    relationship: many_to_one
    sql_on: (${fct_issues_daily_snapshot.created_date} >= DATEADD(day, 7, ${dim_rc1_cut_to_release.rc1_date})) and  (${fct_issues_daily_snapshot.created_date} <= ${dim_rc1_cut_to_release.planned_release_date});;
    fields: [dim_rc1_cut_to_release.version, dim_rc1_cut_to_release.short_version, dim_rc1_cut_to_release.actual_release_date, dim_rc1_cut_to_release.version_major, dim_rc1_cut_to_release.version_minor, dim_rc1_cut_to_release.version_patch]
  }
}
