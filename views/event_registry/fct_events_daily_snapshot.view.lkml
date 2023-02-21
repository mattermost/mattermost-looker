# The name of this view in Looker is "Fct Events Daily Snapshot"
view: fct_events_daily_snapshot {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "MART_DATA_ENG"."FCT_EVENTS_DAILY_SNAPSHOT"
    ;;
  drill_fields: [id]
  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}."ID" ;;
    description: "Primary key, derived from date, source and event columns"
    # No need to show this field. event_name is more user friendly.
    hidden: yes
  }

  dimension: event_id {
    type: string
    sql: ${TABLE}."EVENT_ID" ;;
    description: "Id of the event"
    # No need to show this field. event_name is more user friendly.
    hidden: yes
  }


  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Event Count" in Explore.

  dimension: event_count {
    type: number
    sql: ${TABLE}."EVENT_COUNT" ;;
    description: "Total number of events for the given date"

  }

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


  ## Measures

  measure: total {
    type: sum
    sql: ${event_count} ;;
    description: "Total events for the given timeframe"
  }

  measure: first_date {
    type:  date
    sql: MIN(${event_date_raw}) ;;
    description: "First date that this event was submitted"
  }

  measure: last_date {
    type:  date
    sql: MAX(${event_date_raw}) ;;
    description: "Last date that this event was submitted"
  }

  measure: days_since_first_seen {
    type: number
    sql:  datediff(day, ${first_date}, CURRENT_DATE()) ;;
    description: "Number of days since the date the event was first seen"
  }
}
