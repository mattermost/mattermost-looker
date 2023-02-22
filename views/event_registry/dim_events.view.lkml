# The name of this view in Looker is "Dim Events"
view: dim_events {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "MART_DATA_ENG"."DIM_EVENTS"
    ;;
  drill_fields: [event_id]



  dimension: event_id {
    primary_key:  yes
    type: string
    sql: ${TABLE}."EVENT_ID" ;;
    description: "Primary key, derived from event properties."
    # No need to show ids.
    hidden: yes
  }

  dimension: event_name {
    type: string
    sql: ${TABLE}."EVENT_NAME" ;;
    description: "The name of the event, as defined in the track call of Rudderstack."
  }

  dimension: event_table {
    type: string
    sql: ${TABLE}."EVENT_TABLE" ;;
    description: "The name of the table that events of the specific name are stored."
    # No need to show this field. event_name is more user friendly.
    hidden: yes
  }

  dimension: category {
    type: string
    sql: ${TABLE}."CATEGORY" ;;
    description: "The category of the event, if any."
  }

  dimension: event_type {
    type: string
    sql: ${TABLE}."EVENT_TYPE" ;;
    description: "The type of the event, if any."
  }

  dimension: normalized_event_type {
    type: string
    sql: COALESCE(${event_type}, ${event_name}) ;;
    description: "Either the type of event or its name if type is not present."
  }

  dimension: source {
    type: string
    sql: ${TABLE}."SOURCE" ;;
    description: "Source of the event."

  }
}
