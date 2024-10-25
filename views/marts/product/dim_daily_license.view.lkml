view: dim_daily_license {
  sql_table_name: "MART_PRODUCT".dim_daily_license ;;
  label: "* License: Daily Telemetry Information"


  dimension: daily_server_id {
    type: string
    sql: ${TABLE}.daily_server_id ;;
    primary_key: yes
    hidden: yes
  }

  dimension: license_id {
    type: string
    sql: ${TABLE}.license_id ;;
    description: "The license's unique identifier."
  }

  dimension: company_name {
    type: string
    sql: ${TABLE}.company_name ;;
    description: "The name of the company. Available only if license information is reported in CWS, Legacy or Salesforce."
  }

  dimension: contact_email {
    type: string
    sql: ${TABLE}.contact_email ;;
    description: "The contact email attached to the license. Available only if license information is reported in CWS or legacy."
  }

  dimension: customer_id {
    type: string
    sql: ${TABLE}.customer_id ;;
    description: "The id of the customer assigned to the license. Taken from telemetry data."
  }

  dimension: sku_short_name {
    type: string
    sql: ${TABLE}.sku_short_name ;;
    description: "The SKU for the license or `Unknown` if it's not known (i.e. in legacy licenses)."
  }

  dimension: license_name {
    type: string
    sql: ${TABLE}.license_name ;;
    description: "The name of the current license."
  }

  dimension: licensed_seats {
    type: number
    sql: ${TABLE}.licensed_seats ;;
    description: " The number of licensed seats for the current license."
  }

  dimension: is_trial {
    type: yesno
    sql: ${TABLE}.is_trial ;;
    label: "Is trial?"
    description: "Whether the license is a trial license or not."
  }

  dimension: has_license_expired {
    type: yesno
    sql: ${TABLE}.has_license_expired ;;
    label: "Has license expired?"
  }

  dimension: salesforce_account_arr {
    type: number
    sql: ${TABLE}.salesforce_account_arr ;;
    label: "Arr (Salesforce)"
    description: "Arr (Salesforce)"
  }

  ### Dates

  dimension_group: issued {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.issued_at ;;
    description: "The date and time the license was issued at."
  }

  dimension_group: starts {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.starts_at ;;
    description: "The date and time the license started at."
  }

  dimension_group: expire {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.expire_at ;;
    description: "The date and time the license expires at."
  }

  ###
  ### Metadata
  ###

  dimension: in_cws {
    type: yesno
    sql: ${TABLE}.in_cws ;;
    label: "In CWS?"
    description: "Whether the license also appears in CWS."
  }

  dimension: in_legacy {
    type: yesno
    sql: ${TABLE}.in_legacy ;;
    label: "In Legacy?"
    description: "Whether the license also appears in legacy data."
  }

  dimension: in_salesforce {
    type: yesno
    sql: ${TABLE}.in_salesforce ;;
    label: "In Salesforce?"
    description: "Whether the license also appears in Salesforce."
  }

  dimension: is_feature_advanced_logging_enabled {
    type: yesno
    sql: ${TABLE}.is_feature_advanced_logging_enabled ;;
    label: "Is advanced logging feature enabled?"
    view_label: "License: Feature configuration"
  }

  dimension: is_feature_cloud_enabled {
    type: yesno
    sql: ${TABLE}.is_feature_cloud_enabled ;;
    label: "Is cloud feature enabled?"
    view_label: "License: Feature configuration"
  }

  dimension: is_feature_cluster_enabled {
    type: yesno
    sql: ${TABLE}.is_feature_cluster_enabled ;;
    label: "Is clustering feature enabled?"
    view_label: "License: Feature configuration"
  }

  dimension: is_feature_compliance_enabled {
    type: yesno
    sql: ${TABLE}.is_feature_compliance_enabled ;;
    label: "Is compliance feature enabled?"
    view_label: "License: Feature configuration"
  }

  dimension: is_feature_custom_permissions_schemes_enabled {
    type: yesno
    sql: ${TABLE}.is_feature_custom_permissions_schemes_enabled ;;
    label: "Are custom permissions schemes enabled?"
    view_label: "License: Feature configuration"
  }

  dimension: is_feature_data_retention_enabled {
    type: yesno
    sql: ${TABLE}.is_feature_data_retention_enabled ;;
    label: "Is data retention feature enabled?"
    view_label: "License: Feature configuration"
  }

  dimension: is_feature_elastic_search_enabled {
    type: yesno
    sql: ${TABLE}.is_feature_data_retention_enabled ;;
    label: "Is ElasticSearch feature enabled?"
    view_label: "License: Feature configuration"
  }

  dimension: is_feature_email_notification_contents_enabled {
    type: yesno
    sql: ${TABLE}.is_feature_email_notification_contents_enabled ;;
    label: "Is Email Notification contents feature enabled?"
    view_label: "License: Feature configuration"
  }

  dimension: is_feature_enterprise_plugins_enabled {
    type: yesno
    sql: ${TABLE}.is_feature_enterprise_plugins_enabled ;;
    label: "Is Enterprise Plugins feature enabled?"
    view_label: "License: Feature configuration"
  }

  dimension: is_feature_future_enabled {
    type: yesno
    sql: ${TABLE}.is_feature_future_enabled ;;
    label: "Is Futures feature enabled?"
    view_label: "License: Feature configuration"
  }

  dimension: is_feature_google_enabled {
    type: yesno
    sql: ${TABLE}.is_feature_google_enabled ;;
    label: "Is Google feature enabled?"
    view_label: "License: Feature configuration"
  }

  dimension: is_feature_guest_accounts_enabled {
    type: yesno
    sql: ${TABLE}.is_feature_guest_accounts_enabled ;;
    label: "Is Guest Accounts feature enabled?"
    view_label: "License: Feature configuration"
  }

  dimension: is_feature_guest_accounts_permissions_enabled {
    type: yesno
    sql: ${TABLE}.is_feature_guest_accounts_permissions_enabled ;;
    label: "Is Guest Accounts Permissions feature enabled?"
    view_label: "License: Feature configuration"
  }

  dimension: is_feature_id_loaded_enabled {
    type: yesno
    sql: ${TABLE}.is_feature_id_loaded_enabled ;;
    label: "Is Id loaded feature enabled?"
    view_label: "License: Feature configuration"
  }

  dimension: is_feature_ldap_enabled {
    type: yesno
    sql: ${TABLE}.is_feature_ldap_enabled ;;
    label: "Is LDAP feature enabled?"
    view_label: "License: Feature configuration"
  }
  
  dimension: is_feature_ldap_groups_enabled {
    type: yesno
    sql: ${TABLE}.is_feature_ldap_groups_enabled ;;
    label: "Is LDAP Groups feature enabled?"
    view_label: "License: Feature configuration"
  }

  dimension: is_feature_lock_teammate_name_display_enabled {
    type: yesno
    sql: ${TABLE}.is_feature_lock_teammate_name_display_enabled ;;
    label: "Is Lock Teammate Display Name feature enabled?"
    view_label: "License: Feature configuration"
  }

  dimension: is_feature_message_export_enabled {
    type: yesno
    sql: ${TABLE}.is_feature_message_export_enabled ;;
    label: "Is Message Export feature enabled?"
    view_label: "License: Feature configuration"
  }

  dimension: is_feature_metrics_enabled {
    type: yesno
    sql: ${TABLE}.is_feature_metrics_enabled ;;
    label: "Is Metrics feature enabled?"
    view_label: "License: Feature configuration"
  }

  dimension: is_feature_mfa_enabled {
    type: yesno
    sql: ${TABLE}.is_feature_mfa_enabled ;;
    label: "Is MFA feature enabled?"
    view_label: "License: Feature configuration"
  }

  dimension: is_feature_mhpns_enabled {
    type: yesno
    sql: ${TABLE}.is_feature_mhpns_enabled ;;
    label: "Is MHPNS feature enabled?"
    view_label: "License: Feature configuration"
  }

  dimension: is_feature_office365_enabled {
    type: yesno
    sql: ${TABLE}.is_feature_office365_enabled ;;
    label: "Is Office365 feature enabled?"
    view_label: "License: Feature configuration"
  }

  dimension: is_feature_openid_enabled {
    type: yesno
    sql: ${TABLE}.is_feature_openid_enabled ;;
    label: "Is OpenId feature enabled?"
    view_label: "License: Feature configuration"
  }

  dimension: is_feature_remote_cluster_service_enabled {
    type: yesno
    sql: ${TABLE}.is_feature_remote_cluster_service_enabled ;;
    label: "Is remote cluster feature enabled?"
    description: "Whether the remote cluster feature has been enabled at the server."
    view_label: "License: Feature configuration"
  }

  dimension: is_feature_saml_enabled {
    type: yesno
    sql: ${TABLE}.is_feature_saml_enabled ;;
    label: "Is SAML feature enabled?"
    view_label: "License: Feature configuration"
  }

  dimension: is_feature_shared_channels_enabled {
    type: yesno
    sql: ${TABLE}.is_feature_shared_channels_enabled ;;
    label: "Is shared channels feature enabled?"
    description: "Whether the shared channels feature has been enabled at the server."
    view_label: "License: Feature configuration"
  }

  ###
  ### Measures
  ###

  measure: total_licensed_seats {
    type: sum
    sql: ${licensed_seats} ;;
    description: "The total number of licensed seats."
  }
}
