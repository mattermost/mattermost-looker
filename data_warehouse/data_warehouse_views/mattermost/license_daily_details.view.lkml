# This is the view file for the analytics.mattermost.license_daily_details table.
view: license_daily_details {
  sql_table_name: mattermost.license_daily_details ;;
  view_label: "License Daily Details"

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
    type: string
    sql: ${TABLE}.master_account_sfid ;;
    hidden: no
  }

  dimension: master_account_name {
    description: "The Salesforce Master Account Name associated with the license."
    type: string
    sql: ${TABLE}.master_account_name ;;
    hidden: no
  }

  dimension: account_sfid {
    description: "The Salesforce Account ID associated with the license."
    type: string
    sql: ${TABLE}.account_sfid ;;
    hidden: no
  }

  dimension: account_name {
    description: "The Salesforce Account Name associated with the license."
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
    type: string
    sql: ${TABLE}.contact_sfid ;;
    hidden: no
  }

  dimension: contact_email {
    description: "The Salesforce Contact Email (same as License Email)."
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

  dimension: feature_cluster {
    description: ""
    type: yesno
    sql: ${TABLE}.feature_cluster ;;
    hidden: no
  }

  dimension: feature_compliance {
    description: ""
    type: yesno
    sql: ${TABLE}.feature_compliance ;;
    hidden: no
  }

  dimension: feature_custom_brand {
    description: ""
    type: yesno
    sql: ${TABLE}.feature_custom_brand ;;
    hidden: no
  }

  dimension: feature_custom_permissions_schemes {
    description: ""
    type: yesno
    sql: ${TABLE}.feature_custom_permissions_schemes ;;
    hidden: no
  }

  dimension: feature_data_retention {
    description: ""
    type: yesno
    sql: ${TABLE}.feature_data_retention ;;
    hidden: no
  }

  dimension: feature_elastic_search {
    description: ""
    type: yesno
    sql: ${TABLE}.feature_elastic_search ;;
    hidden: no
  }

  dimension: feature_email_notification_contents {
    description: ""
    type: yesno
    sql: ${TABLE}.feature_email_notification_contents ;;
    hidden: no
  }

  dimension: feature_future {
    description: ""
    type: yesno
    sql: ${TABLE}.feature_future ;;
    hidden: no
  }

  dimension: feature_google {
    description: ""
    type: yesno
    sql: ${TABLE}.feature_google ;;
    hidden: no
  }

  dimension: feature_guest_accounts {
    description: ""
    type: yesno
    sql: ${TABLE}.feature_guest_accounts ;;
    hidden: no
  }

  dimension: feature_guest_accounts_permissions {
    description: ""
    type: yesno
    sql: ${TABLE}.feature_guest_accounts_permissions ;;
    hidden: no
  }

  dimension: feature_id_loaded {
    description: ""
    type: yesno
    sql: ${TABLE}.feature_id_loaded ;;
    hidden: no
  }

  dimension: feature_ldap {
    description: ""
    type: yesno
    sql: ${TABLE}.feature_ldap ;;
    hidden: no
  }

  dimension: feature_ldap_groups {
    description: ""
    type: yesno
    sql: ${TABLE}.feature_ldap_groups ;;
    hidden: no
  }

  dimension: feature_lock_teammate_name_display {
    description: ""
    type: yesno
    sql: ${TABLE}.feature_lock_teammate_name_display ;;
    hidden: no
  }

  dimension: feature_message_export {
    description: ""
    type: yesno
    sql: ${TABLE}.feature_message_export ;;
    hidden: no
  }

  dimension: feature_metrics {
    description: ""
    type: yesno
    sql: ${TABLE}.feature_metrics ;;
    hidden: no
  }

  dimension: feature_mfa {
    description: ""
    type: yesno
    sql: ${TABLE}.feature_mfa ;;
    hidden: no
  }

  dimension: feature_mhpns {
    description: ""
    type: yesno
    sql: ${TABLE}.feature_mhpns ;;
    hidden: no
  }

  dimension: feature_office365 {
    description: ""
    type: yesno
    sql: ${TABLE}.feature_office365 ;;
    hidden: no
  }

  dimension: feature_password {
    description: ""
    type: yesno
    sql: ${TABLE}.feature_password ;;
    hidden: no
  }

  dimension: feature_saml {
    description: ""
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

  dimension: server_dau {
    description: "The number of Daily Active Users recorded on the license Logging Date."
    type: number
    sql: ${TABLE}.server_dau ;;
    hidden: no
  }

  dimension: server_mau {
    description: "The number of Monthly Active Users recorded on the license Logging Date."
    type: number
    sql: ${TABLE}.server_mau ;;
    hidden: no
  }


  # DIMENSION GROUPS/DATES
  dimension_group: logging {
    description: ""
    type: time
    timeframes: [date, month, year]
    sql: ${TABLE}.date ;;
    hidden: no
  }

  dimension_group: issued {
    description: ""
    type: time
    timeframes: [date, month, year]
    sql: ${TABLE}.issued_date ;;
    hidden: no
  }

  dimension_group: start {
    description: ""
    type: time
    timeframes: [date, month, year]
    sql: ${TABLE}.start_date ;;
    hidden: no
  }

  dimension_group: expire {
    description: ""
    type: time
    timeframes: [date, month, year]
    sql: ${TABLE}.expire_date ;;
    hidden: no
  }

  dimension_group: timestamp {
  description: ""
  type: time
  timeframes: [date, month, year]
    sql: ${TABLE}.timestamp ;;
    hidden: no
  }

  dimension_group: last_telemetry {
    description: ""
    type: time
    timeframes: [date, month, year]
    sql: ${TABLE}.last_telemetry_date ;;
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
  }

  measure: server_count {
    label: " Server Count"
    description: "The distinct count of Servers per grouping."
    type: count_distinct
    sql: ${server_id} ;;
  }

  measure: customer_count {
    label: " Customer Count"
    description: "The distinct count of Customers per grouping."
    type: count_distinct
    sql: ${customer_id} ;;
  }

  measure: users_sum {
    label: "License Seats/Users (Sum)"
    description: "The sum of Users per grouping."
    type: sum
    sql: ${users} ;;
  }

  measure: server_dau_sum {
    label: "DAU (Sum)"
    description: "The sum of Server Dau per grouping."
    type: sum
    sql: ${server_dau} ;;
  }

  measure: server_mau_sum {
    label: "MAU (Sum)"
    description: "The sum of Server Mau per grouping."
    type: sum
    sql: ${server_mau} ;;
  }


}
