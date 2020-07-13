# This is the view file for the analytics.qa.server_telemetry table.
view: server_telemetry {
  sql_table_name: qa.server_telemetry ;;
  view_label: "Server Telemetry"

  # FILTERS

  # DIMENSIONS
  dimension: _dbt_source_relation {
    description: ""
    type: string
    sql: ${TABLE}._dbt_source_relation ;;
    hidden: no
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
    sql: OBJECT_CONSTRUCT(*) ;;
  }


  # DIMENSION GROUPS/DATES
  dimension_group: received_at {
  description: ""
  type: time
  timeframes: [date, month, year]
    sql: ${TABLE}.received_at ;;
    hidden: no
  }

  dimension_group: uuid_ts {
  description: ""
  type: time
  timeframes: [date, month, year]
    sql: ${TABLE}.uuid_ts ;;
    hidden: no
  }

  dimension_group: timestamp {
  description: ""
  type: time
  timeframes: [date, month, year]
    sql: ${TABLE}.timestamp ;;
    hidden: no
  }

  dimension_group: sent_at {
  description: ""
  type: time
  timeframes: [date, month, year]
    sql: ${TABLE}.sent_at ;;
    hidden: no
  }

  dimension_group: original_timestamp {
  description: ""
  type: time
  timeframes: [date, month, year]
    sql: ${TABLE}.original_timestamp ;;
    hidden: no
  }


  # MEASURES
  measure: count {
    description: "Count of rows/occurrences."
    type: count
  }

  measure: registered_users_sum {
    description: "The sum of Registered Users per grouping."
    type: sum
    sql: ${registered_users} ;;
  }

  measure: registered_deactivated_users_sum {
    description: "The sum of Registered Deactivated Users per grouping."
    type: sum
    sql: ${registered_deactivated_users} ;;
  }

  measure: active_users_daily_sum {
    description: "The sum of Active Users Daily per grouping."
    type: sum
    sql: ${active_users_daily} ;;
  }

  measure: user_count {
    label: " User Count"
    description: "The distinct count of Users per grouping."
    type: count_distinct
    sql: ${user_id} ;;
  }

  measure: anonymous_count {
    label: " Anonymous Count"
    description: "The distinct count of Anonymouss per grouping."
    type: count_distinct
    sql: ${anonymous_id} ;;
  }

  measure: active_users_monthly_sum {
    description: "The sum of Active Users Monthly per grouping."
    type: sum
    sql: ${active_users_monthly} ;;
  }

  measure: manage_members_user_disabled_count_sum {
    description: "The sum of Manage Members User Disabled Count per grouping."
    type: sum
    sql: ${manage_members_user_disabled_count} ;;
  }

  measure: post_reactions_user_disabled_count_sum {
    description: "The sum of Post Reactions User Disabled Count per grouping."
    type: sum
    sql: ${post_reactions_user_disabled_count} ;;
  }

  measure: use_channel_mentions_guest_disabled_count_sum {
    description: "The sum of Use Channel Mentions Guest Disabled Count per grouping."
    type: sum
    sql: ${use_channel_mentions_guest_disabled_count} ;;
  }

  measure: post_reactions_guest_disabled_count_sum {
    description: "The sum of Post Reactions Guest Disabled Count per grouping."
    type: sum
    sql: ${post_reactions_guest_disabled_count} ;;
  }

  measure: create_post_user_disabled_count_sum {
    description: "The sum of Create Post User Disabled Count per grouping."
    type: sum
    sql: ${create_post_user_disabled_count} ;;
  }

  measure: channel_scheme_count_sum {
    description: "The sum of Channel Scheme Count per grouping."
    type: sum
    sql: ${channel_scheme_count} ;;
  }

  measure: use_channel_mentions_user_disabled_count_sum {
    description: "The sum of Use Channel Mentions User Disabled Count per grouping."
    type: sum
    sql: ${use_channel_mentions_user_disabled_count} ;;
  }

  measure: create_post_guest_disabled_count_sum {
    description: "The sum of Create Post Guest Disabled Count per grouping."
    type: sum
    sql: ${create_post_guest_disabled_count} ;;
  }

  measure: file_max_queue_size_max {
    description: "The max of File Max Queue Size per grouping."
    type: max
    sql: ${file_max_queue_size} ;;
  }

  measure: syslog_max_queue_size_max {
    description: "The max of Syslog Max Queue Size per grouping."
    type: max
    sql: ${syslog_max_queue_size} ;;
  }

  measure: file_max_age_days_max {
    description: "The max of File Max Age Days per grouping."
    type: max
    sql: ${file_max_age_days} ;;
  }

  measure: file_max_backups_max {
    description: "The max of File Max Backups per grouping."
    type: max
    sql: ${file_max_backups} ;;
  }

  measure: file_max_size_mb_max {
    description: "The max of File Max Size Mb per grouping."
    type: max
    sql: ${file_max_size_mb} ;;
  }

  measure: max_file_size_max {
    description: "The max of Max File Size per grouping."
    type: max
    sql: ${max_file_size} ;;
  }

  measure: max_page_size_max {
    description: "The max of Max Page Size per grouping."
    type: max
    sql: ${max_page_size} ;;
  }

  measure: max_burst_max {
    description: "The max of Max Burst per grouping."
    type: max
    sql: ${max_burst} ;;
  }

  measure: conn_max_lifetime_milliseconds_max {
    description: "The max of Conn Max Lifetime Milliseconds per grouping."
    type: max
    sql: ${conn_max_lifetime_milliseconds} ;;
  }

  measure: max_idle_conns_max {
    description: "The max of Max Idle Conns per grouping."
    type: max
    sql: ${max_idle_conns} ;;
  }

  measure: max_open_conns_max {
    description: "The max of Max Open Conns per grouping."
    type: max
    sql: ${max_open_conns} ;;
  }

  measure: max_channels_per_team_max {
    description: "The max of Max Channels Per Team per grouping."
    type: max
    sql: ${max_channels_per_team} ;;
  }

  measure: max_notifications_per_channel_max {
    description: "The max of Max Notifications Per Channel per grouping."
    type: max
    sql: ${max_notifications_per_channel} ;;
  }

  measure: max_users_per_team_max {
    description: "The max of Max Users Per Team per grouping."
    type: max
    sql: ${max_users_per_team} ;;
  }

  measure: distinct_group_member_count_sum {
    description: "The sum of Distinct Group Member Count per grouping."
    type: sum
    sql: ${distinct_group_member_count} ;;
  }

  measure: group_team_count_sum {
    description: "The sum of Group Team Count per grouping."
    type: sum
    sql: ${group_team_count} ;;
  }

  measure: group_member_count_sum {
    description: "The sum of Group Member Count per grouping."
    type: sum
    sql: ${group_member_count} ;;
  }

  measure: group_count_sum {
    description: "The sum of Group Count per grouping."
    type: sum
    sql: ${group_count} ;;
  }

  measure: group_synced_team_count_sum {
    description: "The sum of Group Synced Team Count per grouping."
    type: sum
    sql: ${group_synced_team_count} ;;
  }

  measure: group_channel_count_sum {
    description: "The sum of Group Channel Count per grouping."
    type: sum
    sql: ${group_channel_count} ;;
  }

  measure: group_synced_channel_count_sum {
    description: "The sum of Group Synced Channel Count per grouping."
    type: sum
    sql: ${group_synced_channel_count} ;;
  }

  measure: group_count_with_allow_reference_sum {
    description: "The sum of Group Count With Allow Reference per grouping."
    type: sum
    sql: ${group_count_with_allow_reference} ;;
  }

  measure: scheme_count {
    label: " Scheme Count"
    description: "The distinct count of Schemes per grouping."
    type: count_distinct
    sql: ${scheme_id} ;;
  }

  measure: team_count_sum {
    description: "The sum of Team Count per grouping."
    type: sum
    sql: ${team_count} ;;
  }

  measure: customer_count {
    label: " Customer Count"
    description: "The distinct count of Customers per grouping."
    type: count_distinct
    sql: ${customer_id} ;;
  }

  measure: users_sum {
    description: "The sum of Users per grouping."
    type: sum
    sql: ${users} ;;
  }

  measure: license_count {
    label: " License Count"
    description: "The distinct count of Licenses per grouping."
    type: count_distinct
    sql: ${license_id} ;;
  }


}
