# This is the view file for the analytics.mattermost.server_feature_flag_details table.
view: server_feature_flag_details {
  sql_table_name: mattermost.server_feature_flag_details ;;
  view_label: "Server Feature Flag Details"

  # FILTERS

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
    hidden: no
  }

  dimension: context_ip {
    description: "" 
    type: string
    sql: ${TABLE}.context_ip ;;
    hidden: no
  }

  dimension: collapsed_threads {
    description: "" 
    type: string
    sql: ${TABLE}.collapsed_threads ;;
    hidden: no
  }

  dimension: context_library_version {
    description: "" 
    type: string
    sql: ${TABLE}.context_library_version ;;
    hidden: no
  }

  dimension: enable_remote_cluster_service {
    description: "" 
    type: string
    sql: ${TABLE}.enable_remote_cluster_service ;;
    hidden: no
  }

  dimension: event_text {
    description: "" 
    type: string
    sql: ${TABLE}.event_text ;;
    hidden: no
  }

  dimension: test_feature {
    description: "" 
    type: string
    sql: ${TABLE}.test_feature ;;
    hidden: no
  }

  dimension: context_request_ip {
    description: "" 
    type: string
    sql: ${TABLE}.context_request_ip ;;
    hidden: no
  }

  dimension: context_library_name {
    description: "" 
    type: string
    sql: ${TABLE}.context_library_name ;;
    hidden: no
  }

  dimension: custom_data_retention_enabled {
    description: "" 
    type: string
    sql: ${TABLE}.custom_data_retention_enabled ;;
    hidden: no
  }

  dimension: event {
    description: "" 
    type: string
    sql: ${TABLE}.event ;;
    hidden: no
  }

  dimension: user_id {
    description: "" 
    type: string
    sql: ${TABLE}.user_id ;;
    hidden: no
  }

  dimension: apps_enabled {
    description: "" 
    type: string
    sql: ${TABLE}.apps_enabled ;;
    hidden: no
  }

  dimension: cloud_delinquent_email_jobs_enabled {
    description: "" 
    type: string
    sql: ${TABLE}.cloud_delinquent_email_jobs_enabled ;;
    hidden: no
  }

  dimension: anonymous_id {
    description: "" 
    type: string
    sql: ${TABLE}.anonymous_id ;;
    hidden: no
  }

  dimension: files_search {
    description: "" 
    type: string
    sql: ${TABLE}.files_search ;;
    hidden: no
  }

  dimension: test_bool_feature {
    description: "" 
    type: string
    sql: ${TABLE}.test_bool_feature ;;
    hidden: no
  }

  dimension: custom_user_statuses {
    description: "" 
    type: string
    sql: ${TABLE}.custom_user_statuses ;;
    hidden: no
  }

  dimension: plugin_incident_management {
    description: "" 
    type: string
    sql: ${TABLE}.plugin_incident_management ;;
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
  }

  measure: user_count {
    label: " User Count"
    description: "The distinct count of Server Feature Flag Details Users within each grouping."
    type: count_distinct
    sql: ${user_id} ;;
  }

  measure: anonymous_count {
    label: " Anonymous Count"
    description: "The distinct count of Server Feature Flag Details Anonymouss within each grouping."
    type: count_distinct
    sql: ${anonymous_id} ;;
  }

  measure: context_traits_installation_count {
    label: " Context Traits Installation Count"
    description: "The distinct count of Server Feature Flag Details Context Traits Installations within each grouping."
    type: count_distinct
    sql: ${context_traits_installation_id} ;;
  }


}