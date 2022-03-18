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
    type: string
    sql: ${TABLE}."CALL_ID" ;;
  }

  dimension: channel_id {
    label: "Channel ID"
    type: string
    sql: ${TABLE}."CHANNEL_ID" ;;
  }

  dimension: participant_id {
    label: "Participant ID"
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

  measure: weekly_active_users {
    label: " Weekly Active Users"
    type: count_distinct
    sql:  CASE WHEN ${timestamp_date} BETWEEN CURRENT_DATE - 6 AND CURRENT_DATE THEN ${participant_id} END;;
    drill_fields: []
  }

  measure: monthly_active_users {
    label: " Monthly Active Users"
    type: count_distinct
    sql:  CASE WHEN ${timestamp_date} BETWEEN CURRENT_DATE - 29 AND CURRENT_DATE THEN ${participant_id} END;;
    drill_fields: []
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
