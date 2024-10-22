view: dim_daily_server_config {
  label: "Daily Server Configuration"
  sql_table_name: "MART_PRODUCT"."DIM_DAILY_SERVER_CONFIG" ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Daily Server ID" in Explore.

  dimension: daily_server_id {
    type: string
    sql: ${TABLE}.daily_server_id ;;
    primary_key: yes
    hidden: yes
  }

  # from config_oauth
  dimension: is_gitlab_enabled {
    type: yesno
    sql: ${TABLE}.is_gitlab_enabled ;;
    group_label: "Configuration: OAuth"
    label: "Is Gitlab Enabled?"
  }

  dimension: is_google_enabled {
    type: yesno
    sql: ${TABLE}.is_google_enabled ;;
    group_label: "Configuration: OAuth"
    label: "Is Google Enabled?"
  }

  dimension: is_office365_enabled {
    type: yesno
    sql: ${TABLE}.is_office365_enabled ;;
    group_label: "Configuration: OAuth"
    label: "Is Office365 Enabled?"
  }

  dimension: is_openid_enabled {
    type: yesno
    sql: ${TABLE}.is_openid_enabled ;;
    group_label: "Configuration: OAuth"
    label: "Is OpenID Enabled?"
  }

  dimension: is_openid_gitlab_enabled {
    type: yesno
    sql: ${TABLE}.is_openid_gitlab_enabled ;;
    group_label: "Configuration: OAuth"
    label: "Is OpenID - Gitlab Enabled?"
  }

  dimension: is_openid_google_enabled {
    type: yesno
    sql: ${TABLE}.is_openid_google_enabled ;;
    group_label: "Configuration: OAuth"
    label: "Is OpenID - Google Enabled?"
  }

  dimension: is_openid_office365_enabled {
    type: yesno
    sql: ${TABLE}.is_openid_office365_enabled ;;
    group_label: "Configuration: OAuth"
    label: "Is OpenID - Office365 Enabled?"
  }

  # from config_ldap
   
  dimension: connection_security_ldap {
    type: string
    sql: ${TABLE}.connection_security_ldap ;;
    group_label: "Configuration: LDAP"
    label: "Connection Security"
  }

  dimension: enable_ldap {
    type: yesno
    sql: ${TABLE}.enable_ldap ;;
    group_label: "Configuration: LDAP"
    label: "Enable LDAP"
  }

  dimension: enable_admin_filter {
    type: yesno
    sql: ${TABLE}.enable_admin_filter ;;
    group_label: "Configuration: LDAP"
    label: "Enable Admin Filter"
  }

  dimension: enable_sync {
    type: yesno
    sql: ${TABLE}.enable_sync ;;
    group_label: "Configuration: LDAP"
    label: "Enable Sync"
  }
  
  dimension: isdefault_email_attribute_ldap {
    type: yesno
    sql: ${TABLE}.isdefault_email_attribute_ldap ;;
    group_label: "Configuration: LDAP"
    label: "Isdefault Email Attribute LDAP"
  }

  dimension: isdefault_first_name_attribute_ldap {
    type: yesno
    sql: ${TABLE}.isdefault_first_name_attribute_ldap ;;
    group_label: "Configuration: LDAP"
    label: "Isdefault First Name Attribute LDAP"
  }

  dimension: isdefault_group_display_name_attribute {
    type: yesno
    sql: ${TABLE}.isdefault_group_display_name_attribute ;;
    group_label: "Configuration: LDAP"
    label: "Isdefault Group Display Name Attribute"
  }

  dimension: isdefault_group_id_attribute {
    type: yesno
    sql: ${TABLE}.isdefault_group_id_attribute ;;
    group_label: "Configuration: LDAP"
    label: "Isdefault Group Id Attribute"
  }

  dimension: isdefault_id_attribute_ldap {
    type: yesno
    sql: ${TABLE}.isdefault_id_attribute_ldap ;;
    group_label: "Configuration: LDAP"
    label: "Isdefault Id Attribute LDAP"
  }

  dimension: isdefault_last_name_attribute_ldap {
    type: yesno
    sql: ${TABLE}.isdefault_last_name_attribute_ldap ;;
    group_label: "Configuration: LDAP"
    label: "Isdefault Last Name Attribute LDAP"
  }

  dimension: isdefault_login_button_border_color_ldap {
    type: yesno
    sql: ${TABLE}.isdefault_login_button_border_color_ldap ;;
    group_label: "Configuration: LDAP"
    label: "Isdefault Login Button Border Color LDAP"
  }

  dimension: isdefault_login_button_color_ldap {
    type: yesno
    sql: ${TABLE}.isdefault_login_button_color_ldap ;;
    group_label: "Configuration: LDAP"
    label: "Isdefault Login Button Color LDAP"
  }

  dimension: isdefault_login_button_text_color_ldap {
    type: yesno
    sql: ${TABLE}.isdefault_login_button_text_color_ldap ;;
    group_label: "Configuration: LDAP"
    label: "Isdefault Login Button Text Color LDAP"
  }

  dimension: isdefault_login_field_name {
    type: yesno
    sql: ${TABLE}.isdefault_login_field_name ;;
    group_label: "Configuration: LDAP"
    label: "Isdefault Login Field Name"
  }

  dimension: isdefault_login_id_attribute {
    type: yesno
    sql: ${TABLE}.isdefault_login_id_attribute ;;
    group_label: "Configuration: LDAP"
    label: "Isdefault Login Id Attribute"
  }

  dimension: isdefault_nickname_attribute_ldap {
    type: yesno
    sql: ${TABLE}.isdefault_nickname_attribute_ldap ;;
    group_label: "Configuration: LDAP"
    label: "Isdefault Nickname Attribute LDAP"
  }

  dimension: isdefault_position_attribute_ldap {
    type: yesno
    sql: ${TABLE}.isdefault_position_attribute_ldap ;;
    group_label: "Configuration: LDAP"
    label: "Isdefault Position Attribute LDAP"
  }

  dimension: isdefault_username_attribute_ldap {
    type: yesno
    sql: ${TABLE}.isdefault_username_attribute_ldap ;;
    group_label: "Configuration: LDAP"
    label: "Isdefault Username Attribute LDAP"
  }

  dimension: isempty_admin_filter {
    type: yesno
    sql: ${TABLE}.isempty_admin_filter ;;
    group_label: "Configuration: LDAP"
    label: "Isempty Admin Filter"
  }

  dimension: isempty_group_filter {
    type: yesno
    sql: ${TABLE}.isempty_group_filter ;;
    group_label: "Configuration: LDAP"
    label: "Isempty Group Filter"
  }

  dimension: isempty_guest_filter {
    type: yesno
    sql: ${TABLE}.isempty_guest_filter ;;
    group_label: "Configuration: LDAP"
    label: "Isempty Guest Filter"
  }

  dimension: isnotempty_picture_attribute {
    type: yesno
    sql: ${TABLE}.isnotempty_picture_attribute ;;
    group_label: "Configuration: LDAP"
    label: "IsNotEmpty Picture Attribute"
  }

  dimension: isnotempty_private_key {
    type: yesno
    sql: ${TABLE}.isnotempty_private_key ;;
    group_label: "Configuration: LDAP"
    label: "IsNotEmpty Private Key"
  }

  dimension: isnotempty_public_certificate {
    type: yesno
    sql: ${TABLE}.isnotempty_public_certificate ;;
    group_label: "Configuration: LDAP"
    label: "IsNotEmpty Public Certificate"
  }

  dimension: max_page_size {
    type: number
    sql: ${TABLE}.max_page_size ;;
    group_label: "Configuration: LDAP"
    label: "Maximum Page Size"
  }

  dimension: query_timeout_ldap {
    type: number
    sql: ${TABLE}.query_timeout_ldap ;;
    group_label: "Configuration: LDAP"
    label: "Query Timeout"
  }

  dimension: segment_dedupe_id_ldap {
    type: string
    sql: ${TABLE}.segment_dedupe_id_ldap ;;
    group_label: "Configuration: LDAP"
  }
 
  dimension: skip_certificate_verification {
    type: yesno
    sql: ${TABLE}.skip_certificate_verification ;;
    group_label: "Configuration: LDAP"
    label: "Skip Certificate Verification"
  }

  dimension: sync_interval_minutes {
    type: number
    sql: ${TABLE}.sync_interval_minutes ;;
    group_label: "Configuration: LDAP"
    label: "Sync Interval (minutes)"
  }
  
  # from config_saml

  dimension: enable_saml {
    type: yesno
    sql: ${TABLE}.enable_saml ;;
    group_label: "Configuration: SAML"
    label: "Enable SAML"
  }

  dimension: enable_admin_attribute {
    type: yesno
    sql: ${TABLE}.enable_admin_attribute ;;
    group_label: "Configuration: SAML"
    label: "Enable Admin Attribute"
  }

  dimension: enable_sync_with_ldap {
    type: yesno
    sql: ${TABLE}.enable_sync_with_ldap ;;
    group_label: "Configuration: SAML"
    label: "Enable Sync With LDAP"
  }

  dimension: enable_sync_with_ldap_include_auth {
    type: yesno
    sql: ${TABLE}.enable_sync_with_ldap_include_auth ;;
    group_label: "Configuration: SAML"
    label: "Enable Sync With LDAP Include Auth"
  }

  dimension: encrypt_saml {
    type: yesno
    sql: ${TABLE}.encrypt_saml ;;
    group_label: "Configuration: SAML"
    label: "Encrypt SAML"
  }

  dimension: ignore_guests_ldap_sync {
    type: yesno
    sql: ${TABLE}.ignore_guests_ldap_sync ;;
    group_label: "Configuration: SAML"
    label: "Ignore Guests LDAP Sync Enabled"
  }

  dimension: isdefault_admin_attribute {
    type: yesno
    sql: ${TABLE}.isdefault_admin_attribute ;;
    group_label: "Configuration: SAML"
    label: "Isdefault Admin Attribute"
  }

  dimension: isdefault_canonical_algorithm {
    type: yesno
    sql: ${TABLE}.isdefault_canonical_algorithm ;;
    group_label: "Configuration: SAML"
    label: "Isdefault Canonical Algorithm"
  }

  dimension: isdefault_email_attribute_saml {
    type: yesno
    sql: ${TABLE}.isdefault_email_attribute_saml ;;
    group_label: "Configuration: SAML"
    label: "Isdefault Email Attribute SAML"
  }

  dimension: isdefault_first_name_attribute_saml {
    type: yesno
    sql: ${TABLE}.isdefault_first_name_attribute_saml ;;
    group_label: "Configuration: SAML"
    label: "Isdefault First Name Attribute SAML"
  }

  dimension: isdefault_guest_attribute {
    type: yesno
    sql: ${TABLE}.isdefault_guest_attribute ;;
    group_label: "Configuration: SAML"
    label: "Isdefault Guest Attribute"
  }

  dimension: isdefault_id_attribute_saml {
    type: yesno
    sql: ${TABLE}.isdefault_id_attribute_saml ;;
    group_label: "Configuration: SAML"
    label: "Isdefault Id Attribute SAML"
  }

  dimension: isdefault_last_name_attribute_saml {
    type: yesno
    sql: ${TABLE}.isdefault_last_name_attribute_saml ;;
    group_label: "Configuration: SAML"
    label: "Isdefault Last Name Attribute SAML"
  }

  dimension: isdefault_locale_attribute {
    type: yesno
    sql: ${TABLE}.isdefault_locale_attribute ;;
    group_label: "Configuration: SAML"
    label: "Isdefault Locale Attribute"
  }

  dimension: isdefault_login_button_border_color_saml {
    type: yesno
    sql: ${TABLE}.isdefault_login_button_border_color_saml ;;
    group_label: "Configuration: SAML"
    label: "Isdefault Login Button Border Color SAML"
  }

  dimension: isdefault_login_button_color_saml {
    type: yesno
    sql: ${TABLE}.isdefault_login_button_color_saml ;;
    group_label: "Configuration: SAML"
    label: "Isdefault Login Button Color SAML"
  }

  dimension: isdefault_login_button_text {
    type: yesno
    sql: ${TABLE}.isdefault_login_button_text ;;
    group_label: "Configuration: SAML"
    label: "Isdefault Login Button Text"
  }

  dimension: isdefault_login_button_text_color_saml {
    type: yesno
    sql: ${TABLE}.isdefault_login_button_text_color_saml ;;
    group_label: "Configuration: SAML"
    label: "Isdefault Login Button Text Color SAML"
  }

  dimension: isdefault_nickname_attribute_saml {
    type: yesno
    sql: ${TABLE}.isdefault_nickname_attribute_saml ;;
    group_label: "Configuration: SAML"
    label: "Isdefault Nickname Attribute SAML"
  }

  dimension: isdefault_position_attribute_saml {
    type: yesno
    sql: ${TABLE}.isdefault_position_attribute_saml ;;
    group_label: "Configuration: SAML"
    label: "Isdefault Position Attribute SAML"
  }

  dimension: isdefault_scoping_idp_name {
    type: yesno
    sql: ${TABLE}.isdefault_scoping_idp_name ;;
    group_label: "Configuration: SAML"
    label: "Isdefault Scoping Idp Name"
  }

  dimension: isdefault_scoping_idp_provider_id {
    type: yesno
    sql: ${TABLE}.isdefault_scoping_idp_provider_id ;;
    group_label: "Configuration: SAML"
    label: "Isdefault Scoping Idp Provider Id"
  }

  dimension: isdefault_signature_algorithm {
    type: yesno
    sql: ${TABLE}.isdefault_signature_algorithm ;;
    group_label: "Configuration: SAML"
    label: "Isdefault Signature Algorithm"
  }

  dimension: isdefault_username_attribute_saml {
    type: yesno
    sql: ${TABLE}.isdefault_username_attribute_saml ;;
    group_label: "Configuration: SAML"
    label: "Isdefault Username Attribute SAML"
  }

  dimension: sign_request {
    type: yesno
    sql: ${TABLE}.sign_request ;;
    group_label: "Configuration: SAML"
    label: "Sign Request"
  }

  dimension: verify_saml {
    type: yesno
    sql: ${TABLE}.verify_saml ;;
    group_label: "Configuration: SAML"
    label: "Verify SAML"
  }

  #from config_plugin
  
  dimension: allow_insecure_download_url {
    type: yesno
    sql: ${TABLE}.allow_insecure_download_url ;;
    group_label: "Configuration: Plugin"
    label: "Allow Insecure Download URL"
  }

  dimension: automatic_prepackaged_plugins {
    type: yesno
    sql: ${TABLE}.automatic_prepackaged_plugins ;;
    group_label: "Configuration: Plugin"
    label: "Automatic Prepackaged Plugins"
  }
  
  dimension: is_default_marketplace_url {
    type: yesno
    sql: ${TABLE}.is_default_marketplace_url ;;
    group_label: "Configuration: Plugin"
    label: "Is Default Marketplace URL"
  }
  
  dimension: require_plugin_signature {
    type: yesno
    sql: ${TABLE}.require_plugin_signature ;;
    group_label: "Configuration: Plugin"
    label: "Require Plugin Signature"
  }

  dimension: signature_public_key_files {
    type: number
    sql: ${TABLE}.signature_public_key_files ;;
    group_label: "Configuration: Plugin"
  }

  dimension: enable_plugin {
    type: yesno
    sql: ${TABLE}.enable_plugin ;;
    group_label: "Configuration: Plugin"
    label: " Plugins Enabled"
  }

  dimension: enable_alertmanager {
    type: yesno
    sql: ${TABLE}.enable_alertmanager ;;
    group_label: "Configuration: Plugin"
    label: "Alert Manager Enabled"
  }

  dimension: enable_antivirus {
    type: yesno
    sql: ${TABLE}.enable_antivirus ;;
    group_label: "Configuration: Plugin"
    label: "Antivirus Enabled"
  }

  dimension: enable_autolink {
    type: yesno
    sql: ${TABLE}.enable_autolink ;;
    group_label: "Configuration: Plugin"
    label: "Autolink Enabled"
  }

  dimension: enable_aws_sns {
    type: yesno
    sql: ${TABLE}.enable_aws_sns ;;
    group_label: "Configuration: Plugin"
    label: "AWS SNS Enabled"
  }

  dimension: enable_bitbucket {
    type: yesno
    sql: ${TABLE}.enable_bitbucket ;;
    group_label: "Configuration: Plugin"
    label: "Bitbucket Enabled"
  }

  dimension: enable_confluence {
    type: yesno
    sql: ${TABLE}.enable_confluence ;;
    group_label: "Configuration: Plugin"
    label: "Confluence Enabled"
  }

  dimension: enable_custom_user_attributes {
    type: yesno
    sql: ${TABLE}.enable_custom_user_attributes ;;
    group_label: "Configuration: Plugin"
    label: "Custom User Attributes Enabled"
  }

  dimension: enable_focalboard {
    type: yesno
    sql: ${TABLE}.enable_focalboard ;;
    group_label: "Configuration: Plugin"
    label: "Focalboard Enabled"
  }

  dimension: enable_github {
    type: yesno
    sql: ${TABLE}.enable_github ;;
    group_label: "Configuration: Plugin"
    label: "Github Enabled"
  }

  dimension: enable_gitlab {
    type: yesno
    sql: ${TABLE}.enable_gitlab ;;
    group_label: "Configuration: Plugin"
    label: "Gitlab Enabled"
  }
  
  dimension: enable_health_check {
    type: yesno
    sql: ${TABLE}.enable_health_check ;;
    group_label: "Configuration: Plugin"
    label: "Health Check Enabled"
  }

  dimension: enable_jenkins {
    type: yesno
    sql: ${TABLE}.enable_jenkins ;;
    group_label: "Configuration: Plugin"
    label: "Jenkins Enabled"
  }
  
  dimension: enable_jira {
    type: yesno
    sql: ${TABLE}.enable_jira ;;
    group_label: "Configuration: Plugin"
    label: "Jira Enabled"
  }

  dimension: enable_jitsi {
    type: yesno
    sql: ${TABLE}.enable_jitsi ;;
    group_label: "Configuration: Plugin"
    label: "Jitsi Enabled"
  }
  
  dimension: enable_marketplace {
    type: yesno
    sql: ${TABLE}.enable_marketplace ;;
    group_label: "Configuration: Plugin"
    label: "Marketplace Enabled"
  }
  
  dimension: enable_mattermostprofanityfilter {
    type: yesno
    sql: ${TABLE}.enable_mattermostprofanityfilter ;;
    group_label: "Configuration: Plugin"
    label: "Profanity Filter Enabled"
  }
  
  dimension: enable_mattermost_plugin_azure_devops {
    type: yesno
    sql: ${TABLE}.enable_mattermost_plugin_azure_devops ;;
    group_label: "Configuration: Plugin"
    label: "Azure Devops Enabled"
  }

  dimension: enable_mattermost_plugin_hackerone {
    type: yesno
    sql: ${TABLE}.enable_mattermost_plugin_hackerone ;;
    group_label: "Configuration: Plugin"
    label: "HackerOne Enabled"
  }

  dimension: enable_mattermost_plugin_servicenow {
    type: yesno
    sql: ${TABLE}.enable_mattermost_plugin_servicenow ;;
    group_label: "Configuration: Plugin"
    label: "ServiceNow Enabled"
  }
  
  dimension: enable_mattermost_plugin_servicenow_virtual_agent {
    type: yesno
    sql: ${TABLE}.enable_mattermost_plugin_servicenow_virtual_agent ;;
    group_label: "Configuration: Plugin"
    label: "ServiceNow Virtual Agent Enabled"
  }

  dimension: enable_memes {
    type: yesno
    sql: ${TABLE}.enable_memes ;;
    group_label: "Configuration: Plugin"
    label: "Memes Enabled"
  }

  dimension: enable_mscalendar {
    type: yesno
    sql: ${TABLE}.enable_mscalendar ;;
    group_label: "Configuration: Plugin"
    label: "MS Calendar Enabled"
  }

  dimension: enable_nps {
    type: yesno
    sql: coalesce(${TABLE}.enable_nps, ${enable_nps_survey}) ;;
    group_label: "Configuration: Plugin"
    label: "NPS Enabled"
  }

  dimension: enable_nps_survey {
    type: yesno
    sql: ${TABLE}.enable_nps_survey ;;
    group_label: "Configuration: Plugin"
    label: "NPS Survey Enabled"
  }

  dimension: enable_playbooks {
    type: yesno
    sql: ${TABLE}.enable_playbooks ;;
    group_label: "Configuration: Plugin"
    label: "Playbooks Enabled"
  }

  dimension: enable_remote_marketplace {
    type: yesno
    sql: ${TABLE}.enable_remote_marketplace ;;
    group_label: "Configuration: Plugin"
    label: "Remote Marketplace Enabled"
  }

  dimension: enable_set_default_theme {
    type: yesno
    sql: ${TABLE}.enable_set_default_theme ;;
    group_label: "Configuration: Plugin"
    label: "Set Default Theme Enabled"
  }

  dimension: enable_skype4business {
    type: yesno
    sql: ${TABLE}.enable_skype4business ;;
    group_label: "Configuration: Plugin"
    label: "Skype4Business Enabled"
  }

  dimension: enable_todo {
    type: yesno
    sql: ${TABLE}.enable_todo ;;
    group_label: "Configuration: Plugin"
    label: "ToDo Enabled"
  }

  dimension: enable_uploads {
    type: yesno
    sql: ${TABLE}.enable_uploads ;;
    group_label: "Configuration: Plugin"
    label: "Uploads Enabled"
  }
  
  dimension: enable_webex {
    type: yesno
    sql: ${TABLE}.enable_webex ;;
    group_label: "Configuration: Plugin"
    label: "WebEx Enabled"
  }

  dimension: enable_welcome_bot {
    type: yesno
    sql: ${TABLE}.enable_welcome_bot ;;
    group_label: "Configuration: Plugin"
    label: "Welcome Bot Enabled"
  }
  
  dimension: enable_zoom {
    type: yesno
    sql: ${TABLE}.enable_zoom ;;
    group_label: "Configuration: Plugin"
    label: "Zoom Enabled"
  }
  
  dimension: enable_giphy {
    type: yesno
    sql: ${TABLE}.enable_giphy ;;
    group_label: "Configuration: Plugin"
    label: "Giphy Enabled"
  }

  dimension: enable_digital_ocean {
    type: yesno
    sql: ${TABLE}.enable_digital_ocean ;;
    group_label: "Configuration: Plugin"
    label: "Digital Ocean Enabled"
  }

  dimension: enable_agenda {
    type: yesno
    sql: ${TABLE}.enable_commattermostagenda ;;
    group_label: "Configuration: Plugin"
    label: "Agenda Enabled"
  }

  dimension: enable_mattermost_apps {
    type: yesno
    sql: ${TABLE}.enable_mattermost_apps ;;
    group_label: "Configuration: Plugin"
    label: "Mattermost Apps Enabled"
  }

  dimension: enable_incident_management {
    type: yesno
    sql: ${TABLE}.enable_incident_management ;;
    group_label: "Configuration: Plugin"
    label: "Incident Management Enabled"
    hidden: yes
  }

  dimension: enable_incident_response {
    type: yesno
    sql: ${TABLE}.enable_incident_response ;;
    group_label: "Configuration: Plugin"
    label: "Incident Response Enabled"
    hidden: yes
  }
  
  dimension: enable_materpoll {
    type: yesno
    sql: ${TABLE}.enable_materpoll ;;
    group_label: "Configuration: Plugin"
    label: "Matterpoll Enabled"
  }

  dimension: enable_diceroller {
    type: yesno
    sql: ${TABLE}.enable_diceroller ;;
    group_label: "Configuration: Plugin"
    label: "Dice Roller Enabled"
  }
  
  dimension: enable_comgithubjespinorecommend {
    type: yesno
    sql: ${TABLE}.enable_comgithubjespinorecommend ;;
    group_label: "Configuration: Plugin"
    label: "Channel Recommender Enabled"
  }

  dimension: enable_msteams_sync {
    type: yesno
    sql: ${TABLE}.enable_msteams_sync ;;
    group_label: "Configuration: Plugin"
    label: "MS Teams Sync Enabled"
  }

  dimension: enable_msteams_meetings {
    type: yesno
    sql: ${TABLE}.enable_msteams_meetings ;;
    group_label: "Configuration: Plugin"
    label: "MS Teams Meetings Enabled"
  }
  
  dimension: enable_commattermostpluginchannelexport {
    type: yesno
    sql: ${TABLE}.enable_commattermostpluginchannelexport ;;
    group_label: "Configuration: Plugin"
    label: "Channel Export Enabled"
  }

  dimension: enable_circleci {
    type: yesno
    sql: ${TABLE}.enable_circleci ;;
    group_label: "Configuration: Plugin"
    label: "CircleCI Enabled"
  }

  dimension: version_alertmanager {
    type: string
    sql: ${TABLE}.version_alertmanager ;;
    group_label: "Configuration: Plugin"
    label: "Alert Manager Version"
  }

  dimension: version_antivirus {
    type: string
    sql: ${TABLE}.version_antivirus ;;
    group_label: "Configuration: Plugin"
    label: "Antivirus Version"
  }
  
  dimension: version_autolink {
    type: string
    sql: ${TABLE}.version_autolink ;;
    group_label: "Configuration: Plugin"
    label: "Autolink Version"
  }

  dimension: version_aws_sns {
    type: string
    sql: ${TABLE}.version_aws_sns ;;
    group_label: "Configuration: Plugin"
    label: "AWS SNS Version"
  }

  dimension: version_custom_user_attributes {
    type: string
    sql: ${TABLE}.version_custom_user_attributes ;;
    group_label: "Configuration: Plugin"
    label: "Custom User Attributes Version"
  }

  dimension: version_github {
    type: string
    sql: ${TABLE}.version_github ;;
    group_label: "Configuration: Plugin"
    label: "Github Version"
  }

  dimension: version_gitlab {
    type: string
    sql: ${TABLE}.version_gitlab ;;
    group_label: "Configuration: Plugin"
    label: "Gitlab Version"
  }

  dimension: version_jenkins {
    type: string
    sql: ${TABLE}.version_jenkins ;;
    group_label: "Configuration: Plugin"
    label: "Jenkins Version"
  }

  dimension: version_jira {
    type: string
    sql: ${TABLE}.version_jira ;;
    group_label: "Configuration: Plugin"
    label: "Jira Version"
  }

  dimension: version_nps {
    type: string
    sql: ${TABLE}.version_nps ;;
    group_label: "Configuration: Plugin"
    label: "NPS Version"
  }

  dimension: version_webex {
    type: string
    sql: ${TABLE}.version_webex ;;
    group_label: "Configuration: Plugin"
    label: "WebEx Version"
  }
  
  dimension: version_welcome_bot {
    type: string
    sql: ${TABLE}.version_welcome_bot ;;
    group_label: "Configuration: Plugin"
    label: "Welcome Bot Version"
  }

  dimension: version_zoom {
    type: string
    sql: ${TABLE}.version_zoom ;;
    group_label: "Configuration: Plugin"
    label: "Zoom Version"
  }

  dimension: version_giphy {
    type: string
    sql: ${TABLE}.version_giphy ;;
    group_label: "Configuration: Plugin"
    label: "Giphy Version"
  }

  dimension: version_digital_ocean {
    type: string
    sql: ${TABLE}.version_digital_ocean ;;
    group_label: "Configuration: Plugin"
    label: "Digital Ocean Version"
  }

  dimension: version_confluence {
    type: string
    sql: ${TABLE}.version_confluence ;;
    group_label: "Configuration: Plugin"
    label: "Confluence Version"
  }

  dimension: version_mscalendar {
    type: string
    sql: ${TABLE}.version_mscalendar ;;
    group_label: "Configuration: Plugin"
    label: "MS Calendar Version"
  }

  dimension: version_incident_management {
    type: string
    sql: ${TABLE}.version_incident_management ;;
    group_label: "Configuration: Plugin"
    label: "Incident Management Version"
  }

  dimension: version_incident_response {
    type: string
    sql: ${TABLE}.version_incident_response ;;
    group_label: "Configuration: Plugin"
    label: "Incident Management Version"
  }

  dimension: version_todo {
    type: string
    sql: ${TABLE}.version_todo ;;
    group_label: "Configuration: Plugin"
    label: "ToDo Version"
  }

  dimension: version_memes {
    type: string
    sql: ${TABLE}.version_memes ;;
    group_label: "Configuration: Plugin"
    label: "Memes Version"
  }

  dimension: version_jitsi {
    type: string
    sql: ${TABLE}.version_jitsi ;;
    group_label: "Configuration: Plugin"
    label: "Jitsi Version"
  }

  dimension: version_skype4business {
    type: string
    sql: ${TABLE}.version_skype4business ;;
    group_label: "Configuration: Plugin"
    label: "Skype4Business Version"
  }
  
  dimension: version_mattermostprofanityfilter {
    type: string
    sql: ${TABLE}.version_mattermostprofanityfilter ;;
    group_label: "Configuration: Plugin"
    label: "Profanity Filter Version"
  }

  dimension: version_matterpoll {
    type: string
    sql: ${TABLE}.version_matterpoll ;;
    group_label: "Configuration: Plugin"
    label: "Matterpoll Version"
  }

  dimension: version_comgithubjespinorecommend {
    type: string
    sql: ${TABLE}.version_comgithubjespinorecommend ;;
    group_label: "Configuration: Plugin"
    label: "Channel Recommender Version"
  }

  dimension: version_agenda {
    type: string
    sql: ${TABLE}.version_commattermostagenda ;;
    group_label: "Configuration: Plugin"
    label: "Agenda Version"
  }

  dimension: version_msteams_meetings {
    type: string
    sql: ${TABLE}.version_msteams_meetings ;;
    group_label: "Configuration: Plugin"
    label: "MS Teams Meetings Version"
  }

  dimension: version_commattermostpluginchannelexport {
    type: string
    sql: ${TABLE}.version_commattermostpluginchannelexport ;;
    group_label: "Configuration: Plugin"
    label: "Channel Export Version"
  }

  dimension: version_comnilsbrinkmannicebreaker {
    type: string
    sql: ${TABLE}.version_comnilsbrinkmannicebreaker ;;
    group_label: "Configuration: Plugin"
    label: "Icebreaker Version"
  }

  dimension: version_mattermost_apps {
    type: string
    sql: ${TABLE}.version_mattermost_apps ;;
    group_label: "Configuration: Plugin"
    label: "Mattermost Apps Version"
  }

  dimension: version_circleci {
    type: string
    sql: ${TABLE}.version_circleci ;;
    group_label: "Configuration: Plugin"
    label: "CircleCI Version"
  }

  dimension: version_diceroller {
    type: string
    sql: ${TABLE}.version_diceroller ;;
    group_label: "Configuration: Plugin"
    label: "Dice Roller Version"
  }
  
  dimension: version_focalboard {
    type: string
    sql: ${TABLE}.version_focalboard ;;
    group_label: "Configuration: Plugin"
    label: "Focalboard Version"
  }

  #from config_service
  
  dimension: allow_cookies_for_subdomains {
    type: yesno
    sql: ${TABLE}.allow_cookies_for_subdomains ;;
    group_label: "Configuration: Service"
    label: "Allow Cookies for Subdomains Enabled"
  }

  dimension: allow_edit_post_service {
    type: string
    sql: ${TABLE}.allow_edit_post_service ;;
    group_label: "Configuration: Service"
    label: "Allow Edit Post"
  }
 
  dimension: allow_persistent_notifications {
    type: yesno
    sql: ${TABLE}.allow_persistent_notifications ;;
    group_label: "Configuration: Service"
    label: "Allow Persistent Notifications"
  }

  dimension: allow_persistent_notifications_for_guests {
    type: yesno
    sql: ${TABLE}.allow_persistent_notifications_for_guests ;;
    group_label: "Configuration: Service"
    label: "Allow Persistent Notifications For Guests"
  }

  dimension: allow_synced_drafts {
    type: yesno
    sql: ${TABLE}.allow_synced_drafts ;;
    group_label: "Configuration: Service"
    label: "Allow Synced Drafts"
  }

  dimension: close_unused_direct_messages {
    type: yesno
    sql: ${TABLE}.close_unused_direct_messages ;;
    group_label: "Configuration: Service"
    label: "Close Unused Direct Messages"
  }

  dimension: cluster_log_timeout_milliseconds {
    type: number
    sql: ${TABLE}.close_unused_direct_messages ;;
    group_label: "Configuration: Service"
    label: "Cluster Log Timeout (ms)"
  }

  dimension: collapsed_threads {
    type: string
    sql: ${TABLE}.collapsed_threads ;;
    group_label: "Configuration: Service"
    label: "Collapsed Threads Status"
  }
  
  dimension: connection_security_service {
    type: string
    sql: ${TABLE}.connection_security_service ;;
    group_label: "Configuration: Service"
  }
  
  dimension: cors_allow_credentials {
    type: yesno
    sql: ${TABLE}.cors_allow_credentials ;;
    group_label: "Configuration: Service"
    label: "Cors Allow Credentials"
  }

  dimension: cors_debug {
    type: yesno
    sql: ${TABLE}.cors_debug ;;
    group_label: "Configuration: Service"
    label: "Cors Debug"
  }

  dimension: custom_cert_header {
    type: yesno
    sql: ${TABLE}.custom_cert_header ;;
    group_label: "Configuration: Service"
    label: "Custom Cert Header"
  }

  dimension: default_team_name {
    type: yesno
    sql: ${TABLE}.default_team_name ;;
    group_label: "Configuration: Service"
    label: "Default Team Name"
  }

  dimension: developer_flags {
    type: yesno
    sql: ${TABLE}.developer_flags ;;
    group_label: "Configuration: Service"
    label: "Developer Flags"
  }

  dimension: disable_bots_when_owner_is_deactivated {
    type: yesno
    sql: ${TABLE}.disable_bots_when_owner_is_deactivated ;;
    group_label: "Configuration: Service"
    label: "Disable Bots When Owner Is Deactivated"
  }

  dimension: disable_legacy_mfa {
    type: yesno
    sql: ${TABLE}.disable_legacy_mfa ;;
    group_label: "Configuration: Service"
    label: "Disable Legacy MFA"
  }
  
  dimension: enable_apiv3 {
    type: yesno
    sql: ${TABLE}.enable_apiv3 ;;
    group_label: "Configuration: Service"
    label: "Enable Apiv3"
  }
  
  dimension: enable_api_channel_deletion {
    type: yesno
    sql: ${TABLE}.enable_api_channel_deletion ;;
    group_label: "Configuration: Service"
    label: "Enable API Channel Deletion"
  }

  dimension: enable_api_post_deletion {
    type: yesno
    sql: ${TABLE}.enable_api_post_deletion ;;
    group_label: "Configuration: Service"
    label: "Enable API Post Deletion"
  }

  dimension: enable_api_team_deletion {
    type: yesno
    sql: ${TABLE}.enable_api_team_deletion ;;
    group_label: "Configuration: Service"
    label: "Enable API Team Deletion"
  }

  dimension: enable_api_trigger_admin_notification {
    type: yesno
    sql: ${TABLE}.enable_api_trigger_admin_notification ;;
    group_label: "Configuration: Service"
    label: "Enable API Trigger Admin Notification"
  }
  
  dimension: enable_api_user_deletion {
    type: yesno
    sql: ${TABLE}.enable_api_user_deletion ;;
    group_label: "Configuration: Service"
    label: "Enable API User Deletion"
  }

  dimension: enable_bot_account_creation {
    type: yesno
    sql: ${TABLE}.enable_bot_account_creation ;;
    group_label: "Configuration: Service"
    label: "Enable Bot Account Creation"
  }

  dimension: enable_channel_viewed_messages_service {
    type: yesno
    sql: ${TABLE}.enable_channel_viewed_messages_service ;;
    group_label: "Configuration: Service"
    label: "Enable Channel Viewed Messages Service"
  }

   dimension: enable_commands_service {
    type: yesno
    sql: ${TABLE}.enable_commands_service ;;
    group_label: "Configuration: Service"
    label: "Enable Commands Service"
  }

  dimension: enable_custom_emoji_service {
    type: yesno
    sql: ${TABLE}.enable_custom_emoji_service ;;
    group_label: "Configuration: Service"
    label: "Enable Custom Emoji Service"
  }

  dimension: enable_developer_service {
    type: yesno
    sql: ${TABLE}.enable_developer_service ;;
    group_label: "Configuration: Service"
    label: "Enable Developer Service"
  }

   dimension: enable_email_invitations {
    type: yesno
    sql: ${TABLE}.enable_email_invitations ;;
    group_label: "Configuration: Service"
    label: "Enable Email Invitations"
  }

  dimension: enable_emoji_picker_service {
    type: yesno
    sql: ${TABLE}.enable_emoji_picker_service ;;
    group_label: "Configuration: Service"
    label: "Enable Emoji Picker Service"
  }

  dimension: enable_file_search {
    type: yesno
    sql: ${TABLE}.enable_file_search ;;
    group_label: "Configuration: Service"
    label: "File Search Enabled"
  }

  dimension: enable_gif_picker {
    type: yesno
    sql: ${TABLE}.enable_gif_picker ;;
    group_label: "Configuration: Service"
    label: "Enable Gif Picker"
  }

  dimension: enable_incoming_webhooks_service {
    type: yesno
    sql: ${TABLE}.enable_incoming_webhooks_service ;;
    group_label: "Configuration: Service"
    label: "Enable Incoming Webhooks Service"
  }

  dimension: enable_insecure_outgoing_connections_service {
    type: yesno
    sql: ${TABLE}.enable_insecure_outgoing_connections_service ;;
    group_label: "Configuration: Service"
    label: "Enable Insecure Outgoing Connections Service"
  }

   dimension: enable_latex {
    type: yesno
    sql: ${TABLE}.enable_latex ;;
    group_label: "Configuration: Service"
    label: "Enable Latex"
  }

   dimension: enable_legacy_sidebar {
    type: yesno
    sql: ${TABLE}.enable_legacy_sidebar ;;
    group_label: "Configuration: Service"
    label: "Legacy Sidebar Enabled"
  }

  dimension: enable_link_previews {
    type: yesno
    sql: ${TABLE}.enable_link_previews ;;
    group_label: "Configuration: Service"
    label: "Link Preview Enabled"
  }

  dimension: enable_local_mode {
    type: yesno
    sql: ${TABLE}.enable_local_mode ;;
    group_label: "Configuration: Service"
    label: "Local Mode Enabled"
  }

  dimension: enable_multifactor_authentication_service {
    type: yesno
    sql: ${TABLE}.enable_multifactor_authentication_service ;;
    group_label: "Configuration: Service"
    label: "Enable Multifactor Authentication Service"
  }

  dimension: enable_oauth_service_provider_service {
    type: yesno
    sql: ${TABLE}.enable_oauth_service_provider_service ;;
    group_label: "Configuration: Service"
    label: "Enable OAuth Service Provider Service"
  }

  dimension: enable_onboarding_flow {
    type: yesno
    sql: ${TABLE}.enable_onboarding_flow ;;
    group_label: "Configuration: Service"
    label: "Enable Onboarding Flow"
  }

  dimension: enable_only_admin_integrations_service {
    type: yesno
    sql: ${TABLE}.enable_only_admin_integrations_service ;;
    group_label: "Configuration: Service"
    label: "Enable Only Admin Integrations Service"
  }

  dimension: enable_opentracing {
    type: yesno
    sql: ${TABLE}.enable_opentracing ;;
    group_label: "Configuration: Service"
    label: "Enable Open Tracing"
  }

  dimension: enable_outgoing_oauth_connections {
    type: yesno
    sql: ${TABLE}.enable_outgoing_oauth_connections ;;
    group_label: "Configuration: Service"
    label: "Enable Outgoing Oauth Connections"
  }

   dimension: enable_outgoing_webhooks {
    type: yesno
    sql: ${TABLE}.enable_outgoing_webhooks ;;
    group_label: "Configuration: Service"
    label: "Enable Outgoing Webhooks"
  }
  
  dimension: enable_permalink_previews {
    type: yesno
    sql: ${TABLE}.enable_permalink_previews ;;
    group_label: "Configuration: Service"
    label: "Enable Permalink Previews"
  }

  dimension: enable_post_icon_override {
    type: yesno
    sql: ${TABLE}.enable_post_icon_override ;;
    group_label: "Configuration: Service"
    label: "Enable Post Icon Override"
  }

  dimension: enable_post_search {
    type: yesno
    sql: ${TABLE}.enable_post_search ;;
    group_label: "Configuration: Service"
    label: "Enable Post Search"
  }

  dimension: enable_post_username_override {
    type: yesno
    sql: ${TABLE}.enable_post_username_override ;;
    group_label: "Configuration: Service"
    label: "Enable Post Username Override"
  }

   dimension: enable_preview_features {
    type: yesno
    sql: ${TABLE}.enable_preview_features ;;
    group_label: "Configuration: Service"
    label: "Enable Preview Features"
  }

   dimension: enable_security_fix_alert {
    type: yesno
    sql: ${TABLE}.enable_security_fix_alert ;;
    group_label: "Configuration: Service"
    label: "Enable Security Fix Alert"
  }

  dimension: enable_svgs {
    type: yesno
    sql: ${TABLE}.enable_svgs ;;
    group_label: "Configuration: Service"
    label: "Enable SVG's"
  }

  dimension: enable_testing {
    type: yesno
    sql: ${TABLE}.enable_testing ;;
    group_label: "Configuration: Service"
    label: "Enable Testing"
  }

  dimension: enable_tutorial {
    type: yesno
    sql: ${TABLE}.enable_tutorial ;;
    group_label: "Configuration: Service"
    label: "Enable Tutorial"
  }

  dimension: enable_user_access_tokens {
    type: yesno
    sql: ${TABLE}.enable_user_access_tokens ;;
    group_label: "Configuration: Service"
    label: "Enable User Access Tokens"
  }

  dimension: enable_user_statuses {
    type: yesno
    sql: ${TABLE}.enable_user_statuses ;;
    group_label: "Configuration: Service"
    label: "Enable User Statuses"
  }

  dimension: enable_user_typing_messages {
    type: yesno
    sql: ${TABLE}.enable_user_typing_messages ;;
    group_label: "Configuration: Service"
    label: "Enable User Typing Messages"
  }

  dimension: enforce_multifactor_authentication_service {
    type: yesno
    sql: ${TABLE}.enforce_multifactor_authentication_service ;;
    group_label: "Configuration: Service"
    label: "Enforce Multifactor Authentication Service"
  }

  dimension: experimental_channel_organization {
    type: yesno
    sql: ${TABLE}.experimental_channel_organization ;;
    group_label: "Configuration: Service"
    label: "Experimental Channel Organization"
  }

  dimension: experimental_channel_sidebar_organization {
    type: string
    sql: ${TABLE}.experimental_channel_sidebar_organization ;;
    group_label: "Configuration: Service"
    label: "Experimental Channel Sidebar Organization"
  }

  dimension: experimental_data_prefetch {
    type: yesno
    sql: ${TABLE}.experimental_data_prefetch ;;
    group_label: "Configuration: Service"
    label: "Experimental Data Prefetch"
  }

  dimension: experimental_enable_authentication_transfer {
    type: yesno
    sql: ${TABLE}.experimental_enable_authentication_transfer ;;
    group_label: "Configuration: Service"
    label: "Experimental Enable Authentication Transfer"
  }

  dimension: experimental_enable_default_channel_leave_join_messages {
    type: yesno
    sql: ${TABLE}.experimental_enable_default_channel_leave_join_messages ;;
    group_label: "Configuration: Service"
    label: "Experimental Enable Default Channel Leave Join Messages"
  }

  dimension: experimental_enable_hardened_mode {
    type: yesno
    sql: ${TABLE}.experimental_enable_hardened_mode ;;
    group_label: "Configuration: Service"
    label: "Experimental Enable Hardened Mode"
  }

  dimension: experimental_group_unread_channels {
    type: string
    sql: ${TABLE}.experimental_group_unread_channels ;;
    group_label: "Configuration: Service"
  }

  dimension: experimental_ldap_group_sync {
    type: yesno
    sql: ${TABLE}.experimental_ldap_group_sync ;;
    group_label: "Configuration: Service"
    label: "Experimental LDAP Group Sync"
  }

  dimension: experimental_limit_client_config {
    type: yesno
    sql: ${TABLE}.experimental_limit_client_config ;;
    group_label: "Configuration: Service"
    label: "Experimental Limit Client Config"
  }

  dimension: experimental_strict_csrf_enforcement {
    type: yesno
    sql: ${TABLE}.experimental_strict_csrf_enforcement ;;
    group_label: "Configuration: Service"
    label: "Experimental Strict Csrf Enforcement"
  }

  dimension: extend_session_length_with_activity {
    type: yesno
    sql: ${TABLE}.extend_session_length_with_activity ;;
    group_label: "Configuration: Service"
    label: "Extend Session Length w/ Activity"
  }

  dimension: forward_80_to_443 {
    type: yesno
    sql: ${TABLE}.forward_80_to_443 ;;
    group_label: "Configuration: Service"
    label: "Forward 80 To 443"
  }

  dimension: gfycat_api_key {
    type: yesno
    sql: ${TABLE}.gfycat_api_key ;;
    group_label: "Configuration: Service"
    label: "Gfycat Api Key"
  }

  dimension: gfycat_api_secret {
    type: yesno
    sql: ${TABLE}.gfycat_api_secret ;;
    group_label: "Configuration: Service"
    label: "Gfycat Api Secret"
  }

  dimension: isdefault_allowed_untrusted_internal_connections {
    type: yesno
    sql: ${TABLE}.isdefault_allowed_untrusted_internal_connections ;;
    group_label: "Configuration: Service"
    label: "Isdefault Allowed Untrusted Internal Connections"
  }

  dimension: isdefault_allow_cors_from {
    type: yesno
    sql: ${TABLE}.isdefault_allow_cors_from ;;
    group_label: "Configuration: Service"
    label: "Isdefault Allow Cors From"
  }

  dimension: isdefault_cors_exposed_headers {
    type: yesno
    sql: ${TABLE}.isdefault_cors_exposed_headers ;;
    group_label: "Configuration: Service"
    label: "Isdefault Cors Exposed Headers"
  }

  dimension: isdefault_google_developer_key {
    type: yesno
    sql: ${TABLE}.isdefault_google_developer_key ;;
    group_label: "Configuration: Service"
    label: "Isdefault Google Developer Key"
  }

  dimension: isdefault_idle_timeout {
    type: yesno
    sql: ${TABLE}.isdefault_idle_timeout ;;
    group_label: "Configuration: Service"
    label: "Isdefault Idle Timeout"
  }

  dimension: isdefault_image_proxy_options {
    type: yesno
    sql: ${TABLE}.isdefault_image_proxy_options ;;
    group_label: "Configuration: Service"
    label: "Isdefault Image Proxy Options"
  }

  dimension: isdefault_image_proxy_type {
    type: yesno
    sql: ${TABLE}.isdefault_image_proxy_type ;;
    group_label: "Configuration: Service"
    label: "Isdefault Image Proxy Type"
  }

  dimension: isdefault_image_proxy_url {
    type: yesno
    sql: ${TABLE}.isdefault_image_proxy_url ;;
    group_label: "Configuration: Service"
    label: "Isdefault Image Proxy URL"
  }

  dimension: isdefault_read_timeout {
    type: yesno
    sql: ${TABLE}.isdefault_read_timeout ;;
    group_label: "Configuration: Service"
    label: "Isdefault Read Timeout"
  }

  dimension: isdefault_site_url {
    type: yesno
    sql: ${TABLE}.isdefault_site_url ;;
    group_label: "Configuration: Service"
    label: "Isdefault Site URL"
  }

  dimension: isdefault_tls_cert_file {
    type: yesno
    sql: ${TABLE}.isdefault_tls_cert_file ;;
    group_label: "Configuration: Service"
    label: "Isdefault TLS Cert File"
  }

  dimension: isdefault_tls_key_file {
    type: yesno
    sql: ${TABLE}.isdefault_tls_key_file ;;
    group_label: "Configuration: Service"
    label: "Isdefault TLS Key File"
  }

  dimension: isdefault_write_timeout {
    type: yesno
    sql: ${TABLE}.isdefault_write_timeout ;;
    group_label: "Configuration: Service"
    label: "Isdefault Write Timeout"
  }

  dimension: limit_load_search_result {
    type: number
    sql: ${TABLE}.limit_load_search_result ;;
    group_label: "Configuration: Service"
    label: "Limit Load Search Result"
  }

  dimension: login_with_certificate {
    type: yesno
    sql: ${TABLE}.limit_load_search_result ;;
    group_label: "Configuration: Service"
  }

  dimension: managed_resource_paths {
    type: yesno
    sql: ${TABLE}.managed_resource_paths ;;
    group_label: "Configuration: Service"
    label: "Managed Resource Paths Enabled"
  }
  
  dimension: maximum_login_attempts {
    type: number
    sql: ${TABLE}.maximum_login_attempts ;;
    group_label: "Configuration: Service"
  }

  dimension: maximum_payload_size {
    type: number
    sql: ${TABLE}.maximum_payload_size ;;
    group_label: "Configuration: Service"
  }

  dimension: maximum_url_length {
    type: number
    sql: ${TABLE}.maximum_url_length ;;
    group_label: "Configuration: Service"
  }

  dimension: minimum_hashtag_length {
    type: number
    sql: ${TABLE}.minimum_hashtag_length ;;
    group_label: "Configuration: Service"
  }

  dimension: outgoing_integrations_requests_timeout {
    type: number
    sql: ${TABLE}.outgoing_integrations_requests_timeout ;;
    group_label: "Configuration: Service"
  }

  dimension: persistent_notification_interval_minutes {
    type: number
    sql: ${TABLE}.persistent_notification_interval_minutes ;;
    group_label: "Configuration: Service"
  }

   dimension: persistent_notification_max_count {
    type: number
    sql: ${TABLE}.persistent_notification_max_count ;;
    group_label: "Configuration: Service"
  }

  dimension: persistent_notification_max_recipients {
    type: number
    sql: ${TABLE}.persistent_notification_max_recipients ;;
    group_label: "Configuration: Service"
  }
  
  dimension: post_edit_time_limit {
    type: number
    sql: ${TABLE}.post_edit_time_limit ;;
    group_label: "Configuration: Service"
  }

  dimension: post_priority {
    type: yesno
    sql: ${TABLE}.post_priority ;;
    group_label: "Configuration: Service"
  }
 
  dimension: refresh_post_stats_run_time {
    type: string
    sql: ${TABLE}.refresh_post_stats_run_time ;;
    group_label: "Configuration: Service"
  }

  dimension: restrict_custom_emoji_creation {
    type: string
    sql: ${TABLE}.restrict_custom_emoji_creation ;;
    group_label: "Configuration: Service"
  }

  dimension: restrict_link_previews {
    type: yesno
    sql: ${TABLE}.restrict_link_previews ;;
    group_label: "Configuration: Service"
    label: "Link Preview Restricted"
  }
  
  dimension: restrict_post_delete {
    type: string
    sql: ${TABLE}.restrict_post_delete ;;
    group_label: "Configuration: Service"
  }

  dimension: self_hosted_expansion {
    type: yesno
    sql: ${TABLE}.self_hosted_expansion ;;
    group_label: "Configuration: Service"
  }

  dimension: self_hosted_purchase {
    type: yesno
    sql: ${TABLE}.self_hosted_purchase ;;
    group_label: "Configuration: Service"
  }
 
  dimension: session_cache_in_minutes {
    type: number
    sql: ${TABLE}.session_cache_in_minutes ;;
    group_label: "Configuration: Service"
  }

  dimension: session_idle_timeout_in_minutes {
    type: number
    sql: ${TABLE}.session_idle_timeout_in_minutes ;;
    group_label: "Configuration: Service"
  }

  dimension: session_length_mobile_in_days {
    type: number
    sql: ${TABLE}.session_length_mobile_in_days ;;
    group_label: "Configuration: Service"
  }

  dimension: session_length_mobile_in_hours {
    type: number
    sql: ${TABLE}.session_length_mobile_in_hours ;;
    group_label: "Configuration: Service"
  }
  
  dimension: session_length_sso_in_days {
    type: number
    sql: ${TABLE}.session_length_sso_in_days ;;
    group_label: "Configuration: Service"
  }

  dimension: session_length_sso_in_hours {
    type: number
    sql: ${TABLE}.session_length_sso_in_hours ;;
    group_label: "Configuration: Service"
  }

  dimension: session_length_web_in_days {
    type: number
    sql: ${TABLE}.session_length_web_in_days ;;
    group_label: "Configuration: Service"
  }

  dimension: session_length_web_in_hours {
    type: number
    sql: ${TABLE}.session_length_web_in_hours ;;
    group_label: "Configuration: Service"
  }

  dimension: skip_login_page {
    type: yesno
    sql: ${TABLE}.skip_login_page ;;
    group_label: "Configuration: Service"
  }

  dimension: terminate_sessions_on_password_change {
    type: yesno
    sql: ${TABLE}.terminate_sessions_on_password_change ;;
    group_label: "Configuration: Service"
  }

  dimension: thread_auto_follow {
    type: yesno
    sql: ${TABLE}.thread_auto_follow ;;
    group_label: "Configuration: Service"
    label: "Thread Autofollow Enabled"
  }

  dimension: time_between_user_typing_updates_milliseconds {
    type: number
    sql: ${TABLE}.time_between_user_typing_updates_milliseconds ;;
    group_label: "Configuration: Service"
    label: "Allow Cookies For Subdomains"
  }

  dimension: tls_strict_transport {
    type: yesno
    sql: ${TABLE}.tls_strict_transport ;;
    group_label: "Configuration: Service"
    label: "TLS Strict Transport"
  }

  dimension: uses_letsencrypt {
    type: yesno
    sql: ${TABLE}.uses_letsencrypt ;;
    group_label: "Configuration: Service"
    label: "Uses Letsencrypt"
  }

  dimension: websocket_url {
    type: yesno
    sql: ${TABLE}.websocket_url ;;
    group_label: "Configuration: Service"
    label: "Websocket URL"
  }

  dimension: web_server_mode {
    type: string
    sql: ${TABLE}.web_server_mode ;;
    group_label: "Configuration: Service"
  }
}
