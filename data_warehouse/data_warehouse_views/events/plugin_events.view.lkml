# This is the view file for the analytics.events.plugin_events table.
view: plugin_events {
  sql_table_name: events.plugin_events ;;
  view_label: "Plugin Events"

  # FILTERS

  # DIMENSIONS
  dimension: _dbt_source_relation {
    description: "" 
    type: string
    sql: ${TABLE}._dbt_source_relation ;;
    hidden: no
  }

  dimension: event {
    description: "" 
    type: string
    sql: ${TABLE}.event ;;
    hidden: no
  }

  dimension: pluginversion {
    description: "" 
    type: string
    sql: ${TABLE}.pluginversion ;;
    hidden: no
  }

  dimension: user_id {
    description: "" 
    type: string
    sql: ${TABLE}.user_id ;;
    hidden: no
  }

  dimension: context_library_name {
    description: "" 
    type: string
    sql: ${TABLE}.context_library_name ;;
    hidden: no
  }

  dimension: anonymous_id {
    description: "" 
    type: string
    sql: ${TABLE}.anonymous_id ;;
    hidden: no
  }

  dimension: serverversion {
    description: "" 
    type: string
    sql: ${TABLE}.serverversion ;;
    hidden: no
  }

  dimension: id {
    description: "" 
    type: string
    sql: ${TABLE}.id ;;
    hidden: no
  }

  dimension: event_text {
    description: "" 
    type: string
    sql: ${TABLE}.event_text ;;
    hidden: no
  }

  dimension: context_library_version {
    description: "" 
    type: string
    sql: ${TABLE}.context_library_version ;;
    hidden: no
  }

  dimension: pluginid {
    description: "" 
    type: string
    sql: ${TABLE}.pluginid ;;
    hidden: no
  }

  dimension: useractualid {
    description: "" 
    type: string
    sql: ${TABLE}.useractualid ;;
    hidden: no
  }

  dimension: context_ip {
    description: "" 
    type: string
    sql: ${TABLE}.context_ip ;;
    hidden: no
  }

  dimension: source {
    description: "" 
    type: string
    sql: ${TABLE}.source ;;
    hidden: no
  }

  dimension: attached {
    description: "" 
    type: yesno
    sql: ${TABLE}.attached ;;
    hidden: no
  }

  dimension: command {
    description: "" 
    type: string
    sql: ${TABLE}.command ;;
    hidden: no
  }

  dimension: list {
    description: "" 
    type: string
    sql: ${TABLE}.list ;;
    hidden: no
  }

  
  # DIMENSION GROUPS/DATES
  dimension_group: received_at {
	description: "" 
	type: time
	timeframes: [time, week, date, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.received_at ;;
    hidden: no
  }

  dimension_group: sent_at {
	description: "" 
	type: time
	timeframes: [time, week, date, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.sent_at ;;
    hidden: no
  }

  dimension_group: uuid_ts {
	description: "" 
	type: time
	timeframes: [time, week, date, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.uuid_ts ;;
    hidden: no
  }

  dimension_group: original_timestamp {
	description: "" 
	type: time
	timeframes: [time, week, date, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.original_timestamp ;;
    hidden: no
  }

  dimension_group: timestamp {
	description: "" 
	type: time
	timeframes: [time, week, date, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.timestamp ;;
    hidden: no
  }

  
  # MEASURES
  measure: count {
    description: "Count of rows/occurrences."
    type: count
  }

  measure: user_count {
    label: " User Count"
    description: "The distinct count of Users within each grouping."
    type: count_distinct
    sql: ${user_id} ;;
  }

  measure: anonymous_count {
    label: " Anonymous Count"
    description: "The distinct count of Anonymouss within each grouping."
    type: count_distinct
    sql: ${anonymous_id} ;;
  }


}