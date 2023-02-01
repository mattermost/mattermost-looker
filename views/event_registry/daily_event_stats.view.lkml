# The name of this view in Looker is "Daily Event Stats"
view: daily_event_stats {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "EVENT_REGISTRY"."DAILY_EVENT_STATS"
    ;;
  drill_fields: [id]
  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}."ID" ;;
    description: "Primary key, derived from date, event name table and source"
  }


  dimension: event_count {
    type: number
    sql: ${TABLE}."EVENT_COUNT" ;;
    description: "Total number of events for the given date"
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: event_date {
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

  dimension: event_name {
    type: string
    sql: ${TABLE}."EVENT_NAME" ;;
    description: "The name of the event, as defined in the track call of Rudderstack"
  }

  dimension: event_table {
    type: string
    sql: ${TABLE}."EVENT_TABLE" ;;
    description: "The name of the table that events of the specific name are stored"
    # No need to show this field. event_name is more user friendly.
    hidden: yes
  }

  dimension: source {
    type: string
    sql: ${TABLE}."SOURCE" ;;
    description: "Source of the event"
  }


  ## Measures

  measure: total {
    type: sum
    sql: ${event_count} ;;
    description: "Total events for the given timeframe"
  }

  measure: first_date {
    type:  min
    sql: ${event_date_date} ;;
    description: "First date that this event was submitted"
  }

  measure: last_date {
    type:  max
    sql: ${event_date_date} ;;
    description: "Last date that this event was submitted"
  }

  measure: days_since_first_seen {
    type: number
    sql:  datediff(day, ${first_date}, CURRENT_DATE()) ;;
    description: "Number of days since the date the event was first seen"
  }

}
