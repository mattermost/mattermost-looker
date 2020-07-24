# This is the view file for the analytics.qa.server_telemetry table.
view: server_telemetry {
  sql_table_name: qa.server_telemetry ;;
  view_label: "Server Telemetry"

  # FILTERS

  # DIMENSIONS
  dimension: _dbt_source_relation {
    label: "Source Relation"
    description: ""
    type: string
    sql: CASE WHEN regexp_substr(${TABLE}._dbt_source_relation, '_(RC|QA)') = '_RC' THEN 'Release Candidate'
    ELSE 'Quality Assurance (QA)' END ;;
    hidden: no
    link: {
      label: "Filter Dashboard (Source Relation = {{ value }})"
      url: "/dashboards/187?Data%20Source%20(RC%20vs.%20QA)={{ value }}"
    }
    link: {
      label: "Clear Dashboard Filters"
      url: "/dashboards/187"
    }
  }

  dimension: key {
    primary_key: yes
    type: string
    sql: ${_dbt_source_relation} || ${user_id} || ${timestamp_second} || ${anonymous_id} ;;
    hidden: yes
  }

  dimension: telemetry_relation {
    label: " Telemetry Source"
    description: "The database table (relation) capturing specific server telemetry data i.e. Config_Analytics, Config_Plugins, Plugins, etc."
    sql: split_part(${TABLE}._dbt_source_relation, '.', 3) ;;
    hidden: no
    type: string
    link: {
      label: "Filter Dashboard (Telemetry Source = {{ value }})"
      url: "/dashboards/187?Server%20Telemetry%20Table={{ value }}"
    }
    link: {
      label: "Clear Dashboard Filters"
      url: "/dashboards/187"
    }
  }

  dimension: incoming_webhooks {
    description: ""
    type: number
    sql: ${TABLE}.incoming_webhooks ;;
    hidden: no
  }

  dimension: private_channels {
    description: ""
    type: number
    sql: ${TABLE}.private_channels ;;
    hidden: no
  }

  dimension: public_channels {
    description: ""
    type: number
    sql: ${TABLE}.public_channels ;;
    hidden: no
  }

  dimension: registered_users {
    description: ""
    type: number
    sql: ${TABLE}.registered_users ;;
    hidden: no
  }

  dimension: registered_deactivated_users {
    description: ""
    type: number
    sql: ${TABLE}.registered_deactivated_users ;;
    hidden: no
  }

  dimension: active_users_daily {
    description: ""
    type: number
    sql: ${TABLE}.active_users_daily ;;
    hidden: no
  }

  dimension: public_channels_deleted {
    description: ""
    type: number
    sql: ${TABLE}.public_channels_deleted ;;
    hidden: no
  }

  dimension: posts {
    description: ""
    type: number
    sql: ${TABLE}.posts ;;
    hidden: no
  }

  dimension: posts_previous_day {
    description: ""
    type: number
    sql: ${TABLE}.posts_previous_day ;;
    hidden: no
  }

  dimension: event_text {
    description: ""
    type: string
    sql: ${TABLE}.event_text ;;
    hidden: no
  }

  dimension: user_id {
    description: ""
    type: string
    sql: ${TABLE}.user_id ;;
    hidden: no
    link: {
      label: "Filter Dashboard (User ID = {{ value}})"
      url: "/dashboards/187?Server%20ID%20(User%20ID)={{ value }}"
    }
    link: {
      label: "Clear Dashboard Filters"
      url: "/dashboards/187"
    }
  }

  dimension: bot_accounts {
    description: ""
    type: number
    sql: ${TABLE}.bot_accounts ;;
    hidden: no
  }

  dimension: outgoing_webhooks {
    description: ""
    type: number
    sql: ${TABLE}.outgoing_webhooks ;;
    hidden: no
  }

  dimension: teams {
    description: ""
    type: number
    sql: ${TABLE}.teams ;;
    hidden: no
  }

  dimension: context_ip {
    description: ""
    type: string
    sql: ${TABLE}.context_ip ;;
    hidden: no
  }

  dimension: id {
    description: ""
    type: string
    sql: ${TABLE}.id ;;
    hidden: no
  }

  dimension: anonymous_id {
    description: ""
    type: string
    sql: ${TABLE}.anonymous_id ;;
    hidden: no
  }

  dimension: slash_commands {
    description: ""
    type: number
    sql: ${TABLE}.slash_commands ;;
    hidden: no
  }

  dimension: event {
    description: ""
    type: string
    sql: ${TABLE}.event ;;
    hidden: no
  }

  dimension: private_channels_deleted {
    description: ""
    type: number
    sql: ${TABLE}.private_channels_deleted ;;
    hidden: no
  }

  dimension: active_users_monthly {
    description: ""
    type: number
    sql: ${TABLE}.active_users_monthly ;;
    hidden: no
  }

  dimension: bot_posts_previous_day {
    description: ""
    type: number
    sql: ${TABLE}.bot_posts_previous_day ;;
    hidden: no
  }

  dimension: direct_message_channels {
    description: ""
    type: number
    sql: ${TABLE}.direct_message_channels ;;
    hidden: no
  }

  dimension: context_library_version {
    description: ""
    type: string
    sql: ${TABLE}.context_library_version ;;
    hidden: no
  }

  dimension: context_library_name {
    description: ""
    type: string
    sql: ${TABLE}.context_library_name ;;
    hidden: no
  }

  dimension: guest_accounts {
    description: ""
    type: number
    sql: ${TABLE}.guest_accounts ;;
    hidden: no
  }

  dimension: channel {
    description: ""
    type: string
    sql: ${TABLE}.channel ;;
    hidden: no
  }

  dimension: manage_members_user_disabled_count {
    description: ""
    type: number
    sql: ${TABLE}.manage_members_user_disabled_count ;;
    hidden: no
  }

  dimension: post_reactions_user_disabled_count {
    description: ""
    type: number
    sql: ${TABLE}.post_reactions_user_disabled_count ;;
    hidden: no
  }

  dimension: use_channel_mentions_guest_disabled_count {
    description: ""
    type: number
    sql: ${TABLE}.use_channel_mentions_guest_disabled_count ;;
    hidden: no
  }

  dimension: post_reactions_guest_disabled_count {
    description: ""
    type: number
    sql: ${TABLE}.post_reactions_guest_disabled_count ;;
    hidden: no
  }

  dimension: create_post_user_disabled_count {
    description: ""
    type: number
    sql: ${TABLE}.create_post_user_disabled_count ;;
    hidden: no
  }

  dimension: channel_scheme_count {
    description: ""
    type: number
    sql: ${TABLE}.channel_scheme_count ;;
    hidden: no
  }

  dimension: use_channel_mentions_user_disabled_count {
    description: ""
    type: number
    sql: ${TABLE}.use_channel_mentions_user_disabled_count ;;
    hidden: no
  }

  dimension: create_post_guest_disabled_count {
    description: ""
    type: number
    sql: ${TABLE}.create_post_guest_disabled_count ;;
    hidden: no
  }

  dimension: allow_banner_dismissal {
    description: ""
    type: yesno
    sql: ${TABLE}.allow_banner_dismissal ;;
    hidden: no
  }

  dimension: isdefault_banner_text_color {
    description: ""
    type: yesno
    sql: ${TABLE}.isdefault_banner_text_color ;;
    hidden: no
  }

  dimension: enable_banner {
    description: ""
    type: yesno
    sql: ${TABLE}.enable_banner ;;
    hidden: no
  }

  dimension: isdefault_banner_color {
    description: ""
    type: yesno
    sql: ${TABLE}.isdefault_banner_color ;;
    hidden: no
  }

  dimension: file_compress {
    description: ""
    type: yesno
    sql: ${TABLE}.file_compress ;;
    hidden: no
  }

  dimension: file_max_queue_size {
    description: ""
    type: number
    sql: ${TABLE}.file_max_queue_size ;;
    hidden: no
  }

  dimension: syslog_max_queue_size {
    description: ""
    type: number
    sql: ${TABLE}.syslog_max_queue_size ;;
    hidden: no
  }

  dimension: file_enabled {
    description: ""
    type: yesno
    sql: ${TABLE}.file_enabled ;;
    hidden: no
  }

  dimension: file_max_age_days {
    description: ""
    type: number
    sql: ${TABLE}.file_max_age_days ;;
    hidden: no
  }

  dimension: syslog_enabled {
    description: ""
    type: yesno
    sql: ${TABLE}.syslog_enabled ;;
    hidden: no
  }

  dimension: file_max_backups {
    description: ""
    type: number
    sql: ${TABLE}.file_max_backups ;;
    hidden: no
  }

  dimension: file_max_size_mb {
    description: ""
    type: number
    sql: ${TABLE}.file_max_size_mb ;;
    hidden: no
  }

  dimension: syslog_insecure {
    description: ""
    type: yesno
    sql: ${TABLE}.syslog_insecure ;;
    hidden: no
  }

  dimension: enable_autocomplete {
    description: ""
    type: yesno
    sql: ${TABLE}.enable_autocomplete ;;
    hidden: no
  }

  dimension: enable_indexing {
    description: ""
    type: yesno
    sql: ${TABLE}.enable_indexing ;;
    hidden: no
  }

  dimension: enable_searching {
    description: ""
    type: yesno
    sql: ${TABLE}.enable_searching ;;
    hidden: no
  }

  dimension: bulk_indexing_time_window_seconds {
    description: ""
    type: number
    sql: ${TABLE}.bulk_indexing_time_window_seconds ;;
    hidden: no
  }

  dimension: ios_min_version {
    description: ""
    type: string
    sql: ${TABLE}.ios_min_version ;;
    hidden: no
  }

  dimension: ios_latest_version {
    description: ""
    type: string
    sql: ${TABLE}.ios_latest_version ;;
    hidden: no
  }

  dimension: desktop_min_version {
    description: ""
    type: string
    sql: ${TABLE}.desktop_min_version ;;
    hidden: no
  }

  dimension: android_min_version {
    description: ""
    type: string
    sql: ${TABLE}.android_min_version ;;
    hidden: no
  }

  dimension: android_latest_version {
    description: ""
    type: string
    sql: ${TABLE}.android_latest_version ;;
    hidden: no
  }

  dimension: desktop_latest_version {
    description: ""
    type: string
    sql: ${TABLE}.desktop_latest_version ;;
    hidden: no
  }

  dimension: advertise_address {
    description: ""
    type: yesno
    sql: ${TABLE}.advertise_address ;;
    hidden: no
  }

  dimension: use_ip_address {
    description: ""
    type: yesno
    sql: ${TABLE}.use_ip_address ;;
    hidden: no
  }

  dimension: enable {
    description: ""
    type: yesno
    sql: ${TABLE}.enable ;;
    hidden: no
  }

  dimension: use_experimental_gossip {
    description: ""
    type: yesno
    sql: ${TABLE}.use_experimental_gossip ;;
    hidden: no
  }

  dimension: read_only_config {
    description: ""
    type: yesno
    sql: ${TABLE}.read_only_config ;;
    hidden: no
  }

  dimension: bind_address {
    description: ""
    type: yesno
    sql: ${TABLE}.bind_address ;;
    hidden: no
  }

  dimension: network_interface {
    description: ""
    type: yesno
    sql: ${TABLE}.network_interface ;;
    hidden: no
  }

  dimension: enable_daily {
    description: ""
    type: yesno
    sql: ${TABLE}.enable_daily ;;
    hidden: no
  }

  dimension: message_retention_days {
    description: ""
    type: number
    sql: ${TABLE}.message_retention_days ;;
    hidden: no
  }

  dimension: file_retention_days {
    description: ""
    type: number
    sql: ${TABLE}.file_retention_days ;;
    hidden: no
  }

  dimension: deletion_job_start_time {
    description: ""
    type: string
    sql: ${TABLE}.deletion_job_start_time ;;
    hidden: no
  }

  dimension: enable_message_deletion {
    description: ""
    type: yesno
    sql: ${TABLE}.enable_message_deletion ;;
    hidden: no
  }

  dimension: enable_file_deletion {
    description: ""
    type: yesno
    sql: ${TABLE}.enable_file_deletion ;;
    hidden: no
  }

  dimension: isdefault_custom_url_schemes {
    description: ""
    type: yesno
    sql: ${TABLE}.isdefault_custom_url_schemes ;;
    hidden: no
  }

  dimension: experimental_timezone {
    description: ""
    type: yesno
    sql: ${TABLE}.experimental_timezone ;;
    hidden: no
  }

  dimension: sniff {
    description: ""
    type: yesno
    sql: ${TABLE}.sniff ;;
    hidden: no
  }

  dimension: isdefault_connection_url {
    description: ""
    type: yesno
    sql: ${TABLE}.isdefault_connection_url ;;
    hidden: no
  }

  dimension: trace {
    description: ""
    type: string
    sql: ${TABLE}.trace ;;
    hidden: no
  }

  dimension: user_index_shards {
    description: ""
    type: number
    sql: ${TABLE}.user_index_shards ;;
    hidden: no
  }

  dimension: channel_index_replicas {
    description: ""
    type: number
    sql: ${TABLE}.channel_index_replicas ;;
    hidden: no
  }

  dimension: isdefault_username {
    description: ""
    type: yesno
    sql: ${TABLE}.isdefault_username ;;
    hidden: no
  }

  dimension: isdefault_password {
    description: ""
    type: yesno
    sql: ${TABLE}.isdefault_password ;;
    hidden: no
  }

  dimension: user_index_replicas {
    description: ""
    type: number
    sql: ${TABLE}.user_index_replicas ;;
    hidden: no
  }

  dimension: isdefault_index_prefix {
    description: ""
    type: yesno
    sql: ${TABLE}.isdefault_index_prefix ;;
    hidden: no
  }

  dimension: skip_tls_verification {
    description: ""
    type: yesno
    sql: ${TABLE}.skip_tls_verification ;;
    hidden: no
  }

  dimension: channel_index_shards {
    description: ""
    type: number
    sql: ${TABLE}.channel_index_shards ;;
    hidden: no
  }

  dimension: live_indexing_batch_size {
    description: ""
    type: number
    sql: ${TABLE}.live_indexing_batch_size ;;
    hidden: no
  }

  dimension: post_index_shards {
    description: ""
    type: number
    sql: ${TABLE}.post_index_shards ;;
    hidden: no
  }

  dimension: post_index_replicas {
    description: ""
    type: number
    sql: ${TABLE}.post_index_replicas ;;
    hidden: no
  }

  dimension: request_timeout_seconds {
    description: ""
    type: number
    sql: ${TABLE}.request_timeout_seconds ;;
    hidden: no
  }

  dimension: enable_mobile_download {
    description: ""
    type: yesno
    sql: ${TABLE}.enable_mobile_download ;;
    hidden: no
  }

  dimension: amazon_s3_trace {
    description: ""
    type: yesno
    sql: ${TABLE}.amazon_s3_trace ;;
    hidden: no
  }

  dimension: driver_name {
    description: ""
    type: string
    sql: ${TABLE}.driver_name ;;
    hidden: no
  }

  dimension: amazon_s3_ssl {
    description: ""
    type: yesno
    sql: ${TABLE}.amazon_s3_ssl ;;
    hidden: no
  }

  dimension: amazon_s3_sse {
    description: ""
    type: yesno
    sql: ${TABLE}.amazon_s3_sse ;;
    hidden: no
  }

  dimension: enable_public_links {
    description: ""
    type: yesno
    sql: ${TABLE}.enable_public_links ;;
    hidden: no
  }

  dimension: isdefault_directory {
    description: ""
    type: yesno
    sql: ${TABLE}.isdefault_directory ;;
    hidden: no
  }

  dimension: enable_file_attachments {
    description: ""
    type: yesno
    sql: ${TABLE}.enable_file_attachments ;;
    hidden: no
  }

  dimension: amazon_s3_signv2 {
    description: ""
    type: yesno
    sql: ${TABLE}.amazon_s3_signv2 ;;
    hidden: no
  }

  dimension: isabsolute_directory {
    description: ""
    type: yesno
    sql: ${TABLE}.isabsolute_directory ;;
    hidden: no
  }

  dimension: max_file_size {
    description: ""
    type: number
    sql: ${TABLE}.max_file_size ;;
    hidden: no
  }

  dimension: enable_mobile_upload {
    description: ""
    type: yesno
    sql: ${TABLE}.enable_mobile_upload ;;
    hidden: no
  }

  dimension: isempty_admin_filter {
    description: ""
    type: yesno
    sql: ${TABLE}.isempty_admin_filter ;;
    hidden: no
  }

  dimension: isdefault_login_field_name {
    description: ""
    type: yesno
    sql: ${TABLE}.isdefault_login_field_name ;;
    hidden: no
  }

  dimension: query_timeout {
    description: ""
    type: number
    sql: ${TABLE}.query_timeout ;;
    hidden: no
  }

  dimension: isempty_guest_filter {
    description: ""
    type: yesno
    sql: ${TABLE}.isempty_guest_filter ;;
    hidden: no
  }

  dimension: isdefault_position_attribute {
    description: ""
    type: yesno
    sql: ${TABLE}.isdefault_position_attribute ;;
    hidden: no
  }

  dimension: isdefault_nickname_attribute {
    description: ""
    type: yesno
    sql: ${TABLE}.isdefault_nickname_attribute ;;
    hidden: no
  }

  dimension: max_page_size {
    description: ""
    type: number
    sql: ${TABLE}.max_page_size ;;
    hidden: no
  }

  dimension: isdefault_username_attribute {
    description: ""
    type: yesno
    sql: ${TABLE}.isdefault_username_attribute ;;
    hidden: no
  }

  dimension: enable_sync {
    description: ""
    type: yesno
    sql: ${TABLE}.enable_sync ;;
    hidden: no
  }

  dimension: isdefault_id_attribute {
    description: ""
    type: yesno
    sql: ${TABLE}.isdefault_id_attribute ;;
    hidden: no
  }

  dimension: isdefault_email_attribute {
    description: ""
    type: yesno
    sql: ${TABLE}.isdefault_email_attribute ;;
    hidden: no
  }

  dimension: isdefault_last_name_attribute {
    description: ""
    type: yesno
    sql: ${TABLE}.isdefault_last_name_attribute ;;
    hidden: no
  }

  dimension: isdefault_login_id_attribute {
    description: ""
    type: yesno
    sql: ${TABLE}.isdefault_login_id_attribute ;;
    hidden: no
  }

  dimension: connection_security {
    description: ""
    type: string
    sql: ${TABLE}.connection_security ;;
    hidden: no
  }

  dimension: sync_interval_minutes {
    description: ""
    type: number
    sql: ${TABLE}.sync_interval_minutes ;;
    hidden: no
  }

  dimension: isempty_group_filter {
    description: ""
    type: yesno
    sql: ${TABLE}.isempty_group_filter ;;
    hidden: no
  }

  dimension: isdefault_first_name_attribute {
    description: ""
    type: yesno
    sql: ${TABLE}.isdefault_first_name_attribute ;;
    hidden: no
  }

  dimension: skip_certificate_verification {
    description: ""
    type: yesno
    sql: ${TABLE}.skip_certificate_verification ;;
    hidden: no
  }

  dimension: isdefault_login_button_color {
    description: ""
    type: yesno
    sql: ${TABLE}.isdefault_login_button_color ;;
    hidden: no
  }

  dimension: isdefault_login_button_border_color {
    description: ""
    type: yesno
    sql: ${TABLE}.isdefault_login_button_border_color ;;
    hidden: no
  }

  dimension: isdefault_login_button_text_color {
    description: ""
    type: yesno
    sql: ${TABLE}.isdefault_login_button_text_color ;;
    hidden: no
  }

  dimension: isdefault_group_id_attribute {
    description: ""
    type: yesno
    sql: ${TABLE}.isdefault_group_id_attribute ;;
    hidden: no
  }

  dimension: enable_admin_filter {
    description: ""
    type: yesno
    sql: ${TABLE}.enable_admin_filter ;;
    hidden: no
  }

  dimension: isdefault_group_display_name_attribute {
    description: ""
    type: yesno
    sql: ${TABLE}.isdefault_group_display_name_attribute ;;
    hidden: no
  }

  dimension: isnotempty_picture_attribute {
    description: ""
    type: yesno
    sql: ${TABLE}.isnotempty_picture_attribute ;;
    hidden: no
  }

  dimension: file_json {
    description: ""
    type: yesno
    sql: ${TABLE}.file_json ;;
    hidden: no
  }

  dimension: file_level {
    description: ""
    type: string
    sql: ${TABLE}.file_level ;;
    hidden: no
  }

  dimension: enable_file {
    description: ""
    type: yesno
    sql: ${TABLE}.enable_file ;;
    hidden: no
  }

  dimension: console_json {
    description: ""
    type: yesno
    sql: ${TABLE}.console_json ;;
    hidden: no
  }

  dimension: isdefault_file_location {
    description: ""
    type: yesno
    sql: ${TABLE}.isdefault_file_location ;;
    hidden: no
  }

  dimension: console_level {
    description: ""
    type: string
    sql: ${TABLE}.console_level ;;
    hidden: no
  }

  dimension: enable_webhook_debugging {
    description: ""
    type: yesno
    sql: ${TABLE}.enable_webhook_debugging ;;
    hidden: no
  }

  dimension: enable_console {
    description: ""
    type: yesno
    sql: ${TABLE}.enable_console ;;
    hidden: no
  }

  dimension: export_format {
    description: ""
    type: string
    sql: ${TABLE}.export_format ;;
    hidden: no
  }

  dimension: enable_message_export {
    description: ""
    type: yesno
    sql: ${TABLE}.enable_message_export ;;
    hidden: no
  }

  dimension: default_export_from_timestamp {
    description: ""
    type: number
    sql: ${TABLE}.default_export_from_timestamp ;;
    hidden: no
  }

  dimension: is_default_global_relay_smtp_username {
    description: ""
    type: yesno
    sql: ${TABLE}.is_default_global_relay_smtp_username ;;
    hidden: no
  }

  dimension: is_default_global_relay_email_address {
    description: ""
    type: yesno
    sql: ${TABLE}.is_default_global_relay_email_address ;;
    hidden: no
  }

  dimension: is_default_global_relay_smtp_password {
    description: ""
    type: yesno
    sql: ${TABLE}.is_default_global_relay_smtp_password ;;
    hidden: no
  }

  dimension: global_relay_customer_type {
    description: ""
    type: string
    sql: ${TABLE}.global_relay_customer_type ;;
    hidden: no
  }

  dimension: batch_size {
    description: ""
    type: number
    sql: ${TABLE}.batch_size ;;
    hidden: no
  }

  dimension: daily_run_time {
    description: ""
    type: string
    sql: ${TABLE}.daily_run_time ;;
    hidden: no
  }

  dimension: block_profile_rate {
    description: ""
    type: number
    sql: ${TABLE}.block_profile_rate ;;
    hidden: no
  }

  dimension: isdefault_app_download_link {
    description: ""
    type: yesno
    sql: ${TABLE}.isdefault_app_download_link ;;
    hidden: no
  }

  dimension: isdefault_android_app_download_link {
    description: ""
    type: yesno
    sql: ${TABLE}.isdefault_android_app_download_link ;;
    hidden: no
  }

  dimension: isdefault_iosapp_download_link {
    description: ""
    type: yesno
    sql: ${TABLE}.isdefault_iosapp_download_link ;;
    hidden: no
  }

  dimension: number {
    description: ""
    type: yesno
    sql: ${TABLE}.number ;;
    hidden: no
  }

  dimension: minimum_length {
    description: ""
    type: number
    sql: ${TABLE}.minimum_length ;;
    hidden: no
  }

  dimension: lowercase {
    description: ""
    type: yesno
    sql: ${TABLE}.lowercase ;;
    hidden: no
  }

  dimension: symbol {
    description: ""
    type: yesno
    sql: ${TABLE}.symbol ;;
    hidden: no
  }

  dimension: uppercase {
    description: ""
    type: yesno
    sql: ${TABLE}.uppercase ;;
    hidden: no
  }

  dimension: show_email_address {
    description: ""
    type: yesno
    sql: ${TABLE}.show_email_address ;;
    hidden: no
  }

  dimension: show_full_name {
    description: ""
    type: yesno
    sql: ${TABLE}.show_full_name ;;
    hidden: no
  }

  dimension: vary_by_remote_address {
    description: ""
    type: yesno
    sql: ${TABLE}.vary_by_remote_address ;;
    hidden: no
  }

  dimension: max_burst {
    description: ""
    type: number
    sql: ${TABLE}.max_burst ;;
    hidden: no
  }

  dimension: memory_store_size {
    description: ""
    type: number
    sql: ${TABLE}.memory_store_size ;;
    hidden: no
  }

  dimension: isdefault_vary_by_header {
    description: ""
    type: yesno
    sql: ${TABLE}.isdefault_vary_by_header ;;
    hidden: no
  }

  dimension: per_sec {
    description: ""
    type: number
    sql: ${TABLE}.per_sec ;;
    hidden: no
  }

  dimension: enable_rate_limiter {
    description: ""
    type: yesno
    sql: ${TABLE}.enable_rate_limiter ;;
    hidden: no
  }

  dimension: vary_by_user {
    description: ""
    type: yesno
    sql: ${TABLE}.vary_by_user ;;
    hidden: no
  }

  dimension: data_source_replicas {
    description: ""
    type: number
    sql: ${TABLE}.data_source_replicas ;;
    hidden: no
  }

  dimension: conn_max_lifetime_milliseconds {
    description: ""
    type: number
    sql: ${TABLE}.conn_max_lifetime_milliseconds ;;
    hidden: no
  }

  dimension: data_source_search_replicas {
    description: ""
    type: number
    sql: ${TABLE}.data_source_search_replicas ;;
    hidden: no
  }

  dimension: max_idle_conns {
    description: ""
    type: number
    sql: ${TABLE}.max_idle_conns ;;
    hidden: no
  }

  dimension: max_open_conns {
    description: ""
    type: number
    sql: ${TABLE}.max_open_conns ;;
    hidden: no
  }

  dimension: disable_database_search {
    description: ""
    type: yesno
    sql: ${TABLE}.disable_database_search ;;
    hidden: no
  }

  dimension: restrict_public_channel_management {
    description: ""
    type: string
    sql: ${TABLE}.restrict_public_channel_management ;;
    hidden: no
  }

  dimension: isdefault_custom_brand_text {
    description: ""
    type: yesno
    sql: ${TABLE}.isdefault_custom_brand_text ;;
    hidden: no
  }

  dimension: enable_user_creation {
    description: ""
    type: yesno
    sql: ${TABLE}.enable_user_creation ;;
    hidden: no
  }

  dimension: restrict_public_channel_creation {
    description: ""
    type: string
    sql: ${TABLE}.restrict_public_channel_creation ;;
    hidden: no
  }

  dimension: experimental_view_archived_channels {
    description: ""
    type: yesno
    sql: ${TABLE}.experimental_view_archived_channels ;;
    hidden: no
  }

  dimension: enable_open_server {
    description: ""
    type: yesno
    sql: ${TABLE}.enable_open_server ;;
    hidden: no
  }

  dimension: isdefault_custom_description_text {
    description: ""
    type: yesno
    sql: ${TABLE}.isdefault_custom_description_text ;;
    hidden: no
  }

  dimension: experimental_default_channels {
    description: ""
    type: number
    sql: ${TABLE}.experimental_default_channels ;;
    hidden: no
  }

  dimension: experimental_enable_automatic_replies {
    description: ""
    type: yesno
    sql: ${TABLE}.experimental_enable_automatic_replies ;;
    hidden: no
  }

  dimension: enable_custom_brand {
    description: ""
    type: yesno
    sql: ${TABLE}.enable_custom_brand ;;
    hidden: no
  }

  dimension: restrict_private_channel_manage_members {
    description: ""
    type: string
    sql: ${TABLE}.restrict_private_channel_manage_members ;;
    hidden: no
  }

  dimension: enable_team_creation {
    description: ""
    type: yesno
    sql: ${TABLE}.enable_team_creation ;;
    hidden: no
  }

  dimension: enable_x_to_leave_channels_from_lhs {
    description: ""
    type: yesno
    sql: ${TABLE}.enable_x_to_leave_channels_from_lhs ;;
    hidden: no
  }

  dimension: enable_user_deactivation {
    description: ""
    type: yesno
    sql: ${TABLE}.enable_user_deactivation ;;
    hidden: no
  }

  dimension: experimental_town_square_is_read_only {
    description: ""
    type: yesno
    sql: ${TABLE}.experimental_town_square_is_read_only ;;
    hidden: no
  }

  dimension: restrict_public_channel_deletion {
    description: ""
    type: string
    sql: ${TABLE}.restrict_public_channel_deletion ;;
    hidden: no
  }

  dimension: restrict_private_channel_management {
    description: ""
    type: string
    sql: ${TABLE}.restrict_private_channel_management ;;
    hidden: no
  }

  dimension: restrict_direct_message {
    description: ""
    type: string
    sql: ${TABLE}.restrict_direct_message ;;
    hidden: no
  }

  dimension: restrict_private_channel_deletion {
    description: ""
    type: string
    sql: ${TABLE}.restrict_private_channel_deletion ;;
    hidden: no
  }

  dimension: experimental_town_square_is_hidden_in_lhs {
    description: ""
    type: yesno
    sql: ${TABLE}.experimental_town_square_is_hidden_in_lhs ;;
    hidden: no
  }

  dimension: isdefault_user_status_away_timeout {
    description: ""
    type: yesno
    sql: ${TABLE}.isdefault_user_status_away_timeout ;;
    hidden: no
  }

  dimension: max_channels_per_team {
    description: ""
    type: number
    sql: ${TABLE}.max_channels_per_team ;;
    hidden: no
  }

  dimension: enable_confirm_notifications_to_channel {
    description: ""
    type: yesno
    sql: ${TABLE}.enable_confirm_notifications_to_channel ;;
    hidden: no
  }

  dimension: restrict_team_invite {
    description: ""
    type: string
    sql: ${TABLE}.restrict_team_invite ;;
    hidden: no
  }

  dimension: max_notifications_per_channel {
    description: ""
    type: number
    sql: ${TABLE}.max_notifications_per_channel ;;
    hidden: no
  }

  dimension: teammate_name_display {
    description: ""
    type: string
    sql: ${TABLE}.teammate_name_display ;;
    hidden: no
  }

  dimension: max_users_per_team {
    description: ""
    type: number
    sql: ${TABLE}.max_users_per_team ;;
    hidden: no
  }

  dimension: lock_teammate_name_display {
    description: ""
    type: yesno
    sql: ${TABLE}.lock_teammate_name_display ;;
    hidden: no
  }

  dimension: restrict_private_channel_creation {
    description: ""
    type: string
    sql: ${TABLE}.restrict_private_channel_creation ;;
    hidden: no
  }

  dimension: experimental_primary_team {
    description: ""
    type: yesno
    sql: ${TABLE}.experimental_primary_team ;;
    hidden: no
  }

  dimension: isdefault_site_name {
    description: ""
    type: yesno
    sql: ${TABLE}.isdefault_site_name ;;
    hidden: no
  }

  dimension: allow_custom_themes {
    description: ""
    type: yesno
    sql: ${TABLE}.allow_custom_themes ;;
    hidden: no
  }

  dimension: enable_theme_selection {
    description: ""
    type: yesno
    sql: ${TABLE}.enable_theme_selection ;;
    hidden: no
  }

  dimension: isdefault_default_theme {
    description: ""
    type: yesno
    sql: ${TABLE}.isdefault_default_theme ;;
    hidden: no
  }

  dimension: allowed_themes {
    description: ""
    type: number
    sql: ${TABLE}.allowed_themes ;;
    hidden: no
  }

  dimension: enabled_backend_plugins {
    description: ""
    type: number
    sql: ${TABLE}.enabled_backend_plugins ;;
    hidden: no
  }

  dimension: plugins_with_broken_manifests {
    description: ""
    type: number
    sql: ${TABLE}.plugins_with_broken_manifests ;;
    hidden: no
  }

  dimension: disabled_backend_plugins {
    description: ""
    type: number
    sql: ${TABLE}.disabled_backend_plugins ;;
    hidden: no
  }

  dimension: enabled_webapp_plugins {
    description: ""
    type: number
    sql: ${TABLE}.enabled_webapp_plugins ;;
    hidden: no
  }

  dimension: plugins_with_settings {
    description: ""
    type: number
    sql: ${TABLE}.plugins_with_settings ;;
    hidden: no
  }

  dimension: enabled_plugins {
    description: ""
    type: number
    sql: ${TABLE}.enabled_plugins ;;
    hidden: no
  }

  dimension: disabled_webapp_plugins {
    description: ""
    type: number
    sql: ${TABLE}.disabled_webapp_plugins ;;
    hidden: no
  }

  dimension: disabled_plugins {
    description: ""
    type: number
    sql: ${TABLE}.disabled_plugins ;;
    hidden: no
  }

  dimension: version {
    description: ""
    type: string
    sql: ${TABLE}.version ;;
    hidden: no
  }

  dimension: database_version {
    description: ""
    type: string
    sql: ${TABLE}.database_version ;;
    hidden: no
  }

  dimension: operating_system {
    description: ""
    type: string
    sql: ${TABLE}.operating_system ;;
    hidden: no
  }

  dimension: database_type {
    description: ""
    type: string
    sql: ${TABLE}.database_type ;;
    hidden: no
  }

  dimension: edition {
    description: ""
    type: string
    sql: ${TABLE}.edition ;;
    hidden: no
  }

  dimension: system_admins {
    description: ""
    type: number
    sql: ${TABLE}.system_admins ;;
    hidden: no
  }

  dimension: distinct_group_member_count {
    description: ""
    type: number
    sql: ${TABLE}.distinct_group_member_count ;;
    hidden: no
  }

  dimension: group_team_count {
    description: ""
    type: number
    sql: ${TABLE}.group_team_count ;;
    hidden: no
  }

  dimension: group_member_count {
    description: ""
    type: number
    sql: ${TABLE}.group_member_count ;;
    hidden: no
  }

  dimension: group_count {
    description: ""
    type: number
    sql: ${TABLE}.group_count ;;
    hidden: no
  }

  dimension: group_synced_team_count {
    description: ""
    type: number
    sql: ${TABLE}.group_synced_team_count ;;
    hidden: no
  }

  dimension: group_channel_count {
    description: ""
    type: number
    sql: ${TABLE}.group_channel_count ;;
    hidden: no
  }

  dimension: group_synced_channel_count {
    description: ""
    type: number
    sql: ${TABLE}.group_synced_channel_count ;;
    hidden: no
  }

  dimension: group_count_with_allow_reference {
    description: ""
    type: number
    sql: ${TABLE}.group_count_with_allow_reference ;;
    hidden: no
  }

  dimension: send_email_notifications {
    description: ""
    type: yesno
    sql: ${TABLE}.send_email_notifications ;;
    hidden: no
  }

  dimension: require_email_verification {
    description: ""
    type: yesno
    sql: ${TABLE}.require_email_verification ;;
    hidden: no
  }

  dimension: isdefault_reply_to_address {
    description: ""
    type: yesno
    sql: ${TABLE}.isdefault_reply_to_address ;;
    hidden: no
  }

  dimension: enable_email_batching {
    description: ""
    type: yesno
    sql: ${TABLE}.enable_email_batching ;;
    hidden: no
  }

  dimension: enable_sign_in_with_username {
    description: ""
    type: yesno
    sql: ${TABLE}.enable_sign_in_with_username ;;
    hidden: no
  }

  dimension: isdefault_feedback_name {
    description: ""
    type: yesno
    sql: ${TABLE}.isdefault_feedback_name ;;
    hidden: no
  }

  dimension: send_push_notifications {
    description: ""
    type: yesno
    sql: ${TABLE}.send_push_notifications ;;
    hidden: no
  }

  dimension: email_batching_interval {
    description: ""
    type: number
    sql: ${TABLE}.email_batching_interval ;;
    hidden: no
  }

  dimension: enable_sign_up_with_email {
    description: ""
    type: yesno
    sql: ${TABLE}.enable_sign_up_with_email ;;
    hidden: no
  }

  dimension: email_batching_buffer_size {
    description: ""
    type: number
    sql: ${TABLE}.email_batching_buffer_size ;;
    hidden: no
  }

  dimension: skip_server_certificate_verification {
    description: ""
    type: yesno
    sql: ${TABLE}.skip_server_certificate_verification ;;
    hidden: no
  }

  dimension: enable_smtp_auth {
    description: ""
    type: yesno
    sql: ${TABLE}.enable_smtp_auth ;;
    hidden: no
  }

  dimension: use_channel_in_email_notifications {
    description: ""
    type: yesno
    sql: ${TABLE}.use_channel_in_email_notifications ;;
    hidden: no
  }

  dimension: isdefault_feedback_organization {
    description: ""
    type: yesno
    sql: ${TABLE}.isdefault_feedback_organization ;;
    hidden: no
  }

  dimension: smtp_server_timeout {
    description: ""
    type: number
    sql: ${TABLE}.smtp_server_timeout ;;
    hidden: no
  }

  dimension: email_notification_contents_type {
    description: ""
    type: string
    sql: ${TABLE}.email_notification_contents_type ;;
    hidden: no
  }

  dimension: enable_sign_in_with_email {
    description: ""
    type: yesno
    sql: ${TABLE}.enable_sign_in_with_email ;;
    hidden: no
  }

  dimension: enable_preview_mode_banner {
    description: ""
    type: yesno
    sql: ${TABLE}.enable_preview_mode_banner ;;
    hidden: no
  }

  dimension: push_notification_contents {
    description: ""
    type: string
    sql: ${TABLE}.push_notification_contents ;;
    hidden: no
  }

  dimension: isdefault_feedback_email {
    description: ""
    type: yesno
    sql: ${TABLE}.isdefault_feedback_email ;;
    hidden: no
  }

  dimension: enforce_multifactor_authentication {
    description: ""
    type: yesno
    sql: ${TABLE}.enforce_multifactor_authentication ;;
    hidden: no
  }

  dimension: allow_email_accounts {
    description: ""
    type: yesno
    sql: ${TABLE}.allow_email_accounts ;;
    hidden: no
  }

  dimension: isdefault_restrict_creation_to_domains {
    description: ""
    type: yesno
    sql: ${TABLE}.isdefault_restrict_creation_to_domains ;;
    hidden: no
  }

  dimension: default_client_locale {
    description: ""
    type: string
    sql: ${TABLE}.default_client_locale ;;
    hidden: no
  }

  dimension: default_server_locale {
    description: ""
    type: string
    sql: ${TABLE}.default_server_locale ;;
    hidden: no
  }

  dimension: available_locales {
    description: ""
    type: string
    sql: ${TABLE}.available_locales ;;
    hidden: no
  }

  dimension: enable_uploads {
    description: ""
    type: yesno
    sql: ${TABLE}.enable_uploads ;;
    hidden: no
  }

  dimension: enable_autolink {
    description: ""
    type: yesno
    sql: ${TABLE}.enable_autolink ;;
    hidden: no
  }

  dimension: version_welcome_bot {
    description: ""
    type: string
    sql: ${TABLE}.version_welcome_bot ;;
    hidden: no
  }

  dimension: enable_aws_sns {
    description: ""
    type: yesno
    sql: ${TABLE}.enable_aws_sns ;;
    hidden: no
  }

  dimension: enable_jenkins {
    description: ""
    type: yesno
    sql: ${TABLE}.enable_jenkins ;;
    hidden: no
  }

  dimension: allow_insecure_download_url {
    description: ""
    type: yesno
    sql: ${TABLE}.allow_insecure_download_url ;;
    hidden: no
  }

  dimension: enable_nps_survey {
    description: ""
    type: yesno
    sql: ${TABLE}.enable_nps_survey ;;
    hidden: no
  }

  dimension: enable_antivirus {
    description: ""
    type: yesno
    sql: ${TABLE}.enable_antivirus ;;
    hidden: no
  }

  dimension: enable_zoom {
    description: ""
    type: yesno
    sql: ${TABLE}.enable_zoom ;;
    hidden: no
  }

  dimension: enable_remote_marketplace {
    description: ""
    type: yesno
    sql: ${TABLE}.enable_remote_marketplace ;;
    hidden: no
  }

  dimension: enable_webex {
    description: ""
    type: yesno
    sql: ${TABLE}.enable_webex ;;
    hidden: no
  }

  dimension: enable_custom_user_attributes {
    description: ""
    type: yesno
    sql: ${TABLE}.enable_custom_user_attributes ;;
    hidden: no
  }

  dimension: enable_nps {
    description: ""
    type: yesno
    sql: ${TABLE}.enable_nps ;;
    hidden: no
  }

  dimension: enable_github {
    description: ""
    type: yesno
    sql: ${TABLE}.enable_github ;;
    hidden: no
  }

  dimension: enable_health_check {
    description: ""
    type: yesno
    sql: ${TABLE}.enable_health_check ;;
    hidden: no
  }

  dimension: version_aws_sns {
    description: ""
    type: string
    sql: ${TABLE}.version_aws_sns ;;
    hidden: no
  }

  dimension: enable_gitlab {
    description: ""
    type: yesno
    sql: ${TABLE}.enable_gitlab ;;
    hidden: no
  }

  dimension: automatic_prepackaged_plugins {
    description: ""
    type: yesno
    sql: ${TABLE}.automatic_prepackaged_plugins ;;
    hidden: no
  }

  dimension: version_jenkins {
    description: ""
    type: string
    sql: ${TABLE}.version_jenkins ;;
    hidden: no
  }

  dimension: version_webex {
    description: ""
    type: string
    sql: ${TABLE}.version_webex ;;
    hidden: no
  }

  dimension: version_jira {
    description: ""
    type: string
    sql: ${TABLE}.version_jira ;;
    hidden: no
  }

  dimension: version_github {
    description: ""
    type: string
    sql: ${TABLE}.version_github ;;
    hidden: no
  }

  dimension: is_default_marketplace_url {
    description: ""
    type: yesno
    sql: ${TABLE}.is_default_marketplace_url ;;
    hidden: no
  }

  dimension: version_antivirus {
    description: ""
    type: string
    sql: ${TABLE}.version_antivirus ;;
    hidden: no
  }

  dimension: version_nps {
    description: ""
    type: string
    sql: ${TABLE}.version_nps ;;
    hidden: no
  }

  dimension: version_autolink {
    description: ""
    type: string
    sql: ${TABLE}.version_autolink ;;
    hidden: no
  }

  dimension: enable_welcome_bot {
    description: ""
    type: yesno
    sql: ${TABLE}.enable_welcome_bot ;;
    hidden: no
  }

  dimension: require_pluginsignature {
    description: ""
    type: yesno
    sql: ${TABLE}.require_pluginsignature ;;
    hidden: no
  }

  dimension: version_zoom {
    description: ""
    type: string
    sql: ${TABLE}.version_zoom ;;
    hidden: no
  }

  dimension: signature_public_key_files {
    description: ""
    type: number
    sql: ${TABLE}.signature_public_key_files ;;
    hidden: no
  }

  dimension: enable_jira {
    description: ""
    type: yesno
    sql: ${TABLE}.enable_jira ;;
    hidden: no
  }

  dimension: version_gitlab {
    description: ""
    type: string
    sql: ${TABLE}.version_gitlab ;;
    hidden: no
  }

  dimension: version_custom_user_attributes {
    description: ""
    type: string
    sql: ${TABLE}.version_custom_user_attributes ;;
    hidden: no
  }

  dimension: enable_marketplace {
    description: ""
    type: yesno
    sql: ${TABLE}.enable_marketplace ;;
    hidden: no
  }

  dimension: enable_jitsi {
    description: ""
    type: yesno
    sql: ${TABLE}.enable_jitsi ;;
    hidden: no
  }

  dimension: enable_todo {
    description: ""
    type: yesno
    sql: ${TABLE}.enable_todo ;;
    hidden: no
  }

  dimension: enable_confluence {
    description: ""
    type: yesno
    sql: ${TABLE}.enable_confluence ;;
    hidden: no
  }

  dimension: enable_skype4business {
    description: ""
    type: yesno
    sql: ${TABLE}.enable_skype4business ;;
    hidden: no
  }

  dimension: enable_mscalendar {
    description: ""
    type: yesno
    sql: ${TABLE}.enable_mscalendar ;;
    hidden: no
  }

  dimension: phase_1_migration_complete {
    description: ""
    type: yesno
    sql: ${TABLE}.phase_1_migration_complete ;;
    hidden: no
  }

  dimension: phase_2_migration_complete {
    description: ""
    type: yesno
    sql: ${TABLE}.phase_2_migration_complete ;;
    hidden: no
  }

  dimension: team_user_permissions {
    description: ""
    type: string
    sql: ${TABLE}.team_user_permissions ;;
    hidden: no
  }

  dimension: team_admin_permissions {
    description: ""
    type: string
    sql: ${TABLE}.team_admin_permissions ;;
    hidden: no
  }

  dimension: channel_guest_permissions {
    description: ""
    type: string
    sql: ${TABLE}.channel_guest_permissions ;;
    hidden: no
  }

  dimension: system_user_permissions {
    description: ""
    type: string
    sql: ${TABLE}.system_user_permissions ;;
    hidden: no
  }

  dimension: channel_user_permissions {
    description: ""
    type: string
    sql: ${TABLE}.channel_user_permissions ;;
    hidden: no
  }

  dimension: system_admin_permissions {
    description: ""
    type: string
    sql: ${TABLE}.system_admin_permissions ;;
    hidden: no
  }

  dimension: channel_admin_permissions {
    description: ""
    type: string
    sql: ${TABLE}.channel_admin_permissions ;;
    hidden: no
  }

  dimension: team_guest_permissions {
    description: ""
    type: string
    sql: ${TABLE}.team_guest_permissions ;;
    hidden: no
  }

  dimension: scheme_id {
    description: ""
    type: string
    sql: ${TABLE}.scheme_id ;;
    hidden: no
  }

  dimension: team_count {
    description: ""
    type: number
    sql: ${TABLE}.team_count ;;
    hidden: no
  }

  dimension: isdefault_max_users_for_statistics {
    description: ""
    type: yesno
    sql: ${TABLE}.isdefault_max_users_for_statistics ;;
    hidden: no
  }

  dimension: enable_google {
    description: ""
    type: yesno
    sql: ${TABLE}.enable_google ;;
    hidden: no
  }

  dimension: enable_office365 {
    description: ""
    type: yesno
    sql: ${TABLE}.enable_office365 ;;
    hidden: no
  }

  dimension: isdefault_scoping_idp_provider_id {
    description: ""
    type: yesno
    sql: ${TABLE}.isdefault_scoping_idp_provider_id ;;
    hidden: no
  }

  dimension: verify {
    description: ""
    type: yesno
    sql: ${TABLE}.verify ;;
    hidden: no
  }

  dimension: enable_admin_attribute {
    description: ""
    type: yesno
    sql: ${TABLE}.enable_admin_attribute ;;
    hidden: no
  }

  dimension: isdefault_signature_algorithm {
    description: ""
    type: yesno
    sql: ${TABLE}.isdefault_signature_algorithm ;;
    hidden: no
  }

  dimension: isdefault_locale_attribute {
    description: ""
    type: yesno
    sql: ${TABLE}.isdefault_locale_attribute ;;
    hidden: no
  }

  dimension: enable_sync_with_ldap_include_auth {
    description: ""
    type: yesno
    sql: ${TABLE}.enable_sync_with_ldap_include_auth ;;
    hidden: no
  }

  dimension: encrypt {
    description: ""
    type: yesno
    sql: ${TABLE}.encrypt ;;
    hidden: no
  }

  dimension: enable_sync_with_ldap {
    description: ""
    type: yesno
    sql: ${TABLE}.enable_sync_with_ldap ;;
    hidden: no
  }

  dimension: isdefault_guest_attribute {
    description: ""
    type: yesno
    sql: ${TABLE}.isdefault_guest_attribute ;;
    hidden: no
  }

  dimension: isdefault_login_button_text {
    description: ""
    type: yesno
    sql: ${TABLE}.isdefault_login_button_text ;;
    hidden: no
  }

  dimension: isdefault_canonical_algorithm {
    description: ""
    type: yesno
    sql: ${TABLE}.isdefault_canonical_algorithm ;;
    hidden: no
  }

  dimension: isdefault_scoping_idp_name {
    description: ""
    type: yesno
    sql: ${TABLE}.isdefault_scoping_idp_name ;;
    hidden: no
  }

  dimension: isdefault_admin_attribute {
    description: ""
    type: yesno
    sql: ${TABLE}.isdefault_admin_attribute ;;
    hidden: no
  }

  dimension: sign_request {
    description: ""
    type: yesno
    sql: ${TABLE}.sign_request ;;
    hidden: no
  }

  dimension: isdefault_support_email {
    description: ""
    type: yesno
    sql: ${TABLE}.isdefault_support_email ;;
    hidden: no
  }

  dimension: isdefault_privacy_policy_link {
    description: ""
    type: yesno
    sql: ${TABLE}.isdefault_privacy_policy_link ;;
    hidden: no
  }

  dimension: isdefault_help_link {
    description: ""
    type: yesno
    sql: ${TABLE}.isdefault_help_link ;;
    hidden: no
  }

  dimension: isdefault_about_link {
    description: ""
    type: yesno
    sql: ${TABLE}.isdefault_about_link ;;
    hidden: no
  }

  dimension: isdefault_terms_of_service_link {
    description: ""
    type: yesno
    sql: ${TABLE}.isdefault_terms_of_service_link ;;
    hidden: no
  }

  dimension: custom_terms_of_service_enabled {
    description: ""
    type: yesno
    sql: ${TABLE}.custom_terms_of_service_enabled ;;
    hidden: no
  }

  dimension: isdefault_report_a_problem_link {
    description: ""
    type: yesno
    sql: ${TABLE}.isdefault_report_a_problem_link ;;
    hidden: no
  }

  dimension: custom_terms_of_service_re_acceptance_period {
    description: ""
    type: number
    sql: ${TABLE}.custom_terms_of_service_re_acceptance_period ;;
    hidden: no
  }

  dimension: elasticsearch_server_version {
    description: ""
    type: number
    sql: ${TABLE}.elasticsearch_server_version ;;
    hidden: no
  }

  dimension: feature_elastic_search {
    description: ""
    type: yesno
    sql: ${TABLE}.feature_elastic_search ;;
    hidden: no
  }

  dimension: feature_mfa {
    description: ""
    type: yesno
    sql: ${TABLE}.feature_mfa ;;
    hidden: no
  }

  dimension: feature_google {
    description: ""
    type: yesno
    sql: ${TABLE}.feature_google ;;
    hidden: no
  }

  dimension: feature_guest_accounts_permissions {
    description: ""
    type: yesno
    sql: ${TABLE}.feature_guest_accounts_permissions ;;
    hidden: no
  }

  dimension: feature_compliance {
    description: ""
    type: yesno
    sql: ${TABLE}.feature_compliance ;;
    hidden: no
  }

  dimension: feature_saml {
    description: ""
    type: yesno
    sql: ${TABLE}.feature_saml ;;
    hidden: no
  }

  dimension: customer_id {
    description: ""
    type: string
    sql: ${TABLE}.customer_id ;;
    hidden: no
  }

  dimension: feature_ldap_groups {
    description: ""
    type: yesno
    sql: ${TABLE}.feature_ldap_groups ;;
    hidden: no
  }

  dimension: feature_guest_accounts {
    description: ""
    type: yesno
    sql: ${TABLE}.feature_guest_accounts ;;
    hidden: no
  }

  dimension: users {
    description: ""
    type: number
    sql: ${TABLE}.users ;;
    hidden: no
  }

  dimension: feature_metrics {
    description: ""
    type: yesno
    sql: ${TABLE}.feature_metrics ;;
    hidden: no
  }

  dimension: feature_future {
    description: ""
    type: yesno
    sql: ${TABLE}.feature_future ;;
    hidden: no
  }

  dimension: feature_email_notification_contents {
    description: ""
    type: yesno
    sql: ${TABLE}.feature_email_notification_contents ;;
    hidden: no
  }

  dimension: feature_lock_teammate_name_display {
    description: ""
    type: yesno
    sql: ${TABLE}.feature_lock_teammate_name_display ;;
    hidden: no
  }

  dimension: expire {
    description: ""
    type: number
    sql: ${TABLE}.expire ;;
    hidden: no
  }

  dimension: feature_office365 {
    description: ""
    type: yesno
    sql: ${TABLE}.feature_office365 ;;
    hidden: no
  }

  dimension: feature_ldap {
    description: ""
    type: yesno
    sql: ${TABLE}.feature_ldap ;;
    hidden: no
  }

  dimension: feature_mhpns {
    description: ""
    type: yesno
    sql: ${TABLE}.feature_mhpns ;;
    hidden: no
  }

  dimension: feature_custom_permissions_schemes {
    description: ""
    type: yesno
    sql: ${TABLE}.feature_custom_permissions_schemes ;;
    hidden: no
  }

  dimension: feature_message_export {
    description: ""
    type: yesno
    sql: ${TABLE}.feature_message_export ;;
    hidden: no
  }

  dimension: feature_id_loaded {
    description: ""
    type: yesno
    sql: ${TABLE}.feature_id_loaded ;;
    hidden: no
  }

  dimension: license_id {
    description: ""
    type: string
    sql: ${TABLE}.license_id ;;
    hidden: no
  }

  dimension: feature_data_retention {
    description: ""
    type: yesno
    sql: ${TABLE}.feature_data_retention ;;
    hidden: no
  }

  dimension: feature_cluster {
    description: ""
    type: yesno
    sql: ${TABLE}.feature_cluster ;;
    hidden: no
  }

  dimension: issued {
    description: ""
    type: number
    sql: ${TABLE}.issued ;;
    hidden: no
  }

  dimension: _start {
    description: ""
    type: number
    sql: ${TABLE}._start ;;
    hidden: no
  }

  dimension: feature_enterprise_plugins {
    description: ""
    type: yesno
    sql: ${TABLE}.feature_enterprise_plugins ;;
    hidden: no
  }

  dimension: image_proxy_type {
    description: ""
    type: string
    sql: ${TABLE}.image_proxy_type ;;
    hidden: no
  }

  dimension: isdefault_remote_image_proxy_url {
    description: ""
    type: yesno
    sql: ${TABLE}.isdefault_remote_image_proxy_url ;;
    hidden: no
  }

  dimension: isdefault_remote_image_proxy_options {
    description: ""
    type: yesno
    sql: ${TABLE}.isdefault_remote_image_proxy_options ;;
    hidden: no
  }

  dimension: allow_edit_post {
    description: ""
    type: string
    sql: ${TABLE}.allow_edit_post ;;
    hidden: no
  }

  dimension: gfycat_api_secret {
    description: ""
    type: yesno
    sql: ${TABLE}.gfycat_api_secret ;;
    hidden: no
  }

  dimension: web_server_mode {
    description: ""
    type: string
    sql: ${TABLE}.web_server_mode ;;
    hidden: no
  }

  dimension: enable_email_invitations {
    description: ""
    type: yesno
    sql: ${TABLE}.enable_email_invitations ;;
    hidden: no
  }

  dimension: enable_insecure_outgoing_connections {
    description: ""
    type: yesno
    sql: ${TABLE}.enable_insecure_outgoing_connections ;;
    hidden: no
  }

  dimension: enable_developer {
    description: ""
    type: yesno
    sql: ${TABLE}.enable_developer ;;
    hidden: no
  }

  dimension: enable_emoji_picker {
    description: ""
    type: yesno
    sql: ${TABLE}.enable_emoji_picker ;;
    hidden: no
  }

  dimension: cors_allow_credentials {
    description: ""
    type: yesno
    sql: ${TABLE}.cors_allow_credentials ;;
    hidden: no
  }

  dimension: isdefault_idle_timeout {
    description: ""
    type: yesno
    sql: ${TABLE}.isdefault_idle_timeout ;;
    hidden: no
  }

  dimension: enable_post_icon_override {
    description: ""
    type: yesno
    sql: ${TABLE}.enable_post_icon_override ;;
    hidden: no
  }

  dimension: enable_testing {
    description: ""
    type: yesno
    sql: ${TABLE}.enable_testing ;;
    hidden: no
  }

  dimension: enable_bot_account_creation {
    description: ""
    type: yesno
    sql: ${TABLE}.enable_bot_account_creation ;;
    hidden: no
  }

  dimension: experimental_group_unread_channels {
    description: ""
    type: string
    sql: ${TABLE}.experimental_group_unread_channels ;;
    hidden: no
  }

  dimension: post_edit_time_limit {
    description: ""
    type: number
    sql: ${TABLE}.post_edit_time_limit ;;
    hidden: no
  }

  dimension: isdefault_google_developer_key {
    description: ""
    type: yesno
    sql: ${TABLE}.isdefault_google_developer_key ;;
    hidden: no
  }

  dimension: disable_legacy_mfa {
    description: ""
    type: yesno
    sql: ${TABLE}.disable_legacy_mfa ;;
    hidden: no
  }

  dimension: enable_multifactor_authentication {
    description: ""
    type: yesno
    sql: ${TABLE}.enable_multifactor_authentication ;;
    hidden: no
  }

  dimension: experimental_strict_csrf_enforcement {
    description: ""
    type: yesno
    sql: ${TABLE}.experimental_strict_csrf_enforcement ;;
    hidden: no
  }

  dimension: isdefault_tls_cert_file {
    description: ""
    type: yesno
    sql: ${TABLE}.isdefault_tls_cert_file ;;
    hidden: no
  }

  dimension: isdefault_allow_cors_from {
    description: ""
    type: yesno
    sql: ${TABLE}.isdefault_allow_cors_from ;;
    hidden: no
  }

  dimension: gfycat_api_key {
    description: ""
    type: yesno
    sql: ${TABLE}.gfycat_api_key ;;
    hidden: no
  }

  dimension: allow_cookies_for_subdomains {
    description: ""
    type: yesno
    sql: ${TABLE}.allow_cookies_for_subdomains ;;
    hidden: no
  }

  dimension: enable_preview_features {
    description: ""
    type: yesno
    sql: ${TABLE}.enable_preview_features ;;
    hidden: no
  }

  dimension: uses_letsencrypt {
    description: ""
    type: yesno
    sql: ${TABLE}.uses_letsencrypt ;;
    hidden: no
  }

  dimension: disable_bots_when_owner_is_deactivated {
    description: ""
    type: yesno
    sql: ${TABLE}.disable_bots_when_owner_is_deactivated ;;
    hidden: no
  }

  dimension: enable_custom_emoji {
    description: ""
    type: yesno
    sql: ${TABLE}.enable_custom_emoji ;;
    hidden: no
  }

  dimension: session_length_web_in_days {
    description: ""
    type: number
    sql: ${TABLE}.session_length_web_in_days ;;
    hidden: no
  }

  dimension: experimental_enable_hardened_mode {
    description: ""
    type: yesno
    sql: ${TABLE}.experimental_enable_hardened_mode ;;
    hidden: no
  }

  dimension: minimum_hashtag_length {
    description: ""
    type: number
    sql: ${TABLE}.minimum_hashtag_length ;;
    hidden: no
  }

  dimension: enable_outgoing_webhooks {
    description: ""
    type: yesno
    sql: ${TABLE}.enable_outgoing_webhooks ;;
    hidden: no
  }

  dimension: enable_commands {
    description: ""
    type: yesno
    sql: ${TABLE}.enable_commands ;;
    hidden: no
  }

  dimension: enable_latex {
    description: ""
    type: yesno
    sql: ${TABLE}.enable_latex ;;
    hidden: no
  }

  dimension: isdefault_read_timeout {
    description: ""
    type: yesno
    sql: ${TABLE}.isdefault_read_timeout ;;
    hidden: no
  }

  dimension: maximum_login_attempts {
    description: ""
    type: number
    sql: ${TABLE}.maximum_login_attempts ;;
    hidden: no
  }

  dimension: enable_post_username_override {
    description: ""
    type: yesno
    sql: ${TABLE}.enable_post_username_override ;;
    hidden: no
  }

  dimension: websocket_url {
    description: ""
    type: yesno
    sql: ${TABLE}.websocket_url ;;
    hidden: no
  }

  dimension: enable_user_typing_messages {
    description: ""
    type: yesno
    sql: ${TABLE}.enable_user_typing_messages ;;
    hidden: no
  }

  dimension: enable_tutorial {
    description: ""
    type: yesno
    sql: ${TABLE}.enable_tutorial ;;
    hidden: no
  }

  dimension: restrict_post_delete {
    description: ""
    type: string
    sql: ${TABLE}.restrict_post_delete ;;
    hidden: no
  }

  dimension: session_idle_timeout_in_minutes {
    description: ""
    type: number
    sql: ${TABLE}.session_idle_timeout_in_minutes ;;
    hidden: no
  }

  dimension: close_unused_direct_messages {
    description: ""
    type: yesno
    sql: ${TABLE}.close_unused_direct_messages ;;
    hidden: no
  }

  dimension: enable_user_access_tokens {
    description: ""
    type: yesno
    sql: ${TABLE}.enable_user_access_tokens ;;
    hidden: no
  }

  dimension: time_between_user_typing_updates_milliseconds {
    description: ""
    type: number
    sql: ${TABLE}.time_between_user_typing_updates_milliseconds ;;
    hidden: no
  }

  dimension: enable_api_team_deletion {
    description: ""
    type: yesno
    sql: ${TABLE}.enable_api_team_deletion ;;
    hidden: no
  }

  dimension: enable_opentracing {
    description: ""
    type: yesno
    sql: ${TABLE}.enable_opentracing ;;
    hidden: no
  }

  dimension: enable_user_statuses {
    description: ""
    type: yesno
    sql: ${TABLE}.enable_user_statuses ;;
    hidden: no
  }

  dimension: enable_post_search {
    description: ""
    type: yesno
    sql: ${TABLE}.enable_post_search ;;
    hidden: no
  }

  dimension: isdefault_site_url {
    description: ""
    type: yesno
    sql: ${TABLE}.isdefault_site_url ;;
    hidden: no
  }

  dimension: isdefault_tls_key_file {
    description: ""
    type: yesno
    sql: ${TABLE}.isdefault_tls_key_file ;;
    hidden: no
  }

  dimension: experimental_channel_sidebar_organization {
    description: ""
    type: string
    sql: ${TABLE}.experimental_channel_sidebar_organization ;;
    hidden: no
  }

  dimension: cluster_log_timeout_milliseconds {
    description: ""
    type: number
    sql: ${TABLE}.cluster_log_timeout_milliseconds ;;
    hidden: no
  }

  dimension: experimental_enable_default_channel_leave_join_messages {
    description: ""
    type: yesno
    sql: ${TABLE}.experimental_enable_default_channel_leave_join_messages ;;
    hidden: no
  }

  dimension: enable_channel_viewed_messages {
    description: ""
    type: yesno
    sql: ${TABLE}.enable_channel_viewed_messages ;;
    hidden: no
  }

  dimension: isdefault_write_timeout {
    description: ""
    type: yesno
    sql: ${TABLE}.isdefault_write_timeout ;;
    hidden: no
  }

  dimension: enable_incoming_webhooks {
    description: ""
    type: yesno
    sql: ${TABLE}.enable_incoming_webhooks ;;
    hidden: no
  }

  dimension: isdefault_allowed_untrusted_internal_connections {
    description: ""
    type: yesno
    sql: ${TABLE}.isdefault_allowed_untrusted_internal_connections ;;
    hidden: no
  }

  dimension: session_cache_in_minutes {
    description: ""
    type: number
    sql: ${TABLE}.session_cache_in_minutes ;;
    hidden: no
  }

  dimension: experimental_channel_organization {
    description: ""
    type: yesno
    sql: ${TABLE}.experimental_channel_organization ;;
    hidden: no
  }

  dimension: enable_oauth_service_provider {
    description: ""
    type: yesno
    sql: ${TABLE}.enable_oauth_service_provider ;;
    hidden: no
  }

  dimension: restrict_custom_emoji_creation {
    description: ""
    type: string
    sql: ${TABLE}.restrict_custom_emoji_creation ;;
    hidden: no
  }

  dimension: enable_only_admin_integrations {
    description: ""
    type: yesno
    sql: ${TABLE}.enable_only_admin_integrations ;;
    hidden: no
  }

  dimension: enable_gif_picker {
    description: ""
    type: yesno
    sql: ${TABLE}.enable_gif_picker ;;
    hidden: no
  }

  dimension: enable_security_fix_alert {
    description: ""
    type: yesno
    sql: ${TABLE}.enable_security_fix_alert ;;
    hidden: no
  }

  dimension: session_length_mobile_in_days {
    description: ""
    type: number
    sql: ${TABLE}.session_length_mobile_in_days ;;
    hidden: no
  }

  dimension: forward_80_to_443 {
    description: ""
    type: yesno
    sql: ${TABLE}.forward_80_to_443 ;;
    hidden: no
  }

  dimension: session_length_sso_in_days {
    description: ""
    type: number
    sql: ${TABLE}.session_length_sso_in_days ;;
    hidden: no
  }

  dimension: enable_svgs {
    description: ""
    type: yesno
    sql: ${TABLE}.enable_svgs ;;
    hidden: no
  }

  dimension: tls_strict_transport {
    description: ""
    type: yesno
    sql: ${TABLE}.tls_strict_transport ;;
    hidden: no
  }

  dimension: experimental_enable_authentication_transfer {
    description: ""
    type: yesno
    sql: ${TABLE}.experimental_enable_authentication_transfer ;;
    hidden: no
  }

  dimension: isdefault_cors_exposed_headers {
    description: ""
    type: yesno
    sql: ${TABLE}.isdefault_cors_exposed_headers ;;
    hidden: no
  }

  dimension: cors_debug {
    description: ""
    type: yesno
    sql: ${TABLE}.cors_debug ;;
    hidden: no
  }

  dimension: experimental_data_prefetch {
    description: ""
    type: yesno
    sql: ${TABLE}.experimental_data_prefetch ;;
    hidden: no
  }

  dimension: extend_session_length_with_activity {
    description: ""
    type: yesno
    sql: ${TABLE}.extend_session_length_with_activity ;;
    hidden: no
  }

  dimension: enable_local_mode {
    description: ""
    type: yesno
    sql: ${TABLE}.enable_local_mode ;;
    hidden: no
  }

  dimension: enable_click_to_reply {
    description: ""
    type: yesno
    sql: ${TABLE}.enable_click_to_reply ;;
    hidden: no
  }

  dimension: client_side_cert_enable {
    description: ""
    type: yesno
    sql: ${TABLE}.client_side_cert_enable ;;
    hidden: no
  }

  dimension: link_metadata_timeout_milliseconds {
    description: ""
    type: number
    sql: ${TABLE}.link_metadata_timeout_milliseconds ;;
    hidden: no
  }

  dimension: use_new_saml_library {
    description: ""
    type: yesno
    sql: ${TABLE}.use_new_saml_library ;;
    hidden: no
  }

  dimension: restrict_system_admin {
    description: ""
    type: yesno
    sql: ${TABLE}.restrict_system_admin ;;
    hidden: no
  }

  dimension: isdefault_client_side_cert_check {
    description: ""
    type: yesno
    sql: ${TABLE}.isdefault_client_side_cert_check ;;
    hidden: no
  }

  dimension: properties {
    sql: OBJECT_CONSTRUCT(server_telemetry.*) ;;
    html:
    {% assign words = {{value}} | replace: '}', '' | replace: '{', '' | replace: ', ', '; ' | split: ',' %}
    <ul>
    {% for word in words %}
    <li>{{ word }}</li>
    {% endfor %} ;;
    link: {
      label: "Filter Dashboard (Source Relation = {{ _dbt_source_relation._value }})"
      url: "/dashboards/187?Data%20Source%20(RC%20vs.%20QA)={{ _dbt_source_relation._value }}"
    }
    link: {
      label: "Filter Dashboard (Telemetry Source = {{ telemetry_relation._value }})"
      url: "/dashboards/187?Server%20Telemetry%20Table={{ telemetry_relation._value }}"
    }
    link: {
      label: "Filter Dashboard (User ID = {{ user_id._value}})"
      url: "/dashboards/187?Server%20ID%20(User%20ID)={{ user_id._value }}"
    }
    link: {
      label: "Filter Dashboard (Server Version = {{ server_version.version._value}})"
      url: "/dashboards/187?Server%20Version={{ server_version.version._value }}"
    }
    link: {
      label: "Filter Dashboard (License ID = {{ server_license.license_id._value}})"
      url: "/dashboards/187?License%20ID={{ server_license.license_id._value }}"
    }
    link: {
      label: "Clear Dashboard Filters"
      url: "/dashboards/187"
    }
  }


  # DIMENSION GROUPS/DATES
  dimension_group: received_at {
    label:  " Received At"
    description: "The Received At date time field."
    type: time
    timeframes: [second, date, week, month, year, fiscal_year, fiscal_quarter]
    sql: ${TABLE}.received_at ;;
    hidden: no
  }

  dimension_group: uuid_ts {
    label:  " Uuid Ts"
    description: "The Uuid Ts date time field."
    type: time
    timeframes: [second, date, week, month, year, fiscal_year, fiscal_quarter]
    sql: ${TABLE}.uuid_ts ;;
    hidden: no
  }

  dimension_group: timestamp {
    label:  " Timestamp"
    description: "The Timestamp date time field."
    type: time
    timeframes: [second, date, week, month, year, fiscal_year, fiscal_quarter]
    sql: ${TABLE}.timestamp ;;
    hidden: no
  }

  dimension_group: sent_at {
    label:  " Sent At"
    description: "The Sent At date time field."
    type: time
    timeframes: [second, date, week, month, year, fiscal_year, fiscal_quarter]
    sql: ${TABLE}.sent_at ;;
    hidden: no
  }

  dimension_group: original_timestamp {
    label:  " Original Timestamp"
    description: "The Original Timestamp date time field."
    type: time
    timeframes: [second, date, week, month, year, fiscal_year, fiscal_quarter]
    sql: ${TABLE}.original_timestamp ;;
    hidden: no
  }


  # MEASURES
  measure: count {
    label: " Count"
    description: "Count of rows/occurrences."
    type: count
  }

  measure: _dbt_source_relation_count {
    label: " Dbt Source Relation Count (Distinct)"
    description: "The distinct count of  dbt source relation's per grouping."
    type: count_distinct
    sql: ${_dbt_source_relation} ;;
  }

  measure: _dbt_source_relation_count_all {
    label: " Dbt Source Relation Count"
    description: "The count of all non-null  dbt source relation occurrences per grouping."
    type: number
    sql: COUNT(case when ${_dbt_source_relation} IS NOT NULL then ${_dbt_source_relation} else null end) ;;
  }

  measure: incoming_webhooks_count {
    label: "Incoming Webhooks Count (Distinct)"
    description: "The distinct count of incoming webhooks's per grouping."
    type: count_distinct
    sql: ${incoming_webhooks} ;;
  }

  measure: incoming_webhooks_count_all {
    label: "Incoming Webhooks Count"
    description: "The count of all non-null incoming webhooks occurrences per grouping."
    type: number
    sql: COUNT(case when ${incoming_webhooks} IS NOT NULL then ${incoming_webhooks} else null end) ;;
  }

  measure: received_at_date_count {
    label: "Received At Date Count (Distinct)"
    description: "The distinct count of received at date's per grouping."
    type: count_distinct
    sql: ${received_at_date} ;;
  }

  measure: received_at_date_count_all {
    label: "Received At Date Count"
    description: "The count of all non-null received at date occurrences per grouping."
    type: number
    sql: COUNT(case when ${received_at_date} IS NOT NULL then ${received_at_date} else null end) ;;
  }

  measure: private_channels_count {
    label: "Private Channels Count (Distinct)"
    description: "The distinct count of private channels's per grouping."
    type: count_distinct
    sql: ${private_channels} ;;
  }

  measure: private_channels_count_all {
    label: "Private Channels Count"
    description: "The count of all non-null private channels occurrences per grouping."
    type: number
    sql: COUNT(case when ${private_channels} IS NOT NULL then ${private_channels} else null end) ;;
  }

  measure: public_channels_count {
    label: "Public Channels Count (Distinct)"
    description: "The distinct count of public channels's per grouping."
    type: count_distinct
    sql: ${public_channels} ;;
  }

  measure: public_channels_count_all {
    label: "Public Channels Count"
    description: "The count of all non-null public channels occurrences per grouping."
    type: number
    sql: COUNT(case when ${public_channels} IS NOT NULL then ${public_channels} else null end) ;;
  }

  measure: registered_users_count {
    label: "Registered Users Count (Distinct)"
    description: "The distinct count of registered users's per grouping."
    type: count_distinct
    sql: ${registered_users} ;;
  }

  measure: registered_users_count_all {
    label: "Registered Users Count"
    description: "The count of all non-null registered users occurrences per grouping."
    type: number
    sql: COUNT(case when ${registered_users} IS NOT NULL then ${registered_users} else null end) ;;
  }

  measure: registered_deactivated_users_count {
    label: "Registered Deactivated Users Count (Distinct)"
    description: "The distinct count of registered deactivated users's per grouping."
    type: count_distinct
    sql: ${registered_deactivated_users} ;;
  }

  measure: registered_deactivated_users_count_all {
    label: "Registered Deactivated Users Count"
    description: "The count of all non-null registered deactivated users occurrences per grouping."
    type: number
    sql: COUNT(case when ${registered_deactivated_users} IS NOT NULL then ${registered_deactivated_users} else null end) ;;
  }

  measure: uuid_ts_date_count {
    label: "Uuid Ts Date Count (Distinct)"
    description: "The distinct count of uuid ts date's per grouping."
    type: count_distinct
    sql: ${uuid_ts_date} ;;
  }

  measure: uuid_ts_date_count_all {
    label: "Uuid Ts Date Count"
    description: "The count of all non-null uuid ts date occurrences per grouping."
    type: number
    sql: COUNT(case when ${uuid_ts_date} IS NOT NULL then ${uuid_ts_date} else null end) ;;
  }

  measure: active_users_daily_count {
    label: "Active Users Daily Count (Distinct)"
    description: "The distinct count of active users daily's per grouping."
    type: count_distinct
    sql: ${active_users_daily} ;;
  }

  measure: active_users_daily_count_all {
    label: "Active Users Daily Count"
    description: "The count of all non-null active users daily occurrences per grouping."
    type: number
    sql: COUNT(case when ${active_users_daily} IS NOT NULL then ${active_users_daily} else null end) ;;
  }

  measure: timestamp_date_count {
    label: "Timestamp Date Count (Distinct)"
    description: "The distinct count of timestamp date's per grouping."
    type: count_distinct
    sql: ${timestamp_date} ;;
  }

  measure: timestamp_date_count_all {
    label: "Timestamp Date Count"
    description: "The count of all non-null timestamp date occurrences per grouping."
    type: number
    sql: COUNT(case when ${timestamp_date} IS NOT NULL then ${timestamp_date} else null end) ;;
  }

  measure: public_channels_deleted_count {
    label: "Public Channels Deleted Count (Distinct)"
    description: "The distinct count of public channels deleted's per grouping."
    type: count_distinct
    sql: ${public_channels_deleted} ;;
  }

  measure: public_channels_deleted_count_all {
    label: "Public Channels Deleted Count"
    description: "The count of all non-null public channels deleted occurrences per grouping."
    type: number
    sql: COUNT(case when ${public_channels_deleted} IS NOT NULL then ${public_channels_deleted} else null end) ;;
  }

  measure: posts_count {
    label: "Posts Count (Distinct)"
    description: "The distinct count of posts's per grouping."
    type: count_distinct
    sql: ${posts} ;;
  }

  measure: posts_count_all {
    label: "Posts Count"
    description: "The count of all non-null posts occurrences per grouping."
    type: number
    sql: COUNT(case when ${posts} IS NOT NULL then ${posts} else null end) ;;
  }

  measure: sent_at_date_count {
    label: "Sent At Date Count (Distinct)"
    description: "The distinct count of sent at date's per grouping."
    type: count_distinct
    sql: ${sent_at_date} ;;
  }

  measure: sent_at_date_count_all {
    label: "Sent At Date Count"
    description: "The count of all non-null sent at date occurrences per grouping."
    type: number
    sql: COUNT(case when ${sent_at_date} IS NOT NULL then ${sent_at_date} else null end) ;;
  }

  measure: posts_previous_day_count {
    label: "Posts Previous Day Count (Distinct)"
    description: "The distinct count of posts previous day's per grouping."
    type: count_distinct
    sql: ${posts_previous_day} ;;
  }

  measure: posts_previous_day_count_all {
    label: "Posts Previous Day Count"
    description: "The count of all non-null posts previous day occurrences per grouping."
    type: number
    sql: COUNT(case when ${posts_previous_day} IS NOT NULL then ${posts_previous_day} else null end) ;;
  }

  measure: event_text_count {
    label: "Event Text Count (Distinct)"
    description: "The distinct count of event text's per grouping."
    type: count_distinct
    sql: ${event_text} ;;
  }

  measure: event_text_count_all {
    label: "Event Text Count"
    description: "The count of all non-null event text occurrences per grouping."
    type: number
    sql: COUNT(case when ${event_text} IS NOT NULL then ${event_text} else null end) ;;
  }

  measure: user_id_count {
    label: "User Id Count (Distinct)"
    description: "The distinct count of user id's per grouping."
    type: count_distinct
    sql: ${user_id} ;;
  }

  measure: user_id_count_all {
    label: "User Id Count"
    description: "The count of all non-null user id occurrences per grouping."
    type: number
    sql: COUNT(case when ${user_id} IS NOT NULL then ${user_id} else null end) ;;
  }

  measure: bot_accounts_count {
    label: "Bot Accounts Count (Distinct)"
    description: "The distinct count of bot accounts's per grouping."
    type: count_distinct
    sql: ${bot_accounts} ;;
  }

  measure: bot_accounts_count_all {
    label: "Bot Accounts Count"
    description: "The count of all non-null bot accounts occurrences per grouping."
    type: number
    sql: COUNT(case when ${bot_accounts} IS NOT NULL then ${bot_accounts} else null end) ;;
  }

  measure: outgoing_webhooks_count {
    label: "Outgoing Webhooks Count (Distinct)"
    description: "The distinct count of outgoing webhooks's per grouping."
    type: count_distinct
    sql: ${outgoing_webhooks} ;;
  }

  measure: outgoing_webhooks_count_all {
    label: "Outgoing Webhooks Count"
    description: "The count of all non-null outgoing webhooks occurrences per grouping."
    type: number
    sql: COUNT(case when ${outgoing_webhooks} IS NOT NULL then ${outgoing_webhooks} else null end) ;;
  }

  measure: teams_count {
    label: "Teams Count (Distinct)"
    description: "The distinct count of teams's per grouping."
    type: count_distinct
    sql: ${teams} ;;
  }

  measure: teams_count_all {
    label: "Teams Count"
    description: "The count of all non-null teams occurrences per grouping."
    type: number
    sql: COUNT(case when ${teams} IS NOT NULL then ${teams} else null end) ;;
  }

  measure: context_ip_count {
    label: "Context Ip Count (Distinct)"
    description: "The distinct count of context ip's per grouping."
    type: count_distinct
    sql: ${context_ip} ;;
  }

  measure: context_ip_count_all {
    label: "Context Ip Count"
    description: "The count of all non-null context ip occurrences per grouping."
    type: number
    sql: COUNT(case when ${context_ip} IS NOT NULL then ${context_ip} else null end) ;;
  }

  measure: original_timestamp_date_count {
    label: "Original Timestamp Date Count (Distinct)"
    description: "The distinct count of original timestamp date's per grouping."
    type: count_distinct
    sql: ${original_timestamp_date} ;;
  }

  measure: original_timestamp_date_count_all {
    label: "Original Timestamp Date Count"
    description: "The count of all non-null original timestamp date occurrences per grouping."
    type: number
    sql: COUNT(case when ${original_timestamp_date} IS NOT NULL then ${original_timestamp_date} else null end) ;;
  }

  measure: id_count {
    label: "Id Count (Distinct)"
    description: "The distinct count of id's per grouping."
    type: count_distinct
    sql: ${id} ;;
  }

  measure: id_count_all {
    label: "Id Count"
    description: "The count of all non-null id occurrences per grouping."
    type: number
    sql: COUNT(case when ${id} IS NOT NULL then ${id} else null end) ;;
  }

  measure: anonymous_id_count {
    label: "Anonymous Id Count (Distinct)"
    description: "The distinct count of anonymous id's per grouping."
    type: count_distinct
    sql: ${anonymous_id} ;;
  }

  measure: anonymous_id_count_all {
    label: "Anonymous Id Count"
    description: "The count of all non-null anonymous id occurrences per grouping."
    type: number
    sql: COUNT(case when ${anonymous_id} IS NOT NULL then ${anonymous_id} else null end) ;;
  }

  measure: slash_commands_count {
    label: "Slash Commands Count (Distinct)"
    description: "The distinct count of slash commands's per grouping."
    type: count_distinct
    sql: ${slash_commands} ;;
  }

  measure: slash_commands_count_all {
    label: "Slash Commands Count"
    description: "The count of all non-null slash commands occurrences per grouping."
    type: number
    sql: COUNT(case when ${slash_commands} IS NOT NULL then ${slash_commands} else null end) ;;
  }

  measure: event_count {
    label: "Event Count (Distinct)"
    description: "The distinct count of event's per grouping."
    type: count_distinct
    sql: ${event} ;;
  }

  measure: event_count_all {
    label: "Event Count"
    description: "The count of all non-null event occurrences per grouping."
    type: number
    sql: COUNT(case when ${event} IS NOT NULL then ${event} else null end) ;;
  }

  measure: private_channels_deleted_count {
    label: "Private Channels Deleted Count (Distinct)"
    description: "The distinct count of private channels deleted's per grouping."
    type: count_distinct
    sql: ${private_channels_deleted} ;;
  }

  measure: private_channels_deleted_count_all {
    label: "Private Channels Deleted Count"
    description: "The count of all non-null private channels deleted occurrences per grouping."
    type: number
    sql: COUNT(case when ${private_channels_deleted} IS NOT NULL then ${private_channels_deleted} else null end) ;;
  }

  measure: active_users_monthly_count {
    label: "Active Users Monthly Count (Distinct)"
    description: "The distinct count of active users monthly's per grouping."
    type: count_distinct
    sql: ${active_users_monthly} ;;
  }

  measure: active_users_monthly_count_all {
    label: "Active Users Monthly Count"
    description: "The count of all non-null active users monthly occurrences per grouping."
    type: number
    sql: COUNT(case when ${active_users_monthly} IS NOT NULL then ${active_users_monthly} else null end) ;;
  }

  measure: bot_posts_previous_day_count {
    label: "Bot Posts Previous Day Count (Distinct)"
    description: "The distinct count of bot posts previous day's per grouping."
    type: count_distinct
    sql: ${bot_posts_previous_day} ;;
  }

  measure: bot_posts_previous_day_count_all {
    label: "Bot Posts Previous Day Count"
    description: "The count of all non-null bot posts previous day occurrences per grouping."
    type: number
    sql: COUNT(case when ${bot_posts_previous_day} IS NOT NULL then ${bot_posts_previous_day} else null end) ;;
  }

  measure: direct_message_channels_count {
    label: "Direct Message Channels Count (Distinct)"
    description: "The distinct count of direct message channels's per grouping."
    type: count_distinct
    sql: ${direct_message_channels} ;;
  }

  measure: direct_message_channels_count_all {
    label: "Direct Message Channels Count"
    description: "The count of all non-null direct message channels occurrences per grouping."
    type: number
    sql: COUNT(case when ${direct_message_channels} IS NOT NULL then ${direct_message_channels} else null end) ;;
  }

  measure: context_library_version_count {
    label: "Context Library Version Count (Distinct)"
    description: "The distinct count of context library version's per grouping."
    type: count_distinct
    sql: ${context_library_version} ;;
  }

  measure: context_library_version_count_all {
    label: "Context Library Version Count"
    description: "The count of all non-null context library version occurrences per grouping."
    type: number
    sql: COUNT(case when ${context_library_version} IS NOT NULL then ${context_library_version} else null end) ;;
  }

  measure: context_library_name_count {
    label: "Context Library Name Count (Distinct)"
    description: "The distinct count of context library name's per grouping."
    type: count_distinct
    sql: ${context_library_name} ;;
  }

  measure: context_library_name_count_all {
    label: "Context Library Name Count"
    description: "The count of all non-null context library name occurrences per grouping."
    type: number
    sql: COUNT(case when ${context_library_name} IS NOT NULL then ${context_library_name} else null end) ;;
  }

  measure: guest_accounts_count {
    label: "Guest Accounts Count (Distinct)"
    description: "The distinct count of guest accounts's per grouping."
    type: count_distinct
    sql: ${guest_accounts} ;;
  }

  measure: guest_accounts_count_all {
    label: "Guest Accounts Count"
    description: "The count of all non-null guest accounts occurrences per grouping."
    type: number
    sql: COUNT(case when ${guest_accounts} IS NOT NULL then ${guest_accounts} else null end) ;;
  }

  measure: channel_count {
    label: "Channel Count (Distinct)"
    description: "The distinct count of channel's per grouping."
    type: count_distinct
    sql: ${channel} ;;
  }

  measure: channel_count_all {
    label: "Channel Count"
    description: "The count of all non-null channel occurrences per grouping."
    type: number
    sql: COUNT(case when ${channel} IS NOT NULL then ${channel} else null end) ;;
  }

  measure: manage_members_user_disabled_count_count {
    label: "Manage Members User Disabled Count Count (Distinct)"
    description: "The distinct count of manage members user disabled count's per grouping."
    type: count_distinct
    sql: ${manage_members_user_disabled_count} ;;
  }

  measure: manage_members_user_disabled_count_count_all {
    label: "Manage Members User Disabled Count Count"
    description: "The count of all non-null manage members user disabled count occurrences per grouping."
    type: number
    sql: COUNT(case when ${manage_members_user_disabled_count} IS NOT NULL then ${manage_members_user_disabled_count} else null end) ;;
  }

  measure: post_reactions_user_disabled_count_count {
    label: "Post Reactions User Disabled Count Count (Distinct)"
    description: "The distinct count of post reactions user disabled count's per grouping."
    type: count_distinct
    sql: ${post_reactions_user_disabled_count} ;;
  }

  measure: post_reactions_user_disabled_count_count_all {
    label: "Post Reactions User Disabled Count Count"
    description: "The count of all non-null post reactions user disabled count occurrences per grouping."
    type: number
    sql: COUNT(case when ${post_reactions_user_disabled_count} IS NOT NULL then ${post_reactions_user_disabled_count} else null end) ;;
  }

  measure: use_channel_mentions_guest_disabled_count_count {
    label: "Use Channel Mentions Guest Disabled Count Count (Distinct)"
    description: "The distinct count of use channel mentions guest disabled count's per grouping."
    type: count_distinct
    sql: ${use_channel_mentions_guest_disabled_count} ;;
  }

  measure: use_channel_mentions_guest_disabled_count_count_all {
    label: "Use Channel Mentions Guest Disabled Count Count"
    description: "The count of all non-null use channel mentions guest disabled count occurrences per grouping."
    type: number
    sql: COUNT(case when ${use_channel_mentions_guest_disabled_count} IS NOT NULL then ${use_channel_mentions_guest_disabled_count} else null end) ;;
  }

  measure: post_reactions_guest_disabled_count_count {
    label: "Post Reactions Guest Disabled Count Count (Distinct)"
    description: "The distinct count of post reactions guest disabled count's per grouping."
    type: count_distinct
    sql: ${post_reactions_guest_disabled_count} ;;
  }

  measure: post_reactions_guest_disabled_count_count_all {
    label: "Post Reactions Guest Disabled Count Count"
    description: "The count of all non-null post reactions guest disabled count occurrences per grouping."
    type: number
    sql: COUNT(case when ${post_reactions_guest_disabled_count} IS NOT NULL then ${post_reactions_guest_disabled_count} else null end) ;;
  }

  measure: create_post_user_disabled_count_count {
    label: "Create Post User Disabled Count Count (Distinct)"
    description: "The distinct count of create post user disabled count's per grouping."
    type: count_distinct
    sql: ${create_post_user_disabled_count} ;;
  }

  measure: create_post_user_disabled_count_count_all {
    label: "Create Post User Disabled Count Count"
    description: "The count of all non-null create post user disabled count occurrences per grouping."
    type: number
    sql: COUNT(case when ${create_post_user_disabled_count} IS NOT NULL then ${create_post_user_disabled_count} else null end) ;;
  }

  measure: channel_scheme_count_count {
    label: "Channel Scheme Count Count (Distinct)"
    description: "The distinct count of channel scheme count's per grouping."
    type: count_distinct
    sql: ${channel_scheme_count} ;;
  }

  measure: channel_scheme_count_count_all {
    label: "Channel Scheme Count Count"
    description: "The count of all non-null channel scheme count occurrences per grouping."
    type: number
    sql: COUNT(case when ${channel_scheme_count} IS NOT NULL then ${channel_scheme_count} else null end) ;;
  }

  measure: use_channel_mentions_user_disabled_count_count {
    label: "Use Channel Mentions User Disabled Count Count (Distinct)"
    description: "The distinct count of use channel mentions user disabled count's per grouping."
    type: count_distinct
    sql: ${use_channel_mentions_user_disabled_count} ;;
  }

  measure: use_channel_mentions_user_disabled_count_count_all {
    label: "Use Channel Mentions User Disabled Count Count"
    description: "The count of all non-null use channel mentions user disabled count occurrences per grouping."
    type: number
    sql: COUNT(case when ${use_channel_mentions_user_disabled_count} IS NOT NULL then ${use_channel_mentions_user_disabled_count} else null end) ;;
  }

  measure: create_post_guest_disabled_count_count {
    label: "Create Post Guest Disabled Count Count (Distinct)"
    description: "The distinct count of create post guest disabled count's per grouping."
    type: count_distinct
    sql: ${create_post_guest_disabled_count} ;;
  }

  measure: create_post_guest_disabled_count_count_all {
    label: "Create Post Guest Disabled Count Count"
    description: "The count of all non-null create post guest disabled count occurrences per grouping."
    type: number
    sql: COUNT(case when ${create_post_guest_disabled_count} IS NOT NULL then ${create_post_guest_disabled_count} else null end) ;;
  }

  measure: allow_banner_dismissal_count {
    label: "Allow Banner Dismissal Count (Distinct)"
    description: "The distinct count of allow banner dismissal's per grouping."
    type: count_distinct
    sql: ${allow_banner_dismissal} ;;
  }

  measure: allow_banner_dismissal_count_all {
    label: "Allow Banner Dismissal Count"
    description: "The count of all non-null allow banner dismissal occurrences per grouping."
    type: number
    sql: COUNT(case when ${allow_banner_dismissal} IS NOT NULL then ${allow_banner_dismissal} else null end) ;;
  }

  measure: isdefault_banner_text_color_count {
    label: "Isdefault Banner Text Color Count (Distinct)"
    description: "The distinct count of isdefault banner text color's per grouping."
    type: count_distinct
    sql: ${isdefault_banner_text_color} ;;
  }

  measure: isdefault_banner_text_color_count_all {
    label: "Isdefault Banner Text Color Count"
    description: "The count of all non-null isdefault banner text color occurrences per grouping."
    type: number
    sql: COUNT(case when ${isdefault_banner_text_color} IS NOT NULL then ${isdefault_banner_text_color} else null end) ;;
  }

  measure: enable_banner_count {
    label: "Enable Banner Count (Distinct)"
    description: "The distinct count of enable banner's per grouping."
    type: count_distinct
    sql: ${enable_banner} ;;
  }

  measure: enable_banner_count_all {
    label: "Enable Banner Count"
    description: "The count of all non-null enable banner occurrences per grouping."
    type: number
    sql: COUNT(case when ${enable_banner} IS NOT NULL then ${enable_banner} else null end) ;;
  }

  measure: isdefault_banner_color_count {
    label: "Isdefault Banner Color Count (Distinct)"
    description: "The distinct count of isdefault banner color's per grouping."
    type: count_distinct
    sql: ${isdefault_banner_color} ;;
  }

  measure: isdefault_banner_color_count_all {
    label: "Isdefault Banner Color Count"
    description: "The count of all non-null isdefault banner color occurrences per grouping."
    type: number
    sql: COUNT(case when ${isdefault_banner_color} IS NOT NULL then ${isdefault_banner_color} else null end) ;;
  }

  measure: file_compress_count {
    label: "File Compress Count (Distinct)"
    description: "The distinct count of file compress's per grouping."
    type: count_distinct
    sql: ${file_compress} ;;
  }

  measure: file_compress_count_all {
    label: "File Compress Count"
    description: "The count of all non-null file compress occurrences per grouping."
    type: number
    sql: COUNT(case when ${file_compress} IS NOT NULL then ${file_compress} else null end) ;;
  }

  measure: file_max_queue_size_count {
    label: "File Max Queue Size Count (Distinct)"
    description: "The distinct count of file max queue size's per grouping."
    type: count_distinct
    sql: ${file_max_queue_size} ;;
  }

  measure: file_max_queue_size_count_all {
    label: "File Max Queue Size Count"
    description: "The count of all non-null file max queue size occurrences per grouping."
    type: number
    sql: COUNT(case when ${file_max_queue_size} IS NOT NULL then ${file_max_queue_size} else null end) ;;
  }

  measure: syslog_max_queue_size_count {
    label: "Syslog Max Queue Size Count (Distinct)"
    description: "The distinct count of syslog max queue size's per grouping."
    type: count_distinct
    sql: ${syslog_max_queue_size} ;;
  }

  measure: syslog_max_queue_size_count_all {
    label: "Syslog Max Queue Size Count"
    description: "The count of all non-null syslog max queue size occurrences per grouping."
    type: number
    sql: COUNT(case when ${syslog_max_queue_size} IS NOT NULL then ${syslog_max_queue_size} else null end) ;;
  }

  measure: file_enabled_count {
    label: "File Enabled Count (Distinct)"
    description: "The distinct count of file enabled's per grouping."
    type: count_distinct
    sql: ${file_enabled} ;;
  }

  measure: file_enabled_count_all {
    label: "File Enabled Count"
    description: "The count of all non-null file enabled occurrences per grouping."
    type: number
    sql: COUNT(case when ${file_enabled} IS NOT NULL then ${file_enabled} else null end) ;;
  }

  measure: file_max_age_days_count {
    label: "File Max Age Days Count (Distinct)"
    description: "The distinct count of file max age days's per grouping."
    type: count_distinct
    sql: ${file_max_age_days} ;;
  }

  measure: file_max_age_days_count_all {
    label: "File Max Age Days Count"
    description: "The count of all non-null file max age days occurrences per grouping."
    type: number
    sql: COUNT(case when ${file_max_age_days} IS NOT NULL then ${file_max_age_days} else null end) ;;
  }

  measure: syslog_enabled_count {
    label: "Syslog Enabled Count (Distinct)"
    description: "The distinct count of syslog enabled's per grouping."
    type: count_distinct
    sql: ${syslog_enabled} ;;
  }

  measure: syslog_enabled_count_all {
    label: "Syslog Enabled Count"
    description: "The count of all non-null syslog enabled occurrences per grouping."
    type: number
    sql: COUNT(case when ${syslog_enabled} IS NOT NULL then ${syslog_enabled} else null end) ;;
  }

  measure: file_max_backups_count {
    label: "File Max Backups Count (Distinct)"
    description: "The distinct count of file max backups's per grouping."
    type: count_distinct
    sql: ${file_max_backups} ;;
  }

  measure: file_max_backups_count_all {
    label: "File Max Backups Count"
    description: "The count of all non-null file max backups occurrences per grouping."
    type: number
    sql: COUNT(case when ${file_max_backups} IS NOT NULL then ${file_max_backups} else null end) ;;
  }

  measure: file_max_size_mb_count {
    label: "File Max Size Mb Count (Distinct)"
    description: "The distinct count of file max size mb's per grouping."
    type: count_distinct
    sql: ${file_max_size_mb} ;;
  }

  measure: file_max_size_mb_count_all {
    label: "File Max Size Mb Count"
    description: "The count of all non-null file max size mb occurrences per grouping."
    type: number
    sql: COUNT(case when ${file_max_size_mb} IS NOT NULL then ${file_max_size_mb} else null end) ;;
  }

  measure: syslog_insecure_count {
    label: "Syslog Insecure Count (Distinct)"
    description: "The distinct count of syslog insecure's per grouping."
    type: count_distinct
    sql: ${syslog_insecure} ;;
  }

  measure: syslog_insecure_count_all {
    label: "Syslog Insecure Count"
    description: "The count of all non-null syslog insecure occurrences per grouping."
    type: number
    sql: COUNT(case when ${syslog_insecure} IS NOT NULL then ${syslog_insecure} else null end) ;;
  }

  measure: enable_autocomplete_count {
    label: "Enable Autocomplete Count (Distinct)"
    description: "The distinct count of enable autocomplete's per grouping."
    type: count_distinct
    sql: ${enable_autocomplete} ;;
  }

  measure: enable_autocomplete_count_all {
    label: "Enable Autocomplete Count"
    description: "The count of all non-null enable autocomplete occurrences per grouping."
    type: number
    sql: COUNT(case when ${enable_autocomplete} IS NOT NULL then ${enable_autocomplete} else null end) ;;
  }

  measure: enable_indexing_count {
    label: "Enable Indexing Count (Distinct)"
    description: "The distinct count of enable indexing's per grouping."
    type: count_distinct
    sql: ${enable_indexing} ;;
  }

  measure: enable_indexing_count_all {
    label: "Enable Indexing Count"
    description: "The count of all non-null enable indexing occurrences per grouping."
    type: number
    sql: COUNT(case when ${enable_indexing} IS NOT NULL then ${enable_indexing} else null end) ;;
  }

  measure: enable_searching_count {
    label: "Enable Searching Count (Distinct)"
    description: "The distinct count of enable searching's per grouping."
    type: count_distinct
    sql: ${enable_searching} ;;
  }

  measure: enable_searching_count_all {
    label: "Enable Searching Count"
    description: "The count of all non-null enable searching occurrences per grouping."
    type: number
    sql: COUNT(case when ${enable_searching} IS NOT NULL then ${enable_searching} else null end) ;;
  }

  measure: bulk_indexing_time_window_seconds_count {
    label: "Bulk Indexing Time Window Seconds Count (Distinct)"
    description: "The distinct count of bulk indexing time window seconds's per grouping."
    type: count_distinct
    sql: ${bulk_indexing_time_window_seconds} ;;
  }

  measure: bulk_indexing_time_window_seconds_count_all {
    label: "Bulk Indexing Time Window Seconds Count"
    description: "The count of all non-null bulk indexing time window seconds occurrences per grouping."
    type: number
    sql: COUNT(case when ${bulk_indexing_time_window_seconds} IS NOT NULL then ${bulk_indexing_time_window_seconds} else null end) ;;
  }

  measure: ios_min_version_count {
    label: "Ios Min Version Count (Distinct)"
    description: "The distinct count of ios min version's per grouping."
    type: count_distinct
    sql: ${ios_min_version} ;;
  }

  measure: ios_min_version_count_all {
    label: "Ios Min Version Count"
    description: "The count of all non-null ios min version occurrences per grouping."
    type: number
    sql: COUNT(case when ${ios_min_version} IS NOT NULL then ${ios_min_version} else null end) ;;
  }

  measure: ios_latest_version_count {
    label: "Ios Latest Version Count (Distinct)"
    description: "The distinct count of ios latest version's per grouping."
    type: count_distinct
    sql: ${ios_latest_version} ;;
  }

  measure: ios_latest_version_count_all {
    label: "Ios Latest Version Count"
    description: "The count of all non-null ios latest version occurrences per grouping."
    type: number
    sql: COUNT(case when ${ios_latest_version} IS NOT NULL then ${ios_latest_version} else null end) ;;
  }

  measure: desktop_min_version_count {
    label: "Desktop Min Version Count (Distinct)"
    description: "The distinct count of desktop min version's per grouping."
    type: count_distinct
    sql: ${desktop_min_version} ;;
  }

  measure: desktop_min_version_count_all {
    label: "Desktop Min Version Count"
    description: "The count of all non-null desktop min version occurrences per grouping."
    type: number
    sql: COUNT(case when ${desktop_min_version} IS NOT NULL then ${desktop_min_version} else null end) ;;
  }

  measure: android_min_version_count {
    label: "Android Min Version Count (Distinct)"
    description: "The distinct count of android min version's per grouping."
    type: count_distinct
    sql: ${android_min_version} ;;
  }

  measure: android_min_version_count_all {
    label: "Android Min Version Count"
    description: "The count of all non-null android min version occurrences per grouping."
    type: number
    sql: COUNT(case when ${android_min_version} IS NOT NULL then ${android_min_version} else null end) ;;
  }

  measure: android_latest_version_count {
    label: "Android Latest Version Count (Distinct)"
    description: "The distinct count of android latest version's per grouping."
    type: count_distinct
    sql: ${android_latest_version} ;;
  }

  measure: android_latest_version_count_all {
    label: "Android Latest Version Count"
    description: "The count of all non-null android latest version occurrences per grouping."
    type: number
    sql: COUNT(case when ${android_latest_version} IS NOT NULL then ${android_latest_version} else null end) ;;
  }

  measure: desktop_latest_version_count {
    label: "Desktop Latest Version Count (Distinct)"
    description: "The distinct count of desktop latest version's per grouping."
    type: count_distinct
    sql: ${desktop_latest_version} ;;
  }

  measure: desktop_latest_version_count_all {
    label: "Desktop Latest Version Count"
    description: "The count of all non-null desktop latest version occurrences per grouping."
    type: number
    sql: COUNT(case when ${desktop_latest_version} IS NOT NULL then ${desktop_latest_version} else null end) ;;
  }

  measure: advertise_address_count {
    label: "Advertise Address Count (Distinct)"
    description: "The distinct count of advertise address's per grouping."
    type: count_distinct
    sql: ${advertise_address} ;;
  }

  measure: advertise_address_count_all {
    label: "Advertise Address Count"
    description: "The count of all non-null advertise address occurrences per grouping."
    type: number
    sql: COUNT(case when ${advertise_address} IS NOT NULL then ${advertise_address} else null end) ;;
  }

  measure: use_ip_address_count {
    label: "Use Ip Address Count (Distinct)"
    description: "The distinct count of use ip address's per grouping."
    type: count_distinct
    sql: ${use_ip_address} ;;
  }

  measure: use_ip_address_count_all {
    label: "Use Ip Address Count"
    description: "The count of all non-null use ip address occurrences per grouping."
    type: number
    sql: COUNT(case when ${use_ip_address} IS NOT NULL then ${use_ip_address} else null end) ;;
  }

  measure: enable_count {
    label: "Enable Count (Distinct)"
    description: "The distinct count of enable's per grouping."
    type: count_distinct
    sql: ${enable} ;;
  }

  measure: enable_count_all {
    label: "Enable Count"
    description: "The count of all non-null enable occurrences per grouping."
    type: number
    sql: COUNT(case when ${enable} IS NOT NULL then ${enable} else null end) ;;
  }

  measure: use_experimental_gossip_count {
    label: "Use Experimental Gossip Count (Distinct)"
    description: "The distinct count of use experimental gossip's per grouping."
    type: count_distinct
    sql: ${use_experimental_gossip} ;;
  }

  measure: use_experimental_gossip_count_all {
    label: "Use Experimental Gossip Count"
    description: "The count of all non-null use experimental gossip occurrences per grouping."
    type: number
    sql: COUNT(case when ${use_experimental_gossip} IS NOT NULL then ${use_experimental_gossip} else null end) ;;
  }

  measure: read_only_config_count {
    label: "Read Only Config Count (Distinct)"
    description: "The distinct count of read only config's per grouping."
    type: count_distinct
    sql: ${read_only_config} ;;
  }

  measure: read_only_config_count_all {
    label: "Read Only Config Count"
    description: "The count of all non-null read only config occurrences per grouping."
    type: number
    sql: COUNT(case when ${read_only_config} IS NOT NULL then ${read_only_config} else null end) ;;
  }

  measure: bind_address_count {
    label: "Bind Address Count (Distinct)"
    description: "The distinct count of bind address's per grouping."
    type: count_distinct
    sql: ${bind_address} ;;
  }

  measure: bind_address_count_all {
    label: "Bind Address Count"
    description: "The count of all non-null bind address occurrences per grouping."
    type: number
    sql: COUNT(case when ${bind_address} IS NOT NULL then ${bind_address} else null end) ;;
  }

  measure: network_interface_count {
    label: "Network Interface Count (Distinct)"
    description: "The distinct count of network interface's per grouping."
    type: count_distinct
    sql: ${network_interface} ;;
  }

  measure: network_interface_count_all {
    label: "Network Interface Count"
    description: "The count of all non-null network interface occurrences per grouping."
    type: number
    sql: COUNT(case when ${network_interface} IS NOT NULL then ${network_interface} else null end) ;;
  }

  measure: enable_daily_count {
    label: "Enable Daily Count (Distinct)"
    description: "The distinct count of enable daily's per grouping."
    type: count_distinct
    sql: ${enable_daily} ;;
  }

  measure: enable_daily_count_all {
    label: "Enable Daily Count"
    description: "The count of all non-null enable daily occurrences per grouping."
    type: number
    sql: COUNT(case when ${enable_daily} IS NOT NULL then ${enable_daily} else null end) ;;
  }

  measure: message_retention_days_count {
    label: "Message Retention Days Count (Distinct)"
    description: "The distinct count of message retention days's per grouping."
    type: count_distinct
    sql: ${message_retention_days} ;;
  }

  measure: message_retention_days_count_all {
    label: "Message Retention Days Count"
    description: "The count of all non-null message retention days occurrences per grouping."
    type: number
    sql: COUNT(case when ${message_retention_days} IS NOT NULL then ${message_retention_days} else null end) ;;
  }

  measure: file_retention_days_count {
    label: "File Retention Days Count (Distinct)"
    description: "The distinct count of file retention days's per grouping."
    type: count_distinct
    sql: ${file_retention_days} ;;
  }

  measure: file_retention_days_count_all {
    label: "File Retention Days Count"
    description: "The count of all non-null file retention days occurrences per grouping."
    type: number
    sql: COUNT(case when ${file_retention_days} IS NOT NULL then ${file_retention_days} else null end) ;;
  }

  measure: deletion_job_start_time_count {
    label: "Deletion Job Start Time Count (Distinct)"
    description: "The distinct count of deletion job start time's per grouping."
    type: count_distinct
    sql: ${deletion_job_start_time} ;;
  }

  measure: deletion_job_start_time_count_all {
    label: "Deletion Job Start Time Count"
    description: "The count of all non-null deletion job start time occurrences per grouping."
    type: number
    sql: COUNT(case when ${deletion_job_start_time} IS NOT NULL then ${deletion_job_start_time} else null end) ;;
  }

  measure: enable_message_deletion_count {
    label: "Enable Message Deletion Count (Distinct)"
    description: "The distinct count of enable message deletion's per grouping."
    type: count_distinct
    sql: ${enable_message_deletion} ;;
  }

  measure: enable_message_deletion_count_all {
    label: "Enable Message Deletion Count"
    description: "The count of all non-null enable message deletion occurrences per grouping."
    type: number
    sql: COUNT(case when ${enable_message_deletion} IS NOT NULL then ${enable_message_deletion} else null end) ;;
  }

  measure: enable_file_deletion_count {
    label: "Enable File Deletion Count (Distinct)"
    description: "The distinct count of enable file deletion's per grouping."
    type: count_distinct
    sql: ${enable_file_deletion} ;;
  }

  measure: enable_file_deletion_count_all {
    label: "Enable File Deletion Count"
    description: "The count of all non-null enable file deletion occurrences per grouping."
    type: number
    sql: COUNT(case when ${enable_file_deletion} IS NOT NULL then ${enable_file_deletion} else null end) ;;
  }

  measure: isdefault_custom_url_schemes_count {
    label: "Isdefault Custom Url Schemes Count (Distinct)"
    description: "The distinct count of isdefault custom url schemes's per grouping."
    type: count_distinct
    sql: ${isdefault_custom_url_schemes} ;;
  }

  measure: isdefault_custom_url_schemes_count_all {
    label: "Isdefault Custom Url Schemes Count"
    description: "The count of all non-null isdefault custom url schemes occurrences per grouping."
    type: number
    sql: COUNT(case when ${isdefault_custom_url_schemes} IS NOT NULL then ${isdefault_custom_url_schemes} else null end) ;;
  }

  measure: experimental_timezone_count {
    label: "Experimental Timezone Count (Distinct)"
    description: "The distinct count of experimental timezone's per grouping."
    type: count_distinct
    sql: ${experimental_timezone} ;;
  }

  measure: experimental_timezone_count_all {
    label: "Experimental Timezone Count"
    description: "The count of all non-null experimental timezone occurrences per grouping."
    type: number
    sql: COUNT(case when ${experimental_timezone} IS NOT NULL then ${experimental_timezone} else null end) ;;
  }

  measure: sniff_count {
    label: "Sniff Count (Distinct)"
    description: "The distinct count of sniff's per grouping."
    type: count_distinct
    sql: ${sniff} ;;
  }

  measure: sniff_count_all {
    label: "Sniff Count"
    description: "The count of all non-null sniff occurrences per grouping."
    type: number
    sql: COUNT(case when ${sniff} IS NOT NULL then ${sniff} else null end) ;;
  }

  measure: isdefault_connection_url_count {
    label: "Isdefault Connection Url Count (Distinct)"
    description: "The distinct count of isdefault connection url's per grouping."
    type: count_distinct
    sql: ${isdefault_connection_url} ;;
  }

  measure: isdefault_connection_url_count_all {
    label: "Isdefault Connection Url Count"
    description: "The count of all non-null isdefault connection url occurrences per grouping."
    type: number
    sql: COUNT(case when ${isdefault_connection_url} IS NOT NULL then ${isdefault_connection_url} else null end) ;;
  }

  measure: trace_count {
    label: "Trace Count (Distinct)"
    description: "The distinct count of trace's per grouping."
    type: count_distinct
    sql: ${trace} ;;
  }

  measure: trace_count_all {
    label: "Trace Count"
    description: "The count of all non-null trace occurrences per grouping."
    type: number
    sql: COUNT(case when ${trace} IS NOT NULL then ${trace} else null end) ;;
  }

  measure: user_index_shards_count {
    label: "User Index Shards Count (Distinct)"
    description: "The distinct count of user index shards's per grouping."
    type: count_distinct
    sql: ${user_index_shards} ;;
  }

  measure: user_index_shards_count_all {
    label: "User Index Shards Count"
    description: "The count of all non-null user index shards occurrences per grouping."
    type: number
    sql: COUNT(case when ${user_index_shards} IS NOT NULL then ${user_index_shards} else null end) ;;
  }

  measure: channel_index_replicas_count {
    label: "Channel Index Replicas Count (Distinct)"
    description: "The distinct count of channel index replicas's per grouping."
    type: count_distinct
    sql: ${channel_index_replicas} ;;
  }

  measure: channel_index_replicas_count_all {
    label: "Channel Index Replicas Count"
    description: "The count of all non-null channel index replicas occurrences per grouping."
    type: number
    sql: COUNT(case when ${channel_index_replicas} IS NOT NULL then ${channel_index_replicas} else null end) ;;
  }

  measure: isdefault_username_count {
    label: "Isdefault Username Count (Distinct)"
    description: "The distinct count of isdefault username's per grouping."
    type: count_distinct
    sql: ${isdefault_username} ;;
  }

  measure: isdefault_username_count_all {
    label: "Isdefault Username Count"
    description: "The count of all non-null isdefault username occurrences per grouping."
    type: number
    sql: COUNT(case when ${isdefault_username} IS NOT NULL then ${isdefault_username} else null end) ;;
  }

  measure: isdefault_password_count {
    label: "Isdefault Password Count (Distinct)"
    description: "The distinct count of isdefault password's per grouping."
    type: count_distinct
    sql: ${isdefault_password} ;;
  }

  measure: isdefault_password_count_all {
    label: "Isdefault Password Count"
    description: "The count of all non-null isdefault password occurrences per grouping."
    type: number
    sql: COUNT(case when ${isdefault_password} IS NOT NULL then ${isdefault_password} else null end) ;;
  }

  measure: user_index_replicas_count {
    label: "User Index Replicas Count (Distinct)"
    description: "The distinct count of user index replicas's per grouping."
    type: count_distinct
    sql: ${user_index_replicas} ;;
  }

  measure: user_index_replicas_count_all {
    label: "User Index Replicas Count"
    description: "The count of all non-null user index replicas occurrences per grouping."
    type: number
    sql: COUNT(case when ${user_index_replicas} IS NOT NULL then ${user_index_replicas} else null end) ;;
  }

  measure: isdefault_index_prefix_count {
    label: "Isdefault Index Prefix Count (Distinct)"
    description: "The distinct count of isdefault index prefix's per grouping."
    type: count_distinct
    sql: ${isdefault_index_prefix} ;;
  }

  measure: isdefault_index_prefix_count_all {
    label: "Isdefault Index Prefix Count"
    description: "The count of all non-null isdefault index prefix occurrences per grouping."
    type: number
    sql: COUNT(case when ${isdefault_index_prefix} IS NOT NULL then ${isdefault_index_prefix} else null end) ;;
  }

  measure: skip_tls_verification_count {
    label: "Skip Tls Verification Count (Distinct)"
    description: "The distinct count of skip tls verification's per grouping."
    type: count_distinct
    sql: ${skip_tls_verification} ;;
  }

  measure: skip_tls_verification_count_all {
    label: "Skip Tls Verification Count"
    description: "The count of all non-null skip tls verification occurrences per grouping."
    type: number
    sql: COUNT(case when ${skip_tls_verification} IS NOT NULL then ${skip_tls_verification} else null end) ;;
  }

  measure: channel_index_shards_count {
    label: "Channel Index Shards Count (Distinct)"
    description: "The distinct count of channel index shards's per grouping."
    type: count_distinct
    sql: ${channel_index_shards} ;;
  }

  measure: channel_index_shards_count_all {
    label: "Channel Index Shards Count"
    description: "The count of all non-null channel index shards occurrences per grouping."
    type: number
    sql: COUNT(case when ${channel_index_shards} IS NOT NULL then ${channel_index_shards} else null end) ;;
  }

  measure: live_indexing_batch_size_count {
    label: "Live Indexing Batch Size Count (Distinct)"
    description: "The distinct count of live indexing batch size's per grouping."
    type: count_distinct
    sql: ${live_indexing_batch_size} ;;
  }

  measure: live_indexing_batch_size_count_all {
    label: "Live Indexing Batch Size Count"
    description: "The count of all non-null live indexing batch size occurrences per grouping."
    type: number
    sql: COUNT(case when ${live_indexing_batch_size} IS NOT NULL then ${live_indexing_batch_size} else null end) ;;
  }

  measure: post_index_shards_count {
    label: "Post Index Shards Count (Distinct)"
    description: "The distinct count of post index shards's per grouping."
    type: count_distinct
    sql: ${post_index_shards} ;;
  }

  measure: post_index_shards_count_all {
    label: "Post Index Shards Count"
    description: "The count of all non-null post index shards occurrences per grouping."
    type: number
    sql: COUNT(case when ${post_index_shards} IS NOT NULL then ${post_index_shards} else null end) ;;
  }

  measure: post_index_replicas_count {
    label: "Post Index Replicas Count (Distinct)"
    description: "The distinct count of post index replicas's per grouping."
    type: count_distinct
    sql: ${post_index_replicas} ;;
  }

  measure: post_index_replicas_count_all {
    label: "Post Index Replicas Count"
    description: "The count of all non-null post index replicas occurrences per grouping."
    type: number
    sql: COUNT(case when ${post_index_replicas} IS NOT NULL then ${post_index_replicas} else null end) ;;
  }

  measure: request_timeout_seconds_count {
    label: "Request Timeout Seconds Count (Distinct)"
    description: "The distinct count of request timeout seconds's per grouping."
    type: count_distinct
    sql: ${request_timeout_seconds} ;;
  }

  measure: request_timeout_seconds_count_all {
    label: "Request Timeout Seconds Count"
    description: "The count of all non-null request timeout seconds occurrences per grouping."
    type: number
    sql: COUNT(case when ${request_timeout_seconds} IS NOT NULL then ${request_timeout_seconds} else null end) ;;
  }

  measure: enable_mobile_download_count {
    label: "Enable Mobile Download Count (Distinct)"
    description: "The distinct count of enable mobile download's per grouping."
    type: count_distinct
    sql: ${enable_mobile_download} ;;
  }

  measure: enable_mobile_download_count_all {
    label: "Enable Mobile Download Count"
    description: "The count of all non-null enable mobile download occurrences per grouping."
    type: number
    sql: COUNT(case when ${enable_mobile_download} IS NOT NULL then ${enable_mobile_download} else null end) ;;
  }

  measure: amazon_s3_trace_count {
    label: "Amazon S3 Trace Count (Distinct)"
    description: "The distinct count of amazon s3 trace's per grouping."
    type: count_distinct
    sql: ${amazon_s3_trace} ;;
  }

  measure: amazon_s3_trace_count_all {
    label: "Amazon S3 Trace Count"
    description: "The count of all non-null amazon s3 trace occurrences per grouping."
    type: number
    sql: COUNT(case when ${amazon_s3_trace} IS NOT NULL then ${amazon_s3_trace} else null end) ;;
  }

  measure: driver_name_count {
    label: "Driver Name Count (Distinct)"
    description: "The distinct count of driver name's per grouping."
    type: count_distinct
    sql: ${driver_name} ;;
  }

  measure: driver_name_count_all {
    label: "Driver Name Count"
    description: "The count of all non-null driver name occurrences per grouping."
    type: number
    sql: COUNT(case when ${driver_name} IS NOT NULL then ${driver_name} else null end) ;;
  }

  measure: amazon_s3_ssl_count {
    label: "Amazon S3 Ssl Count (Distinct)"
    description: "The distinct count of amazon s3 ssl's per grouping."
    type: count_distinct
    sql: ${amazon_s3_ssl} ;;
  }

  measure: amazon_s3_ssl_count_all {
    label: "Amazon S3 Ssl Count"
    description: "The count of all non-null amazon s3 ssl occurrences per grouping."
    type: number
    sql: COUNT(case when ${amazon_s3_ssl} IS NOT NULL then ${amazon_s3_ssl} else null end) ;;
  }

  measure: amazon_s3_sse_count {
    label: "Amazon S3 Sse Count (Distinct)"
    description: "The distinct count of amazon s3 sse's per grouping."
    type: count_distinct
    sql: ${amazon_s3_sse} ;;
  }

  measure: amazon_s3_sse_count_all {
    label: "Amazon S3 Sse Count"
    description: "The count of all non-null amazon s3 sse occurrences per grouping."
    type: number
    sql: COUNT(case when ${amazon_s3_sse} IS NOT NULL then ${amazon_s3_sse} else null end) ;;
  }

  measure: enable_public_links_count {
    label: "Enable Public Links Count (Distinct)"
    description: "The distinct count of enable public links's per grouping."
    type: count_distinct
    sql: ${enable_public_links} ;;
  }

  measure: enable_public_links_count_all {
    label: "Enable Public Links Count"
    description: "The count of all non-null enable public links occurrences per grouping."
    type: number
    sql: COUNT(case when ${enable_public_links} IS NOT NULL then ${enable_public_links} else null end) ;;
  }

  measure: isdefault_directory_count {
    label: "Isdefault Directory Count (Distinct)"
    description: "The distinct count of isdefault directory's per grouping."
    type: count_distinct
    sql: ${isdefault_directory} ;;
  }

  measure: isdefault_directory_count_all {
    label: "Isdefault Directory Count"
    description: "The count of all non-null isdefault directory occurrences per grouping."
    type: number
    sql: COUNT(case when ${isdefault_directory} IS NOT NULL then ${isdefault_directory} else null end) ;;
  }

  measure: enable_file_attachments_count {
    label: "Enable File Attachments Count (Distinct)"
    description: "The distinct count of enable file attachments's per grouping."
    type: count_distinct
    sql: ${enable_file_attachments} ;;
  }

  measure: enable_file_attachments_count_all {
    label: "Enable File Attachments Count"
    description: "The count of all non-null enable file attachments occurrences per grouping."
    type: number
    sql: COUNT(case when ${enable_file_attachments} IS NOT NULL then ${enable_file_attachments} else null end) ;;
  }

  measure: amazon_s3_signv2_count {
    label: "Amazon S3 Signv2 Count (Distinct)"
    description: "The distinct count of amazon s3 signv2's per grouping."
    type: count_distinct
    sql: ${amazon_s3_signv2} ;;
  }

  measure: amazon_s3_signv2_count_all {
    label: "Amazon S3 Signv2 Count"
    description: "The count of all non-null amazon s3 signv2 occurrences per grouping."
    type: number
    sql: COUNT(case when ${amazon_s3_signv2} IS NOT NULL then ${amazon_s3_signv2} else null end) ;;
  }

  measure: isabsolute_directory_count {
    label: "Isabsolute Directory Count (Distinct)"
    description: "The distinct count of isabsolute directory's per grouping."
    type: count_distinct
    sql: ${isabsolute_directory} ;;
  }

  measure: isabsolute_directory_count_all {
    label: "Isabsolute Directory Count"
    description: "The count of all non-null isabsolute directory occurrences per grouping."
    type: number
    sql: COUNT(case when ${isabsolute_directory} IS NOT NULL then ${isabsolute_directory} else null end) ;;
  }

  measure: max_file_size_count {
    label: "Max File Size Count (Distinct)"
    description: "The distinct count of max file size's per grouping."
    type: count_distinct
    sql: ${max_file_size} ;;
  }

  measure: max_file_size_count_all {
    label: "Max File Size Count"
    description: "The count of all non-null max file size occurrences per grouping."
    type: number
    sql: COUNT(case when ${max_file_size} IS NOT NULL then ${max_file_size} else null end) ;;
  }

  measure: enable_mobile_upload_count {
    label: "Enable Mobile Upload Count (Distinct)"
    description: "The distinct count of enable mobile upload's per grouping."
    type: count_distinct
    sql: ${enable_mobile_upload} ;;
  }

  measure: enable_mobile_upload_count_all {
    label: "Enable Mobile Upload Count"
    description: "The count of all non-null enable mobile upload occurrences per grouping."
    type: number
    sql: COUNT(case when ${enable_mobile_upload} IS NOT NULL then ${enable_mobile_upload} else null end) ;;
  }

  measure: isempty_admin_filter_count {
    label: "Isempty Admin Filter Count (Distinct)"
    description: "The distinct count of isempty admin filter's per grouping."
    type: count_distinct
    sql: ${isempty_admin_filter} ;;
  }

  measure: isempty_admin_filter_count_all {
    label: "Isempty Admin Filter Count"
    description: "The count of all non-null isempty admin filter occurrences per grouping."
    type: number
    sql: COUNT(case when ${isempty_admin_filter} IS NOT NULL then ${isempty_admin_filter} else null end) ;;
  }

  measure: isdefault_login_field_name_count {
    label: "Isdefault Login Field Name Count (Distinct)"
    description: "The distinct count of isdefault login field name's per grouping."
    type: count_distinct
    sql: ${isdefault_login_field_name} ;;
  }

  measure: isdefault_login_field_name_count_all {
    label: "Isdefault Login Field Name Count"
    description: "The count of all non-null isdefault login field name occurrences per grouping."
    type: number
    sql: COUNT(case when ${isdefault_login_field_name} IS NOT NULL then ${isdefault_login_field_name} else null end) ;;
  }

  measure: query_timeout_count {
    label: "Query Timeout Count (Distinct)"
    description: "The distinct count of query timeout's per grouping."
    type: count_distinct
    sql: ${query_timeout} ;;
  }

  measure: query_timeout_count_all {
    label: "Query Timeout Count"
    description: "The count of all non-null query timeout occurrences per grouping."
    type: number
    sql: COUNT(case when ${query_timeout} IS NOT NULL then ${query_timeout} else null end) ;;
  }

  measure: isempty_guest_filter_count {
    label: "Isempty Guest Filter Count (Distinct)"
    description: "The distinct count of isempty guest filter's per grouping."
    type: count_distinct
    sql: ${isempty_guest_filter} ;;
  }

  measure: isempty_guest_filter_count_all {
    label: "Isempty Guest Filter Count"
    description: "The count of all non-null isempty guest filter occurrences per grouping."
    type: number
    sql: COUNT(case when ${isempty_guest_filter} IS NOT NULL then ${isempty_guest_filter} else null end) ;;
  }

  measure: isdefault_position_attribute_count {
    label: "Isdefault Position Attribute Count (Distinct)"
    description: "The distinct count of isdefault position attribute's per grouping."
    type: count_distinct
    sql: ${isdefault_position_attribute} ;;
  }

  measure: isdefault_position_attribute_count_all {
    label: "Isdefault Position Attribute Count"
    description: "The count of all non-null isdefault position attribute occurrences per grouping."
    type: number
    sql: COUNT(case when ${isdefault_position_attribute} IS NOT NULL then ${isdefault_position_attribute} else null end) ;;
  }

  measure: isdefault_nickname_attribute_count {
    label: "Isdefault Nickname Attribute Count (Distinct)"
    description: "The distinct count of isdefault nickname attribute's per grouping."
    type: count_distinct
    sql: ${isdefault_nickname_attribute} ;;
  }

  measure: isdefault_nickname_attribute_count_all {
    label: "Isdefault Nickname Attribute Count"
    description: "The count of all non-null isdefault nickname attribute occurrences per grouping."
    type: number
    sql: COUNT(case when ${isdefault_nickname_attribute} IS NOT NULL then ${isdefault_nickname_attribute} else null end) ;;
  }

  measure: max_page_size_count {
    label: "Max Page Size Count (Distinct)"
    description: "The distinct count of max page size's per grouping."
    type: count_distinct
    sql: ${max_page_size} ;;
  }

  measure: max_page_size_count_all {
    label: "Max Page Size Count"
    description: "The count of all non-null max page size occurrences per grouping."
    type: number
    sql: COUNT(case when ${max_page_size} IS NOT NULL then ${max_page_size} else null end) ;;
  }

  measure: isdefault_username_attribute_count {
    label: "Isdefault Username Attribute Count (Distinct)"
    description: "The distinct count of isdefault username attribute's per grouping."
    type: count_distinct
    sql: ${isdefault_username_attribute} ;;
  }

  measure: isdefault_username_attribute_count_all {
    label: "Isdefault Username Attribute Count"
    description: "The count of all non-null isdefault username attribute occurrences per grouping."
    type: number
    sql: COUNT(case when ${isdefault_username_attribute} IS NOT NULL then ${isdefault_username_attribute} else null end) ;;
  }

  measure: enable_sync_count {
    label: "Enable Sync Count (Distinct)"
    description: "The distinct count of enable sync's per grouping."
    type: count_distinct
    sql: ${enable_sync} ;;
  }

  measure: enable_sync_count_all {
    label: "Enable Sync Count"
    description: "The count of all non-null enable sync occurrences per grouping."
    type: number
    sql: COUNT(case when ${enable_sync} IS NOT NULL then ${enable_sync} else null end) ;;
  }

  measure: isdefault_id_attribute_count {
    label: "Isdefault Id Attribute Count (Distinct)"
    description: "The distinct count of isdefault id attribute's per grouping."
    type: count_distinct
    sql: ${isdefault_id_attribute} ;;
  }

  measure: isdefault_id_attribute_count_all {
    label: "Isdefault Id Attribute Count"
    description: "The count of all non-null isdefault id attribute occurrences per grouping."
    type: number
    sql: COUNT(case when ${isdefault_id_attribute} IS NOT NULL then ${isdefault_id_attribute} else null end) ;;
  }

  measure: isdefault_email_attribute_count {
    label: "Isdefault Email Attribute Count (Distinct)"
    description: "The distinct count of isdefault email attribute's per grouping."
    type: count_distinct
    sql: ${isdefault_email_attribute} ;;
  }

  measure: isdefault_email_attribute_count_all {
    label: "Isdefault Email Attribute Count"
    description: "The count of all non-null isdefault email attribute occurrences per grouping."
    type: number
    sql: COUNT(case when ${isdefault_email_attribute} IS NOT NULL then ${isdefault_email_attribute} else null end) ;;
  }

  measure: isdefault_last_name_attribute_count {
    label: "Isdefault Last Name Attribute Count (Distinct)"
    description: "The distinct count of isdefault last name attribute's per grouping."
    type: count_distinct
    sql: ${isdefault_last_name_attribute} ;;
  }

  measure: isdefault_last_name_attribute_count_all {
    label: "Isdefault Last Name Attribute Count"
    description: "The count of all non-null isdefault last name attribute occurrences per grouping."
    type: number
    sql: COUNT(case when ${isdefault_last_name_attribute} IS NOT NULL then ${isdefault_last_name_attribute} else null end) ;;
  }

  measure: isdefault_login_id_attribute_count {
    label: "Isdefault Login Id Attribute Count (Distinct)"
    description: "The distinct count of isdefault login id attribute's per grouping."
    type: count_distinct
    sql: ${isdefault_login_id_attribute} ;;
  }

  measure: isdefault_login_id_attribute_count_all {
    label: "Isdefault Login Id Attribute Count"
    description: "The count of all non-null isdefault login id attribute occurrences per grouping."
    type: number
    sql: COUNT(case when ${isdefault_login_id_attribute} IS NOT NULL then ${isdefault_login_id_attribute} else null end) ;;
  }

  measure: connection_security_count {
    label: "Connection Security Count (Distinct)"
    description: "The distinct count of connection security's per grouping."
    type: count_distinct
    sql: ${connection_security} ;;
  }

  measure: connection_security_count_all {
    label: "Connection Security Count"
    description: "The count of all non-null connection security occurrences per grouping."
    type: number
    sql: COUNT(case when ${connection_security} IS NOT NULL then ${connection_security} else null end) ;;
  }

  measure: sync_interval_minutes_count {
    label: "Sync Interval Minutes Count (Distinct)"
    description: "The distinct count of sync interval minutes's per grouping."
    type: count_distinct
    sql: ${sync_interval_minutes} ;;
  }

  measure: sync_interval_minutes_count_all {
    label: "Sync Interval Minutes Count"
    description: "The count of all non-null sync interval minutes occurrences per grouping."
    type: number
    sql: COUNT(case when ${sync_interval_minutes} IS NOT NULL then ${sync_interval_minutes} else null end) ;;
  }

  measure: isempty_group_filter_count {
    label: "Isempty Group Filter Count (Distinct)"
    description: "The distinct count of isempty group filter's per grouping."
    type: count_distinct
    sql: ${isempty_group_filter} ;;
  }

  measure: isempty_group_filter_count_all {
    label: "Isempty Group Filter Count"
    description: "The count of all non-null isempty group filter occurrences per grouping."
    type: number
    sql: COUNT(case when ${isempty_group_filter} IS NOT NULL then ${isempty_group_filter} else null end) ;;
  }

  measure: isdefault_first_name_attribute_count {
    label: "Isdefault First Name Attribute Count (Distinct)"
    description: "The distinct count of isdefault first name attribute's per grouping."
    type: count_distinct
    sql: ${isdefault_first_name_attribute} ;;
  }

  measure: isdefault_first_name_attribute_count_all {
    label: "Isdefault First Name Attribute Count"
    description: "The count of all non-null isdefault first name attribute occurrences per grouping."
    type: number
    sql: COUNT(case when ${isdefault_first_name_attribute} IS NOT NULL then ${isdefault_first_name_attribute} else null end) ;;
  }

  measure: skip_certificate_verification_count {
    label: "Skip Certificate Verification Count (Distinct)"
    description: "The distinct count of skip certificate verification's per grouping."
    type: count_distinct
    sql: ${skip_certificate_verification} ;;
  }

  measure: skip_certificate_verification_count_all {
    label: "Skip Certificate Verification Count"
    description: "The count of all non-null skip certificate verification occurrences per grouping."
    type: number
    sql: COUNT(case when ${skip_certificate_verification} IS NOT NULL then ${skip_certificate_verification} else null end) ;;
  }

  measure: isdefault_login_button_color_count {
    label: "Isdefault Login Button Color Count (Distinct)"
    description: "The distinct count of isdefault login button color's per grouping."
    type: count_distinct
    sql: ${isdefault_login_button_color} ;;
  }

  measure: isdefault_login_button_color_count_all {
    label: "Isdefault Login Button Color Count"
    description: "The count of all non-null isdefault login button color occurrences per grouping."
    type: number
    sql: COUNT(case when ${isdefault_login_button_color} IS NOT NULL then ${isdefault_login_button_color} else null end) ;;
  }

  measure: isdefault_login_button_border_color_count {
    label: "Isdefault Login Button Border Color Count (Distinct)"
    description: "The distinct count of isdefault login button border color's per grouping."
    type: count_distinct
    sql: ${isdefault_login_button_border_color} ;;
  }

  measure: isdefault_login_button_border_color_count_all {
    label: "Isdefault Login Button Border Color Count"
    description: "The count of all non-null isdefault login button border color occurrences per grouping."
    type: number
    sql: COUNT(case when ${isdefault_login_button_border_color} IS NOT NULL then ${isdefault_login_button_border_color} else null end) ;;
  }

  measure: isdefault_login_button_text_color_count {
    label: "Isdefault Login Button Text Color Count (Distinct)"
    description: "The distinct count of isdefault login button text color's per grouping."
    type: count_distinct
    sql: ${isdefault_login_button_text_color} ;;
  }

  measure: isdefault_login_button_text_color_count_all {
    label: "Isdefault Login Button Text Color Count"
    description: "The count of all non-null isdefault login button text color occurrences per grouping."
    type: number
    sql: COUNT(case when ${isdefault_login_button_text_color} IS NOT NULL then ${isdefault_login_button_text_color} else null end) ;;
  }

  measure: isdefault_group_id_attribute_count {
    label: "Isdefault Group Id Attribute Count (Distinct)"
    description: "The distinct count of isdefault group id attribute's per grouping."
    type: count_distinct
    sql: ${isdefault_group_id_attribute} ;;
  }

  measure: isdefault_group_id_attribute_count_all {
    label: "Isdefault Group Id Attribute Count"
    description: "The count of all non-null isdefault group id attribute occurrences per grouping."
    type: number
    sql: COUNT(case when ${isdefault_group_id_attribute} IS NOT NULL then ${isdefault_group_id_attribute} else null end) ;;
  }

  measure: enable_admin_filter_count {
    label: "Enable Admin Filter Count (Distinct)"
    description: "The distinct count of enable admin filter's per grouping."
    type: count_distinct
    sql: ${enable_admin_filter} ;;
  }

  measure: enable_admin_filter_count_all {
    label: "Enable Admin Filter Count"
    description: "The count of all non-null enable admin filter occurrences per grouping."
    type: number
    sql: COUNT(case when ${enable_admin_filter} IS NOT NULL then ${enable_admin_filter} else null end) ;;
  }

  measure: isdefault_group_display_name_attribute_count {
    label: "Isdefault Group Display Name Attribute Count (Distinct)"
    description: "The distinct count of isdefault group display name attribute's per grouping."
    type: count_distinct
    sql: ${isdefault_group_display_name_attribute} ;;
  }

  measure: isdefault_group_display_name_attribute_count_all {
    label: "Isdefault Group Display Name Attribute Count"
    description: "The count of all non-null isdefault group display name attribute occurrences per grouping."
    type: number
    sql: COUNT(case when ${isdefault_group_display_name_attribute} IS NOT NULL then ${isdefault_group_display_name_attribute} else null end) ;;
  }

  measure: isnotempty_picture_attribute_count {
    label: "Isnotempty Picture Attribute Count (Distinct)"
    description: "The distinct count of isnotempty picture attribute's per grouping."
    type: count_distinct
    sql: ${isnotempty_picture_attribute} ;;
  }

  measure: isnotempty_picture_attribute_count_all {
    label: "Isnotempty Picture Attribute Count"
    description: "The count of all non-null isnotempty picture attribute occurrences per grouping."
    type: number
    sql: COUNT(case when ${isnotempty_picture_attribute} IS NOT NULL then ${isnotempty_picture_attribute} else null end) ;;
  }

  measure: file_json_count {
    label: "File Json Count (Distinct)"
    description: "The distinct count of file json's per grouping."
    type: count_distinct
    sql: ${file_json} ;;
  }

  measure: file_json_count_all {
    label: "File Json Count"
    description: "The count of all non-null file json occurrences per grouping."
    type: number
    sql: COUNT(case when ${file_json} IS NOT NULL then ${file_json} else null end) ;;
  }

  measure: file_level_count {
    label: "File Level Count (Distinct)"
    description: "The distinct count of file level's per grouping."
    type: count_distinct
    sql: ${file_level} ;;
  }

  measure: file_level_count_all {
    label: "File Level Count"
    description: "The count of all non-null file level occurrences per grouping."
    type: number
    sql: COUNT(case when ${file_level} IS NOT NULL then ${file_level} else null end) ;;
  }

  measure: enable_file_count {
    label: "Enable File Count (Distinct)"
    description: "The distinct count of enable file's per grouping."
    type: count_distinct
    sql: ${enable_file} ;;
  }

  measure: enable_file_count_all {
    label: "Enable File Count"
    description: "The count of all non-null enable file occurrences per grouping."
    type: number
    sql: COUNT(case when ${enable_file} IS NOT NULL then ${enable_file} else null end) ;;
  }

  measure: console_json_count {
    label: "Console Json Count (Distinct)"
    description: "The distinct count of console json's per grouping."
    type: count_distinct
    sql: ${console_json} ;;
  }

  measure: console_json_count_all {
    label: "Console Json Count"
    description: "The count of all non-null console json occurrences per grouping."
    type: number
    sql: COUNT(case when ${console_json} IS NOT NULL then ${console_json} else null end) ;;
  }

  measure: isdefault_file_location_count {
    label: "Isdefault File Location Count (Distinct)"
    description: "The distinct count of isdefault file location's per grouping."
    type: count_distinct
    sql: ${isdefault_file_location} ;;
  }

  measure: isdefault_file_location_count_all {
    label: "Isdefault File Location Count"
    description: "The count of all non-null isdefault file location occurrences per grouping."
    type: number
    sql: COUNT(case when ${isdefault_file_location} IS NOT NULL then ${isdefault_file_location} else null end) ;;
  }

  measure: console_level_count {
    label: "Console Level Count (Distinct)"
    description: "The distinct count of console level's per grouping."
    type: count_distinct
    sql: ${console_level} ;;
  }

  measure: console_level_count_all {
    label: "Console Level Count"
    description: "The count of all non-null console level occurrences per grouping."
    type: number
    sql: COUNT(case when ${console_level} IS NOT NULL then ${console_level} else null end) ;;
  }

  measure: enable_webhook_debugging_count {
    label: "Enable Webhook Debugging Count (Distinct)"
    description: "The distinct count of enable webhook debugging's per grouping."
    type: count_distinct
    sql: ${enable_webhook_debugging} ;;
  }

  measure: enable_webhook_debugging_count_all {
    label: "Enable Webhook Debugging Count"
    description: "The count of all non-null enable webhook debugging occurrences per grouping."
    type: number
    sql: COUNT(case when ${enable_webhook_debugging} IS NOT NULL then ${enable_webhook_debugging} else null end) ;;
  }

  measure: enable_console_count {
    label: "Enable Console Count (Distinct)"
    description: "The distinct count of enable console's per grouping."
    type: count_distinct
    sql: ${enable_console} ;;
  }

  measure: enable_console_count_all {
    label: "Enable Console Count"
    description: "The count of all non-null enable console occurrences per grouping."
    type: number
    sql: COUNT(case when ${enable_console} IS NOT NULL then ${enable_console} else null end) ;;
  }

  measure: export_format_count {
    label: "Export Format Count (Distinct)"
    description: "The distinct count of export format's per grouping."
    type: count_distinct
    sql: ${export_format} ;;
  }

  measure: export_format_count_all {
    label: "Export Format Count"
    description: "The count of all non-null export format occurrences per grouping."
    type: number
    sql: COUNT(case when ${export_format} IS NOT NULL then ${export_format} else null end) ;;
  }

  measure: enable_message_export_count {
    label: "Enable Message Export Count (Distinct)"
    description: "The distinct count of enable message export's per grouping."
    type: count_distinct
    sql: ${enable_message_export} ;;
  }

  measure: enable_message_export_count_all {
    label: "Enable Message Export Count"
    description: "The count of all non-null enable message export occurrences per grouping."
    type: number
    sql: COUNT(case when ${enable_message_export} IS NOT NULL then ${enable_message_export} else null end) ;;
  }

  measure: default_export_from_timestamp_count {
    label: "Default Export From Timestamp Count (Distinct)"
    description: "The distinct count of default export from timestamp's per grouping."
    type: count_distinct
    sql: ${default_export_from_timestamp} ;;
  }

  measure: default_export_from_timestamp_count_all {
    label: "Default Export From Timestamp Count"
    description: "The count of all non-null default export from timestamp occurrences per grouping."
    type: number
    sql: COUNT(case when ${default_export_from_timestamp} IS NOT NULL then ${default_export_from_timestamp} else null end) ;;
  }

  measure: is_default_global_relay_smtp_username_count {
    label: "Is Default Global Relay Smtp Username Count (Distinct)"
    description: "The distinct count of is default global relay smtp username's per grouping."
    type: count_distinct
    sql: ${is_default_global_relay_smtp_username} ;;
  }

  measure: is_default_global_relay_smtp_username_count_all {
    label: "Is Default Global Relay Smtp Username Count"
    description: "The count of all non-null is default global relay smtp username occurrences per grouping."
    type: number
    sql: COUNT(case when ${is_default_global_relay_smtp_username} IS NOT NULL then ${is_default_global_relay_smtp_username} else null end) ;;
  }

  measure: is_default_global_relay_email_address_count {
    label: "Is Default Global Relay Email Address Count (Distinct)"
    description: "The distinct count of is default global relay email address's per grouping."
    type: count_distinct
    sql: ${is_default_global_relay_email_address} ;;
  }

  measure: is_default_global_relay_email_address_count_all {
    label: "Is Default Global Relay Email Address Count"
    description: "The count of all non-null is default global relay email address occurrences per grouping."
    type: number
    sql: COUNT(case when ${is_default_global_relay_email_address} IS NOT NULL then ${is_default_global_relay_email_address} else null end) ;;
  }

  measure: is_default_global_relay_smtp_password_count {
    label: "Is Default Global Relay Smtp Password Count (Distinct)"
    description: "The distinct count of is default global relay smtp password's per grouping."
    type: count_distinct
    sql: ${is_default_global_relay_smtp_password} ;;
  }

  measure: is_default_global_relay_smtp_password_count_all {
    label: "Is Default Global Relay Smtp Password Count"
    description: "The count of all non-null is default global relay smtp password occurrences per grouping."
    type: number
    sql: COUNT(case when ${is_default_global_relay_smtp_password} IS NOT NULL then ${is_default_global_relay_smtp_password} else null end) ;;
  }

  measure: global_relay_customer_type_count {
    label: "Global Relay Customer Type Count (Distinct)"
    description: "The distinct count of global relay customer type's per grouping."
    type: count_distinct
    sql: ${global_relay_customer_type} ;;
  }

  measure: global_relay_customer_type_count_all {
    label: "Global Relay Customer Type Count"
    description: "The count of all non-null global relay customer type occurrences per grouping."
    type: number
    sql: COUNT(case when ${global_relay_customer_type} IS NOT NULL then ${global_relay_customer_type} else null end) ;;
  }

  measure: batch_size_count {
    label: "Batch Size Count (Distinct)"
    description: "The distinct count of batch size's per grouping."
    type: count_distinct
    sql: ${batch_size} ;;
  }

  measure: batch_size_count_all {
    label: "Batch Size Count"
    description: "The count of all non-null batch size occurrences per grouping."
    type: number
    sql: COUNT(case when ${batch_size} IS NOT NULL then ${batch_size} else null end) ;;
  }

  measure: daily_run_time_count {
    label: "Daily Run Time Count (Distinct)"
    description: "The distinct count of daily run time's per grouping."
    type: count_distinct
    sql: ${daily_run_time} ;;
  }

  measure: daily_run_time_count_all {
    label: "Daily Run Time Count"
    description: "The count of all non-null daily run time occurrences per grouping."
    type: number
    sql: COUNT(case when ${daily_run_time} IS NOT NULL then ${daily_run_time} else null end) ;;
  }

  measure: block_profile_rate_count {
    label: "Block Profile Rate Count (Distinct)"
    description: "The distinct count of block profile rate's per grouping."
    type: count_distinct
    sql: ${block_profile_rate} ;;
  }

  measure: block_profile_rate_count_all {
    label: "Block Profile Rate Count"
    description: "The count of all non-null block profile rate occurrences per grouping."
    type: number
    sql: COUNT(case when ${block_profile_rate} IS NOT NULL then ${block_profile_rate} else null end) ;;
  }

  measure: isdefault_app_download_link_count {
    label: "Isdefault App Download Link Count (Distinct)"
    description: "The distinct count of isdefault app download link's per grouping."
    type: count_distinct
    sql: ${isdefault_app_download_link} ;;
  }

  measure: isdefault_app_download_link_count_all {
    label: "Isdefault App Download Link Count"
    description: "The count of all non-null isdefault app download link occurrences per grouping."
    type: number
    sql: COUNT(case when ${isdefault_app_download_link} IS NOT NULL then ${isdefault_app_download_link} else null end) ;;
  }

  measure: isdefault_android_app_download_link_count {
    label: "Isdefault Android App Download Link Count (Distinct)"
    description: "The distinct count of isdefault android app download link's per grouping."
    type: count_distinct
    sql: ${isdefault_android_app_download_link} ;;
  }

  measure: isdefault_android_app_download_link_count_all {
    label: "Isdefault Android App Download Link Count"
    description: "The count of all non-null isdefault android app download link occurrences per grouping."
    type: number
    sql: COUNT(case when ${isdefault_android_app_download_link} IS NOT NULL then ${isdefault_android_app_download_link} else null end) ;;
  }

  measure: isdefault_iosapp_download_link_count {
    label: "Isdefault Iosapp Download Link Count (Distinct)"
    description: "The distinct count of isdefault iosapp download link's per grouping."
    type: count_distinct
    sql: ${isdefault_iosapp_download_link} ;;
  }

  measure: isdefault_iosapp_download_link_count_all {
    label: "Isdefault Iosapp Download Link Count"
    description: "The count of all non-null isdefault iosapp download link occurrences per grouping."
    type: number
    sql: COUNT(case when ${isdefault_iosapp_download_link} IS NOT NULL then ${isdefault_iosapp_download_link} else null end) ;;
  }

  measure: number_count {
    label: "Number Count (Distinct)"
    description: "The distinct count of number's per grouping."
    type: count_distinct
    sql: ${number} ;;
  }

  measure: number_count_all {
    label: "Number Count"
    description: "The count of all non-null number occurrences per grouping."
    type: number
    sql: COUNT(case when ${number} IS NOT NULL then ${number} else null end) ;;
  }

  measure: minimum_length_count {
    label: "Minimum Length Count (Distinct)"
    description: "The distinct count of minimum length's per grouping."
    type: count_distinct
    sql: ${minimum_length} ;;
  }

  measure: minimum_length_count_all {
    label: "Minimum Length Count"
    description: "The count of all non-null minimum length occurrences per grouping."
    type: number
    sql: COUNT(case when ${minimum_length} IS NOT NULL then ${minimum_length} else null end) ;;
  }

  measure: lowercase_count {
    label: "Lowercase Count (Distinct)"
    description: "The distinct count of lowercase's per grouping."
    type: count_distinct
    sql: ${lowercase} ;;
  }

  measure: lowercase_count_all {
    label: "Lowercase Count"
    description: "The count of all non-null lowercase occurrences per grouping."
    type: number
    sql: COUNT(case when ${lowercase} IS NOT NULL then ${lowercase} else null end) ;;
  }

  measure: symbol_count {
    label: "Symbol Count (Distinct)"
    description: "The distinct count of symbol's per grouping."
    type: count_distinct
    sql: ${symbol} ;;
  }

  measure: symbol_count_all {
    label: "Symbol Count"
    description: "The count of all non-null symbol occurrences per grouping."
    type: number
    sql: COUNT(case when ${symbol} IS NOT NULL then ${symbol} else null end) ;;
  }

  measure: uppercase_count {
    label: "Uppercase Count (Distinct)"
    description: "The distinct count of uppercase's per grouping."
    type: count_distinct
    sql: ${uppercase} ;;
  }

  measure: uppercase_count_all {
    label: "Uppercase Count"
    description: "The count of all non-null uppercase occurrences per grouping."
    type: number
    sql: COUNT(case when ${uppercase} IS NOT NULL then ${uppercase} else null end) ;;
  }

  measure: show_email_address_count {
    label: "Show Email Address Count (Distinct)"
    description: "The distinct count of show email address's per grouping."
    type: count_distinct
    sql: ${show_email_address} ;;
  }

  measure: show_email_address_count_all {
    label: "Show Email Address Count"
    description: "The count of all non-null show email address occurrences per grouping."
    type: number
    sql: COUNT(case when ${show_email_address} IS NOT NULL then ${show_email_address} else null end) ;;
  }

  measure: show_full_name_count {
    label: "Show Full Name Count (Distinct)"
    description: "The distinct count of show full name's per grouping."
    type: count_distinct
    sql: ${show_full_name} ;;
  }

  measure: show_full_name_count_all {
    label: "Show Full Name Count"
    description: "The count of all non-null show full name occurrences per grouping."
    type: number
    sql: COUNT(case when ${show_full_name} IS NOT NULL then ${show_full_name} else null end) ;;
  }

  measure: vary_by_remote_address_count {
    label: "Vary By Remote Address Count (Distinct)"
    description: "The distinct count of vary by remote address's per grouping."
    type: count_distinct
    sql: ${vary_by_remote_address} ;;
  }

  measure: vary_by_remote_address_count_all {
    label: "Vary By Remote Address Count"
    description: "The count of all non-null vary by remote address occurrences per grouping."
    type: number
    sql: COUNT(case when ${vary_by_remote_address} IS NOT NULL then ${vary_by_remote_address} else null end) ;;
  }

  measure: max_burst_count {
    label: "Max Burst Count (Distinct)"
    description: "The distinct count of max burst's per grouping."
    type: count_distinct
    sql: ${max_burst} ;;
  }

  measure: max_burst_count_all {
    label: "Max Burst Count"
    description: "The count of all non-null max burst occurrences per grouping."
    type: number
    sql: COUNT(case when ${max_burst} IS NOT NULL then ${max_burst} else null end) ;;
  }

  measure: memory_store_size_count {
    label: "Memory Store Size Count (Distinct)"
    description: "The distinct count of memory store size's per grouping."
    type: count_distinct
    sql: ${memory_store_size} ;;
  }

  measure: memory_store_size_count_all {
    label: "Memory Store Size Count"
    description: "The count of all non-null memory store size occurrences per grouping."
    type: number
    sql: COUNT(case when ${memory_store_size} IS NOT NULL then ${memory_store_size} else null end) ;;
  }

  measure: isdefault_vary_by_header_count {
    label: "Isdefault Vary By Header Count (Distinct)"
    description: "The distinct count of isdefault vary by header's per grouping."
    type: count_distinct
    sql: ${isdefault_vary_by_header} ;;
  }

  measure: isdefault_vary_by_header_count_all {
    label: "Isdefault Vary By Header Count"
    description: "The count of all non-null isdefault vary by header occurrences per grouping."
    type: number
    sql: COUNT(case when ${isdefault_vary_by_header} IS NOT NULL then ${isdefault_vary_by_header} else null end) ;;
  }

  measure: per_sec_count {
    label: "Per Sec Count (Distinct)"
    description: "The distinct count of per sec's per grouping."
    type: count_distinct
    sql: ${per_sec} ;;
  }

  measure: per_sec_count_all {
    label: "Per Sec Count"
    description: "The count of all non-null per sec occurrences per grouping."
    type: number
    sql: COUNT(case when ${per_sec} IS NOT NULL then ${per_sec} else null end) ;;
  }

  measure: enable_rate_limiter_count {
    label: "Enable Rate Limiter Count (Distinct)"
    description: "The distinct count of enable rate limiter's per grouping."
    type: count_distinct
    sql: ${enable_rate_limiter} ;;
  }

  measure: enable_rate_limiter_count_all {
    label: "Enable Rate Limiter Count"
    description: "The count of all non-null enable rate limiter occurrences per grouping."
    type: number
    sql: COUNT(case when ${enable_rate_limiter} IS NOT NULL then ${enable_rate_limiter} else null end) ;;
  }

  measure: vary_by_user_count {
    label: "Vary By User Count (Distinct)"
    description: "The distinct count of vary by user's per grouping."
    type: count_distinct
    sql: ${vary_by_user} ;;
  }

  measure: vary_by_user_count_all {
    label: "Vary By User Count"
    description: "The count of all non-null vary by user occurrences per grouping."
    type: number
    sql: COUNT(case when ${vary_by_user} IS NOT NULL then ${vary_by_user} else null end) ;;
  }

  measure: data_source_replicas_count {
    label: "Data Source Replicas Count (Distinct)"
    description: "The distinct count of data source replicas's per grouping."
    type: count_distinct
    sql: ${data_source_replicas} ;;
  }

  measure: data_source_replicas_count_all {
    label: "Data Source Replicas Count"
    description: "The count of all non-null data source replicas occurrences per grouping."
    type: number
    sql: COUNT(case when ${data_source_replicas} IS NOT NULL then ${data_source_replicas} else null end) ;;
  }

  measure: conn_max_lifetime_milliseconds_count {
    label: "Conn Max Lifetime Milliseconds Count (Distinct)"
    description: "The distinct count of conn max lifetime milliseconds's per grouping."
    type: count_distinct
    sql: ${conn_max_lifetime_milliseconds} ;;
  }

  measure: conn_max_lifetime_milliseconds_count_all {
    label: "Conn Max Lifetime Milliseconds Count"
    description: "The count of all non-null conn max lifetime milliseconds occurrences per grouping."
    type: number
    sql: COUNT(case when ${conn_max_lifetime_milliseconds} IS NOT NULL then ${conn_max_lifetime_milliseconds} else null end) ;;
  }

  measure: data_source_search_replicas_count {
    label: "Data Source Search Replicas Count (Distinct)"
    description: "The distinct count of data source search replicas's per grouping."
    type: count_distinct
    sql: ${data_source_search_replicas} ;;
  }

  measure: data_source_search_replicas_count_all {
    label: "Data Source Search Replicas Count"
    description: "The count of all non-null data source search replicas occurrences per grouping."
    type: number
    sql: COUNT(case when ${data_source_search_replicas} IS NOT NULL then ${data_source_search_replicas} else null end) ;;
  }

  measure: max_idle_conns_count {
    label: "Max Idle Conns Count (Distinct)"
    description: "The distinct count of max idle conns's per grouping."
    type: count_distinct
    sql: ${max_idle_conns} ;;
  }

  measure: max_idle_conns_count_all {
    label: "Max Idle Conns Count"
    description: "The count of all non-null max idle conns occurrences per grouping."
    type: number
    sql: COUNT(case when ${max_idle_conns} IS NOT NULL then ${max_idle_conns} else null end) ;;
  }

  measure: max_open_conns_count {
    label: "Max Open Conns Count (Distinct)"
    description: "The distinct count of max open conns's per grouping."
    type: count_distinct
    sql: ${max_open_conns} ;;
  }

  measure: max_open_conns_count_all {
    label: "Max Open Conns Count"
    description: "The count of all non-null max open conns occurrences per grouping."
    type: number
    sql: COUNT(case when ${max_open_conns} IS NOT NULL then ${max_open_conns} else null end) ;;
  }

  measure: disable_database_search_count {
    label: "Disable Database Search Count (Distinct)"
    description: "The distinct count of disable database search's per grouping."
    type: count_distinct
    sql: ${disable_database_search} ;;
  }

  measure: disable_database_search_count_all {
    label: "Disable Database Search Count"
    description: "The count of all non-null disable database search occurrences per grouping."
    type: number
    sql: COUNT(case when ${disable_database_search} IS NOT NULL then ${disable_database_search} else null end) ;;
  }

  measure: restrict_public_channel_management_count {
    label: "Restrict Public Channel Management Count (Distinct)"
    description: "The distinct count of restrict public channel management's per grouping."
    type: count_distinct
    sql: ${restrict_public_channel_management} ;;
  }

  measure: restrict_public_channel_management_count_all {
    label: "Restrict Public Channel Management Count"
    description: "The count of all non-null restrict public channel management occurrences per grouping."
    type: number
    sql: COUNT(case when ${restrict_public_channel_management} IS NOT NULL then ${restrict_public_channel_management} else null end) ;;
  }

  measure: isdefault_custom_brand_text_count {
    label: "Isdefault Custom Brand Text Count (Distinct)"
    description: "The distinct count of isdefault custom brand text's per grouping."
    type: count_distinct
    sql: ${isdefault_custom_brand_text} ;;
  }

  measure: isdefault_custom_brand_text_count_all {
    label: "Isdefault Custom Brand Text Count"
    description: "The count of all non-null isdefault custom brand text occurrences per grouping."
    type: number
    sql: COUNT(case when ${isdefault_custom_brand_text} IS NOT NULL then ${isdefault_custom_brand_text} else null end) ;;
  }

  measure: enable_user_creation_count {
    label: "Enable User Creation Count (Distinct)"
    description: "The distinct count of enable user creation's per grouping."
    type: count_distinct
    sql: ${enable_user_creation} ;;
  }

  measure: enable_user_creation_count_all {
    label: "Enable User Creation Count"
    description: "The count of all non-null enable user creation occurrences per grouping."
    type: number
    sql: COUNT(case when ${enable_user_creation} IS NOT NULL then ${enable_user_creation} else null end) ;;
  }

  measure: restrict_public_channel_creation_count {
    label: "Restrict Public Channel Creation Count (Distinct)"
    description: "The distinct count of restrict public channel creation's per grouping."
    type: count_distinct
    sql: ${restrict_public_channel_creation} ;;
  }

  measure: restrict_public_channel_creation_count_all {
    label: "Restrict Public Channel Creation Count"
    description: "The count of all non-null restrict public channel creation occurrences per grouping."
    type: number
    sql: COUNT(case when ${restrict_public_channel_creation} IS NOT NULL then ${restrict_public_channel_creation} else null end) ;;
  }

  measure: experimental_view_archived_channels_count {
    label: "Experimental View Archived Channels Count (Distinct)"
    description: "The distinct count of experimental view archived channels's per grouping."
    type: count_distinct
    sql: ${experimental_view_archived_channels} ;;
  }

  measure: experimental_view_archived_channels_count_all {
    label: "Experimental View Archived Channels Count"
    description: "The count of all non-null experimental view archived channels occurrences per grouping."
    type: number
    sql: COUNT(case when ${experimental_view_archived_channels} IS NOT NULL then ${experimental_view_archived_channels} else null end) ;;
  }

  measure: enable_open_server_count {
    label: "Enable Open Server Count (Distinct)"
    description: "The distinct count of enable open server's per grouping."
    type: count_distinct
    sql: ${enable_open_server} ;;
  }

  measure: enable_open_server_count_all {
    label: "Enable Open Server Count"
    description: "The count of all non-null enable open server occurrences per grouping."
    type: number
    sql: COUNT(case when ${enable_open_server} IS NOT NULL then ${enable_open_server} else null end) ;;
  }

  measure: isdefault_custom_description_text_count {
    label: "Isdefault Custom Description Text Count (Distinct)"
    description: "The distinct count of isdefault custom description text's per grouping."
    type: count_distinct
    sql: ${isdefault_custom_description_text} ;;
  }

  measure: isdefault_custom_description_text_count_all {
    label: "Isdefault Custom Description Text Count"
    description: "The count of all non-null isdefault custom description text occurrences per grouping."
    type: number
    sql: COUNT(case when ${isdefault_custom_description_text} IS NOT NULL then ${isdefault_custom_description_text} else null end) ;;
  }

  measure: experimental_default_channels_count {
    label: "Experimental Default Channels Count (Distinct)"
    description: "The distinct count of experimental default channels's per grouping."
    type: count_distinct
    sql: ${experimental_default_channels} ;;
  }

  measure: experimental_default_channels_count_all {
    label: "Experimental Default Channels Count"
    description: "The count of all non-null experimental default channels occurrences per grouping."
    type: number
    sql: COUNT(case when ${experimental_default_channels} IS NOT NULL then ${experimental_default_channels} else null end) ;;
  }

  measure: experimental_enable_automatic_replies_count {
    label: "Experimental Enable Automatic Replies Count (Distinct)"
    description: "The distinct count of experimental enable automatic replies's per grouping."
    type: count_distinct
    sql: ${experimental_enable_automatic_replies} ;;
  }

  measure: experimental_enable_automatic_replies_count_all {
    label: "Experimental Enable Automatic Replies Count"
    description: "The count of all non-null experimental enable automatic replies occurrences per grouping."
    type: number
    sql: COUNT(case when ${experimental_enable_automatic_replies} IS NOT NULL then ${experimental_enable_automatic_replies} else null end) ;;
  }

  measure: enable_custom_brand_count {
    label: "Enable Custom Brand Count (Distinct)"
    description: "The distinct count of enable custom brand's per grouping."
    type: count_distinct
    sql: ${enable_custom_brand} ;;
  }

  measure: enable_custom_brand_count_all {
    label: "Enable Custom Brand Count"
    description: "The count of all non-null enable custom brand occurrences per grouping."
    type: number
    sql: COUNT(case when ${enable_custom_brand} IS NOT NULL then ${enable_custom_brand} else null end) ;;
  }

  measure: restrict_private_channel_manage_members_count {
    label: "Restrict Private Channel Manage Members Count (Distinct)"
    description: "The distinct count of restrict private channel manage members's per grouping."
    type: count_distinct
    sql: ${restrict_private_channel_manage_members} ;;
  }

  measure: restrict_private_channel_manage_members_count_all {
    label: "Restrict Private Channel Manage Members Count"
    description: "The count of all non-null restrict private channel manage members occurrences per grouping."
    type: number
    sql: COUNT(case when ${restrict_private_channel_manage_members} IS NOT NULL then ${restrict_private_channel_manage_members} else null end) ;;
  }

  measure: enable_team_creation_count {
    label: "Enable Team Creation Count (Distinct)"
    description: "The distinct count of enable team creation's per grouping."
    type: count_distinct
    sql: ${enable_team_creation} ;;
  }

  measure: enable_team_creation_count_all {
    label: "Enable Team Creation Count"
    description: "The count of all non-null enable team creation occurrences per grouping."
    type: number
    sql: COUNT(case when ${enable_team_creation} IS NOT NULL then ${enable_team_creation} else null end) ;;
  }

  measure: enable_x_to_leave_channels_from_lhs_count {
    label: "Enable X To Leave Channels From Lhs Count (Distinct)"
    description: "The distinct count of enable x to leave channels from lhs's per grouping."
    type: count_distinct
    sql: ${enable_x_to_leave_channels_from_lhs} ;;
  }

  measure: enable_x_to_leave_channels_from_lhs_count_all {
    label: "Enable X To Leave Channels From Lhs Count"
    description: "The count of all non-null enable x to leave channels from lhs occurrences per grouping."
    type: number
    sql: COUNT(case when ${enable_x_to_leave_channels_from_lhs} IS NOT NULL then ${enable_x_to_leave_channels_from_lhs} else null end) ;;
  }

  measure: enable_user_deactivation_count {
    label: "Enable User Deactivation Count (Distinct)"
    description: "The distinct count of enable user deactivation's per grouping."
    type: count_distinct
    sql: ${enable_user_deactivation} ;;
  }

  measure: enable_user_deactivation_count_all {
    label: "Enable User Deactivation Count"
    description: "The count of all non-null enable user deactivation occurrences per grouping."
    type: number
    sql: COUNT(case when ${enable_user_deactivation} IS NOT NULL then ${enable_user_deactivation} else null end) ;;
  }

  measure: experimental_town_square_is_read_only_count {
    label: "Experimental Town Square Is Read Only Count (Distinct)"
    description: "The distinct count of experimental town square is read only's per grouping."
    type: count_distinct
    sql: ${experimental_town_square_is_read_only} ;;
  }

  measure: experimental_town_square_is_read_only_count_all {
    label: "Experimental Town Square Is Read Only Count"
    description: "The count of all non-null experimental town square is read only occurrences per grouping."
    type: number
    sql: COUNT(case when ${experimental_town_square_is_read_only} IS NOT NULL then ${experimental_town_square_is_read_only} else null end) ;;
  }

  measure: restrict_public_channel_deletion_count {
    label: "Restrict Public Channel Deletion Count (Distinct)"
    description: "The distinct count of restrict public channel deletion's per grouping."
    type: count_distinct
    sql: ${restrict_public_channel_deletion} ;;
  }

  measure: restrict_public_channel_deletion_count_all {
    label: "Restrict Public Channel Deletion Count"
    description: "The count of all non-null restrict public channel deletion occurrences per grouping."
    type: number
    sql: COUNT(case when ${restrict_public_channel_deletion} IS NOT NULL then ${restrict_public_channel_deletion} else null end) ;;
  }

  measure: restrict_private_channel_management_count {
    label: "Restrict Private Channel Management Count (Distinct)"
    description: "The distinct count of restrict private channel management's per grouping."
    type: count_distinct
    sql: ${restrict_private_channel_management} ;;
  }

  measure: restrict_private_channel_management_count_all {
    label: "Restrict Private Channel Management Count"
    description: "The count of all non-null restrict private channel management occurrences per grouping."
    type: number
    sql: COUNT(case when ${restrict_private_channel_management} IS NOT NULL then ${restrict_private_channel_management} else null end) ;;
  }

  measure: restrict_direct_message_count {
    label: "Restrict Direct Message Count (Distinct)"
    description: "The distinct count of restrict direct message's per grouping."
    type: count_distinct
    sql: ${restrict_direct_message} ;;
  }

  measure: restrict_direct_message_count_all {
    label: "Restrict Direct Message Count"
    description: "The count of all non-null restrict direct message occurrences per grouping."
    type: number
    sql: COUNT(case when ${restrict_direct_message} IS NOT NULL then ${restrict_direct_message} else null end) ;;
  }

  measure: restrict_private_channel_deletion_count {
    label: "Restrict Private Channel Deletion Count (Distinct)"
    description: "The distinct count of restrict private channel deletion's per grouping."
    type: count_distinct
    sql: ${restrict_private_channel_deletion} ;;
  }

  measure: restrict_private_channel_deletion_count_all {
    label: "Restrict Private Channel Deletion Count"
    description: "The count of all non-null restrict private channel deletion occurrences per grouping."
    type: number
    sql: COUNT(case when ${restrict_private_channel_deletion} IS NOT NULL then ${restrict_private_channel_deletion} else null end) ;;
  }

  measure: experimental_town_square_is_hidden_in_lhs_count {
    label: "Experimental Town Square Is Hidden In Lhs Count (Distinct)"
    description: "The distinct count of experimental town square is hidden in lhs's per grouping."
    type: count_distinct
    sql: ${experimental_town_square_is_hidden_in_lhs} ;;
  }

  measure: experimental_town_square_is_hidden_in_lhs_count_all {
    label: "Experimental Town Square Is Hidden In Lhs Count"
    description: "The count of all non-null experimental town square is hidden in lhs occurrences per grouping."
    type: number
    sql: COUNT(case when ${experimental_town_square_is_hidden_in_lhs} IS NOT NULL then ${experimental_town_square_is_hidden_in_lhs} else null end) ;;
  }

  measure: isdefault_user_status_away_timeout_count {
    label: "Isdefault User Status Away Timeout Count (Distinct)"
    description: "The distinct count of isdefault user status away timeout's per grouping."
    type: count_distinct
    sql: ${isdefault_user_status_away_timeout} ;;
  }

  measure: isdefault_user_status_away_timeout_count_all {
    label: "Isdefault User Status Away Timeout Count"
    description: "The count of all non-null isdefault user status away timeout occurrences per grouping."
    type: number
    sql: COUNT(case when ${isdefault_user_status_away_timeout} IS NOT NULL then ${isdefault_user_status_away_timeout} else null end) ;;
  }

  measure: max_channels_per_team_count {
    label: "Max Channels Per Team Count (Distinct)"
    description: "The distinct count of max channels per team's per grouping."
    type: count_distinct
    sql: ${max_channels_per_team} ;;
  }

  measure: max_channels_per_team_count_all {
    label: "Max Channels Per Team Count"
    description: "The count of all non-null max channels per team occurrences per grouping."
    type: number
    sql: COUNT(case when ${max_channels_per_team} IS NOT NULL then ${max_channels_per_team} else null end) ;;
  }

  measure: enable_confirm_notifications_to_channel_count {
    label: "Enable Confirm Notifications To Channel Count (Distinct)"
    description: "The distinct count of enable confirm notifications to channel's per grouping."
    type: count_distinct
    sql: ${enable_confirm_notifications_to_channel} ;;
  }

  measure: enable_confirm_notifications_to_channel_count_all {
    label: "Enable Confirm Notifications To Channel Count"
    description: "The count of all non-null enable confirm notifications to channel occurrences per grouping."
    type: number
    sql: COUNT(case when ${enable_confirm_notifications_to_channel} IS NOT NULL then ${enable_confirm_notifications_to_channel} else null end) ;;
  }

  measure: restrict_team_invite_count {
    label: "Restrict Team Invite Count (Distinct)"
    description: "The distinct count of restrict team invite's per grouping."
    type: count_distinct
    sql: ${restrict_team_invite} ;;
  }

  measure: restrict_team_invite_count_all {
    label: "Restrict Team Invite Count"
    description: "The count of all non-null restrict team invite occurrences per grouping."
    type: number
    sql: COUNT(case when ${restrict_team_invite} IS NOT NULL then ${restrict_team_invite} else null end) ;;
  }

  measure: max_notifications_per_channel_count {
    label: "Max Notifications Per Channel Count (Distinct)"
    description: "The distinct count of max notifications per channel's per grouping."
    type: count_distinct
    sql: ${max_notifications_per_channel} ;;
  }

  measure: max_notifications_per_channel_count_all {
    label: "Max Notifications Per Channel Count"
    description: "The count of all non-null max notifications per channel occurrences per grouping."
    type: number
    sql: COUNT(case when ${max_notifications_per_channel} IS NOT NULL then ${max_notifications_per_channel} else null end) ;;
  }

  measure: teammate_name_display_count {
    label: "Teammate Name Display Count (Distinct)"
    description: "The distinct count of teammate name display's per grouping."
    type: count_distinct
    sql: ${teammate_name_display} ;;
  }

  measure: teammate_name_display_count_all {
    label: "Teammate Name Display Count"
    description: "The count of all non-null teammate name display occurrences per grouping."
    type: number
    sql: COUNT(case when ${teammate_name_display} IS NOT NULL then ${teammate_name_display} else null end) ;;
  }

  measure: max_users_per_team_count {
    label: "Max Users Per Team Count (Distinct)"
    description: "The distinct count of max users per team's per grouping."
    type: count_distinct
    sql: ${max_users_per_team} ;;
  }

  measure: max_users_per_team_count_all {
    label: "Max Users Per Team Count"
    description: "The count of all non-null max users per team occurrences per grouping."
    type: number
    sql: COUNT(case when ${max_users_per_team} IS NOT NULL then ${max_users_per_team} else null end) ;;
  }

  measure: lock_teammate_name_display_count {
    label: "Lock Teammate Name Display Count (Distinct)"
    description: "The distinct count of lock teammate name display's per grouping."
    type: count_distinct
    sql: ${lock_teammate_name_display} ;;
  }

  measure: lock_teammate_name_display_count_all {
    label: "Lock Teammate Name Display Count"
    description: "The count of all non-null lock teammate name display occurrences per grouping."
    type: number
    sql: COUNT(case when ${lock_teammate_name_display} IS NOT NULL then ${lock_teammate_name_display} else null end) ;;
  }

  measure: restrict_private_channel_creation_count {
    label: "Restrict Private Channel Creation Count (Distinct)"
    description: "The distinct count of restrict private channel creation's per grouping."
    type: count_distinct
    sql: ${restrict_private_channel_creation} ;;
  }

  measure: restrict_private_channel_creation_count_all {
    label: "Restrict Private Channel Creation Count"
    description: "The count of all non-null restrict private channel creation occurrences per grouping."
    type: number
    sql: COUNT(case when ${restrict_private_channel_creation} IS NOT NULL then ${restrict_private_channel_creation} else null end) ;;
  }

  measure: experimental_primary_team_count {
    label: "Experimental Primary Team Count (Distinct)"
    description: "The distinct count of experimental primary team's per grouping."
    type: count_distinct
    sql: ${experimental_primary_team} ;;
  }

  measure: experimental_primary_team_count_all {
    label: "Experimental Primary Team Count"
    description: "The count of all non-null experimental primary team occurrences per grouping."
    type: number
    sql: COUNT(case when ${experimental_primary_team} IS NOT NULL then ${experimental_primary_team} else null end) ;;
  }

  measure: isdefault_site_name_count {
    label: "Isdefault Site Name Count (Distinct)"
    description: "The distinct count of isdefault site name's per grouping."
    type: count_distinct
    sql: ${isdefault_site_name} ;;
  }

  measure: isdefault_site_name_count_all {
    label: "Isdefault Site Name Count"
    description: "The count of all non-null isdefault site name occurrences per grouping."
    type: number
    sql: COUNT(case when ${isdefault_site_name} IS NOT NULL then ${isdefault_site_name} else null end) ;;
  }

  measure: allow_custom_themes_count {
    label: "Allow Custom Themes Count (Distinct)"
    description: "The distinct count of allow custom themes's per grouping."
    type: count_distinct
    sql: ${allow_custom_themes} ;;
  }

  measure: allow_custom_themes_count_all {
    label: "Allow Custom Themes Count"
    description: "The count of all non-null allow custom themes occurrences per grouping."
    type: number
    sql: COUNT(case when ${allow_custom_themes} IS NOT NULL then ${allow_custom_themes} else null end) ;;
  }

  measure: enable_theme_selection_count {
    label: "Enable Theme Selection Count (Distinct)"
    description: "The distinct count of enable theme selection's per grouping."
    type: count_distinct
    sql: ${enable_theme_selection} ;;
  }

  measure: enable_theme_selection_count_all {
    label: "Enable Theme Selection Count"
    description: "The count of all non-null enable theme selection occurrences per grouping."
    type: number
    sql: COUNT(case when ${enable_theme_selection} IS NOT NULL then ${enable_theme_selection} else null end) ;;
  }

  measure: isdefault_default_theme_count {
    label: "Isdefault Default Theme Count (Distinct)"
    description: "The distinct count of isdefault default theme's per grouping."
    type: count_distinct
    sql: ${isdefault_default_theme} ;;
  }

  measure: isdefault_default_theme_count_all {
    label: "Isdefault Default Theme Count"
    description: "The count of all non-null isdefault default theme occurrences per grouping."
    type: number
    sql: COUNT(case when ${isdefault_default_theme} IS NOT NULL then ${isdefault_default_theme} else null end) ;;
  }

  measure: allowed_themes_count {
    label: "Allowed Themes Count (Distinct)"
    description: "The distinct count of allowed themes's per grouping."
    type: count_distinct
    sql: ${allowed_themes} ;;
  }

  measure: allowed_themes_count_all {
    label: "Allowed Themes Count"
    description: "The count of all non-null allowed themes occurrences per grouping."
    type: number
    sql: COUNT(case when ${allowed_themes} IS NOT NULL then ${allowed_themes} else null end) ;;
  }

  measure: enabled_backend_plugins_count {
    label: "Enabled Backend Plugins Count (Distinct)"
    description: "The distinct count of enabled backend plugins's per grouping."
    type: count_distinct
    sql: ${enabled_backend_plugins} ;;
  }

  measure: enabled_backend_plugins_count_all {
    label: "Enabled Backend Plugins Count"
    description: "The count of all non-null enabled backend plugins occurrences per grouping."
    type: number
    sql: COUNT(case when ${enabled_backend_plugins} IS NOT NULL then ${enabled_backend_plugins} else null end) ;;
  }

  measure: plugins_with_broken_manifests_count {
    label: "Plugins With Broken Manifests Count (Distinct)"
    description: "The distinct count of plugins with broken manifests's per grouping."
    type: count_distinct
    sql: ${plugins_with_broken_manifests} ;;
  }

  measure: plugins_with_broken_manifests_count_all {
    label: "Plugins With Broken Manifests Count"
    description: "The count of all non-null plugins with broken manifests occurrences per grouping."
    type: number
    sql: COUNT(case when ${plugins_with_broken_manifests} IS NOT NULL then ${plugins_with_broken_manifests} else null end) ;;
  }

  measure: disabled_backend_plugins_count {
    label: "Disabled Backend Plugins Count (Distinct)"
    description: "The distinct count of disabled backend plugins's per grouping."
    type: count_distinct
    sql: ${disabled_backend_plugins} ;;
  }

  measure: disabled_backend_plugins_count_all {
    label: "Disabled Backend Plugins Count"
    description: "The count of all non-null disabled backend plugins occurrences per grouping."
    type: number
    sql: COUNT(case when ${disabled_backend_plugins} IS NOT NULL then ${disabled_backend_plugins} else null end) ;;
  }

  measure: enabled_webapp_plugins_count {
    label: "Enabled Webapp Plugins Count (Distinct)"
    description: "The distinct count of enabled webapp plugins's per grouping."
    type: count_distinct
    sql: ${enabled_webapp_plugins} ;;
  }

  measure: enabled_webapp_plugins_count_all {
    label: "Enabled Webapp Plugins Count"
    description: "The count of all non-null enabled webapp plugins occurrences per grouping."
    type: number
    sql: COUNT(case when ${enabled_webapp_plugins} IS NOT NULL then ${enabled_webapp_plugins} else null end) ;;
  }

  measure: plugins_with_settings_count {
    label: "Plugins With Settings Count (Distinct)"
    description: "The distinct count of plugins with settings's per grouping."
    type: count_distinct
    sql: ${plugins_with_settings} ;;
  }

  measure: plugins_with_settings_count_all {
    label: "Plugins With Settings Count"
    description: "The count of all non-null plugins with settings occurrences per grouping."
    type: number
    sql: COUNT(case when ${plugins_with_settings} IS NOT NULL then ${plugins_with_settings} else null end) ;;
  }

  measure: enabled_plugins_count {
    label: "Enabled Plugins Count (Distinct)"
    description: "The distinct count of enabled plugins's per grouping."
    type: count_distinct
    sql: ${enabled_plugins} ;;
  }

  measure: enabled_plugins_count_all {
    label: "Enabled Plugins Count"
    description: "The count of all non-null enabled plugins occurrences per grouping."
    type: number
    sql: COUNT(case when ${enabled_plugins} IS NOT NULL then ${enabled_plugins} else null end) ;;
  }

  measure: disabled_webapp_plugins_count {
    label: "Disabled Webapp Plugins Count (Distinct)"
    description: "The distinct count of disabled webapp plugins's per grouping."
    type: count_distinct
    sql: ${disabled_webapp_plugins} ;;
  }

  measure: disabled_webapp_plugins_count_all {
    label: "Disabled Webapp Plugins Count"
    description: "The count of all non-null disabled webapp plugins occurrences per grouping."
    type: number
    sql: COUNT(case when ${disabled_webapp_plugins} IS NOT NULL then ${disabled_webapp_plugins} else null end) ;;
  }

  measure: disabled_plugins_count {
    label: "Disabled Plugins Count (Distinct)"
    description: "The distinct count of disabled plugins's per grouping."
    type: count_distinct
    sql: ${disabled_plugins} ;;
  }

  measure: disabled_plugins_count_all {
    label: "Disabled Plugins Count"
    description: "The count of all non-null disabled plugins occurrences per grouping."
    type: number
    sql: COUNT(case when ${disabled_plugins} IS NOT NULL then ${disabled_plugins} else null end) ;;
  }

  measure: version_count {
    label: "Version Count (Distinct)"
    description: "The distinct count of version's per grouping."
    type: count_distinct
    sql: ${version} ;;
  }

  measure: version_count_all {
    label: "Version Count"
    description: "The count of all non-null version occurrences per grouping."
    type: number
    sql: COUNT(case when ${version} IS NOT NULL then ${version} else null end) ;;
  }

  measure: database_version_count {
    label: "Database Version Count (Distinct)"
    description: "The distinct count of database version's per grouping."
    type: count_distinct
    sql: ${database_version} ;;
  }

  measure: database_version_count_all {
    label: "Database Version Count"
    description: "The count of all non-null database version occurrences per grouping."
    type: number
    sql: COUNT(case when ${database_version} IS NOT NULL then ${database_version} else null end) ;;
  }

  measure: operating_system_count {
    label: "Operating System Count (Distinct)"
    description: "The distinct count of operating system's per grouping."
    type: count_distinct
    sql: ${operating_system} ;;
  }

  measure: operating_system_count_all {
    label: "Operating System Count"
    description: "The count of all non-null operating system occurrences per grouping."
    type: number
    sql: COUNT(case when ${operating_system} IS NOT NULL then ${operating_system} else null end) ;;
  }

  measure: database_type_count {
    label: "Database Type Count (Distinct)"
    description: "The distinct count of database type's per grouping."
    type: count_distinct
    sql: ${database_type} ;;
  }

  measure: database_type_count_all {
    label: "Database Type Count"
    description: "The count of all non-null database type occurrences per grouping."
    type: number
    sql: COUNT(case when ${database_type} IS NOT NULL then ${database_type} else null end) ;;
  }

  measure: edition_count {
    label: "Edition Count (Distinct)"
    description: "The distinct count of edition's per grouping."
    type: count_distinct
    sql: ${edition} ;;
  }

  measure: edition_count_all {
    label: "Edition Count"
    description: "The count of all non-null edition occurrences per grouping."
    type: number
    sql: COUNT(case when ${edition} IS NOT NULL then ${edition} else null end) ;;
  }

  measure: system_admins_count {
    label: "System Admins Count (Distinct)"
    description: "The distinct count of system admins's per grouping."
    type: count_distinct
    sql: ${system_admins} ;;
  }

  measure: system_admins_count_all {
    label: "System Admins Count"
    description: "The count of all non-null system admins occurrences per grouping."
    type: number
    sql: COUNT(case when ${system_admins} IS NOT NULL then ${system_admins} else null end) ;;
  }

  measure: distinct_group_member_count_count {
    label: "Distinct Group Member Count Count (Distinct)"
    description: "The distinct count of distinct group member count's per grouping."
    type: count_distinct
    sql: ${distinct_group_member_count} ;;
  }

  measure: distinct_group_member_count_count_all {
    label: "Distinct Group Member Count Count"
    description: "The count of all non-null distinct group member count occurrences per grouping."
    type: number
    sql: COUNT(case when ${distinct_group_member_count} IS NOT NULL then ${distinct_group_member_count} else null end) ;;
  }

  measure: group_team_count_count {
    label: "Group Team Count Count (Distinct)"
    description: "The distinct count of group team count's per grouping."
    type: count_distinct
    sql: ${group_team_count} ;;
  }

  measure: group_team_count_count_all {
    label: "Group Team Count Count"
    description: "The count of all non-null group team count occurrences per grouping."
    type: number
    sql: COUNT(case when ${group_team_count} IS NOT NULL then ${group_team_count} else null end) ;;
  }

  measure: group_member_count_count {
    label: "Group Member Count Count (Distinct)"
    description: "The distinct count of group member count's per grouping."
    type: count_distinct
    sql: ${group_member_count} ;;
  }

  measure: group_member_count_count_all {
    label: "Group Member Count Count"
    description: "The count of all non-null group member count occurrences per grouping."
    type: number
    sql: COUNT(case when ${group_member_count} IS NOT NULL then ${group_member_count} else null end) ;;
  }

  measure: group_count_count {
    label: "Group Count Count (Distinct)"
    description: "The distinct count of group count's per grouping."
    type: count_distinct
    sql: ${group_count} ;;
  }

  measure: group_count_count_all {
    label: "Group Count Count"
    description: "The count of all non-null group count occurrences per grouping."
    type: number
    sql: COUNT(case when ${group_count} IS NOT NULL then ${group_count} else null end) ;;
  }

  measure: group_synced_team_count_count {
    label: "Group Synced Team Count Count (Distinct)"
    description: "The distinct count of group synced team count's per grouping."
    type: count_distinct
    sql: ${group_synced_team_count} ;;
  }

  measure: group_synced_team_count_count_all {
    label: "Group Synced Team Count Count"
    description: "The count of all non-null group synced team count occurrences per grouping."
    type: number
    sql: COUNT(case when ${group_synced_team_count} IS NOT NULL then ${group_synced_team_count} else null end) ;;
  }

  measure: group_channel_count_count {
    label: "Group Channel Count Count (Distinct)"
    description: "The distinct count of group channel count's per grouping."
    type: count_distinct
    sql: ${group_channel_count} ;;
  }

  measure: group_channel_count_count_all {
    label: "Group Channel Count Count"
    description: "The count of all non-null group channel count occurrences per grouping."
    type: number
    sql: COUNT(case when ${group_channel_count} IS NOT NULL then ${group_channel_count} else null end) ;;
  }

  measure: group_synced_channel_count_count {
    label: "Group Synced Channel Count Count (Distinct)"
    description: "The distinct count of group synced channel count's per grouping."
    type: count_distinct
    sql: ${group_synced_channel_count} ;;
  }

  measure: group_synced_channel_count_count_all {
    label: "Group Synced Channel Count Count"
    description: "The count of all non-null group synced channel count occurrences per grouping."
    type: number
    sql: COUNT(case when ${group_synced_channel_count} IS NOT NULL then ${group_synced_channel_count} else null end) ;;
  }

  measure: group_count_with_allow_reference_count {
    label: "Group Count With Allow Reference Count (Distinct)"
    description: "The distinct count of group count with allow reference's per grouping."
    type: count_distinct
    sql: ${group_count_with_allow_reference} ;;
  }

  measure: group_count_with_allow_reference_count_all {
    label: "Group Count With Allow Reference Count"
    description: "The count of all non-null group count with allow reference occurrences per grouping."
    type: number
    sql: COUNT(case when ${group_count_with_allow_reference} IS NOT NULL then ${group_count_with_allow_reference} else null end) ;;
  }

  measure: send_email_notifications_count {
    label: "Send Email Notifications Count (Distinct)"
    description: "The distinct count of send email notifications's per grouping."
    type: count_distinct
    sql: ${send_email_notifications} ;;
  }

  measure: send_email_notifications_count_all {
    label: "Send Email Notifications Count"
    description: "The count of all non-null send email notifications occurrences per grouping."
    type: number
    sql: COUNT(case when ${send_email_notifications} IS NOT NULL then ${send_email_notifications} else null end) ;;
  }

  measure: require_email_verification_count {
    label: "Require Email Verification Count (Distinct)"
    description: "The distinct count of require email verification's per grouping."
    type: count_distinct
    sql: ${require_email_verification} ;;
  }

  measure: require_email_verification_count_all {
    label: "Require Email Verification Count"
    description: "The count of all non-null require email verification occurrences per grouping."
    type: number
    sql: COUNT(case when ${require_email_verification} IS NOT NULL then ${require_email_verification} else null end) ;;
  }

  measure: isdefault_reply_to_address_count {
    label: "Isdefault Reply To Address Count (Distinct)"
    description: "The distinct count of isdefault reply to address's per grouping."
    type: count_distinct
    sql: ${isdefault_reply_to_address} ;;
  }

  measure: isdefault_reply_to_address_count_all {
    label: "Isdefault Reply To Address Count"
    description: "The count of all non-null isdefault reply to address occurrences per grouping."
    type: number
    sql: COUNT(case when ${isdefault_reply_to_address} IS NOT NULL then ${isdefault_reply_to_address} else null end) ;;
  }

  measure: enable_email_batching_count {
    label: "Enable Email Batching Count (Distinct)"
    description: "The distinct count of enable email batching's per grouping."
    type: count_distinct
    sql: ${enable_email_batching} ;;
  }

  measure: enable_email_batching_count_all {
    label: "Enable Email Batching Count"
    description: "The count of all non-null enable email batching occurrences per grouping."
    type: number
    sql: COUNT(case when ${enable_email_batching} IS NOT NULL then ${enable_email_batching} else null end) ;;
  }

  measure: enable_sign_in_with_username_count {
    label: "Enable Sign In With Username Count (Distinct)"
    description: "The distinct count of enable sign in with username's per grouping."
    type: count_distinct
    sql: ${enable_sign_in_with_username} ;;
  }

  measure: enable_sign_in_with_username_count_all {
    label: "Enable Sign In With Username Count"
    description: "The count of all non-null enable sign in with username occurrences per grouping."
    type: number
    sql: COUNT(case when ${enable_sign_in_with_username} IS NOT NULL then ${enable_sign_in_with_username} else null end) ;;
  }

  measure: isdefault_feedback_name_count {
    label: "Isdefault Feedback Name Count (Distinct)"
    description: "The distinct count of isdefault feedback name's per grouping."
    type: count_distinct
    sql: ${isdefault_feedback_name} ;;
  }

  measure: isdefault_feedback_name_count_all {
    label: "Isdefault Feedback Name Count"
    description: "The count of all non-null isdefault feedback name occurrences per grouping."
    type: number
    sql: COUNT(case when ${isdefault_feedback_name} IS NOT NULL then ${isdefault_feedback_name} else null end) ;;
  }

  measure: send_push_notifications_count {
    label: "Send Push Notifications Count (Distinct)"
    description: "The distinct count of send push notifications's per grouping."
    type: count_distinct
    sql: ${send_push_notifications} ;;
  }

  measure: send_push_notifications_count_all {
    label: "Send Push Notifications Count"
    description: "The count of all non-null send push notifications occurrences per grouping."
    type: number
    sql: COUNT(case when ${send_push_notifications} IS NOT NULL then ${send_push_notifications} else null end) ;;
  }

  measure: email_batching_interval_count {
    label: "Email Batching Interval Count (Distinct)"
    description: "The distinct count of email batching interval's per grouping."
    type: count_distinct
    sql: ${email_batching_interval} ;;
  }

  measure: email_batching_interval_count_all {
    label: "Email Batching Interval Count"
    description: "The count of all non-null email batching interval occurrences per grouping."
    type: number
    sql: COUNT(case when ${email_batching_interval} IS NOT NULL then ${email_batching_interval} else null end) ;;
  }

  measure: enable_sign_up_with_email_count {
    label: "Enable Sign Up With Email Count (Distinct)"
    description: "The distinct count of enable sign up with email's per grouping."
    type: count_distinct
    sql: ${enable_sign_up_with_email} ;;
  }

  measure: enable_sign_up_with_email_count_all {
    label: "Enable Sign Up With Email Count"
    description: "The count of all non-null enable sign up with email occurrences per grouping."
    type: number
    sql: COUNT(case when ${enable_sign_up_with_email} IS NOT NULL then ${enable_sign_up_with_email} else null end) ;;
  }

  measure: email_batching_buffer_size_count {
    label: "Email Batching Buffer Size Count (Distinct)"
    description: "The distinct count of email batching buffer size's per grouping."
    type: count_distinct
    sql: ${email_batching_buffer_size} ;;
  }

  measure: email_batching_buffer_size_count_all {
    label: "Email Batching Buffer Size Count"
    description: "The count of all non-null email batching buffer size occurrences per grouping."
    type: number
    sql: COUNT(case when ${email_batching_buffer_size} IS NOT NULL then ${email_batching_buffer_size} else null end) ;;
  }

  measure: skip_server_certificate_verification_count {
    label: "Skip Server Certificate Verification Count (Distinct)"
    description: "The distinct count of skip server certificate verification's per grouping."
    type: count_distinct
    sql: ${skip_server_certificate_verification} ;;
  }

  measure: skip_server_certificate_verification_count_all {
    label: "Skip Server Certificate Verification Count"
    description: "The count of all non-null skip server certificate verification occurrences per grouping."
    type: number
    sql: COUNT(case when ${skip_server_certificate_verification} IS NOT NULL then ${skip_server_certificate_verification} else null end) ;;
  }

  measure: enable_smtp_auth_count {
    label: "Enable Smtp Auth Count (Distinct)"
    description: "The distinct count of enable smtp auth's per grouping."
    type: count_distinct
    sql: ${enable_smtp_auth} ;;
  }

  measure: enable_smtp_auth_count_all {
    label: "Enable Smtp Auth Count"
    description: "The count of all non-null enable smtp auth occurrences per grouping."
    type: number
    sql: COUNT(case when ${enable_smtp_auth} IS NOT NULL then ${enable_smtp_auth} else null end) ;;
  }

  measure: use_channel_in_email_notifications_count {
    label: "Use Channel In Email Notifications Count (Distinct)"
    description: "The distinct count of use channel in email notifications's per grouping."
    type: count_distinct
    sql: ${use_channel_in_email_notifications} ;;
  }

  measure: use_channel_in_email_notifications_count_all {
    label: "Use Channel In Email Notifications Count"
    description: "The count of all non-null use channel in email notifications occurrences per grouping."
    type: number
    sql: COUNT(case when ${use_channel_in_email_notifications} IS NOT NULL then ${use_channel_in_email_notifications} else null end) ;;
  }

  measure: isdefault_feedback_organization_count {
    label: "Isdefault Feedback Organization Count (Distinct)"
    description: "The distinct count of isdefault feedback organization's per grouping."
    type: count_distinct
    sql: ${isdefault_feedback_organization} ;;
  }

  measure: isdefault_feedback_organization_count_all {
    label: "Isdefault Feedback Organization Count"
    description: "The count of all non-null isdefault feedback organization occurrences per grouping."
    type: number
    sql: COUNT(case when ${isdefault_feedback_organization} IS NOT NULL then ${isdefault_feedback_organization} else null end) ;;
  }

  measure: smtp_server_timeout_count {
    label: "Smtp Server Timeout Count (Distinct)"
    description: "The distinct count of smtp server timeout's per grouping."
    type: count_distinct
    sql: ${smtp_server_timeout} ;;
  }

  measure: smtp_server_timeout_count_all {
    label: "Smtp Server Timeout Count"
    description: "The count of all non-null smtp server timeout occurrences per grouping."
    type: number
    sql: COUNT(case when ${smtp_server_timeout} IS NOT NULL then ${smtp_server_timeout} else null end) ;;
  }

  measure: email_notification_contents_type_count {
    label: "Email Notification Contents Type Count (Distinct)"
    description: "The distinct count of email notification contents type's per grouping."
    type: count_distinct
    sql: ${email_notification_contents_type} ;;
  }

  measure: email_notification_contents_type_count_all {
    label: "Email Notification Contents Type Count"
    description: "The count of all non-null email notification contents type occurrences per grouping."
    type: number
    sql: COUNT(case when ${email_notification_contents_type} IS NOT NULL then ${email_notification_contents_type} else null end) ;;
  }

  measure: enable_sign_in_with_email_count {
    label: "Enable Sign In With Email Count (Distinct)"
    description: "The distinct count of enable sign in with email's per grouping."
    type: count_distinct
    sql: ${enable_sign_in_with_email} ;;
  }

  measure: enable_sign_in_with_email_count_all {
    label: "Enable Sign In With Email Count"
    description: "The count of all non-null enable sign in with email occurrences per grouping."
    type: number
    sql: COUNT(case when ${enable_sign_in_with_email} IS NOT NULL then ${enable_sign_in_with_email} else null end) ;;
  }

  measure: enable_preview_mode_banner_count {
    label: "Enable Preview Mode Banner Count (Distinct)"
    description: "The distinct count of enable preview mode banner's per grouping."
    type: count_distinct
    sql: ${enable_preview_mode_banner} ;;
  }

  measure: enable_preview_mode_banner_count_all {
    label: "Enable Preview Mode Banner Count"
    description: "The count of all non-null enable preview mode banner occurrences per grouping."
    type: number
    sql: COUNT(case when ${enable_preview_mode_banner} IS NOT NULL then ${enable_preview_mode_banner} else null end) ;;
  }

  measure: push_notification_contents_count {
    label: "Push Notification Contents Count (Distinct)"
    description: "The distinct count of push notification contents's per grouping."
    type: count_distinct
    sql: ${push_notification_contents} ;;
  }

  measure: push_notification_contents_count_all {
    label: "Push Notification Contents Count"
    description: "The count of all non-null push notification contents occurrences per grouping."
    type: number
    sql: COUNT(case when ${push_notification_contents} IS NOT NULL then ${push_notification_contents} else null end) ;;
  }

  measure: isdefault_feedback_email_count {
    label: "Isdefault Feedback Email Count (Distinct)"
    description: "The distinct count of isdefault feedback email's per grouping."
    type: count_distinct
    sql: ${isdefault_feedback_email} ;;
  }

  measure: isdefault_feedback_email_count_all {
    label: "Isdefault Feedback Email Count"
    description: "The count of all non-null isdefault feedback email occurrences per grouping."
    type: number
    sql: COUNT(case when ${isdefault_feedback_email} IS NOT NULL then ${isdefault_feedback_email} else null end) ;;
  }

  measure: enforce_multifactor_authentication_count {
    label: "Enforce Multifactor Authentication Count (Distinct)"
    description: "The distinct count of enforce multifactor authentication's per grouping."
    type: count_distinct
    sql: ${enforce_multifactor_authentication} ;;
  }

  measure: enforce_multifactor_authentication_count_all {
    label: "Enforce Multifactor Authentication Count"
    description: "The count of all non-null enforce multifactor authentication occurrences per grouping."
    type: number
    sql: COUNT(case when ${enforce_multifactor_authentication} IS NOT NULL then ${enforce_multifactor_authentication} else null end) ;;
  }

  measure: allow_email_accounts_count {
    label: "Allow Email Accounts Count (Distinct)"
    description: "The distinct count of allow email accounts's per grouping."
    type: count_distinct
    sql: ${allow_email_accounts} ;;
  }

  measure: allow_email_accounts_count_all {
    label: "Allow Email Accounts Count"
    description: "The count of all non-null allow email accounts occurrences per grouping."
    type: number
    sql: COUNT(case when ${allow_email_accounts} IS NOT NULL then ${allow_email_accounts} else null end) ;;
  }

  measure: isdefault_restrict_creation_to_domains_count {
    label: "Isdefault Restrict Creation To Domains Count (Distinct)"
    description: "The distinct count of isdefault restrict creation to domains's per grouping."
    type: count_distinct
    sql: ${isdefault_restrict_creation_to_domains} ;;
  }

  measure: isdefault_restrict_creation_to_domains_count_all {
    label: "Isdefault Restrict Creation To Domains Count"
    description: "The count of all non-null isdefault restrict creation to domains occurrences per grouping."
    type: number
    sql: COUNT(case when ${isdefault_restrict_creation_to_domains} IS NOT NULL then ${isdefault_restrict_creation_to_domains} else null end) ;;
  }

  measure: default_client_locale_count {
    label: "Default Client Locale Count (Distinct)"
    description: "The distinct count of default client locale's per grouping."
    type: count_distinct
    sql: ${default_client_locale} ;;
  }

  measure: default_client_locale_count_all {
    label: "Default Client Locale Count"
    description: "The count of all non-null default client locale occurrences per grouping."
    type: number
    sql: COUNT(case when ${default_client_locale} IS NOT NULL then ${default_client_locale} else null end) ;;
  }

  measure: default_server_locale_count {
    label: "Default Server Locale Count (Distinct)"
    description: "The distinct count of default server locale's per grouping."
    type: count_distinct
    sql: ${default_server_locale} ;;
  }

  measure: default_server_locale_count_all {
    label: "Default Server Locale Count"
    description: "The count of all non-null default server locale occurrences per grouping."
    type: number
    sql: COUNT(case when ${default_server_locale} IS NOT NULL then ${default_server_locale} else null end) ;;
  }

  measure: available_locales_count {
    label: "Available Locales Count (Distinct)"
    description: "The distinct count of available locales's per grouping."
    type: count_distinct
    sql: ${available_locales} ;;
  }

  measure: available_locales_count_all {
    label: "Available Locales Count"
    description: "The count of all non-null available locales occurrences per grouping."
    type: number
    sql: COUNT(case when ${available_locales} IS NOT NULL then ${available_locales} else null end) ;;
  }

  measure: enable_uploads_count {
    label: "Enable Uploads Count (Distinct)"
    description: "The distinct count of enable uploads's per grouping."
    type: count_distinct
    sql: ${enable_uploads} ;;
  }

  measure: enable_uploads_count_all {
    label: "Enable Uploads Count"
    description: "The count of all non-null enable uploads occurrences per grouping."
    type: number
    sql: COUNT(case when ${enable_uploads} IS NOT NULL then ${enable_uploads} else null end) ;;
  }

  measure: enable_autolink_count {
    label: "Enable Autolink Count (Distinct)"
    description: "The distinct count of enable autolink's per grouping."
    type: count_distinct
    sql: ${enable_autolink} ;;
  }

  measure: enable_autolink_count_all {
    label: "Enable Autolink Count"
    description: "The count of all non-null enable autolink occurrences per grouping."
    type: number
    sql: COUNT(case when ${enable_autolink} IS NOT NULL then ${enable_autolink} else null end) ;;
  }

  measure: version_welcome_bot_count {
    label: "Version Welcome Bot Count (Distinct)"
    description: "The distinct count of version welcome bot's per grouping."
    type: count_distinct
    sql: ${version_welcome_bot} ;;
  }

  measure: version_welcome_bot_count_all {
    label: "Version Welcome Bot Count"
    description: "The count of all non-null version welcome bot occurrences per grouping."
    type: number
    sql: COUNT(case when ${version_welcome_bot} IS NOT NULL then ${version_welcome_bot} else null end) ;;
  }

  measure: enable_aws_sns_count {
    label: "Enable Aws Sns Count (Distinct)"
    description: "The distinct count of enable aws sns's per grouping."
    type: count_distinct
    sql: ${enable_aws_sns} ;;
  }

  measure: enable_aws_sns_count_all {
    label: "Enable Aws Sns Count"
    description: "The count of all non-null enable aws sns occurrences per grouping."
    type: number
    sql: COUNT(case when ${enable_aws_sns} IS NOT NULL then ${enable_aws_sns} else null end) ;;
  }

  measure: enable_jenkins_count {
    label: "Enable Jenkins Count (Distinct)"
    description: "The distinct count of enable jenkins's per grouping."
    type: count_distinct
    sql: ${enable_jenkins} ;;
  }

  measure: enable_jenkins_count_all {
    label: "Enable Jenkins Count"
    description: "The count of all non-null enable jenkins occurrences per grouping."
    type: number
    sql: COUNT(case when ${enable_jenkins} IS NOT NULL then ${enable_jenkins} else null end) ;;
  }

  measure: allow_insecure_download_url_count {
    label: "Allow Insecure Download Url Count (Distinct)"
    description: "The distinct count of allow insecure download url's per grouping."
    type: count_distinct
    sql: ${allow_insecure_download_url} ;;
  }

  measure: allow_insecure_download_url_count_all {
    label: "Allow Insecure Download Url Count"
    description: "The count of all non-null allow insecure download url occurrences per grouping."
    type: number
    sql: COUNT(case when ${allow_insecure_download_url} IS NOT NULL then ${allow_insecure_download_url} else null end) ;;
  }

  measure: enable_nps_survey_count {
    label: "Enable Nps Survey Count (Distinct)"
    description: "The distinct count of enable nps survey's per grouping."
    type: count_distinct
    sql: ${enable_nps_survey} ;;
  }

  measure: enable_nps_survey_count_all {
    label: "Enable Nps Survey Count"
    description: "The count of all non-null enable nps survey occurrences per grouping."
    type: number
    sql: COUNT(case when ${enable_nps_survey} IS NOT NULL then ${enable_nps_survey} else null end) ;;
  }

  measure: enable_antivirus_count {
    label: "Enable Antivirus Count (Distinct)"
    description: "The distinct count of enable antivirus's per grouping."
    type: count_distinct
    sql: ${enable_antivirus} ;;
  }

  measure: enable_antivirus_count_all {
    label: "Enable Antivirus Count"
    description: "The count of all non-null enable antivirus occurrences per grouping."
    type: number
    sql: COUNT(case when ${enable_antivirus} IS NOT NULL then ${enable_antivirus} else null end) ;;
  }

  measure: enable_zoom_count {
    label: "Enable Zoom Count (Distinct)"
    description: "The distinct count of enable zoom's per grouping."
    type: count_distinct
    sql: ${enable_zoom} ;;
  }

  measure: enable_zoom_count_all {
    label: "Enable Zoom Count"
    description: "The count of all non-null enable zoom occurrences per grouping."
    type: number
    sql: COUNT(case when ${enable_zoom} IS NOT NULL then ${enable_zoom} else null end) ;;
  }

  measure: enable_remote_marketplace_count {
    label: "Enable Remote Marketplace Count (Distinct)"
    description: "The distinct count of enable remote marketplace's per grouping."
    type: count_distinct
    sql: ${enable_remote_marketplace} ;;
  }

  measure: enable_remote_marketplace_count_all {
    label: "Enable Remote Marketplace Count"
    description: "The count of all non-null enable remote marketplace occurrences per grouping."
    type: number
    sql: COUNT(case when ${enable_remote_marketplace} IS NOT NULL then ${enable_remote_marketplace} else null end) ;;
  }

  measure: enable_webex_count {
    label: "Enable Webex Count (Distinct)"
    description: "The distinct count of enable webex's per grouping."
    type: count_distinct
    sql: ${enable_webex} ;;
  }

  measure: enable_webex_count_all {
    label: "Enable Webex Count"
    description: "The count of all non-null enable webex occurrences per grouping."
    type: number
    sql: COUNT(case when ${enable_webex} IS NOT NULL then ${enable_webex} else null end) ;;
  }

  measure: enable_custom_user_attributes_count {
    label: "Enable Custom User Attributes Count (Distinct)"
    description: "The distinct count of enable custom user attributes's per grouping."
    type: count_distinct
    sql: ${enable_custom_user_attributes} ;;
  }

  measure: enable_custom_user_attributes_count_all {
    label: "Enable Custom User Attributes Count"
    description: "The count of all non-null enable custom user attributes occurrences per grouping."
    type: number
    sql: COUNT(case when ${enable_custom_user_attributes} IS NOT NULL then ${enable_custom_user_attributes} else null end) ;;
  }

  measure: enable_nps_count {
    label: "Enable Nps Count (Distinct)"
    description: "The distinct count of enable nps's per grouping."
    type: count_distinct
    sql: ${enable_nps} ;;
  }

  measure: enable_nps_count_all {
    label: "Enable Nps Count"
    description: "The count of all non-null enable nps occurrences per grouping."
    type: number
    sql: COUNT(case when ${enable_nps} IS NOT NULL then ${enable_nps} else null end) ;;
  }

  measure: enable_github_count {
    label: "Enable Github Count (Distinct)"
    description: "The distinct count of enable github's per grouping."
    type: count_distinct
    sql: ${enable_github} ;;
  }

  measure: enable_github_count_all {
    label: "Enable Github Count"
    description: "The count of all non-null enable github occurrences per grouping."
    type: number
    sql: COUNT(case when ${enable_github} IS NOT NULL then ${enable_github} else null end) ;;
  }

  measure: enable_health_check_count {
    label: "Enable Health Check Count (Distinct)"
    description: "The distinct count of enable health check's per grouping."
    type: count_distinct
    sql: ${enable_health_check} ;;
  }

  measure: enable_health_check_count_all {
    label: "Enable Health Check Count"
    description: "The count of all non-null enable health check occurrences per grouping."
    type: number
    sql: COUNT(case when ${enable_health_check} IS NOT NULL then ${enable_health_check} else null end) ;;
  }

  measure: version_aws_sns_count {
    label: "Version Aws Sns Count (Distinct)"
    description: "The distinct count of version aws sns's per grouping."
    type: count_distinct
    sql: ${version_aws_sns} ;;
  }

  measure: version_aws_sns_count_all {
    label: "Version Aws Sns Count"
    description: "The count of all non-null version aws sns occurrences per grouping."
    type: number
    sql: COUNT(case when ${version_aws_sns} IS NOT NULL then ${version_aws_sns} else null end) ;;
  }

  measure: enable_gitlab_count {
    label: "Enable Gitlab Count (Distinct)"
    description: "The distinct count of enable gitlab's per grouping."
    type: count_distinct
    sql: ${enable_gitlab} ;;
  }

  measure: enable_gitlab_count_all {
    label: "Enable Gitlab Count"
    description: "The count of all non-null enable gitlab occurrences per grouping."
    type: number
    sql: COUNT(case when ${enable_gitlab} IS NOT NULL then ${enable_gitlab} else null end) ;;
  }

  measure: automatic_prepackaged_plugins_count {
    label: "Automatic Prepackaged Plugins Count (Distinct)"
    description: "The distinct count of automatic prepackaged plugins's per grouping."
    type: count_distinct
    sql: ${automatic_prepackaged_plugins} ;;
  }

  measure: automatic_prepackaged_plugins_count_all {
    label: "Automatic Prepackaged Plugins Count"
    description: "The count of all non-null automatic prepackaged plugins occurrences per grouping."
    type: number
    sql: COUNT(case when ${automatic_prepackaged_plugins} IS NOT NULL then ${automatic_prepackaged_plugins} else null end) ;;
  }

  measure: version_jenkins_count {
    label: "Version Jenkins Count (Distinct)"
    description: "The distinct count of version jenkins's per grouping."
    type: count_distinct
    sql: ${version_jenkins} ;;
  }

  measure: version_jenkins_count_all {
    label: "Version Jenkins Count"
    description: "The count of all non-null version jenkins occurrences per grouping."
    type: number
    sql: COUNT(case when ${version_jenkins} IS NOT NULL then ${version_jenkins} else null end) ;;
  }

  measure: version_webex_count {
    label: "Version Webex Count (Distinct)"
    description: "The distinct count of version webex's per grouping."
    type: count_distinct
    sql: ${version_webex} ;;
  }

  measure: version_webex_count_all {
    label: "Version Webex Count"
    description: "The count of all non-null version webex occurrences per grouping."
    type: number
    sql: COUNT(case when ${version_webex} IS NOT NULL then ${version_webex} else null end) ;;
  }

  measure: version_jira_count {
    label: "Version Jira Count (Distinct)"
    description: "The distinct count of version jira's per grouping."
    type: count_distinct
    sql: ${version_jira} ;;
  }

  measure: version_jira_count_all {
    label: "Version Jira Count"
    description: "The count of all non-null version jira occurrences per grouping."
    type: number
    sql: COUNT(case when ${version_jira} IS NOT NULL then ${version_jira} else null end) ;;
  }

  measure: version_github_count {
    label: "Version Github Count (Distinct)"
    description: "The distinct count of version github's per grouping."
    type: count_distinct
    sql: ${version_github} ;;
  }

  measure: version_github_count_all {
    label: "Version Github Count"
    description: "The count of all non-null version github occurrences per grouping."
    type: number
    sql: COUNT(case when ${version_github} IS NOT NULL then ${version_github} else null end) ;;
  }

  measure: is_default_marketplace_url_count {
    label: "Is Default Marketplace Url Count (Distinct)"
    description: "The distinct count of is default marketplace url's per grouping."
    type: count_distinct
    sql: ${is_default_marketplace_url} ;;
  }

  measure: is_default_marketplace_url_count_all {
    label: "Is Default Marketplace Url Count"
    description: "The count of all non-null is default marketplace url occurrences per grouping."
    type: number
    sql: COUNT(case when ${is_default_marketplace_url} IS NOT NULL then ${is_default_marketplace_url} else null end) ;;
  }

  measure: version_antivirus_count {
    label: "Version Antivirus Count (Distinct)"
    description: "The distinct count of version antivirus's per grouping."
    type: count_distinct
    sql: ${version_antivirus} ;;
  }

  measure: version_antivirus_count_all {
    label: "Version Antivirus Count"
    description: "The count of all non-null version antivirus occurrences per grouping."
    type: number
    sql: COUNT(case when ${version_antivirus} IS NOT NULL then ${version_antivirus} else null end) ;;
  }

  measure: version_nps_count {
    label: "Version Nps Count (Distinct)"
    description: "The distinct count of version nps's per grouping."
    type: count_distinct
    sql: ${version_nps} ;;
  }

  measure: version_nps_count_all {
    label: "Version Nps Count"
    description: "The count of all non-null version nps occurrences per grouping."
    type: number
    sql: COUNT(case when ${version_nps} IS NOT NULL then ${version_nps} else null end) ;;
  }

  measure: version_autolink_count {
    label: "Version Autolink Count (Distinct)"
    description: "The distinct count of version autolink's per grouping."
    type: count_distinct
    sql: ${version_autolink} ;;
  }

  measure: version_autolink_count_all {
    label: "Version Autolink Count"
    description: "The count of all non-null version autolink occurrences per grouping."
    type: number
    sql: COUNT(case when ${version_autolink} IS NOT NULL then ${version_autolink} else null end) ;;
  }

  measure: enable_welcome_bot_count {
    label: "Enable Welcome Bot Count (Distinct)"
    description: "The distinct count of enable welcome bot's per grouping."
    type: count_distinct
    sql: ${enable_welcome_bot} ;;
  }

  measure: enable_welcome_bot_count_all {
    label: "Enable Welcome Bot Count"
    description: "The count of all non-null enable welcome bot occurrences per grouping."
    type: number
    sql: COUNT(case when ${enable_welcome_bot} IS NOT NULL then ${enable_welcome_bot} else null end) ;;
  }

  measure: require_pluginsignature_count {
    label: "Require Pluginsignature Count (Distinct)"
    description: "The distinct count of require pluginsignature's per grouping."
    type: count_distinct
    sql: ${require_pluginsignature} ;;
  }

  measure: require_pluginsignature_count_all {
    label: "Require Pluginsignature Count"
    description: "The count of all non-null require pluginsignature occurrences per grouping."
    type: number
    sql: COUNT(case when ${require_pluginsignature} IS NOT NULL then ${require_pluginsignature} else null end) ;;
  }

  measure: version_zoom_count {
    label: "Version Zoom Count (Distinct)"
    description: "The distinct count of version zoom's per grouping."
    type: count_distinct
    sql: ${version_zoom} ;;
  }

  measure: version_zoom_count_all {
    label: "Version Zoom Count"
    description: "The count of all non-null version zoom occurrences per grouping."
    type: number
    sql: COUNT(case when ${version_zoom} IS NOT NULL then ${version_zoom} else null end) ;;
  }

  measure: signature_public_key_files_count {
    label: "Signature Public Key Files Count (Distinct)"
    description: "The distinct count of signature public key files's per grouping."
    type: count_distinct
    sql: ${signature_public_key_files} ;;
  }

  measure: signature_public_key_files_count_all {
    label: "Signature Public Key Files Count"
    description: "The count of all non-null signature public key files occurrences per grouping."
    type: number
    sql: COUNT(case when ${signature_public_key_files} IS NOT NULL then ${signature_public_key_files} else null end) ;;
  }

  measure: enable_jira_count {
    label: "Enable Jira Count (Distinct)"
    description: "The distinct count of enable jira's per grouping."
    type: count_distinct
    sql: ${enable_jira} ;;
  }

  measure: enable_jira_count_all {
    label: "Enable Jira Count"
    description: "The count of all non-null enable jira occurrences per grouping."
    type: number
    sql: COUNT(case when ${enable_jira} IS NOT NULL then ${enable_jira} else null end) ;;
  }

  measure: version_gitlab_count {
    label: "Version Gitlab Count (Distinct)"
    description: "The distinct count of version gitlab's per grouping."
    type: count_distinct
    sql: ${version_gitlab} ;;
  }

  measure: version_gitlab_count_all {
    label: "Version Gitlab Count"
    description: "The count of all non-null version gitlab occurrences per grouping."
    type: number
    sql: COUNT(case when ${version_gitlab} IS NOT NULL then ${version_gitlab} else null end) ;;
  }

  measure: version_custom_user_attributes_count {
    label: "Version Custom User Attributes Count (Distinct)"
    description: "The distinct count of version custom user attributes's per grouping."
    type: count_distinct
    sql: ${version_custom_user_attributes} ;;
  }

  measure: version_custom_user_attributes_count_all {
    label: "Version Custom User Attributes Count"
    description: "The count of all non-null version custom user attributes occurrences per grouping."
    type: number
    sql: COUNT(case when ${version_custom_user_attributes} IS NOT NULL then ${version_custom_user_attributes} else null end) ;;
  }

  measure: enable_marketplace_count {
    label: "Enable Marketplace Count (Distinct)"
    description: "The distinct count of enable marketplace's per grouping."
    type: count_distinct
    sql: ${enable_marketplace} ;;
  }

  measure: enable_marketplace_count_all {
    label: "Enable Marketplace Count"
    description: "The count of all non-null enable marketplace occurrences per grouping."
    type: number
    sql: COUNT(case when ${enable_marketplace} IS NOT NULL then ${enable_marketplace} else null end) ;;
  }

  measure: enable_jitsi_count {
    label: "Enable Jitsi Count (Distinct)"
    description: "The distinct count of enable jitsi's per grouping."
    type: count_distinct
    sql: ${enable_jitsi} ;;
  }

  measure: enable_jitsi_count_all {
    label: "Enable Jitsi Count"
    description: "The count of all non-null enable jitsi occurrences per grouping."
    type: number
    sql: COUNT(case when ${enable_jitsi} IS NOT NULL then ${enable_jitsi} else null end) ;;
  }

  measure: enable_todo_count {
    label: "Enable Todo Count (Distinct)"
    description: "The distinct count of enable todo's per grouping."
    type: count_distinct
    sql: ${enable_todo} ;;
  }

  measure: enable_todo_count_all {
    label: "Enable Todo Count"
    description: "The count of all non-null enable todo occurrences per grouping."
    type: number
    sql: COUNT(case when ${enable_todo} IS NOT NULL then ${enable_todo} else null end) ;;
  }

  measure: enable_confluence_count {
    label: "Enable Confluence Count (Distinct)"
    description: "The distinct count of enable confluence's per grouping."
    type: count_distinct
    sql: ${enable_confluence} ;;
  }

  measure: enable_confluence_count_all {
    label: "Enable Confluence Count"
    description: "The count of all non-null enable confluence occurrences per grouping."
    type: number
    sql: COUNT(case when ${enable_confluence} IS NOT NULL then ${enable_confluence} else null end) ;;
  }

  measure: enable_skype4business_count {
    label: "Enable Skype4Business Count (Distinct)"
    description: "The distinct count of enable skype4business's per grouping."
    type: count_distinct
    sql: ${enable_skype4business} ;;
  }

  measure: enable_skype4business_count_all {
    label: "Enable Skype4Business Count"
    description: "The count of all non-null enable skype4business occurrences per grouping."
    type: number
    sql: COUNT(case when ${enable_skype4business} IS NOT NULL then ${enable_skype4business} else null end) ;;
  }

  measure: enable_mscalendar_count {
    label: "Enable Mscalendar Count (Distinct)"
    description: "The distinct count of enable mscalendar's per grouping."
    type: count_distinct
    sql: ${enable_mscalendar} ;;
  }

  measure: enable_mscalendar_count_all {
    label: "Enable Mscalendar Count"
    description: "The count of all non-null enable mscalendar occurrences per grouping."
    type: number
    sql: COUNT(case when ${enable_mscalendar} IS NOT NULL then ${enable_mscalendar} else null end) ;;
  }

  measure: phase_1_migration_complete_count {
    label: "Phase 1 Migration Complete Count (Distinct)"
    description: "The distinct count of phase 1 migration complete's per grouping."
    type: count_distinct
    sql: ${phase_1_migration_complete} ;;
  }

  measure: phase_1_migration_complete_count_all {
    label: "Phase 1 Migration Complete Count"
    description: "The count of all non-null phase 1 migration complete occurrences per grouping."
    type: number
    sql: COUNT(case when ${phase_1_migration_complete} IS NOT NULL then ${phase_1_migration_complete} else null end) ;;
  }

  measure: phase_2_migration_complete_count {
    label: "Phase 2 Migration Complete Count (Distinct)"
    description: "The distinct count of phase 2 migration complete's per grouping."
    type: count_distinct
    sql: ${phase_2_migration_complete} ;;
  }

  measure: phase_2_migration_complete_count_all {
    label: "Phase 2 Migration Complete Count"
    description: "The count of all non-null phase 2 migration complete occurrences per grouping."
    type: number
    sql: COUNT(case when ${phase_2_migration_complete} IS NOT NULL then ${phase_2_migration_complete} else null end) ;;
  }

  measure: team_user_permissions_count {
    label: "Team User Permissions Count (Distinct)"
    description: "The distinct count of team user permissions's per grouping."
    type: count_distinct
    sql: ${team_user_permissions} ;;
  }

  measure: team_user_permissions_count_all {
    label: "Team User Permissions Count"
    description: "The count of all non-null team user permissions occurrences per grouping."
    type: number
    sql: COUNT(case when ${team_user_permissions} IS NOT NULL then ${team_user_permissions} else null end) ;;
  }

  measure: team_admin_permissions_count {
    label: "Team Admin Permissions Count (Distinct)"
    description: "The distinct count of team admin permissions's per grouping."
    type: count_distinct
    sql: ${team_admin_permissions} ;;
  }

  measure: team_admin_permissions_count_all {
    label: "Team Admin Permissions Count"
    description: "The count of all non-null team admin permissions occurrences per grouping."
    type: number
    sql: COUNT(case when ${team_admin_permissions} IS NOT NULL then ${team_admin_permissions} else null end) ;;
  }

  measure: channel_guest_permissions_count {
    label: "Channel Guest Permissions Count (Distinct)"
    description: "The distinct count of channel guest permissions's per grouping."
    type: count_distinct
    sql: ${channel_guest_permissions} ;;
  }

  measure: channel_guest_permissions_count_all {
    label: "Channel Guest Permissions Count"
    description: "The count of all non-null channel guest permissions occurrences per grouping."
    type: number
    sql: COUNT(case when ${channel_guest_permissions} IS NOT NULL then ${channel_guest_permissions} else null end) ;;
  }

  measure: system_user_permissions_count {
    label: "System User Permissions Count (Distinct)"
    description: "The distinct count of system user permissions's per grouping."
    type: count_distinct
    sql: ${system_user_permissions} ;;
  }

  measure: system_user_permissions_count_all {
    label: "System User Permissions Count"
    description: "The count of all non-null system user permissions occurrences per grouping."
    type: number
    sql: COUNT(case when ${system_user_permissions} IS NOT NULL then ${system_user_permissions} else null end) ;;
  }

  measure: channel_user_permissions_count {
    label: "Channel User Permissions Count (Distinct)"
    description: "The distinct count of channel user permissions's per grouping."
    type: count_distinct
    sql: ${channel_user_permissions} ;;
  }

  measure: channel_user_permissions_count_all {
    label: "Channel User Permissions Count"
    description: "The count of all non-null channel user permissions occurrences per grouping."
    type: number
    sql: COUNT(case when ${channel_user_permissions} IS NOT NULL then ${channel_user_permissions} else null end) ;;
  }

  measure: system_admin_permissions_count {
    label: "System Admin Permissions Count (Distinct)"
    description: "The distinct count of system admin permissions's per grouping."
    type: count_distinct
    sql: ${system_admin_permissions} ;;
  }

  measure: system_admin_permissions_count_all {
    label: "System Admin Permissions Count"
    description: "The count of all non-null system admin permissions occurrences per grouping."
    type: number
    sql: COUNT(case when ${system_admin_permissions} IS NOT NULL then ${system_admin_permissions} else null end) ;;
  }

  measure: channel_admin_permissions_count {
    label: "Channel Admin Permissions Count (Distinct)"
    description: "The distinct count of channel admin permissions's per grouping."
    type: count_distinct
    sql: ${channel_admin_permissions} ;;
  }

  measure: channel_admin_permissions_count_all {
    label: "Channel Admin Permissions Count"
    description: "The count of all non-null channel admin permissions occurrences per grouping."
    type: number
    sql: COUNT(case when ${channel_admin_permissions} IS NOT NULL then ${channel_admin_permissions} else null end) ;;
  }

  measure: team_guest_permissions_count {
    label: "Team Guest Permissions Count (Distinct)"
    description: "The distinct count of team guest permissions's per grouping."
    type: count_distinct
    sql: ${team_guest_permissions} ;;
  }

  measure: team_guest_permissions_count_all {
    label: "Team Guest Permissions Count"
    description: "The count of all non-null team guest permissions occurrences per grouping."
    type: number
    sql: COUNT(case when ${team_guest_permissions} IS NOT NULL then ${team_guest_permissions} else null end) ;;
  }

  measure: scheme_id_count {
    label: "Scheme Id Count (Distinct)"
    description: "The distinct count of scheme id's per grouping."
    type: count_distinct
    sql: ${scheme_id} ;;
  }

  measure: scheme_id_count_all {
    label: "Scheme Id Count"
    description: "The count of all non-null scheme id occurrences per grouping."
    type: number
    sql: COUNT(case when ${scheme_id} IS NOT NULL then ${scheme_id} else null end) ;;
  }

  measure: team_count_count {
    label: "Team Count Count (Distinct)"
    description: "The distinct count of team count's per grouping."
    type: count_distinct
    sql: ${team_count} ;;
  }

  measure: team_count_count_all {
    label: "Team Count Count"
    description: "The count of all non-null team count occurrences per grouping."
    type: number
    sql: COUNT(case when ${team_count} IS NOT NULL then ${team_count} else null end) ;;
  }

  measure: isdefault_max_users_for_statistics_count {
    label: "Isdefault Max Users For Statistics Count (Distinct)"
    description: "The distinct count of isdefault max users for statistics's per grouping."
    type: count_distinct
    sql: ${isdefault_max_users_for_statistics} ;;
  }

  measure: isdefault_max_users_for_statistics_count_all {
    label: "Isdefault Max Users For Statistics Count"
    description: "The count of all non-null isdefault max users for statistics occurrences per grouping."
    type: number
    sql: COUNT(case when ${isdefault_max_users_for_statistics} IS NOT NULL then ${isdefault_max_users_for_statistics} else null end) ;;
  }

  measure: enable_google_count {
    label: "Enable Google Count (Distinct)"
    description: "The distinct count of enable google's per grouping."
    type: count_distinct
    sql: ${enable_google} ;;
  }

  measure: enable_google_count_all {
    label: "Enable Google Count"
    description: "The count of all non-null enable google occurrences per grouping."
    type: number
    sql: COUNT(case when ${enable_google} IS NOT NULL then ${enable_google} else null end) ;;
  }

  measure: enable_office365_count {
    label: "Enable Office365 Count (Distinct)"
    description: "The distinct count of enable office365's per grouping."
    type: count_distinct
    sql: ${enable_office365} ;;
  }

  measure: enable_office365_count_all {
    label: "Enable Office365 Count"
    description: "The count of all non-null enable office365 occurrences per grouping."
    type: number
    sql: COUNT(case when ${enable_office365} IS NOT NULL then ${enable_office365} else null end) ;;
  }

  measure: isdefault_scoping_idp_provider_id_count {
    label: "Isdefault Scoping Idp Provider Id Count (Distinct)"
    description: "The distinct count of isdefault scoping idp provider id's per grouping."
    type: count_distinct
    sql: ${isdefault_scoping_idp_provider_id} ;;
  }

  measure: isdefault_scoping_idp_provider_id_count_all {
    label: "Isdefault Scoping Idp Provider Id Count"
    description: "The count of all non-null isdefault scoping idp provider id occurrences per grouping."
    type: number
    sql: COUNT(case when ${isdefault_scoping_idp_provider_id} IS NOT NULL then ${isdefault_scoping_idp_provider_id} else null end) ;;
  }

  measure: verify_count {
    label: "Verify Count (Distinct)"
    description: "The distinct count of verify's per grouping."
    type: count_distinct
    sql: ${verify} ;;
  }

  measure: verify_count_all {
    label: "Verify Count"
    description: "The count of all non-null verify occurrences per grouping."
    type: number
    sql: COUNT(case when ${verify} IS NOT NULL then ${verify} else null end) ;;
  }

  measure: enable_admin_attribute_count {
    label: "Enable Admin Attribute Count (Distinct)"
    description: "The distinct count of enable admin attribute's per grouping."
    type: count_distinct
    sql: ${enable_admin_attribute} ;;
  }

  measure: enable_admin_attribute_count_all {
    label: "Enable Admin Attribute Count"
    description: "The count of all non-null enable admin attribute occurrences per grouping."
    type: number
    sql: COUNT(case when ${enable_admin_attribute} IS NOT NULL then ${enable_admin_attribute} else null end) ;;
  }

  measure: isdefault_signature_algorithm_count {
    label: "Isdefault Signature Algorithm Count (Distinct)"
    description: "The distinct count of isdefault signature algorithm's per grouping."
    type: count_distinct
    sql: ${isdefault_signature_algorithm} ;;
  }

  measure: isdefault_signature_algorithm_count_all {
    label: "Isdefault Signature Algorithm Count"
    description: "The count of all non-null isdefault signature algorithm occurrences per grouping."
    type: number
    sql: COUNT(case when ${isdefault_signature_algorithm} IS NOT NULL then ${isdefault_signature_algorithm} else null end) ;;
  }

  measure: isdefault_locale_attribute_count {
    label: "Isdefault Locale Attribute Count (Distinct)"
    description: "The distinct count of isdefault locale attribute's per grouping."
    type: count_distinct
    sql: ${isdefault_locale_attribute} ;;
  }

  measure: isdefault_locale_attribute_count_all {
    label: "Isdefault Locale Attribute Count"
    description: "The count of all non-null isdefault locale attribute occurrences per grouping."
    type: number
    sql: COUNT(case when ${isdefault_locale_attribute} IS NOT NULL then ${isdefault_locale_attribute} else null end) ;;
  }

  measure: enable_sync_with_ldap_include_auth_count {
    label: "Enable Sync With Ldap Include Auth Count (Distinct)"
    description: "The distinct count of enable sync with ldap include auth's per grouping."
    type: count_distinct
    sql: ${enable_sync_with_ldap_include_auth} ;;
  }

  measure: enable_sync_with_ldap_include_auth_count_all {
    label: "Enable Sync With Ldap Include Auth Count"
    description: "The count of all non-null enable sync with ldap include auth occurrences per grouping."
    type: number
    sql: COUNT(case when ${enable_sync_with_ldap_include_auth} IS NOT NULL then ${enable_sync_with_ldap_include_auth} else null end) ;;
  }

  measure: encrypt_count {
    label: "Encrypt Count (Distinct)"
    description: "The distinct count of encrypt's per grouping."
    type: count_distinct
    sql: ${encrypt} ;;
  }

  measure: encrypt_count_all {
    label: "Encrypt Count"
    description: "The count of all non-null encrypt occurrences per grouping."
    type: number
    sql: COUNT(case when ${encrypt} IS NOT NULL then ${encrypt} else null end) ;;
  }

  measure: enable_sync_with_ldap_count {
    label: "Enable Sync With Ldap Count (Distinct)"
    description: "The distinct count of enable sync with ldap's per grouping."
    type: count_distinct
    sql: ${enable_sync_with_ldap} ;;
  }

  measure: enable_sync_with_ldap_count_all {
    label: "Enable Sync With Ldap Count"
    description: "The count of all non-null enable sync with ldap occurrences per grouping."
    type: number
    sql: COUNT(case when ${enable_sync_with_ldap} IS NOT NULL then ${enable_sync_with_ldap} else null end) ;;
  }

  measure: isdefault_guest_attribute_count {
    label: "Isdefault Guest Attribute Count (Distinct)"
    description: "The distinct count of isdefault guest attribute's per grouping."
    type: count_distinct
    sql: ${isdefault_guest_attribute} ;;
  }

  measure: isdefault_guest_attribute_count_all {
    label: "Isdefault Guest Attribute Count"
    description: "The count of all non-null isdefault guest attribute occurrences per grouping."
    type: number
    sql: COUNT(case when ${isdefault_guest_attribute} IS NOT NULL then ${isdefault_guest_attribute} else null end) ;;
  }

  measure: isdefault_login_button_text_count {
    label: "Isdefault Login Button Text Count (Distinct)"
    description: "The distinct count of isdefault login button text's per grouping."
    type: count_distinct
    sql: ${isdefault_login_button_text} ;;
  }

  measure: isdefault_login_button_text_count_all {
    label: "Isdefault Login Button Text Count"
    description: "The count of all non-null isdefault login button text occurrences per grouping."
    type: number
    sql: COUNT(case when ${isdefault_login_button_text} IS NOT NULL then ${isdefault_login_button_text} else null end) ;;
  }

  measure: isdefault_canonical_algorithm_count {
    label: "Isdefault Canonical Algorithm Count (Distinct)"
    description: "The distinct count of isdefault canonical algorithm's per grouping."
    type: count_distinct
    sql: ${isdefault_canonical_algorithm} ;;
  }

  measure: isdefault_canonical_algorithm_count_all {
    label: "Isdefault Canonical Algorithm Count"
    description: "The count of all non-null isdefault canonical algorithm occurrences per grouping."
    type: number
    sql: COUNT(case when ${isdefault_canonical_algorithm} IS NOT NULL then ${isdefault_canonical_algorithm} else null end) ;;
  }

  measure: isdefault_scoping_idp_name_count {
    label: "Isdefault Scoping Idp Name Count (Distinct)"
    description: "The distinct count of isdefault scoping idp name's per grouping."
    type: count_distinct
    sql: ${isdefault_scoping_idp_name} ;;
  }

  measure: isdefault_scoping_idp_name_count_all {
    label: "Isdefault Scoping Idp Name Count"
    description: "The count of all non-null isdefault scoping idp name occurrences per grouping."
    type: number
    sql: COUNT(case when ${isdefault_scoping_idp_name} IS NOT NULL then ${isdefault_scoping_idp_name} else null end) ;;
  }

  measure: isdefault_admin_attribute_count {
    label: "Isdefault Admin Attribute Count (Distinct)"
    description: "The distinct count of isdefault admin attribute's per grouping."
    type: count_distinct
    sql: ${isdefault_admin_attribute} ;;
  }

  measure: isdefault_admin_attribute_count_all {
    label: "Isdefault Admin Attribute Count"
    description: "The count of all non-null isdefault admin attribute occurrences per grouping."
    type: number
    sql: COUNT(case when ${isdefault_admin_attribute} IS NOT NULL then ${isdefault_admin_attribute} else null end) ;;
  }

  measure: sign_request_count {
    label: "Sign Request Count (Distinct)"
    description: "The distinct count of sign request's per grouping."
    type: count_distinct
    sql: ${sign_request} ;;
  }

  measure: sign_request_count_all {
    label: "Sign Request Count"
    description: "The count of all non-null sign request occurrences per grouping."
    type: number
    sql: COUNT(case when ${sign_request} IS NOT NULL then ${sign_request} else null end) ;;
  }

  measure: isdefault_support_email_count {
    label: "Isdefault Support Email Count (Distinct)"
    description: "The distinct count of isdefault support email's per grouping."
    type: count_distinct
    sql: ${isdefault_support_email} ;;
  }

  measure: isdefault_support_email_count_all {
    label: "Isdefault Support Email Count"
    description: "The count of all non-null isdefault support email occurrences per grouping."
    type: number
    sql: COUNT(case when ${isdefault_support_email} IS NOT NULL then ${isdefault_support_email} else null end) ;;
  }

  measure: isdefault_privacy_policy_link_count {
    label: "Isdefault Privacy Policy Link Count (Distinct)"
    description: "The distinct count of isdefault privacy policy link's per grouping."
    type: count_distinct
    sql: ${isdefault_privacy_policy_link} ;;
  }

  measure: isdefault_privacy_policy_link_count_all {
    label: "Isdefault Privacy Policy Link Count"
    description: "The count of all non-null isdefault privacy policy link occurrences per grouping."
    type: number
    sql: COUNT(case when ${isdefault_privacy_policy_link} IS NOT NULL then ${isdefault_privacy_policy_link} else null end) ;;
  }

  measure: isdefault_help_link_count {
    label: "Isdefault Help Link Count (Distinct)"
    description: "The distinct count of isdefault help link's per grouping."
    type: count_distinct
    sql: ${isdefault_help_link} ;;
  }

  measure: isdefault_help_link_count_all {
    label: "Isdefault Help Link Count"
    description: "The count of all non-null isdefault help link occurrences per grouping."
    type: number
    sql: COUNT(case when ${isdefault_help_link} IS NOT NULL then ${isdefault_help_link} else null end) ;;
  }

  measure: isdefault_about_link_count {
    label: "Isdefault About Link Count (Distinct)"
    description: "The distinct count of isdefault about link's per grouping."
    type: count_distinct
    sql: ${isdefault_about_link} ;;
  }

  measure: isdefault_about_link_count_all {
    label: "Isdefault About Link Count"
    description: "The count of all non-null isdefault about link occurrences per grouping."
    type: number
    sql: COUNT(case when ${isdefault_about_link} IS NOT NULL then ${isdefault_about_link} else null end) ;;
  }

  measure: isdefault_terms_of_service_link_count {
    label: "Isdefault Terms Of Service Link Count (Distinct)"
    description: "The distinct count of isdefault terms of service link's per grouping."
    type: count_distinct
    sql: ${isdefault_terms_of_service_link} ;;
  }

  measure: isdefault_terms_of_service_link_count_all {
    label: "Isdefault Terms Of Service Link Count"
    description: "The count of all non-null isdefault terms of service link occurrences per grouping."
    type: number
    sql: COUNT(case when ${isdefault_terms_of_service_link} IS NOT NULL then ${isdefault_terms_of_service_link} else null end) ;;
  }

  measure: custom_terms_of_service_enabled_count {
    label: "Custom Terms Of Service Enabled Count (Distinct)"
    description: "The distinct count of custom terms of service enabled's per grouping."
    type: count_distinct
    sql: ${custom_terms_of_service_enabled} ;;
  }

  measure: custom_terms_of_service_enabled_count_all {
    label: "Custom Terms Of Service Enabled Count"
    description: "The count of all non-null custom terms of service enabled occurrences per grouping."
    type: number
    sql: COUNT(case when ${custom_terms_of_service_enabled} IS NOT NULL then ${custom_terms_of_service_enabled} else null end) ;;
  }

  measure: isdefault_report_a_problem_link_count {
    label: "Isdefault Report A Problem Link Count (Distinct)"
    description: "The distinct count of isdefault report a problem link's per grouping."
    type: count_distinct
    sql: ${isdefault_report_a_problem_link} ;;
  }

  measure: isdefault_report_a_problem_link_count_all {
    label: "Isdefault Report A Problem Link Count"
    description: "The count of all non-null isdefault report a problem link occurrences per grouping."
    type: number
    sql: COUNT(case when ${isdefault_report_a_problem_link} IS NOT NULL then ${isdefault_report_a_problem_link} else null end) ;;
  }

  measure: custom_terms_of_service_re_acceptance_period_count {
    label: "Custom Terms Of Service Re Acceptance Period Count (Distinct)"
    description: "The distinct count of custom terms of service re acceptance period's per grouping."
    type: count_distinct
    sql: ${custom_terms_of_service_re_acceptance_period} ;;
  }

  measure: custom_terms_of_service_re_acceptance_period_count_all {
    label: "Custom Terms Of Service Re Acceptance Period Count"
    description: "The count of all non-null custom terms of service re acceptance period occurrences per grouping."
    type: number
    sql: COUNT(case when ${custom_terms_of_service_re_acceptance_period} IS NOT NULL then ${custom_terms_of_service_re_acceptance_period} else null end) ;;
  }

  measure: elasticsearch_server_version_count {
    label: "Elasticsearch Server Version Count (Distinct)"
    description: "The distinct count of elasticsearch server version's per grouping."
    type: count_distinct
    sql: ${elasticsearch_server_version} ;;
  }

  measure: elasticsearch_server_version_count_all {
    label: "Elasticsearch Server Version Count"
    description: "The count of all non-null elasticsearch server version occurrences per grouping."
    type: number
    sql: COUNT(case when ${elasticsearch_server_version} IS NOT NULL then ${elasticsearch_server_version} else null end) ;;
  }

  measure: feature_elastic_search_count {
    label: "Feature Elastic Search Count (Distinct)"
    description: "The distinct count of feature elastic search's per grouping."
    type: count_distinct
    sql: ${feature_elastic_search} ;;
  }

  measure: feature_elastic_search_count_all {
    label: "Feature Elastic Search Count"
    description: "The count of all non-null feature elastic search occurrences per grouping."
    type: number
    sql: COUNT(case when ${feature_elastic_search} IS NOT NULL then ${feature_elastic_search} else null end) ;;
  }

  measure: feature_mfa_count {
    label: "Feature Mfa Count (Distinct)"
    description: "The distinct count of feature mfa's per grouping."
    type: count_distinct
    sql: ${feature_mfa} ;;
  }

  measure: feature_mfa_count_all {
    label: "Feature Mfa Count"
    description: "The count of all non-null feature mfa occurrences per grouping."
    type: number
    sql: COUNT(case when ${feature_mfa} IS NOT NULL then ${feature_mfa} else null end) ;;
  }

  measure: feature_google_count {
    label: "Feature Google Count (Distinct)"
    description: "The distinct count of feature google's per grouping."
    type: count_distinct
    sql: ${feature_google} ;;
  }

  measure: feature_google_count_all {
    label: "Feature Google Count"
    description: "The count of all non-null feature google occurrences per grouping."
    type: number
    sql: COUNT(case when ${feature_google} IS NOT NULL then ${feature_google} else null end) ;;
  }

  measure: feature_guest_accounts_permissions_count {
    label: "Feature Guest Accounts Permissions Count (Distinct)"
    description: "The distinct count of feature guest accounts permissions's per grouping."
    type: count_distinct
    sql: ${feature_guest_accounts_permissions} ;;
  }

  measure: feature_guest_accounts_permissions_count_all {
    label: "Feature Guest Accounts Permissions Count"
    description: "The count of all non-null feature guest accounts permissions occurrences per grouping."
    type: number
    sql: COUNT(case when ${feature_guest_accounts_permissions} IS NOT NULL then ${feature_guest_accounts_permissions} else null end) ;;
  }

  measure: feature_compliance_count {
    label: "Feature Compliance Count (Distinct)"
    description: "The distinct count of feature compliance's per grouping."
    type: count_distinct
    sql: ${feature_compliance} ;;
  }

  measure: feature_compliance_count_all {
    label: "Feature Compliance Count"
    description: "The count of all non-null feature compliance occurrences per grouping."
    type: number
    sql: COUNT(case when ${feature_compliance} IS NOT NULL then ${feature_compliance} else null end) ;;
  }

  measure: feature_saml_count {
    label: "Feature Saml Count (Distinct)"
    description: "The distinct count of feature saml's per grouping."
    type: count_distinct
    sql: ${feature_saml} ;;
  }

  measure: feature_saml_count_all {
    label: "Feature Saml Count"
    description: "The count of all non-null feature saml occurrences per grouping."
    type: number
    sql: COUNT(case when ${feature_saml} IS NOT NULL then ${feature_saml} else null end) ;;
  }

  measure: customer_id_count {
    label: "Customer Id Count (Distinct)"
    description: "The distinct count of customer id's per grouping."
    type: count_distinct
    sql: ${customer_id} ;;
  }

  measure: customer_id_count_all {
    label: "Customer Id Count"
    description: "The count of all non-null customer id occurrences per grouping."
    type: number
    sql: COUNT(case when ${customer_id} IS NOT NULL then ${customer_id} else null end) ;;
  }

  measure: feature_ldap_groups_count {
    label: "Feature Ldap Groups Count (Distinct)"
    description: "The distinct count of feature ldap groups's per grouping."
    type: count_distinct
    sql: ${feature_ldap_groups} ;;
  }

  measure: feature_ldap_groups_count_all {
    label: "Feature Ldap Groups Count"
    description: "The count of all non-null feature ldap groups occurrences per grouping."
    type: number
    sql: COUNT(case when ${feature_ldap_groups} IS NOT NULL then ${feature_ldap_groups} else null end) ;;
  }

  measure: feature_guest_accounts_count {
    label: "Feature Guest Accounts Count (Distinct)"
    description: "The distinct count of feature guest accounts's per grouping."
    type: count_distinct
    sql: ${feature_guest_accounts} ;;
  }

  measure: feature_guest_accounts_count_all {
    label: "Feature Guest Accounts Count"
    description: "The count of all non-null feature guest accounts occurrences per grouping."
    type: number
    sql: COUNT(case when ${feature_guest_accounts} IS NOT NULL then ${feature_guest_accounts} else null end) ;;
  }

  measure: users_count {
    label: "Users Count (Distinct)"
    description: "The distinct count of users's per grouping."
    type: count_distinct
    sql: ${users} ;;
  }

  measure: users_count_all {
    label: "Users Count"
    description: "The count of all non-null users occurrences per grouping."
    type: number
    sql: COUNT(case when ${users} IS NOT NULL then ${users} else null end) ;;
  }

  measure: feature_metrics_count {
    label: "Feature Metrics Count (Distinct)"
    description: "The distinct count of feature metrics's per grouping."
    type: count_distinct
    sql: ${feature_metrics} ;;
  }

  measure: feature_metrics_count_all {
    label: "Feature Metrics Count"
    description: "The count of all non-null feature metrics occurrences per grouping."
    type: number
    sql: COUNT(case when ${feature_metrics} IS NOT NULL then ${feature_metrics} else null end) ;;
  }

  measure: feature_future_count {
    label: "Feature Future Count (Distinct)"
    description: "The distinct count of feature future's per grouping."
    type: count_distinct
    sql: ${feature_future} ;;
  }

  measure: feature_future_count_all {
    label: "Feature Future Count"
    description: "The count of all non-null feature future occurrences per grouping."
    type: number
    sql: COUNT(case when ${feature_future} IS NOT NULL then ${feature_future} else null end) ;;
  }

  measure: feature_email_notification_contents_count {
    label: "Feature Email Notification Contents Count (Distinct)"
    description: "The distinct count of feature email notification contents's per grouping."
    type: count_distinct
    sql: ${feature_email_notification_contents} ;;
  }

  measure: feature_email_notification_contents_count_all {
    label: "Feature Email Notification Contents Count"
    description: "The count of all non-null feature email notification contents occurrences per grouping."
    type: number
    sql: COUNT(case when ${feature_email_notification_contents} IS NOT NULL then ${feature_email_notification_contents} else null end) ;;
  }

  measure: feature_lock_teammate_name_display_count {
    label: "Feature Lock Teammate Name Display Count (Distinct)"
    description: "The distinct count of feature lock teammate name display's per grouping."
    type: count_distinct
    sql: ${feature_lock_teammate_name_display} ;;
  }

  measure: feature_lock_teammate_name_display_count_all {
    label: "Feature Lock Teammate Name Display Count"
    description: "The count of all non-null feature lock teammate name display occurrences per grouping."
    type: number
    sql: COUNT(case when ${feature_lock_teammate_name_display} IS NOT NULL then ${feature_lock_teammate_name_display} else null end) ;;
  }

  measure: expire_count {
    label: "Expire Count (Distinct)"
    description: "The distinct count of expire's per grouping."
    type: count_distinct
    sql: ${expire} ;;
  }

  measure: expire_count_all {
    label: "Expire Count"
    description: "The count of all non-null expire occurrences per grouping."
    type: number
    sql: COUNT(case when ${expire} IS NOT NULL then ${expire} else null end) ;;
  }

  measure: feature_office365_count {
    label: "Feature Office365 Count (Distinct)"
    description: "The distinct count of feature office365's per grouping."
    type: count_distinct
    sql: ${feature_office365} ;;
  }

  measure: feature_office365_count_all {
    label: "Feature Office365 Count"
    description: "The count of all non-null feature office365 occurrences per grouping."
    type: number
    sql: COUNT(case when ${feature_office365} IS NOT NULL then ${feature_office365} else null end) ;;
  }

  measure: feature_ldap_count {
    label: "Feature Ldap Count (Distinct)"
    description: "The distinct count of feature ldap's per grouping."
    type: count_distinct
    sql: ${feature_ldap} ;;
  }

  measure: feature_ldap_count_all {
    label: "Feature Ldap Count"
    description: "The count of all non-null feature ldap occurrences per grouping."
    type: number
    sql: COUNT(case when ${feature_ldap} IS NOT NULL then ${feature_ldap} else null end) ;;
  }

  measure: feature_mhpns_count {
    label: "Feature Mhpns Count (Distinct)"
    description: "The distinct count of feature mhpns's per grouping."
    type: count_distinct
    sql: ${feature_mhpns} ;;
  }

  measure: feature_mhpns_count_all {
    label: "Feature Mhpns Count"
    description: "The count of all non-null feature mhpns occurrences per grouping."
    type: number
    sql: COUNT(case when ${feature_mhpns} IS NOT NULL then ${feature_mhpns} else null end) ;;
  }

  measure: feature_custom_permissions_schemes_count {
    label: "Feature Custom Permissions Schemes Count (Distinct)"
    description: "The distinct count of feature custom permissions schemes's per grouping."
    type: count_distinct
    sql: ${feature_custom_permissions_schemes} ;;
  }

  measure: feature_custom_permissions_schemes_count_all {
    label: "Feature Custom Permissions Schemes Count"
    description: "The count of all non-null feature custom permissions schemes occurrences per grouping."
    type: number
    sql: COUNT(case when ${feature_custom_permissions_schemes} IS NOT NULL then ${feature_custom_permissions_schemes} else null end) ;;
  }

  measure: feature_message_export_count {
    label: "Feature Message Export Count (Distinct)"
    description: "The distinct count of feature message export's per grouping."
    type: count_distinct
    sql: ${feature_message_export} ;;
  }

  measure: feature_message_export_count_all {
    label: "Feature Message Export Count"
    description: "The count of all non-null feature message export occurrences per grouping."
    type: number
    sql: COUNT(case when ${feature_message_export} IS NOT NULL then ${feature_message_export} else null end) ;;
  }

  measure: feature_id_loaded_count {
    label: "Feature Id Loaded Count (Distinct)"
    description: "The distinct count of feature id loaded's per grouping."
    type: count_distinct
    sql: ${feature_id_loaded} ;;
  }

  measure: feature_id_loaded_count_all {
    label: "Feature Id Loaded Count"
    description: "The count of all non-null feature id loaded occurrences per grouping."
    type: number
    sql: COUNT(case when ${feature_id_loaded} IS NOT NULL then ${feature_id_loaded} else null end) ;;
  }

  measure: license_id_count {
    label: "License Id Count (Distinct)"
    description: "The distinct count of license id's per grouping."
    type: count_distinct
    sql: ${license_id} ;;
  }

  measure: license_id_count_all {
    label: "License Id Count"
    description: "The count of all non-null license id occurrences per grouping."
    type: number
    sql: COUNT(case when ${license_id} IS NOT NULL then ${license_id} else null end) ;;
  }

  measure: feature_data_retention_count {
    label: "Feature Data Retention Count (Distinct)"
    description: "The distinct count of feature data retention's per grouping."
    type: count_distinct
    sql: ${feature_data_retention} ;;
  }

  measure: feature_data_retention_count_all {
    label: "Feature Data Retention Count"
    description: "The count of all non-null feature data retention occurrences per grouping."
    type: number
    sql: COUNT(case when ${feature_data_retention} IS NOT NULL then ${feature_data_retention} else null end) ;;
  }

  measure: feature_cluster_count {
    label: "Feature Cluster Count (Distinct)"
    description: "The distinct count of feature cluster's per grouping."
    type: count_distinct
    sql: ${feature_cluster} ;;
  }

  measure: feature_cluster_count_all {
    label: "Feature Cluster Count"
    description: "The count of all non-null feature cluster occurrences per grouping."
    type: number
    sql: COUNT(case when ${feature_cluster} IS NOT NULL then ${feature_cluster} else null end) ;;
  }

  measure: issued_count {
    label: "Issued Count (Distinct)"
    description: "The distinct count of issued's per grouping."
    type: count_distinct
    sql: ${issued} ;;
  }

  measure: issued_count_all {
    label: "Issued Count"
    description: "The count of all non-null issued occurrences per grouping."
    type: number
    sql: COUNT(case when ${issued} IS NOT NULL then ${issued} else null end) ;;
  }

  measure: _start_count {
    label: " Start Count (Distinct)"
    description: "The distinct count of  start's per grouping."
    type: count_distinct
    sql: ${_start} ;;
  }

  measure: _start_count_all {
    label: " Start Count"
    description: "The count of all non-null  start occurrences per grouping."
    type: number
    sql: COUNT(case when ${_start} IS NOT NULL then ${_start} else null end) ;;
  }

  measure: feature_enterprise_plugins_count {
    label: "Feature Enterprise Plugins Count (Distinct)"
    description: "The distinct count of feature enterprise plugins's per grouping."
    type: count_distinct
    sql: ${feature_enterprise_plugins} ;;
  }

  measure: feature_enterprise_plugins_count_all {
    label: "Feature Enterprise Plugins Count"
    description: "The count of all non-null feature enterprise plugins occurrences per grouping."
    type: number
    sql: COUNT(case when ${feature_enterprise_plugins} IS NOT NULL then ${feature_enterprise_plugins} else null end) ;;
  }

  measure: image_proxy_type_count {
    label: "Image Proxy Type Count (Distinct)"
    description: "The distinct count of image proxy type's per grouping."
    type: count_distinct
    sql: ${image_proxy_type} ;;
  }

  measure: image_proxy_type_count_all {
    label: "Image Proxy Type Count"
    description: "The count of all non-null image proxy type occurrences per grouping."
    type: number
    sql: COUNT(case when ${image_proxy_type} IS NOT NULL then ${image_proxy_type} else null end) ;;
  }

  measure: isdefault_remote_image_proxy_url_count {
    label: "Isdefault Remote Image Proxy Url Count (Distinct)"
    description: "The distinct count of isdefault remote image proxy url's per grouping."
    type: count_distinct
    sql: ${isdefault_remote_image_proxy_url} ;;
  }

  measure: isdefault_remote_image_proxy_url_count_all {
    label: "Isdefault Remote Image Proxy Url Count"
    description: "The count of all non-null isdefault remote image proxy url occurrences per grouping."
    type: number
    sql: COUNT(case when ${isdefault_remote_image_proxy_url} IS NOT NULL then ${isdefault_remote_image_proxy_url} else null end) ;;
  }

  measure: isdefault_remote_image_proxy_options_count {
    label: "Isdefault Remote Image Proxy Options Count (Distinct)"
    description: "The distinct count of isdefault remote image proxy options's per grouping."
    type: count_distinct
    sql: ${isdefault_remote_image_proxy_options} ;;
  }

  measure: isdefault_remote_image_proxy_options_count_all {
    label: "Isdefault Remote Image Proxy Options Count"
    description: "The count of all non-null isdefault remote image proxy options occurrences per grouping."
    type: number
    sql: COUNT(case when ${isdefault_remote_image_proxy_options} IS NOT NULL then ${isdefault_remote_image_proxy_options} else null end) ;;
  }

  measure: allow_edit_post_count {
    label: "Allow Edit Post Count (Distinct)"
    description: "The distinct count of allow edit post's per grouping."
    type: count_distinct
    sql: ${allow_edit_post} ;;
  }

  measure: allow_edit_post_count_all {
    label: "Allow Edit Post Count"
    description: "The count of all non-null allow edit post occurrences per grouping."
    type: number
    sql: COUNT(case when ${allow_edit_post} IS NOT NULL then ${allow_edit_post} else null end) ;;
  }

  measure: gfycat_api_secret_count {
    label: "Gfycat Api Secret Count (Distinct)"
    description: "The distinct count of gfycat api secret's per grouping."
    type: count_distinct
    sql: ${gfycat_api_secret} ;;
  }

  measure: gfycat_api_secret_count_all {
    label: "Gfycat Api Secret Count"
    description: "The count of all non-null gfycat api secret occurrences per grouping."
    type: number
    sql: COUNT(case when ${gfycat_api_secret} IS NOT NULL then ${gfycat_api_secret} else null end) ;;
  }

  measure: web_server_mode_count {
    label: "Web Server Mode Count (Distinct)"
    description: "The distinct count of web server mode's per grouping."
    type: count_distinct
    sql: ${web_server_mode} ;;
  }

  measure: web_server_mode_count_all {
    label: "Web Server Mode Count"
    description: "The count of all non-null web server mode occurrences per grouping."
    type: number
    sql: COUNT(case when ${web_server_mode} IS NOT NULL then ${web_server_mode} else null end) ;;
  }

  measure: enable_email_invitations_count {
    label: "Enable Email Invitations Count (Distinct)"
    description: "The distinct count of enable email invitations's per grouping."
    type: count_distinct
    sql: ${enable_email_invitations} ;;
  }

  measure: enable_email_invitations_count_all {
    label: "Enable Email Invitations Count"
    description: "The count of all non-null enable email invitations occurrences per grouping."
    type: number
    sql: COUNT(case when ${enable_email_invitations} IS NOT NULL then ${enable_email_invitations} else null end) ;;
  }

  measure: enable_insecure_outgoing_connections_count {
    label: "Enable Insecure Outgoing Connections Count (Distinct)"
    description: "The distinct count of enable insecure outgoing connections's per grouping."
    type: count_distinct
    sql: ${enable_insecure_outgoing_connections} ;;
  }

  measure: enable_insecure_outgoing_connections_count_all {
    label: "Enable Insecure Outgoing Connections Count"
    description: "The count of all non-null enable insecure outgoing connections occurrences per grouping."
    type: number
    sql: COUNT(case when ${enable_insecure_outgoing_connections} IS NOT NULL then ${enable_insecure_outgoing_connections} else null end) ;;
  }

  measure: enable_developer_count {
    label: "Enable Developer Count (Distinct)"
    description: "The distinct count of enable developer's per grouping."
    type: count_distinct
    sql: ${enable_developer} ;;
  }

  measure: enable_developer_count_all {
    label: "Enable Developer Count"
    description: "The count of all non-null enable developer occurrences per grouping."
    type: number
    sql: COUNT(case when ${enable_developer} IS NOT NULL then ${enable_developer} else null end) ;;
  }

  measure: enable_emoji_picker_count {
    label: "Enable Emoji Picker Count (Distinct)"
    description: "The distinct count of enable emoji picker's per grouping."
    type: count_distinct
    sql: ${enable_emoji_picker} ;;
  }

  measure: enable_emoji_picker_count_all {
    label: "Enable Emoji Picker Count"
    description: "The count of all non-null enable emoji picker occurrences per grouping."
    type: number
    sql: COUNT(case when ${enable_emoji_picker} IS NOT NULL then ${enable_emoji_picker} else null end) ;;
  }

  measure: cors_allow_credentials_count {
    label: "Cors Allow Credentials Count (Distinct)"
    description: "The distinct count of cors allow credentials's per grouping."
    type: count_distinct
    sql: ${cors_allow_credentials} ;;
  }

  measure: cors_allow_credentials_count_all {
    label: "Cors Allow Credentials Count"
    description: "The count of all non-null cors allow credentials occurrences per grouping."
    type: number
    sql: COUNT(case when ${cors_allow_credentials} IS NOT NULL then ${cors_allow_credentials} else null end) ;;
  }

  measure: isdefault_idle_timeout_count {
    label: "Isdefault Idle Timeout Count (Distinct)"
    description: "The distinct count of isdefault idle timeout's per grouping."
    type: count_distinct
    sql: ${isdefault_idle_timeout} ;;
  }

  measure: isdefault_idle_timeout_count_all {
    label: "Isdefault Idle Timeout Count"
    description: "The count of all non-null isdefault idle timeout occurrences per grouping."
    type: number
    sql: COUNT(case when ${isdefault_idle_timeout} IS NOT NULL then ${isdefault_idle_timeout} else null end) ;;
  }

  measure: enable_post_icon_override_count {
    label: "Enable Post Icon Override Count (Distinct)"
    description: "The distinct count of enable post icon override's per grouping."
    type: count_distinct
    sql: ${enable_post_icon_override} ;;
  }

  measure: enable_post_icon_override_count_all {
    label: "Enable Post Icon Override Count"
    description: "The count of all non-null enable post icon override occurrences per grouping."
    type: number
    sql: COUNT(case when ${enable_post_icon_override} IS NOT NULL then ${enable_post_icon_override} else null end) ;;
  }

  measure: enable_testing_count {
    label: "Enable Testing Count (Distinct)"
    description: "The distinct count of enable testing's per grouping."
    type: count_distinct
    sql: ${enable_testing} ;;
  }

  measure: enable_testing_count_all {
    label: "Enable Testing Count"
    description: "The count of all non-null enable testing occurrences per grouping."
    type: number
    sql: COUNT(case when ${enable_testing} IS NOT NULL then ${enable_testing} else null end) ;;
  }

  measure: enable_bot_account_creation_count {
    label: "Enable Bot Account Creation Count (Distinct)"
    description: "The distinct count of enable bot account creation's per grouping."
    type: count_distinct
    sql: ${enable_bot_account_creation} ;;
  }

  measure: enable_bot_account_creation_count_all {
    label: "Enable Bot Account Creation Count"
    description: "The count of all non-null enable bot account creation occurrences per grouping."
    type: number
    sql: COUNT(case when ${enable_bot_account_creation} IS NOT NULL then ${enable_bot_account_creation} else null end) ;;
  }

  measure: experimental_group_unread_channels_count {
    label: "Experimental Group Unread Channels Count (Distinct)"
    description: "The distinct count of experimental group unread channels's per grouping."
    type: count_distinct
    sql: ${experimental_group_unread_channels} ;;
  }

  measure: experimental_group_unread_channels_count_all {
    label: "Experimental Group Unread Channels Count"
    description: "The count of all non-null experimental group unread channels occurrences per grouping."
    type: number
    sql: COUNT(case when ${experimental_group_unread_channels} IS NOT NULL then ${experimental_group_unread_channels} else null end) ;;
  }

  measure: post_edit_time_limit_count {
    label: "Post Edit Time Limit Count (Distinct)"
    description: "The distinct count of post edit time limit's per grouping."
    type: count_distinct
    sql: ${post_edit_time_limit} ;;
  }

  measure: post_edit_time_limit_count_all {
    label: "Post Edit Time Limit Count"
    description: "The count of all non-null post edit time limit occurrences per grouping."
    type: number
    sql: COUNT(case when ${post_edit_time_limit} IS NOT NULL then ${post_edit_time_limit} else null end) ;;
  }

  measure: isdefault_google_developer_key_count {
    label: "Isdefault Google Developer Key Count (Distinct)"
    description: "The distinct count of isdefault google developer key's per grouping."
    type: count_distinct
    sql: ${isdefault_google_developer_key} ;;
  }

  measure: isdefault_google_developer_key_count_all {
    label: "Isdefault Google Developer Key Count"
    description: "The count of all non-null isdefault google developer key occurrences per grouping."
    type: number
    sql: COUNT(case when ${isdefault_google_developer_key} IS NOT NULL then ${isdefault_google_developer_key} else null end) ;;
  }

  measure: disable_legacy_mfa_count {
    label: "Disable Legacy Mfa Count (Distinct)"
    description: "The distinct count of disable legacy mfa's per grouping."
    type: count_distinct
    sql: ${disable_legacy_mfa} ;;
  }

  measure: disable_legacy_mfa_count_all {
    label: "Disable Legacy Mfa Count"
    description: "The count of all non-null disable legacy mfa occurrences per grouping."
    type: number
    sql: COUNT(case when ${disable_legacy_mfa} IS NOT NULL then ${disable_legacy_mfa} else null end) ;;
  }

  measure: enable_multifactor_authentication_count {
    label: "Enable Multifactor Authentication Count (Distinct)"
    description: "The distinct count of enable multifactor authentication's per grouping."
    type: count_distinct
    sql: ${enable_multifactor_authentication} ;;
  }

  measure: enable_multifactor_authentication_count_all {
    label: "Enable Multifactor Authentication Count"
    description: "The count of all non-null enable multifactor authentication occurrences per grouping."
    type: number
    sql: COUNT(case when ${enable_multifactor_authentication} IS NOT NULL then ${enable_multifactor_authentication} else null end) ;;
  }

  measure: experimental_strict_csrf_enforcement_count {
    label: "Experimental Strict Csrf Enforcement Count (Distinct)"
    description: "The distinct count of experimental strict csrf enforcement's per grouping."
    type: count_distinct
    sql: ${experimental_strict_csrf_enforcement} ;;
  }

  measure: experimental_strict_csrf_enforcement_count_all {
    label: "Experimental Strict Csrf Enforcement Count"
    description: "The count of all non-null experimental strict csrf enforcement occurrences per grouping."
    type: number
    sql: COUNT(case when ${experimental_strict_csrf_enforcement} IS NOT NULL then ${experimental_strict_csrf_enforcement} else null end) ;;
  }

  measure: isdefault_tls_cert_file_count {
    label: "Isdefault Tls Cert File Count (Distinct)"
    description: "The distinct count of isdefault tls cert file's per grouping."
    type: count_distinct
    sql: ${isdefault_tls_cert_file} ;;
  }

  measure: isdefault_tls_cert_file_count_all {
    label: "Isdefault Tls Cert File Count"
    description: "The count of all non-null isdefault tls cert file occurrences per grouping."
    type: number
    sql: COUNT(case when ${isdefault_tls_cert_file} IS NOT NULL then ${isdefault_tls_cert_file} else null end) ;;
  }

  measure: isdefault_allow_cors_from_count {
    label: "Isdefault Allow Cors From Count (Distinct)"
    description: "The distinct count of isdefault allow cors from's per grouping."
    type: count_distinct
    sql: ${isdefault_allow_cors_from} ;;
  }

  measure: isdefault_allow_cors_from_count_all {
    label: "Isdefault Allow Cors From Count"
    description: "The count of all non-null isdefault allow cors from occurrences per grouping."
    type: number
    sql: COUNT(case when ${isdefault_allow_cors_from} IS NOT NULL then ${isdefault_allow_cors_from} else null end) ;;
  }

  measure: gfycat_api_key_count {
    label: "Gfycat Api Key Count (Distinct)"
    description: "The distinct count of gfycat api key's per grouping."
    type: count_distinct
    sql: ${gfycat_api_key} ;;
  }

  measure: gfycat_api_key_count_all {
    label: "Gfycat Api Key Count"
    description: "The count of all non-null gfycat api key occurrences per grouping."
    type: number
    sql: COUNT(case when ${gfycat_api_key} IS NOT NULL then ${gfycat_api_key} else null end) ;;
  }

  measure: allow_cookies_for_subdomains_count {
    label: "Allow Cookies For Subdomains Count (Distinct)"
    description: "The distinct count of allow cookies for subdomains's per grouping."
    type: count_distinct
    sql: ${allow_cookies_for_subdomains} ;;
  }

  measure: allow_cookies_for_subdomains_count_all {
    label: "Allow Cookies For Subdomains Count"
    description: "The count of all non-null allow cookies for subdomains occurrences per grouping."
    type: number
    sql: COUNT(case when ${allow_cookies_for_subdomains} IS NOT NULL then ${allow_cookies_for_subdomains} else null end) ;;
  }

  measure: enable_preview_features_count {
    label: "Enable Preview Features Count (Distinct)"
    description: "The distinct count of enable preview features's per grouping."
    type: count_distinct
    sql: ${enable_preview_features} ;;
  }

  measure: enable_preview_features_count_all {
    label: "Enable Preview Features Count"
    description: "The count of all non-null enable preview features occurrences per grouping."
    type: number
    sql: COUNT(case when ${enable_preview_features} IS NOT NULL then ${enable_preview_features} else null end) ;;
  }

  measure: uses_letsencrypt_count {
    label: "Uses Letsencrypt Count (Distinct)"
    description: "The distinct count of uses letsencrypt's per grouping."
    type: count_distinct
    sql: ${uses_letsencrypt} ;;
  }

  measure: uses_letsencrypt_count_all {
    label: "Uses Letsencrypt Count"
    description: "The count of all non-null uses letsencrypt occurrences per grouping."
    type: number
    sql: COUNT(case when ${uses_letsencrypt} IS NOT NULL then ${uses_letsencrypt} else null end) ;;
  }

  measure: disable_bots_when_owner_is_deactivated_count {
    label: "Disable Bots When Owner Is Deactivated Count (Distinct)"
    description: "The distinct count of disable bots when owner is deactivated's per grouping."
    type: count_distinct
    sql: ${disable_bots_when_owner_is_deactivated} ;;
  }

  measure: disable_bots_when_owner_is_deactivated_count_all {
    label: "Disable Bots When Owner Is Deactivated Count"
    description: "The count of all non-null disable bots when owner is deactivated occurrences per grouping."
    type: number
    sql: COUNT(case when ${disable_bots_when_owner_is_deactivated} IS NOT NULL then ${disable_bots_when_owner_is_deactivated} else null end) ;;
  }

  measure: enable_custom_emoji_count {
    label: "Enable Custom Emoji Count (Distinct)"
    description: "The distinct count of enable custom emoji's per grouping."
    type: count_distinct
    sql: ${enable_custom_emoji} ;;
  }

  measure: enable_custom_emoji_count_all {
    label: "Enable Custom Emoji Count"
    description: "The count of all non-null enable custom emoji occurrences per grouping."
    type: number
    sql: COUNT(case when ${enable_custom_emoji} IS NOT NULL then ${enable_custom_emoji} else null end) ;;
  }

  measure: session_length_web_in_days_count {
    label: "Session Length Web In Days Count (Distinct)"
    description: "The distinct count of session length web in days's per grouping."
    type: count_distinct
    sql: ${session_length_web_in_days} ;;
  }

  measure: session_length_web_in_days_count_all {
    label: "Session Length Web In Days Count"
    description: "The count of all non-null session length web in days occurrences per grouping."
    type: number
    sql: COUNT(case when ${session_length_web_in_days} IS NOT NULL then ${session_length_web_in_days} else null end) ;;
  }

  measure: experimental_enable_hardened_mode_count {
    label: "Experimental Enable Hardened Mode Count (Distinct)"
    description: "The distinct count of experimental enable hardened mode's per grouping."
    type: count_distinct
    sql: ${experimental_enable_hardened_mode} ;;
  }

  measure: experimental_enable_hardened_mode_count_all {
    label: "Experimental Enable Hardened Mode Count"
    description: "The count of all non-null experimental enable hardened mode occurrences per grouping."
    type: number
    sql: COUNT(case when ${experimental_enable_hardened_mode} IS NOT NULL then ${experimental_enable_hardened_mode} else null end) ;;
  }

  measure: minimum_hashtag_length_count {
    label: "Minimum Hashtag Length Count (Distinct)"
    description: "The distinct count of minimum hashtag length's per grouping."
    type: count_distinct
    sql: ${minimum_hashtag_length} ;;
  }

  measure: minimum_hashtag_length_count_all {
    label: "Minimum Hashtag Length Count"
    description: "The count of all non-null minimum hashtag length occurrences per grouping."
    type: number
    sql: COUNT(case when ${minimum_hashtag_length} IS NOT NULL then ${minimum_hashtag_length} else null end) ;;
  }

  measure: enable_outgoing_webhooks_count {
    label: "Enable Outgoing Webhooks Count (Distinct)"
    description: "The distinct count of enable outgoing webhooks's per grouping."
    type: count_distinct
    sql: ${enable_outgoing_webhooks} ;;
  }

  measure: enable_outgoing_webhooks_count_all {
    label: "Enable Outgoing Webhooks Count"
    description: "The count of all non-null enable outgoing webhooks occurrences per grouping."
    type: number
    sql: COUNT(case when ${enable_outgoing_webhooks} IS NOT NULL then ${enable_outgoing_webhooks} else null end) ;;
  }

  measure: enable_commands_count {
    label: "Enable Commands Count (Distinct)"
    description: "The distinct count of enable commands's per grouping."
    type: count_distinct
    sql: ${enable_commands} ;;
  }

  measure: enable_commands_count_all {
    label: "Enable Commands Count"
    description: "The count of all non-null enable commands occurrences per grouping."
    type: number
    sql: COUNT(case when ${enable_commands} IS NOT NULL then ${enable_commands} else null end) ;;
  }

  measure: enable_latex_count {
    label: "Enable Latex Count (Distinct)"
    description: "The distinct count of enable latex's per grouping."
    type: count_distinct
    sql: ${enable_latex} ;;
  }

  measure: enable_latex_count_all {
    label: "Enable Latex Count"
    description: "The count of all non-null enable latex occurrences per grouping."
    type: number
    sql: COUNT(case when ${enable_latex} IS NOT NULL then ${enable_latex} else null end) ;;
  }

  measure: isdefault_read_timeout_count {
    label: "Isdefault Read Timeout Count (Distinct)"
    description: "The distinct count of isdefault read timeout's per grouping."
    type: count_distinct
    sql: ${isdefault_read_timeout} ;;
  }

  measure: isdefault_read_timeout_count_all {
    label: "Isdefault Read Timeout Count"
    description: "The count of all non-null isdefault read timeout occurrences per grouping."
    type: number
    sql: COUNT(case when ${isdefault_read_timeout} IS NOT NULL then ${isdefault_read_timeout} else null end) ;;
  }

  measure: maximum_login_attempts_count {
    label: "Maximum Login Attempts Count (Distinct)"
    description: "The distinct count of maximum login attempts's per grouping."
    type: count_distinct
    sql: ${maximum_login_attempts} ;;
  }

  measure: maximum_login_attempts_count_all {
    label: "Maximum Login Attempts Count"
    description: "The count of all non-null maximum login attempts occurrences per grouping."
    type: number
    sql: COUNT(case when ${maximum_login_attempts} IS NOT NULL then ${maximum_login_attempts} else null end) ;;
  }

  measure: enable_post_username_override_count {
    label: "Enable Post Username Override Count (Distinct)"
    description: "The distinct count of enable post username override's per grouping."
    type: count_distinct
    sql: ${enable_post_username_override} ;;
  }

  measure: enable_post_username_override_count_all {
    label: "Enable Post Username Override Count"
    description: "The count of all non-null enable post username override occurrences per grouping."
    type: number
    sql: COUNT(case when ${enable_post_username_override} IS NOT NULL then ${enable_post_username_override} else null end) ;;
  }

  measure: websocket_url_count {
    label: "Websocket Url Count (Distinct)"
    description: "The distinct count of websocket url's per grouping."
    type: count_distinct
    sql: ${websocket_url} ;;
  }

  measure: websocket_url_count_all {
    label: "Websocket Url Count"
    description: "The count of all non-null websocket url occurrences per grouping."
    type: number
    sql: COUNT(case when ${websocket_url} IS NOT NULL then ${websocket_url} else null end) ;;
  }

  measure: enable_user_typing_messages_count {
    label: "Enable User Typing Messages Count (Distinct)"
    description: "The distinct count of enable user typing messages's per grouping."
    type: count_distinct
    sql: ${enable_user_typing_messages} ;;
  }

  measure: enable_user_typing_messages_count_all {
    label: "Enable User Typing Messages Count"
    description: "The count of all non-null enable user typing messages occurrences per grouping."
    type: number
    sql: COUNT(case when ${enable_user_typing_messages} IS NOT NULL then ${enable_user_typing_messages} else null end) ;;
  }

  measure: enable_tutorial_count {
    label: "Enable Tutorial Count (Distinct)"
    description: "The distinct count of enable tutorial's per grouping."
    type: count_distinct
    sql: ${enable_tutorial} ;;
  }

  measure: enable_tutorial_count_all {
    label: "Enable Tutorial Count"
    description: "The count of all non-null enable tutorial occurrences per grouping."
    type: number
    sql: COUNT(case when ${enable_tutorial} IS NOT NULL then ${enable_tutorial} else null end) ;;
  }

  measure: restrict_post_delete_count {
    label: "Restrict Post Delete Count (Distinct)"
    description: "The distinct count of restrict post delete's per grouping."
    type: count_distinct
    sql: ${restrict_post_delete} ;;
  }

  measure: restrict_post_delete_count_all {
    label: "Restrict Post Delete Count"
    description: "The count of all non-null restrict post delete occurrences per grouping."
    type: number
    sql: COUNT(case when ${restrict_post_delete} IS NOT NULL then ${restrict_post_delete} else null end) ;;
  }

  measure: session_idle_timeout_in_minutes_count {
    label: "Session Idle Timeout In Minutes Count (Distinct)"
    description: "The distinct count of session idle timeout in minutes's per grouping."
    type: count_distinct
    sql: ${session_idle_timeout_in_minutes} ;;
  }

  measure: session_idle_timeout_in_minutes_count_all {
    label: "Session Idle Timeout In Minutes Count"
    description: "The count of all non-null session idle timeout in minutes occurrences per grouping."
    type: number
    sql: COUNT(case when ${session_idle_timeout_in_minutes} IS NOT NULL then ${session_idle_timeout_in_minutes} else null end) ;;
  }

  measure: close_unused_direct_messages_count {
    label: "Close Unused Direct Messages Count (Distinct)"
    description: "The distinct count of close unused direct messages's per grouping."
    type: count_distinct
    sql: ${close_unused_direct_messages} ;;
  }

  measure: close_unused_direct_messages_count_all {
    label: "Close Unused Direct Messages Count"
    description: "The count of all non-null close unused direct messages occurrences per grouping."
    type: number
    sql: COUNT(case when ${close_unused_direct_messages} IS NOT NULL then ${close_unused_direct_messages} else null end) ;;
  }

  measure: enable_user_access_tokens_count {
    label: "Enable User Access Tokens Count (Distinct)"
    description: "The distinct count of enable user access tokens's per grouping."
    type: count_distinct
    sql: ${enable_user_access_tokens} ;;
  }

  measure: enable_user_access_tokens_count_all {
    label: "Enable User Access Tokens Count"
    description: "The count of all non-null enable user access tokens occurrences per grouping."
    type: number
    sql: COUNT(case when ${enable_user_access_tokens} IS NOT NULL then ${enable_user_access_tokens} else null end) ;;
  }

  measure: time_between_user_typing_updates_milliseconds_count {
    label: "Time Between User Typing Updates Milliseconds Count (Distinct)"
    description: "The distinct count of time between user typing updates milliseconds's per grouping."
    type: count_distinct
    sql: ${time_between_user_typing_updates_milliseconds} ;;
  }

  measure: time_between_user_typing_updates_milliseconds_count_all {
    label: "Time Between User Typing Updates Milliseconds Count"
    description: "The count of all non-null time between user typing updates milliseconds occurrences per grouping."
    type: number
    sql: COUNT(case when ${time_between_user_typing_updates_milliseconds} IS NOT NULL then ${time_between_user_typing_updates_milliseconds} else null end) ;;
  }

  measure: enable_api_team_deletion_count {
    label: "Enable Api Team Deletion Count (Distinct)"
    description: "The distinct count of enable api team deletion's per grouping."
    type: count_distinct
    sql: ${enable_api_team_deletion} ;;
  }

  measure: enable_api_team_deletion_count_all {
    label: "Enable Api Team Deletion Count"
    description: "The count of all non-null enable api team deletion occurrences per grouping."
    type: number
    sql: COUNT(case when ${enable_api_team_deletion} IS NOT NULL then ${enable_api_team_deletion} else null end) ;;
  }

  measure: enable_opentracing_count {
    label: "Enable Opentracing Count (Distinct)"
    description: "The distinct count of enable opentracing's per grouping."
    type: count_distinct
    sql: ${enable_opentracing} ;;
  }

  measure: enable_opentracing_count_all {
    label: "Enable Opentracing Count"
    description: "The count of all non-null enable opentracing occurrences per grouping."
    type: number
    sql: COUNT(case when ${enable_opentracing} IS NOT NULL then ${enable_opentracing} else null end) ;;
  }

  measure: enable_user_statuses_count {
    label: "Enable User Statuses Count (Distinct)"
    description: "The distinct count of enable user statuses's per grouping."
    type: count_distinct
    sql: ${enable_user_statuses} ;;
  }

  measure: enable_user_statuses_count_all {
    label: "Enable User Statuses Count"
    description: "The count of all non-null enable user statuses occurrences per grouping."
    type: number
    sql: COUNT(case when ${enable_user_statuses} IS NOT NULL then ${enable_user_statuses} else null end) ;;
  }

  measure: enable_post_search_count {
    label: "Enable Post Search Count (Distinct)"
    description: "The distinct count of enable post search's per grouping."
    type: count_distinct
    sql: ${enable_post_search} ;;
  }

  measure: enable_post_search_count_all {
    label: "Enable Post Search Count"
    description: "The count of all non-null enable post search occurrences per grouping."
    type: number
    sql: COUNT(case when ${enable_post_search} IS NOT NULL then ${enable_post_search} else null end) ;;
  }

  measure: isdefault_site_url_count {
    label: "Isdefault Site Url Count (Distinct)"
    description: "The distinct count of isdefault site url's per grouping."
    type: count_distinct
    sql: ${isdefault_site_url} ;;
  }

  measure: isdefault_site_url_count_all {
    label: "Isdefault Site Url Count"
    description: "The count of all non-null isdefault site url occurrences per grouping."
    type: number
    sql: COUNT(case when ${isdefault_site_url} IS NOT NULL then ${isdefault_site_url} else null end) ;;
  }

  measure: isdefault_tls_key_file_count {
    label: "Isdefault Tls Key File Count (Distinct)"
    description: "The distinct count of isdefault tls key file's per grouping."
    type: count_distinct
    sql: ${isdefault_tls_key_file} ;;
  }

  measure: isdefault_tls_key_file_count_all {
    label: "Isdefault Tls Key File Count"
    description: "The count of all non-null isdefault tls key file occurrences per grouping."
    type: number
    sql: COUNT(case when ${isdefault_tls_key_file} IS NOT NULL then ${isdefault_tls_key_file} else null end) ;;
  }

  measure: experimental_channel_sidebar_organization_count {
    label: "Experimental Channel Sidebar Organization Count (Distinct)"
    description: "The distinct count of experimental channel sidebar organization's per grouping."
    type: count_distinct
    sql: ${experimental_channel_sidebar_organization} ;;
  }

  measure: experimental_channel_sidebar_organization_count_all {
    label: "Experimental Channel Sidebar Organization Count"
    description: "The count of all non-null experimental channel sidebar organization occurrences per grouping."
    type: number
    sql: COUNT(case when ${experimental_channel_sidebar_organization} IS NOT NULL then ${experimental_channel_sidebar_organization} else null end) ;;
  }

  measure: cluster_log_timeout_milliseconds_count {
    label: "Cluster Log Timeout Milliseconds Count (Distinct)"
    description: "The distinct count of cluster log timeout milliseconds's per grouping."
    type: count_distinct
    sql: ${cluster_log_timeout_milliseconds} ;;
  }

  measure: cluster_log_timeout_milliseconds_count_all {
    label: "Cluster Log Timeout Milliseconds Count"
    description: "The count of all non-null cluster log timeout milliseconds occurrences per grouping."
    type: number
    sql: COUNT(case when ${cluster_log_timeout_milliseconds} IS NOT NULL then ${cluster_log_timeout_milliseconds} else null end) ;;
  }

  measure: experimental_enable_default_channel_leave_join_messages_count {
    label: "Experimental Enable Default Channel Leave Join Messages Count (Distinct)"
    description: "The distinct count of experimental enable default channel leave join messages's per grouping."
    type: count_distinct
    sql: ${experimental_enable_default_channel_leave_join_messages} ;;
  }

  measure: experimental_enable_default_channel_leave_join_messages_count_all {
    label: "Experimental Enable Default Channel Leave Join Messages Count"
    description: "The count of all non-null experimental enable default channel leave join messages occurrences per grouping."
    type: number
    sql: COUNT(case when ${experimental_enable_default_channel_leave_join_messages} IS NOT NULL then ${experimental_enable_default_channel_leave_join_messages} else null end) ;;
  }

  measure: enable_channel_viewed_messages_count {
    label: "Enable Channel Viewed Messages Count (Distinct)"
    description: "The distinct count of enable channel viewed messages's per grouping."
    type: count_distinct
    sql: ${enable_channel_viewed_messages} ;;
  }

  measure: enable_channel_viewed_messages_count_all {
    label: "Enable Channel Viewed Messages Count"
    description: "The count of all non-null enable channel viewed messages occurrences per grouping."
    type: number
    sql: COUNT(case when ${enable_channel_viewed_messages} IS NOT NULL then ${enable_channel_viewed_messages} else null end) ;;
  }

  measure: isdefault_write_timeout_count {
    label: "Isdefault Write Timeout Count (Distinct)"
    description: "The distinct count of isdefault write timeout's per grouping."
    type: count_distinct
    sql: ${isdefault_write_timeout} ;;
  }

  measure: isdefault_write_timeout_count_all {
    label: "Isdefault Write Timeout Count"
    description: "The count of all non-null isdefault write timeout occurrences per grouping."
    type: number
    sql: COUNT(case when ${isdefault_write_timeout} IS NOT NULL then ${isdefault_write_timeout} else null end) ;;
  }

  measure: enable_incoming_webhooks_count {
    label: "Enable Incoming Webhooks Count (Distinct)"
    description: "The distinct count of enable incoming webhooks's per grouping."
    type: count_distinct
    sql: ${enable_incoming_webhooks} ;;
  }

  measure: enable_incoming_webhooks_count_all {
    label: "Enable Incoming Webhooks Count"
    description: "The count of all non-null enable incoming webhooks occurrences per grouping."
    type: number
    sql: COUNT(case when ${enable_incoming_webhooks} IS NOT NULL then ${enable_incoming_webhooks} else null end) ;;
  }

  measure: isdefault_allowed_untrusted_internal_connections_count {
    label: "Isdefault Allowed Untrusted Internal Connections Count (Distinct)"
    description: "The distinct count of isdefault allowed untrusted internal connections's per grouping."
    type: count_distinct
    sql: ${isdefault_allowed_untrusted_internal_connections} ;;
  }

  measure: isdefault_allowed_untrusted_internal_connections_count_all {
    label: "Isdefault Allowed Untrusted Internal Connections Count"
    description: "The count of all non-null isdefault allowed untrusted internal connections occurrences per grouping."
    type: number
    sql: COUNT(case when ${isdefault_allowed_untrusted_internal_connections} IS NOT NULL then ${isdefault_allowed_untrusted_internal_connections} else null end) ;;
  }

  measure: session_cache_in_minutes_count {
    label: "Session Cache In Minutes Count (Distinct)"
    description: "The distinct count of session cache in minutes's per grouping."
    type: count_distinct
    sql: ${session_cache_in_minutes} ;;
  }

  measure: session_cache_in_minutes_count_all {
    label: "Session Cache In Minutes Count"
    description: "The count of all non-null session cache in minutes occurrences per grouping."
    type: number
    sql: COUNT(case when ${session_cache_in_minutes} IS NOT NULL then ${session_cache_in_minutes} else null end) ;;
  }

  measure: experimental_channel_organization_count {
    label: "Experimental Channel Organization Count (Distinct)"
    description: "The distinct count of experimental channel organization's per grouping."
    type: count_distinct
    sql: ${experimental_channel_organization} ;;
  }

  measure: experimental_channel_organization_count_all {
    label: "Experimental Channel Organization Count"
    description: "The count of all non-null experimental channel organization occurrences per grouping."
    type: number
    sql: COUNT(case when ${experimental_channel_organization} IS NOT NULL then ${experimental_channel_organization} else null end) ;;
  }

  measure: enable_oauth_service_provider_count {
    label: "Enable Oauth Service Provider Count (Distinct)"
    description: "The distinct count of enable oauth service provider's per grouping."
    type: count_distinct
    sql: ${enable_oauth_service_provider} ;;
  }

  measure: enable_oauth_service_provider_count_all {
    label: "Enable Oauth Service Provider Count"
    description: "The count of all non-null enable oauth service provider occurrences per grouping."
    type: number
    sql: COUNT(case when ${enable_oauth_service_provider} IS NOT NULL then ${enable_oauth_service_provider} else null end) ;;
  }

  measure: restrict_custom_emoji_creation_count {
    label: "Restrict Custom Emoji Creation Count (Distinct)"
    description: "The distinct count of restrict custom emoji creation's per grouping."
    type: count_distinct
    sql: ${restrict_custom_emoji_creation} ;;
  }

  measure: restrict_custom_emoji_creation_count_all {
    label: "Restrict Custom Emoji Creation Count"
    description: "The count of all non-null restrict custom emoji creation occurrences per grouping."
    type: number
    sql: COUNT(case when ${restrict_custom_emoji_creation} IS NOT NULL then ${restrict_custom_emoji_creation} else null end) ;;
  }

  measure: enable_only_admin_integrations_count {
    label: "Enable Only Admin Integrations Count (Distinct)"
    description: "The distinct count of enable only admin integrations's per grouping."
    type: count_distinct
    sql: ${enable_only_admin_integrations} ;;
  }

  measure: enable_only_admin_integrations_count_all {
    label: "Enable Only Admin Integrations Count"
    description: "The count of all non-null enable only admin integrations occurrences per grouping."
    type: number
    sql: COUNT(case when ${enable_only_admin_integrations} IS NOT NULL then ${enable_only_admin_integrations} else null end) ;;
  }

  measure: enable_gif_picker_count {
    label: "Enable Gif Picker Count (Distinct)"
    description: "The distinct count of enable gif picker's per grouping."
    type: count_distinct
    sql: ${enable_gif_picker} ;;
  }

  measure: enable_gif_picker_count_all {
    label: "Enable Gif Picker Count"
    description: "The count of all non-null enable gif picker occurrences per grouping."
    type: number
    sql: COUNT(case when ${enable_gif_picker} IS NOT NULL then ${enable_gif_picker} else null end) ;;
  }

  measure: enable_security_fix_alert_count {
    label: "Enable Security Fix Alert Count (Distinct)"
    description: "The distinct count of enable security fix alert's per grouping."
    type: count_distinct
    sql: ${enable_security_fix_alert} ;;
  }

  measure: enable_security_fix_alert_count_all {
    label: "Enable Security Fix Alert Count"
    description: "The count of all non-null enable security fix alert occurrences per grouping."
    type: number
    sql: COUNT(case when ${enable_security_fix_alert} IS NOT NULL then ${enable_security_fix_alert} else null end) ;;
  }

  measure: session_length_mobile_in_days_count {
    label: "Session Length Mobile In Days Count (Distinct)"
    description: "The distinct count of session length mobile in days's per grouping."
    type: count_distinct
    sql: ${session_length_mobile_in_days} ;;
  }

  measure: session_length_mobile_in_days_count_all {
    label: "Session Length Mobile In Days Count"
    description: "The count of all non-null session length mobile in days occurrences per grouping."
    type: number
    sql: COUNT(case when ${session_length_mobile_in_days} IS NOT NULL then ${session_length_mobile_in_days} else null end) ;;
  }

  measure: forward_80_to_443_count {
    label: "Forward 80 To 443 Count (Distinct)"
    description: "The distinct count of forward 80 to 443's per grouping."
    type: count_distinct
    sql: ${forward_80_to_443} ;;
  }

  measure: forward_80_to_443_count_all {
    label: "Forward 80 To 443 Count"
    description: "The count of all non-null forward 80 to 443 occurrences per grouping."
    type: number
    sql: COUNT(case when ${forward_80_to_443} IS NOT NULL then ${forward_80_to_443} else null end) ;;
  }

  measure: session_length_sso_in_days_count {
    label: "Session Length Sso In Days Count (Distinct)"
    description: "The distinct count of session length sso in days's per grouping."
    type: count_distinct
    sql: ${session_length_sso_in_days} ;;
  }

  measure: session_length_sso_in_days_count_all {
    label: "Session Length Sso In Days Count"
    description: "The count of all non-null session length sso in days occurrences per grouping."
    type: number
    sql: COUNT(case when ${session_length_sso_in_days} IS NOT NULL then ${session_length_sso_in_days} else null end) ;;
  }

  measure: enable_svgs_count {
    label: "Enable Svgs Count (Distinct)"
    description: "The distinct count of enable svgs's per grouping."
    type: count_distinct
    sql: ${enable_svgs} ;;
  }

  measure: enable_svgs_count_all {
    label: "Enable Svgs Count"
    description: "The count of all non-null enable svgs occurrences per grouping."
    type: number
    sql: COUNT(case when ${enable_svgs} IS NOT NULL then ${enable_svgs} else null end) ;;
  }

  measure: tls_strict_transport_count {
    label: "Tls Strict Transport Count (Distinct)"
    description: "The distinct count of tls strict transport's per grouping."
    type: count_distinct
    sql: ${tls_strict_transport} ;;
  }

  measure: tls_strict_transport_count_all {
    label: "Tls Strict Transport Count"
    description: "The count of all non-null tls strict transport occurrences per grouping."
    type: number
    sql: COUNT(case when ${tls_strict_transport} IS NOT NULL then ${tls_strict_transport} else null end) ;;
  }

  measure: experimental_enable_authentication_transfer_count {
    label: "Experimental Enable Authentication Transfer Count (Distinct)"
    description: "The distinct count of experimental enable authentication transfer's per grouping."
    type: count_distinct
    sql: ${experimental_enable_authentication_transfer} ;;
  }

  measure: experimental_enable_authentication_transfer_count_all {
    label: "Experimental Enable Authentication Transfer Count"
    description: "The count of all non-null experimental enable authentication transfer occurrences per grouping."
    type: number
    sql: COUNT(case when ${experimental_enable_authentication_transfer} IS NOT NULL then ${experimental_enable_authentication_transfer} else null end) ;;
  }

  measure: isdefault_cors_exposed_headers_count {
    label: "Isdefault Cors Exposed Headers Count (Distinct)"
    description: "The distinct count of isdefault cors exposed headers's per grouping."
    type: count_distinct
    sql: ${isdefault_cors_exposed_headers} ;;
  }

  measure: isdefault_cors_exposed_headers_count_all {
    label: "Isdefault Cors Exposed Headers Count"
    description: "The count of all non-null isdefault cors exposed headers occurrences per grouping."
    type: number
    sql: COUNT(case when ${isdefault_cors_exposed_headers} IS NOT NULL then ${isdefault_cors_exposed_headers} else null end) ;;
  }

  measure: cors_debug_count {
    label: "Cors Debug Count (Distinct)"
    description: "The distinct count of cors debug's per grouping."
    type: count_distinct
    sql: ${cors_debug} ;;
  }

  measure: cors_debug_count_all {
    label: "Cors Debug Count"
    description: "The count of all non-null cors debug occurrences per grouping."
    type: number
    sql: COUNT(case when ${cors_debug} IS NOT NULL then ${cors_debug} else null end) ;;
  }

  measure: experimental_data_prefetch_count {
    label: "Experimental Data Prefetch Count (Distinct)"
    description: "The distinct count of experimental data prefetch's per grouping."
    type: count_distinct
    sql: ${experimental_data_prefetch} ;;
  }

  measure: experimental_data_prefetch_count_all {
    label: "Experimental Data Prefetch Count"
    description: "The count of all non-null experimental data prefetch occurrences per grouping."
    type: number
    sql: COUNT(case when ${experimental_data_prefetch} IS NOT NULL then ${experimental_data_prefetch} else null end) ;;
  }

  measure: extend_session_length_with_activity_count {
    label: "Extend Session Length With Activity Count (Distinct)"
    description: "The distinct count of extend session length with activity's per grouping."
    type: count_distinct
    sql: ${extend_session_length_with_activity} ;;
  }

  measure: extend_session_length_with_activity_count_all {
    label: "Extend Session Length With Activity Count"
    description: "The count of all non-null extend session length with activity occurrences per grouping."
    type: number
    sql: COUNT(case when ${extend_session_length_with_activity} IS NOT NULL then ${extend_session_length_with_activity} else null end) ;;
  }

  measure: enable_local_mode_count {
    label: "Enable Local Mode Count (Distinct)"
    description: "The distinct count of enable local mode's per grouping."
    type: count_distinct
    sql: ${enable_local_mode} ;;
  }

  measure: enable_local_mode_count_all {
    label: "Enable Local Mode Count"
    description: "The count of all non-null enable local mode occurrences per grouping."
    type: number
    sql: COUNT(case when ${enable_local_mode} IS NOT NULL then ${enable_local_mode} else null end) ;;
  }

  measure: enable_click_to_reply_count {
    label: "Enable Click To Reply Count (Distinct)"
    description: "The distinct count of enable click to reply's per grouping."
    type: count_distinct
    sql: ${enable_click_to_reply} ;;
  }

  measure: enable_click_to_reply_count_all {
    label: "Enable Click To Reply Count"
    description: "The count of all non-null enable click to reply occurrences per grouping."
    type: number
    sql: COUNT(case when ${enable_click_to_reply} IS NOT NULL then ${enable_click_to_reply} else null end) ;;
  }

  measure: client_side_cert_enable_count {
    label: "Client Side Cert Enable Count (Distinct)"
    description: "The distinct count of client side cert enable's per grouping."
    type: count_distinct
    sql: ${client_side_cert_enable} ;;
  }

  measure: client_side_cert_enable_count_all {
    label: "Client Side Cert Enable Count"
    description: "The count of all non-null client side cert enable occurrences per grouping."
    type: number
    sql: COUNT(case when ${client_side_cert_enable} IS NOT NULL then ${client_side_cert_enable} else null end) ;;
  }

  measure: link_metadata_timeout_milliseconds_count {
    label: "Link Metadata Timeout Milliseconds Count (Distinct)"
    description: "The distinct count of link metadata timeout milliseconds's per grouping."
    type: count_distinct
    sql: ${link_metadata_timeout_milliseconds} ;;
  }

  measure: link_metadata_timeout_milliseconds_count_all {
    label: "Link Metadata Timeout Milliseconds Count"
    description: "The count of all non-null link metadata timeout milliseconds occurrences per grouping."
    type: number
    sql: COUNT(case when ${link_metadata_timeout_milliseconds} IS NOT NULL then ${link_metadata_timeout_milliseconds} else null end) ;;
  }

  measure: use_new_saml_library_count {
    label: "Use New Saml Library Count (Distinct)"
    description: "The distinct count of use new saml library's per grouping."
    type: count_distinct
    sql: ${use_new_saml_library} ;;
  }

  measure: use_new_saml_library_count_all {
    label: "Use New Saml Library Count"
    description: "The count of all non-null use new saml library occurrences per grouping."
    type: number
    sql: COUNT(case when ${use_new_saml_library} IS NOT NULL then ${use_new_saml_library} else null end) ;;
  }

  measure: restrict_system_admin_count {
    label: "Restrict System Admin Count (Distinct)"
    description: "The distinct count of restrict system admin's per grouping."
    type: count_distinct
    sql: ${restrict_system_admin} ;;
  }

  measure: restrict_system_admin_count_all {
    label: "Restrict System Admin Count"
    description: "The count of all non-null restrict system admin occurrences per grouping."
    type: number
    sql: COUNT(case when ${restrict_system_admin} IS NOT NULL then ${restrict_system_admin} else null end) ;;
  }

  measure: isdefault_client_side_cert_check_count {
    label: "Isdefault Client Side Cert Check Count (Distinct)"
    description: "The distinct count of isdefault client side cert check's per grouping."
    type: count_distinct
    sql: ${isdefault_client_side_cert_check} ;;
  }

  measure: isdefault_client_side_cert_check_count_all {
    label: "Isdefault Client Side Cert Check Count"
    description: "The count of all non-null isdefault client side cert check occurrences per grouping."
    type: number
    sql: COUNT(case when ${isdefault_client_side_cert_check} IS NOT NULL then ${isdefault_client_side_cert_check} else null end) ;;
  }



}
