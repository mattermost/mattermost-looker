# This is the view file for the analytics.mattermost.server_daily_details_ext table.
view: server_daily_details_ext {
  sql_table_name: mattermost.server_daily_details_ext ;;
  view_label: " Server Daily Details Ext"

  # Drill Field Sets
  set: server_fact {
    fields: [license_server_fact.customer_name, server_id, server_fact.server_version_major, server_fact.first_active_date, server_fact.last_active_date, account_sfid, account_name, license_server_fact.customer_name, paid_license_expire_date, max_active_user_count]
  }

  set: view_default {
    fields: [active_plugins , active_webapp_plugins , disabled_backend_plugins , disabled_plugins , disabled_webapp_plugins , enabled_backend_plugins , enabled_plugins , enabled_webapp_plugins , allow_banner_dismissal , enable_banner , isdefault_banner_color , admin_notices_enabled , user_notices_enabled , isdefault_banner_text_color , channel_scheme_count , create_post_guest_disabled_count , allow_insecure_download_url , automatic_prepackaged_plugins , enable_plugins , enable_antivirus , enable_autolink , enable_aws_sns , enable_confluence , enable_custom_user_attributes , enable_github , bulk_indexing_time_window_bleve , enable_autocomplete_bleve , enable_indexing_bleve , enable_searching_bleve , show_email_address , show_full_name , enable_rate_limiter , isdefault_vary_by_header , channel_guest_permissions , channel_user_permissions , system_admin_permissions , system_user_permissions , team_admin_permissions , team_guest_permissions , close_unused_direct_messages , connection_security_service , cors_allow_credentials , cors_debug , disable_bots_when_owner_is_deactivated , disable_legacy_mfa , conn_max_idletime_milliseconds , max_open_conns , query_timeout_sql , trace_sql , warn_metric_number_of_active_users_200 , warn_metric_number_of_active_users_400 , console_json_notifications , console_level_notifications , enable_console_notifications , enable_file_notifications , file_json_notifications , file_level_notifications , create_post_user_disabled_count , manage_members_user_disabled_count , post_reactions_guest_disabled_count , post_reactions_user_disabled_count , use_channel_mentions_guest_disabled_count , custom_terms_of_service_enabled , custom_terms_of_service_re_acceptance_period , isdefault_about_link , direct_message_channels , incoming_webhooks , guest_accounts , outgoing_webhooks , posts , posts_previous_day , private_channels , private_channels_deleted , public_channels , public_channels_deleted , enable_admin_filter , enable_sync , isdefault_email_attribute_ldap , isdefault_first_name_attribute_ldap , isdefault_group_display_name_attribute , isdefault_group_id_attribute , enable_apiv3_service , enable_api_team_deletion , enable_bot_account_creation , enable_channel_viewed_messages_service , enable_commands_service , enable_custom_emoji_service , enable_channel_viewed_messages_client , enable_commands_client , enable_custom_emoji_client , enable_developer_client , enable_emoji_picker_client , enable_incoming_webhooks_client , enable_commattermostpluginchannelexport , version_commattermostpluginchannelexport , enable_comnilsbrinkmannicebreaker , version_comnilsbrinkmannicebreaker , is_default_marketplace_url , enable_confirm_notifications_to_channel , enable_custom_brand , enable_custom_user_statuses , enable_open_server , enable_team_creation , enable_user_creation , enable_user_deactivation , enable_developer_service , enable_email_invitations , enable_emoji_picker_service , enable_gif_picker , enable_incoming_webhooks_service , enable_insecure_outgoing_connections_service , enable_latex , enable_email_batching , enable_preview_mode_banner , enable_sign_in_with_email , enable_sign_in_with_username , enable_sign_up_with_email , enable_smtp_auth , isdefault_feedback_email , enable_health_check , enable_jenkins , enable_jira , enable_jitsi , enable_marketplace , enable_mscalendar , enable_nps , enable_nps_survey , enable_remote_marketplace , enable_skype4business , enable_incident_response , enable_memes , enable_commattermostmsteamsmeetings , version_commattermostmsteamsmeetings , enable_insecure_outgoing_connections_client , enable_multifactor_authentication_client , enable_oauth_service_provider_client , enable_only_admin_integrations_client , enable_lowercase , enable_uppercase , enable_symbol , enable_number , password_minimum_length , phase_1_migration_complete , phase_2_migration_complete , channel_admin_permissions , enable_mattermostprofanityfilter , version_mattermostprofanityfilter , enable_comgithubmatterpollmatterpoll , enable_commattermostpluginincidentmanagement , enable_mattermost_apps , enable_focalboard , enable_circleci , enable_diceroller , version_mattermost_apps , version_focalboard , version_circleci , version_diceroller , enable_gitlab , enable_mobile_upload , enable_public_links , isabsolute_directory , isdefault_directory , max_file_size , preview_height , preview_width , profile_height , profile_width , thumbnail_height , enable_multifactor_authentication_service , enable_oauth_service_provider_service , enable_only_admin_integrations_service , enable_outgoing_webhooks , enable_post_icon_override , enable_post_search , enable_post_metadata , isdefault_client_side_cert_check , restrict_system_admin , use_new_saml_library , enable_experimental_extensions , amazon_s3_signv2 , extract_content , enable_post_username_override , enable_preview_features , enable_security_fix_alert , enable_svgs , enable_testing , enable_tutorial , enable_user_access_tokens , enable_user_statuses , enable_theme_selection , isdefault_default_theme , isdefault_supported_timezones_path , enable , isdefault_stun_uri , isdefault_turn_uri , id , logging_date, logging_week, logging_month, logging_year , timestamp_date, timestamp_week, timestamp_month, timestamp_year , enable_user_typing_messages , enforce_multifactor_authentication_service , experimental_channel_organization , experimental_channel_sidebar_organization , experimental_data_prefetch , enable_x_to_leave_channels_from_lhs , experimental_default_channels , experimental_enable_automatic_replies , experimental_primary_team , experimental_town_square_is_hidden_in_lhs , encrypt_saml , isdefault_admin_attribute , isdefault_canonical_algorithm , isdefault_email_attribute_saml , isdefault_first_name_attribute_saml , isdefault_guest_attribute , isdefault_id_attribute_saml , experimental_group_unread_channels , experimental_ldap_group_sync , experimental_limit_client_config , experimental_strict_csrf_enforcement , forward_80_to_443 , experimental_town_square_is_read_only , experimental_view_archived_channels , isdefault_custom_brand_text , isdefault_custom_description_text , isdefault_site_name , export_format , global_relay_customer_type , is_default_global_relay_email_address , is_default_global_relay_smtp_password , extend_session_length_with_activity , experimental_enable_authentication_transfer , experimental_enable_default_channel_leave_join_messages , experimental_enable_hardened_mode , feature_cloud , issued_date, issued_week, issued_month, issued_year , users , available_locales , default_client_locale , default_server_locale , console_json_log , console_level_log , enable_console_log , enable_file_log , enable_webhook_debugging , feature_email_notification_contents , feature_future , feature_google , feature_guest_accounts , feature_guest_accounts_permissions , feature_id_loaded , feature_ldap , feature_ldap_groups , feature_lock_teammate_name_display , feature_message_export , feature_metrics , feature_mfa , feature_mhpns , feature_office365 , feature_password , feature_saml , feature_advanced_logging , file_enabled_audit , syslog_enabled_audit , syslog_insecure_audit , syslog_max_queue_size_audit , file_max_age_days_audit , file_max_backups_audit , file_max_queue_size_audit , file_max_size_mb_audit , file_json_log , file_level_log , isdefault_file_format , isdefault_file_location_log , group_team_count , group_member_count , group_channel_count , distinct_group_member_count , group_synced_team_count , gfycat_api_key , gfycat_api_secret , isdefault_allowed_untrusted_internal_connections , isdefault_allowed_untrusted_inteznal_connections , isdefault_allow_cors_from , group_count , group_synced_channel_count , group_count_with_allow_reference , ldap_group_count , custom_group_count , batch_size , daily_run_time , enable_message_export , export_retention_days , image_proxy_type , isdefault_remote_image_proxy_options , isdefault_remote_image_proxy_url , connection_security_ldap , enable_ldap , isnotempty_private_key , isnotempty_public_certificate , inactive_backend_plugins , inactive_plugins , inactive_webapp_plugins , plugins_with_broken_manifests , plugins_with_settings , file_compress_audit , advanced_logging_config , ios_latest_version , ios_min_version , advertise_address , enable_gossip_compression , bind_address , enable_cluster , network_interface , read_only_config , use_experimental_gossip , isdefault_app_custom_url_schemes , enable_remote_cluster , archive_recursion , amazon_s3_sse , amazon_s3_ssl , amazon_s3_trace , driver_name_file , enable_file_attachments , enable_mobile_download , isdefault_cors_exposed_headers , isdefault_google_developer_key , isdefault_image_proxy_options , isdefault_image_proxy_type , isdefault_image_proxy_url , isdefault_custom_url_schemes , enable_autocomplete , enable_indexing , enable_searching , isdefault_connection_url , isdefault_index_prefix , isdefault_password , isdefault_username , isdefault_feedback_name , isdefault_feedback_organization , isdefault_login_button_border_color_email , isdefault_login_button_color_email , isdefault_login_button_text_color_email , isdefault_file_location_notifications , enable_office365_oauth , openid_google , openid_gitlab , openid_office365 , enable_openid , enable_google_oauth , enable_gitlab_oauth , chimera_oauth_proxy_url , isdefault_help_link , isdefault_privacy_policy_link , isdefault_report_a_problem_link , isdefault_support_email , isdefault_terms_of_service_link , segment_dedupe_id_support , isdefault_id_attribute_ldap , isdefault_last_name_attribute_ldap , isdefault_login_button_border_color_ldap , isdefault_login_button_color_ldap , isdefault_login_button_text_color_ldap , isdefault_last_name_attribute_saml , isdefault_locale_attribute , isdefault_login_button_border_color_saml , isdefault_login_button_color_saml , isdefault_login_button_text , isdefault_login_button_text_color_saml , isdefault_nickname_attribute_saml , isdefault_position_attribute_saml , isdefault_scoping_idp_name , isdefault_scoping_idp_provider_id , isdefault_login_field_name , isdefault_login_id_attribute , isdefault_nickname_attribute_ldap , isdefault_position_attribute_ldap , isdefault_username_attribute_ldap , isempty_admin_filter , isdefault_read_timeout , isdefault_site_url , isdefault_tls_cert_file , isdefault_tls_key_file , isdefault_write_timeout , maximum_login_attempts , minimum_hashtag_length , post_edit_time_limit , isdefault_reply_to_address , push_notification_contents , require_email_verification , send_email_notifications , send_push_notifications , skip_server_certificate_verification , isdefault_signature_algorithm , isdefault_username_attribute_saml , sign_request , verify_saml , enable_link_previews , collapsed_threads , managed_resource_paths , enable_legacy_sidebar , isdefault_user_status_away_timeout , lock_teammate_name_display , max_channels_per_team , max_notifications_per_channel , max_users_per_team , restrict_direct_message , isempty_group_filter , isempty_guest_filter , max_page_size , query_timeout_ldap , segment_dedupe_id_ldap , skip_certificate_verification , sync_interval_minutes , start_date , is_default_global_relay_smtp_username , block_profile_rate , enable_metrics , isdefault_android_app_download_link , isdefault_app_download_link , isdefault_iosapp_download_link , license_edition , expire_date , feature_cluster , feature_compliance , feature_custom_brand , feature_custom_permissions_schemes , feature_data_retention , feature_elastic_search , license_id2 , in_security , in_mm2_server , tracking_disabled , has_dupes , has_multi_ips , active_users , active_users_daily , active_users_monthly , bot_accounts , bot_posts_previous_day , live_indexing_batch_size , skip_tls_verification , sniff , trace_elasticsearch , connection_security_email , email_batching_buffer_size , email_notification_contents_type , max_burst , memory_store_size , per_sec , vary_by_remote_address , vary_by_user , enable_saml , ignore_guest_ldap_sync , enable_admin_attribute , enable_sync_with_ldap , enable_sync_with_ldap_include_auth , registered_deactivated_users , registered_inactive_users , registered_users , slash_commands , teams , used_apiv3 , isdefault_max_users_for_statistics , require_plugin_signature , signature_public_key_files , version_antivirus , version_autolink , version_aws_sns , version_custom_user_attributes , version_github , version_gitlab , restrict_custom_emoji_creation , restrict_post_delete , session_cache_in_minutes , session_idle_timeout_in_minutes , session_length_mobile_in_days , session_length_sso_in_days , restrict_link_previews , enable_file_search , thread_autofollow , allow_cookies_for_subdomains , enable_api_channel_deletion , enable_api_user_deletion , allow_edit_post_service , restrict_private_channel_creation , restrict_private_channel_deletion , restrict_private_channel_management , restrict_private_channel_manage_members , restrict_public_channel_creation , restrict_public_channel_deletion , restrict_public_channel_management , restrict_team_invite , teammate_name_display , view_archived_channels , allowed_themes , allow_custom_themes , server_id , ip_address , location , version , context_library_version , edition , active_user_count , user_count , system_admins , operating_system , database_type , database_version , session_length_web_in_days , tls_strict_transport , uses_letsencrypt , websocket_url , web_server_mode , driver_name_sql , enable_public_channels_materialization , max_idle_conns , system_read_only_admin_permissions , system_read_only_admin_permissions_modified , system_user_manager_count , system_user_manager_permissions , system_user_manager_permissions_modified , team_user_permissions , system_manager_count , system_manager_permissions , system_manager_permissions_modified , system_read_only_admin_count , thumbnail_width , allow_email_accounts , enable_guest_accounts , enforce_multifactor_authentication_guest , isdefault_restrict_creation_to_domains , enable_image_proxy , use_channel_in_email_notifications , client_side_cert_enable , enable_shared_channels , cloud_user_limit , enable_click_to_reply , enable_experimental_gossip_encryption , use_channel_mentions_user_disabled_count , allow_edit_post_client , android_latest_version , android_min_version , desktop_latest_version , desktop_min_version , enable_apiv3_client , use_ip_address , enable_compliance , enable_compliance_daily , message_retention_days , file_retention_days , enable_message_deletion , enable_file_deletion , experimental_timezone , version_commattermostpluginincidentmanagement , version_comgithubmatterpollmatterpoll , enable_todo , enable_uploads , enable_webex , enable_welcome_bot , enable_zoom , enable_giphy , enable_digital_ocean , version_incident_response , version_todo , version_memes , version_jitsi , version_skype4business , enable_comgithubjespinorecommend , version_comgithubjespinorecommend , active_backend_plugins , version_jenkins , version_jira , version_nps , version_webex , version_welcome_bot , version_zoom , version_giphy , version_digital_ocean , version_confluence , version_mscalendar , warn_metric_mfa , warn_metric_number_of_teams_5 , warn_metric_number_of_active_users_100 , warn_metric_number_of_active_users_300 , warn_metric_number_of_channels_50 , warn_metric_number_of_active_users_500 , warn_metric_email_domain , warn_metric_number_of_posts_2m ]
  }

  dimension: supported {
    description: "Boolean indicating the server version was supported on the given logging date. Indicates support status at a point in time."
    type: yesno
    sql: CASE WHEN ${version_release_dates.release_date}::date >= ${logging_date}::DATE - INTERVAL '3 MONTHS' AND ${version_release_dates.release_date}::DATE <= ${logging_date}::DATE THEN TRUE
              WHEN ${version_release_dates.release_date}::date IN ('2018-05-16','2019-04-16','2020-01-16','2020-07-16','2021-01-16', '2021-07-16') AND ${version_release_dates.release_date}::DATE >= ${logging_date}::DATE - INTERVAL '9 MONTHS'
                AND ${version_release_dates.release_date}::DATE <= ${logging_date} THEN TRUE
              ELSE FALSE END ;;
    hidden: no
  }

  set: incident_collaboration {
    fields: [total_instances]
  }

  measure: total_instances {
    group_label: "  Instance Counts"
    type: count_distinct
    sql: ${server_id} ;;
    drill_fields: [server_fact*]
  }

  set: cse_drill {
    fields: [license_server_fact.customer_name, server_id, server_fact.server_version_major, posts_sum2, dau_sum, avg_posts_per_user_per_day, posts_previous_day_sum, active_users_daily_sum, avg_posts_per_user_per_day2]
  }

  dimension: max_active_user_count {
    type: number
    sql: ${server_fact.max_active_user_count}  ;;
    hidden: yes
  }

  dimension: paid_license_expire_date {
    type: date
    sql: ${server_fact.paid_license_expire_date}  ;;
    hidden: yes
  }

  dimension: dev_server {
    description: "Boolean that evaluates to true when the pluginversion is in alpha (i.e. not released to GA) or the server version has not yet been released."
    type: yesno
    sql: CASE WHEN ${server_id} IN  ('ctjqfcwp9ig6xnfdtxz3mgk7uy','g6mwsqa5yibutnqfggp67fbs1w', '4k15shdyrfr39m9h675xy1pssw')
            OR
            (regexp_substr(${server_fact.version}, '^[0-9]{1,2}.{1}[0-9]{1,2}.{1}[0-9]{1,2}$') IS NULL
             AND
            regexp_substr(regexp_substr(${server_fact.version},'^[0-9]{1,2}.{1}[0-9]{1,2}.{1}[0-9]{1,2}.{1}[0-9]{1,2}.{1}[0-9]{1,2}.{1}[0-9]{1,2}'), '[0-9]{0,}[.]{1}[0-9[{0,}[.]{1}[0-9]{0,}[.]{1}[0-9]{0,}$') IS NULL
            AND NOT ${server_fact.cloud_server})
            THEN TRUE ELSE FALSE END ;;
    group_label: "Excludability Filters"
  }

  dimension: community_server {
    description: "Boolean indicating the server performing the event is the Mattermost Community server."
    type: yesno
    sql: CASE WHEN ${server_id} = '93mykbogbjfrbbdqphx3zhze5c' THEN TRUE ELSE FALSE END ;;
    group_label: "Excludability Filters"
  }

  dimension: product_edition {
    label: " Product Edition"
    description: "The Mattermost SKU associated with the server on the given logging date."
    type: string
    sql: CASE WHEN ${license_server_fact.edition_null} IS NOT NULL AND NOT ${license_server_fact.trial} THEN ${license_server_fact.edition}
                      WHEN ${license_server_fact.edition} = 'Mattermost Cloud' THEN 'Mattermost Cloud'
                      WHEN ${license_server_fact.edition} IS NOT NULL AND ${license_server_fact.trial} THEN 'E20 Trial'
                      WHEN ${license_server_fact.customer_id} is not null and NOT ${license_server_fact.trial} THEN 'E10'
                      ELSE COALESCE(${edition}, ${server_fact.server_edition})
                      END ;;
  }

  # FILTERS
  dimension: last_day_of_month {
    group_label: "Date Filters"
    type: yesno
    description: "Filters so the logging date is equal to the last Thursday of each month. Useful when grouping by month to report on server states in the given month."
    sql: CASE WHEN ${logging_date} =
                                      CASE WHEN DATE_TRUNC('month', ${logging_date}::date + interval '1 day') = DATE_TRUNC('month', CURRENT_DATE) THEN
                                        CASE WHEN DAYOFMONTH((SELECT MAX(date - INTERVAL '1 DAY') FROM mattermost.server_daily_details)) = 1
                                            THEN (SELECT MAX(date - INTERVAL '1 DAY') FROM mattermost.server_daily_details)
                                          WHEN DAYOFWEEK((SELECT MAX(date - INTERVAL '1 DAY') FROM mattermost.server_daily_details)) < 6
                                            AND DAYOFWEEK((SELECT MAX(date - INTERVAL '1 DAY') FROM mattermost.server_daily_details)) > 0
                                            THEN (SELECT MAX(date - INTERVAL '1 DAY') FROM mattermost.server_daily_details)
                                          WHEN DAYOFWEEK((SELECT MAX(date - INTERVAL '1 DAY') FROM mattermost.server_daily_details)) < 6
                                            AND DAYOFWEEK((SELECT MAX(date - INTERVAL '1 DAY') FROM mattermost.server_daily_details)) > 0
                                            AND  DATE_TRUNC('MONTH',(SELECT MAX(date - INTERVAL '1 DAY') FROM mattermost.server_daily_details)) = DATE_TRUNC('MONTH', CURRENT_DATE)
                                            THEN (SELECT MAX(date - INTERVAL '1 DAY') FROM mattermost.server_daily_details)
                                          WHEN DAYOFWEEK((SELECT MAX(date - INTERVAL '2 DAY') FROM mattermost.server_daily_details)) < 6
                                            AND DAYOFWEEK((SELECT MAX(date - INTERVAL '2 DAY') FROM mattermost.server_daily_details)) > 0
                                            AND  DATE_TRUNC('MONTH',(SELECT MAX(date - INTERVAL '2 DAY') FROM mattermost.server_daily_details)) = DATE_TRUNC('MONTH', CURRENT_DATE)
                                            THEN (SELECT MAX(date - INTERVAL '2 DAY') FROM mattermost.server_daily_details)
                                          WHEN DAYOFWEEK((SELECT MAX(date - INTERVAL '3 DAY') FROM mattermost.server_daily_details)) < 6
                                            AND DAYOFWEEK((SELECT MAX(date - INTERVAL '3 DAY') FROM mattermost.server_daily_details)) > 0
                                            AND DATE_TRUNC('MONTH',(SELECT MAX(date - INTERVAL '3 DAY') FROM mattermost.server_daily_details)) = DATE_TRUNC('MONTH', CURRENT_DATE)
                                            THEN (SELECT MAX(date - INTERVAL '3 DAY') FROM mattermost.server_daily_details)
                                          ELSE (SELECT MAX(date) FROM mattermost.server_daily_details) END
                                      ELSE
                                        CASE WHEN DAYOFWEEK(DATEADD(MONTH, 1, DATE_TRUNC('month',${logging_date}::date)) - INTERVAL '1 DAY') = 4
                                            THEN DATEADD(MONTH, 1, DATE_TRUNC('month',${logging_date}::date)) - INTERVAL '1 DAY'
                                          WHEN DAYOFWEEK(DATEADD(MONTH, 1, DATE_TRUNC('month',${logging_date}::date)) - INTERVAL '2 DAY') = 4
                                            THEN DATEADD(MONTH, 1, DATE_TRUNC('month',${logging_date}::date)) - INTERVAL '2 DAY'
                                          WHEN DAYOFWEEK(DATEADD(MONTH, 1, DATE_TRUNC('month',${logging_date}::date)) - INTERVAL '3 DAY') = 4
                                            THEN DATEADD(MONTH, 1, DATE_TRUNC('month',${logging_date}::date)) - INTERVAL '3 DAY'
                                          WHEN DAYOFWEEK(DATEADD(MONTH, 1, DATE_TRUNC('month',${logging_date}::date)) - INTERVAL '4 DAY') = 4
                                            THEN DATEADD(MONTH, 1, DATE_TRUNC('month',${logging_date}::date)) - INTERVAL '4 DAY'
                                          WHEN DAYOFWEEK(DATEADD(MONTH, 1, DATE_TRUNC('month',${logging_date}::date)) - INTERVAL '5 DAY') = 4
                                            THEN DATEADD(MONTH, 1, DATE_TRUNC('month',${logging_date}::date)) - INTERVAL '5 DAY'
                                          WHEN DAYOFWEEK(DATEADD(MONTH, 1, DATE_TRUNC('month',${logging_date}::date)) - INTERVAL '6 DAY') = 4
                                            THEN DATEADD(MONTH, 1, DATE_TRUNC('month',${logging_date}::date)) - INTERVAL '6 DAY'
                                          WHEN DAYOFWEEK(DATEADD(MONTH, 1, DATE_TRUNC('month',${logging_date}::date)) - INTERVAL '7 DAY') = 4
                                            THEN DATEADD(MONTH, 1, DATE_TRUNC('month',${logging_date}::date)) - INTERVAL '7 DAY'
                                          ELSE DATEADD(MONTH, 1, DATE_TRUNC('month',${logging_date}::date)) - INTERVAL '8 DAY' END
                                      END
            THEN TRUE ELSE FALSE END ;;
  }

  dimension: last_day_of_week {
    type: yesno
    description: "Filters so the logging date is equal to the last Thursday of each week. Useful when grouping by month to report on server states in the given week."
    sql: CASE WHEN ${logging_date} =
    CASE WHEN DATE_TRUNC('week', ${logging_date}::date+interval '1 day') = DATE_TRUNC('week', CURRENT_DATE) THEN (SELECT MAX(date - INTERVAL '1 DAY') FROM mattermost.server_daily_details)
    ELSE DATEADD(WEEK, 1, DATE_TRUNC('week',${logging_date}::date)) - INTERVAL '4 DAY' END
    THEN TRUE ELSE FALSE END ;;
    group_label: "Date Filters"
  }

  dimension: latest_telemetry_record {
    label: "  Latest Security Telemetry Record"
    group_label: "  Telemetry Flags"
    description: "Indicates whether the record captures the last (most recent) date that Security (security_update_check.go) diagnostics telemetry was logged for the server."
    type: yesno
    sql: CASE WHEN ${logging_date} = ${server_fact.last_telemetry_active_date} THEN TRUE ELSE FALSE END ;;
    hidden: no
  }

  dimension: latest_telemetry_record_2 {
    label: "  Latest Telemetry Record"
    group_label: "  Telemetry Flags"
    description: "Boolean indicating the record is the last (most recent) date that the server sent Diagnostics (diagnostics.go) or Security (security_update_chech.go) telemetry data."
    type: yesno
    sql: CASE WHEN ${logging_date} = ${server_fact.last_active_date} THEN TRUE ELSE FALSE END ;;
    hidden: yes
  }

  dimension: latest_segment_telemetry_record {
    label: "  Latest Diagnostics Telemetry Record"
    group_label: "  Telemetry Flags"
    description: "Boolean indicating the record is the last (most recent) date that Diagnostics (diagnostics.go) telemetry data was logged for the server."
    type: yesno
    sql: CASE WHEN ${server_fact.last_mm2_telemetry_date}::DATE = CURRENT_DATE::DATE THEN
              CASE WHEN ${logging_date}::DATE = ${server_fact.last_mm2_telemetry_date}::DATE - INTERVAL '1 DAY'
                THEN TRUE ELSE FALSE END
          ELSE CASE WHEN ${logging_date}::DATE = ${server_fact.last_mm2_telemetry_date}::DATE THEN TRUE ELSE FALSE END
          END ;;
    hidden: no
  }

  dimension: before_last_segment_telemetry_date {
    label: "  <= Last Activity Date"
    group_label: "  Telemetry Flags"
    description: "Indicates whether the record's logging date is before the server's last (most recent) date that Diagnostics (diagnostics.go) telemetry data was logged for the server."
    type: yesno
    sql: CASE WHEN ${logging_date} <= ${server_fact.last_mm2_telemetry_date} THEN TRUE ELSE FALSE END ;;
    hidden: no
  }

  dimension: first_telemetry_record {
    label: "  First Telemetry Record"
    group_label: "  Telemetry Flags"
    description: "Boolean indicating the record is the first date that the server sent Diagnostics (diagnostics.go) or Security (security_update_chech.go) telemetry data."
    type: yesno
    sql: CASE WHEN ${logging_date} = ${server_fact.first_active_date} THEN TRUE ELSE FALSE END ;;
    hidden: no
  }

  dimension: first_security_telemetry_record {
    label: "  First Security Telemetry Record"
    group_label: "  Telemetry Flags"
    description: "Boolean indicating the record is the first date that the server sent Security (security_update_chech.go) telemetry data."
    type: yesno
    sql: CASE WHEN ${logging_date} = ${server_fact.first_telemetry_active_date} THEN TRUE ELSE FALSE END ;;
    hidden: no
  }

  dimension: first_diagnostics_telemetry_record {
    label: "  First Diagnostics Telemetry Record"
    group_label: "  Telemetry Flags"
    description: "Boolean indicating the record is the first date that the server sent Diagnostics (diagnostics.go) telemetry data."
    type: yesno
    sql: CASE WHEN ${logging_date} = ${server_fact.first_mm2_telemetry_date}::date THEN TRUE ELSE FALSE END ;;
    hidden: no
  }

  dimension: currently_licensed {
    group_label: " Status & Activity Filters"
    type: yesno
    description: "Indicates the server is currently associated with a paid license that is not expired."
    sql: CASE WHEN ${license_server_fact.license_retired_date} >= CURRENT_DATE AND NOT ${license_server_fact.trial}
      AND COALESCE(${license_server_fact.edition}, 'NONE') != 'Mattermost Cloud' THEN TRUE ELSE FALSE END ;;
  }

  dimension: active_users_alltime {
    description: "The server has had >= 1 Active User during it's telemetry lifetime."
    group_label: " Status & Activity Filters"
    label: ">= 1 Active Users During Lifetime"
    type: yesno
    sql: CASE WHEN ${server_fact.max_active_user_count} > 0 THEN TRUE ELSE FALSE END ;;
  }

  dimension: active_users2_alltime {
    description: "The server has had >= 2 Active User during it's telemetry lifetime."
    group_label: " Status & Activity Filters"
    label: ">= 2 Active Users During Lifetime"
    type: yesno
    sql: CASE WHEN ${server_fact.max_active_user_count} > 1 THEN TRUE ELSE FALSE END ;;
  }

  # DIMENSIONS
  dimension: server_id {
    label: "  Instance Id"
    description: "The telemetry id associated with each distinct Mattermost Instance (Server/Cloud Workspace)."
    type: string
    sql: ${TABLE}.server_id ;;
    hidden: no
  }

  dimension: ip_address {
    label: " Ip Address"
    description: "Ths IP Address associated with the Mattermost Server on the given date."
    type: string
    sql: ${TABLE}.ip_address ;;
    hidden: no
  }

  dimension: location {
    label: " Location"
    description: ""
    type: string
    sql: ${TABLE}.location ;;
    hidden: yes
  }

  dimension: version {
    group_label: " Server Versions"
    label: " Server Version (Current)"
    description: "The version of the Mattermost server."
    type: string
    sql: CASE WHEN regexp_substr(regexp_substr(${TABLE}.version,'[0-9]{0,}[.]{1}[0-9[{0,}[.]{1}[0-9]{0,}[.]{1}[0-9]{0,}[.]{1}[0-9]{0,}[.]{1}[0-9]{0,}[.]{1}[0-9]{0,}'), '[0-9]{0,}[.]{1}[0-9[{0,}[.]{1}[0-9]{0,}[.]{1}[0-9]{0,}$') IS NULL THEN
    regexp_substr(${TABLE}.version,'^[0-9]{0,}[.]{1}[0-9[{0,}[.]{1}[0-9]{0,}[.]{1}[0-9]{0,}')
    ELSE regexp_substr(regexp_substr(${TABLE}.version,'[0-9]{0,}[.]{1}[0-9[{0,}[.]{1}[0-9]{0,}[.]{1}[0-9]{0,}[.]{1}[0-9]{0,}[.]{1}[0-9]{0,}[.]{1}[0-9]{0,}'), '[0-9]{0,}[.]{1}[0-9[{0,}[.]{1}[0-9]{0,}[.]{1}[0-9]{0,}$') END;;
    hidden: no
    order_by_field: server_version_major_sort
  }

  dimension: server_version_major {
    group_label: " Server Versions"
    label: "  Server Version: Major (Current)"
    description: "The version of the Mattermost server omitting the dot releases."
    type: string
    sql: split_part(${version}, '.', 1) || '.' || split_part(${version}, '.', 2)  ;;
    order_by_field: server_version_major_sort
  }

  dimension: server_version_major_int {
    group_label: " Server Versions"
    label: "  Server Version: Major (Current - Integer)"
    description: "The server version associated with the Mattermost server on the given logging date - omitting the trailing dot release."
    type: number
    sql: (split_part(${version}, '.', 1) || '.' || split_part(${version}, '.', 2))::float  ;;
    order_by_field: server_version_major_sort
    hidden: no
  }

  dimension: server_version_major_sort {
    group_label: " Server Versions"
    label: "  Server Version: Major (Current)"
    description: "The current server version, or if current telemetry is not available, the last recorded server version recorded for the server."
    type: number
    sql: (split_part(${version}, '.', 1) ||
          CASE WHEN split_part(${version}, '.', 2) = '10' THEN '99'
            ELSE split_part(${version}, '.', 2) || '0' END)::int ;;
    hidden: yes
  }

  dimension: context_library_version {
    label: " Context Library Version"
    description: ""
    type: string
    sql: ${TABLE}.context_library_version ;;
    hidden: yes
  }

  dimension: edition {
    label: " Server Edition (Current)"
    group_label: " Server Editions"
    description: "The server edition. Either E0 or TE."
    type: string
    sql: CASE WHEN ${TABLE}.edition IS NULL THEN
              CASE WHEN COALESCE(${server_fact.edition_upgrades}, 0) = 0 THEN ${server_fact.first_server_edition}
                   WHEN COALESCE(${server_fact.edition_upgrades}, 0) > 0 THEN ${server_fact.server_edition}
                   ELSE NULL END
              WHEN ${TABLE}.edition = 'true' THEN 'E0' WHEN  ${TABLE}.edition = 'false' THEN 'TE' ELSE NULL END ;;
}

  dimension: first_server_edition {
    label: "First Server Edition"
    group_label: " Server Editions"
    description: "The first server edition logged via telemetry for the server. Either E0 or TE."
    type: string
    sql: ${server_fact.first_server_edition} ;;
    hidden: yes
  }


  dimension: active_user_count {
    label: "Active Users"
    group_label: " Security User Counts"
    description: "The count of registered users that have logged in to the Mattermost site/application in the last 24 hours on the server (logged via security_update_check.go)."
    type: number
    sql: CASE WHEN ${active_users_daily} >= COALESCE(${TABLE}.active_user_count,0) THEN ${active_users_daily} ELSE ${TABLE}.active_user_count END ;;
  }

  dimension: active_user_count_band {
    label: "Active Users Band"
    group_label: " Security User Counts"
    description: "The count of registered users that have visited the Mattermost site/application in the last 24 hours on the server (logged via security_update_check.go)."
    type: tier
    style: integer
    tiers: [1, 2, 5, 11, 21, 31, 51, 76, 101, 151, 201, 401, 601, 1001, 3001]
    sql: ${active_user_count} ;;
  }

  dimension: user_count {
    label: "Registered Users"
    group_label: " Security User Counts"
    description: "The count of all users registered/associated with the server (logged via security_update_check.go)."
    type: number
    sql: coalesce(${registered_users}, ${TABLE}.user_count) ;;
  }

  dimension: user_count_band {
    label: "Registered Users Band"
    group_label: " Security User Counts"
    description: "The count of all users registered/associated with the server tiered into distinct ranges (logged via security_update_check.go)."
    type: tier
    style: integer
    tiers: [2, 5, 11, 21, 50, 101, 1001]#[1, 2, 5, 11, 21, 31, 51, 76, 101, 151, 201, 401, 601, 1001, 3001]#[2, 5, 11, 16, 21, 31, 41, 51, 76, 101, 151, 301, 501, 1001]

    sql: ${user_count} ;;
  }

  dimension: system_admins {
    label: " System Admins"
    group_label: " Activity User Counts"
    description: "The number of system admins associated with a server on a given logging date (mattermost2.server logged via diagnostics.go)."
    type: number
    sql: ${TABLE}.system_admins ;;
    hidden: no
  }

  dimension: operating_system {
    label: " Operating System"
    description: "The operating system the server is currently hosted on (Linux)."
    type: string
    sql: ${TABLE}.operating_system ;;
    hidden: yes
  }

  dimension: database_type {
    label: " Database Type"
    group_label: " Database Info."
    description: "The database type the server is currently hosted on (MySQL or Postgres)."
    type: string
    sql: ${TABLE}.database_type ;;
    hidden: no
  }

  dimension: database_version {
    label: " Database Version"
    group_label: " Database Info."
    description: "The database version of Mattermost the server was using on the given logging date (example: 5.9.0.5.9.8)"
    type: string
    sql: regexp_replace(${TABLE}.database_version, '[a-zA-Z\+\:\~\'\\s\)\(\"\-]', '') ;;
    order_by_field: database_version_major_sort
  }

  dimension: database_version_major_sort {
    label: "  Database Version Sort"
    group_label: " Database Info."
    description: "The current database version, or if current telemetry is not available, the last recorded server version recorded for the server."
    type: number
    sql: (split_part(${database_version}, '.', 1) ||
          CASE WHEN length(split_part(${database_version}, '.', 2)) > 1 THEN
            CASE WHEN left(split_part(${database_version}, '.', 2), 2)::int >= 10 AND left(split_part(${database_version}, '.', 2), 2)::int < 20 THEN '99'
                WHEN left(split_part(${database_version}, '.', 2), 2)::int >= 20 THEN left(split_part(${database_version}, '.', 2), 1) || '1'
                WHEN left(split_part(${database_version}, '.', 2), 1)::int = 0 THEN left(split_part(${database_version}, '.', 2), 1) || '0'
                ELSE NULL END
              WHEN length(split_part(${database_version}, '.', 2))::int = 1 THEN trim(left(split_part(${database_version}, '.', 2), 2)) || '0' END)::int ;;
    hidden: yes
  }

  dimension: database_version_major {
    label: " Database Version (Major)"
    group_label: " Database Info."
    description: "The database version the server uses to host Mattermost w/ the dot release removed."
    type: string
    sql: split_part(${database_version}, '.', 1) || '.' || left(split_part(${database_version}, '.', 2), 2) ;;
    order_by_field: database_version_major_sort
  }

  dimension: database_version_major_release {
    label: " Database Version (Major Release)"
    group_label: " Database Info."
    description: "The core database version the server uses to host Mattermost w/out any trailing releases."
    type: number
    sql: split_part(${database_version}, '.', 1)::int ;;
  }

  dimension: gitlab_install {
    label: "  Gitlab Install"
    description: "Boolean indicating the server's OAuth enable gitlab flag = True on the date of server activation (first logged diagnostics activity date)."
    type: yesno
    sql: ${server_fact.gitlab_install} ;;
  }

  dimension: account_sfid {
    label: " Account Sfid"
    description: "The Salesforce Account ID associated with the server."
    link: {
      label: "Salesforce Account Record"
      url: "https://mattermost.lightning.force.com/lightning/r/{{ value }}/view"
      icon_url: "https://mattermost.my.salesforce.com/favicon.ico"
    }
    type: string
    sql: ${server_fact.account_sfid} ;;
    hidden: yes
  }

  dimension: account_name {
    label: " Account Name"
    description: "The Salesforce Account Name associated with the server."
    link: {
      label: "Salesforce Account Record"
      url: "https://mattermost.lightning.force.com/lightning/r/{{ account_sfid._value }}/view"
      icon_url: "https://mattermost.my.salesforce.com/favicon.ico"
    }
    type: string
    sql: ${server_fact.account_name} ;;
    hidden: yes
  }

  dimension: company_name {
    label: " Company Name"
    description: "The License Company Name associated with the server."
    link: {
      label: "Salesforce Account Record"
      url: "https://mattermost.lightning.force.com/lightning/r/{{ account_sfid._value }}/view"
      icon_url: "https://mattermost.my.salesforce.com/favicon.ico"
    }
    type: string
    sql: ${server_fact.company_name} ;;
    hidden: yes
  }

  dimension: license_id1 {
    label: " License Id"
    description: "The Mattermost License ID associated with the server."
    type: string
    sql: ${license_server_fact.license_id} ;;
    hidden: yes
  }

  dimension: license_id2 {
    label: " License Id2"
    description: ""
    type: string
    sql: ${TABLE}.license_id2 ;;
    hidden: yes
  }

  dimension: license_id3 {
    label: " License Id"
    description: "The Mattermost License ID associated with the server."
    type: string
    sql: ${server_fact.license_id} ;;
    hidden: yes
  }

  dimension: in_security {
    label: "   In Security Telemetry"
    group_label: "  Telemetry Flags"
    description: "Boolean indicating the server appears in the events.security table data (security_update_check.go) on the given date."
    type: yesno
    sql: ${TABLE}.in_security ;;
    hidden: no
  }

  dimension: in_mm2_server {
    label: "  In Diagnostics Telemetry"
    group_label: "  Telemetry Flags"
    description: "Boolean indicating the server is in mattermost2.server (diagnostics.go) table data on the given logging date."
    type: yesno
    sql: ${TABLE}.in_mm2_server ;;
    hidden: no
  }

  dimension: tracking_disabled {
    label: " Telemetry Disabled"
    group_label: "  Telemetry Flags"
    description: "Boolean indicating the Server does not appear in Diagnostics or Server telemetry on the given logging date. True if server disabled telemetry, was deleted, or there was error/anomaly in the data collection pipeline."
    type: yesno
    sql: ${TABLE}.tracking_disabled ;;
    hidden: no
  }

  dimension: has_dupes {
    label: " Dupes"
    group_label: " Data Quality"
    description: "True or false indicating whether the server id appears more than once in the raw data on the record date. Can occur for many reasons: server restart, upgrade, cluster, or error."
    type: yesno
    sql: ${TABLE}.has_dupes ;;
    hidden: yes
  }

  dimension: has_multi_ips {
    label: " Multiple IP's"
    group_label: " Data Quality"
    description: "True or false indicating whether the server id appears more than once in the raw data, and that the server id was associated with multiple ip addresses. Typically occurs as a result of clustering i.e. hosting a signle server across databases."
    type: yesno
    sql: ${TABLE}.has_multi_ips ;;
    hidden: yes
  }

  dimension: latest_record {
    label: "  Latest Telemetry Record"
    group_label: "  Telemetry Flags"
    description: "Boolean indicating the record captures the last (most recent) date that telemetry was logged for the server (via security_update_check.go or diagnostics.go)."
    type: yesno
    sql: CASE WHEN ${logging_date} = ${server_fact.last_active_date} THEN TRUE ELSE FALSE END ;;
    hidden: no
  }

  dimension: currently_sending_telemetry{
    label: "  Telemetry Currently Enabled"
    group_label: "  Telemetry Flags"
    description: "True when server has recently sent telemetry (w/in 5 days) and/or has a paid license w/ an expire date >= Current Date (this is an assumption that they're actively using the product, but are protected behind a firewall or airgap network). "
    type: yesno
    sql: CASE WHEN datediff(DAY, ${server_fact.first_active_date}, ${server_fact.last_active_date}) >= 7 AND ${server_fact.last_active_date} >= (SELECT MAX(last_active_date - interval '5 day') FROM mattermost.server_fact) THEN TRUE
              WHEN datediff(DAY, ${server_fact.first_active_date}, ${server_fact.last_active_date}) < 7 AND ${server_fact.last_active_date} = (SELECT MAX(last_active_date) FROM mattermost.server_fact) THEN TRUE
              WHEN ${server_fact.paid_license_expire_date} >= CURRENT_DATE THEN TRUE
              ELSE FALSE END ;;
    hidden: no
  }

  dimension: events {
    group_label: "Server-Level User Events"
    label: "Total Events"
    description: "The total number of events by active users associated with the server on the given logging."
    type: number
    value_format_name: decimal_0
    sql: ${server_events_by_date.post_events} ;;
  }

  dimension: posts2 {
    group_label: "Server-Level User Events"
    label: "Posts"
    description: "The number of post events by active users associated with the server on the given logging."
    type: number
    value_format_name: decimal_0
    sql: ${server_events_by_date.post_events} ;;
  }

  dimension: posts_per_user_per_day {
    group_label: "Server-Level User Events"
    label: "Posts Per User"
    description: "The number of posts per active user for the server on the given logging."
    type: number
    value_format_name: decimal_1
    sql: ${server_events_by_date.post_events}::FLOAT/NULLIF(${server_events_by_date.users}::float,0) ;;
  }

  dimension: posts_per_user_per_day_band {
    group_label: "Server-Level User Events"
    label: "Posts Per User Band"
    description: "The number of posts per active user for the server on the given logging."
    type: tier
    style: integer
    tiers: [3, 6, 11, 16, 21, 31, 51, 101]
    sql: ${posts_per_user_per_day} ;;
  }

  dimension: mau {
    group_label: "Server-Level User Events"
    label: "Monthly Active Users"
    description: "The number of monthly active users associated with the server on the given logging date (derived from mattermost2.events - User Events)."
    type: number
    sql: ${server_events_by_date.mau_total} ;;
  }

  dimension: dau {
    group_label: "Server-Level User Events"
    label: "Daily Active Users"
    description: "The number of daily active users associated with the server on the given logging date (derived from mattermost2.events - User Events)."
    type: number
    sql: ${server_events_by_date.dau_total} ;;
  }

  dimension: mobile_dau {
    group_label: "Server-Level User Events"
    label: "Mobile DAU"
    description: "The number of mobile daily active users associated with the server on the given logging date (derived from mattermost2.events - User Events)."
    type: number
    sql: ${server_events_by_date.mobile_dau} ;;
  }

  dimension: active_users {
    description: "The number of active users logged by the Server's activity diagnostics telemetry data on the given logging date."
    type: number
    group_label: " Activity User Counts"
    sql: COALESCE(${TABLE}.active_users, 0) ;;
    hidden: yes
  }

  dimension: active_users_daily {
    label: "Active Users (Daily)"
    description: "The number of daily active users logged by the Server's activity diagnostics telemetry data on the given logging date (coalesced active_users and active_users_daily)."
    type: number
    group_label: " Activity User Counts"
    sql: CASE WHEN ${logging_date}::date = ${server_fact.first_active_date}::date AND ${server_fact.cloud_server} then COALESCE(nullif(${TABLE}.active_users_daily, 0), nullif(${active_users}, 0), 1)
          ELSE COALESCE(${TABLE}.active_users_daily, ${active_users}, 0) END ;;
    hidden: no
  }

  dimension: active_users_daily_band {
    description: "The number of daily active users logged by the Server's activity diagnostics telemetry data on the given logging date (coalesced active_users and active_users_daily)."
    type: tier
    style: integer
    tiers: [1, 2, 5, 11, 21, 31, 51, 76, 101, 151, 201, 401, 601, 1001, 3001]
    group_label: " Activity User Counts"
    sql: ${active_users_daily}  ;;
    hidden: no
  }

  dimension: active_users_monthly {
    description: "The number of distinct active users that logged in the last 30 days by the Server's activity diagnostic telemetry data on the given logging date."
    type: number
    group_label: " Activity User Counts"
    sql: ${TABLE}.active_users_monthly ;;
    hidden: no
  }

  dimension: bot_accounts {
    description: "The number of bot accounts logged by the Server's activity diagnostics telemetry data on the given logging date."
    type: number
    group_label: "Activity Diagnostics"
    sql: ${TABLE}.bot_accounts ;;
    hidden: no
  }

  dimension: bot_posts_previous_day {
    description: "The number of bot posts logged by the Server's activity diagnostics telemetry data the previous day before the given logging date."
    type: number
    group_label: "Activity Diagnostics"
    sql: ${TABLE}.bot_posts_previous_day ;;
    hidden: no
  }

  dimension: direct_message_channels {
    description: "The number of direct message channels logged by the Server's activity diagnostics telemetry data on the given logging date."
    type: number
    group_label: "Activity Diagnostics"
    sql: ${TABLE}.direct_message_channels ;;
    hidden: no
  }

  dimension: incoming_webhooks {
    description: "The number of incoming webhooks logged by the Server's activity diagnostics telemetry data on the given logging date."
    type: number
    group_label: "Activity Diagnostics"
    sql: ${TABLE}.incoming_webhooks ;;
    hidden: no
  }

  dimension: guest_accounts {
    description: "The number of guest accounts logged by the Server's activity diagnostics telemetry data on the given logging date."
    type: number
    group_label: "Activity Diagnostics"
    sql: ${TABLE}.guest_accounts ;;
    hidden: no
  }

  dimension: outgoing_webhooks {
    description: "The number of outgoing webhooks logged by the Server's activity diagnostics telemetry data on the given logging date."
    type: number
    group_label: "Activity Diagnostics"
    sql: ${TABLE}.outgoing_webhooks ;;
    hidden: no
  }

  dimension: posts {
    description: "The number of posts logged by the Server's activity diagnostics telemetry data on the given logging date."
    type: number
    group_label: "Activity Diagnostics"
    sql: ${TABLE}.posts ;;
    hidden: no
  }

  dimension: posts_per_user_per_day2 {
    label: "Posts Per User"
    description: "The number of posts per active user logged by the Server's activity diagnostics telemetry data on the given logging date."
    type: number
    group_label: "Activity Diagnostics"
    value_format_name: decimal_1
    sql: (/*${posts}::float-*/${posts_previous_day}::float)/NULLIF(${active_users_daily},0)::FLOAT ;;
    hidden: no
  }

  dimension: posts_per_user_per_day_band2 {
    label: "Posts Per User Band"
    description: "The number of posts per active user logged by the Server's activity diagnostics telemetry data on the given logging date."
    type: tier
    style: integer
    tiers: [3, 6, 11, 16, 21, 31, 51, 101]
    group_label: "Activity Diagnostics"
    sql: ${posts_per_user_per_day2} ;;
    hidden: no
  }

  dimension: posts_previous_day {
    description: "The number of posts logged by the Server's activity diagnostics telemetry data the previous day before on the given logging date."
    type: number
    group_label: "Activity Diagnostics"
    sql: ${TABLE}.posts_previous_day ;;
    hidden: no
  }

  dimension: private_channels {
    description: "The number of private channels logged by the Server's activity diagnostics telemetry data on the given logging date."
    type: number
    group_label: "Activity Diagnostics"
    sql: ${TABLE}.private_channels ;;
    hidden: no
  }

  dimension: private_channels_deleted {
    description: "The number of deleted private channels logged by the Server's activity diagnostics telemetry data on the given logging date."
    type: number
    group_label: "Activity Diagnostics"
    sql: ${TABLE}.private_channels_deleted ;;
    hidden: no
  }

  dimension: public_channels {
    description: "The number of public channels logged by the Server's activity diagnostics telemetry data on the given logging date."
    type: number
    group_label: "Activity Diagnostics"
    sql: ${TABLE}.public_channels ;;
    hidden: no
  }

  dimension: public_channels_deleted {
    description: "The number of deleted public channels logged by the Server's activity diagnostics telemetry data on the given logging date."
    type: number
    group_label: "Activity Diagnostics"
    sql: ${TABLE}.public_channels_deleted ;;
    hidden: no
  }

  dimension: registered_deactivated_users {
    description: "The number of registered deactivated users logged by the Server's activity diagnostics telemetry data on the given logging date."
    type: number
    group_label: " Activity User Counts"
    sql: ${TABLE}.registered_deactivated_users ;;
    hidden: no
  }

  dimension: registered_inactive_users {
    description: "The number of registered inactive users logged by the Server's activity diagnostics telemetry data on the given logging date."
    type: number
    group_label: " Activity User Counts"
    sql: ${TABLE}.registered_inactive_users ;;
    hidden: no
  }

  dimension: registered_users {
    description: "The number of registered users logged by the Server's activity diagnostics telemetry data on the given logging date (registered_users - registered_deactivated_users)."
    type: number
    group_label: " Activity User Counts"
    sql: CASE WHEN ${logging_date}::date = ${server_fact.first_active_date}::date AND ${server_fact.cloud_server} then NULLIF(COALESCE(NULLIF(${TABLE}.registered_users, 0), 1) - COALESCE(${TABLE}.registered_deactivated_users, 0),0)
      ELSE NULLIF(COALESCE(${TABLE}.registered_users, 0) - COALESCE(${TABLE}.registered_deactivated_users, 0),0) END;;
    hidden: no
  }

  dimension: registered_users_band {
    description: "The number of registered users logged by the Server's activity diagnostics telemetry data on the given logging date (registered_users - registered_deactivated_users)."
    type: tier
    style: integer
    tiers: [2, 5, 11, 21, 50, 101, 1001]#[1, 2, 4, 7, 11, 16, 21, 31, 41, 51, 76, 101, 151, 301, 501, 1001]#[2, 5, 11, 16, 21, 31, 41, 51, 76, 101, 151, 301, 501, 1001]
    group_label: " Activity User Counts"
    sql: ${registered_users} ;;
    hidden: no
  }

  dimension: slash_commands {
    description: "The number of slash commands logged by the Server's activity diagnostics telemetry data on the given logging date."
    type: number
    group_label: "Activity Diagnostics"
    sql: ${TABLE}.slash_commands ;;
    hidden: no
  }

  dimension: teams {
    description: "The number of teams logged by the Server's activity diagnostics telemetry data on the given logging date."
    type: number
    group_label: "Activity Diagnostics"
    sql: ${TABLE}.teams ;;
    hidden: no
  }

  dimension: used_apiv3 {
  label: "Used APIv3"
    description: "Boolean indicating whether APIv3 was used by the server on the given logging date (Activity Diagnostics)."
    type: yesno
    group_label: "Activity Diagnostics"
    sql: ${TABLE}.used_apiv3 ;;
    hidden: no
  }

  dimension: isdefault_max_users_for_statistics {
  label: "Isdefault Max Users For Statistics"
    description: ""
    type: yesno
    group_label: "Analytics Configuration"
    sql: ${TABLE}.isdefault_max_users_for_statistics ;;
    hidden: no
  }

  dimension: allow_banner_dismissal {
  label: "Allow Banner Dismissal"
    description: ""
    type: yesno
    group_label: "Annoucement Configuration"
    sql: ${TABLE}.allow_banner_dismissal ;;
    hidden: no
  }

  dimension: enable_banner {
  label: "Enable Banner"
    description: ""
    type: yesno
    group_label: "Annoucement Configuration"
    sql: ${TABLE}.enable_banner ;;
    hidden: no
  }

  dimension: isdefault_banner_color {
  label: "Isdefault Banner Color"
    description: ""
    type: yesno
    group_label: "Annoucement Configuration"
    sql: ${TABLE}.isdefault_banner_color ;;
    hidden: no
  }

  dimension: admin_notices_enabled {
    description: ""
    type: yesno
    group_label: "Annoucement Configuration"
    sql: ${TABLE}.admin_notices_enabled ;;
    hidden: no
  }

  dimension: user_notices_enabled {
    description: ""
    type: yesno
    group_label: "Annoucement Configuration"
    sql: ${TABLE}.user_notices_enabled ;;
    hidden: no
  }

  dimension: isdefault_banner_text_color {
    label: "Isdefault Banner Text Color"
    description: ""
    type: yesno
    group_label: "Annoucement Configuration"
    sql: ${TABLE}.isdefault_banner_text_color ;;
    hidden: no
  }

  dimension: channel_scheme_count {
    description: ""
    type: number
    group_label: "Channel Moderation"
    sql: ${TABLE}.channel_scheme_count ;;
    hidden: no
  }

  dimension: create_post_guest_disabled_count {
    description: ""
    type: number
    group_label: "Channel Moderation"
    sql: ${TABLE}.create_post_guest_disabled_count ;;
    hidden: no
  }

  dimension: create_post_user_disabled_count {
    description: ""
    type: number
    group_label: "Channel Moderation"
    sql: ${TABLE}.create_post_user_disabled_count ;;
    hidden: no
  }

  dimension: manage_members_user_disabled_count {
    description: ""
    type: number
    group_label: "Channel Moderation"
    sql: ${TABLE}.manage_members_user_disabled_count ;;
    hidden: no
  }

  dimension: post_reactions_guest_disabled_count {
    description: ""
    type: number
    group_label: "Channel Moderation"
    sql: ${TABLE}.post_reactions_guest_disabled_count ;;
    hidden: no
  }

  dimension: post_reactions_user_disabled_count {
    description: ""
    type: number
    group_label: "Channel Moderation"
    sql: ${TABLE}.post_reactions_user_disabled_count ;;
    hidden: no
  }

  dimension: use_channel_mentions_guest_disabled_count {
    description: ""
    type: number
    group_label: "Channel Moderation"
    sql: ${TABLE}.use_channel_mentions_guest_disabled_count ;;
    hidden: no
  }

  dimension: use_channel_mentions_user_disabled_count {
    description: ""
    type: number
    group_label: "Channel Moderation"
    sql: ${TABLE}.use_channel_mentions_user_disabled_count ;;
    hidden: no
  }

  dimension: allow_edit_post_client {
    description: ""
    type: string
    group_label: "Client Requirements Configuration"
    sql: ${TABLE}.allow_edit_post_client ;;
    hidden: no
  }

  dimension: android_latest_version {
    description: ""
    type: string
    group_label: "Client Requirements Configuration"
    sql: ${TABLE}.android_latest_version ;;
    hidden: no
  }

  dimension: android_min_version {
    description: ""
    type: string
    group_label: "Client Requirements Configuration"
    sql: ${TABLE}.android_min_version ;;
    hidden: no
  }

  dimension: desktop_latest_version {
    description: ""
    type: string
    group_label: "Client Requirements Configuration"
    sql: ${TABLE}.desktop_latest_version ;;
    hidden: no
  }

  dimension: desktop_min_version {
    description: ""
    type: string
    group_label: "Client Requirements Configuration"
    sql: ${TABLE}.desktop_min_version ;;
    hidden: no
  }

  dimension: enable_apiv3_client {
  label: "Enable Apiv3 Client"
    description: ""
    type: yesno
    group_label: "Client Requirements Configuration"
    sql: ${TABLE}.enable_apiv3_client ;;
    hidden: no
  }

  dimension: enable_channel_viewed_messages_client {
  label: "Enable Channel Viewed Messages Client"
    description: ""
    type: yesno
    group_label: "Client Requirements Configuration"
    sql: ${TABLE}.enable_channel_viewed_messages_client ;;
    hidden: no
  }

  dimension: enable_commands_client {
  label: "Enable Commands Client"
    description: ""
    type: yesno
    group_label: "Client Requirements Configuration"
    sql: ${TABLE}.enable_commands_client ;;
    hidden: no
  }

  dimension: enable_custom_emoji_client {
  label: "Enable Custom Emoji Client"
    description: ""
    type: yesno
    group_label: "Client Requirements Configuration"
    sql: ${TABLE}.enable_custom_emoji_client ;;
    hidden: no
  }

  dimension: enable_developer_client {
  label: "Enable Developer Client"
    description: ""
    type: yesno
    group_label: "Client Requirements Configuration"
    sql: ${TABLE}.enable_developer_client ;;
    hidden: no
  }

  dimension: enable_emoji_picker_client {
  label: "Enable Emoji Picker Client"
    description: ""
    type: yesno
    group_label: "Client Requirements Configuration"
    sql: ${TABLE}.enable_emoji_picker_client ;;
    hidden: no
  }

  dimension: enable_incoming_webhooks_client {
  label: "Enable Incoming Webhooks Client"
    description: ""
    type: yesno
    group_label: "Client Requirements Configuration"
    sql: ${TABLE}.enable_incoming_webhooks_client ;;
    hidden: no
  }

  dimension: enable_insecure_outgoing_connections_client {
  label: "Enable Insecure Outgoing Connections Client"
    description: ""
    type: yesno
    group_label: "Client Requirements Configuration"
    sql: ${TABLE}.enable_insecure_outgoing_connections_client ;;
    hidden: no
  }

  dimension: enable_multifactor_authentication_client {
  label: "Enable Multifactor Authentication Client"
    description: ""
    type: yesno
    group_label: "Client Requirements Configuration"
    sql: ${TABLE}.enable_multifactor_authentication_client ;;
    hidden: no
  }

  dimension: enable_oauth_service_provider_client {
  label: "Enable OAuth Service Provider Client"
    description: ""
    type: yesno
    group_label: "Client Requirements Configuration"
    sql: ${TABLE}.enable_oauth_service_provider_client ;;
    hidden: no
  }

  dimension: enable_only_admin_integrations_client {
  label: "Enable Only Admin Integrations Client"
    description: ""
    type: yesno
    group_label: "Client Requirements Configuration"
    sql: ${TABLE}.enable_only_admin_integrations_client ;;
    hidden: no
  }

  dimension: ios_latest_version {
    description: ""
    type: string
    group_label: "Client Requirements Configuration"
    sql: ${TABLE}.ios_latest_version ;;
    hidden: no
  }

  dimension: ios_min_version {
    description: ""
    type: string
    group_label: "Client Requirements Configuration"
    sql: ${TABLE}.ios_min_version ;;
    hidden: no
  }

  dimension: advertise_address {
  label: "Advertise Address"
    description: ""
    type: yesno
    group_label: "Cluster Configuration"
    sql: ${TABLE}.advertise_address ;;
    hidden: no
  }

  dimension: enable_gossip_compression {
    label: "Gossip Compression Enabled"
    description: ""
    type: yesno
    group_label: "Cluster Configuration"
    sql: ${TABLE}.enable_gossip_compression ;;
    hidden: no
  }

  dimension: bind_address {
  label: "Bind Address"
    description: ""
    type: yesno
    group_label: "Cluster Configuration"
    sql: ${TABLE}.bind_address ;;
    hidden: no
  }

  dimension: enable_cluster {
  label: "Enable Cluster"
    description: ""
    type: yesno
    group_label: "Cluster Configuration"
    sql: ${TABLE}.enable_cluster ;;
    hidden: no
  }

  dimension: network_interface {
  label: "Network Interface"
    description: ""
    type: yesno
    group_label: "Cluster Configuration"
    sql: ${TABLE}.network_interface ;;
    hidden: no
  }

  dimension: read_only_config {
  label: "Read Only Config"
    description: ""
    type: yesno
    group_label: "Cluster Configuration"
    sql: ${TABLE}.read_only_config ;;
    hidden: no
  }

  dimension: use_experimental_gossip {
  label: "Use Experimental Gossip"
    description: ""
    type: yesno
    group_label: "Cluster Configuration"
    sql: ${TABLE}.use_experimental_gossip ;;
    hidden: no
  }

  dimension: use_ip_address {
  label: "Use Ip Address"
    description: ""
    type: yesno
    group_label: "Cluster Configuration"
    sql: ${TABLE}.use_ip_address ;;
    hidden: no
  }

  dimension: enable_compliance {
  label: "Enable Compliance"
    description: ""
    type: yesno
    group_label: "Compliance Configuration"
    sql: ${TABLE}.enable_compliance ;;
    hidden: no
  }

  dimension: enable_compliance_daily {
  label: "Enable Compliance Daily"
    description: ""
    type: yesno
    group_label: "Compliance Configuration"
    sql: ${TABLE}.enable_compliance_daily ;;
    hidden: no
  }

  dimension: message_retention_days {
    description: ""
    type: number
    group_label: "Data Retention Configuration"
    sql: ${TABLE}.message_retention_days ;;
    hidden: no
  }

  dimension: file_retention_days {
    description: ""
    type: number
    group_label: "Data Retention Configuration"
    sql: ${TABLE}.file_retention_days ;;
    hidden: no
  }

  dimension: enable_message_deletion {
  label: "Enable Message Deletion"
    description: ""
    type: yesno
    group_label: "Data Retention Configuration"
    sql: ${TABLE}.enable_message_deletion ;;
    hidden: no
  }

  dimension: enable_file_deletion {
  label: "Enable File Deletion"
    description: ""
    type: yesno
    group_label: "Data Retention Configuration"
    sql: ${TABLE}.enable_file_deletion ;;
    hidden: no
  }

  dimension: experimental_timezone {
  label: "Experimental Timezone"
    description: ""
    type: yesno
    group_label: "Display Configuration"
    sql: ${TABLE}.experimental_timezone ;;
    hidden: no
  }

  dimension: isdefault_custom_url_schemes {
  label: "Isdefault Custom URL Schemes"
    description: ""
    type: yesno
    group_label: "Display Configuration"
    sql: ${TABLE}.isdefault_custom_url_schemes ;;
    hidden: no
  }

  dimension: enable_autocomplete {
  label: "Enable Autocomplete"
    description: ""
    type: yesno
    group_label: "ElasticSearch Configuration"
    sql: ${TABLE}.enable_autocomplete ;;
    hidden: no
  }

  dimension: enable_indexing {
  label: "Enable Indexing"
    description: ""
    type: yesno
    group_label: "ElasticSearch Configuration"
    sql: ${TABLE}.enable_indexing ;;
    hidden: no
  }

  dimension: enable_searching {
  label: "Enable Searching"
    description: ""
    type: yesno
    group_label: "ElasticSearch Configuration"
    sql: ${TABLE}.enable_searching ;;
    hidden: no
  }

  dimension: isdefault_connection_url {
  label: "Isdefault Connection URL"
    description: ""
    type: yesno
    group_label: "ElasticSearch Configuration"
    sql: ${TABLE}.isdefault_connection_url ;;
    hidden: no
  }

  dimension: isdefault_index_prefix {
  label: "Isdefault Index Prefix"
    description: ""
    type: yesno
    group_label: "ElasticSearch Configuration"
    sql: ${TABLE}.isdefault_index_prefix ;;
    hidden: no
  }

  dimension: isdefault_password {
  label: "Isdefault Password"
    description: ""
    type: yesno
    group_label: "ElasticSearch Configuration"
    sql: ${TABLE}.isdefault_password ;;
    hidden: no
  }

  dimension: isdefault_username {
  label: "Isdefault Username"
    description: ""
    type: yesno
    group_label: "ElasticSearch Configuration"
    sql: ${TABLE}.isdefault_username ;;
    hidden: no
  }

  dimension: live_indexing_batch_size {
    description: ""
    type: number
    group_label: "ElasticSearch Configuration"
    sql: ${TABLE}.live_indexing_batch_size ;;
    hidden: no
  }

  dimension: skip_tls_verification {
  label: "Skip TLS Verification"
    description: ""
    type: yesno
    group_label: "ElasticSearch Configuration"
    sql: ${TABLE}.skip_tls_verification ;;
    hidden: no
  }

  dimension: sniff {
  label: "Sniff"
    description: ""
    type: yesno
    group_label: "ElasticSearch Configuration"
    sql: ${TABLE}.sniff ;;
    hidden: no
  }

  dimension: trace_elasticsearch {
    description: ""
    type: string
    group_label: "ElasticSearch Configuration"
    sql: ${TABLE}.trace_elasticsearch ;;
    hidden: no
  }

  dimension: connection_security_email {
    description: ""
    type: string
    group_label: "Email Configuration"
    sql: ${TABLE}.connection_security_email ;;
    hidden: no
  }

  dimension: email_batching_buffer_size {
    description: ""
    type: number
    group_label: "Email Configuration"
    sql: ${TABLE}.email_batching_buffer_size ;;
    hidden: no
  }

  dimension: email_notification_contents_type {
    description: ""
    type: string
    group_label: "Email Configuration"
    sql: ${TABLE}.email_notification_contents_type ;;
    hidden: no
  }

  dimension: enable_email_batching {
  label: "Enable Email Batching"
    description: ""
    type: yesno
    group_label: "Email Configuration"
    sql: ${TABLE}.enable_email_batching ;;
    hidden: no
  }

  dimension: enable_preview_mode_banner {
  label: "Enable Preview Mode Banner"
    description: ""
    type: yesno
    group_label: "Email Configuration"
    sql: ${TABLE}.enable_preview_mode_banner ;;
    hidden: no
  }

  dimension: enable_sign_in_with_email {
  label: "Enable Sign In With Email"
    description: ""
    type: yesno
    group_label: "Email Configuration"
    sql: ${TABLE}.enable_sign_in_with_email ;;
    hidden: no
  }

  dimension: enable_sign_in_with_username {
  label: "Enable Sign In With Username"
    description: ""
    type: yesno
    group_label: "Email Configuration"
    sql: ${TABLE}.enable_sign_in_with_username ;;
    hidden: no
  }

  dimension: enable_sign_up_with_email {
  label: "Enable Sign Up With Email"
    description: ""
    type: yesno
    group_label: "Email Configuration"
    sql: ${TABLE}.enable_sign_up_with_email ;;
    hidden: no
  }

  dimension: enable_smtp_auth {
  label: "Enable Smtp Auth"
    description: ""
    type: yesno
    group_label: "Email Configuration"
    sql: ${TABLE}.enable_smtp_auth ;;
    hidden: no
  }

  dimension: isdefault_feedback_email {
  label: "Isdefault Feedback Email"
    description: ""
    type: yesno
    group_label: "Email Configuration"
    sql: ${TABLE}.isdefault_feedback_email ;;
    hidden: no
  }

  dimension: isdefault_feedback_name {
  label: "Isdefault Feedback Name"
    description: ""
    type: yesno
    group_label: "Email Configuration"
    sql: ${TABLE}.isdefault_feedback_name ;;
    hidden: no
  }

  dimension: isdefault_feedback_organization {
  label: "Isdefault Feedback Organization"
    description: ""
    type: yesno
    group_label: "Email Configuration"
    sql: ${TABLE}.isdefault_feedback_organization ;;
    hidden: no
  }

  dimension: isdefault_login_button_border_color_email {
  label: "Isdefault Login Button Border Color Email"
    description: ""
    type: yesno
    group_label: "Email Configuration"
    sql: ${TABLE}.isdefault_login_button_border_color_email ;;
    hidden: no
  }

  dimension: isdefault_login_button_color_email {
  label: "Isdefault Login Button Color Email"
    description: ""
    type: yesno
    group_label: "Email Configuration"
    sql: ${TABLE}.isdefault_login_button_color_email ;;
    hidden: no
  }

  dimension: isdefault_login_button_text_color_email {
  label: "Isdefault Login Button Text Color Email"
    description: ""
    type: yesno
    group_label: "Email Configuration"
    sql: ${TABLE}.isdefault_login_button_text_color_email ;;
    hidden: no
  }

  dimension: isdefault_reply_to_address {
  label: "Isdefault Reply To Address"
    description: ""
    type: yesno
    group_label: "Email Configuration"
    sql: ${TABLE}.isdefault_reply_to_address ;;
    hidden: no
  }

  dimension: push_notification_contents {
    description: ""
    type: string
    group_label: "Email Configuration"
    sql: ${TABLE}.push_notification_contents ;;
    hidden: no
  }

  dimension: require_email_verification {
  label: "Require Email Verification"
    description: ""
    type: yesno
    group_label: "Email Configuration"
    sql: ${TABLE}.require_email_verification ;;
    hidden: no
  }

  dimension: send_email_notifications {
  label: "Send Email Notifications"
    description: ""
    type: yesno
    group_label: "Email Configuration"
    sql: ${TABLE}.send_email_notifications ;;
    hidden: no
  }

  dimension: send_push_notifications {
  label: "Send Push Notifications"
    description: ""
    type: yesno
    group_label: "Email Configuration"
    sql: ${TABLE}.send_push_notifications ;;
    hidden: no
  }

  dimension: skip_server_certificate_verification {
  label: "Skip Server Certificate Verification"
    description: ""
    type: yesno
    group_label: "Email Configuration"
    sql: ${TABLE}.skip_server_certificate_verification ;;
    hidden: no
  }

  dimension: use_channel_in_email_notifications {
  label: "Use Channel In Email Notifications"
    description: ""
    type: yesno
    group_label: "Email Configuration"
    sql: ${TABLE}.use_channel_in_email_notifications ;;
    hidden: no
  }

  dimension: client_side_cert_enable {
  label: "Client Side Cert Enable"
    description: ""
    type: yesno
    group_label: "Experimental Configuration"
    sql: ${TABLE}.client_side_cert_enable ;;
    hidden: no
  }

  dimension: enable_shared_channels {
    description: ""
    type: yesno
    group_label: "Experimental Configuration"
    sql: ${TABLE}.enable_shared_channels ;;
    hidden: no
  }

  dimension: cloud_user_limit {
    description: ""
    type: number
    group_label: "Experimental Configuration"
    sql: ${TABLE}.cloud_user_limit ;;
    hidden: no
  }

  dimension: enable_click_to_reply {
  label: "Enable Click To Reply"
    description: ""
    type: yesno
    group_label: "Experimental Configuration"
    sql: ${TABLE}.enable_click_to_reply ;;
    hidden: no
  }

  dimension: enable_experimental_gossip_encryption {
    label: "Enable Gossip Encryption"
    description: ""
    type: yesno
    group_label: "Experimental Configuration"
    sql: ${TABLE}.enable_experimental_gossip_encryption ;;
    hidden: no
  }

  dimension: enable_post_metadata {
  label: "Enable Post Metadata"
    description: ""
    type: yesno
    group_label: "Experimental Configuration"
    sql: ${TABLE}.enable_post_metadata ;;
    hidden: no
  }

  dimension: isdefault_client_side_cert_check {
  label: "Isdefault Client Side Cert Check"
    description: ""
    type: yesno
    group_label: "Experimental Configuration"
    sql: ${TABLE}.isdefault_client_side_cert_check ;;
    hidden: no
  }

  dimension: restrict_system_admin {
  label: "Restrict System Admin"
    description: ""
    type: yesno
    group_label: "Experimental Configuration"
    sql: ${TABLE}.restrict_system_admin ;;
    hidden: no
  }

  dimension: use_new_saml_library {
  label: "Use New SAML Library"
    description: ""
    type: yesno
    group_label: "Experimental Configuration"
    sql: ${TABLE}.use_new_saml_library ;;
    hidden: no
  }

  dimension: enable_experimental_extensions {
  label: "Enable Experimental Extensions"
    description: ""
    type: yesno
    group_label: "Extension Configuration"
    sql: ${TABLE}.enable_experimental_extensions ;;
    hidden: no
  }

  dimension: amazon_s3_signv2 {
  label: "Amazon S3 Signv2"
    description: ""
    type: yesno
    group_label: "File Configuration"
    sql: ${TABLE}.amazon_s3_signv2 ;;
    hidden: no
  }

  dimension: extract_content {
    label: "Extract Content Enabled"
    description: ""
    type: yesno
    group_label: "File Configuration"
    sql: ${TABLE}.extract_content ;;
    hidden: no
  }

  dimension: isdefault_app_custom_url_schemes {
    label: "Default App Custom URL Schemes Enabled"
    description: ""
    type: yesno
    group_label: "Native App Configuration"
    sql: ${TABLE}.isdefault_app_custom_url_schemes ;;
    hidden: no
  }

  dimension: enable_remote_cluster {
    label: "Remote Cluster Enabled"
    description: ""
    type: yesno
    group_label: "Experimental Configuration"
    sql: ${TABLE}.enable_remote_cluster ;;
    hidden: no
  }

  dimension: archive_recursion {
    label: "Archive Recursion Enabled"
    description: ""
    type: yesno
    group_label: "File Configuration"
    sql: ${TABLE}.archive_recursion ;;
    hidden: no
  }

  dimension: amazon_s3_sse {
  label: "Amazon S3 Sse"
    description: ""
    type: yesno
    group_label: "File Configuration"
    sql: ${TABLE}.amazon_s3_sse ;;
    hidden: no
  }

  dimension: amazon_s3_ssl {
  label: "Amazon S3 Ssl"
    description: ""
    type: yesno
    group_label: "File Configuration"
    sql: ${TABLE}.amazon_s3_ssl ;;
    hidden: no
  }

  dimension: amazon_s3_trace {
  label: "Amazon S3 Trace"
    description: ""
    type: yesno
    group_label: "File Configuration"
    sql: ${TABLE}.amazon_s3_trace ;;
    hidden: no
  }

  dimension: driver_name_file {
    description: ""
    type: string
    group_label: "File Configuration"
    sql: ${TABLE}.driver_name_file ;;
    hidden: no
  }

  dimension: enable_file_attachments {
  label: "Enable File Attachments"
    description: ""
    type: yesno
    group_label: "File Configuration"
    sql: ${TABLE}.enable_file_attachments ;;
    hidden: no
  }

  dimension: enable_mobile_download {
  label: "Enable Mobile Download"
    description: ""
    type: yesno
    group_label: "File Configuration"
    sql: ${TABLE}.enable_mobile_download ;;
    hidden: no
  }

  dimension: enable_mobile_upload {
  label: "Enable Mobile Upload"
    description: ""
    type: yesno
    group_label: "File Configuration"
    sql: ${TABLE}.enable_mobile_upload ;;
    hidden: no
  }

  dimension: enable_public_links {
  label: "Enable Public Links"
    description: ""
    type: yesno
    group_label: "File Configuration"
    sql: ${TABLE}.enable_public_links ;;
    hidden: no
  }

  dimension: isabsolute_directory {
  label: "Isabsolute Directory"
    description: ""
    type: yesno
    group_label: "File Configuration"
    sql: ${TABLE}.isabsolute_directory ;;
    hidden: no
  }

  dimension: isdefault_directory {
  label: "Isdefault Directory"
    description: ""
    type: yesno
    group_label: "File Configuration"
    sql: ${TABLE}.isdefault_directory ;;
    hidden: no
  }

  dimension: max_file_size {
    description: ""
    type: number
    group_label: "File Configuration"
    sql: ${TABLE}.max_file_size ;;
    hidden: no
  }

  dimension: preview_height {
    description: ""
    type: number
    group_label: "File Configuration"
    sql: ${TABLE}.preview_height ;;
    hidden: no
  }

  dimension: preview_width {
    description: ""
    type: number
    group_label: "File Configuration"
    sql: ${TABLE}.preview_width ;;
    hidden: no
  }

  dimension: profile_height {
    description: ""
    type: number
    group_label: "File Configuration"
    sql: ${TABLE}.profile_height ;;
    hidden: no
  }

  dimension: profile_width {
    description: ""
    type: number
    group_label: "File Configuration"
    sql: ${TABLE}.profile_width ;;
    hidden: no
  }

  dimension: thumbnail_height {
    description: ""
    type: number
    group_label: "File Configuration"
    sql: ${TABLE}.thumbnail_height ;;
    hidden: no
  }

  dimension: thumbnail_width {
    description: ""
    type: number
    group_label: "File Configuration"
    sql: ${TABLE}.thumbnail_width ;;
    hidden: no
  }

  dimension: allow_email_accounts {
  label: "Allow Email Accounts"
    description: ""
    type: yesno
    group_label: "Guest Account Configuration"
    sql: ${TABLE}.allow_email_accounts ;;
    hidden: no
  }

  dimension: enable_guest_accounts {
  label: "Enable Guest Accounts"
    description: ""
    type: yesno
    group_label: "Guest Account Configuration"
    sql: ${TABLE}.enable_guest_accounts ;;
    hidden: no
  }

  dimension: enforce_multifactor_authentication_guest {
  label: "Enforce Multifactor Authentication Guest"
    description: ""
    type: yesno
    group_label: "Guest Account Configuration"
    sql: ${TABLE}.enforce_multifactor_authentication_guest ;;
    hidden: no
  }

  dimension: isdefault_restrict_creation_to_domains {
  label: "Isdefault Restrict Creation To Domains"
    description: ""
    type: yesno
    group_label: "Guest Account Configuration"
    sql: ${TABLE}.isdefault_restrict_creation_to_domains ;;
    hidden: no
  }

  dimension: enable_image_proxy {
  label: "Enable Image Proxy"
    description: ""
    type: yesno
    group_label: "Image Proxy Configuration"
    sql: ${TABLE}.enable_image_proxy ;;
    hidden: no
  }

  dimension: image_proxy_type {
    description: ""
    type: string
    group_label: "Image Proxy Configuration"
    sql: ${TABLE}.image_proxy_type ;;
    hidden: no
  }

  dimension: isdefault_remote_image_proxy_options {
  label: "Isdefault Remote Image Proxy Options"
    description: ""
    type: yesno
    group_label: "Image Proxy Configuration"
    sql: ${TABLE}.isdefault_remote_image_proxy_options ;;
    hidden: no
  }

  dimension: isdefault_remote_image_proxy_url {
  label: "Isdefault Remote Image Proxy URL"
    description: ""
    type: yesno
    group_label: "Image Proxy Configuration"
    sql: ${TABLE}.isdefault_remote_image_proxy_url ;;
    hidden: no
  }

  dimension: connection_security_ldap {
    description: ""
    type: string
    group_label: "LDAP Configuration"
    sql: ${TABLE}.connection_security_ldap ;;
    hidden: no
  }

  dimension: enable_ldap {
  label: "Enable LDAP"
    description: ""
    type: yesno
    group_label: "LDAP Configuration"
    sql: ${TABLE}.enable_ldap ;;
    hidden: no
  }

  dimension: isnotempty_private_key {
    description: ""
    type: yesno
    group_label: "LDAP Configuration"
    sql: ${TABLE}.isnotempty_private_key ;;
    hidden: no
  }

  dimension: isnotempty_public_certificate {
    description: ""
    type: yesno
    group_label: "LDAP Configuration"
    sql: ${TABLE}.isnotempty_public_certificate ;;
    hidden: no
  }

  dimension: enable_admin_filter {
  label: "Enable Admin Filter"
    description: ""
    type: yesno
    group_label: "LDAP Configuration"
    sql: ${TABLE}.enable_admin_filter ;;
    hidden: no
  }

  dimension: enable_sync {
  label: "Enable Sync"
    description: ""
    type: yesno
    group_label: "LDAP Configuration"
    sql: ${TABLE}.enable_sync ;;
    hidden: no
  }

  dimension: isdefault_email_attribute_ldap {
  label: "Isdefault Email Attribute LDAP"
    description: ""
    type: yesno
    group_label: "LDAP Configuration"
    sql: ${TABLE}.isdefault_email_attribute_ldap ;;
    hidden: no
  }

  dimension: isdefault_first_name_attribute_ldap {
  label: "Isdefault First Name Attribute LDAP"
    description: ""
    type: yesno
    group_label: "LDAP Configuration"
    sql: ${TABLE}.isdefault_first_name_attribute_ldap ;;
    hidden: no
  }

  dimension: isdefault_group_display_name_attribute {
  label: "Isdefault Group Display Name Attribute"
    description: ""
    type: yesno
    group_label: "LDAP Configuration"
    sql: ${TABLE}.isdefault_group_display_name_attribute ;;
    hidden: no
  }

  dimension: isdefault_group_id_attribute {
  label: "Isdefault Group Id Attribute"
    description: ""
    type: yesno
    group_label: "LDAP Configuration"
    sql: ${TABLE}.isdefault_group_id_attribute ;;
    hidden: no
  }

  dimension: isdefault_id_attribute_ldap {
  label: "Isdefault Id Attribute LDAP"
    description: ""
    type: yesno
    group_label: "LDAP Configuration"
    sql: ${TABLE}.isdefault_id_attribute_ldap ;;
    hidden: no
  }

  dimension: isdefault_last_name_attribute_ldap {
  label: "Isdefault Last Name Attribute LDAP"
    description: ""
    type: yesno
    group_label: "LDAP Configuration"
    sql: ${TABLE}.isdefault_last_name_attribute_ldap ;;
    hidden: no
  }

  dimension: isdefault_login_button_border_color_ldap {
  label: "Isdefault Login Button Border Color LDAP"
    description: ""
    type: yesno
    group_label: "LDAP Configuration"
    sql: ${TABLE}.isdefault_login_button_border_color_ldap ;;
    hidden: no
  }

  dimension: isdefault_login_button_color_ldap {
  label: "Isdefault Login Button Color LDAP"
    description: ""
    type: yesno
    group_label: "LDAP Configuration"
    sql: ${TABLE}.isdefault_login_button_color_ldap ;;
    hidden: no
  }

  dimension: isdefault_login_button_text_color_ldap {
  label: "Isdefault Login Button Text Color LDAP"
    description: ""
    type: yesno
    group_label: "LDAP Configuration"
    sql: ${TABLE}.isdefault_login_button_text_color_ldap ;;
    hidden: no
  }

  dimension: isdefault_login_field_name {
  label: "Isdefault Login Field Name"
    description: ""
    type: yesno
    group_label: "LDAP Configuration"
    sql: ${TABLE}.isdefault_login_field_name ;;
    hidden: no
  }

  dimension: isdefault_login_id_attribute {
  label: "Isdefault Login Id Attribute"
    description: ""
    type: yesno
    group_label: "LDAP Configuration"
    sql: ${TABLE}.isdefault_login_id_attribute ;;
    hidden: no
  }

  dimension: isdefault_nickname_attribute_ldap {
  label: "Isdefault Nickname Attribute LDAP"
    description: ""
    type: yesno
    group_label: "LDAP Configuration"
    sql: ${TABLE}.isdefault_nickname_attribute_ldap ;;
    hidden: no
  }

  dimension: isdefault_position_attribute_ldap {
  label: "Isdefault Position Attribute LDAP"
    description: ""
    type: yesno
    group_label: "LDAP Configuration"
    sql: ${TABLE}.isdefault_position_attribute_ldap ;;
    hidden: no
  }

  dimension: isdefault_username_attribute_ldap {
  label: "Isdefault Username Attribute LDAP"
    description: ""
    type: yesno
    group_label: "LDAP Configuration"
    sql: ${TABLE}.isdefault_username_attribute_ldap ;;
    hidden: no
  }

  dimension: isempty_admin_filter {
  label: "Isempty Admin Filter"
    description: ""
    type: yesno
    group_label: "LDAP Configuration"
    sql: ${TABLE}.isempty_admin_filter ;;
    hidden: no
  }

  dimension: isempty_group_filter {
  label: "Isempty Group Filter"
    description: ""
    type: yesno
    group_label: "LDAP Configuration"
    sql: ${TABLE}.isempty_group_filter ;;
    hidden: no
  }

  dimension: isempty_guest_filter {
  label: "Isempty Guest Filter"
    description: ""
    type: yesno
    group_label: "LDAP Configuration"
    sql: ${TABLE}.isempty_guest_filter ;;
    hidden: no
  }

  dimension: max_page_size {
    description: ""
    type: number
    group_label: "LDAP Configuration"
    sql: ${TABLE}.max_page_size ;;
    hidden: no
  }

  dimension: query_timeout_ldap {
    description: ""
    type: number
    group_label: "LDAP Configuration"
    sql: ${TABLE}.query_timeout_ldap ;;
    hidden: no
  }

  dimension: segment_dedupe_id_ldap {
    description: ""
    type: string
    group_label: "LDAP Configuration"
    sql: ${TABLE}.segment_dedupe_id_ldap ;;
    hidden: no
  }

  dimension: skip_certificate_verification {
  label: "Skip Certificate Verification"
    description: ""
    type: yesno
    group_label: "LDAP Configuration"
    sql: ${TABLE}.skip_certificate_verification ;;
    hidden: no
  }

  dimension: sync_interval_minutes {
    description: ""
    type: number
    group_label: "LDAP Configuration"
    sql: ${TABLE}.sync_interval_minutes ;;
    hidden: no
  }

  dimension: license_id {
    description: ""
    type: string
    group_label: "License Configuration"
    sql: ${license_server_fact.license_id} ;;
    hidden: no
  }

  dimension_group: start {
    description: "The start date of the license associated with Mattermost server."
    type: time
    timeframes: [date, week, month, year, fiscal_quarter, fiscal_year]
    group_label: "License Configuration"
    sql: ${TABLE}.start_date ;;
    hidden: no
  }

  dimension: license_edition {
    description: "The Mattermost edition currently associated with the Mattermost server."
    type: string
    group_label: "License Configuration"
    sql: COALESCE(${license_server_fact.edition_null}, ${TABLE}.license_edition) ;;
    hidden: no
  }

  dimension_group: expire {
    description: "The expiration date of the license associated with the Mattermost server."
    type: time
    timeframes: [date, week, month, year, fiscal_quarter, fiscal_year]
    group_label: "License Configuration"
    sql: ${TABLE}.expire_date ;;
    hidden: no
  }

  dimension: feature_cluster {
  label: "Feature Cluster"
    description: "Indicates whether the Cluster feature is enabled on the provisioned license."
    type: yesno
    group_label: "License Configuration"
    sql: ${TABLE}.feature_cluster ;;
    hidden: no
  }

  dimension: feature_compliance {
  label: "Feature Compliance"
    description: "Indicates whether the Compliance feature is enabled on the provisioned license."
    type: yesno
    group_label: "License Configuration"
    sql: ${TABLE}.feature_compliance ;;
    hidden: no
  }

  dimension: feature_custom_brand {
  label: "Feature Custom Brand"
    description: "Indicates whether the Custom Brand feature is enabled on the provisioned license."
    type: yesno
    group_label: "License Configuration"
    sql: ${TABLE}.feature_custom_brand ;;
    hidden: no
  }

  dimension: feature_custom_permissions_schemes {
  label: "Feature Custom Permissions Schemes"
    description: "Indicates whether the Custom Permissions Schemes feature is enabled on the provisioned license."
    type: yesno
    group_label: "License Configuration"
    sql: ${TABLE}.feature_custom_permissions_schemes ;;
    hidden: no
  }

  dimension: feature_data_retention {
  label: "Feature Data Retention"
    description: "Indicates whether the Data Retention feature is enabled on the provisioned license."
    type: yesno
    group_label: "License Configuration"
    sql: ${TABLE}.feature_data_retention ;;
    hidden: no
  }

  dimension: feature_elastic_search {
  label: "Feature Elastic Search"
    description: "Indicates whether the Elastic Search feature is enabled on the provisioned license."
    type: yesno
    group_label: "License Configuration"
    sql: ${TABLE}.feature_elastic_search ;;
    hidden: no
  }

  dimension: feature_email_notification_contents {
  label: "Feature Email Notification Contents"
    description: "Indicates whether the Email Notifications Contents feature is enabled on the provisioned license."
    type: yesno
    group_label: "License Configuration"
    sql: ${TABLE}.feature_email_notification_contents ;;
    hidden: no
  }

  dimension: feature_future {
  label: "Feature Future"
    description: "Indicates whether the Future feature is enabled on the provisioned license."
    type: yesno
    group_label: "License Configuration"
    sql: ${TABLE}.feature_future ;;
    hidden: no
  }

  dimension: feature_google {
  label: "Feature Google"
    description: "Indicates whether the Google feature is enabled on the provisioned license."
    type: yesno
    group_label: "License Configuration"
    sql: ${TABLE}.feature_google ;;
    hidden: no
  }

  dimension: feature_guest_accounts {
  label: "Feature Guest Accounts"
    description: "Indicates whether the Guest Accounts feature is enabled on the provisioned license."
    type: yesno
    group_label: "License Configuration"
    sql: ${TABLE}.feature_guest_accounts ;;
    hidden: no
  }

  dimension: feature_guest_accounts_permissions {
  label: "Feature Guest Accounts Permissions"
    description: "Indicates whether the Guest Accounts Permissions feature is enabled on the provisioned license."
    type: yesno
    group_label: "License Configuration"
    sql: ${TABLE}.feature_guest_accounts_permissions ;;
    hidden: no
  }

  dimension: feature_id_loaded {
  label: "Feature ID Loaded"
    description: "Indicates whether the ID Loaded feature is enabled on the provisioned license."
    type: yesno
    group_label: "License Configuration"
    sql: ${TABLE}.feature_id_loaded ;;
    hidden: no
  }

  dimension: feature_ldap {
  label: "Feature LDAP"
    description: "Indicates whether the LDAP feature is enabled on the provisioned license."
    type: yesno
    group_label: "License Configuration"
    sql: ${TABLE}.feature_ldap ;;
    hidden: no
  }

  dimension: feature_ldap_groups {
  label: "Feature LDAP Groups"
    description: "Indicates whether the LDAP Groups feature is enabled on the provisioned license."
    type: yesno
    group_label: "License Configuration"
    sql: ${TABLE}.feature_ldap_groups ;;
    hidden: no
  }

  dimension: feature_lock_teammate_name_display {
  label: "Feature Lock Teammate Name Display"
    description: "Indicates whether the Lock Teammate Name Display feature is enabled on the provisioned license."
    type: yesno
    group_label: "License Configuration"
    sql: ${TABLE}.feature_lock_teammate_name_display ;;
    hidden: no
  }

  dimension: feature_message_export {
  label: "Feature Message Export"
    description: "Indicates whether the Data Retention feature is enabled on the provisioned license."
    type: yesno
    group_label: "License Configuration"
    sql: ${TABLE}.feature_message_export ;;
    hidden: no
  }

  dimension: feature_metrics {
  label: "Feature Metrics"
    description: "Indicates whether the Metrics feature is enabled on the provisioned license."
    type: yesno
    group_label: "License Configuration"
    sql: ${TABLE}.feature_metrics ;;
    hidden: no
  }

  dimension: feature_mfa {
  label: "Feature MFA"
    description: "Indicates whether the Multi-factor Authentication feature is enabled on the provisioned license."
    type: yesno
    group_label: "License Configuration"
    sql: ${TABLE}.feature_mfa ;;
    hidden: no
  }

  dimension: feature_mhpns {
  label: "Feature MHPNS"
    description: "Indicates whether the MHPNS feature is enabled on the provisioned license."
    type: yesno
    group_label: "License Configuration"
    sql: ${TABLE}.feature_mhpns ;;
    hidden: no
  }

  dimension: feature_office365 {
  label: "Feature Office365"
    description: "Indicates whether the Office365 feature is enabled on the provisioned license."
    type: yesno
    group_label: "License Configuration"
    sql: ${TABLE}.feature_office365 ;;
    hidden: no
  }

  dimension: feature_password {
  label: "Feature Password"
    description: "Indicates whether the Password feature is enabled on the provisioned license."
    type: yesno
    group_label: "License Configuration"
    sql: ${TABLE}.feature_password ;;
    hidden: no
  }

  dimension: feature_saml {
  label: "Feature SAML"
    description: "Indicates whether the SAML feature is enabled on the provisioned license."
    type: yesno
    group_label: "License Configuration"
    sql: ${TABLE}.feature_saml ;;
    hidden: no
  }

  dimension: feature_advanced_logging {
    label: "Feature Advanced Logging"
    description: "Indicates whether the Advanced Logging feature is enabled on the provisioned license."
    type: yesno
    group_label: "License Configuration"
    sql: ${TABLE}.feature_advanced_logging ;;
    hidden: no
  }

  dimension: feature_cloud {
    label: "Feature Cloud"
    description: "Indicates whether the Cloud feature is enabled on the provisioned license."
    type: yesno
    group_label: "License Configuration"
    sql: ${TABLE}.feature_cloud ;;
    hidden: no
  }

  dimension_group: issued {
    description: "The issued date of the license assoicated with the Mattermost server."
    type: time
    timeframes: [date, week, month, year, fiscal_quarter, fiscal_year]
    group_label: "License Configuration"
    sql: ${TABLE}.issued ;;
    hidden: no
  }

  dimension: users {
    description: "The number of User Seats provisioned to the license associated with the Mattermost server."
    type: number
    group_label: "License Configuration"
    sql: ${TABLE}.users ;;
    hidden: no
  }

  dimension: available_locales {
    description: ""
    type: string
    group_label: "Localization Configuration"
    sql: ${TABLE}.available_locales ;;
    hidden: no
  }

  dimension: default_client_locale {
    description: ""
    type: string
    group_label: "Localization Configuration"
    sql: ${TABLE}.default_client_locale ;;
    hidden: no
  }

  dimension: default_server_locale {
    description: ""
    type: string
    group_label: "Localization Configuration"
    sql: ${TABLE}.default_server_locale ;;
    hidden: no
  }

  dimension: console_json_log {
  label: "Console Json Log"
    description: ""
    type: yesno
    group_label: "Log Configuration"
    sql: ${TABLE}.console_json_log ;;
    hidden: no
  }

  dimension: console_level_log {
    description: ""
    type: string
    group_label: "Log Configuration"
    sql: ${TABLE}.console_level_log ;;
    hidden: no
  }

  dimension: enable_console_log {
  label: "Enable Console Log"
    description: ""
    type: yesno
    group_label: "Log Configuration"
    sql: ${TABLE}.enable_console_log ;;
    hidden: no
  }

  dimension: enable_file_log {
  label: "Enable File Log"
    description: ""
    type: yesno
    group_label: "Log Configuration"
    sql: ${TABLE}.enable_file_log ;;
    hidden: no
  }

  dimension: enable_webhook_debugging {
  label: "Enable Webhook Debugging"
    description: ""
    type: yesno
    group_label: "Log Configuration"
    sql: ${TABLE}.enable_webhook_debugging ;;
    hidden: no
  }

  dimension: file_json_log {
  label: "File Json Log"
    description: ""
    type: yesno
    group_label: "Log Configuration"
    sql: ${TABLE}.file_json_log ;;
    hidden: no
  }

  dimension: file_level_log {
    description: ""
    type: string
    group_label: "Log Configuration"
    sql: ${TABLE}.file_level_log ;;
    hidden: no
  }

  dimension: isdefault_file_format {
  label: "Isdefault File Format"
    description: ""
    type: yesno
    group_label: "Log Configuration"
    sql: ${TABLE}.isdefault_file_format ;;
    hidden: no
  }

  dimension: isdefault_file_location_log {
  label: "Isdefault File Location Log"
    description: ""
    type: yesno
    group_label: "Log Configuration"
    sql: ${TABLE}.isdefault_file_location_log ;;
    hidden: no
  }

  dimension: group_team_count {
    label: "Group Team Count"
    description: ""
    type: number
    group_label: "Groups Configuration"
    sql: ${TABLE}.group_team_count ;;
    hidden: no
  }

  dimension: group_member_count {
    label: "Group Member Count"
    description: ""
    type: number
    group_label: "Groups Configuration"
    sql: ${TABLE}.group_member_count ;;
    hidden: no
  }

  dimension: group_channel_count {
    label: "Group Channel Count"
    description: ""
    type: number
    group_label: "Groups Configuration"
    sql: ${TABLE}.group_channel_count ;;
    hidden: no
  }

  dimension: distinct_group_member_count {
    label: "Distinct Group Member Count"
    description: ""
    type: number
    group_label: "Groups Configuration"
    sql: ${TABLE}.distinct_group_member_count ;;
    hidden: no
  }


  dimension: group_synced_team_count {
    label: "Group Synced Team Count"
    description: ""
    type: number
    group_label: "Groups Configuration"
    sql: ${TABLE}.group_synced_team_count ;;
    hidden: no
  }


  dimension: group_count {
    label: "Group Count"
    description: ""
    type: number
    group_label: "Groups Configuration"
    sql: ${TABLE}.group_count ;;
    hidden: no
  }

  dimension: group_synced_channel_count {
    label: "Group Synced Channel Count"
    description: ""
    type: number
    group_label: "Groups Configuration"
    sql: ${TABLE}.group_synced_channel_count ;;
    hidden: no
  }

  dimension: group_count_with_allow_reference {
    label: "Group Count w/ Allow Reference"
    description: ""
    type: number
    group_label: "Groups Configuration"
    sql: ${TABLE}.group_count_with_allow_reference ;;
    hidden: no
  }

  dimension: ldap_group_count {
    label: "LDAP Group Count"
    description: ""
    type: number
    group_label: "Groups Configuration"
    sql: ${TABLE}.ldap_group_count ;;
    hidden: no
  }

  dimension: custom_group_count {
    label: "Custom Group Count"
    description: ""
    type: number
    group_label: "Groups Configuration"
    sql: ${TABLE}.custom_group_count ;;
    hidden: no
  }

  dimension: batch_size {
    description: ""
    type: number
    group_label: "Message Export Configuration"
    sql: ${TABLE}.batch_size ;;
    hidden: no
  }

  dimension: daily_run_time {
    description: ""
    type: string
    group_label: "Message Export Configuration"
    sql: ${TABLE}.daily_run_time ;;
    hidden: no
  }

  dimension: enable_message_export {
  label: "Enable Message Export"
    description: ""
    type: yesno
    group_label: "Message Export Configuration"
    sql: ${TABLE}.enable_message_export ;;
    hidden: no
  }

  dimension: export_retention_days{
    label: "Export Retention Days"
    description: ""
    type: yesno
    group_label: "Message Export Configuration"
    sql: ${TABLE}.export_retention_days ;;
    hidden: no
  }

  dimension: export_format {
    description: ""
    type: string
    group_label: "Message Export Configuration"
    sql: ${TABLE}.export_format ;;
    hidden: no
  }

  dimension: global_relay_customer_type {
    description: ""
    type: string
    group_label: "Message Export Configuration"
    sql: ${TABLE}.global_relay_customer_type ;;
    hidden: no
  }

  dimension: is_default_global_relay_email_address {
  label: "Is Default Global Relay Email Address"
    description: ""
    type: yesno
    group_label: "Message Export Configuration"
    sql: ${TABLE}.is_default_global_relay_email_address ;;
    hidden: no
  }

  dimension: is_default_global_relay_smtp_password {
  label: "Is Default Global Relay Smtp Password"
    description: ""
    type: yesno
    group_label: "Message Export Configuration"
    sql: ${TABLE}.is_default_global_relay_smtp_password ;;
    hidden: no
  }

  dimension: is_default_global_relay_smtp_username {
  label: "Is Default Global Relay Smtp Username"
    description: ""
    type: yesno
    group_label: "Message Export Configuration"
    sql: ${TABLE}.is_default_global_relay_smtp_username ;;
    hidden: no
  }

  dimension: block_profile_rate {
    description: ""
    type: number
    group_label: "Metric Configuration"
    sql: ${TABLE}.block_profile_rate ;;
    hidden: no
  }

  dimension: enable_metrics {
  label: "Enable Metrics"
    description: ""
    type: yesno
    group_label: "Metric Configuration"
    sql: ${TABLE}.enable_metrics ;;
    hidden: no
  }

  dimension: isdefault_android_app_download_link {
  label: "Isdefault Android App Download Link"
    description: ""
    type: yesno
    group_label: "Nativeapp Configuration"
    sql: ${TABLE}.isdefault_android_app_download_link ;;
    hidden: no
  }

  dimension: isdefault_app_download_link {
  label: "Isdefault App Download Link"
    description: ""
    type: yesno
    group_label: "Nativeapp Configuration"
    sql: ${TABLE}.isdefault_app_download_link ;;
    hidden: no
  }

  dimension: isdefault_iosapp_download_link {
  label: "Isdefault Iosapp Download Link"
    description: ""
    type: yesno
    group_label: "Nativeapp Configuration"
    sql: ${TABLE}.isdefault_iosapp_download_link ;;
    hidden: no
  }

  dimension: console_json_notifications {
  label: "Console Json Notifications"
    description: ""
    type: yesno
    group_label: "Notifications Log Configuration"
    sql: ${TABLE}.console_json_notifications ;;
    hidden: no
  }

  dimension: console_level_notifications {
    description: ""
    type: string
    group_label: "Notifications Log Configuration"
    sql: ${TABLE}.console_level_notifications ;;
    hidden: no
  }

  dimension: enable_console_notifications {
  label: "Enable Console Notifications"
    description: ""
    type: yesno
    group_label: "Notifications Log Configuration"
    sql: ${TABLE}.enable_console_notifications ;;
    hidden: no
  }

  dimension: enable_file_notifications {
  label: "Enable File Notifications"
    description: ""
    type: yesno
    group_label: "Notifications Log Configuration"
    sql: ${TABLE}.enable_file_notifications ;;
    hidden: no
  }

  dimension: file_json_notifications {
  label: "File Json Notifications"
    description: ""
    type: yesno
    group_label: "Notifications Log Configuration"
    sql: ${TABLE}.file_json_notifications ;;
    hidden: no
  }

  dimension: file_level_notifications {
    description: ""
    type: string
    group_label: "Notifications Log Configuration"
    sql: ${TABLE}.file_level_notifications ;;
    hidden: no
  }

  dimension: isdefault_file_location_notifications {
  label: "Isdefault File Location Notifications"
    description: ""
    type: yesno
    group_label: "Notifications Log Configuration"
    sql: ${TABLE}.isdefault_file_location_notifications ;;
    hidden: no
  }

  dimension: enable_office365_oauth {
  label: "Enable Office365 OAuth"
    description: ""
    type: yesno
    group_label: "OAuth Configuration"
    sql: ${TABLE}.enable_office365_oauth ;;
    hidden: no
  }

  dimension: openid_google {
    label: "OpenID: Google Enabled"
    description: ""
    type: yesno
    group_label: "OAuth Configuration"
    sql: ${TABLE}.openid_google ;;
    hidden: no
  }

  dimension: openid_gitlab {
    label: "OpenID: Gitlab Enabled"
    description: ""
    type: yesno
    group_label: "OAuth Configuration"
    sql: ${TABLE}.openid_gitlab ;;
    hidden: no
  }

  dimension: openid_office365 {
    label: "OpenID: Office365 Enabled"
    description: ""
    type: yesno
    group_label: "OAuth Configuration"
    sql: ${TABLE}.openid_office365 ;;
    hidden: no
  }

  dimension: enable_openid {
    label: "OpenID Enabled"
    description: ""
    type: yesno
    group_label: "OAuth Configuration"
    sql: ${TABLE}.enable_openid ;;
    hidden: no
  }

  dimension: enable_google_oauth {
  label: "Enable Google OAuth"
    description: ""
    type: yesno
    group_label: "OAuth Configuration"
    sql: ${TABLE}.enable_google_oauth ;;
    hidden: no
  }

  dimension: enable_gitlab_oauth {
  label: "Enable Gitlab OAuth"
    description: ""
    type: yesno
    group_label: "OAuth Configuration"
    sql: ${TABLE}.enable_gitlab_oauth ;;
    hidden: no
  }

  dimension: chimera_oauth_proxy_url {
    description: ""
    type: string
    group_label: "Plugin Configuration"
    sql: ${TABLE}.chimera_oauth_proxy_url ;;
    hidden: no
  }

  dimension: enable_lowercase {
  label: "Enable Lowercase"
    description: ""
    type: yesno
    group_label: "Password Configuration"
    sql: ${TABLE}.enable_lowercase ;;
    hidden: no
  }

  dimension: enable_uppercase {
  label: "Enable Uppercase"
    description: ""
    type: yesno
    group_label: "Password Configuration"
    sql: ${TABLE}.enable_uppercase ;;
    hidden: no
  }

  dimension: enable_symbol {
  label: "Enable Symbol"
    description: ""
    type: yesno
    group_label: "Password Configuration"
    sql: ${TABLE}.enable_symbol ;;
    hidden: no
  }

  dimension: enable_number {
  label: "Enable Number"
    description: ""
    type: yesno
    group_label: "Password Configuration"
    sql: ${TABLE}.enable_number ;;
    hidden: no
  }

  dimension: password_minimum_length {
    description: ""
    type: number
    group_label: "Password Configuration"
    sql: ${TABLE}.password_minimum_length ;;
    hidden: no
  }

  dimension: phase_1_migration_complete {
  label: "Phase 1 Migration Complete"
    description: ""
    type: yesno
    group_label: "Permissions General Configuration"
    sql: ${TABLE}.phase_1_migration_complete ;;
    hidden: no
  }

  dimension: phase_2_migration_complete {
  label: "Phase 2 Migration Complete"
    description: ""
    type: yesno
    group_label: "Permissions General Configuration"
    sql: ${TABLE}.phase_2_migration_complete ;;
    hidden: no
  }

  dimension: channel_admin_permissions {
    description: ""
    type: string
    group_label: "Permissions System Configuration"
    sql: ${TABLE}.channel_admin_permissions ;;
    hidden: no
  }

  dimension: channel_guest_permissions {
    description: ""
    type: string
    group_label: "Permissions System Configuration"
    sql: ${TABLE}.channel_guest_permissions ;;
    hidden: no
  }

  dimension: channel_user_permissions {
    description: ""
    type: string
    group_label: "Permissions System Configuration"
    sql: ${TABLE}.channel_user_permissions ;;
    hidden: no
  }

  dimension: system_admin_permissions {
    description: ""
    type: string
    group_label: "Permissions System Configuration"
    sql: ${TABLE}.system_admin_permissions ;;
    hidden: no
  }

  dimension: system_user_permissions {
    description: ""
    type: string
    group_label: "Permissions System Configuration"
    sql: ${TABLE}.system_user_permissions ;;
    hidden: no
  }

  dimension: team_admin_permissions {
    description: ""
    type: string
    group_label: "Permissions System Configuration"
    sql: ${TABLE}.team_admin_permissions ;;
    hidden: no
  }

  dimension: team_guest_permissions {
    description: ""
    type: string
    group_label: "Permissions System Configuration"
    sql: ${TABLE}.team_guest_permissions ;;
    hidden: no
  }

  dimension: team_user_permissions {
    description: ""
    type: string
    group_label: "Permissions System Configuration"
    sql: ${TABLE}.team_user_permissions ;;
    hidden: no
  }

  dimension: system_manager_count {
    description: ""
    type: number
    group_label: "Permissions System Configuration"
    sql: ${TABLE}.system_manager_count ;;
    hidden: no
  }

  dimension: system_manager_permissions {
    description: ""
    type: string
    group_label: "Permissions System Configuration"
    sql: ${TABLE}.system_manager_permissions ;;
    hidden: no
  }
  dimension: system_manager_permissions_modified {
    description: ""
    type: yesno
    group_label: "Permissions System Configuration"
    sql: ${TABLE}.system_manager_permissions_modified ;;
    hidden: no
  }

  dimension: system_read_only_admin_count {
    description: ""
    type: number
    group_label: "Permissions System Configuration"
    sql: ${TABLE}.system_read_only_admin_count ;;
    hidden: no
  }

  dimension: system_read_only_admin_permissions {
    description: ""
    type: string
    group_label: "Permissions System Configuration"
    sql: ${TABLE}.system_read_only_admin_permissions ;;
    hidden: no
  }

  dimension: system_read_only_admin_permissions_modified {
    description: ""
    type: yesno
    group_label: "Permissions System Configuration"
    sql: ${TABLE}.system_read_only_admin_permissions_modified ;;
    hidden: no
  }

  dimension: system_user_manager_count {
    description: ""
    type: number
    group_label: "Permissions System Configuration"
    sql: ${TABLE}.system_user_manager_count ;;
    hidden: no
  }

  dimension: system_user_manager_permissions {
    description: ""
    type: string
    group_label: "Permissions System Configuration"
    sql: ${TABLE}.system_user_manager_permissions ;;
    hidden: no
  }

  dimension: system_user_manager_permissions_modified {
    description: ""
    type: yesno
    group_label: "Permissions System Configuration"
    sql: ${TABLE}.system_user_manager_permissions_modified ;;
    hidden: no
  }

  dimension: allow_insecure_download_url {
  label: "Allow Insecure Download URL"
    description: ""
    type: yesno
    group_label: "Plugin Configuration"
    sql: ${TABLE}.allow_insecure_download_url ;;
    hidden: no
  }

  dimension: automatic_prepackaged_plugins {
  label: "Automatic Prepackaged Plugins"
    description: ""
    type: yesno
    group_label: "Plugin Configuration"
    sql: ${TABLE}.automatic_prepackaged_plugins ;;
    hidden: no
  }

  dimension: enable_plugins {
    label: " Plugins Enabled"
    description: ""
    type: yesno
    group_label: "Plugin Configuration"
    sql: ${TABLE}.enable_plugins ;;
    hidden: no
  }

  dimension: enable_antivirus {
    label: "Antivirus Enabled"
    description: ""
    type: yesno
    group_label: "Plugin Configuration"
    sql: ${TABLE}.enable_antivirus ;;
    hidden: no
  }

  dimension: enable_autolink {
    label: "Autolink Enabled"
    description: ""
    type: yesno
    group_label: "Plugin Configuration"
    sql: ${TABLE}.enable_autolink ;;
    hidden: no
  }

  dimension: enable_aws_sns {
    label: "AWS SNS Enabled"
    description: ""
    type: yesno
    group_label: "Plugin Configuration"
    sql: ${TABLE}.enable_aws_sns ;;
    hidden: no
  }

  dimension: enable_confluence {
    label: "Confluence Enabled"
    description: ""
    type: yesno
    group_label: "Plugin Configuration"
    sql: ${TABLE}.enable_confluence ;;
    hidden: no
  }

  dimension: enable_custom_user_attributes {
    label: "Custom User Attributes Enabled"
    description: ""
    type: yesno
    group_label: "Plugin Configuration"
    sql: ${TABLE}.enable_custom_user_attributes ;;
    hidden: no
  }

  dimension: enable_github {
    label: "Github Enabled"
    description: ""
    type: yesno
    group_label: "Plugin Configuration"
    sql: ${TABLE}.enable_github ;;
    hidden: no
  }

  dimension: enable_mattermost_apps {
    label: "Mattermost Apps Enabled"
    description: ""
    type: yesno
    group_label: "Plugin Configuration"
    sql: ${TABLE}.enable_mattermost_apps ;;
    hidden: no
  }

  dimension: enable_focalboard {
    label: "Focalboard Enabled"
    description: ""
    type: yesno
    group_label: "Plugin Configuration"
    sql: ${TABLE}.enable_focalboard ;;
    hidden: no
  }

  dimension: enable_circleci {
    label: "CircleCI Enabled"
    description: ""
    type: yesno
    group_label: "Plugin Configuration"
    sql: ${TABLE}.enable_circleci ;;
    hidden: no
  }

  dimension: enable_diceroller {
    label: "Dice Roller Enabled"
    description: ""
    type: yesno
    group_label: "Plugin Configuration"
    sql: ${TABLE}.enable_diceroller ;;
    hidden: no
  }

  dimension: version_mattermost_apps {
    label: "Mattermost Apps Version"
    description: ""
    type: string
    group_label: "Plugin Configuration"
    sql: ${TABLE}.version_mattermost_apps ;;
    hidden: no
  }

  dimension: version_focalboard {
    label: "Focalboard Version"
    description: ""
    type: string
    group_label: "Plugin Configuration"
    sql: ${TABLE}.version_focalboard ;;
    hidden: no
  }

  dimension: version_circleci {
    label: "CircleCI Version"
    description: ""
    type: string
    group_label: "Plugin Configuration"
    sql: ${TABLE}.version_circleci ;;
    hidden: no
  }

  dimension: version_diceroller {
    label: "Dice Roller Version"
    description: ""
    type: string
    group_label: "Plugin Configuration"
    sql: ${TABLE}.version_diceroller ;;
    hidden: no
  }

  dimension: enable_gitlab {
    label: "Gitlab Enabled"
    description: ""
    type: yesno
    group_label: "Plugin Configuration"
    sql: ${TABLE}.enable_gitlab ;;
    hidden: no
  }

  dimension: enable_health_check {
    label: "Health Check Enabled"
    description: ""
    type: yesno
    group_label: "Plugin Configuration"
    sql: ${TABLE}.enable_health_check ;;
    hidden: no
  }

  dimension: enable_jenkins {
    label: "Jenkins Enabled"
    description: ""
    type: yesno
    group_label: "Plugin Configuration"
    sql: ${TABLE}.enable_jenkins ;;
    hidden: no
  }

  dimension: enable_jira {
    label: "Jira Enabled"
    description: ""
    type: yesno
    group_label: "Plugin Configuration"
    sql: ${TABLE}.enable_jira ;;
    hidden: no
  }

  dimension: enable_jitsi {
    label: "Jitsi Enabled"
    description: ""
    type: yesno
    group_label: "Plugin Configuration"
    sql: ${TABLE}.enable_jitsi ;;
    hidden: no
  }

  dimension: enable_marketplace {
    label: "Marketplace Enabled"
    description: ""
    type: yesno
    group_label: "Plugin Configuration"
    sql: ${TABLE}.enable_marketplace ;;
    hidden: no
  }

  dimension: enable_mscalendar {
    label: "MS Calendar Enabled"
    description: ""
    type: yesno
    group_label: "Plugin Configuration"
    sql: ${TABLE}.enable_mscalendar ;;
    hidden: no
  }

  dimension: enable_nps {
    label: "NPS Enabled"
    description: ""
    type: yesno
    group_label: "Plugin Configuration"
    sql: COALESCE(${TABLE}.enable_nps, ${enable_nps_survey}) ;;
    hidden: no
  }

  dimension: enable_nps_survey {
    label: "NPS Survey Enabled"
    description: ""
    type: yesno
    group_label: "Plugin Configuration"
    sql: ${TABLE}.enable_nps_survey ;;
    hidden: yes
  }

  dimension: enable_remote_marketplace {
    label: "Remote Marketplace Enabled"
    description: ""
    type: yesno
    group_label: "Plugin Configuration"
    sql: ${TABLE}.enable_remote_marketplace ;;
    hidden: no
  }

  dimension: enable_skype4business {
    label: "Skype4Business Enabled"
    description: ""
    type: yesno
    group_label: "Plugin Configuration"
    sql: ${TABLE}.enable_skype4business ;;
    hidden: no
  }

  dimension: enable_mattermostprofanityfilter {
    label: "Profanity Filter Enabled"
    description: ""
    type: yesno
    group_label: "Plugin Configuration"
    sql: ${TABLE}.enable_mattermostprofanityfilter ;;
    hidden: no
  }

  dimension: version_mattermostprofanityfilter {
    label: "Profanity Filter Version"
    description: ""
    type: string
    group_label: "Plugin Configuration"
    sql: ${TABLE}.version_mattermostprofanityfilter ;;
    hidden: no
  }

  dimension: enable_comgithubmatterpollmatterpoll {
    label: "Matterpoll Enabled"
    description: ""
    type: yesno
    group_label: "Plugin Configuration"
    sql: ${TABLE}.enable_comgithubmatterpollmatterpoll ;;
    hidden: no
  }

  dimension: enable_commattermostpluginincidentmanagement {
    label: "Incident Management Enabled"
    description: ""
    type: yesno
    group_label: "Plugin Configuration"
    sql: COALESCE(${TABLE}.enable_commattermostpluginincidentmanagement, ${enable_incident_response}) ;;
    hidden: no
  }

  dimension: version_commattermostpluginincidentmanagement {
    label: "Incident Management Version"
    description: ""
    type: string
    group_label: "Plugin Configuration"
    sql: ${TABLE}.version_commattermostpluginincidentmanagement ;;
    hidden: no
  }

  dimension: version_comgithubmatterpollmatterpoll {
    label: "Matterpoll Version"
    description: ""
    type: string
    group_label: "Plugin Configuration"
    sql: ${TABLE}.version_comgithubmatterpollmatterpoll ;;
    hidden: no
  }

  dimension: enable_todo {
    label: "ToDo Enabled"
    description: ""
    type: yesno
    group_label: "Plugin Configuration"
    sql: ${TABLE}.enable_todo ;;
    hidden: no
  }

  dimension: enable_uploads {
    label: "Uploads Enabled"
    description: ""
    type: yesno
    group_label: "Plugin Configuration"
    sql: ${TABLE}.enable_uploads ;;
    hidden: no
  }

  dimension: enable_webex {
    label: "WebEx Enabled"
    description: ""
    type: yesno
    group_label: "Plugin Configuration"
    sql: ${TABLE}.enable_webex ;;
    hidden: no
  }

  dimension: enable_welcome_bot {
    label: "Welcome Bot Enabled"
    description: ""
    type: yesno
    group_label: "Plugin Configuration"
    sql: ${TABLE}.enable_welcome_bot ;;
    hidden: no
  }
  dimension: enable_zoom {
    label: "Zoom Enabled"
    description: ""
    type: yesno
    group_label: "Plugin Configuration"
    sql: ${TABLE}.enable_zoom ;;
    hidden: no
  }
  dimension: enable_giphy {
    label: "Giphy Enabled"
    description: ""
    type: yesno
    group_label: "Plugin Configuration"
    sql: ${TABLE}.enable_giphy ;;
    hidden: no
  }
  dimension: enable_digital_ocean {
    label: "Digital Ocean Enabled"
    description: ""
    type: yesno
    group_label: "Plugin Configuration"
    sql: ${TABLE}.enable_digital_ocean ;;
    hidden: no
  }
  dimension: enable_incident_response {
    label: "Incident Management Enabled"
    description: ""
    type: yesno
    group_label: "Plugin Configuration"
    sql: ${TABLE}.enable_incident_response ;;
    hidden: yes
  }
  dimension: enable_memes {
    label: "Memes Enabled"
    description: ""
    type: yesno
    group_label: "Plugin Configuration"
    sql: ${TABLE}.enable_memes ;;
    hidden: no
  }
  dimension: enable_agenda {
    label: "Agenda Enabled"
    description: ""
    type: yesno
    group_label: "Plugin Configuration"
    sql: ${TABLE}.enable_commattermostagenda ;;
    hidden: no
  }

  dimension: version_agenda {
    label: "Agenda Version"
    description: ""
    type: string
    group_label: "Plugin Configuration"
    sql: ${TABLE}.version_commattermostagenda ;;
    hidden: no
  }

  dimension: enable_commattermostmsteamsmeetings {
    label: "MS Teams Meetings Enabled"
    description: ""
    type: yesno
    group_label: "Plugin Configuration"
    sql: ${TABLE}.enable_commattermostmsteamsmeetings ;;
    hidden: no
  }
  dimension: version_commattermostmsteamsmeetings {
    label: "MS Teams Meetings Version"
    description: ""
    type: string
    group_label: "Plugin Configuration"
    sql: ${TABLE}.version_commattermostmsteamsmeetings ;;
    hidden: no
  }

  dimension: enable_commattermostpluginchannelexport {
    label: "Channel Export Enabled"
    description: ""
    type: yesno
    group_label: "Plugin Configuration"
    sql: ${TABLE}.enable_commattermostpluginchannelexport ;;
    hidden: no
  }
  dimension: version_commattermostpluginchannelexport {
    label: "Channel Export Version"
    description: ""
    type: string
    group_label: "Plugin Configuration"
    sql: ${TABLE}.version_commattermostpluginchannelexport ;;
    hidden: no
  }

  dimension: enable_comnilsbrinkmannicebreaker {
    label: "Icebreaker Enabled"
    description: ""
    type: yesno
    group_label: "Plugin Configuration"
    sql: ${TABLE}.enable_comnilsbrinkmannicebreaker ;;
    hidden: no
  }
  dimension: version_comnilsbrinkmannicebreaker {
    label: "Icebreaker Version"
    description: ""
    type: string
    group_label: "Plugin Configuration"
    sql: ${TABLE}.version_comnilsbrinkmannicebreaker ;;
    hidden: no
  }

  dimension: is_default_marketplace_url {
  label: "Is Default Marketplace URL"
    description: ""
    type: yesno
    group_label: "Plugin Configuration"
    sql: ${TABLE}.is_default_marketplace_url ;;
    hidden: no
  }

  dimension: require_plugin_signature {
  label: "Require Plugin Signature"
    description: ""
    type: yesno
    group_label: "Plugin Configuration"
    sql: ${TABLE}.require_plugin_signature ;;
    hidden: no
  }

  dimension: signature_public_key_files {
    description: ""
    type: number
    group_label: "Plugin Configuration"
    sql: ${TABLE}.signature_public_key_files ;;
    hidden: no
  }

  dimension: version_antivirus {
    label: "Antivirus Version"
    description: ""
    type: string
    group_label: "Plugin Configuration"
    sql: ${TABLE}.version_antivirus ;;
    hidden: no
  }

  dimension: version_autolink {
    label: "Autolink Version"
    description: ""
    type: string
    group_label: "Plugin Configuration"
    sql: ${TABLE}.version_autolink ;;
    hidden: no
  }

  dimension: version_aws_sns {
    label: "AWS SNS Version"
    description: ""
    type: string
    group_label: "Plugin Configuration"
    sql: ${TABLE}.version_aws_sns ;;
    hidden: no
  }

  dimension: version_custom_user_attributes {
    label: "Custom User Attributes Version"
    description: ""
    type: string
    group_label: "Plugin Configuration"
    sql: ${TABLE}.version_custom_user_attributes ;;
    hidden: no
  }

  dimension: version_github {
    label: "Github Version"
    description: ""
    type: string
    group_label: "Plugin Configuration"
    sql: ${TABLE}.version_github ;;
    hidden: no
  }

  dimension: version_gitlab {
    label: "Jenkins Version"
    description: ""
    type: string
    group_label: "Plugin Configuration"
    sql: ${TABLE}.version_gitlab ;;
    hidden: no
  }

  dimension: version_jenkins {
    description: ""
    type: string
    group_label: "Plugin Configuration"
    sql: ${TABLE}.version_jenkins ;;
    hidden: no
  }

  dimension: version_jira {
    label: "Jira Version"
    description: ""
    type: string
    group_label: "Plugin Configuration"
    sql: ${TABLE}.version_jira ;;
    hidden: no
  }

  dimension: version_nps {
    label: "NPS Version"
    description: ""
    type: string
    group_label: "Plugin Configuration"
    sql: ${TABLE}.version_nps ;;
    hidden: no
  }

  dimension: version_webex {
    label: "WebEx Version"
    description: ""
    type: string
    group_label: "Plugin Configuration"
    sql: ${TABLE}.version_webex ;;
    hidden: no
  }

  dimension: version_welcome_bot {
    label: "Welcome Bot Version"
    description: ""
    type: string
    group_label: "Plugin Configuration"
    sql: ${TABLE}.version_welcome_bot ;;
    hidden: no
  }

  dimension: version_zoom {
    label: "Zoom Version"
    description: ""
    type: string
    group_label: "Plugin Configuration"
    sql: ${TABLE}.version_zoom ;;
    hidden: no
  }

  dimension: version_giphy {
    label: "Giphy Version"
    description: ""
    type: string
    group_label: "Plugin Configuration"
    sql: ${TABLE}.version_giphy ;;
    hidden: no
  }

  dimension: version_digital_ocean {
    description: ""
    type: string
    group_label: "Plugin Configuration"
    sql: ${TABLE}.version_digital_ocean ;;
    hidden: no
  }

  dimension: version_confluence {
    label: "Confluence Version"
    description: ""
    type: string
    group_label: "Plugin Configuration"
    sql: ${TABLE}.version_confluence ;;
    hidden: no
  }

  dimension: version_mscalendar {
    label: "MS Calendar Version"
    description: ""
    type: string
    group_label: "Plugin Configuration"
    sql: ${TABLE}.version_mscalendar ;;
    hidden: no
  }

  dimension: version_incident_response {
    label: "Incident Management Version"
    description: ""
    type: string
    group_label: "Plugin Configuration"
    sql: ${TABLE}.version_incident_response ;;
    hidden: yes
  }

  dimension: version_todo {
    label: "ToDo Version"
    description: ""
    type: string
    group_label: "Plugin Configuration"
    sql: ${TABLE}.version_todo ;;
    hidden: no
  }

  dimension: version_memes {
    label: "Memes Version"
    description: ""
    type: string
    group_label: "Plugin Configuration"
    sql: ${TABLE}.version_memes ;;
    hidden: no
  }

  dimension: version_jitsi {
    label: "Jitsi Version"
    description: ""
    type: string
    group_label: "Plugin Configuration"
    sql: ${TABLE}.version_jitsi ;;
    hidden: no
  }

  dimension: version_skype4business {
    label: "Skype4Business Version"
    description: ""
    type: string
    group_label: "Plugin Configuration"
    sql: ${TABLE}.version_skype4business ;;
    hidden: no
  }

  dimension: enable_comgithubjespinorecommend {
    label: "Channel Recommender Enabled"
    description: ""
    type: yesno
    group_label: "Plugin Configuration"
    sql: ${TABLE}.enable_comgithubjespinorecommend ;;
    hidden: no
  }

  dimension: version_comgithubjespinorecommend {
    label: "Channel Recommender Version"
    description: ""
    type: string
    group_label: "Plugin Configuration"
    sql: ${TABLE}.version_comgithubjespinorecommend ;;
    hidden: no
  }

  dimension: active_backend_plugins {
    description: ""
    type: number
    group_label: "Plugin (System-Level) Configuration"
    sql: ${TABLE}.active_backend_plugins ;;
    hidden: no
  }

  dimension: active_plugins {
    description: ""
    type: number
    group_label: "Plugin (System-Level) Configuration"
    sql: ${TABLE}.active_plugins ;;
    hidden: no
  }

  dimension: active_webapp_plugins {
    description: ""
    type: number
    group_label: "Plugin (System-Level) Configuration"
    sql: ${TABLE}.active_webapp_plugins ;;
    hidden: no
  }

  dimension: disabled_backend_plugins {
    description: ""
    type: number
    group_label: "Plugin (System-Level) Configuration"
    sql: ${TABLE}.disabled_backend_plugins ;;
    hidden: no
  }

  dimension: disabled_plugins {
    description: ""
    type: number
    group_label: "Plugin (System-Level) Configuration"
    sql: ${TABLE}.disabled_plugins ;;
    hidden: no
  }

  dimension: disabled_webapp_plugins {
    description: ""
    type: number
    group_label: "Plugin (System-Level) Configuration"
    sql: ${TABLE}.disabled_webapp_plugins ;;
    hidden: no
  }

  dimension: enabled_backend_plugins {
    description: ""
    type: number
    group_label: "Plugin (System-Level) Configuration"
    sql: ${TABLE}.enabled_backend_plugins ;;
    hidden: no
  }

  dimension: enabled_plugins {
    description: ""
    type: number
    group_label: "Plugin (System-Level) Configuration"
    sql: ${TABLE}.enabled_plugins ;;
    hidden: no
  }

  dimension: enabled_webapp_plugins {
    description: ""
    type: number
    group_label: "Plugin (System-Level) Configuration"
    sql: ${TABLE}.enabled_webapp_plugins ;;
    hidden: no
  }

  dimension: inactive_backend_plugins {
    description: ""
    type: number
    group_label: "Plugin (System-Level) Configuration"
    sql: ${TABLE}.inactive_backend_plugins ;;
    hidden: no
  }

  dimension: inactive_plugins {
    description: ""
    type: number
    group_label: "Plugin (System-Level) Configuration"
    sql: ${TABLE}.inactive_plugins ;;
    hidden: no
  }

  dimension: inactive_webapp_plugins {
    description: ""
    type: number
    group_label: "Plugin (System-Level) Configuration"
    sql: ${TABLE}.inactive_webapp_plugins ;;
    hidden: no
  }

  dimension: plugins_with_broken_manifests {
    description: ""
    type: number
    group_label: "Plugin (System-Level) Configuration"
    sql: ${TABLE}.plugins_with_broken_manifests ;;
    hidden: no
  }

  dimension: plugins_with_settings {
    description: ""
    type: number
    group_label: "Plugin (System-Level) Configuration"
    sql: ${TABLE}.plugins_with_settings ;;
    hidden: no
  }

  dimension: file_compress_audit {
    description: ""
    label: "File Compress"
    type: yesno
    group_label: "Audit Configuration"
    sql: ${TABLE}.file_compress_audit ;;
    hidden: no
  }

  dimension: advanced_logging_config {
    description: ""
    label: "Enable Advanced Logging Config"
    type: yesno
    group_label: "Audit Configuration"
    sql: ${TABLE}.advanced_logging_config_notifications ;;
    hidden: no
  }

  dimension: file_enabled_audit {
    description: ""
    label: "File Enabled"
    type: yesno
    group_label: "Audit Configuration"
    sql: ${TABLE}.file_enabled_audit ;;
    hidden: no
  }

  dimension: syslog_enabled_audit {
    description: ""
    label: "Syslog Enabled"
    type: yesno
    group_label: "Audit Configuration"
    sql: ${TABLE}.syslog_enabled_audit ;;
    hidden: no
  }

  dimension: syslog_insecure_audit {
    description: ""
    label: "Syslog Insecure"
    type: yesno
    group_label: "Audit Configuration"
    sql: ${TABLE}.syslog_insecure_audit ;;
    hidden: no
  }

  dimension: syslog_max_queue_size_audit {
    description: ""
    label: "Max. Queue Size"
    type: number
    group_label: "Audit Configuration"
    sql: ${TABLE}.syslog_max_queue_size_audit ;;
    hidden: no
  }

  dimension: file_max_age_days_audit {
    description: ""
    label: "Max. File Age (Days)"
    type: number
    group_label: "Audit Configuration"
    sql: ${TABLE}.file_max_age_days_audit ;;
    hidden: no
  }

  dimension: file_max_backups_audit {
    description: ""
    label: "Max. File Backups"
    type: number
    group_label: "Audit Configuration"
    sql: ${TABLE}.file_max_backups_audit ;;
    hidden: no
  }

  dimension: file_max_queue_size_audit {
    description: ""
    label: "Max. Queue Size"
    type: number
    group_label: "Audit Configuration"
    sql: ${TABLE}.file_max_queue_size_audit ;;
    hidden: no
  }

  dimension: file_max_size_mb_audit {
    description: ""
    label: "Max. File Size (MB)"
    type: number
    group_label: "Audit Configuration"
    sql: ${TABLE}.file_max_size_mb_audit ;;
    hidden: no
  }

  dimension: bulk_indexing_time_window_bleve {
    description: ""
    label: "Bulk Indexing Time Window"
    type: number
    group_label: "Bleve Configuration"
    sql: ${TABLE}.bulk_indexing_time_window_bleve ;;
    hidden: no
  }

  dimension: enable_autocomplete_bleve {
    description: ""
    label: "Enable Autocomplete"
    type: yesno
    group_label: "Bleve Configuration"
    sql: ${TABLE}.enable_autocomplete_bleve ;;
    hidden: no
  }

  dimension: enable_indexing_bleve {
    description: ""
    label: "Enable Indexing"
    type: yesno
    group_label: "Bleve Configuration"
    sql: ${TABLE}.enable_indexing_bleve ;;
    hidden: no
  }

  dimension: enable_searching_bleve {
    description: ""
    label: "Enable Searching"
    type: yesno
    group_label: "Bleve Configuration"
    sql: ${TABLE}.enable_searching_bleve ;;
    hidden: no
  }

  dimension: show_email_address {
  label: "Show Email Address"
    description: ""
    type: yesno
    group_label: "Privacy Configuration"
    sql: ${TABLE}.show_email_address ;;
    hidden: no
  }

  dimension: show_full_name {
  label: "Show Full Name"
    description: ""
    type: yesno
    group_label: "Privacy Configuration"
    sql: ${TABLE}.show_full_name ;;
    hidden: no
  }

  dimension: enable_rate_limiter {
  label: "Enable Rate Limiter"
    description: ""
    type: yesno
    group_label: "Rate Configuration"
    sql: ${TABLE}.enable_rate_limiter ;;
    hidden: no
  }

  dimension: isdefault_vary_by_header {
  label: "Isdefault Vary By Header"
    description: ""
    type: yesno
    group_label: "Rate Configuration"
    sql: ${TABLE}.isdefault_vary_by_header ;;
    hidden: no
  }

  dimension: max_burst {
    description: ""
    type: number
    group_label: "Rate Configuration"
    sql: ${TABLE}.max_burst ;;
    hidden: no
  }

  dimension: memory_store_size {
    description: ""
    type: number
    group_label: "Rate Configuration"
    sql: ${TABLE}.memory_store_size ;;
    hidden: no
  }

  dimension: per_sec {
    description: ""
    type: number
    group_label: "Rate Configuration"
    sql: ${TABLE}.per_sec ;;
    hidden: no
  }

  dimension: vary_by_remote_address {
  label: "Vary By Remote Address"
    description: ""
    type: yesno
    group_label: "Rate Configuration"
    sql: ${TABLE}.vary_by_remote_address ;;
    hidden: no
  }

  dimension: vary_by_user {
  label: "Vary By User"
    description: ""
    type: yesno
    group_label: "Rate Configuration"
    sql: ${TABLE}.vary_by_user ;;
    hidden: no
  }

  dimension: enable_saml {
  label: "Enable SAML"
    description: ""
    type: yesno
    group_label: "SAML Configuration"
    sql: ${TABLE}.enable_saml ;;
    hidden: no
  }

  dimension: ignore_guest_ldap_sync {
    label: "Ignore Guest LDAP Sync Enabled"
    description: ""
    type: yesno
    group_label: "SAML Configuration"
    sql: ${TABLE}.ignore_guest_ldap_sync ;;
    hidden: no
  }

  dimension: enable_admin_attribute {
  label: "Enable Admin Attribute"
    description: ""
    type: yesno
    group_label: "SAML Configuration"
    sql: ${TABLE}.enable_admin_attribute ;;
    hidden: no
  }

  dimension: enable_sync_with_ldap {
  label: "Enable Sync With LDAP"
    description: ""
    type: yesno
    group_label: "SAML Configuration"
    sql: ${TABLE}.enable_sync_with_ldap ;;
    hidden: no
  }

  dimension: enable_sync_with_ldap_include_auth {
  label: "Enable Sync With LDAP Include Auth"
    description: ""
    type: yesno
    group_label: "SAML Configuration"
    sql: ${TABLE}.enable_sync_with_ldap_include_auth ;;
    hidden: no
  }

  dimension: encrypt_saml {
  label: "Encrypt SAML"
    description: ""
    type: yesno
    group_label: "SAML Configuration"
    sql: ${TABLE}.encrypt_saml ;;
    hidden: no
  }

  dimension: isdefault_admin_attribute {
  label: "Isdefault Admin Attribute"
    description: ""
    type: yesno
    group_label: "SAML Configuration"
    sql: ${TABLE}.isdefault_admin_attribute ;;
    hidden: no
  }

  dimension: isdefault_canonical_algorithm {
  label: "Isdefault Canonical Algorithm"
    description: ""
    type: yesno
    group_label: "SAML Configuration"
    sql: ${TABLE}.isdefault_canonical_algorithm ;;
    hidden: no
  }

  dimension: isdefault_email_attribute_saml {
  label: "Isdefault Email Attribute SAML"
    description: ""
    type: yesno
    group_label: "SAML Configuration"
    sql: ${TABLE}.isdefault_email_attribute_saml ;;
    hidden: no
  }

  dimension: isdefault_first_name_attribute_saml {
  label: "Isdefault First Name Attribute SAML"
    description: ""
    type: yesno
    group_label: "SAML Configuration"
    sql: ${TABLE}.isdefault_first_name_attribute_saml ;;
    hidden: no
  }

  dimension: isdefault_guest_attribute {
  label: "Isdefault Guest Attribute"
    description: ""
    type: yesno
    group_label: "SAML Configuration"
    sql: ${TABLE}.isdefault_guest_attribute ;;
    hidden: no
  }

  dimension: isdefault_id_attribute_saml {
  label: "Isdefault Id Attribute SAML"
    description: ""
    type: yesno
    group_label: "SAML Configuration"
    sql: ${TABLE}.isdefault_id_attribute_saml ;;
    hidden: no
  }

  dimension: isdefault_last_name_attribute_saml {
  label: "Isdefault Last Name Attribute SAML"
    description: ""
    type: yesno
    group_label: "SAML Configuration"
    sql: ${TABLE}.isdefault_last_name_attribute_saml ;;
    hidden: no
  }

  dimension: isdefault_locale_attribute {
  label: "Isdefault Locale Attribute"
    description: ""
    type: yesno
    group_label: "SAML Configuration"
    sql: ${TABLE}.isdefault_locale_attribute ;;
    hidden: no
  }

  dimension: isdefault_login_button_border_color_saml {
  label: "Isdefault Login Button Border Color SAML"
    description: ""
    type: yesno
    group_label: "SAML Configuration"
    sql: ${TABLE}.isdefault_login_button_border_color_saml ;;
    hidden: no
  }

  dimension: isdefault_login_button_color_saml {
  label: "Isdefault Login Button Color SAML"
    description: ""
    type: yesno
    group_label: "SAML Configuration"
    sql: ${TABLE}.isdefault_login_button_color_saml ;;
    hidden: no
  }

  dimension: isdefault_login_button_text {
  label: "Isdefault Login Button Text"
    description: ""
    type: yesno
    group_label: "SAML Configuration"
    sql: ${TABLE}.isdefault_login_button_text ;;
    hidden: no
  }

  dimension: isdefault_login_button_text_color_saml {
  label: "Isdefault Login Button Text Color SAML"
    description: ""
    type: yesno
    group_label: "SAML Configuration"
    sql: ${TABLE}.isdefault_login_button_text_color_saml ;;
    hidden: no
  }

  dimension: isdefault_nickname_attribute_saml {
  label: "Isdefault Nickname Attribute SAML"
    description: ""
    type: yesno
    group_label: "SAML Configuration"
    sql: ${TABLE}.isdefault_nickname_attribute_saml ;;
    hidden: no
  }

  dimension: isdefault_position_attribute_saml {
  label: "Isdefault Position Attribute SAML"
    description: ""
    type: yesno
    group_label: "SAML Configuration"
    sql: ${TABLE}.isdefault_position_attribute_saml ;;
    hidden: no
  }

  dimension: isdefault_scoping_idp_name {
  label: "Isdefault Scoping Idp Name"
    description: ""
    type: yesno
    group_label: "SAML Configuration"
    sql: ${TABLE}.isdefault_scoping_idp_name ;;
    hidden: no
  }

  dimension: isdefault_scoping_idp_provider_id {
  label: "Isdefault Scoping Idp Provider Id"
    description: ""
    type: yesno
    group_label: "SAML Configuration"
    sql: ${TABLE}.isdefault_scoping_idp_provider_id ;;
    hidden: no
  }

  dimension: isdefault_signature_algorithm {
  label: "Isdefault Signature Algorithm"
    description: ""
    type: yesno
    group_label: "SAML Configuration"
    sql: ${TABLE}.isdefault_signature_algorithm ;;
    hidden: no
  }

  dimension: isdefault_username_attribute_saml {
  label: "Isdefault Username Attribute SAML"
    description: ""
    type: yesno
    group_label: "SAML Configuration"
    sql: ${TABLE}.isdefault_username_attribute_saml ;;
    hidden: no
  }

  dimension: sign_request {
  label: "Sign Request"
    description: ""
    type: yesno
    group_label: "SAML Configuration"
    sql: ${TABLE}.sign_request ;;
    hidden: no
  }

  dimension: verify_saml {
  label: "Verify SAML"
    description: ""
    type: yesno
    group_label: "SAML Configuration"
    sql: ${TABLE}.verify_saml ;;
    hidden: no
  }

  dimension: enable_link_previews {
    label: "Link Preview Enabled"
    description: ""
    type: yesno
    group_label: "Service Configuration"
    sql: ${TABLE}.enable_link_previews ;;
    hidden: no
  }

  dimension: collapsed_threads {
    label: "Collapsed Threads Status"
    description: ""
    type: string
    group_label: "Service Configuration"
    sql: ${TABLE}.collapsed_threads ;;
    hidden: no
  }

  dimension: managed_resource_paths {
    label: "Managed Resource Paths Enabled"
    description: ""
    type: yesno
    group_label: "Service Configuration"
    sql: ${TABLE}.managed_resource_paths ;;
    hidden: no
  }

  dimension: enable_legacy_sidebar {
    label: "Legacy Sidebar Enabled"
    description: ""
    type: yesno
    group_label: "Service Configuration"
    sql: ${TABLE}.enable_legacy_sidebar ;;
    hidden: no
  }

  dimension: restrict_link_previews {
    label: "Link Preview Restricted"
    description: ""
    type: yesno
    group_label: "Service Configuration"
    sql: ${TABLE}.restrict_link_previews ;;
    hidden: no
  }

  dimension: enable_file_search {
    label: "File Search Enabled"
    description: ""
    type: yesno
    group_label: "Service Configuration"
    sql: ${TABLE}.enable_file_search ;;
    hidden: no
  }

  dimension: thread_autofollow {
    label: "Thread Autofollow Enabled"
    description: ""
    type: yesno
    group_label: "Service Configuration"
    sql: ${TABLE}.thread_autofollow ;;
    hidden: no
  }

  dimension: allow_cookies_for_subdomains {
  label: "Allow Cookies For Subdomains"
    description: ""
    type: yesno
    group_label: "Service Configuration"
    sql: ${TABLE}.allow_cookies_for_subdomains ;;
    hidden: no
  }

  dimension: enable_api_channel_deletion {
    description: ""
    type: yesno
    group_label: "Service Configuration"
    sql: ${TABLE}.enable_api_channel_deletion ;;
    hidden: no
  }

  dimension: enable_api_user_deletion {
    description: ""
    type: yesno
    group_label: "Service Configuration"
    sql: ${TABLE}.enable_api_user_deletion ;;
    hidden: no
  }

  dimension: allow_edit_post_service {
    description: ""
    type: string
    group_label: "Service Configuration"
    sql: ${TABLE}.allow_edit_post_service ;;
    hidden: no
  }

  dimension: close_unused_direct_messages {
  label: "Close Unused Direct Messages"
    description: ""
    type: yesno
    group_label: "Service Configuration"
    sql: ${TABLE}.close_unused_direct_messages ;;
    hidden: no
  }

  dimension: connection_security_service {
    description: ""
    type: string
    group_label: "Service Configuration"
    sql: ${TABLE}.connection_security_service ;;
    hidden: no
  }

  dimension: cors_allow_credentials {
  label: "Cors Allow Credentials"
    description: ""
    type: yesno
    group_label: "Service Configuration"
    sql: ${TABLE}.cors_allow_credentials ;;
    hidden: no
  }

  dimension: cors_debug {
  label: "Cors Debug"
    description: ""
    type: yesno
    group_label: "Service Configuration"
    sql: ${TABLE}.cors_debug ;;
    hidden: no
  }

  dimension: custom_service_terms_enabled_service {
  label: "Custom Service Terms Enabled Service"
    description: ""
    type: yesno
    group_label: "Service Configuration"
    sql: ${TABLE}.custom_service_terms_enabled_service ;;
    hidden: no
  }

  dimension: disable_bots_when_owner_is_deactivated {
  label: "Disable Bots When Owner Is Deactivated"
    description: ""
    type: yesno
    group_label: "Service Configuration"
    sql: ${TABLE}.disable_bots_when_owner_is_deactivated ;;
    hidden: no
  }

  dimension: disable_legacy_mfa {
  label: "Disable Legacy MFA"
    description: ""
    type: yesno
    group_label: "Service Configuration"
    sql: ${TABLE}.disable_legacy_mfa ;;
    hidden: no
  }

  dimension: enable_apiv3_service {
  label: "Enable Apiv3 Service"
    description: ""
    type: yesno
    group_label: "Service Configuration"
    sql: ${TABLE}.enable_apiv3_service ;;
    hidden: no
  }

  dimension: enable_api_team_deletion {
  label: "Enable Api Team Deletion"
    description: ""
    type: yesno
    group_label: "Service Configuration"
    sql: ${TABLE}.enable_api_team_deletion ;;
    hidden: no
  }

  dimension: enable_bot_account_creation {
  label: "Enable Bot Account Creation"
    description: ""
    type: yesno
    group_label: "Service Configuration"
    sql: ${TABLE}.enable_bot_account_creation ;;
    hidden: no
  }

  dimension: enable_channel_viewed_messages_service {
  label: "Enable Channel Viewed Messages Service"
    description: ""
    type: yesno
    group_label: "Service Configuration"
    sql: ${TABLE}.enable_channel_viewed_messages_service ;;
    hidden: no
  }

  dimension: enable_commands_service {
  label: "Enable Commands Service"
    description: ""
    type: yesno
    group_label: "Service Configuration"
    sql: ${TABLE}.enable_commands_service ;;
    hidden: no
  }

  dimension: enable_custom_emoji_service {
  label: "Enable Custom Emoji Service"
    description: ""
    type: yesno
    group_label: "Service Configuration"
    sql: ${TABLE}.enable_custom_emoji_service ;;
    hidden: no
  }

  dimension: enable_developer_service {
  label: "Enable Developer Service"
    description: ""
    type: yesno
    group_label: "Service Configuration"
    sql: ${TABLE}.enable_developer_service ;;
    hidden: no
  }

  dimension: enable_email_invitations {
  label: "Enable Email Invitations"
    description: ""
    type: yesno
    group_label: "Service Configuration"
    sql: ${TABLE}.enable_email_invitations ;;
    hidden: no
  }

  dimension: enable_emoji_picker_service {
  label: "Enable Emoji Picker Service"
    description: ""
    type: yesno
    group_label: "Service Configuration"
    sql: ${TABLE}.enable_emoji_picker_service ;;
    hidden: no
  }

  dimension: enable_gif_picker {
  label: "Enable Gif Picker"
    description: ""
    type: yesno
    group_label: "Service Configuration"
    sql: ${TABLE}.enable_gif_picker ;;
    hidden: no
  }

  dimension: enable_incoming_webhooks_service {
  label: "Enable Incoming Webhooks Service"
    description: ""
    type: yesno
    group_label: "Service Configuration"
    sql: ${TABLE}.enable_incoming_webhooks_service ;;
    hidden: no
  }

  dimension: enable_insecure_outgoing_connections_service {
  label: "Enable Insecure Outgoing Connections Service"
    description: ""
    type: yesno
    group_label: "Service Configuration"
    sql: ${TABLE}.enable_insecure_outgoing_connections_service ;;
    hidden: no
  }

  dimension: enable_latex {
  label: "Enable Latex"
    description: ""
    type: yesno
    group_label: "Service Configuration"
    sql: ${TABLE}.enable_latex ;;
    hidden: no
  }

  dimension: enable_multifactor_authentication_service {
  label: "Enable Multifactor Authentication Service"
    description: ""
    type: yesno
    group_label: "Service Configuration"
    sql: ${TABLE}.enable_multifactor_authentication_service ;;
    hidden: no
  }

  dimension: enable_oauth_service_provider_service {
  label: "Enable OAuth Service Provider Service"
    description: ""
    type: yesno
    group_label: "Service Configuration"
    sql: ${TABLE}.enable_oauth_service_provider_service ;;
    hidden: no
  }

  dimension: enable_only_admin_integrations_service {
  label: "Enable Only Admin Integrations Service"
    description: ""
    type: yesno
    group_label: "Service Configuration"
    sql: ${TABLE}.enable_only_admin_integrations_service ;;
    hidden: no
  }

  dimension: enable_outgoing_webhooks {
  label: "Enable Outgoing Webhooks"
    description: ""
    type: yesno
    group_label: "Service Configuration"
    sql: ${TABLE}.enable_outgoing_webhooks ;;
    hidden: no
  }

  dimension: enable_post_icon_override {
  label: "Enable Post Icon Override"
    description: ""
    type: yesno
    group_label: "Service Configuration"
    sql: ${TABLE}.enable_post_icon_override ;;
    hidden: no
  }

  dimension: enable_post_search {
  label: "Enable Post Search"
    description: ""
    type: yesno
    group_label: "Service Configuration"
    sql: ${TABLE}.enable_post_search ;;
    hidden: no
  }

  dimension: enable_post_username_override {
  label: "Enable Post Username Override"
    description: ""
    type: yesno
    group_label: "Service Configuration"
    sql: ${TABLE}.enable_post_username_override ;;
    hidden: no
  }

  dimension: enable_preview_features {
  label: "Enable Preview Features"
    description: ""
    type: yesno
    group_label: "Service Configuration"
    sql: ${TABLE}.enable_preview_features ;;
    hidden: no
  }

  dimension: enable_security_fix_alert {
  label: "Enable Security Fix Alert"
    description: ""
    type: yesno
    group_label: "Service Configuration"
    sql: ${TABLE}.enable_security_fix_alert ;;
    hidden: no
  }

  dimension: enable_svgs {
  label: "Enable SVG's"
    description: ""
    type: yesno
    group_label: "Service Configuration"
    sql: ${TABLE}.enable_svgs ;;
    hidden: no
  }

  dimension: enable_testing {
  label: "Enable Testing"
    description: ""
    type: yesno
    group_label: "Service Configuration"
    sql: ${TABLE}.enable_testing ;;
    hidden: no
  }

  dimension: enable_tutorial {
  label: "Enable Tutorial"
    description: ""
    type: yesno
    group_label: "Service Configuration"
    sql: ${TABLE}.enable_tutorial ;;
    hidden: no
  }

  dimension: enable_user_access_tokens {
  label: "Enable User Access Tokens"
    description: ""
    type: yesno
    group_label: "Service Configuration"
    sql: ${TABLE}.enable_user_access_tokens ;;
    hidden: no
  }

  dimension: enable_user_statuses {
  label: "Enable User Statuses"
    description: ""
    type: yesno
    group_label: "Service Configuration"
    sql: ${TABLE}.enable_user_statuses ;;
    hidden: no
  }

  dimension: enable_user_typing_messages {
  label: "Enable User Typing Messages"
    description: ""
    type: yesno
    group_label: "Service Configuration"
    sql: ${TABLE}.enable_user_typing_messages ;;
    hidden: no
  }

  dimension: enforce_multifactor_authentication_service {
  label: "Enforce Multifactor Authentication Service"
    description: ""
    type: yesno
    group_label: "Service Configuration"
    sql: ${TABLE}.enforce_multifactor_authentication_service ;;
    hidden: no
  }

  dimension: experimental_channel_organization {
  label: "Experimental Channel Organization"
    description: ""
    type: yesno
    group_label: "Service Configuration"
    sql: ${TABLE}.experimental_channel_organization ;;
    hidden: no
  }

  dimension: experimental_channel_sidebar_organization {
    label: "Experimental Channel Sidebar Organization"
    description: ""
    type: string
    group_label: "Service Configuration"
    sql: ${TABLE}.experimental_channel_sidebar_organization ;;
    hidden: no
  }

  dimension: experimental_data_prefetch {
    label: "Experimental Data Prefetch"
    description: ""
    type: yesno
    group_label: "Service Configuration"
    sql: ${TABLE}.experimental_data_prefetch ;;
    hidden: no
  }

  dimension: extend_session_length_with_activity {
    label: "Extend Session Length w/ Activity"
    description: ""
    type: yesno
    group_label: "Service Configuration"
    sql: ${TABLE}.extend_session_length_with_activity ;;
    hidden: no
  }

  dimension: experimental_enable_authentication_transfer {
  label: "Experimental Enable Authentication Transfer"
    description: ""
    type: yesno
    group_label: "Service Configuration"
    sql: ${TABLE}.experimental_enable_authentication_transfer ;;
    hidden: no
  }

  dimension: experimental_enable_default_channel_leave_join_messages {
  label: "Experimental Enable Default Channel Leave Join Messages"
    description: ""
    type: yesno
    group_label: "Service Configuration"
    sql: ${TABLE}.experimental_enable_default_channel_leave_join_messages ;;
    hidden: no
  }

  dimension: experimental_enable_hardened_mode {
  label: "Experimental Enable Hardened Mode"
    description: ""
    type: yesno
    group_label: "Service Configuration"
    sql: ${TABLE}.experimental_enable_hardened_mode ;;
    hidden: no
  }

  dimension: experimental_group_unread_channels {
    description: ""
    type: string
    group_label: "Service Configuration"
    sql: ${TABLE}.experimental_group_unread_channels ;;
    hidden: no
  }

  dimension: experimental_ldap_group_sync {
  label: "Experimental LDAP Group Sync"
    description: ""
    type: yesno
    group_label: "Service Configuration"
    sql: ${TABLE}.experimental_ldap_group_sync ;;
    hidden: no
  }

  dimension: experimental_limit_client_config {
  label: "Experimental Limit Client Config"
    description: ""
    type: yesno
    group_label: "Service Configuration"
    sql: ${TABLE}.experimental_limit_client_config ;;
    hidden: no
  }

  dimension: experimental_strict_csrf_enforcement {
  label: "Experimental Strict Csrf Enforcement"
    description: ""
    type: yesno
    group_label: "Service Configuration"
    sql: ${TABLE}.experimental_strict_csrf_enforcement ;;
    hidden: no
  }

  dimension: forward_80_to_443 {
  label: "Forward 80 To 443"
    description: ""
    type: yesno
    group_label: "Service Configuration"
    sql: ${TABLE}.forward_80_to_443 ;;
    hidden: no
  }

  dimension: gfycat_api_key {
  label: "Gfycat Api Key"
    description: ""
    type: yesno
    group_label: "Service Configuration"
    sql: ${TABLE}.gfycat_api_key ;;
    hidden: no
  }

  dimension: gfycat_api_secret {
  label: "Gfycat Api Secret"
    description: ""
    type: yesno
    group_label: "Service Configuration"
    sql: ${TABLE}.gfycat_api_secret ;;
    hidden: no
  }

  dimension: isdefault_allowed_untrusted_internal_connections {
  label: "Isdefault Allowed Untrusted Internal Connections"
    description: ""
    type: yesno
    group_label: "Service Configuration"
    sql: ${TABLE}.isdefault_allowed_untrusted_internal_connections ;;
    hidden: no
  }

  dimension: isdefault_allowed_untrusted_inteznal_connections {
  label: "Isdefault Allowed Untrusted Inteznal Connections"
    description: ""
    type: yesno
    group_label: "Service Configuration"
    sql: ${TABLE}.isdefault_allowed_untrusted_inteznal_connections ;;
    hidden: no
  }

  dimension: isdefault_allow_cors_from {
  label: "Isdefault Allow Cors From"
    description: ""
    type: yesno
    group_label: "Service Configuration"
    sql: ${TABLE}.isdefault_allow_cors_from ;;
    hidden: no
  }

  dimension: isdefault_cors_exposed_headers {
  label: "Isdefault Cors Exposed Headers"
    description: ""
    type: yesno
    group_label: "Service Configuration"
    sql: ${TABLE}.isdefault_cors_exposed_headers ;;
    hidden: no
  }

  dimension: isdefault_google_developer_key {
  label: "Isdefault Google Developer Key"
    description: ""
    type: yesno
    group_label: "Service Configuration"
    sql: ${TABLE}.isdefault_google_developer_key ;;
    hidden: no
  }

  dimension: isdefault_image_proxy_options {
  label: "Isdefault Image Proxy Options"
    description: ""
    type: yesno
    group_label: "Service Configuration"
    sql: ${TABLE}.isdefault_image_proxy_options ;;
    hidden: no
  }

  dimension: isdefault_image_proxy_type {
  label: "Isdefault Image Proxy Type"
    description: ""
    type: yesno
    group_label: "Service Configuration"
    sql: ${TABLE}.isdefault_image_proxy_type ;;
    hidden: no
  }

  dimension: isdefault_image_proxy_url {
  label: "Isdefault Image Proxy URL"
    description: ""
    type: yesno
    group_label: "Service Configuration"
    sql: ${TABLE}.isdefault_image_proxy_url ;;
    hidden: no
  }

  dimension: isdefault_read_timeout {
  label: "Isdefault Read Timeout"
    description: ""
    type: yesno
    group_label: "Service Configuration"
    sql: ${TABLE}.isdefault_read_timeout ;;
    hidden: no
  }

  dimension: isdefault_site_url {
  label: "Isdefault Site URL"
    description: ""
    type: yesno
    group_label: "Service Configuration"
    sql: ${TABLE}.isdefault_site_url ;;
    hidden: no
  }

  dimension: isdefault_tls_cert_file {
  label: "Isdefault TLS Cert File"
    description: ""
    type: yesno
    group_label: "Service Configuration"
    sql: ${TABLE}.isdefault_tls_cert_file ;;
    hidden: no
  }

  dimension: isdefault_tls_key_file {
  label: "Isdefault TLS Key File"
    description: ""
    type: yesno
    group_label: "Service Configuration"
    sql: ${TABLE}.isdefault_tls_key_file ;;
    hidden: no
  }

  dimension: isdefault_write_timeout {
  label: "Isdefault Write Timeout"
    description: ""
    type: yesno
    group_label: "Service Configuration"
    sql: ${TABLE}.isdefault_write_timeout ;;
    hidden: no
  }

  dimension: maximum_login_attempts {
    description: ""
    type: number
    group_label: "Service Configuration"
    sql: ${TABLE}.maximum_login_attempts ;;
    hidden: no
  }

  dimension: minimum_hashtag_length {
    description: ""
    type: number
    group_label: "Service Configuration"
    sql: ${TABLE}.minimum_hashtag_length ;;
    hidden: no
  }

  dimension: post_edit_time_limit {
    description: ""
    type: number
    group_label: "Service Configuration"
    sql: ${TABLE}.post_edit_time_limit ;;
    hidden: no
  }

  dimension: restrict_custom_emoji_creation {
    description: ""
    type: string
    group_label: "Service Configuration"
    sql: ${TABLE}.restrict_custom_emoji_creation ;;
    hidden: no
  }

  dimension: restrict_post_delete {
    description: ""
    type: string
    group_label: "Service Configuration"
    sql: ${TABLE}.restrict_post_delete ;;
    hidden: no
  }

  dimension: session_cache_in_minutes {
    description: ""
    type: number
    group_label: "Service Configuration"
    sql: ${TABLE}.session_cache_in_minutes ;;
    hidden: no
  }

  dimension: session_idle_timeout_in_minutes {
    description: ""
    type: number
    group_label: "Service Configuration"
    sql: ${TABLE}.session_idle_timeout_in_minutes ;;
    hidden: no
  }

  dimension: session_length_mobile_in_days {
    description: ""
    type: number
    group_label: "Service Configuration"
    sql: ${TABLE}.session_length_mobile_in_days ;;
    hidden: no
  }

  dimension: session_length_sso_in_days {
    description: ""
    type: number
    group_label: "Service Configuration"
    sql: ${TABLE}.session_length_sso_in_days ;;
    hidden: no
  }

  dimension: session_length_web_in_days {
    description: ""
    type: number
    group_label: "Service Configuration"
    sql: ${TABLE}.session_length_web_in_days ;;
    hidden: no
  }

  dimension: tls_strict_transport {
  label: "TLS Strict Transport"
    description: ""
    type: yesno
    group_label: "Service Configuration"
    sql: ${TABLE}.tls_strict_transport ;;
    hidden: no
  }

  dimension: uses_letsencrypt {
  label: "Uses Letsencrypt"
    description: ""
    type: yesno
    group_label: "Service Configuration"
    sql: ${TABLE}.uses_letsencrypt ;;
    hidden: no
  }

  dimension: websocket_url {
  label: "Websocket URL"
    description: ""
    type: yesno
    group_label: "Service Configuration"
    sql: ${TABLE}.websocket_url ;;
    hidden: no
  }

  dimension: web_server_mode {
    description: ""
    type: string
    group_label: "Service Configuration"
    sql: ${TABLE}.web_server_mode ;;
    hidden: no
  }

  dimension: driver_name_sql {
    description: ""
    type: string
    group_label: "Sql Configuration"
    sql: ${TABLE}.driver_name_sql ;;
    hidden: no
  }

  dimension: enable_public_channels_materialization {
  label: "Enable Public Channels Materialization"
    description: ""
    type: yesno
    group_label: "Sql Configuration"
    sql: ${TABLE}.enable_public_channels_materialization ;;
    hidden: no
  }

  dimension: max_idle_conns {
    description: ""
    type: number
    group_label: "Sql Configuration"
    sql: ${TABLE}.max_idle_conns ;;
    hidden: no
  }

  dimension: conn_max_idletime_milliseconds {
    description: ""
    type: number
    group_label: "Sql Configuration"
    sql: ${TABLE}.conn_max_idletime_milliseconds ;;
    hidden: no
  }

  dimension: max_open_conns {
    description: ""
    type: number
    group_label: "Sql Configuration"
    sql: ${TABLE}.max_open_conns ;;
    hidden: no
  }

  dimension: query_timeout_sql {
    description: ""
    type: number
    group_label: "Sql Configuration"
    sql: ${TABLE}.query_timeout_sql ;;
    hidden: no
  }

  dimension: trace_sql {
  label: "Trace Sql"
    description: ""
    type: yesno
    group_label: "Sql Configuration"
    sql: ${TABLE}.trace_sql ;;
    hidden: no
  }

  dimension: warn_metric_number_of_active_users_200 {
    label: "Warn Metric: >200 Active Users"
    description: ""
    type: yesno
    group_label: "Warn Metrics"
    sql: ${TABLE}.warn_metric_number_of_active_users_200 ;;
    hidden: no
  }

  dimension: warn_metric_number_of_active_users_400 {
    label: "Warn Metric: >400 Active Users"
    description: ""
    type: yesno
    group_label: "Warn Metrics"
    sql: ${TABLE}.warn_metric_number_of_active_users_400 ;;
    hidden: no
  }

  dimension: warn_metric_number_of_active_users_500 {
    label: "Warn Metric: >500 Active Users"
    description: ""
    type: yesno
    group_label: "Warn Metrics"
    sql: ${TABLE}.warn_metric_number_of_active_users_500 ;;
    hidden: no
  }

  dimension: warn_metric_email_domain {
    description: ""
    type: yesno
    group_label: "Warn Metrics"
    sql: ${TABLE}.warn_metric_email_domain ;;
    hidden: no
  }

  dimension: warn_metric_mfa {
    description: ""
    type: yesno
    group_label: "Warn Metrics"
    sql: ${TABLE}.warn_metric_mfa ;;
    hidden: no
  }

  dimension: warn_metric_number_of_teams_5 {
    description: ""
    type: yesno
    group_label: "Warn Metrics"
    sql: ${TABLE}.warn_metric_number_of_teams_5 ;;
    hidden: no
  }

  dimension: warn_metric_number_of_active_users_100 {
    description: ""
    type: yesno
    group_label: "Warn Metrics"
    sql: ${TABLE}.warn_metric_number_of_active_users_100 ;;
    hidden: no
  }

  dimension: warn_metric_number_of_active_users_300 {
    description: ""
    type: yesno
    group_label: "Warn Metrics"
    sql: ${TABLE}.warn_metric_number_of_active_users_300 ;;
    hidden: no
  }

  dimension: warn_metric_number_of_channels_50 {
    description: ""
    type: yesno
    group_label: "Warn Metrics"
    sql: ${TABLE}.warn_metric_number_of_channels_50 ;;
    hidden: no
  }

  dimension: warn_metric_number_of_posts_2m {
    description: ""
    type: yesno
    group_label: "Warn Metrics"
    sql: ${TABLE}.warn_metric_number_of_posts_2m ;;
    hidden: no
  }

#   dimension: custom_service_terms_enabled_support {
#   label: "Custom Service Terms Enabled Support"
#     description: ""
#     type: yesno
#     group_label: "Support Configuration"
#     sql: ${TABLE}.custom_service_terms_enabled_support ;;
#     hidden: no
#   }

  dimension: custom_terms_of_service_enabled {
  label: "Custom Terms of Service Enabled"
    description: ""
    type: yesno
    group_label: "Support Configuration"
    sql: COALESCE(${TABLE}.custom_terms_of_service_enabled, ${TABLE}.custom_service_terms_enabled_support) ;;
    hidden: no
  }

  dimension: ask_community_link_enabled {
    label: "Ask Community Link Enabled"
    description: ""
    type: yesno
    group_label: "Support Configuration"
    sql: ${TABLE}.enable_ask_community_link ;;
    hidden: no
  }

  dimension: custom_terms_of_service_re_acceptance_period {
    description: ""
    type: number
    group_label: "Support Configuration"
    sql: ${TABLE}.custom_terms_of_service_re_acceptance_period ;;
    hidden: no
  }

  dimension: isdefault_about_link {
  label: "Isdefault About Link"
    description: ""
    type: yesno
    group_label: "Support Configuration"
    sql: ${TABLE}.isdefault_about_link ;;
    hidden: no
  }

  dimension: isdefault_help_link {
  label: "Isdefault Help Link"
    description: ""
    type: yesno
    group_label: "Support Configuration"
    sql: ${TABLE}.isdefault_help_link ;;
    hidden: no
  }

  dimension: isdefault_privacy_policy_link {
  label: "Isdefault Privacy Policy Link"
    description: ""
    type: yesno
    group_label: "Support Configuration"
    sql: ${TABLE}.isdefault_privacy_policy_link ;;
    hidden: no
  }

  dimension: isdefault_report_a_problem_link {
  label: "Isdefault Report A Problem Link"
    description: ""
    type: yesno
    group_label: "Support Configuration"
    sql: ${TABLE}.isdefault_report_a_problem_link ;;
    hidden: no
  }

  dimension: isdefault_support_email {
  label: "Isdefault Support Email"
    description: ""
    type: yesno
    group_label: "Support Configuration"
    sql: ${TABLE}.isdefault_support_email ;;
    hidden: no
  }

  dimension: isdefault_terms_of_service_link {
  label: "Isdefault Terms Of Service Link"
    description: ""
    type: yesno
    group_label: "Support Configuration"
    sql: ${TABLE}.isdefault_terms_of_service_link ;;
    hidden: no
  }

  dimension: segment_dedupe_id_support {
    description: ""
    type: string
    group_label: "Support Configuration"
    sql: ${TABLE}.segment_dedupe_id_support ;;
    hidden: no
  }

  dimension: enable_confirm_notifications_to_channel {
  label: "Confirm Notifications To Channel Enabled"
    description: ""
    type: yesno
    group_label: "Team Configuration"
    sql: ${TABLE}.enable_confirm_notifications_to_channel ;;
    hidden: no
  }

  dimension: enable_custom_brand {
  label: "Custom Brand Enabled"
    description: ""
    type: yesno
    group_label: "Team Configuration"
    sql: ${TABLE}.enable_custom_brand ;;
    hidden: no
  }

  dimension: enable_custom_user_statuses {
    label: "Custom User Statuses Enabled"
    description: ""
    type: yesno
    group_label: "Team Configuration"
    sql: ${TABLE}.enable_custom_user_statuses ;;
    hidden: no
  }

  dimension: enable_open_server {
  label: "Enable Open Server"
    description: ""
    type: yesno
    group_label: "Team Configuration"
    sql: ${TABLE}.enable_open_server ;;
    hidden: no
  }

  dimension: enable_team_creation {
  label: "Enable Team Creation"
    description: ""
    type: yesno
    group_label: "Team Configuration"
    sql: ${TABLE}.enable_team_creation ;;
    hidden: no
  }

  dimension: enable_user_creation {
  label: "Enable User Creation"
    description: ""
    type: yesno
    group_label: "Team Configuration"
    sql: ${TABLE}.enable_user_creation ;;
    hidden: no
  }

  dimension: enable_user_deactivation {
  label: "Enable User Deactivation"
    description: ""
    type: yesno
    group_label: "Team Configuration"
    sql: ${TABLE}.enable_user_deactivation ;;
    hidden: no
  }

  dimension: enable_x_to_leave_channels_from_lhs {
  label: "Enable X To Leave Channels From Lhs"
    description: ""
    type: yesno
    group_label: "Team Configuration"
    sql: ${TABLE}.enable_x_to_leave_channels_from_lhs ;;
    hidden: no
  }

  dimension: experimental_default_channels {
    description: ""
    type: number
    group_label: "Team Configuration"
    sql: ${TABLE}.experimental_default_channels ;;
    hidden: no
  }

  dimension: experimental_enable_automatic_replies {
  label: "Experimental Enable Automatic Replies"
    description: ""
    type: yesno
    group_label: "Team Configuration"
    sql: ${TABLE}.experimental_enable_automatic_replies ;;
    hidden: no
  }

  dimension: experimental_primary_team {
  label: "Experimental Primary Team"
    description: ""
    type: yesno
    group_label: "Team Configuration"
    sql: ${TABLE}.experimental_primary_team ;;
    hidden: no
  }

  dimension: experimental_town_square_is_hidden_in_lhs {
  label: "Experimental Town Square Is Hidden In Lhs"
    description: ""
    type: yesno
    group_label: "Team Configuration"
    sql: ${TABLE}.experimental_town_square_is_hidden_in_lhs ;;
    hidden: no
  }

  dimension: experimental_town_square_is_read_only {
  label: "Experimental Town Square Is Read Only"
    description: ""
    type: yesno
    group_label: "Team Configuration"
    sql: ${TABLE}.experimental_town_square_is_read_only ;;
    hidden: no
  }

  dimension: experimental_view_archived_channels {
  label: "Experimental View Archived Channels"
    description: ""
    type: yesno
    group_label: "Team Configuration"
    sql: ${TABLE}.experimental_view_archived_channels ;;
    hidden: no
  }

  dimension: isdefault_custom_brand_text {
  label: "Isdefault Custom Brand Text"
    description: ""
    type: yesno
    group_label: "Team Configuration"
    sql: ${TABLE}.isdefault_custom_brand_text ;;
    hidden: no
  }

  dimension: isdefault_custom_description_text {
  label: "Isdefault Custom Description Text"
    description: ""
    type: yesno
    group_label: "Team Configuration"
    sql: ${TABLE}.isdefault_custom_description_text ;;
    hidden: no
  }

  dimension: isdefault_site_name {
  label: "Isdefault Site Name"
    description: ""
    type: yesno
    group_label: "Team Configuration"
    sql: ${TABLE}.isdefault_site_name ;;
    hidden: no
  }

  dimension: isdefault_user_status_away_timeout {
  label: "Isdefault User Status Away Timeout"
    description: ""
    type: yesno
    group_label: "Team Configuration"
    sql: ${TABLE}.isdefault_user_status_away_timeout ;;
    hidden: no
  }

  dimension: lock_teammate_name_display {
  label: "Lock Teammate Name Display"
    description: ""
    type: yesno
    group_label: "Team Configuration"
    sql: ${TABLE}.lock_teammate_name_display ;;
    hidden: no
  }

  dimension: max_channels_per_team {
    description: ""
    type: number
    group_label: "Team Configuration"
    sql: ${TABLE}.max_channels_per_team ;;
    hidden: no
  }

  dimension: max_notifications_per_channel {
    description: ""
    type: number
    group_label: "Team Configuration"
    sql: ${TABLE}.max_notifications_per_channel ;;
    hidden: no
  }

  dimension: max_users_per_team {
    description: ""
    type: number
    group_label: "Team Configuration"
    sql: ${TABLE}.max_users_per_team ;;
    hidden: no
  }

  dimension: restrict_direct_message {
    description: ""
    type: string
    group_label: "Team Configuration"
    sql: ${TABLE}.restrict_direct_message ;;
    hidden: no
  }

  dimension: restrict_private_channel_creation {
    description: ""
    type: string
    group_label: "Team Configuration"
    sql: ${TABLE}.restrict_private_channel_creation ;;
    hidden: no
  }

  dimension: restrict_private_channel_deletion {
    description: ""
    type: string
    group_label: "Team Configuration"
    sql: ${TABLE}.restrict_private_channel_deletion ;;
    hidden: no
  }

  dimension: restrict_private_channel_management {
    description: ""
    type: string
    group_label: "Team Configuration"
    sql: ${TABLE}.restrict_private_channel_management ;;
    hidden: no
  }

  dimension: restrict_private_channel_manage_members {
    description: ""
    type: string
    group_label: "Team Configuration"
    sql: ${TABLE}.restrict_private_channel_manage_members ;;
    hidden: no
  }

  dimension: restrict_public_channel_creation {
    description: ""
    type: string
    group_label: "Team Configuration"
    sql: ${TABLE}.restrict_public_channel_creation ;;
    hidden: no
  }

  dimension: restrict_public_channel_deletion {
    description: ""
    type: string
    group_label: "Team Configuration"
    sql: ${TABLE}.restrict_public_channel_deletion ;;
    hidden: no
  }

  dimension: restrict_public_channel_management {
    description: ""
    type: string
    group_label: "Team Configuration"
    sql: ${TABLE}.restrict_public_channel_management ;;
    hidden: no
  }

  dimension: restrict_team_invite {
    description: ""
    type: string
    group_label: "Team Configuration"
    sql: ${TABLE}.restrict_team_invite ;;
    hidden: no
  }

  dimension: teammate_name_display {
    description: ""
    type: string
    group_label: "Team Configuration"
    sql: ${TABLE}.teammate_name_display ;;
    hidden: no
  }

  dimension: view_archived_channels {
  label: "View Archived Channels"
    description: ""
    type: yesno
    group_label: "Team Configuration"
    sql: ${TABLE}.view_archived_channels ;;
    hidden: no
  }

  dimension: allowed_themes {
    description: ""
    type: number
    group_label: "Theme Configuration"
    sql: ${TABLE}.allowed_themes ;;
    hidden: no
  }

  dimension: allow_custom_themes {
  label: "Allow Custom Themes"
    description: ""
    type: yesno
    group_label: "Theme Configuration"
    sql: ${TABLE}.allow_custom_themes ;;
    hidden: no
  }

  dimension: enable_theme_selection {
  label: "Enable Theme Selection"
    description: ""
    type: yesno
    group_label: "Theme Configuration"
    sql: ${TABLE}.enable_theme_selection ;;
    hidden: no
  }

  dimension: isdefault_default_theme {
  label: "Isdefault Default Theme"
    description: ""
    type: yesno
    group_label: "Theme Configuration"
    sql: ${TABLE}.isdefault_default_theme ;;
    hidden: no
  }

  dimension: isdefault_supported_timezones_path {
  label: "Isdefault Supported Timezones Path"
    description: ""
    type: yesno
    group_label: "Timezone Configuration"
    sql: ${TABLE}.isdefault_supported_timezones_path ;;
    hidden: no
  }

  dimension: enable {
  label: "Enable"
    description: ""
    type: yesno
    group_label: "Webrtc Configuration"
    sql: ${TABLE}.enable ;;
    hidden: no
  }

  dimension: isdefault_stun_uri {
  label: "Isdefault Stun Uri"
    description: ""
    type: yesno
    group_label: "Webrtc Configuration"
    sql: ${TABLE}.isdefault_stun_uri ;;
    hidden: no
  }

  dimension: isdefault_turn_uri {
  label: "Isdefault Turn Uri"
    description: ""
    type: yesno
    group_label: "Webrtc Configuration"
    sql: ${TABLE}.isdefault_turn_uri ;;
    hidden: no
  }

  dimension: id {
    description: ""
    type: string
    sql: ${TABLE}.id ;;
    hidden: yes
    primary_key: yes
  }

  dimension: license_users {
    description: "The number of seats (users) provisioned to the license associated with the server (if a license is provisioned and active on the given logging date)."
    type: number
    sql: ${license_server_fact.users} ;;
    hidden: yes
  }

  # DIMENSION GROUPS/DATES
  dimension_group: logging {
    label:  "   Logging"
    description: "The date that the servers state and configuration was logged. This table contains 1 row per server per day for all servers actively sending telemetry data."
    type: time
    timeframes: [date, week, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.date ;;
    hidden: no
  }

  dimension_group: first_active_telemetry {
    label: " First Security Telemetry"
    description: "The date the server first recorded telemetry data in the security diagnostics data (logged via security_update_check.go)."
    type: time
    timeframes: [date, week, month, year, fiscal_quarter, fiscal_year]
    sql: ${server_fact.first_telemetry_active_date}::date ;;
    hidden: yes
  }

  dimension_group: last_active_telemetry {
    label: " Last Security Telemetry"
    description: "The date the server last recorded telemetry data in the security diagnostics data (logged via security_update_check.go)."
    type: time
    timeframes: [date, week, month, year, fiscal_quarter, fiscal_year]
    sql: ${server_fact.last_telemetry_active_date}::date ;;
    hidden: yes
  }

  dimension_group: last_mm2_telemetry {
    label: " Last Diagnostics Telemetry"
    description: "The date the server last recorded diagnostics telemetry (logged via diagnostics.go)."
    type: time
    timeframes: [date, week, month, year, fiscal_quarter, fiscal_year]
    sql: ${server_fact.last_mm2_telemetry_date}::date ;;
    hidden: yes
  }

  dimension_group: first_mm2_telemetry {
    label: " First Diagnostics Telemetry"
    description: "The date the server first recorded diagnostics telemetry (logged via diagnostics.go)."
    type: time
    timeframes: [date, week, month, year, fiscal_quarter, fiscal_year]
    sql: ${server_fact.first_mm2_telemetry_date}::date ;;
    hidden: yes
  }

  dimension_group: timestamp {
  description: ""
  type: time
    timeframes: [date, week, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.timestamp ;;
    hidden: yes
  }

  dimension: days_since_first_telemetry_enabled {
    group_label: "Timeframes Since First Active"
    label: "Days Since First Telemetry Enabled"
    description: "Displays the age in days of the server. Age is calculated as days between the first active date (first date telemetry enabled) and logging date of the record."
    type: number
    sql: datediff(day, COALESCE(${server_fact.first_active_date}, ${server_fact.first_telemetry_active_date}, ${nps_server_daily_score.server_install_date}), ${logging_date}::date) ;;
  }

  dimension: days_since_first_active_user {
    group_label: "Timeframes Since First Active"
    label: "Days Since First Active User"
    description: "Displays the age in days of the server. Age is calculated as days between the first active user date (first date telemetry enabled) and logging date of the record."
    type: number
    sql: datediff(day, ${server_fact.first_active_user_date}::date, ${logging_date}::date) ;;
  }

  dimension: days_since_first_active_user_band {
    group_label: "Timeframes Since First Active"
    label: "Days Since First Active User Band"
    description: "Displays the age in days of the server bucketed into groupings. Age is calculated as days between the first active user date (first date telemetry enabled) and logging date of the record."
    type: tier
    style: integer
    tiers: [1,7,14,31,61,91,181,366,731]
    sql: ${days_since_first_telemetry_enabled} ;;
  }

  dimension: months_since_first_telemetry_enabled {
    group_label: "Timeframes Since First Active"
    label: "Months Since First Telemetry Enabled"
    description: "Displays the age in months of the server. Age is calculated as months between the first active month (first date telemetry enabled) and logging month of the record."
    type: number
    sql: datediff(month, date_trunc('month', COALESCE(${server_fact.first_active_date}::date, ${server_fact.first_telemetry_active_date}::date, ${nps_server_daily_score.server_install_date}::date)), date_trunc('month', ${logging_date}::date)::date) ;;
  }

  dimension: weeks_since_first_telemetry_enabled {
    group_label: "Timeframes Since First Active"
    label: "Weeks Since First Telemetry Enabled"
    description: "Displays the age in weeks of the server. Age is calculated as weeks between the first active week (first date telemetry enabled) and logging week of the record."
    type: number
    sql: datediff(week, date_trunc('week', COALESCE(${server_fact.first_active_date}::date, ${server_fact.first_telemetry_active_date}::date, ${nps_server_daily_score.server_install_date}::date)), date_trunc('week', ${logging_date}::date)::date) ;;
  }

  dimension: days_since_first_telemetry_enabled_band {
    group_label: "Timeframes Since First Active"
    label: "Days Since First Telemetry Band"
    description: "Displays the age in days of the server bucketed into groupings. Age is calculated as days between the first active date (first date telemetry enabled) and logging date of the record."
    type: tier
    style: integer
    tiers: [1,7,14,31,61,91,181,366,731]
    sql: ${days_since_first_telemetry_enabled} ;;
  }

  dimension: days_from_first_telemetry_to_paid_license {
    label: "Days to Paid License"
    hidden: yes
    description: "The number of days between the servers first telemetry date and it's first date recording an association with a paid license key."
    type: number
    sql: --CASE WHEN datediff(day, COALESCE(${server_fact.first_active_date}, ${nps_server_daily_score.server_install_date}), ${server_fact.first_paid_license_date}) < 0 THEN 0 ELSE
          datediff(day, COALESCE(${server_fact.first_active_date}, ${nps_server_daily_score.server_install_date}), ${server_fact.first_paid_license_date})
          --END
          ;;
  }

  measure: median_days_active_to_paid {
    type: number
    hidden: yes
    sql: median(CASE WHEN ${server_fact.first_paid_license_date} >= ${server_fact.first_active_date} then ${days_from_first_telemetry_to_paid_license} else null end) ;;
  }

  measure: avg_days_active_to_paid {
    type: number
    hidden: yes
    sql: avg(CASE WHEN ${server_fact.first_paid_license_date} >= ${server_fact.first_active_date} then ${days_from_first_telemetry_to_paid_license} else null end) ;;
  }

  measure: min_days_active_to_paid {
    type: number
    hidden: yes
    sql: min(${days_from_first_telemetry_to_paid_license}) ;;
  }

  dimension: days_trial_to_paid {
    label: "Days From Trial to Paid License"
    type: number
    hidden: yes
    sql: CASE WHEN DATEDIFF(DAY, ${server_fact.first_trial_license_date}, ${server_fact.first_paid_license_date}) < 0 THEN 0 ELSE DATEDIFF(DAY, ${server_fact.first_trial_license_date}, ${server_fact.first_paid_license_date}) END ;;
  }

  measure: median_days_trial_to_paid {
    type: number
    hidden: yes
    sql: median(${days_trial_to_paid}) ;;
  }

  dimension: days_from_first_telemetry_to_paid_license_band {
    label: "Days to Paid License Band"
    description: "The number of days between the servers first telemetry date and it's first date recording an association with a paid license key."
    type: tier
    hidden: yes
    style: integer
    tiers: [1,7,31,61,91,181,366,731]
    sql: ${days_from_first_telemetry_to_paid_license} ;;
  }


  # MEASURES
  measure: count {
    label: " Count"
    description: "Count of rows/occurrences."
    type: count
  }

  measure: server_count {
    label: "  Instance Count"
    group_label: "  Instance Counts"
    description: "The distinct count of Server s per grouping."
    type: count_distinct
    sql: ${server_id} ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: server_count_ttr {
    label: "   Instance Count (Trailing 3 Releases)"
    group_label: "  Instance Counts"
    description: "Use this for counting all distinct Server ID's on the latest 3 version releases across dimensions. This measure is a composite of TEDAS servers and additional data sources that logged the server on the given logging date."
    type: count_distinct
    sql: CASE WHEN ${server_version_major_int}::float >= (
                                                    SELECT MIN((split_part(version, '.', 1) || '.' || split_part(version, '.', 2))::float)
                                                    FROM MATTERMOST.VERSION_RELEASE_DATES
                                                    WHERE release_number >= (SELECT MAX(release_number-3) FROM MATTERMOST.VERSION_RELEASE_DATES WHERE release_date < CURRENT_DATE)
                                                    AND release_date < CURRENT_DATE
                                                    )::float
             AND SPLIT_PART(${server_version_major_int}, '.', 2)::float >= (SELECT MIN(split_part(version, '.', 2))
                                                    FROM MATTERMOST.VERSION_RELEASE_DATES
                                                    WHERE release_number >= (SELECT MAX(release_number-3) FROM MATTERMOST.VERSION_RELEASE_DATES WHERE release_date < CURRENT_DATE)
                                                    AND release_date < CURRENT_DATE)::float THEN ${server_id} ELSE NULL END;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: active_user_count_sum {
    description: "The sum of security telemetry-enabled Active Users per grouping."
    group_label: " User Counts: Security Telemetry"
    type: number
    sql: SUM(${active_user_count}) ;;
  }

  measure: active_user_count_max {
    description: "The max of security telemetry-enabled Active Users per grouping."
    group_label: " User Counts: Security Telemetry"
    type: number
    sql: MAX(${active_user_count}) ;;
  }

  measure: user_count_sum {
    description: "The sum of security telemetry-enabled Registered Users per grouping."
    group_label: " User Counts: Security Telemetry"
    type: number
    sql: SUM(${user_count}) ;;
  }

  measure: user_count_max {
    description: "The max of security telemetry-enabled User Count per grouping."
    group_label: " User Counts: Security Telemetry"
    type: number
    sql: MAX(${user_count}) ;;
  }

  measure: system_admins_sum {
    description: "The sum of diagnostics telemetry-enabled System Admins per grouping."
    group_label: " User Counts: Security Telemetry"
    type: number
    sql: SUM(${system_admins}) ;;
  }

  measure: system_admins_max {
    description: "The sum of diagnostics telemetry-enabled System Admins per grouping."
    group_label: " User Counts: Security Telemetry"
    type: number
    sql: MAX(${system_admins}) ;;
  }

  measure: in_security_count {
    label: "  TES Servers"
    description: "The count of servers In Security."
    group_label: "  Instance Counts"
    type: count_distinct
    sql: case when ${in_security} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: in_mm2_server_count {
    label: " Mattermost2 Servers"
    description: "The count of servers In Mm2 Server."
    group_label: "  Instance Counts"
    type: count_distinct
    sql: case when ${in_mm2_server} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: tracking_disabled_count {
    label: "Instances w/ Tracking Disabled"
    description: "The count of servers Tracking Disabled."
    group_label: "  Instance Counts"
    type: count_distinct
    sql: case when ${tracking_disabled} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: has_dupes_count {
    label: "Instances w/ Dupes"
    description: "The count of servers Has Dupes."
    group_label: "  Instance Counts"
    type: count_distinct
    sql: case when ${has_dupes} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: has_multi_ips_count {
    label: "Instances w/ Multiple IP's"
    description: "The count of servers Has Multi Ips."
    group_label: "  Instance Counts"
    type: count_distinct
    sql: case when ${has_multi_ips} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: active_users_sum {
    description: "The sum of Active Users per grouping."
    group_label: "Activity Diagnostics"
    type: number
    sql: SUM(${active_users}) ;;
    drill_fields: [license_server_fact.customer_Name, server_id, active_users_daily_sum, active_users_monthly_sum, registered_users_sum, logging_date]
    hidden: yes
  }

  measure: active_users_avg {
    description: "The average Active Users per grouping."
    group_label: "Activity Diagnostics"
    type: average
    sql: ${active_users} ;;
    value_format_name: decimal_1
    hidden: yes
  }

  measure: active_users_median {
    description: "The median Active Users per grouping."
    group_label: "Activity Diagnostics"
    type: median
    sql: ${active_users} ;;
    value_format_name: decimal_1
    hidden: yes
  }

  measure: active_users_daily_sum {
    description: "The sum of Active Users Daily per grouping."
    group_label: "Activity Diagnostics"
    type: number
    sql: SUM(${active_users_daily}) ;;
    drill_fields: [license_server_fact.customer_Name, server_id, active_users_daily_sum, active_users_monthly_sum, registered_users_sum, logging_date]
  }

  measure: active_users_daily_max {
    description: "The max of Active Users Daily per grouping."
    group_label: "Activity Diagnostics"
    type: number
    sql: MAX(${active_users_daily}) ;;
  }

  measure: active_users_daily_avg {
    description: "The average Active Users Daily per grouping."
    group_label: "Activity Diagnostics"
    type: number
    sql: avg(${active_users_daily}) ;;
    value_format_name: decimal_1
  }

  measure: active_users_daily_median {
    description: "The median Active Users Daily per grouping."
    group_label: "Activity Diagnostics"
    type: number
    sql: median(${active_users_daily}) ;;
    value_format_name: decimal_1
  }

  measure: active_users_monthly_sum {
    description: "The sum of Active Users Monthly per grouping."
    group_label: "Activity Diagnostics"
    type: number
    sql: SUM(${active_users_monthly}) ;;
    drill_fields: [license_server_fact.customer_Name, server_id, active_users_daily_sum, active_users_monthly_sum, registered_users_sum, logging_date]
    value_format_name: decimal_1
  }

  measure: active_users_monthly_max {
    description: "The max of Active Users Monthly per grouping."
    group_label: "Activity Diagnostics"
    type: number
    sql: MAX(${active_users_monthly}) ;;
  }

  measure: active_users_monthly_avg {
    description: "The average Active Users Monthly per grouping."
    group_label: "Activity Diagnostics"
    type: number
    sql: AVG(${active_users_monthly}) ;;
    value_format_name: decimal_1
  }

  measure: bot_accounts_sum {
    description: "The sum of Bot Accounts per grouping."
    group_label: "Activity Diagnostics"
    type: sum
    sql: ${bot_accounts} ;;
  }

  measure: bot_accounts_avg {
    description: "The average Bot Accounts per grouping."
    group_label: "Activity Diagnostics"
    type: average
    sql: ${bot_accounts} ;;
    value_format_name: decimal_1
  }

  measure: bot_posts_previous_day_sum {
    description: "The sum of Bot Posts Previous Day per grouping."
    group_label: "Activity Diagnostics"
    type: sum
    sql: ${bot_posts_previous_day} ;;
  }

  measure: bot_posts_previous_day_avg {
    description: "The average Bot Posts Previous Day per grouping."
    group_label: "Activity Diagnostics"
    type: average
    sql: ${bot_posts_previous_day} ;;
    value_format_name: decimal_1
  }

  measure: direct_message_channels_sum {
    description: "The sum of Direct Message Channels per grouping."
    group_label: "Activity Diagnostics"
    type: number
    sql: SUM(${direct_message_channels}) ;;
  }

  measure: direct_message_channels_max {
    description: "The max of Direct Message Channels per grouping."
    group_label: "Activity Diagnostics"
    type: number
    sql: MAX(${direct_message_channels}) ;;
  }

  measure: direct_message_channels_avg {
    description: "The average Direct Message Channels per grouping."
    group_label: "Activity Diagnostics"
    type: average
    sql: ${direct_message_channels} ;;
    value_format_name: decimal_1
  }

  measure: incoming_webhooks_sum {
    description: "The sum of Incoming Webhooks per grouping."
    group_label: "Activity Diagnostics"
    type: sum
    sql: ${incoming_webhooks} ;;
    drill_fields: [license_server_fact.customer_Name, server_id, incoming_webhooks, outgoing_webhooks, logging_date]
  }

  measure: incoming_webhooks_avg {
    description: "The average Incoming Webhooks per grouping."
    group_label: "Activity Diagnostics"
    type: average
    sql: ${incoming_webhooks} ;;
    value_format_name: decimal_1
  }

  measure: outgoing_webhooks_sum {
    description: "The sum of Outgoing Webhooks per grouping."
    group_label: "Activity Diagnostics"
    type: sum
    sql: ${outgoing_webhooks} ;;
    drill_fields: [license_server_fact.customer_Name, server_id, incoming_webhooks, outgoing_webhooks, logging_date]
  }

  measure: outgoing_webhooks_avg {
    description: "The average Outgoing Webhooks per grouping."
    group_label: "Activity Diagnostics"
    type: average
    sql: ${outgoing_webhooks} ;;
    value_format_name: decimal_1
  }

  measure: posts_sum {
    description: "The sum of Posts performed by all users across all servers per grouping (from activity server telemetry)."
    group_label: "Activity Diagnostics"
    type: number
    sql: SUM(${posts}) ;;
  }

  measure: posts_max {
    description: "The max of Posts performed by all users across all servers per grouping (from activity server telemetry)."
    group_label: "Activity Diagnostics"
    type: number
    sql: MAX(${posts}) ;;
  }

  measure: posts_avg {
    description: "The average Posts per grouping."
    group_label: "Activity Diagnostics"
    type: average
    value_format_name: decimal_1
    sql: ${posts} ;;
  }

  measure: posts_median {
    label: "Posts (Median)"
    description: "The average Posts per grouping."
    group_label: "Activity Diagnostics"
    type: median
    value_format_name: decimal_1
    sql: ${posts} ;;
  }

  measure: posts_previous_day_sum {
    description: "The sum of Posts Previous Day per grouping."
    group_label: "Activity Diagnostics"
    type: sum
    sql: ${posts_previous_day} ;;
  }

  measure: posts_previous_day_avg {
    description: "The average Posts Previous Day per grouping."
    group_label: "Activity Diagnostics"
    type: average
    sql: ${posts_previous_day} ;;
    value_format_name: decimal_1
  }

  measure: private_channels_sum {
    description: "The sum of Private Channels per grouping."
    group_label: "Activity Diagnostics"
    type: number
    sql: SUM(${private_channels}) ;;
  }

  measure: private_channels_max {
    description: "The max of Private Channels per grouping."
    group_label: "Activity Diagnostics"
    type: number
    sql: MAX(${private_channels}) ;;
  }

  measure: private_channels_avg {
    description: "The average Private Channels per grouping."
    group_label: "Activity Diagnostics"
    type: average
    sql: ${private_channels} ;;
    value_format_name: decimal_1
  }

  measure: private_channels_deleted_sum {
    description: "The sum of Private Channels Deleted per grouping."
    group_label: "Activity Diagnostics"
    type: sum
    sql: ${private_channels_deleted} ;;
  }

  measure: private_channels_deleted_avg {
    description: "The average Private Channels Deleted per grouping."
    group_label: "Activity Diagnostics"
    type: average
    sql: ${private_channels_deleted} ;;
    value_format_name: decimal_1
  }

  measure: public_channels_sum {
    description: "The sum of Public Channels per grouping."
    group_label: "Activity Diagnostics"
    type: number
    sql: SUM(${public_channels}) ;;
  }

  measure: public_channels_max {
    description: "The max of Public Channels per grouping."
    group_label: "Activity Diagnostics"
    type: number
    sql: MAX(${public_channels}) ;;
  }

  measure: public_channels_avg {
    description: "The average Public Channels per grouping."
    group_label: "Activity Diagnostics"
    type: average
    sql: ${public_channels} ;;
    value_format_name: decimal_1
  }

  measure: public_channels_deleted_sum {
    description: "The sum of Public Channels Deleted per grouping."
    group_label: "Activity Diagnostics"
    type: sum
    sql: ${public_channels_deleted} ;;
  }

  measure: public_channels_deleted_avg {
    description: "The average Public Channels Deleted per grouping."
    group_label: "Activity Diagnostics"
    type: average
    value_format_name: decimal_1
    sql: ${public_channels_deleted} ;;
  }

  measure: registered_deactivated_users_sum {
    description: "The sum of Registered Deactivated Users per grouping."
    group_label: "Activity Diagnostics"
    type: sum
    value_format_name: decimal_1
    sql: ${registered_deactivated_users} ;;
  }

  measure: registered_deactivated_users_avg {
    description: "The average Registered Deactivated Users per grouping."
    group_label: "Activity Diagnostics"
    type: average
    value_format_name: decimal_1
    sql: ${registered_deactivated_users} ;;
  }

  measure: registered_inactive_users_sum {
    description: "The sum of Registered Inactive Users per grouping."
    group_label: "Activity Diagnostics"
    type: sum
    value_format_name: decimal_1
    sql: ${registered_inactive_users} ;;
  }

  measure: registered_inactive_users_avg {
    description: "The average Registered Inactive Users per grouping."
    group_label: "Activity Diagnostics"
    type: average
    value_format_name: decimal_1
    sql: ${registered_inactive_users} ;;
  }

  measure: registered_users_sum {
    description: "The sum of Registered Users per grouping."
    group_label: "Activity Diagnostics"
    type: number
    value_format_name: decimal_0
    sql: SUM(${registered_users}) ;;
    drill_fields: [license_server_fact.customer_Name, server_id, active_users_daily_sum, active_users_monthly_sum, registered_users_sum, logging_date]
  }

  measure: registered_users_median {
    description: "The median Registered Users per grouping."
    group_label: "Activity Diagnostics"
    type: number
    value_format_name: decimal_0
    sql: median(${registered_users}) ;;
  }

  measure: registered_users_max {
    description: "The max of Registered Users per grouping."
    group_label: "Activity Diagnostics"
    type: number
    value_format_name: decimal_0
    sql: MAX(${registered_users}) ;;
  }

  measure: registered_users_avg {
    description: "The average Registered Users per grouping."
    group_label: "Activity Diagnostics"
    type: average
    value_format_name: decimal_0
    sql: ${registered_users} ;;
  }

  measure: slash_commands_sum {
    description: "The sum of Slash Commands per grouping."
    group_label: "Activity Diagnostics"
    type: sum
    value_format_name: decimal_0
    sql: ${slash_commands} ;;
    drill_fields: [license_server_fact.customer_Name, server_id, slash_commands_sum, logging_date]
  }

  measure: slash_commands_avg {
    description: "The average Slash Commands per grouping."
    group_label: "Activity Diagnostics"
    type: average
    value_format_name: decimal_1
    sql: ${slash_commands} ;;
  }

  measure: teams_sum {
    description: "The sum of Teams per grouping."
    group_label: "Activity Diagnostics"
    type: number
    value_format_name: decimal_0
    sql: SUM(${teams}) ;;
  }

  measure: max_users_per_teams_avg {
    description: "The avg. of maximum users allowed per team associated with an instance per grouping."
    group_label: "Activity Diagnostics"
    type: average
    value_format_name: decimal_1
    sql: ${max_users_per_team} ;;
  }

  measure: max_users_per_teams_median {
    description: "The median maximum users allowed per team associated with an instance per grouping."
    group_label: "Activity Diagnostics"
    type: median
    value_format_name: decimal_0
    sql: ${max_users_per_team} ;;
  }

  measure: teams_avg {
    description: "The average Teams per Instance per grouping."
    group_label: "Activity Diagnostics"
    type: average
    value_format_name: decimal_1
    sql: ${teams} ;;
  }

  measure: teams_median {
    description: "The median Teams per Instance per grouping."
    group_label: "Activity Diagnostics"
    type: median
    value_format_name: decimal_1
    sql: ${teams} ;;
  }

  measure: teams_max {
    description: "The maximum Teams associated with an instance per grouping."
    group_label: "Activity Diagnostics"
    type: max
    value_format_name: decimal_0
    sql: ${teams} ;;
  }

  measure: used_apiv3_count {
    label: "Instances w/ Activity Used Apiv3"
    description: "The count of servers with Activity Used Apiv3 enabled."
    type: count_distinct
    group_label: " Activity Config: Instance Counts"
    sql: case when ${used_apiv3} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: enable_mattermost_apps_count {
    label: "Instances w/ Mattermost Apps Enabled"
    description: "The count of servers with Plugin Mattermost Apps enabled."
    type: count_distinct
    group_label: " Plugins Enabled: Instance Counts"
    sql: case when ${enable_mattermost_apps} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: enable_legacy_sidebar_count {
    label: "Instances w/ Legacy Sidebar"
    description: "The count of servers with Service Legacy Sidebar enabled."
    type: count_distinct
    group_label: " Service Config: Instance Counts"
    sql: case when ${enable_legacy_sidebar} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: enable_circleci_count {
    label: "Instances w/ CircleCI"
    description: "The count of servers with Plugin CircleCI Enabled."
    type: count_distinct
    group_label: " Plugins Enabled: Instance Counts"
    sql: case when ${enable_circleci} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: enable_diceroller_count {
    label: "Instances w/ Dice Roller"
    description: "The count of servers with Plugin Dice Roller enabled."
    type: count_distinct
    group_label: " Plugins Enabled: Instance Counts"
    sql: case when ${enable_diceroller} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }




  measure: restrict_link_previews_count {
    label: "Instances w/ Restrict Link Previews"
    description: "The count of servers with Services Restrict Link Previews Enabled enabled."
    type: count_distinct
    group_label: " Services Config: Instance Counts"
    sql: case when ${restrict_link_previews} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }




  measure: enable_link_previews_count {
    label: "Instances w/ Link Previews Enabled"
    description: "The count of servers with Services Link Previews enabled."
    type: count_distinct
    group_label: " Service Config: Instance Counts"
    sql: case when ${enable_link_previews} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: enable_file_search_count {
    label: "Instances w/ File Search"
    description: "The count of servers with Services File Search enabled."
    type: count_distinct
    group_label: " Service Config: Instance Counts"
    sql: case when ${enable_file_search} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }



  measure: thread_autofollow_count {
    label: "Instances w/ Thread Autofollow"
    description: "The count of servers with Services Thread Autfollow enabled."
    type: count_distinct
    group_label: " Service Config: Instance Counts"
    sql: case when ${thread_autofollow} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: group_teams_count {
    label: "Instances w/ Group Teams"
    description: "The count of servers with >= 1 Group Teams."
    type: count_distinct
    group_label: " Groups Config: Instance Counts"
    sql: case when ${group_team_count} > 0 then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: group_members_count {
      label: "Instances w/ Group Members"
      description: "The count of servers with >= 1 Group Members."
      type: count_distinct
    group_label: " Groups Config: Instance Counts"
      sql: case when ${group_member_count} > 0 then ${server_id} else null end ;;
      drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
    }

  measure: group_channel_count_count {
    label: "Instances w/ Group Channels"
    description: "The count of servers with >= 1 Group Channels created."
    type: count_distinct
    group_label: " Groups Config: Instance Counts"
    sql: case when ${group_channel_count}  > 0 then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: group_synced_team_count_count {
    label: "Instances w/ Group Synced Teams"
    description: "The count of servers with >= 1 Group Synced Teams enabled."
    type: count_distinct
    group_label: " Groups Config: Instance Counts"
    sql: case when ${group_synced_team_count} > 0 then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: group_count_sum {
    label: "Total Groups"
    description: "Total Groups."
    type: sum
    group_label: " Groups Config: Groups Counts"
    sql: ${group_count};;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: group_member_count_sum {
    label: "Total Group Members"
    description: "Total Group members."
    type: sum
    group_label: " Groups Config: Groups Member Counts"
    sql: ${group_member_count};;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: distinct_group_member_count_sum {
    label: "Total Distinct Group Members"
    description: "Total Distinct Group members."
    type: sum
    group_label: " Groups Config: Groups Member Counts"
    sql: ${distinct_group_member_count};;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: group_count_with_allow_reference_sum {
    label: "Total Groups with Allow Reference"
    description: "Total Groups with Allow Reference."
    type: sum
    group_label: " Groups Config: Groups Counts"
    sql: ${group_count_with_allow_reference};;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: ldap_group_count_sum {
    label: "Total LDAP Groups"
    description: "Total LDAP Groups."
    type: sum
    group_label: " Groups Config: Groups Counts"
    sql: ${ldap_group_count};;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: custom_group_count_sum {
    label: "Total Custom Groups"
    description: "Total Custom Groups."
    type: sum
    group_label: " Groups Config: Groups Counts"
    sql: ${custom_group_count};;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: group_count_count {
    label: "Instances w/ Groups"
    description: "The count of servers with >= 1 Groups created."
    type: count_distinct
    group_label: " Groups Config: Instance Counts"
    sql: case when ${group_count} > 0 then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: group_synced_channel_count_count {
    label: "Instances w/ Group Synced Channels"
    description: "The count of servers with >= 1 Group Synced Channels enabled."
    type: count_distinct
    group_label: " Groups Config: Instance Counts"
    sql: case when ${group_synced_channel_count} > 0 then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: group_count_with_allow_reference_count {
    label: "Instances w/ Groups Allow Reference"
    description: "The count of servers with >= 1 Groups w/ Allow Reference enabled."
    type: count_distinct
    group_label: " Groups Config: Instance Counts"
    sql: case when ${group_count_with_allow_reference} > 0 then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: isdefault_max_users_for_statistics_count {
    label: "Instances w/ Isdefault Max Users For Statistics"
    description: "The count of servers with Analytics Isdefault Max Users For Statistics enabled."
    type: count_distinct
    group_label: " Analytics Config: Instance Counts"
    sql: case when ${isdefault_max_users_for_statistics} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: allow_banner_dismissal_count {
    label: "Instances w/ Allow Banner Dismissal"
    description: "The count of servers with Annoucument Allow Banner Dismissal enabled."
    type: count_distinct
    group_label: " Announcement Config: Instance Counts"
    sql: case when ${allow_banner_dismissal} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: enable_banner_count {
    label: "Instances w/ Annoucument Banner"
    description: "The count of servers with Annoucument Enable Banner enabled."
    type: count_distinct
    group_label: " Announcement Config: Instance Counts"
    sql: case when ${enable_banner} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: isdefault_banner_color_count {
    label: "Instances w/ Isdefault Banner Color"
    description: "The count of servers with Annoucument Isdefault Banner Color enabled."
    type: count_distinct
    group_label: " Announcement Config: Instance Counts"
    sql: case when ${isdefault_banner_color} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: isdefault_banner_text_color_count {
    label: "Instances w/ Isdefault Banner Text Color"
    description: "The count of servers with Annoucument Isdefault Banner Text Color enabled."
    type: count_distinct
    group_label: " Announcement Config: Instance Counts"
    sql: case when ${isdefault_banner_text_color} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: enable_apiv3_client_count {
    label: "Instances w/ Apiv3 Client"
    description: "The count of servers with Client Requirements Enable Apiv3 Client enabled."
    type: count_distinct
    group_label: " Client Requirements Config: Instance Counts"
    sql: case when ${enable_apiv3_client} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: enable_channel_viewed_messages_client_count {
    label: "Instances w/ Channel Viewed Messages Client"
    description: "The count of servers with Client Requirements Enable Channel Viewed Messages Client enabled."
    type: count_distinct
    group_label: " Client Requirements Config: Instance Counts"
    sql: case when ${enable_channel_viewed_messages_client} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: enable_commands_client_count {
    label: "Instances w/ Commands Client"
    description: "The count of servers with Client Requirements Enable Commands Client enabled."
    type: count_distinct
    group_label: " Client Requirements Config: Instance Counts"
    sql: case when ${enable_commands_client} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: enable_custom_emoji_client_count {
    label: "Instances w/ Custom Emoji Client"
    description: "The count of servers with Client Requirements Enable Custom Emoji Client enabled."
    type: count_distinct
    group_label: " Client Requirements Config: Instance Counts"
    sql: case when ${enable_custom_emoji_client} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: enable_developer_client_count {
    label: "Instances w/ Developer Client"
    description: "The count of servers with Client Requirements Enable Developer Client enabled."
    type: count_distinct
    group_label: " Client Requirements Config: Instance Counts"
    sql: case when ${enable_developer_client} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: enable_emoji_picker_client_count {
    label: "Instances w/ Emoji Picker Client"
    description: "The count of servers with Client Requirements Enable Emoji Picker Client enabled."
    type: count_distinct
    group_label: " Client Requirements Config: Instance Counts"
    sql: case when ${enable_emoji_picker_client} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: enable_incoming_webhooks_client_count {
    label: "Instances w/ Incoming Webhooks Client"
    description: "The count of servers with Client Requirements Enable Incoming Webhooks Client enabled."
    type: count_distinct
    group_label: " Client Requirements Config: Instance Counts"
    sql: case when ${enable_incoming_webhooks_client} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: enable_insecure_outgoing_connections_client_count {
    label: "Instances w/ Insecure Outgoing Connections Client"
    description: "The count of servers with Client Requirements Enable Insecure Outgoing Connections Client enabled."
    type: count_distinct
    group_label: " Client Requirements Config: Instance Counts"
    sql: case when ${enable_insecure_outgoing_connections_client} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: enable_multifactor_authentication_client_count {
    label: "Instances w/ Multifactor Authentication Client"
    description: "The count of servers with Client Requirements Enable Multifactor Authentication Client enabled."
    type: count_distinct
    group_label: " Client Requirements Config: Instance Counts"
    sql: case when ${enable_multifactor_authentication_client} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: enable_oauth_service_provider_client_count {
    label: "Instances w/ OAuth Service Provider Client"
    description: "The count of servers with Client Requirements Enable OAuth Service Provider Client enabled."
    type: count_distinct
    group_label: " Client Requirements Config: Instance Counts"
    sql: case when ${enable_oauth_service_provider_client} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: enable_only_admin_integrations_client_count {
    label: "Instances w/ Only Admin Integrations Client"
    description: "The count of servers with Client Requirements Enable Only Admin Integrations Client enabled."
    type: count_distinct
    group_label: " Client Requirements Config: Instance Counts"
    sql: case when ${enable_only_admin_integrations_client} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: advertise_address_count {
    label: "Instances w/ Advertise Address"
    description: "The count of servers with Cluster Advertise Address enabled."
    type: count_distinct
    group_label: " Cluster Config: Instance Counts"
    sql: case when ${advertise_address} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: enable_gossip_encryption_count {
    label: "Instances w/ Gossip Encryption"
    description: "The count of servers with Gossip Encryption enabled."
    type: count_distinct
    group_label: " Cluster Config: Instance Counts"
    sql: case when ${enable_experimental_gossip_encryption} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: bind_address_count {
    label: "Instances w/ Bind Address"
    description: "The count of servers with Cluster Bind Address enabled."
    type: count_distinct
    group_label: " Cluster Config: Instance Counts"
    sql: case when ${bind_address} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: enable_cluster_count {
    label: "Instances w/ Cluster Enabled"
    description: "The count of servers with Cluster Enable Cluster enabled."
    type: count_distinct
    group_label: " Cluster Config: Instance Counts"
    sql: case when ${enable_cluster} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: network_interface_count {
    label: "Instances w/ Network Interface"
    description: "The count of servers with Cluster Network Interface enabled."
    type: count_distinct
    group_label: " Cluster Config: Instance Counts"
    sql: case when ${network_interface} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: read_only_config_count {
    label: "Instances w/ Read Only Config"
    description: "The count of servers with Cluster Read Only Config enabled."
    type: count_distinct
    group_label: " Cluster Config: Instance Counts"
    sql: case when ${read_only_config} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: use_experimental_gossip_count {
    label: "Instances w/ Use Experimental Gossip"
    description: "The count of servers with Cluster Use Experimental Gossip enabled."
    type: count_distinct
    group_label: " Cluster Config: Instance Counts"
    sql: case when ${use_experimental_gossip} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: use_ip_address_count {
    label: "Instances w/ Use Ip Address"
    description: "The count of servers with Cluster Use Ip Address enabled."
    type: count_distinct
    group_label: " Cluster Config: Instance Counts"
    sql: case when ${use_ip_address} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: enable_compliance_count {
    label: "Instances w/ Compliance Enabled"
    description: "The count of servers with Compliance Enable Compliance enabled."
    type: count_distinct
    group_label: " Compliance Config: Instance Counts"
    sql: case when ${enable_compliance} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: enable_compliance_daily_count {
    label: "Instances w/ Enable Compliance Daily"
    description: "The count of servers with Compliance Enable Compliance Daily enabled."
    type: count_distinct
    group_label: " Compliance Config: Instance Counts"
    sql: case when ${enable_compliance_daily} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: message_retention_days_sum {
    description: "The sum of Message Retention Days per grouping."
    group_label: "Data Retention Configuration"
    type: sum
    sql: ${message_retention_days} ;;
  }

  measure: message_retention_days_avg {
    description: "The average Message Retention Days per grouping."
    group_label: "Data Retention Configuration"
    type: average
    sql: ${message_retention_days} ;;
  }

  measure: file_retention_days_sum {
    description: "The sum of File Retention Days per grouping."
    group_label: "Data Retention Configuration"
    type: sum
    sql: ${file_retention_days} ;;
  }

  measure: file_retention_days_avg {
    description: "The average File Retention Days per grouping."
    group_label: "Data Retention Configuration"
    type: average
    sql: ${file_retention_days} ;;
  }

  measure: enable_message_deletion_count {
    label: "Instances w/ Enable Message Deletion"
    description: "The count of servers with Data Retention Enable Message Deletion enabled."
    type: count_distinct
    group_label: " Data Retention Config: Instance Counts"
    sql: case when ${enable_message_deletion} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: enable_file_deletion_count {
    label: "Instances w/ Enable File Deletion"
    description: "The count of servers with Data Retention Enable File Deletion enabled."
    type: count_distinct
    group_label: " Data Retention Config: Instance Counts"
    sql: case when ${enable_file_deletion} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: experimental_timezone_count {
    label: "Instances w/ Experimental Timezone"
    description: "The count of servers with Display Experimental Timezone enabled."
    type: count_distinct
    group_label: " Display Config: Instance Counts"
    sql: case when ${experimental_timezone} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: isdefault_custom_url_schemes_count {
    label: "Instances w/ Isdefault Custom URL Schemes"
    description: "The count of servers with Display Isdefault Custom URL Schemes enabled."
    type: count_distinct
    group_label: " Display Config: Instance Counts"
    sql: case when ${isdefault_custom_url_schemes} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: enable_autocomplete_count {
    label: "Instances w/ Enable Autocomplete"
    description: "The count of servers with ElasticSearch Enable Autocomplete enabled."
    type: count_distinct
    group_label: " ElasticSearch Config: Instance Counts"
    sql: case when ${enable_autocomplete} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: enable_indexing_count {
    label: "Instances w/ Enable Indexing"
    description: "The count of servers with ElasticSearch Enable Indexing enabled."
    type: count_distinct
    group_label: " ElasticSearch Config: Instance Counts"
    sql: case when ${enable_indexing} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: enable_searching_count {
    label: "Instances w/ Enable Searching"
    description: "The count of servers with ElasticSearch Enable Searching enabled."
    type: count_distinct
    group_label: " ElasticSearch Config: Instance Counts"
    sql: case when ${enable_searching} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: isdefault_connection_url_count {
    label: "Instances w/ Isdefault Connection URL"
    description: "The count of servers with ElasticSearch Isdefault Connection URL enabled."
    type: count_distinct
    group_label: " ElasticSearch Config: Instance Counts"
    sql: case when ${isdefault_connection_url} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: isdefault_index_prefix_count {
    label: "Instances w/ Isdefault Index Prefix"
    description: "The count of servers with ElasticSearch Isdefault Index Prefix enabled."
    type: count_distinct
    group_label: " ElasticSearch Config: Instance Counts"
    sql: case when ${isdefault_index_prefix} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: isdefault_password_count {
    label: "Instances w/ Isdefault Password"
    description: "The count of servers with ElasticSearch Isdefault Password enabled."
    type: count_distinct
    group_label: " ElasticSearch Config: Instance Counts"
    sql: case when ${isdefault_password} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: isdefault_username_count {
    label: "Instances w/ Isdefault Username"
    description: "The count of servers with ElasticSearch Isdefault Username enabled."
    type: count_distinct
    group_label: " ElasticSearch Config: Instance Counts"
    sql: case when ${isdefault_username} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: live_indexing_batch_size_sum {
    description: "The sum of Live Indexing Batch Size per grouping."
    group_label: "ElasticSearch Configuration"
    type: sum
    sql: ${live_indexing_batch_size} ;;
  }

  measure: live_indexing_batch_size_avg {
    description: "The average Live Indexing Batch Size per grouping."
    group_label: "ElasticSearch Configuration"
    type: average
    sql: ${live_indexing_batch_size} ;;
  }

  measure: skip_tls_verification_count {
    label: "Instances w/ Skip TLS Verification"
    description: "The count of servers with ElasticSearch Skip TLS Verification enabled."
    type: count_distinct
    group_label: " ElasticSearch Config: Instance Counts"
    sql: case when ${skip_tls_verification} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: sniff_count {
    label: "Instances w/ Sniff"
    description: "The count of servers with ElasticSearch Sniff enabled."
    type: count_distinct
    group_label: " ElasticSearch Config: Instance Counts"
    sql: case when ${sniff} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: enable_email_batching_count {
    label: "Instances w/ Enable Email Batching"
    description: "The count of servers with Email Enable Email Batching enabled."
    type: count_distinct
    group_label: " Email Config: Instance Counts"
    sql: case when ${enable_email_batching} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: enable_preview_mode_banner_count {
    label: "Instances w/ Enable Preview Mode Banner"
    description: "The count of servers with Email Enable Preview Mode Banner enabled."
    type: count_distinct
    group_label: " Email Config: Instance Counts"
    sql: case when ${enable_preview_mode_banner} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: enable_sign_in_with_email_count {
    label: "Instances w/ Enable Sign In With Email"
    description: "The count of servers with Email Enable Sign In With Email enabled."
    type: count_distinct
    group_label: " Email Config: Instance Counts"
    sql: case when ${enable_sign_in_with_email} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: enable_sign_in_with_username_count {
    label: "Instances w/ Enable Sign In With Username"
    description: "The count of servers with Email Enable Sign In With Username enabled."
    type: count_distinct
    group_label: " Email Config: Instance Counts"
    sql: case when ${enable_sign_in_with_username} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: enable_sign_up_with_email_count {
    label: "Instances w/ Enable Sign Up With Email"
    description: "The count of servers with Email Enable Sign Up With Email enabled."
    type: count_distinct
    group_label: " Email Config: Instance Counts"
    sql: case when ${enable_sign_up_with_email} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: enable_smtp_auth_count {
    label: "Instances w/ Enable Smtp Auth"
    description: "The count of servers with Email Enable Smtp Auth enabled."
    type: count_distinct
    group_label: " Email Config: Instance Counts"
    sql: case when ${enable_smtp_auth} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: isdefault_feedback_email_count {
    label: "Instances w/ Isdefault Feedback Email"
    description: "The count of servers with Email Isdefault Feedback Email enabled."
    type: count_distinct
    group_label: " Email Config: Instance Counts"
    sql: case when ${isdefault_feedback_email} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: isdefault_feedback_name_count {
    label: "Instances w/ Isdefault Feedback Name"
    description: "The count of servers with Email Isdefault Feedback Name enabled."
    type: count_distinct
    group_label: " Email Config: Instance Counts"
    sql: case when ${isdefault_feedback_name} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: isdefault_feedback_organization_count {
    label: "Instances w/ Isdefault Feedback Organization"
    description: "The count of servers with Email Isdefault Feedback Organization enabled."
    type: count_distinct
    group_label: " Email Config: Instance Counts"
    sql: case when ${isdefault_feedback_organization} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: isdefault_login_button_border_color_email_count {
    label: "Instances w/ Isdefault Login Button Border Color Email"
    description: "The count of servers with Email Isdefault Login Button Border Color Email enabled."
    type: count_distinct
    group_label: " Email Config: Instance Counts"
    sql: case when ${isdefault_login_button_border_color_email} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: isdefault_login_button_color_email_count {
    label: "Instances w/ Isdefault Login Button Color Email"
    description: "The count of servers with Email Isdefault Login Button Color Email enabled."
    type: count_distinct
    group_label: " Email Config: Instance Counts"
    sql: case when ${isdefault_login_button_color_email} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: isdefault_login_button_text_color_email_count {
    label: "Instances w/ Isdefault Login Button Text Color Email"
    description: "The count of servers with Email Isdefault Login Button Text Color Email enabled."
    type: count_distinct
    group_label: " Email Config: Instance Counts"
    sql: case when ${isdefault_login_button_text_color_email} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: isdefault_reply_to_address_count {
    label: "Instances w/ Isdefault Reply To Address"
    description: "The count of servers with Email Isdefault Reply To Address enabled."
    type: count_distinct
    group_label: " Email Config: Instance Counts"
    sql: case when ${isdefault_reply_to_address} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: require_email_verification_count {
    label: "Instances w/ Require Email Verification"
    description: "The count of servers with Email Require Email Verification enabled."
    type: count_distinct
    group_label: " Email Config: Instance Counts"
    sql: case when ${require_email_verification} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: send_email_notifications_count {
    label: "Instances w/ Send Email Notifications"
    description: "The count of servers with Email Send Email Notifications enabled."
    type: count_distinct
    group_label: " Email Config: Instance Counts"
    sql: case when ${send_email_notifications} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: send_push_notifications_count {
    label: "Instances w/ Send Push Notifications"
    description: "The count of servers with Email Send Push Notifications enabled."
    type: count_distinct
    group_label: " Email Config: Instance Counts"
    sql: case when ${send_push_notifications} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: skip_server_certificate_verification_count {
    label: "Instances w/ Skip Server Certificate Verification"
    description: "The count of servers with Email Skip Server Certificate Verification enabled."
    type: count_distinct
    group_label: " Email Config: Instance Counts"
    sql: case when ${skip_server_certificate_verification} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: use_channel_in_email_notifications_count {
    label: "Instances w/ Use Channel In Email Notifications"
    description: "The count of servers with Email Use Channel In Email Notifications enabled."
    type: count_distinct
    group_label: " Email Config: Instance Counts"
    sql: case when ${use_channel_in_email_notifications} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: client_side_cert_enable_count {
    label: "Instances w/ Client Side Cert Enable"
    description: "The count of servers with Experimental Client Side Cert Enable enabled."
    type: count_distinct
    group_label: " Experimental Config: Instance Counts"
    sql: case when ${client_side_cert_enable} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: enable_click_to_reply_count {
    label: "Instances w/ Enable Click To Reply"
    description: "The count of servers with Experimental Enable Click To Reply enabled."
    type: count_distinct
    group_label: " Experimental Config: Instance Counts"
    sql: case when ${enable_click_to_reply} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: enable_post_metadata_count {
    label: "Instances w/ Enable Post Metadata"
    description: "The count of servers with Experimental Enable Post Metadata enabled."
    type: count_distinct
    group_label: " Experimental Config: Instance Counts"
    sql: case when ${enable_post_metadata} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: isdefault_client_side_cert_check_count {
    label: "Instances w/ Isdefault Client Side Cert Check"
    description: "The count of servers with Experimental Isdefault Client Side Cert Check enabled."
    type: count_distinct
    group_label: " Experimental Config: Instance Counts"
    sql: case when ${isdefault_client_side_cert_check} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: restrict_system_admin_count {
    label: "Instances w/ Restrict System Admin"
    description: "The count of servers with Experimental Restrict System Admin enabled."
    type: count_distinct
    group_label: " Experimental Config: Instance Counts"
    sql: case when ${restrict_system_admin} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: use_new_saml_library_count {
    label: "Instances w/ Use New SAML Library"
    description: "The count of servers with Experimental Use New SAML Library enabled."
    type: count_distinct
    group_label: " Experimental Config: Instance Counts"
    sql: case when ${use_new_saml_library} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: enable_experimental_extensions_count {
    label: "Instances w/ Experimental Extensions"
    description: "The count of servers with Extension Enable Experimental Extensions enabled."
    type: count_distinct
    group_label: " Experimental Config: Instance Counts"
    sql: case when ${enable_experimental_extensions} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: amazon_s3_signv2_count {
    label: "Instances w/ Amazon S3 Signv2"
    description: "The count of servers with File Amazon S3 Signv2 enabled."
    type: count_distinct
    group_label: " File Config: Instance Counts"
    sql: case when ${amazon_s3_signv2} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: amazon_s3_sse_count {
    label: "Instances w/ Amazon S3 Sse"
    description: "The count of servers with File Amazon S3 Sse enabled."
    type: count_distinct
    group_label: " File Config: Instance Counts"
    sql: case when ${amazon_s3_sse} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: amazon_s3_ssl_count {
    label: "Instances w/ File Amazon S3 Ssl"
    description: "The count of servers with File Amazon S3 Ssl enabled."
    type: count_distinct
    group_label: " File Config: Instance Counts"
    sql: case when ${amazon_s3_ssl} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: amazon_s3_trace_count {
    label: "Instances w/ File Amazon S3 Trace"
    description: "The count of servers with File Amazon S3 Trace enabled."
    type: count_distinct
    group_label: " File Config: Instance Counts"
    sql: case when ${amazon_s3_trace} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: enable_remote_cluster_count {
    label: "Instances w/ Remote Cluster"
    description: "The count of servers with Experimental Remote Cluster enabled."
    type: count_distinct
    group_label: " Remote Cluster Config: Instance Counts"
    sql: case when ${enable_remote_cluster} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: extract_content_count {
    label: "Instances w/ Extract Content"
    description: "The count of servers with File Extract Content enabled."
    type: count_distinct
    group_label: " File Config: Instance Counts"
    sql: case when ${extract_content} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: archive_recursion_count {
    label: "Instances w/ Archive Recursion"
    description: "The count of servers with File Archive Recursion enabled."
    type: count_distinct
    group_label: " File Config: Instance Counts"
    sql: case when ${archive_recursion} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: enable_file_attachments_count {
    label: "Instances w/ File Attachments"
    description: "The count of servers with File Enable File Attachments enabled."
    type: count_distinct
    group_label: " File Config: Instance Counts"
    sql: case when ${enable_file_attachments} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: enable_mobile_download_count {
    label: "Instances w/ Mobile Download"
    description: "The count of servers with File Enable Mobile Download enabled."
    type: count_distinct
    group_label: " File Config: Instance Counts"
    sql: case when ${enable_mobile_download} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: enable_mobile_upload_count {
    label: "Instances w/ Mobile Upload"
    description: "The count of servers with File Enable Mobile Upload enabled."
    type: count_distinct
    group_label: " File Config: Instance Counts"
    sql: case when ${enable_mobile_upload} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: enable_public_links_count {
    label: "Instances w/ Public Links"
    description: "The count of servers with File Enable Public Links enabled."
    type: count_distinct
    group_label: " File Config: Instance Counts"
    sql: case when ${enable_public_links} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: isabsolute_directory_count {
    label: "Instances w/ Isabsolute Directory"
    description: "The count of servers with File Isabsolute Directory enabled."
    type: count_distinct
    group_label: " File Config: Instance Counts"
    sql: case when ${isabsolute_directory} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: isdefault_directory_count {
    label: "Instances w/ Isdefault Directory"
    description: "The count of servers with File Isdefault Directory enabled."
    type: count_distinct
    group_label: " File Config: Instance Counts"
    sql: case when ${isdefault_directory} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: allow_email_accounts_count {
    label: "Instances w/ Allow Email Accounts"
    description: "The count of servers with Guest Account Allow Email Accounts enabled."
    type: count_distinct
    group_label: " Guest Account Config: Instance Counts"
    sql: case when ${allow_email_accounts} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: enable_guest_accounts_count {
    label: "Instances w/ Enable Guest Accounts"
    description: "The count of servers with Guest Account Enable Guest Accounts enabled."
    type: count_distinct
    group_label: " Guest Account Config: Instance Counts"
    sql: case when ${enable_guest_accounts} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: enforce_multifactor_authentication_guest_count {
    label: "Instances w/ Enforce Multifactor Authentication Guest"
    description: "The count of servers with Guest Account Enforce Multifactor Authentication Guest enabled."
    type: count_distinct
    group_label: " Guest Account Config: Instance Counts"
    sql: case when ${enforce_multifactor_authentication_guest} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: isdefault_restrict_creation_to_domains_count {
    label: "Instances w/ Isdefault Restrict Creation To Domains"
    description: "The count of servers with Guest Account Isdefault Restrict Creation To Domains enabled."
    type: count_distinct
    group_label: " Guest Account Config: Instance Counts"
    sql: case when ${isdefault_restrict_creation_to_domains} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: enable_image_proxy_count {
    label: "Instances w/ Image Proxy Enabled"
    description: "The count of servers with Image Proxy Enable Image Proxy enabled."
    type: count_distinct
    group_label: " LDAP Config: Instance Counts"
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
    sql: case when ${enable_image_proxy} then ${server_id} else null end ;;
  }

  measure: isdefault_remote_image_proxy_options_count {
    label: "Instances w/ Isdefault Remote Image Proxy Options"
    description: "The count of servers with Image Proxy Isdefault Remote Image Proxy Options enabled."
    type: count_distinct
    group_label: " LDAP Config: Instance Counts"
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
    sql: case when ${isdefault_remote_image_proxy_options} then ${server_id} else null end ;;
  }

  measure: isdefault_remote_image_proxy_url_count {
    label: "Instances w/ Isdefault Remote Image Proxy URL"
    description: "The count of servers with Image Proxy Isdefault Remote Image Proxy URL enabled."
    type: count_distinct
    group_label: " Image Proxy Config: Instance Counts"
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
    sql: case when ${isdefault_remote_image_proxy_url} then ${server_id} else null end ;;
  }

  measure: enable_ldap_count {
    label: "Instances w/ LDAP Enabled"
    description: "The count of servers with LDAP Enable LDAP enabled."
    type: count_distinct
    group_label: " LDAP Config: Instance Counts"
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
    sql: case when ${enable_ldap} then ${server_id} else null end ;;
  }

  measure: enable_admin_filter_count {
    label: "Instances w/ Admin Filter"
    description: "The count of servers with LDAP Enable Admin Filter enabled."
    type: count_distinct
    group_label: " LDAP Config: Instance Counts"
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
    sql: case when ${enable_admin_filter} then ${server_id} else null end ;;
  }

  measure: enable_sync_count {
    label: "Instances w/ LDAP Sync"
    description: "The count of servers with LDAP Enable Sync enabled."
    type: count_distinct
    group_label: " LDAP Config: Instance Counts"
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
    sql: case when ${enable_sync} then ${server_id} else null end ;;
  }

  measure: isdefault_email_attribute_ldap_count {
    label: "Instances w/ Isdefault Email Attribute LDAP"
    description: "The count of servers with LDAP Isdefault Email Attribute LDAP enabled."
    type: count_distinct
    group_label: " LDAP Config: Instance Counts"
    sql: case when ${isdefault_email_attribute_ldap} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: isdefault_first_name_attribute_ldap_count {
    label: "Instances w/ Isdefault First Name Attribute LDAP"
    description: "The count of servers with LDAP Isdefault First Name Attribute LDAP enabled."
    type: count_distinct
    group_label: " LDAP Config: Instance Counts"
    sql: case when ${isdefault_first_name_attribute_ldap} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: isdefault_group_display_name_attribute_count {
    label: "Instances w/ Isdefault Group Display Name Attribute"
    description: "The count of servers with LDAP Isdefault Group Display Name Attribute enabled."
    type: count_distinct
    group_label: " LDAP Config: Instance Counts"
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
    sql: case when ${isdefault_group_display_name_attribute} then ${server_id} else null end ;;
  }

  measure: isdefault_group_id_attribute_count {
    label: "Instances w/ Isdefault Group Id Attribute"
    description: "The count of servers with LDAP Isdefault Group Id Attribute enabled."
    type: count_distinct
    group_label: " LDAP Config: Instance Counts"
    sql: case when ${isdefault_group_id_attribute} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: isdefault_id_attribute_ldap_count {
    label: "Instances w/ Isdefault Id Attribute LDAP"
    description: "The count of servers with LDAP Isdefault Id Attribute LDAP enabled."
    type: count_distinct
    group_label: " LDAP Config: Instance Counts"
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
    sql: case when ${isdefault_id_attribute_ldap} then ${server_id} else null end ;;
  }

  measure: isdefault_last_name_attribute_ldap_count {
    label: "Instances w/ Isdefault Last Name Attribute LDAP"
    description: "The count of servers with LDAP Isdefault Last Name Attribute LDAP enabled."
    type: count_distinct
    group_label: " LDAP Config: Instance Counts"
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
    sql: case when ${isdefault_last_name_attribute_ldap} then ${server_id} else null end ;;
  }

  measure: isdefault_login_button_border_color_ldap_count {
    label: "Instances w/ Isdefault Login Button Border Color LDAP"
    description: "The count of servers with LDAP Isdefault Login Button Border Color LDAP enabled."
    type: count_distinct
    group_label: " LDAP Config: Instance Counts"
    sql: case when ${isdefault_login_button_border_color_ldap} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: isdefault_login_button_color_ldap_count {
    label: "Instances w/ Isdefault Login Button Color LDAP"
    description: "The count of servers with LDAP Isdefault Login Button Color LDAP enabled."
    type: count_distinct
    group_label: " LDAP Config: Instance Counts"
    sql: case when ${isdefault_login_button_color_ldap} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: isdefault_login_button_text_color_ldap_count {
    label: "Instances w/ Isdefault Login Button Text Color LDAP"
    description: "The count of servers with LDAP Isdefault Login Button Text Color LDAP enabled."
    type: count_distinct
    group_label: " LDAP Config: Instance Counts"
    sql: case when ${isdefault_login_button_text_color_ldap} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: isdefault_login_field_name_count {
    label: "Instances w/ Isdefault Login Field Name"
    description: "The count of servers with LDAP Isdefault Login Field Name enabled."
    type: count_distinct
    group_label: " LDAP Config: Instance Counts"
    sql: case when ${isdefault_login_field_name} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: isdefault_login_id_attribute_count {
    label: "Instances w/ Isdefault Login Id Attribute"
    description: "The count of servers with LDAP Isdefault Login Id Attribute enabled."
    type: count_distinct
    group_label: " LDAP Config: Instance Counts"
    sql: case when ${isdefault_login_id_attribute} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: isdefault_nickname_attribute_ldap_count {
    label: "Instances w/ Isdefault Nickname Attribute LDAP"
    description: "The count of servers with LDAP Isdefault Nickname Attribute LDAP enabled."
    type: count_distinct
    group_label: " LDAP Config: Instance Counts"
    sql: case when ${isdefault_nickname_attribute_ldap} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: isdefault_position_attribute_ldap_count {
    label: "Instances w/ Isdefault Position Attribute LDAP"
    description: "The count of servers with LDAP Isdefault Position Attribute LDAP enabled."
    type: count_distinct
    group_label: " LDAP Config: Instance Counts"
    sql: case when ${isdefault_position_attribute_ldap} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: isdefault_username_attribute_ldap_count {
    label: "Instances w/ Isdefault Username Attribute LDAP"
    description: "The count of servers with LDAP Isdefault Username Attribute LDAP enabled."
    type: count_distinct
    group_label: " LDAP Config: Instance Counts"
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
    sql: case when ${isdefault_username_attribute_ldap} then ${server_id} else null end ;;
  }

  measure: isempty_admin_filter_count {
    label: "Instances w/ Isempty Admin Filter"
    description: "The count of servers with LDAP Isempty Admin Filter enabled."
    type: count_distinct
    group_label: " LDAP Config: Instance Counts"
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
    sql: case when ${isempty_admin_filter} then ${server_id} else null end ;;
  }

  measure: isempty_group_filter_count {
    label: "Instances w/ Isempty Group Filter"
    description: "The count of servers with LDAP Isempty Group Filter enabled."
    type: count_distinct
    group_label: " LDAP Config: Instance Counts"
    sql: case when ${isempty_group_filter} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: isempty_guest_filter_count {
    label: "Instances w/ Isempty Guest Filter"
    description: "The count of servers with LDAP Isempty Guest Filter enabled."
    type: count_distinct
    group_label: " LDAP Config: Instance Counts"
    sql: case when ${isempty_guest_filter} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: skip_certificate_verification_count {
    label: "Instances w/ Skip Certificate Verification"
    description: "The count of servers with LDAP Skip Certificate Verification enabled."
    type: count_distinct
    group_label: " LDAP Config: Instance Counts"
    sql: case when ${skip_certificate_verification} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: feature_cluster_count {
    label: "Instances w/ Feature Cluster"
    description: "The count of servers with License Feature Cluster enabled."
    type: count_distinct
    group_label: " License Config: Instance Counts"
    sql: case when ${feature_cluster} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: feature_compliance_count {
    label: "Instances w/ Feature Compliance"
    description: "The count of servers with License Feature Compliance enabled."
    type: count_distinct
    group_label: " License Config: Instance Counts"
    sql: case when ${feature_compliance} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: feature_custom_brand_count {
    label: "Instances w/ Feature Custom Brand"
    description: "The count of servers with License Feature Custom Brand enabled."
    type: count_distinct
    group_label: " License Config: Instance Counts"
    sql: case when ${feature_custom_brand} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: feature_custom_permissions_schemes_count {
    label: "Instances w/ Feature Custom Permissions Schemes"
    description: "The count of servers with License Feature Custom Permissions Schemes enabled."
    type: count_distinct
    group_label: " License Config: Instance Counts"
    sql: case when ${feature_custom_permissions_schemes} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: feature_data_retention_count {
    label: "Instances w/ Feature Data Retention"
    description: "The count of servers with License Feature Data Retention enabled."
    type: count_distinct
    group_label: " License Config: Instance Counts"
    sql: case when ${feature_data_retention} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: feature_elastic_search_count {
    label: "Instances w/ Feature Elastic Search"
    description: "The count of servers with License Feature Elastic Search enabled."
    type: count_distinct
    group_label: " License Config: Instance Counts"
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
    sql: case when ${feature_elastic_search} then ${server_id} else null end ;;
  }

  measure: feature_email_notification_contents_count {
    label: "Instances w/ Feature Email Notification Contents"
    description: "The count of servers with License Feature Email Notification Contents enabled."
    type: count_distinct
    group_label: " License Config: Instance Counts"
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
    sql: case when ${feature_email_notification_contents} then ${server_id} else null end ;;
  }

  measure: feature_future_count {
    label: "Instances w/ Feature Future"
    description: "The count of servers with License Feature Future enabled."
    type: count_distinct
    group_label: " License Config: Instance Counts"
    sql: case when ${feature_future} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: feature_google_count {
    label: "Instances w/ Feature Google"
    description: "The count of servers with License Feature Google enabled."
    type: count_distinct
    group_label: " License Config: Instance Counts"
    sql: case when ${feature_google} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: feature_guest_accounts_count {
    label: "Instances w/ Feature Guest Accounts"
    description: "The count of servers with License Feature Guest Accounts enabled."
    type: count_distinct
    group_label: " License Config: Instance Counts"
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
    sql: case when ${feature_guest_accounts} then ${server_id} else null end ;;
  }

  measure: feature_guest_accounts_permissions_count {
    label: "Instances w/ Feature Guest Accounts Permissions"
    description: "The count of servers with License Feature Guest Accounts Permissions enabled."
    type: count_distinct
    group_label: " License Config: Instance Counts"
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
    sql: case when ${feature_guest_accounts_permissions} then ${server_id} else null end ;;
  }

  measure: feature_id_loaded_count {
    label: "Instances w/ Feature Id Loaded"
    description: "The count of servers with License Feature Id Loaded enabled."
    type: count_distinct
    group_label: " License Config: Instance Counts"
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
    sql: case when ${feature_id_loaded} then ${server_id} else null end ;;
  }

  measure: feature_ldap_count {
    label: "Instances w/ Feature LDAP"
    description: "The count of servers with License Feature LDAP enabled."
    type: count_distinct
    group_label: " License Config: Instance Counts"
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
    sql: case when ${feature_ldap} then ${server_id} else null end ;;
  }

  measure: feature_ldap_groups_count {
    label: "Instances w/ Feature LDAP Groups"
    description: "The count of servers with License Feature LDAP Groups enabled."
    type: count_distinct
    group_label: " License Config: Instance Counts"
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
    sql: case when ${feature_ldap_groups} then ${server_id} else null end ;;
  }

  measure: feature_lock_teammate_name_display_count {
    label: "Instances w/ Feature Lock Teammate Name Display"
    description: "The count of servers with License Feature Lock Teammate Name Display enabled."
    type: count_distinct
    group_label: " License Config: Instance Counts"
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
    sql: case when ${feature_lock_teammate_name_display} then ${server_id} else null end ;;
  }

  measure: feature_message_export_count {
    label: "Instances w/ Feature Message Export"
    description: "The count of servers with License Feature Message Export enabled."
    type: count_distinct
    group_label: " License Config: Instance Counts"
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
    sql: case when ${feature_message_export} then ${server_id} else null end ;;
  }

  measure: feature_metrics_count {
    label: "Instances w/ Feature Metrics"
    description: "The count of servers with License Feature Metrics enabled."
    type: count_distinct
    group_label: " License Config: Instance Counts"
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
    sql: case when ${feature_metrics} then ${server_id} else null end ;;
  }

  measure: feature_mfa_count {
    label: "Instances w/ Feature MFA"
    description: "The count of servers with License Feature MFA enabled."
    type: count_distinct
    group_label: " License Config: Instance Counts"
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
    sql: case when ${feature_mfa} then ${server_id} else null end ;;
  }

  measure: feature_mhpns_count {
    label: "Instances w/ Feature Mhpns"
    description: "The count of servers with License Feature Mhpns enabled."
    type: count_distinct
    group_label: " License Config: Instance Counts"
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
    sql: case when ${feature_mhpns} then ${server_id} else null end ;;
  }

  measure: feature_office365_count {
    label: "Instances w/ Feature Office365"
    description: "The count of servers with License Feature Office365 enabled."
    type: count_distinct
    group_label: " License Config: Instance Counts"
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
    sql: case when ${feature_office365} then ${server_id} else null end ;;
  }

  measure: feature_password_count {
    label: "Instances w/ Feature Password"
    description: "The count of servers with License Feature Password enabled."
    type: count_distinct
    group_label: " License Config: Instance Counts"
    sql: case when ${feature_password} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: feature_saml_count {
    label: "Instances w/ Feature SAML"
    description: "The count of servers with License Feature SAML enabled."
    type: count_distinct
    group_label: " License Config: Instance Counts"
    sql: case when ${feature_saml} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: console_json_log_count {
    label: "Instances w/ Console Json Log"
    description: "The count of servers with Log Console Json Log enabled."
    type: count_distinct
    group_label: " Log Config: Instance Counts"
    sql: case when ${console_json_log} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: enable_console_log_count {
    label: "Instances w/ Enable Console Log"
    description: "The count of servers with Log Enable Console Log enabled."
    type: count_distinct
    group_label: " Log Config: Instance Counts"
    sql: case when ${enable_console_log} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: enable_file_log_count {
    label: "Instances w/ Enable File Log"
    description: "The count of servers with Log Enable File Log enabled."
    type: count_distinct
    group_label: " Log Config: Instance Counts"
    sql: case when ${enable_file_log} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: enable_webhook_debugging_count {
    label: "Instances w/ Enable Webhook Debugging"
    description: "The count of servers with Log Enable Webhook Debugging enabled."
    type: count_distinct
    group_label: " Log Config: Instance Counts"
    sql: case when ${enable_webhook_debugging} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: file_json_log_count {
    label: "Instances w/ File Json Log"
    description: "The count of servers with Log File Json Log enabled."
    type: count_distinct
    group_label: " Log Config: Instance Counts"
    sql: case when ${file_json_log} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: isdefault_file_format_count {
    label: "Instances w/ Isdefault File Format"
    description: "The count of servers with Log Isdefault File Format enabled."
    type: count_distinct
    group_label: " Log Config: Instance Counts"
    sql: case when ${isdefault_file_format} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: isdefault_file_location_log_count {
    label: "Instances w/ Isdefault File Location Log"
    description: "The count of servers with Log Isdefault File Location Log enabled."
    type: count_distinct
    group_label: " Log Config: Instance Counts"
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
    sql: case when ${isdefault_file_location_log} then ${server_id} else null end ;;
  }

  measure: enable_message_export_count {
    label: "Instances w/ Enable Message Export"
    description: "The count of servers with Message Export Enable Message Export enabled."
    type: count_distinct
    group_label: " Message Export Config: Instance Counts"
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
    sql: case when ${enable_message_export} then ${server_id} else null end ;;
  }

  measure: is_default_global_relay_email_address_count {
    label: "Instances w/ Is Default Global Relay Email Address"
    description: "The count of servers with Message Export Is Default Global Relay Email Address enabled."
    type: count_distinct
    group_label: " Message Export Config: Instance Counts"
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
    sql: case when ${is_default_global_relay_email_address} then ${server_id} else null end ;;
  }

  measure: is_default_global_relay_smtp_password_count {
    label: "Instances w/ Is Default Global Relay Smtp Password"
    description: "The count of servers with Message Export Is Default Global Relay Smtp Password enabled."
    type: count_distinct
    group_label: " Message Export Config: Instance Counts"
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
    sql: case when ${is_default_global_relay_smtp_password} then ${server_id} else null end ;;
  }

  measure: is_default_global_relay_smtp_username_count {
    label: "Instances w/ Is Default Global Relay Smtp Username"
    description: "The count of servers with Message Export Is Default Global Relay Smtp Username enabled."
    type: count_distinct
    group_label: " Message Export Config: Instance Counts"
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
    sql: case when ${is_default_global_relay_smtp_username} then ${server_id} else null end ;;
  }

  measure: enable_metrics_count {
    label: "Instances w/ Metrics Enabled"
    description: "The count of servers with Metric Enable Metrics enabled."
    type: count_distinct
    group_label: " Metric Config: Instance Counts"
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
    sql: case when ${enable_metrics} then ${server_id} else null end ;;
  }

  measure: isdefault_android_app_download_link_count {
    label: "Instances w/ Isdefault Android App Download Link"
    description: "The count of servers with Nativeapp Isdefault Android App Download Link enabled."
    type: count_distinct
    group_label: " NativeApp Config: Instance Counts"
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
    sql: case when ${isdefault_android_app_download_link} then ${server_id} else null end ;;
  }

  measure: isdefault_app_download_link_count {
    label: "Instances w/ Isdefault App Download Link"
    description: "The count of servers with Nativeapp Isdefault App Download Link enabled."
    type: count_distinct
    group_label: " NativeApp Config: Instance Counts"
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
    sql: case when ${isdefault_app_download_link} then ${server_id} else null end ;;
  }

  measure: isdefault_iosapp_download_link_count {
    label: "Instances w/ Isdefault Iosapp Download Link"
    description: "The count of servers with Nativeapp Isdefault Iosapp Download Link enabled."
    type: count_distinct
    group_label: " NativeApp Config: Instance Counts"
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
    sql: case when ${isdefault_iosapp_download_link} then ${server_id} else null end ;;
  }

  measure: console_json_notifications_count {
    label: "Instances w/ Log Console Json Notifications"
    description: "The count of servers with Notifications Log Console Json Notifications enabled."
    type: count_distinct
    group_label: " Notifications Config: Instance Counts"
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
    sql: case when ${console_json_notifications} then ${server_id} else null end ;;
  }

  measure: enable_console_notifications_count {
    label: "Instances w/ Log Enable Console Notifications"
    description: "The count of servers with Notifications Log Enable Console Notifications enabled."
    type: count_distinct
    group_label: " Notifications Config: Instance Counts"
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
    sql: case when ${enable_console_notifications} then ${server_id} else null end ;;
  }

  measure: enable_file_notifications_count {
    label: "Instances w/ Log Enable File Notifications"
    description: "The count of servers with Notifications Log Enable File Notifications enabled."
    type: count_distinct
    group_label: " Notifications Config: Instance Counts"
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
    sql: case when ${enable_file_notifications} then ${server_id} else null end ;;
  }

  measure: file_json_notifications_count {
    label: "Instances w/ Log File Json Notifications"
    description: "The count of servers with Notifications Log File Json Notifications enabled."
    type: count_distinct
    group_label: " Notifications Config: Instance Counts"
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
    sql: case when ${file_json_notifications} then ${server_id} else null end ;;
  }

  measure: isdefault_file_location_notifications_count {
    label: "Instances w/ Log Isdefault File Location Notifications"
    description: "The count of servers with Notifications Log Isdefault File Location Notifications enabled."
    type: count_distinct
    group_label: " Notifications Config: Instance Counts"
    sql: case when ${isdefault_file_location_notifications} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: enable_office365_oauth_count {
    label: "Instances w/ Office365 OAuth"
    description: "The count of servers with OAuth Enable Office365 OAuth enabled."
    type: count_distinct
    group_label: " OAuth Config: Instance Counts"
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
    sql: case when ${enable_office365_oauth} then ${server_id} else null end ;;
  }

  measure: enable_google_oauth_count {
    label: "Instances w/ Google OAuth"
    description: "The count of servers with OAuth Enable Google OAuth enabled."
    type: count_distinct
    group_label: " OAuth Config: Instance Counts"
    sql: case when ${enable_google_oauth} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: enable_gitlab_oauth_count {
    label: "Instances w/ Gitlab OAuth"
    description: "The count of servers with OAuth Enable Gitlab OAuth enabled."
    type: count_distinct
    group_label: " OAuth Config: Instance Counts"
    sql: case when ${enable_gitlab_oauth} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: enable_lowercase_count {
    label: "Instances w/ Password Enable Lowercase"
    description: "The count of servers with Password Enable Lowercase enabled."
    type: count_distinct
    group_label: " Password Config: Instance Counts"
    sql: case when ${enable_lowercase} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: enable_uppercase_count {
    label: "Instances w/ Password Enable Uppercase"
    description: "The count of servers with Password Enable Uppercase enabled."
    type: count_distinct
    group_label: " Password Config: Instance Counts"
    sql: case when ${enable_uppercase} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: enable_symbol_count {
    label: "Instances w/ Password Enable Symbol"
    description: "The count of servers with Password Enable Symbol enabled."
    type: count_distinct
    group_label: " Password Config: Instance Counts"
    sql: case when ${enable_symbol} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: enable_number_count {
    label: "Instances w/ Password Enable Number"
    description: "The count of servers with Password Enable Number enabled."
    type: count_distinct
    group_label: " Password Config: Instance Counts"
    sql: case when ${enable_number} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: phase_1_migration_complete_count {
    label: "Instances w/ Phase 1 Migration Complete"
    description: "The count of servers with Permissions General Phase 1 Migration Complete enabled."
    type: count_distinct
    group_label: " Permissions General Config: Instance Counts"
    sql: case when ${phase_1_migration_complete} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: phase_2_migration_complete_count {
    label: "Instances w/ Phase 2 Migration Complete"
    description: "The count of servers with Permissions General Phase 2 Migration Complete enabled."
    type: count_distinct
    group_label: " Permissions General Config: Instance Counts"
    sql: case when ${phase_2_migration_complete} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: allow_insecure_download_url_count {
    label: "Instances w/ Allow Insecure Download URL"
    description: "The count of servers with Plugin Allow Insecure Download URL enabled."
    type: count_distinct
    group_label: " Plugin Config: Instance Counts"
    sql: case when ${allow_insecure_download_url} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: enable_matterpoll_count {
    label: "Instances w/ Matterpoll Enabled"
    description: "The count of servers with the Matterpoll plugin enabled."
    type: count_distinct
    group_label: " Plugins Enabled: Instance Counts"
    sql: case when ${enable_comgithubmatterpollmatterpoll} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: enable_msteamsmeeting_count {
    label: "Instances w/ MS Teams Meetings Enabled"
    description: "The count of servers with the MS Teams Meetings plugin enabled."
    type: count_distinct
    group_label: " Plugins Enabled: Instance Counts"
    sql: case when ${enable_commattermostmsteamsmeetings} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: enable_channelexport_count {
    label: "Instances w/ Channel Export Enabled"
    description: "The count of servers with the Channel Export plugin enabled."
    type: count_distinct
    group_label: " Plugins Enabled: Instance Counts"
    sql: case when ${enable_commattermostpluginchannelexport} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: enable_icebreaker_count {
    label: "Instances w/ Icebreaker Enabled"
    description: "The count of servers with the Icebreaker plugin enabled."
    type: count_distinct
    group_label: " Plugins Enabled: Instance Counts"
    sql: case when ${enable_comnilsbrinkmannicebreaker} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: enable_agenda_count {
    label: "Instances w/ Agenda Enabled"
    description: "The count of servers with the Agenda plugin enabled."
    type: count_distinct
    group_label: " Plugins Enabled: Instance Counts"
    sql: case when ${enable_agenda} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: automatic_prepackaged_plugins_count {
    label: "Instances w/ Automatic Prepackaged Plugins"
    description: "The count of servers with Plugin Automatic Prepackaged Plugins enabled."
    type: count_distinct
    group_label: " Plugin Config: Instance Counts"
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
    sql: case when ${automatic_prepackaged_plugins} then ${server_id} else null end ;;
  }

  measure: enable_plugins_count {
    label: "Instances w/ Plugins Enabled"
    description: "The count of servers with Plugins enabled."
    type: count_distinct
    group_label: " Plugin Config: Instance Counts"
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
    sql: case when ${enable_plugins} then ${server_id} else null end ;;
  }

  measure: enable_antivirus_count {
    label: "Instances w/ Antivirus Enabled"
    description: "The count of servers with plugin Antivirus enabled."
    type: count_distinct
    group_label: " Plugins Enabled: Instance Counts"
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
    sql: case when ${enable_antivirus} then ${server_id} else null end ;;
  }

  measure: enable_autolink_count {
    label: "Instances w/ Autolink Enabled"
    description: "The count of servers with plugin Autolink enabled."
    type: count_distinct
    group_label: " Plugins Enabled: Instance Counts"
    sql: case when ${enable_autolink} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: enable_aws_sns_count {
    label: "Instances w/ Aws Sns Enabled"
    description: "The count of servers with plugin Aws Sns enabled."
    type: count_distinct
    group_label: " Plugins Enabled: Instance Counts"
    sql: case when ${enable_aws_sns} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: enable_custom_user_attributes_count {
    label: "Instances w/ Custom User Attributes Enabled"
    description: "The count of servers with plugin Custom User Attributes enabled."
    type: count_distinct
    group_label: " Plugins Enabled: Instance Counts"
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
    sql: case when ${enable_custom_user_attributes} then ${server_id} else null end ;;
  }

  measure: enable_github_count {
    label: "Instances w/ Github Enabled"
    description: "The count of servers with plugin Github enabled."
    type: count_distinct
    group_label: " Plugins Enabled: Instance Counts"
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
    sql: case when ${enable_github} then ${server_id} else null end ;;
  }

  measure: enable_gitlab_count {
    label: "Instances w/ Gitlab Enabled"
    description: "The count of servers with plugin Gitlab enabled."
    type: count_distinct
    group_label: " Plugins Enabled: Instance Counts"
    sql: case when ${enable_gitlab} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: enable_health_check_count {
    label: "Instances w/ Health Check Enabled"
    description: "The count of servers with plugin Health Check enabled."
    type: count_distinct
    group_label: " Plugins Enabled: Instance Counts"
    sql: case when ${enable_health_check} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: enable_jenkins_count {
    label: "Instances w/ Jenkins Enabled"
    description: "The count of servers with plugin Jenkins enabled."
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
    type: count_distinct
    group_label: " Plugins Enabled: Instance Counts"
    sql: case when ${enable_jenkins} then ${server_id} else null end ;;
  }

  measure: enable_jira_count {
    label: "Instances w/ Jira Enabled"
    description: "The count of servers with plugin Jira enabled."
    type: count_distinct
    group_label: " Plugins Enabled: Instance Counts"
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
    sql: case when ${enable_jira} then ${server_id} else null end ;;
  }

  measure: enable_jitsi_count {
    label: "Instances w/ Jitsi Enabled"
    description: "The count of servers with plugin Jitsi enabled."
    type: count_distinct
    group_label: " Plugins Enabled: Instance Counts"
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
    sql: case when ${enable_jitsi} then ${server_id} else null end ;;
  }

  measure: enable_confluence_count {
    label: "Instances w/ Confluence Enabled"
    description: "The count of servers with plugin Confluence enabled."
    type: count_distinct
    group_label: " Plugins Enabled: Instance Counts"
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
    sql: case when ${enable_confluence} then ${server_id} else null end ;;
  }

  measure: enable_todo_count {
    label: "Instances w/ ToDo Enabled"
    description: "The count of servers with plugin ToDo enabled."
    type: count_distinct
    group_label: " Plugins Enabled: Instance Counts"
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
    sql: case when ${enable_todo} then ${server_id} else null end ;;
  }

  measure: enable_mscalendar_count {
    label: "Instances w/ MS Calendar Enabled"
    description: "The count of servers with plugin MS Calendar enabled."
    type: count_distinct
    group_label: " Plugins Enabled: Instance Counts"
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
    sql: case when ${enable_mscalendar} then ${server_id} else null end ;;
  }

  measure: enable_skype4business_count {
    label: "Instances w/ Skype4Business Enabled"
    description: "The count of servers with plugin Skype4Business enabled."
    type: count_distinct
    group_label: " Plugins Enabled: Instance Counts"
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
    sql: case when ${enable_skype4business} then ${server_id} else null end ;;
  }

  measure: enable_giphy_count {
    label: "Instances w/ Giphy Enabled"
    description: "The count of servers with plugin Giphy enabled."
    type: count_distinct
    group_label: " Plugins Enabled: Instance Counts"
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
    sql: case when ${enable_giphy} then ${server_id} else null end ;;
  }

  measure: enable_digital_ocean_count {
    label: "Instances w/ Digital Ocean Enabled"
    description: "The count of servers with plugin Digital Ocean enabled."
    type: count_distinct
    group_label: " Plugins Enabled: Instance Counts"
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
    sql: case when ${enable_digital_ocean} then ${server_id} else null end ;;
  }

  measure: enable_incident_response_count {
    label: "Instances w/ Incident Mgmt Enabled"
    description: "The count of servers with plugin Incident Response enabled."
    type: count_distinct
    group_label: " Plugins Enabled: Instance Counts"
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
    sql: case when ${enable_commattermostpluginincidentmanagement} then ${server_id} else null end ;;
  }

  measure: enable_memes_count {
    label: "Instances w/ Memes Enabled"
    description: "The count of servers with plugin Memes enabled."
    type: count_distinct
    group_label: " Plugins Enabled: Instance Counts"
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
    sql: case when ${enable_memes} then ${server_id} else null end ;;
  }

  measure: enable_marketplace_count {
    label: "Instances w/ Marketplace Enabled"
    description: "The count of servers with plugin Marketplace enabled."
    type: count_distinct
    group_label: " Plugins Enabled: Instance Counts"
    sql: case when ${enable_marketplace} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: enable_nps_count {
    label: "Instances w/ NPS Enabled"
    description: "The count of servers with the NPS & NPS Survey Plugin enabled."
    type: count_distinct
    group_label: " Plugins Enabled: Instance Counts"
    sql: case when ${enable_nps} and ${enable_nps_survey} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: enable_nps_survey_count {
    label: "Instances w/ Nps Survey"
    description: "The count of servers with plugin Nps Survey enabled."
    type: count_distinct
    group_label: " Plugins Enabled: Instance Counts"
    hidden: yes
    sql: case when ${enable_nps_survey} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: enable_remote_marketplace_count {
    label: "Instances w/ Remote Marketplace Enabled"
    description: "The count of servers with plugin Remote Marketplace enabled."
    type: count_distinct
    group_label: " Plugins Enabled: Instance Counts"
    sql: case when ${enable_remote_marketplace} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: enable_uploads_count {
    label: "Instances w/ Uploads Enabled"
    description: "The count of servers with plugin Uploads enabled."
    type: count_distinct
    group_label: " Plugins Enabled: Instance Counts"
    sql: case when ${enable_uploads} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: enable_webex_count {
    label: "Instances w/ Webex Enabled"
    description: "The count of servers with plugin Webex enabled."
    type: count_distinct
    group_label: " Plugins Enabled: Instance Counts"
    sql: case when ${enable_webex} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: enable_welcome_bot_count {
    label: "Instances w/ Welcome Bot Enabled"
    description: "The count of servers with plugin Welcome Bot enabled."
    type: count_distinct
    group_label: " Plugins Enabled: Instance Counts"
    sql: case when ${enable_welcome_bot} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: enable_zoom_count {
    label: "Instances w/ Zoom Enabled"
    description: "The count of servers with plugin Zoom enabled."
    type: count_distinct
    group_label: " Plugins Enabled: Instance Counts"
    sql: case when ${enable_zoom} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: enable_channel_recommender_count {
    label: "Instances w/ Channel Recommender Enabled"
    description: "The count of servers with plugin Channel Recommender enabled."
    type: count_distinct
    group_label: " Plugins Enabled: Instance Counts"
    sql: case when ${enable_comgithubjespinorecommend} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: is_default_marketplace_url_count {
    label: "Instances w/ Is Default Marketplace URL"
    description: "The count of servers with Plugin Is Default Marketplace URL enabled."
    type: count_distinct
    group_label: " Plugin Config: Instance Counts"
    sql: case when ${is_default_marketplace_url} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: focalboard_count {
    label: "Instances w/ Focalboard"
    description: "The count of servers with Plugin Focalboard enabled."
    type: count_distinct
    group_label: " Plugin Config: Instance Counts"
    sql: case when ${enable_focalboard} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: require_plugin_signature_count {
    label: "Instances w/ Require Plugin Signature"
    description: "The count of servers with Plugin Require Plugin Signature enabled."
    type: count_distinct
    group_label: " Plugin Config: Instance Counts"
    sql: case when ${require_plugin_signature} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: signature_public_key_files_sum {
    description: "The sum of Signature Public Key Files per grouping."
    group_label: "Plugin Configuration"
    type: sum
    sql: ${signature_public_key_files} ;;
  }

  measure: signature_public_key_files_avg {
    description: "The average Signature Public Key Files per grouping."
    group_label: "Plugin Configuration"
    type: average
    sql: ${signature_public_key_files} ;;
  }

  measure: active_backend_plugins_sum {
    description: "The sum of Active Backend Plugins per grouping."
    group_label: "Plugin Configuration"
    type: sum
    sql: ${active_backend_plugins} ;;
  }

  measure: active_backend_plugins_avg {
    description: "The average Active Backend Plugins per grouping."
    group_label: "Plugin Configuration"
    type: average
    sql: ${active_backend_plugins} ;;
  }

  measure: active_plugins_sum {
    description: "The sum of Active Plugins per grouping."
    group_label: "Plugin Configuration"
    type: sum
    sql: ${active_plugins} ;;
  }

  measure: active_plugins_avg {
    description: "The average Active Plugins per grouping."
    group_label: "Plugin Configuration"
    type: average
    sql: ${active_plugins} ;;
  }

  measure: active_webapp_plugins_sum {
    description: "The sum of Active Webapp Plugins per grouping."
    group_label: "Plugin Configuration"
    type: sum
    sql: ${active_webapp_plugins} ;;
  }

  measure: active_webapp_plugins_avg {
    description: "The average Active Webapp Plugins per grouping."
    group_label: "Plugin Configuration"
    type: average
    sql: ${active_webapp_plugins} ;;
  }

  measure: disabled_backend_plugins_sum {
    description: "The sum of Disabled Backend Plugins per grouping."
    group_label: "Plugin Configuration"
    type: sum
    sql: ${disabled_backend_plugins} ;;
  }

  measure: disabled_backend_plugins_avg {
    description: "The average Disabled Backend Plugins per grouping."
    group_label: "Plugin Configuration"
    type: average
    sql: ${disabled_backend_plugins} ;;
  }

  measure: disabled_plugins_sum {
    description: "The sum of Disabled Plugins per grouping."
    group_label: "Plugin Configuration"
    type: sum
    sql: ${disabled_plugins} ;;
  }

  measure: disabled_plugins_avg {
    description: "The average Disabled Plugins per grouping."
    group_label: "Plugin Configuration"
    type: average
    sql: ${disabled_plugins} ;;
  }

  measure: disabled_webapp_plugins_sum {
    description: "The sum of Disabled Webapp Plugins per grouping."
    group_label: "Plugin Configuration"
    type: sum
    sql: ${disabled_webapp_plugins} ;;
  }

  measure: disabled_webapp_plugins_avg {
    description: "The average Disabled Webapp Plugins per grouping."
    group_label: "Plugin Configuration"
    type: average
    sql: ${disabled_webapp_plugins} ;;
  }

  measure: enabled_backend_plugins_sum {
    description: "The sum of Enabled Backend Plugins per grouping."
    group_label: "Plugin Configuration"
    type: sum
    sql: ${enabled_backend_plugins} ;;
  }

  measure: enabled_backend_plugins_avg {
    description: "The average Enabled Backend Plugins per grouping."
    group_label: "Plugin Configuration"
    type: average
    sql: ${enabled_backend_plugins} ;;
  }

  measure: enabled_plugins_sum {
    description: "The sum of Enabled Plugins per grouping."
    group_label: "Plugin Configuration"
    type: sum
    sql: ${enabled_plugins} ;;
    drill_fields: [license_server_fact.customer_Name, server_id, enabled_plugins_sum, logging_date]
  }

  measure: enabled_plugins_avg {
    description: "The average Enabled Plugins per grouping."
    group_label: "Plugin Configuration"
    type: average
    sql: ${enabled_plugins} ;;
  }

  measure: enabled_webapp_plugins_sum {
    description: "The sum of Enabled Webapp Plugins per grouping."
    group_label: "Plugin Configuration"
    type: sum
    sql: ${enabled_webapp_plugins} ;;
  }

  measure: enabled_webapp_plugins_avg {
    description: "The average Enabled Webapp Plugins per grouping."
    group_label: "Plugin Configuration"
    type: average
    sql: ${enabled_webapp_plugins} ;;
  }

  measure: inactive_backend_plugins_sum {
    description: "The sum of Inactive Backend Plugins per grouping."
    group_label: "Plugin Configuration"
    type: sum
    sql: ${inactive_backend_plugins} ;;
  }

  measure: inactive_backend_plugins_avg {
    description: "The average Inactive Backend Plugins per grouping."
    group_label: "Plugin Configuration"
    type: average
    sql: ${inactive_backend_plugins} ;;
  }

  measure: inactive_plugins_sum {
    description: "The sum of Inactive Plugins per grouping."
    group_label: "Plugin Configuration"
    type: sum
    sql: ${inactive_plugins} ;;
  }

  measure: inactive_plugins_avg {
    description: "The average Inactive Plugins per grouping."
    group_label: "Plugin Configuration"
    type: average
    sql: ${inactive_plugins} ;;
  }

  measure: inactive_webapp_plugins_sum {
    description: "The sum of Inactive Webapp Plugins per grouping."
    group_label: "Plugin Configuration"
    type: sum
    sql: ${inactive_webapp_plugins} ;;
  }

  measure: inactive_webapp_plugins_avg {
    description: "The average Inactive Webapp Plugins per grouping."
    group_label: "Plugin Configuration"
    type: average
    sql: ${inactive_webapp_plugins} ;;
  }

  measure: plugins_with_broken_manifests_sum {
    description: "The sum of Plugins With Broken Manifests per grouping."
    group_label: "Plugin Configuration"
    type: sum
    sql: ${plugins_with_broken_manifests} ;;
  }

  measure: plugins_with_broken_manifests_avg {
    description: "The average Plugins With Broken Manifests per grouping."
    group_label: "Plugin Configuration"
    type: average
    sql: ${plugins_with_broken_manifests} ;;
  }

  measure: plugins_with_settings_sum {
    description: "The sum of Plugins With Settings per grouping."
    group_label: "Plugin Configuration"
    type: sum
    sql: ${plugins_with_settings} ;;
  }

  measure: plugins_with_settings_avg {
    description: "The average Plugins With Settings per grouping."
    group_label: "Plugin Configuration"
    type: average
    sql: ${plugins_with_settings} ;;
  }

  measure: show_email_address_count {
    label: "Instances w/ Privacy Show Email Address"
    description: "The count of servers with Privacy Show Email Address enabled."
    type: count_distinct
    group_label: " Privacy Config: Instance Counts"
    sql: case when ${show_email_address} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: show_full_name_count {
    label: "Instances w/ Privacy Show Full Name"
    description: "The count of servers with Privacy Show Full Name enabled."
    type: count_distinct
    group_label: " Privacy Config: Instance Counts"
    sql: case when ${show_full_name} then ${server_id} else null end ;;
  }

  measure: enable_rate_limiter_count {
    label: "Instances w/ Rate Enable Rate Limiter"
    description: "The count of servers with Rate Enable Rate Limiter enabled."
    type: count_distinct
    group_label: " Rate Config: Instance Counts"
    sql: case when ${enable_rate_limiter} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: isdefault_vary_by_header_count {
    label: "Instances w/ Rate Isdefault Vary By Header"
    description: "The count of servers with Rate Isdefault Vary By Header enabled."
    type: count_distinct
    group_label: " Rate Config: Instance Counts"
    sql: case when ${isdefault_vary_by_header} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: max_burst_sum {
    description: "The sum of Max Burst per grouping."
    group_label: "Rate Configuration"
    type: sum
    sql: ${max_burst} ;;
  }

  measure: max_burst_avg {
    description: "The average Max Burst per grouping."
    group_label: "Rate Configuration"
    type: average
    sql: ${max_burst} ;;
  }

  measure: memory_store_size_sum {
    description: "The sum of Memory Store Size per grouping."
    group_label: "Rate Configuration"
    type: sum
    sql: ${memory_store_size} ;;
  }

  measure: memory_store_size_avg {
    description: "The average Memory Store Size per grouping."
    group_label: "Rate Configuration"
    type: average
    sql: ${memory_store_size} ;;
  }

  measure: per_sec_sum {
    description: "The sum of Per Sec per grouping."
    group_label: "Rate Configuration"
    type: sum
    sql: ${per_sec} ;;
  }

  measure: per_sec_avg {
    description: "The average Per Sec per grouping."
    group_label: "Rate Configuration"
    type: average
    sql: ${per_sec} ;;
  }

  measure: vary_by_remote_address_count {
    label: "Instances w/ Vary By Remote Address"
    description: "The count of servers with Rate Vary By Remote Address enabled."
    type: count_distinct
    group_label: " Rate Config: Instance Counts"
    sql: case when ${vary_by_remote_address} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: vary_by_user_count {
    label: "Instances w/ Vary By User"
    description: "The count of servers with Rate Vary By User enabled."
    type: count_distinct
    group_label: " SAML Config: Instance Counts"
    sql: case when ${vary_by_user} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: enable_saml_count {
    label: "Instances w/ SAML Enabled"
    description: "The count of servers with SAML Enable SAML enabled."
    type: count_distinct
    group_label: " SAML Config: Instance Counts"
    sql: case when ${enable_saml} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: enable_admin_attribute_count {
    label: "Instances w/ Admin Attribute"
    description: "The count of servers with SAML Enable Admin Attribute enabled."
    type: count_distinct
    group_label: " SAML Config: Instance Counts"
    sql: case when ${enable_admin_attribute} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: enable_sync_with_ldap_count {
    label: "Instances w/ Sync With LDAP"
    description: "The count of servers with SAML Enable Sync With LDAP enabled."
    type: count_distinct
    group_label: " SAML Config: Instance Counts"
    sql: case when ${enable_sync_with_ldap} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: ignore_guest_ldap_sync_count {
    label: "Instances w/ Ignore Guest LDAP Sync"
    description: "The count of servers with Ignore Guest LDAP Sync enabled."
    type: count_distinct
    group_label: " SAML Config: Instance Counts"
    sql: case when ${ignore_guest_ldap_sync} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: enable_sync_with_ldap_include_auth_count {
    label: "Instances w/ Sync With LDAP Include Auth"
    description: "The count of servers with SAML Enable Sync With LDAP Include Auth enabled."
    type: count_distinct
    group_label: " SAML Config: Instance Counts"
    sql: case when ${enable_sync_with_ldap_include_auth} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: encrypt_saml_count {
    label: "Instances w/ Encrypt SAML"
    description: "The count of servers with SAML Encrypt SAML enabled."
    type: count_distinct
    group_label: " SAML Config: Instance Counts"
    sql: case when ${encrypt_saml} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: isdefault_admin_attribute_count {
    label: "Instances w/ Isdefault Admin Attribute"
    description: "The count of servers with SAML Isdefault Admin Attribute enabled."
    type: count_distinct
    group_label: " SAML Config: Instance Counts"
    sql: case when ${isdefault_admin_attribute} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: isdefault_canonical_algorithm_count {
    label: "Instances w/ Isdefault Canonical Algorithm"
    description: "The count of servers with SAML Isdefault Canonical Algorithm enabled."
    type: count_distinct
    group_label: " SAML Config: Instance Counts"
    sql: case when ${isdefault_canonical_algorithm} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: isdefault_email_attribute_saml_count {
    label: "Instances w/ Isdefault Email Attribute SAML"
    description: "The count of servers with SAML Isdefault Email Attribute SAML enabled."
    type: count_distinct
    group_label: " SAML Config: Instance Counts"
    sql: case when ${isdefault_email_attribute_saml} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: isdefault_first_name_attribute_saml_count {
    label: "Instances w/ Isdefault First Name Attribute SAML"
    description: "The count of servers with SAML Isdefault First Name Attribute SAML enabled."
    type: count_distinct
    group_label: " SAML Config: Instance Counts"
    sql: case when ${isdefault_first_name_attribute_saml} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: isdefault_guest_attribute_count {
    label: "Instances w/ Isdefault Guest Attribute"
    description: "The count of servers with SAML Isdefault Guest Attribute enabled."
    type: count_distinct
    group_label: " SAML Config: Instance Counts"
    sql: case when ${isdefault_guest_attribute} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: isdefault_id_attribute_saml_count {
    label: "Instances w/ Isdefault Id Attribute SAML"
    description: "The count of servers with SAML Isdefault Id Attribute SAML enabled."
    type: count_distinct
    group_label: " SAML Config: Instance Counts"
    sql: case when ${isdefault_id_attribute_saml} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: isdefault_last_name_attribute_saml_count {
    label: "Instances w/ Isdefault Last Name Attribute SAML"
    description: "The count of servers with SAML Isdefault Last Name Attribute SAML enabled."
    type: count_distinct
    group_label: " SAML Config: Instance Counts"
    sql: case when ${isdefault_last_name_attribute_saml} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: isdefault_locale_attribute_count {
    label: "Instances w/ Isdefault Locale Attribute"
    description: "The count of servers with SAML Isdefault Locale Attribute enabled."
    type: count_distinct
    group_label: " SAML Config: Instance Counts"
    sql: case when ${isdefault_locale_attribute} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: isdefault_login_button_border_color_saml_count {
    label: "Instances w/ Isdefault Login Button Border Color SAML"
    description: "The count of servers with SAML Isdefault Login Button Border Color SAML enabled."
    type: count_distinct
    group_label: " SAML Config: Instance Counts"
    sql: case when ${isdefault_login_button_border_color_saml} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: isdefault_login_button_color_saml_count {
    label: "Instances w/ Isdefault Login Button Color SAML"
    description: "The count of servers with SAML Isdefault Login Button Color SAML enabled."
    type: count_distinct
    group_label: " SAML Config: Instance Counts"
    sql: case when ${isdefault_login_button_color_saml} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: isdefault_login_button_text_count {
    label: "Instances w/ Isdefault Login Button Text"
    description: "The count of servers with SAML Isdefault Login Button Text enabled."
    type: count_distinct
    group_label: " SAML Config: Instance Counts"
    sql: case when ${isdefault_login_button_text} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: isdefault_login_button_text_color_saml_count {
    label: "Instances w/ Isdefault Login Button Text Color SAML"
    description: "The count of servers with SAML Isdefault Login Button Text Color SAML enabled."
    type: count_distinct
    group_label: " SAML Config: Instance Counts"
    sql: case when ${isdefault_login_button_text_color_saml} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: isdefault_nickname_attribute_saml_count {
    label: "Instances w/ Isdefault Nickname Attribute SAML"
    description: "The count of servers with SAML Isdefault Nickname Attribute SAML enabled."
    type: count_distinct
    group_label: " SAML Config: Instance Counts"
    sql: case when ${isdefault_nickname_attribute_saml} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: isdefault_position_attribute_saml_count {
    label: "Instances w/ Isdefault Position Attribute SAML"
    description: "The count of servers with SAML Isdefault Position Attribute SAML enabled."
    type: count_distinct
    group_label: " SAML Config: Instance Counts"
    sql: case when ${isdefault_position_attribute_saml} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: isdefault_scoping_idp_name_count {
    label: "Instances w/ Isdefault Scoping Idp Name"
    description: "The count of servers with SAML Isdefault Scoping Idp Name enabled."
    type: count_distinct
    group_label: " SAML Config: Instance Counts"
    sql: case when ${isdefault_scoping_idp_name} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: isdefault_scoping_idp_provider_id_count {
    label: "Instances w/ Isdefault Scoping Idp Provider Id"
    description: "The count of servers with SAML Isdefault Scoping Idp Provider Id enabled."
    type: count_distinct
    group_label: " SAML Config: Instance Counts"
    sql: case when ${isdefault_scoping_idp_provider_id} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: isdefault_signature_algorithm_count {
    label: "Instances w/ Isdefault Signature Algorithm"
    description: "The count of servers with SAML Isdefault Signature Algorithm enabled."
    type: count_distinct
    group_label: " SAML Config: Instance Counts"
    sql: case when ${isdefault_signature_algorithm} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: isdefault_username_attribute_saml_count {
    label: "Instances w/ Isdefault Username Attribute SAML"
    description: "The count of servers with SAML Isdefault Username Attribute SAML enabled."
    type: count_distinct
    group_label: " SAML Config: Instance Counts"
    sql: case when ${isdefault_username_attribute_saml} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: sign_request_count {
    label: "Instances w/ Sign Request"
    description: "The count of servers with SAML Sign Request enabled."
    type: count_distinct
    group_label: " SAML Config: Instance Counts"
    sql: case when ${sign_request} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: verify_saml_count {
    label: "Instances w/ Verify SAML"
    description: "The count of servers with SAML Verify SAML enabled."
    type: count_distinct
    group_label: " SAML Config: Instance Counts"
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
    sql: case when ${verify_saml} then ${server_id} else null end ;;
  }

  measure: allow_cookies_for_subdomains_count {
    label: "Instances w/ Allow Cookies For Subdomains"
    description: "The count of servers with Service Allow Cookies For Subdomains enabled."
    type: count_distinct
    group_label: " Service Config: Instance Counts"
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
    sql: case when ${allow_cookies_for_subdomains} then ${server_id} else null end ;;
  }

  measure: close_unused_direct_messages_count {
    label: "Instances w/ Close Unused Direct Messages"
    description: "The count of servers with Service Close Unused Direct Messages enabled."
    type: count_distinct
    group_label: " Service Config: Instance Counts"
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
    sql: case when ${close_unused_direct_messages} then ${server_id} else null end ;;
  }

  measure: cors_allow_credentials_count {
    label: "Instances w/ Cors Allow Credentials"
    description: "The count of servers with Service Cors Allow Credentials enabled."
    type: count_distinct
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
    group_label: " Service Config: Instance Counts"
    sql: case when ${cors_allow_credentials} then ${server_id} else null end ;;
  }

  measure: cors_debug_count {
    label: "Instances w/ Cors Debug"
    description: "The count of servers with Service Cors Debug enabled."
    type: count_distinct
    group_label: " Service Config: Instance Counts"
    sql: case when ${cors_debug} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: custom_service_terms_enabled_service_count {
    label: "Instances w/ Custom Service Terms Enabled Service"
    description: "The count of servers with Service Custom Service Terms Enabled Service enabled."
    type: count_distinct
    group_label: " Service Config: Instance Counts"
    sql: case when ${custom_service_terms_enabled_service} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: experimental_data_prefetch_count {
    label: "Instances w/ Data Prefetch"
    description: "The count of servers with Data Prefetch enabled."
    type: count_distinct
    group_label: " Service Config: Instance Counts"
    sql: case when ${experimental_data_prefetch} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: extend_session_length_with_activity_count {
    label: "Instances w/ Extend Session Length w/ Activity"
    description: "The count of servers with Extend Session Length w/ Activity enabled."
    type: count_distinct
    group_label: " Service Config: Instance Counts"
    sql: case when ${extend_session_length_with_activity} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: disable_bots_when_owner_is_deactivated_count {
    label: "Instances w/ Disable Bots When Owner Is Deactivated"
    description: "The count of servers with Service Disable Bots When Owner Is Deactivated enabled."
    type: count_distinct
    group_label: " Service Config: Instance Counts"
    sql: case when ${disable_bots_when_owner_is_deactivated} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: disable_legacy_mfa_count {
    label: "Instances w/ Disable Legacy MFA"
    description: "The count of servers with Service Disable Legacy MFA enabled."
    type: count_distinct
    group_label: " Service Config: Instance Counts"
    sql: case when ${disable_legacy_mfa} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: enable_apiv3_service_count {
    label: "Instances w/ Enable Apiv3 Service"
    description: "The count of servers with Service Enable Apiv3 Service enabled."
    type: count_distinct
    group_label: " Service Config: Instance Counts"
    sql: case when ${enable_apiv3_service} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: enable_api_team_deletion_count {
    label: "Instances w/ Enable Api Team Deletion"
    description: "The count of servers with Service Enable Api Team Deletion enabled."
    type: count_distinct
    group_label: " Service Config: Instance Counts"
    sql: case when ${enable_api_team_deletion} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: enable_bot_account_creation_count {
    label: "Instances w/ Enable Bot Account Creation"
    description: "The count of servers with Service Enable Bot Account Creation enabled."
    type: count_distinct
    group_label: " Service Config: Instance Counts"
    sql: case when ${enable_bot_account_creation} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: enable_channel_viewed_messages_service_count {
    label: "Instances w/ Enable Channel Viewed Messages Service"
    description: "The count of servers with Service Enable Channel Viewed Messages Service enabled."
    type: count_distinct
    group_label: " Service Config: Instance Counts"
    sql: case when ${enable_channel_viewed_messages_service} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: enable_commands_service_count {
    label: "Instances w/ Enable Commands Service"
    description: "The count of servers with Service Enable Commands Service enabled."
    type: count_distinct
    group_label: " Service Config: Instance Counts"
    sql: case when ${enable_commands_service} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: enable_custom_emoji_service_count {
    label: "Instances w/ Enable Custom Emoji Service"
    description: "The count of servers with Service Enable Custom Emoji Service enabled."
    type: count_distinct
    group_label: " Service Config: Instance Counts"
    sql: case when ${enable_custom_emoji_service} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: enable_developer_service_count {
    label: "Instances w/ Enable Developer Service"
    description: "The count of servers with Service Enable Developer Service enabled."
    type: count_distinct
    group_label: " Service Config: Instance Counts"
    sql: case when ${enable_developer_service} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: enable_email_invitations_count {
    label: "Instances w/ Enable Email Invitations"
    description: "The count of servers with Service Enable Email Invitations enabled."
    type: count_distinct
    group_label: " Service Config: Instance Counts"
    sql: case when ${enable_email_invitations} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: enable_emoji_picker_service_count {
    label: "Instances w/ Enable Emoji Picker Service"
    description: "The count of servers with Service Enable Emoji Picker Service enabled."
    type: count_distinct
    group_label: " Service Config: Instance Counts"
    sql: case when ${enable_emoji_picker_service} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: enable_gif_picker_count {
    label: "Instances w/ Enable Gif Picker"
    description: "The count of servers with Service Enable Gif Picker enabled."
    type: count_distinct
    group_label: " Service Config: Instance Counts"
    sql: case when ${enable_gif_picker} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: enable_incoming_webhooks_service_count {
    label: "Instances w/ Enable Incoming Webhooks Service"
    description: "The count of servers with Service Enable Incoming Webhooks Service enabled."
    type: count_distinct
    group_label: " Service Config: Instance Counts"
    sql: case when ${enable_incoming_webhooks_service} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: enable_insecure_outgoing_connections_service_count {
    label: "Instances w/ Enable Insecure Outgoing Connections Service"
    description: "The count of servers with Service Enable Insecure Outgoing Connections Service enabled."
    type: count_distinct
    group_label: " Service Config: Instance Counts"
    sql: case when ${enable_insecure_outgoing_connections_service} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: enable_latex_count {
    label: "Instances w/ Enable Latex"
    description: "The count of servers with Service Enable Latex enabled."
    type: count_distinct
    group_label: " Service Config: Instance Counts"
    sql: case when ${enable_latex} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: enable_multifactor_authentication_service_count {
    label: "Instances w/ Enable Multifactor Authentication Service"
    description: "The count of servers with Service Enable Multifactor Authentication Service enabled."
    type: count_distinct
    group_label: " Service Config: Instance Counts"
    sql: case when ${enable_multifactor_authentication_service} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: enable_oauth_service_provider_service_count {
    label: "Instances w/ Enable OAuth Service Provider Service"
    description: "The count of servers with Service Enable OAuth Service Provider Service enabled."
    type: count_distinct
    group_label: " Service Config: Instance Counts"
    sql: case when ${enable_oauth_service_provider_service} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: enable_only_admin_integrations_service_count {
    label: "Instances w/ Enable Only Admin Integrations Service"
    description: "The count of servers with Service Enable Only Admin Integrations Service enabled."
    type: count_distinct
    group_label: " Service Config: Instance Counts"
    sql: case when ${enable_only_admin_integrations_service} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: enable_outgoing_webhooks_count {
    label: "Instances w/ Enable Outgoing Webhooks"
    description: "The count of servers with Service Enable Outgoing Webhooks enabled."
    type: count_distinct
    group_label: " Service Config: Instance Counts"
    sql: case when ${enable_outgoing_webhooks} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: enable_post_icon_override_count {
    label: "Instances w/ Enable Post Icon Override"
    description: "The count of servers with Service Enable Post Icon Override enabled."
    type: count_distinct
    group_label: " Service Config: Instance Counts"
    sql: case when ${enable_post_icon_override} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: enable_post_search_count {
    label: "Instances w/ Enable Post Search"
    description: "The count of servers with Service Enable Post Search enabled."
    type: count_distinct
    group_label: " Service Config: Instance Counts"
    sql: case when ${enable_post_search} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: enable_post_username_override_count {
    label: "Instances w/ Enable Post Username Override"
    description: "The count of servers with Service Enable Post Username Override enabled."
    type: count_distinct
    group_label: " Service Config: Instance Counts"
    sql: case when ${enable_post_username_override} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: enable_preview_features_count {
    label: "Instances w/ Enable Preview Features"
    description: "The count of servers with Service Enable Preview Features enabled."
    type: count_distinct
    group_label: " Service Config: Instance Counts"
    sql: case when ${enable_preview_features} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: enable_security_fix_alert_count {
    label: "Instances w/ Enable Security Fix Alert"
    description: "The count of servers with Service Enable Security Fix Alert enabled."
    type: count_distinct
    group_label: " Service Config: Instance Counts"
    sql: case when ${enable_security_fix_alert} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: enable_svgs_count {
    label: "Instances w/ Enable SVG's"
    description: "The count of servers with Service Enable SVG's enabled."
    type: count_distinct
    group_label: " Service Config: Instance Counts"
    sql: case when ${enable_svgs} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: enable_testing_count {
    label: "Instances w/ Enable Testing"
    description: "The count of servers with Service Enable Testing enabled."
    type: count_distinct
    group_label: " Service Config: Instance Counts"
    sql: case when ${enable_testing} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: enable_tutorial_count {
    label: "Instances w/ Enable Tutorial"
    description: "The count of servers with Service Enable Tutorial enabled."
    type: count_distinct
    group_label: " Service Config: Instance Counts"
    sql: case when ${enable_tutorial} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: enable_user_access_tokens_count {
    label: "Instances w/ Enable User Access Tokens"
    description: "The count of servers with Service Enable User Access Tokens enabled."
    type: count_distinct
    group_label: " Service Config: Instance Counts"
    sql: case when ${enable_user_access_tokens} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: enable_user_statuses_count {
    label: "Instances w/ Enable User Statuses"
    description: "The count of servers with Service Enable User Statuses enabled."
    type: count_distinct
    group_label: " Service Config: Instance Counts"
    sql: case when ${enable_user_statuses} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: enable_user_typing_messages_count {
    label: "Instances w/ Enable User Typing Messages"
    description: "The count of servers with Service Enable User Typing Messages enabled."
    type: count_distinct
    group_label: " Service Config: Instance Counts"
    sql: case when ${enable_user_typing_messages} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: enforce_multifactor_authentication_service_count {
    label: "Instances w/ Enforce Multifactor Authentication Service"
    description: "The count of servers with Service Enforce Multifactor Authentication Service enabled."
    type: count_distinct
    group_label: " Service Config: Instance Counts"
    sql: case when ${enforce_multifactor_authentication_service} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: experimental_channel_organization_count {
    label: "Instances w/ Experimental Channel Organization"
    description: "The count of servers with Service Experimental Channel Organization enabled."
    type: count_distinct
    group_label: " Service Config: Instance Counts"
    sql: case when ${experimental_channel_organization} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: experimental_enable_authentication_transfer_count {
    label: "Instances w/ Experimental Enable Authentication Transfer"
    description: "The count of servers with Service Experimental Enable Authentication Transfer enabled."
    type: count_distinct
    group_label: " Service Config: Instance Counts"
    sql: case when ${experimental_enable_authentication_transfer} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: experimental_enable_default_channel_leave_join_messages_count {
    label: "Instances w/ Experimental Enable Default Channel Leave Join Messages"
    description: "The count of servers with Service Experimental Enable Default Channel Leave Join Messages enabled."
    type: count_distinct
    group_label: " Service Config: Instance Counts"
    sql: case when ${experimental_enable_default_channel_leave_join_messages} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: experimental_enable_hardened_mode_count {
    label: "Instances w/ Experimental Enable Hardened Mode"
    description: "The count of servers with Service Experimental Enable Hardened Mode enabled."
    type: count_distinct
    group_label: " Service Config: Instance Counts"
    sql: case when ${experimental_enable_hardened_mode} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: experimental_ldap_group_sync_count {
    label: "Instances w/ Experimental LDAP Group Sync"
    description: "The count of servers with Service Experimental LDAP Group Sync enabled."
    type: count_distinct
    group_label: " Service Config: Instance Counts"
    sql: case when ${experimental_ldap_group_sync} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: experimental_limit_client_config_count {
    label: "Instances w/ Experimental Limit Client Config"
    description: "The count of servers with Service Experimental Limit Client Config enabled."
    type: count_distinct
    group_label: " Service Config: Instance Counts"
    sql: case when ${experimental_limit_client_config} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: experimental_strict_csrf_enforcement_count {
    label: "Instances w/ Experimental Strict Csrf Enforcement"
    description: "The count of servers with Service Experimental Strict Csrf Enforcement enabled."
    type: count_distinct
    group_label: " Service Config: Instance Counts"
    sql: case when ${experimental_strict_csrf_enforcement} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: forward_80_to_443_count {
    label: "Instances w/ Forward 80 To 443"
    description: "The count of servers with Service Forward 80 To 443 enabled."
    type: count_distinct
    group_label: " Service Config: Instance Counts"
    sql: case when ${forward_80_to_443} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: gfycat_api_key_count {
    label: "Instances w/ Gfycat Api Key"
    description: "The count of servers with Service Gfycat Api Key enabled."
    type: count_distinct
    group_label: " Service Config: Instance Counts"
    sql: case when ${gfycat_api_key} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: gfycat_api_secret_count {
    label: "Instances w/ Gfycat Api Secret"
    description: "The count of servers with Service Gfycat Api Secret enabled."
    type: count_distinct
    group_label: " Service Config: Instance Counts"
    sql: case when ${gfycat_api_secret} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: isdefault_allowed_untrusted_internal_connections_count {
    label: "Instances w/ Isdefault Allowed Untrusted Internal Connections"
    description: "The count of servers with Service Isdefault Allowed Untrusted Internal Connections enabled."
    type: count_distinct
    group_label: " Service Config: Instance Counts"
    sql: case when ${isdefault_allowed_untrusted_internal_connections} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: isdefault_allowed_untrusted_inteznal_connections_count {
    label: "Instances w/ Isdefault Allowed Untrusted Inteznal Connections"
    description: "The count of servers with Service Isdefault Allowed Untrusted Inteznal Connections enabled."
    type: count_distinct
    group_label: " Service Config: Instance Counts"
    sql: case when ${isdefault_allowed_untrusted_inteznal_connections} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: isdefault_allow_cors_from_count {
    label: "Instances w/ Isdefault Allow Cors From"
    description: "The count of servers with Service Isdefault Allow Cors From enabled."
    type: count_distinct
    group_label: " Service Config: Instance Counts"
    sql: case when ${isdefault_allow_cors_from} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: isdefault_cors_exposed_headers_count {
    label: "Instances w/ Isdefault Cors Exposed Headers"
    description: "The count of servers with Service Isdefault Cors Exposed Headers enabled."
    type: count_distinct
    group_label: " Service Config: Instance Counts"
    sql: case when ${isdefault_cors_exposed_headers} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: isdefault_google_developer_key_count {
    label: "Instances w/ Isdefault Google Developer Key"
    description: "The count of servers with Service Isdefault Google Developer Key enabled."
    type: count_distinct
    group_label: " Service Config: Instance Counts"
    sql: case when ${isdefault_google_developer_key} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: collapsed_threads_count {
    label: "Instances w/ Collapsed Threads"
    description: "The count of servers with Service Collapsed Threads enabled."
    type: count_distinct
    group_label: " Service Config: Instance Counts"
    sql: case when ${collapsed_threads} IN ('default_on', 'default_off') then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: managed_resource_paths_count {
    label: "Instances w/ Managed Resource Paths"
    description: "The count of servers with Managed Resouce Paths enabled."
    type: count_distinct
    group_label: " Service Config: Instance Counts"
    sql: case when ${managed_resource_paths} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: openid_count {
    label: "Instances w/ OpenID Enabled"
    description: "The count of servers with OpenID enabled."
    type: count_distinct
    group_label: " OAuth Config: Instance Counts"
    sql: case when ${enable_openid} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: openid_google_count {
    label: "Instances w/ Google OpenID Enabled"
    description: "The count of servers with Google OpenID enabled."
    type: count_distinct
    group_label: " OAuth Config: Instance Counts"
    sql: case when ${openid_google} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: openid_gitlab_count {
    label: "Instances w/ Gitlab OpenID Enabled"
    description: "The count of servers with Gitlab OpenID enabled."
    type: count_distinct
    group_label: " OAuth Config: Instance Counts"
    sql: case when ${openid_gitlab} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: openid_office365_count {
    label: "Instances w/ Office365 OpenID Enabled"
    description: "The count of servers with Office365 OpenID enabled."
    type: count_distinct
    group_label: " OAuth Config: Instance Counts"
    sql: case when ${openid_office365} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: isdefault_image_proxy_options_count {
    label: "Instances w/ Isdefault Image Proxy Options"
    description: "The count of servers with Service Isdefault Image Proxy Options enabled."
    type: count_distinct
    group_label: " Service Config: Instance Counts"
    sql: case when ${isdefault_image_proxy_options} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: isdefault_image_proxy_type_count {
    label: "Instances w/ Isdefault Image Proxy Type"
    description: "The count of servers with Service Isdefault Image Proxy Type enabled."
    type: count_distinct
    group_label: " Service Config: Instance Counts"
    sql: case when ${isdefault_image_proxy_type} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: isdefault_image_proxy_url_count {
    label: "Instances w/ Isdefault Image Proxy URL"
    description: "The count of servers with Service Isdefault Image Proxy URL enabled."
    type: count_distinct
    group_label: " Service Config: Instance Counts"
    sql: case when ${isdefault_image_proxy_url} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: isdefault_read_timeout_count {
    label: "Instances w/ Isdefault Read Timeout"
    description: "The count of servers with Service Isdefault Read Timeout enabled."
    type: count_distinct
    group_label: " Service Config: Instance Counts"
    sql: case when ${isdefault_read_timeout} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: isdefault_site_url_count {
    label: "Instances w/ Isdefault Site URL"
    description: "The count of servers with Service Isdefault Site URL enabled."
    type: count_distinct
    group_label: " Service Config: Instance Counts"
    sql: case when ${isdefault_site_url} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: isdefault_tls_cert_file_count {
    label: "Instances w/ Isdefault TLS Cert File"
    description: "The count of servers with Service Isdefault TLS Cert File enabled."
    type: count_distinct
    group_label: " Service Config: Instance Counts"
    sql: case when ${isdefault_tls_cert_file} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: isdefault_tls_key_file_count {
    label: "Instances w/ Isdefault TLS Key File"
    description: "The count of servers with Service Isdefault TLS Key File enabled."
    type: count_distinct
    group_label: " Service Config: Instance Counts"
    sql: case when ${isdefault_tls_key_file} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: isdefault_write_timeout_count {
    label: "Instances w/ Isdefault Write Timeout"
    description: "The count of servers with Service Isdefault Write Timeout enabled."
    type: count_distinct
    group_label: " Service Config: Instance Counts"
    sql: case when ${isdefault_write_timeout} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: tls_strict_transport_count {
    label: "Instances w/ TLS Strict Transport"
    description: "The count of servers with Service TLS Strict Transport enabled."
    type: count_distinct
    group_label: " Service Config: Instance Counts"
    sql: case when ${tls_strict_transport} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: uses_letsencrypt_count {
    label: "Instances w/ Uses Letsencrypt"
    description: "The count of servers with Service Uses Letsencrypt enabled."
    type: count_distinct
    group_label: " Service Config: Instance Counts"
    sql: case when ${uses_letsencrypt} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: websocket_url_count {
    label: "Instances w/ Websocket URL"
    description: "The count of servers with Service Websocket URL enabled."
    type: count_distinct
    group_label: " Service Config: Instance Counts"
    sql: case when ${websocket_url} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: enable_public_channels_materialization_count {
    label: "Instances w/ Sql Enable Public Channels Materialization"
    description: "The count of servers with Sql Enable Public Channels Materialization enabled."
    type: count_distinct
    group_label: " SQL Config: Instance Counts"
    sql: case when ${enable_public_channels_materialization} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: max_idle_conns_sum {
    description: "The sum of Max Idle Conns per grouping."
    group_label: "Sql Configuration"
    type: sum
    sql: ${max_idle_conns} ;;
  }

  measure: max_idle_conns_avg {
    description: "The average Max Idle Conns per grouping."
    group_label: "Sql Configuration"
    type: average
    sql: ${max_idle_conns} ;;
  }

  measure: max_open_conns_sum {
    description: "The sum of Max Open Conns per grouping."
    group_label: "Sql Configuration"
    type: sum
    sql: ${max_open_conns} ;;
  }

  measure: max_open_conns_avg {
    description: "The average Max Open Conns per grouping."
    group_label: "Sql Configuration"
    type: average
    sql: ${max_open_conns} ;;
  }

  measure: query_timeout_sql_sum {
    description: "The sum of Query Timeout Sql per grouping."
    group_label: "Sql Configuration"
    type: sum
    sql: ${query_timeout_sql} ;;
  }

  measure: query_timeout_sql_avg {
    description: "The average Query Timeout Sql per grouping."
    group_label: "Sql Configuration"
    type: average
    sql: ${query_timeout_sql} ;;
  }

  measure: trace_sql_count {
    label: "Instances w/ Trace Sql"
    description: "The count of servers with Sql Trace Sql enabled."
    type: count_distinct
    group_label: " SQL Config: Instance Counts"
    sql: case when ${trace_sql} then ${server_id} else null end ;;
  }

  measure: custom_terms_of_service_enabled_count {
    label: "Instances w/ Custom Terms Of Service Enabled"
    description: "The count of servers with Support Custom Terms Of Service Enabled enabled."
    type: count_distinct
    group_label: " Support Config: Instance Counts"
    sql: case when ${custom_terms_of_service_enabled} then ${server_id} else null end ;;
  }

  measure: ask_community_link_enabled_count {
    label: "Instances w/ Ask Community Link Enabled"
    description: "The count of servers with Ask Community Link enabled."
    type: count_distinct
    group_label: " Support Config: Instance Counts"
    sql: case when ${ask_community_link_enabled} then ${server_id} else null end ;;
  }

  measure: isdefault_about_link_count {
    label: "Instances w/ Isdefault About Link"
    description: "The count of servers with Support Isdefault About Link enabled."
    type: count_distinct
    group_label: " Support Config: Instance Counts"
    sql: case when ${isdefault_about_link} then ${server_id} else null end ;;
  }

  measure: isdefault_help_link_count {
    label: "Instances w/ Isdefault Help Link"
    description: "The count of servers with Support Isdefault Help Link enabled."
    type: count_distinct
    group_label: " Support Config: Instance Counts"
    sql: case when ${isdefault_help_link} then ${server_id} else null end ;;
  }

  measure: isdefault_privacy_policy_link_count {
    label: "Instances w/ Isdefault Privacy Policy Link"
    description: "The count of servers with Support Isdefault Privacy Policy Link enabled."
    type: count_distinct
    group_label: " Support Config: Instance Counts"
    sql: case when ${isdefault_privacy_policy_link} then ${server_id} else null end ;;
  }

  measure: isdefault_report_a_problem_link_count {
    label: "Instances w/ Isdefault Report A Problem Link"
    description: "The count of servers with Support Isdefault Report A Problem Link enabled."
    type: count_distinct
    group_label: " Support Config: Instance Counts"
    sql: case when ${isdefault_report_a_problem_link} then ${server_id} else null end ;;
  }

  measure: isdefault_support_email_count {
    label: "Instances w/ Isdefault Support Email"
    description: "The count of servers with Support Isdefault Support Email enabled."
    type: count_distinct
    group_label: " Support Config: Instance Counts"
    sql: case when ${isdefault_support_email} then ${server_id} else null end ;;
  }

  measure: isdefault_terms_of_service_link_count {
    label: "Instances w/ Isdefault Terms Of Service Link"
    description: "The count of servers with Support Isdefault Terms Of Service Link enabled."
    type: count_distinct
    group_label: " Support Config: Instance Counts"
    sql: case when ${isdefault_terms_of_service_link} then ${server_id} else null end ;;
  }

  measure: enable_confirm_notifications_to_channel_count {
    label: "Instances w/ Confirm Notifications To Channel"
    description: "The count of servers with Team Enable Confirm Notifications To Channel enabled."
    type: count_distinct
    group_label: " Team Config: Instance Counts"
    sql: case when ${enable_confirm_notifications_to_channel} then ${server_id} else null end ;;
  }

  measure: enable_custom_brand_count {
    label: "Instances w/ Custom Brand"
    description: "The count of servers with Team Enable Custom Brand enabled."
    type: count_distinct
    group_label: " Team Config: Instance Counts"
    sql: case when ${enable_custom_brand} then ${server_id} else null end ;;
  }

  measure: enable_open_server_count {
    label: "Instances w/ Open Server"
    description: "The count of servers with Team Enable Open Server enabled."
    type: count_distinct
    group_label: " Team Config: Instance Counts"
    sql: case when ${enable_open_server} then ${server_id} else null end ;;
  }

  measure: enable_team_creation_count {
    label: "Instances w/ Creation"
    description: "The count of servers with Team Enable Team Creation enabled."
    type: count_distinct
    group_label: " Team Config: Instance Counts"
    sql: case when ${enable_team_creation} then ${server_id} else null end ;;
  }

  measure: enable_user_creation_count {
    label: "Instances w/ User Creation"
    description: "The count of servers with Team Enable User Creation enabled."
    type: count_distinct
    group_label: " Team Config: Instance Counts"
    sql: case when ${enable_user_creation} then ${server_id} else null end ;;
  }

  measure: enable_user_deactivation_count {
    label: "Instances w/ User Deactivation"
    description: "The count of servers with Team Enable User Deactivation enabled."
    type: count_distinct
    group_label: " Team Config: Instance Counts"
    sql: case when ${enable_user_deactivation} then ${server_id} else null end ;;
  }

  measure: enable_x_to_leave_channels_from_lhs_count {
    label: "Instances w/ X To Leave Channels From Lhs"
    description: "The count of servers with Team Enable X To Leave Channels From Lhs enabled."
    type: count_distinct
    group_label: " Team Config: Instance Counts"
    sql: case when ${enable_x_to_leave_channels_from_lhs} then ${server_id} else null end ;;
  }

  measure: experimental_enable_automatic_replies_count {
    label: "Instances w/ Enable Automatic Replies"
    description: "The count of servers with Team Experimental Enable Automatic Replies enabled."
    type: count_distinct
    group_label: " Team Config: Instance Counts"
    sql: case when ${experimental_enable_automatic_replies} then ${server_id} else null end ;;
  }

  measure: experimental_primary_team_count {
    label: "Instances w/ Experimental Primary Team"
    description: "The count of servers with Team Experimental Primary Team enabled."
    type: count_distinct
    group_label: " Team Config: Instance Counts"
    sql: case when ${experimental_primary_team} then ${server_id} else null end ;;
  }

  measure: experimental_town_square_is_hidden_in_lhs_count {
    label: "Instances w/ Experimental Town Square Is Hidden In Lhs"
    description: "The count of servers with Team Experimental Town Square Is Hidden In Lhs enabled."
    type: count_distinct
    group_label: " Team Config: Instance Counts"
    sql: case when ${experimental_town_square_is_hidden_in_lhs} then ${server_id} else null end ;;
  }

  measure: experimental_town_square_is_read_only_count {
    label: "Instances w/ Experimental Town Square Is Read Only"
    description: "The count of servers with Team Experimental Town Square Is Read Only enabled."
    type: count_distinct
    group_label: " Team Config: Instance Counts"
    sql: case when ${experimental_town_square_is_read_only} then ${server_id} else null end ;;
  }

  measure: experimental_view_archived_channels_count {
    label: "Instances w/ Experimental View Archived Channels"
    description: "The count of servers with Team Experimental View Archived Channels enabled."
    type: count_distinct
    group_label: " Team Config: Instance Counts"
    sql: case when ${experimental_view_archived_channels} then ${server_id} else null end ;;
  }

  measure: isdefault_custom_brand_text_count {
    label: "Instances w/ Isdefault Custom Brand Text"
    description: "The count of servers with Team Isdefault Custom Brand Text enabled."
    type: count_distinct
    group_label: " Team Config: Instance Counts"
    sql: case when ${isdefault_custom_brand_text} then ${server_id} else null end ;;
  }

  measure: isdefault_custom_description_text_count {
    label: "Instances w/ Isdefault Custom Description Text"
    description: "The count of servers with Team Isdefault Custom Description Text enabled."
    type: count_distinct
    group_label: " Team Config: Instance Counts"
    sql: case when ${isdefault_custom_description_text} then ${server_id} else null end ;;
  }

  measure: isdefault_site_name_count {
    label: "Instances w/ Isdefault Site Name"
    description: "The count of servers with Team Isdefault Site Name enabled."
    type: count_distinct
    group_label: " Team Config: Instance Counts"
    sql: case when ${isdefault_site_name} then ${server_id} else null end ;;
  }

  measure: isdefault_user_status_away_timeout_count {
    label: "Instances w/ Isdefault User Status Away Timeout"
    description: "The count of servers with Team Isdefault User Status Away Timeout enabled."
    type: count_distinct
    group_label: " Team Config: Instance Counts"
    sql: case when ${isdefault_user_status_away_timeout} then ${server_id} else null end ;;
  }

  measure: lock_teammate_name_display_count {
    label: "Instances w/ Lock Teammate Name Display"
    description: "The count of servers with Team Lock Teammate Name Display enabled."
    type: count_distinct
    group_label: " Team Config: Instance Counts"
    sql: case when ${lock_teammate_name_display} then ${server_id} else null end ;;
  }

  measure: view_archived_channels_count {
    label: "Instances w/ View Archived Channels"
    description: "The count of servers with Team View Archived Channels enabled."
    type: count_distinct
    group_label: " Team Config: Instance Counts"
    sql: case when ${view_archived_channels} then ${server_id} else null end ;;
  }

  measure: allowed_themes_sum {
    description: "The sum of Allowed Themes per grouping."
    group_label: "Theme Configuration"
    type: sum
    sql: ${allowed_themes} ;;
  }

  measure: allowed_themes_avg {
    description: "The average Allowed Themes per grouping."
    group_label: "Theme Configuration"
    type: average
    sql: ${allowed_themes} ;;
  }

  measure: allow_custom_themes_count {
    label: "Instances w/ Allow Custom Themes"
    description: "The count of servers with Theme Allow Custom Themes enabled."
    type: count_distinct
    group_label: " Theme Config: Instance Counts"
    sql: case when ${allow_custom_themes} then ${server_id} else null end ;;
  }

  measure: enable_theme_selection_count {
    label: "Instances w/ Enable Theme Selection"
    description: "The count of servers with Theme Enable Theme Selection enabled."
    type: count_distinct
    group_label: " Theme Config: Instance Counts"
    sql: case when ${enable_theme_selection} then ${server_id} else null end ;;
  }

  measure: isdefault_default_theme_count {
    label: "Instances w/ Isdefault Default Theme"
    description: "The count of servers with Theme Isdefault Default Theme enabled."
    type: count_distinct
    group_label: " Theme Config: Instance Counts"
    sql: case when ${isdefault_default_theme} then ${server_id} else null end ;;
  }

  measure: isdefault_supported_timezones_path_count {
    label: "Instances w/ Isdefault Supported Timezones Path"
    description: "The count of servers with Timezone Isdefault Supported Timezones Path enabled."
    type: count_distinct
    group_label: " Timezone Config: Instance Counts"
    sql: case when ${isdefault_supported_timezones_path} then ${server_id} else null end ;;
  }

  measure: enable_count {
    label: "Instances w/ Webrtc Enable"
    description: "The count of servers with Webrtc Enable enabled."
    type: count_distinct
    group_label: " WebRTC Config: Instance Counts"
    sql: case when ${enable} then ${server_id} else null end ;;
  }

  measure: isdefault_stun_uri_count {
    label: "Instances w/ Isdefault Stun Uri"
    description: "The count of servers with Webrtc Isdefault Stun Uri enabled."
    type: count_distinct
    group_label: " WebRTC Config: Instance Counts"
    sql: case when ${isdefault_stun_uri} then ${server_id} else null end ;;
  }

  measure: isdefault_turn_uri_count {
    label: "Instances w/ Isdefault Turn Uri"
    description: "The count of servers with Webrtc Isdefault Turn Uri enabled."
    type: count_distinct
    group_label: " WebRTC Config: Instance Counts"
    sql: case when ${isdefault_turn_uri} then ${server_id} else null end ;;
  }

  measure: avg_posts_per_user_per_day2 {
    group_label: "Activity Diagnostics"
    label: "Avg. Posts Per Active User (Activity)"
    type: number
    sql: (${posts_previous_day_sum}::float/nullif(${active_users_daily_sum}::float,0)) ;;
    drill_fields: [cse_drill*]
    value_format_name: decimal_1
  }

  measure: median_posts_per_user_per_day2 {
    group_label: "Activity Diagnostics"
    label: "Median Posts Per Active User (Activity)"
    type: number
    sql: median(${posts_previous_day}::float/nullif(${active_users_daily}::float,0)) ;;
    value_format_name: decimal_1
  }

  measure: avg_posts_per_user_per_day {
    group_label: "Server-Level User Events"
    label: "Avg. Posts Per Active User (Events)"
    type: number
    sql: sum(${server_events_by_date.post_events})::FLOAT/SUM(NULLIF(${server_events_by_date.dau_total}::float,0)) ;;
    value_format_name: decimal_1
    drill_fields: [cse_drill*]
  }

  measure: median_posts_per_user_per_day {
    group_label: "Server-Level User Events"
    label: "Median Posts Per Active User (Events)"
    type: median
    sql: ${server_events_by_date.post_events}::FLOAT/NULLIF(${server_events_by_date.users}::float,0) ;;
    value_format_name: decimal_1
    drill_fields: [server_fact*]
  }

  measure: posts_sum2 {
    group_label: "Server-Level User Events"
    label: "Posts (Events)"
    description: "The sum of all posts performed by all active user across all servers within the given grouping (from events telemetry)."
    type: sum
    sql: ${posts2} ;;
    drill_fields: [server_fact*]
    value_format_name: decimal_0
  }

  measure: events_sum {
    group_label: "Server-Level User Events"
    label: "Total Events"
    description: "The sum of all events performed by all active user across all servers within the given grouping."
    type: sum
    sql: ${events} ;;
    drill_fields: [server_fact*]
    value_format_name: decimal_0
  }

  measure: dau_sum {
    group_label: "Server-Level User Events"
    label: "DAU (Events)"
    description: "The sum of all daily active users across all servers within the given grouping."
    type: number
    sql: SUM(${dau}) ;;
    value_format_name: decimal_0
    drill_fields: []
  }

  measure: dau_avg {
    group_label: "Server-Level User Events"
    label: "Daily Active Users (Avg)"
    description: "The average daily active users across all servers within the given grouping."
    type: number
    sql: avg(${dau}) ;;
    value_format_name: decimal_1
  }

  measure: dau_median {
    group_label: "Server-Level User Events"
    label: "Daily Active User (Median)"
    description: "The median daily active users across all servers within the given grouping."
    type: number
    sql: median(${dau}) ;;
    value_format_name: decimal_1
  }

  measure: mau_sum {
    group_label: "Server-Level User Events"
    label: "MAU (Sum)"
    description: "The sum of all daily active users across all servers within the given grouping."
    type: number
    sql: SUM(CASE WHEN ${mau} >= COALESCE(${active_users_monthly},0) THEN ${mau} ELSE ${active_users_monthly} END) ;;
    value_format_name: decimal_0
  }

  measure: server_w_active_users_count {
    group_label: "  Instance Counts"
    label: "  Servers w/ Active Users"
    description: "Use this for counting distinct Server ID's for servers that have active users > 0 (from activity diagnostics telemetry) across dimensions."
    type: count_distinct
    sql: CASE WHEN  ${active_user_count} > 0 THEN ${server_id} ELSE NULL END;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, days_since_first_telemetry_enabled, user_count, active_user_count, system_admins, server_fact.first_telemetry_active_date, server_fact.last_telemetry_active_date]
  }

  measure: server_7days_w_active_users_count {
    group_label: "  Instance Counts"
    label: "  Instances >=7 Days Old w/ Active Users"
    description: "Use this for counting distinct Server ID's for servers that are >= 7 days old and have active users > 0 across dimensions."
    type: count_distinct
    sql: CASE WHEN datediff(day, ${server_fact.first_active_date}, ${logging_date})  >= 7 AND
            CASE WHEN COALESCE(${active_users_daily},0) >= COALESCE(${active_user_count},0) THEN COALESCE(${active_users_daily},0) ELSE COALESCE(${active_user_count},0) END > 0
          THEN ${server_id} ELSE NULL END;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, days_since_first_telemetry_enabled, user_count, active_user_count, system_admins, server_fact.first_telemetry_active_date, server_fact.last_telemetry_active_date]
  }

  measure: server_1days_w_active_users_count {
    group_label: "  Instance Counts"
    label: "Instance >=1 Day Old w/ Active Users"
    description: "Use this for counting distinct Server ID's for servers that are >= 1 days old and have active users > 0 across dimensions."
    type: count_distinct
    sql: CASE WHEN datediff(day, ${server_fact.first_active_date}, ${logging_date})  >= 1 AND
            CASE WHEN COALESCE(${active_users_daily},0) >= COALESCE(${active_user_count},0) THEN COALESCE(${active_users_daily},0) ELSE COALESCE(${active_user_count},0) END > 0
          THEN ${server_id} ELSE NULL END;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, days_since_first_telemetry_enabled, user_count, active_user_count, system_admins, server_fact.first_telemetry_active_date, server_fact.last_telemetry_active_date]
  }

  measure: server_30days_w_active_users_count {
    group_label: "  Instance Counts"
    label: "  Instances >=4 Weeks Old w/ Active Users"
    description: "Use this for counting distinct Server ID's for servers that are >= 30 days old and have active users > 0 across dimensions."
    type: count_distinct
    sql: CASE WHEN datediff(day, ${server_fact.first_active_date}, ${logging_date})  >= 30 AND ${active_users_daily} > 0 THEN ${server_id} ELSE NULL END;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, days_since_first_telemetry_enabled, user_count, active_user_count, system_admins, server_fact.first_telemetry_active_date, server_fact.last_telemetry_active_date]
  }

  measure: server_30days_count {
    group_label: "  Instance Counts"
    label: "  Servers >=4 Weeks Old"
    description: "Use this for counting distinct Server ID's for servers that are >= 60 days old across dimensions."
    type: count_distinct
    sql: CASE WHEN datediff(day, ${server_fact.first_active_date}, ${logging_date})  >= 30 THEN ${server_id} ELSE NULL END;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, days_since_first_telemetry_enabled, user_count, active_user_count, system_admins, server_fact.first_telemetry_active_date, server_fact.last_telemetry_active_date]
  }

  measure: server_60days_w_active_users_count {
    group_label: "  Instance Counts"
    label: "  Servers >=8 Weeks Old w/ Active Users"
    description: "Use this for counting distinct Server ID's for servers that are >= 60 days old and have active users > 0 across dimensions."
    type: count_distinct
    sql: CASE WHEN datediff(day, ${server_fact.first_active_date}, ${logging_date})  >= 60 AND
            CASE WHEN COALESCE(${active_users_daily},0) >= COALESCE(${active_user_count},0) THEN COALESCE(${active_users_daily},0) ELSE COALESCE(${active_user_count},0) END > 0
          THEN ${server_id} ELSE NULL END;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, days_since_first_telemetry_enabled, user_count, active_user_count, system_admins, server_fact.first_telemetry_active_date, server_fact.last_telemetry_active_date]
  }

  measure: server_60days_count {
    group_label: "  Instance Counts"
    label: "  Servers >=8 Weeks Old"
    description: "Use this for counting distinct Server ID's for servers that are >= 60 days old across dimensions."
    type: count_distinct
    sql: CASE WHEN datediff(day, ${server_fact.first_active_date}, ${logging_date})  >= 60 THEN ${server_id} ELSE NULL END;;
    drill_fields: [logging_date, server_id, license_server_fact.customer_id, license_server_fact.customer_name, version, days_since_first_telemetry_enabled, user_count, active_user_count, system_admins, server_fact.first_telemetry_active_date, server_fact.last_telemetry_active_date]
  }

  measure: license_expire_date_max {
    label: "Max. License Expire Date"
    group_label: "License Configuration"
    type: date
    sql: MAX(${expire_date}::date) ;;
  }

  measure: license_utilization {
    description: "The license utilization represented as registered user/licensed user per grouping."
    type: number
    sql: ${registered_users_sum}/${license_server_fact.users_sum} ;;
  }

  measure: active_license_utilization {
    description: "The license utilization represented as active user/licensed user per grouping."
    type: number
    sql: ${active_users_daily_sum}/${license_server_fact.users_sum} ;;
  }
}
