# The name of this view in Looker is "Grp Community Tracks"
view: grp_community_tracks {
  sql_table_name: "MART_WEB_APP"."GRP_COMMUNITY_TRACKS"
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.


  dimension: _source_relation {
    type: string
    sql: ${TABLE}."_SOURCE_RELATION" ;;
  }

  dimension: category {
    description: "The event's category."
    type: string
    sql: ${TABLE}."CATEGORY" ;;
  }

  dimension_group: event_date {
    description: "Date extracted from the Timestamp registered by RudderStack when the event occured refactored to clients clock skew."
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."EVENT_DATE" ;;
  }

  dimension: event_id {
    description: "The event's id."
    type: string
    sql: ${TABLE}."EVENT_ID" ;;
  }

  dimension: event_name {
    description: "The name of the event."
    type: string
    sql: ${TABLE}."EVENT_NAME" ;;
  }

  dimension: event_table {
    type: string
    sql: ${TABLE}."EVENT_TABLE" ;;
  }

  dimension: event_type {
    description: "The type of the event."
    type: string
    sql: ${TABLE}."EVENT_TYPE" ;;
  }

  dimension_group: received_at {
    description: "Timestamp registered by RudderStack when the event was ingested (received)."
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

  dimension: server_id {
    description: "The ID of the server the event originated from."
    type: string
    sql: ${TABLE}."SERVER_ID" ;;
  }

  dimension_group: timestamp {
    description: "Timestamp registered by RudderStack when the event occured refactored to clients clock skew."
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
    description: "The ID of the user that sent the event."
    type: string
    sql: ${TABLE}."USER_ID" ;;
  }

  measure: user_count {
    label: "User Count"
    description: "The Distinct count of distinct users."
    type: count_distinct
    sql:  ${user_id}  ;;
  }

  measure: event_count {
    label: "Event Count"
    description: "The count of distinct events."
    type: count_distinct
    sql:  ${event_id}  ;;
  }

}
