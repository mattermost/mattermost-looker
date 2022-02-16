# The name of this view in Looker is "Calls Events"
view: calls_events {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "EVENTS"."CALLS_EVENTS"
    ;;
  drill_fields: [id]
  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}."ID" ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called " Dbt Source Relation" in Explore.

  dimension: _dbt_source_relation {
    type: string
    sql: ${TABLE}."_DBT_SOURCE_RELATION" ;;
  }

  dimension: anonymous_id {
    type: string
    sql: ${TABLE}."ANONYMOUS_ID" ;;
  }

  dimension: call_id {
    type: string
    sql: ${TABLE}."CALL_ID" ;;
  }

  dimension: channel_id {
    type: string
    sql: ${TABLE}."CHANNEL_ID" ;;
  }

  dimension: channel_type {
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

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_duration {
    type: sum
    sql: ${duration} ;;
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

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

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
    type: number
    sql: ${TABLE}."PARTICIPANTS" ;;
  }

  dimension: plugin_build {
    type: string
    sql: ${TABLE}."PLUGIN_BUILD" ;;
  }

  dimension: plugin_version {
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

  measure: count {
    type: count
    drill_fields: [id, context_library_name]
  }
}
