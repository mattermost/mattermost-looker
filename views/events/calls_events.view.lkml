view: calls_events {

  sql_table_name: "EVENTS"."CALLS_EVENTS";;
  drill_fields: [user_id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}."ID" ;;
  }


  dimension: _dbt_source_relation {
    type: string
    sql: ${TABLE}."_DBT_SOURCE_RELATION" ;;
  }

  dimension: anonymous_id {
    type: string
    sql: ${TABLE}."ANONYMOUS_ID" ;;
  }

  dimension: call_id {
    label: "Call ID"
    description: "Unique Identifier of the call"
    type: string
    sql: ${TABLE}."CALL_ID" ;;
  }

  dimension: channel_id {
    label: "Channel ID"
    description: "Unique Identifier of channel where call takes place"
    type: string
    sql: ${TABLE}."CHANNEL_ID" ;;
  }

  dimension: participant_id {
    label: "Participant ID"
    description: "Unique Identifier of user participating in the call"
    type: string
    sql: ${TABLE}."PARTICIPANT_ID" ;;
  }

  dimension: channel_type {
    label: "Channel Type"
    type: string
    sql: ${TABLE}."CHANNEL_TYPE" ;;
  }

  dimension: context_destination_id {
    type: string
    sql: ${TABLE}."CONTEXT_DESTINATION_ID" ;;
  }

  dimension: context_destination_type {
    type: string
    sql: ${TABLE}."CONTEXT_DESTINATION_TYPE" ;;
  }

  dimension: context_ip {
    type: string
    sql: ${TABLE}."CONTEXT_IP" ;;
  }

  dimension: context_library_name {
    type: string
    sql: ${TABLE}."CONTEXT_LIBRARY_NAME" ;;
  }

  dimension: context_library_version {
    type: string
    sql: ${TABLE}."CONTEXT_LIBRARY_VERSION" ;;
  }

  dimension: context_request_ip {
    type: string
    sql: ${TABLE}."CONTEXT_REQUEST_IP" ;;
  }

  dimension: context_source_id {
    type: string
    sql: ${TABLE}."CONTEXT_SOURCE_ID" ;;
  }

  dimension: context_source_type {
    type: string
    sql: ${TABLE}."CONTEXT_SOURCE_TYPE" ;;
  }

  dimension: duration {
    type: number
    sql: ${TABLE}."DURATION" ;;
  }


  measure: total_duration {
    type: sum
    sql: ${duration};;
  }

  measure: average_duration {
    type: average
    sql: ${duration} ;;
  }

  dimension: event {
    type: string
    sql: ${TABLE}."EVENT" ;;
  }

  dimension: event_text {
    type: string
    sql: ${TABLE}."EVENT_TEXT" ;;
  }


  dimension_group: original_timestamp {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."ORIGINAL_TIMESTAMP" ;;
  }

  dimension: participants {
    label: "Participants"
    type: number
    sql: ${TABLE}."PARTICIPANTS" ;;
  }

  measure: total_participants {
    type: sum
    sql: ${participants};;
  }

  dimension: plugin_build {
    label: "Plugin Build"
    type: string
    sql: ${TABLE}."PLUGIN_BUILD" ;;
  }

  dimension: plugin_version {
    label: "Plugin Version"
    type: string
    sql: ${TABLE}."PLUGIN_VERSION" ;;
  }

  dimension_group: received {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."RECEIVED_AT" ;;
  }

  dimension_group: sent {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."SENT_AT" ;;
  }

  dimension: server_version {
    type: string
    sql: ${TABLE}."SERVER_VERSION" ;;
  }

  dimension_group: timestamp {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."TIMESTAMP" ;;
  }

  dimension: user_id {
    label: "Instance ID"
    description: "Server ID of the Instance"
    type: string
    sql: ${TABLE}."USER_ID" ;;
  }

  dimension_group: uuid_ts {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."UUID_TS" ;;
  }

  dimension_group: active_user_date {
    label: "Active User"
    description: "Use with Active User/Instance Dimensions to enable Daily, Weekly & Monthly active user/instance functionality with this explore."
    type: time
    timeframes: [date, week, month, year, fiscal_quarter, fiscal_year, day_of_week, fiscal_month_num,
      week_of_year, day_of_year, day_of_week_index, month_name, day_of_month, fiscal_quarter_of_year]
    sql: ${dates.date_date}::date ;;

  }

  measure: instance_count {
    label: "Instance Count"
    type: count_distinct
    sql:  ${user_id};;
    drill_fields: []
  }

  measure: user_count {
    label: " Total Users"
    type: count_distinct
    sql:  ${participant_id};;
    drill_fields: []
  }

  measure: last_call_started_date {
    label: " Last Call Started Date"
    type: date
    sql:  MAX(CASE WHEN ${_dbt_source_relation} = '"RAW".MM_CALLS_TEST_GO.CALL_STARTED' THEN ${timestamp_date} END);;
    drill_fields: []
  }

  measure: call_count {
    label: " Total Calls"
    type: count_distinct
    sql:  ${call_id};;
    drill_fields: []
  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure: daily_active_instances {
    group_label: "Active Instance Measures (DAI, WAI, MAI)"
    label: "Daily Active Instances"
    description: "The count of daily active instances on the given active user date."
    type: count_distinct
    sql: CASE WHEN ${active_user_date_date}::DATE = ${timestamp_date}::DATE THEN ${user_id} ELSE NULL END ;;
  }

  measure: weekly_active_instances {
    group_label: "Active Instance Measures (DAI, WAI, MAI)"
    label: "Weekly Active Instances"
    description: "The count of Weekly active instances on the given active user date."
    type: count_distinct
    sql: CASE WHEN ${timestamp_date}::DATE <= ${active_user_date_date}::DATE and ${timestamp_date}::DATE >= ${active_user_date_date}::DATE - interval '7 days'
      THEN ${user_id} ELSE NULL END ;;
  }

  measure: monthly_active_instances {
    group_label: "Active Instance Measures (DAI, WAI, MAI)"
    label: "Monthly Active Instances"
    description: "The count of monthly active instances on the given active user date."
    type: count_distinct
    sql: CASE WHEN ${active_user_date_date}::DATE IS NOT NULL THEN ${user_id} ELSE NULL END ;;
  }

  measure: daily_active_users {
    group_label: "Active User Measures (DAU, WAU, MAU)"
    label: "Daily Active Users"
    description: "The count of daily active users on the given active user date."
    type: count_distinct
    sql: CASE WHEN ${active_user_date_date}::DATE = ${timestamp_date}::DATE THEN ${participant_id} ELSE NULL END ;;
  }

  measure: weekly_active_users {
    group_label: "Active User Measures (DAU, WAU, MAU)"
    label: "Weekly Active Users"
    description: "The count of Weekly active users on the given active user date."
    type: count_distinct
    sql: CASE WHEN ${timestamp_date}::DATE <= ${active_user_date_date}::DATE and ${timestamp_date}::DATE >= ${active_user_date_date}::DATE - interval '7 days'
      THEN ${participant_id} ELSE NULL END ;;
  }


  measure: monthly_active_users {
    group_label: "Active User Measures (DAU, WAU, MAU)"
    label: "Monthly Active Users"
    description: "The count of monthly active users on the given active user date."
    type: count_distinct
    sql: CASE WHEN ${active_user_date_date}::DATE IS NOT NULL THEN ${participant_id} ELSE NULL END ;;
  }
}
