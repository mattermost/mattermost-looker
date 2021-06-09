# This is the view file for the analytics.mattermost.server_feature_flag_details table.
view: server_feature_flag_details {
  sql_table_name: mattermost.server_feature_flag_details ;;
  view_label: "Server Feature Flag Details"

  # SETS
  set: feature_flags {
    fields: [collapsed_threads, enable_remote_cluster_service, custom_data_retention_enabled, apps_enabled, cloud_delinquent_email_jobs_enabled, custom_user_statuses,
      plugin_apps, plugin_incident_management, user_count, instance_count_remote_cluster_service_enabled, instance_count_apps_enabled, instance_count_cloud_delinquent_email_jobs_enabled,
      instance_count_custom_data_retention_enabled, instance_count_custom_user_statuses_enabled, instance_count_collapsed_threads_enabled]
  }

  # DIMENSIONS
  dimension: _dbt_source_relation {
    description: ""
    type: string
    sql: ${TABLE}._dbt_source_relation ;;
    hidden: no
  }

  dimension: id {
    description: ""
    type: string
    sql: ${TABLE}.id ;;
    hidden: yes
  }

  dimension: context_ip {
    description: ""
    type: string
    sql: ${TABLE}.context_ip ;;
    hidden: yes
  }

  dimension: collapsed_threads {
    group_label: "Feature Flags"
    description: ""
    type: string
    sql: IFF(COALESCE(${TABLE}.collapsed_threads, 'false') = 'true', TRUE, FALSE)  ;;
    hidden: no
  }

  dimension: context_library_version {
    description: ""
    type: string
    sql: ${TABLE}.context_library_version ;;
    hidden: yes
  }

  dimension: enable_remote_cluster_service {
    group_label: "Feature Flags"
    description: ""
    type: string
    sql: IFF(COALESCE(${TABLE}.enable_remote_cluster_service, 'false') = 'true', TRUE, FALSE) ;;
    hidden: no
  }

  dimension: event_text {
    description: ""
    type: string
    sql: ${TABLE}.event_text ;;
    hidden: yes
  }

  dimension: test_feature {
    group_label: "Feature Flags"
    description: ""
    type: string
    sql: IFF(COALESCE(${TABLE}.test_feature, 'false') = 'true', TRUE, FALSE)  ;;
    hidden: yes
  }

  dimension: context_request_ip {
    description: ""
    type: string
    sql: ${TABLE}.context_request_ip ;;
    hidden: yes
  }

  dimension: context_library_name {
    description: ""
    type: string
    sql: ${TABLE}.context_library_name ;;
    hidden: yes
  }

  dimension: custom_data_retention_enabled {
    group_label: "Feature Flags"
    description: ""
    type: string
    sql: IFF(COALESCE(${TABLE}.custom_data_retention_enabled, 'false') = 'true', TRUE, FALSE) ;;
    hidden: no
  }

  dimension: event {
    description: ""
    type: string
    sql: ${TABLE}.event ;;
    hidden: yes
  }

  dimension: user_id {
    description: ""
    type: string
    sql: ${TABLE}.user_id ;;
    hidden: no
  }

  dimension: apps_enabled {
    group_label: "Feature Flags"
    description: ""
    type: string
    sql: IFF(COALESCE(${TABLE}.apps_enabled, 'false') = 'true', TRUE, FALSE) ;;
    hidden: no
  }

  dimension: cloud_delinquent_email_jobs_enabled {
    group_label: "Feature Flags"
    description: ""
    type: string
    sql: IFF(COALESCE(${TABLE}.cloud_delinquent_email_jobs_enabled, 'false') = 'true', TRUE, FALSE) ;;
    hidden: no
  }

  dimension: anonymous_id {
    description: ""
    type: string
    sql: ${TABLE}.anonymous_id ;;
    hidden: yes
  }

  dimension: test_bool_feature {
    description: ""
    type: string
    sql: IFF(COALESCE(${TABLE}.test_bool_feature, 'false') = 'true', TRUE, FALSE) ;;
    hidden: yes
  }

  dimension: custom_user_statuses {
    group_label: "Feature Flags"
    description: ""
    type: string
    sql: IFF(COALESCE(${TABLE}.custom_user_statuses, 'false') = 'true', TRUE, FALSE) ;;
    hidden: no
  }

  dimension: plugin_incident_management {
    description: ""
    type: string
    sql: IFF(COALESCE(${TABLE}.plugin_incident_management, 'false') = 'true', TRUE, FALSE) ;;
    hidden: no
  }

  dimension: context_traits_installation_id {
    description: ""
    type: string
    sql: ${TABLE}.context_traits_installation_id ;;
    hidden: no
  }

  dimension: plugin_apps {
    description: ""
    type: string
    sql: ${TABLE}.plugin_apps ;;
    hidden: no
  }


  # DIMENSION GROUPS/DATES
  dimension_group: uuid_ts {
  description: ""
  type: time
  timeframes: [time, week, date, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.uuid_ts ;;
    hidden: no
  }

  dimension_group: original_timestamp {
  description: ""
  type: time
  timeframes: [time, week, date, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.original_timestamp ;;
    hidden: no
  }

  dimension_group: sent_at {
  description: ""
  type: time
  timeframes: [time, week, date, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.sent_at ;;
    hidden: no
  }

  dimension_group: timestamp {
  description: ""
  type: time
  timeframes: [time, week, date, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.timestamp ;;
    hidden: no
  }

  dimension_group: received_at {
  description: ""
  type: time
  timeframes: [time, week, date, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.received_at ;;
    hidden: no
  }


  # MEASURES
  measure: count {
    description: "Count of rows/occurrences."
    type: count
  }

  measure: id_count {
    label: " Id Count"
    description: "The distinct count of Server Feature Flag Details Id within each grouping."
    type: count_distinct
    sql: ${id} ;;
    hidden: yes
  }

  measure: user_count {
    label: " Instance Count"
    description: "The distinct count of Server Feature Flag Details Users within each grouping."
    type: count_distinct
    sql: ${user_id} ;;
  }

  measure: anonymous_count {
    label: " Anonymous Count"
    description: "The distinct count of Server Feature Flag Details Anonymouss within each grouping."
    type: count_distinct
    sql: ${anonymous_id} ;;
    hidden: yes
  }

  measure: context_traits_installation_count {
    label: " Context Traits Installation Count"
    description: "The distinct count of Server Feature Flag Details Context Traits Installations within each grouping."
    type: count_distinct
    sql: ${context_traits_installation_id} ;;
    hidden: yes
  }

  measure: instance_count_custom_user_statuses_enabled {
    group_label: "Instance Counts"
    label: "Instances (Custom User Statuses Enabled)"
    description: "Count of distinct instances with custom user statuses enabled."
    type: count_distinct
    sql: CASE WHEN ${custom_user_statuses} THEN ${user_id} ELSE NULL END ;;
  }

  measure: instance_count_apps_enabled {
    group_label: "Instance Counts"
    label: "Instances (Apps  Enabled)"
    description: "Count of distinct instances with apps  enabled."
    type: count_distinct
    sql: CASE WHEN ${apps_enabled} THEN ${user_id} ELSE NULL END ;;
  }

  measure: instance_count_custom_data_retention_enabled {
    group_label: "Instance Counts"
    label: "Instances (Custom Data Retention  Enabled)"
    description: "Count of distinct instances with custom data retention  enabled."
    type: count_distinct
    sql: CASE WHEN ${custom_data_retention_enabled} THEN ${user_id} ELSE NULL END ;;
  }

  measure: instance_count_remote_cluster_service_enabled {
    group_label: "Instance Counts"
    label: "Instances (Remote Cluster Service Enabled)"
    description: "Count of distinct instances with  remote cluster service enabled."
    type: count_distinct
    sql: CASE WHEN ${enable_remote_cluster_service} THEN ${user_id} ELSE NULL END ;;
  }

  measure: instance_count_collapsed_threads_enabled {
    group_label: "Instance Counts"
    label: "Instances (Collapsed Threads Enabled)"
    description: "Count of distinct instances with collapsed threads enabled."
    type: count_distinct
    sql: CASE WHEN ${collapsed_threads} THEN ${user_id} ELSE NULL END ;;
  }

  measure: instance_count_cloud_delinquent_email_jobs_enabled {
    group_label: "Instance Counts"
    label: "Instances (Cloud Delinquent Email Jobs  Enabled)"
    description: "Count of distinct instances with cloud delinquent email jobs  enabled."
    type: count_distinct
    sql: CASE WHEN ${cloud_delinquent_email_jobs_enabled} THEN ${user_id} ELSE NULL END ;;
  }


}
