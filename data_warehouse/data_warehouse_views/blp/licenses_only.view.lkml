view: licenses_only {
  derived_table: {
    sql:
    SELECT
        license_id
      , MAX(server_id) AS server_id
      , customer_id
      , company
      , trial
      , issued_date
      , start_date
      , expire_date
      , MAX(server_expire_date) AS server_expire_date
      , MAX(master_account_sfid) AS master_account_sfid
      , MAX(master_account_name) AS master_account_name
      , MAX(account_sfid) AS account_sfid
      , MAX(account_name) AS account_name
      , MAX(license_email) AS license_email
      , MAX(contact_sfid) AS contact_sfid
      , MAX(contact_email) AS contact_email
      , MAX(number) AS number
      , MAX(stripeid) AS stripeid
      , MAX(users) AS users
      , MAX(feature_cluster) AS feature_cluster
      , MAX(feature_compliance) AS feature_compliance
      , MAX(feature_custom_brand) AS feature_custom_brand
      , MAX(feature_custom_permissions_schemes) AS feature_custom_permissions_schemes
      , MAX(feature_data_retention) AS feature_data_retention
      , MAX(feature_elastic_search) AS feature_elastic_search
      , MAX(feature_email_notification_contents) AS feature_email_notification_contents
      , MAX(feature_future) AS feature_future
      , MAX(feature_google) AS feature_google
      , MAX(feature_guest_accounts) AS feature_guest_accounts
      , MAX(feature_guest_accounts_permissions) AS feature_guest_accounts_permissions
      , MAX(feature_id_loaded) AS feature_id_loaded
      , MAX(feature_ldap) AS feature_ldap
      , MAX(feature_ldap_groups) AS feature_ldap_groups
      , MAX(feature_lock_teammate_name_display) AS feature_lock_teammate_name_display
      , MAX(feature_message_export) AS feature_message_export
      , MAX(feature_metrics) AS feature_metrics
      , MAX(feature_mfa) AS feature_mfa
      , MAX(feature_mhpns) AS feature_mhpns
      , MAX(feature_office365) AS feature_office365
      , MAX(feature_password) AS feature_password
      , MAX(feature_saml) AS feature_saml
      , MIN(timestamp) AS timestamp
      , MIN(license_activation_date) AS license_activation_date
      , MAX(edition)   AS edition
    FROM blp.licenses
    GROUP BY 1, 3, 4, 5, 6, 7, 8 ;;
  }

  # DRILL SETS
  set: server_drill {
    fields: [license_id, server_id, edition, trial, users, license_activation_date, company,  account_name, issued_date, start_date, expire_date, license_duration]
  }

  # FILTERS

  # DIMENSIONS
  dimension: license_id {
    description: ""
    type: string
    sql: ${TABLE}.license_id ;;
    hidden: no
  }

  dimension: server_id {
    description: "The server id associated with the license (if logged)."
    type: string
    sql: ${TABLE}.server_id ;;
    hidden: no
  }

  dimension: customer_id {
    description: "The unique customer id associated with the license."
    type: string
    sql: ${TABLE}.customer_id ;;
    hidden: no
  }

  dimension: company {
    description: "The company name provided at time of license provisioning."
    type: string
    sql: ${TABLE}.company ;;
    hidden: no
  }

  dimension: edition {
    description: "The Mattermost edition associated with the license (E10, E20, etc.)"
    type: string
    sql: ${TABLE}.edition ;;
    hidden: no
  }

  dimension: trial {
    description: "Boolean indicating whether the license is a trial license."
    type: yesno
    sql: ${TABLE}.trial ;;
    hidden: no
  }

  dimension: master_account_sfid {
    description: "The Salesforce Master Account ID associated with the license."
    group_label: " Account Info."
    link: {
      label: "Salesforce Master Account Record"
      url: "https://mattermost.lightning.force.com/lightning/r/{{ value }}/view"
      icon_url: "https://mattermost.my.salesforce.com/favicon.ico"
    }
    type: string
    sql: ${TABLE}.master_account_sfid ;;
    hidden: no
  }

  dimension: master_account_name {
    description: "The Salesforce Master Account Name associated with the license."
    group_label: " Account Info."
    link: {
      label: "Salesforce Master Account Record"
      url: "https://mattermost.lightning.force.com/lightning/r/{{ master_account_sfid._value }}/view"
      icon_url: "https://mattermost.my.salesforce.com/favicon.ico"
    }
    type: string
    sql: ${TABLE}.master_account_name ;;
    hidden: no
  }

  dimension: account_sfid {
    description: "The Salesforce Account ID associated with the license."
    group_label: " Account Info."
    link: {
      label: "Salesforce Account Record"
      url: "https://mattermost.lightning.force.com/lightning/r/{{ value }}/view"
      icon_url: "https://mattermost.my.salesforce.com/favicon.ico"
    }
    type: string
    sql: ${TABLE}.account_sfid ;;
    hidden: no
  }

  dimension: account_name {
    description: "The Salesforce Account Name associated with the license."
    group_label: " Account Info."
    link: {
      label: "Salesforce Account Record"
      url: "https://mattermost.lightning.force.com/lightning/r/{{ account_sfid._value }}/view"
      icon_url: "https://mattermost.my.salesforce.com/favicon.ico"
    }
    type: string
    sql: ${TABLE}.account_name ;;
    hidden: no
  }

  dimension: license_email {
    description: "The email provided at time of license provisioning."
    type: string
    sql: ${TABLE}.license_email ;;
    hidden: no
  }

  dimension: contact_sfid {
    description: "The Salesforce Contact ID associated with the License Email provided."
    group_label: " Contact Info."
    link: {
      label: "Salesforce Contact Record"
      url: "https://mattermost.lightning.force.com/lightning/r/{{ value }}/view"
      icon_url: "https://mattermost.my.salesforce.com/favicon.ico"
    }
    type: string
    sql: ${TABLE}.contact_sfid ;;
    hidden: no
  }

  dimension: contact_email {
    description: "The Salesforce Contact Email (same as License Email)."
    group_label: " Contact Info."
    link: {
      label: "Salesforce Contact Record"
      url: "https://mattermost.lightning.force.com/lightning/r/{{ contact_sfid._value }}/view"
      icon_url: "https://mattermost.my.salesforce.com/favicon.ico"
    }
    type: string
    sql: ${TABLE}.contact_email ;;
    hidden: no
  }
  dimension: number {
    label: "License Number"
    description: "The license number associated with the license."
    type: number
    sql: ${TABLE}.number ;;
    hidden: no
  }

  dimension: stripeid {
    label: "Stripe ID"
    description: "The Stripe ID associated with the license."
    type: string
    sql: ${TABLE}.stripeid ;;
    hidden: no
  }

  dimension: users {
    label: "Licensed Users (Seats)"
    description: "The number of user seats provisioned with the license."
    type: number
    sql: ${TABLE}.users ;;
    hidden: no
  }

  dimension: users_band {
    label: "Licensed Users Band (Seats)"
    description: "The number of user seats provisioned with the license."
    type: tier
    style: integer
    tiers: [1, 11, 21, 31, 51, 101, 251, 501, 1001]
    sql: ${users} ;;
    hidden: no
  }

  dimension: cluster {
    description: ""
    group_label: "Features"
    type: yesno
    sql: ${TABLE}.feature_cluster ;;
    hidden: no
  }

  dimension: compliance {
    description: ""
    group_label: "Features"
    type: yesno
    sql: ${TABLE}.feature_compliance ;;
    hidden: no
  }

  dimension: custom_brand {
    description: ""
    group_label: "Features"
    type: yesno
    sql: ${TABLE}.feature_custom_brand ;;
    hidden: no
  }

  dimension: custom_permissions_schemes {
    description: ""
    group_label: "Features"
    type: yesno
    sql: ${TABLE}.feature_custom_permissions_schemes ;;
    hidden: no
  }

  dimension: data_retention {
    description: ""
    group_label: "Features"
    type: yesno
    sql: ${TABLE}.feature_data_retention ;;
    hidden: no
  }

  dimension: elastic_search {
    description: ""
    group_label: "Features"
    type: yesno
    sql: ${TABLE}.feature_elastic_search ;;
    hidden: no
  }

  dimension: email_notification_contents {
    description: ""
    group_label: "Features"
    type: yesno
    sql: ${TABLE}.feature_email_notification_contents ;;
    hidden: no
  }

  dimension: future {
    description: ""
    group_label: "Features"
    type: yesno
    sql: ${TABLE}.feature_future ;;
    hidden: no
  }

  dimension: google {
    description: ""
    group_label: "Features"
    type: yesno
    sql: ${TABLE}.feature_google ;;
    hidden: no
  }

  dimension: guest_accounts {
    description: ""
    group_label: "Features"
    type: yesno
    sql: ${TABLE}.feature_guest_accounts ;;
    hidden: no
  }

  dimension: guest_accounts_permissions {
    description: ""
    group_label: "Features"
    type: yesno
    sql: ${TABLE}.feature_guest_accounts_permissions ;;
    hidden: no
  }

  dimension: id_loaded {
    description: ""
    group_label: "Features"
    type: yesno
    sql: ${TABLE}.feature_id_loaded ;;
    hidden: no
  }

  dimension: ldap {
    description: ""
    group_label: "Features"
    type: yesno
    sql: ${TABLE}.feature_ldap ;;
    hidden: no
  }

  dimension: ldap_groups {
    description: ""
    group_label: "Features"
    type: yesno
    sql: ${TABLE}.feature_ldap_groups ;;
    hidden: no
  }

  dimension: lock_teammate_name_display {
    description: ""
    group_label: "Features"
    type: yesno
    sql: ${TABLE}.feature_lock_teammate_name_display ;;
    hidden: no
  }

  dimension: message_export {
    description: ""
    group_label: "Features"
    type: yesno
    sql: ${TABLE}.feature_message_export ;;
    hidden: no
  }

  dimension: metrics {
    description: ""
    group_label: "Features"
    type: yesno
    sql: ${TABLE}.feature_metrics ;;
    hidden: no
  }

  dimension: mfa {
    description: ""
    group_label: "Features"
    type: yesno
    sql: ${TABLE}.feature_mfa ;;
    hidden: no
  }

  dimension: mhpns {
    description: ""
    group_label: "Features"
    type: yesno
    sql: ${TABLE}.feature_mhpns ;;
    hidden: no
  }

  dimension: office365 {
    description: ""
    group_label: "Features"
    type: yesno
    sql: ${TABLE}.feature_office365 ;;
    hidden: no
  }

  dimension: password {
    description: ""
    group_label: "Features"
    type: yesno
    sql: ${TABLE}.feature_password ;;
    hidden: no
  }

  dimension: saml {
    description: ""
    group_label: "Features"
    type: yesno
    sql: ${TABLE}.feature_saml ;;
    hidden: no
  }

  dimension: id {
    description: ""
    type: string
    sql: ${TABLE}.id ;;
    hidden: yes
  }

  dimension: license_duration {
    label: "License Duration (Days)"
    description: "The # of days between the license start date and the license expire date."
    type: number
    sql: datediff(day, ${start_date}, ${expire_date}) ;;
    hidden: no
  }


  # DIMENSION GROUPS/DATES
  dimension_group: issued {
    label: "License Issued"
    description: "The date the license was issued to the customer."
    type: time
    timeframes: [date, week, month, year]
    sql: ${TABLE}.issued_date ;;
    hidden: no
  }

  dimension_group: start {
    label: "License Start"
    description: "The license start date."
    type: time
    timeframes: [date, week, month, year]
    sql: ${TABLE}.start_date ;;
    hidden: no
  }

  dimension_group: expire {
    label: "License Expire"
    description: "The license expiration date."
    type: time
    timeframes: [date, week, month, year]
    sql: ${TABLE}.expire_date ;;
    hidden: no
  }

  dimension_group: timestamp {
    description: ""
    type: time
    timeframes: [date, week, month, year]
    sql: ${TABLE}.timestamp ;;
    hidden: no
  }

  dimension_group: license_activation {
    description: ""
    type: time
    timeframes: [date, week, month, year]
    sql: ${TABLE}.license_activation_date ;;
    hidden: no
  }

  dimension: is_activated {
    description: "Indicates whether the license has sent us telemetry data."
    type: yesno
    sql: CASE WHEN ${timestamp_date} is not null then TRUE ELSE FALSE END ;;
    hidden: no
  }


  # MEASURES
  measure: count {
    description: "Count of rows/occurrences."
    type: count
  }

  measure: license_count {
    label: " License Count"
    description: "The distinct count of Licenses per grouping."
    type: count_distinct
    sql: ${license_id} ;;
    drill_fields: [server_drill*]
  }

  measure: server_count {
    label: " Server Count"
    description: "The distinct count of Servers per grouping."
    type: count_distinct
    sql: ${server_id} ;;
    drill_fields: [server_drill*]
  }

  measure: customer_count {
    label: " Customer Count"
    description: "The distinct count of Customer ID's per grouping."
    type: count_distinct
    sql: ${customer_id} ;;
    drill_fields: [server_drill*]
  }

  measure: company_count {
    label: " Company Count"
    description: "The distinct count of Customer ID's per grouping."
    type: count_distinct
    sql: trim(${company}) ;;
    drill_fields: [server_drill*]
  }

  measure: account_count {
    label: " Account Count"
    description: "The distinct count of Customer ID's per grouping."
    type: count_distinct
    sql: trim(${account_sfid}) ;;
    drill_fields: [server_drill*]
  }

  measure: activated_licenses {
    description: "The count of activated licenses based on whether a license was associated with a server sending us telemetry data."
    type: count_distinct
    sql: CASE WHEN ${license_activation_date} IS NOT NULL THEN ${license_id} ELSE NULL END ;;
    drill_fields: [server_drill*]
  }

  measure: non_activated_licenses {
    label: "Non-Activated Licenses"
    description: "The count of activated licenses based on whether a license was associated with a server sending us telemetry data."
    type: count_distinct
    sql: CASE WHEN ${license_activation_date} IS NULL THEN ${license_id} ELSE NULL END ;;
    drill_fields: [server_drill*]
  }



}
