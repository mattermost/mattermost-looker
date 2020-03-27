# This is the view file for the analytics.mattermost.license_daily_details table.
view: license_daily_details {
  sql_table_name: blp.license_daily_details ;;
  view_label: "License Daily Details"

  # FILTERS
  filter: active {
    description: "Boolean indicating the expiration date >= current date."
    type: yesno
    sql: case when ${expire_date} >= CURRENT_DATE AND ${issued_date} <= CURRENT_DATE AND lower(coalesce(${company}, '')) NOT LIKE '%mattermost%' then true else false end ;;
    hidden: no
  }

  filter: current_record {
    description: "Selects only records with the most recent logging date available in the table."
    type: yesno
    sql: ${logging_date} = (SELECT MAX(date) FROM blp.license_daily_details) ;;
  }

  # DIMENSIONS
  dimension: license_id {
    description: ""
    label: " License ID"
    type: string
    sql: ${TABLE}.license_id ;;
    hidden: no
  }

  dimension: server_count {
    label: " Server Count"
    description: "The number of unique servers associated with the license (null if no telemetry/server-license association)."
    type: number
    sql: ${TABLE}.servers ;;
    hidden: no
  }

  dimension: customer_id {
    label: " Customer ID"
    description: "The unique customer id associated with the license."
    type: string
    sql: ${TABLE}.customer_id ;;
    hidden: no
  }

  dimension: company {
    label: " Company"
    description: "The company name provided at time of license provisioning."
    type: string
    sql: ${TABLE}.company ;;
    hidden: no
  }

  dimension: edition {
    label: " Edition"
    description: "The Mattermost edition associated with the license (E10, E20, etc.)"
    type: string
    sql: ${TABLE}.edition ;;
    hidden: no
  }

  dimension: is_trial {
    label: " Trial"
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
    label: " License Email"
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
    label: " License Number"
    description: "The license number associated with the license."
    type: number
    sql: ${TABLE}.number ;;
    hidden: no
  }

  dimension: stripeid {
    label: " Stripe ID"
    description: "The Stripe ID associated with the license."
    type: string
    sql: ${TABLE}.stripeid ;;
    hidden: no
  }

  dimension: users {
    label: " License Users"
    description: "The number of user seats provisioned with the license."
    type: number
    sql: ${TABLE}.license_users ;;
    hidden: no
  }

  dimension: customer_users {
    label: " Customer Users"
    description: "The number of user seats provisioned with the license."
    group_label: "Customer Dimensions"
    type: number
    order_by_field: customer_users_sort
    sql: ${TABLE}.customer_users ;;
    hidden: no
  }

  dimension: customer_users_sort {
    label: " Customer Users"
    description: "The number of user seats provisioned with the license."
    group_label: "Customer Dimensions"
    type: number
    sql: CASE WHEN ${TABLE}.customer_users IS NULL THEN -100 ELSE ${TABLE}.customer_users END ;;
    hidden: yes
  }

  dimension: registered_users {
    label: " License Registered Users"
    description: "The number of registered users recorded by all servers associated with the customer_id and its respective licenses."
    type: number
    sql: ${TABLE}.license_registered_users ;;
    hidden: no
  }

  dimension: customer_registered_users {
    label: " Customer Registered Users"
    description: "The number of registered users recorded by all servers associated with the customer_id and its respective licenses."
    group_label: "Customer Dimensions"
    type: number
    order_by_field: customer_registered_users_sort
    sql: ${TABLE}.customer_registered_users - COALESCE(${customer_registered_deactivated_users},0);;
    hidden: no
  }

  dimension: customer_registered_users_sort {
    label: " Customer Registered Users"
    description: "The number of registered users recorded by all servers associated with the customer_id and its respective licenses."
    group_label: "Customer Dimensions"
    type: number
    sql: CASE WHEN ${TABLE}.customer_registered_users IS NULL THEN -100 ELSE ${TABLE}.customer_registered_users - COALESCE(${customer_registered_deactivated_users},0) END;;
    hidden: yes
  }

  dimension: customer_registered_deactivated_users {
    label: " Customer Registered Deactivated Users"
    description: "The number of registered, deactivated users recorded by all servers associated with the customer_id and its respective licenses."
    group_label: "Customer Dimensions"
    type: number
    sql: ${TABLE}.customer_registered_deactivated_users ;;
    hidden: no
  }

  dimension: pct_registered_users {
    label: "Registerd Users % of License Users"
    description: "The percent of license users that are registered for all servers associated with the customer_id and its respective licenses."
    group_label: "Customer Dimensions"
    type: number
    value_format: "0.0\%"
    sql: (${customer_registered_users}/${customer_users})*100.0 ;;
  }

  dimension: customer_posts {
    label: "Customer Posts"
    description: "The sum of posts recorded by all servers associated with the customer_id and its respective licenses."
    group_label: "Customer Dimensions"
    type: number
    sql: ${TABLE}.customer_posts ;;
  }

  dimension: customer_public_channels {
    label: "Customer Public Channels"
    description: "The sum of public channels recorded by all servers associated with the customer_id and its respective licenses."
    group_label: "Customer Dimensions"
    type: number
    sql: ${TABLE}.customer_public_channels ;;
  }

  dimension: customer_server_version {
    label: "Customer Server Version"
    description: "The max server version recorded by all servers associated with the customer_id and its respective licenses."
    group_label: "Customer Dimensions"
    type: string
    sql: ${TABLE}.customer_server_version ;;
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

  dimension: server_dau {
    label: "License DAU"
    description: "The sum of Daily Active Users recorded for all servers associated with the license on the license Logging Date."
    group_label: "Active Users"
    type: number
    sql: ${TABLE}.license_server_dau ;;
    hidden: no
  }

  dimension: customer_dau {
    label: "Customer DAU"
    description: "The sum of Daily Active Users recorded for all servers associated with the customer_id on the Logging Date."
    group_label: "Customer Dimensions"
    type: number
    sql: ${TABLE}.customer_server_dau ;;
    hidden: no
  }

  dimension: server_mau {
    label: "License MAU"
    description: "The sum of Monthly Active Users recorded for all servers associated with the license on the license Logging Date."
    group_label: "Active Users"
    type: number
    sql: ${TABLE}.license_server_mau ;;
    hidden: no
  }

  dimension: customer_mau {
    label: "Customer MAU"
    description: "The sum of Monthly Active Users recorded for all servers associated with the customer_id on the Logging Date."
    group_label: "Customer Dimensions"
    type: number
    sql: ${TABLE}.customer_server_mau ;;
    hidden: no
  }

  dimension: days_since_last_telemetry {
    label: "Days Since Last Telemetry"
    description: "The number of days since the server associated with the license sent telemetry data (null if never)."
    type: number
    sql: datediff(day, ${last_telemetry_date}, ${logging_date}) ;;
    hidden: no
  }

  dimension: days_since_last_telemetry_band {
    description: "The number of days since the server associated with the license sent telemetry data (null if never) stratified into bands."
    type: tier
    style: integer
    tiers: [8, 31, 91, 181, 366]
    sql: ${days_since_last_telemetry} ;;
    hidden: no
  }

  dimension: dau_pct_licensed {
    label: " DAU (% of License Users)"
    description: "The percentage of License Users that are Daily Activer Users. Includes all licensed servers associated with the customer."
    group_label: " License Utilization (Active User %)"
    type: number
    #value_format_name: percent_1
    value_format: "0.0\%"
    sql: (${customer_dau}/${customer_users})*100.0 ;;
    hidden: no
  }

  dimension: dau_pct_licensed_band {
    label: "DAU (% of License Users) Band"
    description: "The percentage of License Users that are Daily Activer Users stratified into bands. Includes all licensed servers associated with the customer."
    group_label: " License Utilization (Active User %)"
    type: tier
    style: integer
    tiers: [25, 50, 75, 100]
    value_format: "0.0\%"
    sql: ${dau_pct_licensed} ;;
  }


  dimension: mau_pct_licensed {
    label: " MAU (% of License Users)"
    description: "The percentage of License Users that are Monthly Activer Users. Includes all licensed servers associated with the customer."
    group_label: " License Utilization (Active User %)"
    type: number
    #value_format_name: percent_1
    value_format: "0.0\%"
    sql: (${customer_mau}/${customer_users})*100.0 ;;
    hidden: no
  }

  dimension: customer_mau_pct_licensed {
    label: " MAU (% of License Users)"
    description: "The percentage of License Users that are Monthly Activer Users. Includes all licensed servers associated with the customer."
    group_label: "Customer Dimensions"
    type: number
    #value_format_name: percent_1
    value_format: "0.0\%"
    sql: (${customer_mau}/${customer_users})*100.0 ;;
    hidden: yes
  }

  dimension: mau_pct_licensed_band {
    label: "MAU (% of License Users) Band"
    description: "The percentage of License Users that are Monthly Activer Users stratified into bands."
    group_label: " License Utilization (Active User %)"
    type: tier
    style: integer
    tiers: [25, 50, 75, 100]
    value_format: "0.0\%"
    sql: ${mau_pct_licensed} ;;
  }

  dimension: customer_rank {
    label: "Customer License Rank"
    description: "A rank to assist surfacing the most relevant customer record (when there are dupes/fanning out) at the daily customer level."
    group_label: "Customer Dimensions"
    type: number
    sql: ${TABLE}.customer_rank ;;
    hidden: no
  }

  dimension: days_to_expire {
    label: " Days to Expiration"
    description: "The number of days from the current date until the license expires."
    type: number
    sql: datediff(day, current_date, ${expire_date}) ;;
  }


  # DIMENSION GROUPS/DATES
  dimension_group: logging {
    label: " Logging"
    description: "The date the license data was logged."
    type: time
    timeframes: [date, month, year]
    sql: ${TABLE}.date ;;
    hidden: no
  }

  dimension_group: issued {
    label: "License Issued"
    description: "The date the license was issued to the customer."
    type: time
    timeframes: [date, month, year]
    sql: ${TABLE}.issued_date ;;
    hidden: no
  }

  dimension_group: start {
    label: "License Start"
    description: "The license start date."
    type: time
    timeframes: [date, month, year]
    sql: ${TABLE}.start_date ;;
    hidden: no
  }

  dimension_group: expire {
    label: "License Expire"
    description: "The license expiration date."
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
    hidden: yes
  }

  dimension_group: last_telemetry {
    description: "The most recent date telemetry data was logged for the server associated with the license."
    type: time
    timeframes: [date, month, year]
    sql: ${TABLE}.last_customer_telemetry_date ;;
    hidden: no
  }


  # MEASURES
  measure: count {
    description: "Count of rows/occurrences."
    type: count
  }

  measure: mau_count {
    type: count
    filters: {
      field: server_mau
      value: ">0"
    }
    hidden: yes
  }

  measure: dau_count {
    type: count
    filters: {
      field: server_dau
      value: ">0"
    }
    hidden: yes
  }

  measure: users_count {
    type: count
    filters: {
      field: users
      value: ">0"
    }
    hidden: yes
  }

  measure: license_count {
    label: " License Count"
    group_label: " License Counts"
    description: "The distinct count of Licenses per grouping."
    type: count_distinct
    sql: ${license_id} ;;
  }

  measure: trial_license_count {
    label: " Trial License Count"
    group_label: " License Counts"
    description: "The distinct count of trial licenses per grouping."
    type: count_distinct
    filters: {
      field: is_trial
      value: "yes"
    }
    sql: ${license_id} ;;
  }

  measure: non_trial_license_count {
    label: " Non-Trial License Count"
    group_label: " License Counts"
    description: "The distinct count of non-trial licenses per grouping."
    type: count_distinct
    filters: {
      field: is_trial
      value: "no"
    }
    sql: ${license_id} ;;
  }

  measure: server_count_sum {
    label: " Server Count"
    group_label: " Server Counts"
    description: "The distinct count of Licensed Servers per grouping."
    type: sum
    sql: ${server_count} ;;
  }

  measure: non_trial_server_sum {
    label: "Non-Trial Server Count"
    group_label: " Server Counts"
    description: "The distinct count of non-trial License Servers per grouping."
    type: sum
    filters: {
      field: is_trial
      value: "no"
    }
    sql: ${server_count} ;;
  }

  measure: trial_server_count {
    label: "Trial Server Count"
    group_label: " Server Counts"
    description: "The distinct count of trial License Servers per grouping."
    type: sum
    filters: {
      field: is_trial
      value: "yes"
    }
    sql: ${server_count} ;;
  }

  measure: customer_count {
    label: " Customer Count"
    group_label: " Customer Counts"
    description: "The distinct count of Customers per grouping."
    type: count_distinct
    sql: ${customer_id} ;;
  }

  measure: active_telemetry_customer_count {
    label: "Customers w/ Active Telemetry"
    group_label: " Customer Counts"
    description: "The distinct count of License Customers w/ Telemetry data sent in the last 7 days per grouping."
    type: count_distinct
    filters: {
      field: days_since_last_telemetry
      value: "<= 7"
    }
    sql: ${customer_id} ;;
  }

  measure: inactive_telemetry_customer_count {
    label: "Customers w/ Inactive Telemetry"
    group_label: " Customer Counts"
    description: "The distinct count of License Customers w/ Telemetry data sent >= 7 days agp per grouping."
    type: count_distinct
    filters: {
      field: days_since_last_telemetry
      value: "> 7"
    }
    sql: ${customer_id} ;;
  }

  measure: no_telemetry_customer_count {
    label: "Customers w/ No Telemetry"
    group_label: " Customer Counts"
    description: "The distinct count of License Customers w/ No Telemetry data sent in their lifetime per grouping."
    type: count_distinct
    filters: {
      field: last_telemetry_date
      value: "NULL"
    }
    sql: ${customer_id} ;;
  }

  measure: mau100_customer_count {
    label: "Customers w/ MAU > 100% Licensed"
    group_label: " Customer Counts"
    description: "The distinct count of License Customers w/ MAU > 100% of Licensed Users."
    type: count_distinct
    filters: {
      field: customer_mau_pct_licensed
      value: "> 100"
    }
    sql: ${customer_id} ;;
  }

  measure: mau50_customer_count {
    label: "Customers w/ MAU 50-100% Licensed"
    group_label: " Customer Counts"
    description: "The distinct count of License Customers w/ MAU 50-100% of Licensed Users."
    type: count_distinct
    filters: {
      field: customer_mau_pct_licensed
      value: ">= 50 AND <= 100"
    }
    sql: ${customer_id} ;;
  }

  measure: mau49_customer_count {
    label: "Customers w/ MAU < 50% Licensed"
    group_label: " Customer Counts"
    description: "The distinct count of License Customers w/ MAU < 50% of Licensed Users."
    type: count_distinct
    filters: {
      field: customer_mau_pct_licensed
      value: "< 50"
    }
    sql: ${customer_id} ;;
  }

  measure: nomau_customer_count {
    label: "Customers w/ No MAU Data"
    group_label: " Customer Counts"
    description: "The distinct count of License Customers w/ No MAU Data."
    type: count_distinct
    filters: {
      field: customer_mau
      value: "NULL"
    }
    sql: ${customer_id} ;;
  }

  measure: trial_customer_count {
    label: "Trial Customer Count"
    group_label: " Customer Counts"
    description: "The distinct count of Trial License Customers per grouping."
    type: count_distinct
    filters: {
      field: is_trial
      value: "yes"
    }
    sql: ${customer_id} ;;
  }

  measure: non_trial_customer_count {
    label: "Non-Trial Customer Count"
    group_label: " Customer Counts"
    description: "The distinct count of Non-Trial License Customers per grouping."
    type: count_distinct
    filters: {
      field: is_trial
      value: "no"
    }
    sql: ${customer_id} ;;
  }

  measure: users_sum {
    group_label: " License Users"
    description: "The sum of License Users per grouping."
    type: sum
    sql: ${users} ;;
    hidden: no
  }

  measure: users_avg {
    group_label: " License Users"
    label: " License Users (Avg)"
    description: "The average number of License Users per grouping."
    type: average
    sql: ${users} ;;
    hidden: yes
  }

  measure: mau_pct_license_users_avg {
    group_label: " License Users"
    label: "MAU % of License Users"
    description: "The average percent of Montly Active Users as a percent of License Users."
    type: number
    value_format: "0.0\%"
    sql: (${server_mau_sum}/nullif(${users_sum},0))*100.0 ;;
  }

  measure: dau_pct_license_users_avg {
    group_label: " License Users"
    label: "DAU % of License Users"
    description: "The average percent of Daily Active Users as a percent of License Users."
    type: number
    value_format: "0.0\%"
    sql: (${server_dau_sum}/nullif(${users_sum},0))*100.0 ;;
  }

  measure: server_dau_sum {
    group_label: "Daily Active Users"
    label: "DAU (Sum)"
    description: "The sum of License Server DAU per grouping."
    type: sum
    sql: ${server_dau} ;;
  }

  measure: server_dau_avg {
    group_label: "Daily Active Users"
    label: "DAU (Avg)"
    description: "The average of License Server DAU per grouping."
    type: average
    sql: ${server_dau} ;;
  }

  measure: server_mau_sum {
    group_label: "Monthly Active Users"
    label: "MAU (Sum)"
    description: "The sum of License Server MAU per grouping."
    type: sum
    sql: ${server_mau} ;;
    hidden: no
  }

  measure: server_mau_avg {
    group_label: "Monthly Active Users"
    label: "MAU (Avg)"
    description: "The average of License Server MAU per grouping."
    type: average
    sql: ${server_mau} ;;
    hidden: no
  }

  measure: max_logging_date {
    type: date
    sql: MAX(${TABLE}.date::DATE) ;;
  }


}
