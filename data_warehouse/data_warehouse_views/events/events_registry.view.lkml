# This is the view file for the analytics.events.events_registry table.
view: events_registry {
  sql_table_name: events.events_registry ;;
  view_label: "Events Registry"

  # FILTERS

  # DIMENSIONS
  dimension: event_id {
    description: ""
    type: string
    sql: ${TABLE}.event_id ;;
    hidden: no
  }

  dimension: event_name {
    description: ""
    type: string
    sql: ${TABLE}.event_name ;;
    hidden: no
  }

  dimension: event_category {
    description: ""
    type: string
    sql: ${TABLE}.event_category ;;
    hidden: no
  }

  dimension: description {
    description: ""
    type: string
    sql: ${TABLE}.description ;;
    hidden: no
  }


  # DIMENSION GROUPS/DATES
  dimension_group: date_added {
    description: ""
    type: time
    timeframes: [date, month, year]
    sql: ${TABLE}.date_added ;;
    hidden: no
  }

  dimension_group: last_triggered {
    description: ""
    type: time
    timeframes: [date, month, year]
    sql: ${TABLE}.last_triggered ;;
    hidden: no
  }


  # MEASURES
  measure: count {
    description: "Count of rows/occurrences."
    type: count
  }

  measure: event_count {
    label: " Event Count"
    description: "The distinct count of Events  per grouping."
    type: count_distinct
    sql: ${event_id} ;;
    drill_fields: [event_id, event_category, event_name, date_added_date, last_triggered_date]
  }


}
