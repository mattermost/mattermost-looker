view: feature_flag_telemetry {
  sql_table_name: "EVENTS"."FEATURE_FLAG_TELEMETRY";;
  drill_fields: []


  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}."ID" ;;
  }


  dimension: _dbt_source_relation {
    type: string
    sql: ${TABLE}."_DBT_SOURCE_RELATION" ;;
  }

  dimension: add_channel_button {
    type: string
    sql: ${TABLE}."ADD_CHANNEL_BUTTON" ;;
  }

  dimension: add_members_to_channel {
    label: "Add Member to Channel"
    type: string
    sql: ${TABLE}."ADD_MEMBERS_TO_CHANNEL" ;;
  }

  dimension: advanced_text_editor {
    label: "Advanced Text Editor"
    type: string
    sql: ${TABLE}."ADVANCED_TEXT_EDITOR" ;;
  }

  dimension: anonymous_id {
    label: "Anonymous ID"
    type: string
    sql: ${TABLE}."ANONYMOUS_ID" ;;
  }

  dimension: app_bar_enabled {
    label: "App Bar Enabled"
    type: string
    sql: ${TABLE}."APP_BAR_ENABLED" ;;
  }

  dimension: apps_enabled {
    label: "Apps Enabled"
    type: string
    sql: ${TABLE}."APPS_ENABLED" ;;
  }

  dimension: auto_tour {
    label: "Auto Tour"
    type: string
    sql: ${TABLE}."AUTO_TOUR" ;;
  }

  dimension: boards_data_retention {
    label: "Boards Data Retention"
    type: string
    sql: ${TABLE}."BOARDS_DATA_RETENTION" ;;
  }

  dimension: boards_feature_flags {
    label: "Boards Feature Flags"
    type: string
    sql: ${TABLE}."BOARDS_FEATURE_FLAGS" ;;
  }

  dimension: boards_unfurl {
    label: "Boards Unfurl"
    type: string
    sql: ${TABLE}."BOARDS_UNFURL" ;;
  }

  dimension: calls_enabled {
    label: "Calls Enabled"
    type: string
    sql: ${TABLE}."CALLS_ENABLED" ;;
  }

  dimension: calls_mobile {
    label: "Calls Mobile"
    type: string
    sql: ${TABLE}."CALLS_MOBILE" ;;
  }

  dimension: cloud_delinquent_email_jobs_enabled {
    type: string
    sql: ${TABLE}."CLOUD_DELINQUENT_EMAIL_JOBS_ENABLED" ;;
  }

  dimension: cloud_free {
    label: "Cloud Free"
    type: string
    sql: ${TABLE}."CLOUD_FREE" ;;
  }

  dimension: collapsed_threads {
    label: "Collapsed Threads"
    type: string
    sql: ${TABLE}."COLLAPSED_THREADS" ;;
  }

  dimension: command_palette {
    label: "Command Palette"
    type: string
    sql: ${TABLE}."COMMAND_PALETTE" ;;
  }

  dimension: context_destination_id {
    type: string
    sql: ${TABLE}."CONTEXT_DESTINATION_ID" ;;
  }

  dimension: context_destination_type {
    type: string
    sql: ${TABLE}."CONTEXT_DESTINATION_TYPE" ;;
  }

  dimension: context_ip {
    type: string
    sql: ${TABLE}."CONTEXT_IP" ;;
  }

  dimension: context_library_name {
    type: string
    sql: ${TABLE}."CONTEXT_LIBRARY_NAME" ;;
  }

  dimension: context_library_version {
    type: string
    sql: ${TABLE}."CONTEXT_LIBRARY_VERSION" ;;
  }

  dimension: context_request_ip {
    type: string
    sql: ${TABLE}."CONTEXT_REQUEST_IP" ;;
  }

  dimension: context_source_id {
    type: string
    sql: ${TABLE}."CONTEXT_SOURCE_ID" ;;
  }

  dimension: context_source_type {
    type: string
    sql: ${TABLE}."CONTEXT_SOURCE_TYPE" ;;
  }

  dimension: context_traits_installation_id {
    type: string
    sql: ${TABLE}."CONTEXT_TRAITS_INSTALLATION_ID" ;;
  }

  dimension: custom_data_retention_enabled {
    type: string
    sql: ${TABLE}."CUSTOM_DATA_RETENTION_ENABLED" ;;
  }

  dimension: custom_groups {
    label: "Custom Groups"
    type: string
    sql: ${TABLE}."CUSTOM_GROUPS" ;;
  }

  dimension: custom_user_statuses {
    label: "Custom User Statuses"
    type: string
    sql: ${TABLE}."CUSTOM_USER_STATUSES" ;;
  }

  dimension: download_apps_cta {
    label: "Download Apps CTA"
    type: string
    sql: ${TABLE}."DOWNLOAD_APPS_CTA" ;;
  }

  dimension: enable_inactivity_check_job {
    label: "Enable Inactivity Check Job"
    type: string
    sql: ${TABLE}."ENABLE_INACTIVITY_CHECK_JOB" ;;
  }

  dimension: enable_remote_cluster_service {
    label: "Enable Remote Cluster Service"
    type: string
    sql: ${TABLE}."ENABLE_REMOTE_CLUSTER_SERVICE" ;;
  }

  dimension: event {
    label: "Event"
    type: string
    sql: ${TABLE}."EVENT" ;;
  }

  dimension: event_text {
    label: "Event Text"
    type: string
    sql: ${TABLE}."EVENT_TEXT" ;;
  }

  dimension: files_search {
    label: "Files Search"
    type: string
    sql: ${TABLE}."FILES_SEARCH" ;;
  }

  dimension: global_header {
    label: "Global Header"
    type: string
    sql: ${TABLE}."GLOBAL_HEADER" ;;
  }

  dimension: graph_ql {
    label: "Graph QL"
    type: string
    sql: ${TABLE}."GRAPH_QL" ;;
  }

  dimension: guided_channel_creation {
    label: "Guided Channel Creation"
    type: string
    sql: ${TABLE}."GUIDED_CHANNEL_CREATION" ;;
  }

  dimension: inline_post_editing {
    label: "Inline Post Editing"
    type: string
    sql: ${TABLE}."INLINE_POST_EDITING" ;;
  }

  dimension: insights_enabled {
    label: "Insights Enabled"
    type: string
    sql: ${TABLE}."INSIGHTS_ENABLED" ;;
  }

  dimension: invite_members_button {
    label: "Invite Members button"
    type: string
    sql: ${TABLE}."INVITE_MEMBERS_BUTTON" ;;
  }

  dimension: invite_to_team {
    label: "Invite to team"
    type: string
    sql: ${TABLE}."INVITE_TO_TEAM" ;;
  }

  dimension: new_account_noisy {
    label: "New Account Noisy"
    type: string
    sql: ${TABLE}."NEW_ACCOUNT_NOISY" ;;
  }

  dimension: normalize_ldap_d_ns {
    label: "Normalize LDAP DNS"
    type: string
    sql: ${TABLE}."NORMALIZE_LDAP_D_NS" ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: original_timestamp {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."ORIGINAL_TIMESTAMP" ;;
  }

  dimension: permalink_previews {
    label: "Permalink Previews"
    type: string
    sql: ${TABLE}."PERMALINK_PREVIEWS" ;;
  }

  dimension: plugin_apps {
    label: "Plugin Apps"
    type: string
    sql: ${TABLE}."PLUGIN_APPS" ;;
  }

  dimension: plugin_calls {
    label: "Plugin Calls"
    type: string
    sql: ${TABLE}."PLUGIN_CALLS" ;;
  }

  dimension: plugin_focalboard {
    label: "Plugin Focalboard"
    type: string
    sql: ${TABLE}."PLUGIN_FOCALBOARD" ;;
  }

  dimension: plugin_incident_management {
    label: "Plugin Incident Management"
    type: string
    sql: ${TABLE}."PLUGIN_INCIDENT_MANAGEMENT" ;;
  }

  dimension: prewritten_messages {
    label: "Prewritten Messages"
    type: string
    sql: ${TABLE}."PREWRITTEN_MESSAGES" ;;
  }

  dimension_group: received {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."RECEIVED_AT" ;;
  }

  dimension: resend_invite_email_interval {
    type: string
    sql: ${TABLE}."RESEND_INVITE_EMAIL_INTERVAL" ;;
  }

  dimension_group: sent {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."SENT_AT" ;;
  }

  dimension: test_bool_feature {
    label: "Test Bool Feature"
    type: string
    sql: ${TABLE}."TEST_BOOL_FEATURE" ;;
  }

  dimension: test_feature {
    label: "Test Feature"
    type: string
    sql: ${TABLE}."TEST_FEATURE" ;;
  }

  dimension: timed_dnd {
    type: string
    sql: ${TABLE}."TIMED_DND" ;;
  }

  dimension_group: timestamp {
    label: "Logging Date"
    description: "Logging date when event occured"
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."TIMESTAMP" ;;
  }

  dimension: use_case_onboarding {
    label: "Use Case Onboarding"
    type: string
    sql: ${TABLE}."USE_CASE_ONBOARDING" ;;
  }

  dimension: user_id {
    label: "Server ID"
    type: string
    sql: ${TABLE}."USER_ID" ;;
  }

  dimension_group: uuid_ts {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."UUID_TS" ;;
  }

  dimension: workspace_optimization_dashboard {
    label: "Workspace Optimization Dashboard"
    type: string
    sql: ${TABLE}."WORKSPACE_OPTIMIZATION_DASHBOARD" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure: instance_count {
    label: "Instance Count"
    description: "Total Instances"
    type: count_distinct
    sql: ${user_id} ;;
  }
}
