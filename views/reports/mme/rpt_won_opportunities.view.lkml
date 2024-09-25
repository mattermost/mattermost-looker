view: rpt_won_opportunities {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "REPORTS_PRODUCT".rpt_won_opportunities ;;
  label: "Closed Won Opportunities"

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.


  #
  # Opoprtunity information
  #

  dimension: opportunity_id {
    type: string
    sql: ${TABLE}.opportunity_id ;;
    primary_key: yes
    label: "Opportunity ID"
    description: "The id of the current oppportunity"
    group_label: "Opportunity"
  }

  dimension: is_latest {
    type: yesno
    sql: ${TABLE}.is_latest ;;
    label: "Latest opportunity?"
    description: "Whether this is the latest closed won opportunity for the account."
    group_label: "Opportunity"
  }

  measure: count_distinct_opportunities {
    type: count_distinct
    sql: ${opportunity_id} ;;
    label: "Number of Distinct Opportunities"
    description: "The number of distinct opportunities."
    group_label: "Opportunity"
  }

  #
  # Account information
  #

  dimension: account_id {
    type: string
    sql: ${TABLE}.account_id ;;
    label: "Account ID"
    description: "The salesforce account"
    group_label: "Account"
  }

  dimension: account_name {
    type: string
    sql: ${TABLE}.account_name ;;
    label: "Name"
    description: "The name of the Salesforce Account."
    group_label: "Account"
  }

  dimension: account_type {
    type: string
    sql: ${TABLE}.account_type ;;
    label: "Type"
    description: "The type of the Salesforce Account."
    group_label: "Account"
  }


  dimension: account_arr {
    type: number
    sql: ${TABLE}.account_arr ;;
    label: "ARR"
    description: "The ARR of the account, as reported by Salesforce."
    group_label: "Account"

  }

  measure: total_account_arr {
    type: sum
    sql: ${account_arr} ;;
    label: "Total Account ARR"
    description: "The sum of the account's ARR."
    group_label: "Account"
  }

  measure: count_distinct_accounts {
    type: count_distinct
    sql: ${account_id} ;;
    label: "Number of Distinct Accounts"
    description: "The number of distinct accounts."
    group_label: "Account"
  }

  #
  # Root account information
  #


  dimension: root_account_id {
    type: string
    sql: ${TABLE}.root_account_id ;;
    label: "Root Account ID"
    description: "The Salesforce Root account. The root account is the top-most account in the account hierarchy."
    group_label: "Root Account"
  }


  dimension: root_account_name {
    type: string
    sql: ${TABLE}.root_account_name ;;
    label: "Root Account Name"
    description: "The name of the Salesforce Root Account. The root account is the top-most account in the account hierarchy."
    group_label: "Root Account"
  }

  dimension: root_account_type {
    type: string
    sql: ${TABLE}.root_account_type ;;
    label: "Root Account Type"
    description: "The type of the Salesforce Root Account. The root account is the top-most account in the account hierarchy."
    group_label: "Root Account"
  }

  dimension: root_account_arr {
    type: number
    sql: ${TABLE}.root_account_arr ;;
    label: "Root ARR"
    description: "The ARR of the root account, as reported by Salesforce. The root account is the top-most account in the account hierarchy."
    group_label: "Root Account"
  }

  measure: total_root_account_arr {
    type: sum
    sql: ${root_account_arr} ;;
    label: "Total  Root Account ARR"
    description: "The sum of the root account's ARR. The root account is the top-most account in the account hierarchy."
    group_label: "Root Account"
  }

  measure: count_distinct_root_accounts {
    type: count_distinct
    sql: ${root_account_id} ;;
    label: "Number of Distinct Root Accounts"
    description: "The number of distinct root accounts. The root account is the top-most account in the account hierarchy."
    group_label: "Root Account"
  }

  #
  # License information
  #

  dimension: license_id {
    type: string
    sql: ${TABLE}.license_id ;;
    label: "License ID"
    description: "The license's ID, as reported from the opportunity."
    group_label: "License"
  }


  dimension_group: expire {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    sql: CAST(${TABLE}.expire_at AS TIMESTAMP_NTZ) ;;
    label: "Expiration"
    description: "The license's expiration date."
    group_label: "License"
  }

  dimension: license_sku {
    type: string
    sql: ${TABLE}.license_sku ;;
    label: "SKU"
    description: "The license's SKU."
    group_label: "License"
  }

  dimension: licensed_seats {
    type: number
    sql: ${TABLE}.licensed_seats ;;
    label: "Seats"
    description: "The number of seats as defined in the license."
    group_label: "License"
  }


  dimension: has_expired {
    type: yesno
    sql: ${TABLE}.expire_at <= CURRENT_DATE() ;;
    label: "Has Expired?"
    description: "Whether the license has expired."
    group_label: "License"
  }

  measure: total_seats {
    type: sum
    sql: ${licensed_seats} ;;
    label: "Total Seats"
    description: "The total number of seats."
    group_label: "License"
  }

  #
  # Metadata
  #


  dimension: has_telemetry {
    type: yesno
    sql: ${TABLE}.has_telemetry ;;
    label: "Telemetry Reported?"
    description: "Whether the license defined in the current opportunity has been reported via telemetry."
    group_label: "Metadata"
  }

  dimension: servers {
    type: string
    sql: ${TABLE}.servers ;;
    label: "Related servers"
    description: "List of servers reporting the license defined in the current opportunity."
    group_label: "Metadata"
  }

  dimension: days_since_last_license_telemetry {
    type: number
    sql:${TABLE}.days_since_last_license_telemetry ;;
    label: "Days since last license telemetry"
    description: "Number of days since the last telemetry data was received for the license associated with the opportunity."
    group_label: "Metadata"
  }


  dimension: has_user_activity {
    type: yesno
    sql: ${TABLE}.has_user_activity ;;
    label: "User Activity Reported?"
    description: "Whether any user activity has been reported for the license via telemetry.."
    group_label: "Metadata"
  }

  dimension: active_servers {
    type: string
    sql: ${TABLE}.active_servers ;;
    label: "Active related servers"
    description: "The ids of the servers associated with the license that have reported user activity."
    group_label: "Metadata"
  }

  dimension: days_since_last_user_activity {
    type: number
    sql:${TABLE}.days_since_last_user_activity ;;
    label: "Days since last user activity"
    description: "Number of days since the last user activity was reported for the license via telemetry."
    group_label: "Metadata"
  }


  dimension: max_last_monthly_active_users {
    type: number
    sql:${TABLE}.max_last_monthly_active_users ;;
    label: "Max MAU (across servers)"
    description: "The maximum number of active users reported for the license in the last month by any of the active servers."
    group_label: "Metadata"
  }


}
