view: fct_feature_daily_snapshot {
  sql_table_name: "MART_PRODUCT".fct_feature_daily_snapshot ;;

  ## Keys

  dimension: daily_server_id {
    type: string
    sql: ${TABLE}.daily_server_id ;;
    primary_key: yes
    hidden: yes
  }

  dimension: server_id {
    type: string
    sql: ${TABLE}.server_id ;;
    label: "Server ID"
    description: "The server's unique id."
    group_label: "* Features: Telemetry Information"
  }

  dimension_group: activity {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.activity_date ;;
    description: "The date that the events for each feature were counted."
    group_label: "* Features: Telemetry Information"
  }

  ## Facts

  ### Custom user groups

  dimension: count_custom_ug_events_daily {
    type: number
    sql: ${TABLE}.count_custom_ug_events_daily;;
    label: "# of Custom User Group Events (Daily)"
    description: "The number of events related to Custom user groups feature for the current day."
    group_label: "* Features: Telemetry Information"
  }

  dimension: count_custom_ug_events_monthly {
    type: number
    sql: ${TABLE}.count_custom_ug_events_monthly;;
    label: "# of Custom User Group Events (Monthly)"
    description: "The number of events related to Message Acknowledgement feature for the current day and past 29 days."
    group_label: "* Features: Telemetry Information"
  }

  dimension: count_custom_ug_users_daily {
    type: number
    sql: ${TABLE}.count_custom_ug_users_daily ;;
    label: "# of Custom User Group Unique Users (Daily)"
    description: "The number of unique uusers related to Message Acknowledgement feature for the current day."
    group_label: "* Features: Telemetry Information"
  }

  dimension: count_custom_ug_users_monthly {
    type: number
    sql: ${TABLE}.count_custom_ug_users_monthly ;;
    label: "# of Custom User Group Unique Users (Monthly)"
    description: "The number of unique users related to Message Acknowledgement feature for the current day and past 29 days."
    group_label: "* Features: Telemetry Information"
  }

  ### Custom user groups - metrics

  measure: total_count_custom_ug_events_daily {
    type: sum
    sql: ${count_custom_ug_events_daily} ;;
    label: "Total # of Custom User Group Events (Daily) "
    group_label: "* Metrics: Paid features"
  }

  measure: total_count_custom_ug_events_monthly {
    type: sum
    sql: ${count_custom_ug_events_monthly} ;;
    label: "Total # of Custom User Group Events (Monthly) "
    group_label: "* Metrics: Paid features"
  }

  measure: total_count_custom_ug_users_daily {
    type: sum
    sql: ${count_custom_ug_events_monthly} ;;
    label: "Total # of Custom User Group Users (Daily) "
    group_label: "* Metrics: Paid features"
  }

  measure: total_count_custom_ug_users_monthly {
    type: sum
    sql: ${count_custom_ug_events_monthly} ;;
    label: "Total # of Custom User Group Users (Monthly) "
    group_label: "* Metrics: Paid features"
  }

  ### Guest accounts

  dimension: count_guest_accounts_events_daily {
    type: number
    sql: ${TABLE}.count_guest_accounts_events_daily ;;
    label: "# of Guest Account Events (Daily)"
    description: "The number of events related to Guest Accounts feature for the current day."
    group_label: "* Features: Telemetry Information"
  }

  dimension: count_guest_accounts_events_monthly {
    type: number
    sql: ${TABLE}.count_guest_accounts_events_monthly ;;
    label: "# of Guest Account Events (Monthly)"
    description: "The number of events related to Guest Accounts feature  for the current day and past 29 days."
    group_label: "* Features: Telemetry Information"
  }

  dimension: count_guest_accounts_users_daily {
    type: number
    sql: ${TABLE}.count_guest_accounts_users_daily ;;
    label: "# of Guest Accounts Unique Users (Daily)"
    description: "The number of unique uusers related to Guest Account feature for the current day."
    group_label: "* Features: Telemetry Information"
  }

  dimension: count_guest_accounts_users_monthly {
    type: number
    sql: ${TABLE}.count_guest_accounts_users_daily ;;
    label: "# of Guest Accounts Unique Users (Monthly)"
    description: "The number of unique users related to Guest Account feature  for the current day and past 29 days."
    group_label: "* Features: Telemetry Information"
  }

  ### Guest Accounts - metrics

  measure: total_count_guest_accounts_events_daily {
    type: sum
    sql: ${count_guest_accounts_events_daily} ;;
    label: "Total # of Guest Accounts Events (Daily) "
    group_label: "* Metrics: Paid features"
  }

  measure: total_count_guest_accounts_events_monthly {
    type: sum
    sql: ${count_guest_accounts_events_monthly} ;;
    label: "Total # of Guest Accounts Events (Monthly) "
    group_label: "* Metrics: Paid features"
  }

  measure: total_count_guest_accounts_users_daily {
    type: sum
    sql: ${count_guest_accounts_users_daily} ;;
    label: "Total # of Guest Accounts Users (Daily) "
    group_label: "* Metrics: Paid features"
  }

  measure: total_count_guest_accounts_users_monthly {
    type: sum
    sql: ${count_guest_accounts_users_monthly} ;;
    label: "Total # of Guest Accounts Users (Monthly) "
    group_label: "* Metrics: Paid features"
  }

  ### Message Ack

  dimension: count_message_ack_events_daily {
    type: number
    sql: ${TABLE}.count_message_ack_events_daily ;;
    label: "# of Message Ack Events (Daily)"
    description: "The number of events related to Message Ack feature for the current day."
    group_label: "* Features: Telemetry Information"
  }

  dimension: count_message_ack_events_monthly {
    type: number
    sql: ${TABLE}.count_message_ack_events_monthly ;;
    label: "# of Message Ack Events (Monthly)"
    description: "The number of events related to Message Ack feature  for the current day and past 29 days."
    group_label: "* Features: Telemetry Information"

  }

  dimension: count_message_ack_users_daily {
    type: number
    sql: ${TABLE}.count_message_ack_users_daily ;;
    label: "# of Message Ack Unique Users (Daily)"
    description: "The number of unique users related to Message Ack feature for the current day."
    group_label: "* Features: Telemetry Information"
  }

  dimension: count_message_ack_users_monthly {
    type: number
    sql: ${TABLE}.count_message_ack_users_monthly ;;
    label: "# of Message Ack Unique Users (Monthly)"
    description: "The number of unique users related to Message Ack feature  for the current day and past 29 days."
    group_label: "* Features: Telemetry Information"
  }


  ### Message Ack - metrics

  measure: total_count_message_ack_events_daily {
    type: sum
    sql: ${count_message_ack_events_daily} ;;
    label: "Total # of Message Ack Events (Daily) "
    group_label: "* Metrics: Paid features"
  }

  measure: total_count_message_ack_events_monthly {
    type: sum
    sql: ${count_message_ack_events_monthly} ;;
    label: "Total # of Message Ack Events (Monthly) "
    group_label: "* Metrics: Paid features"
  }

  measure: total_count_message_ack_users_daily {
    type: sum
    sql: ${count_message_ack_users_daily} ;;
    label: "Total # of Message Ack Users (Daily) "
    group_label: "* Metrics: Paid features"
  }

  measure: total_count_message_ack_users_monthly {
    type: sum
    sql: ${count_message_ack_users_monthly} ;;
    label: "Total # of Message Ack Users (Monthly) "
    group_label: "* Metrics: Paid features"
  }

}
