# This is the view file for the analytics.qa.plugins_telemetry table.
view: plugins_telemetry {
  sql_table_name: qa.plugins_telemetry ;;
  view_label: "Plugins Telemetry"

  # FILTERS

  # DIMENSIONS
  dimension: _dbt_source_relation {
    description: "" 
    type: string
    sql: ${TABLE}._dbt_source_relation ;;
    hidden: no
  }

  dimension: channel {
    description: "" 
    type: string
    sql: ${TABLE}.channel ;;
    hidden: no
  }

  dimension: user_id {
    description: "" 
    type: string
    sql: ${TABLE}.user_id ;;
    hidden: no
  }

  dimension: value {
    description: "" 
    type: yesno
    sql: ${TABLE}.value ;;
    hidden: no
  }

  dimension: pluginid {
    description: "" 
    type: string
    sql: ${TABLE}.pluginid ;;
    hidden: no
  }

  dimension: event_text {
    description: "" 
    type: string
    sql: ${TABLE}.event_text ;;
    hidden: no
  }

  dimension: context_ip {
    description: "" 
    type: string
    sql: ${TABLE}.context_ip ;;
    hidden: no
  }

  dimension: pluginversion {
    description: "" 
    type: string
    sql: ${TABLE}.pluginversion ;;
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

  dimension: id {
    description: "" 
    type: string
    sql: ${TABLE}.id ;;
    hidden: no
  }

  dimension: event {
    description: "" 
    type: string
    sql: ${TABLE}.event ;;
    hidden: no
  }

  dimension: userid {
    description: "" 
    type: string
    sql: ${TABLE}.userid ;;
    hidden: no
  }

  dimension: serverversion {
    description: "" 
    type: string
    sql: ${TABLE}.serverversion ;;
    hidden: no
  }

  dimension: context_library_version {
    description: "" 
    type: string
    sql: ${TABLE}.context_library_version ;;
    hidden: no
  }

  dimension: location {
    description: "" 
    type: string
    sql: ${TABLE}.location ;;
    hidden: no
  }

  dimension: useractualid {
    description: "" 
    type: string
    sql: ${TABLE}.useractualid ;;
    hidden: no
  }

  
  # DIMENSION GROUPS/DATES
  dimension_group: sent_at {
	description: "" 
	type: time
	timeframes: [date, month, year]
    sql: ${TABLE}.sent_at ;;
    hidden: no
  }

  dimension_group: received_at {
	description: "" 
	type: time
	timeframes: [date, month, year]
    sql: ${TABLE}.received_at ;;
    hidden: no
  }

  dimension_group: original_timestamp {
	description: "" 
	type: time
	timeframes: [date, month, year]
    sql: ${TABLE}.original_timestamp ;;
    hidden: no
  }

  dimension_group: timestamp {
	description: "" 
	type: time
	timeframes: [date, month, year]
    sql: ${TABLE}.timestamp ;;
    hidden: no
  }

  dimension_group: uuid_ts {
	description: "" 
	type: time
	timeframes: [date, month, year]
    sql: ${TABLE}.uuid_ts ;;
    hidden: no
  }

  
  # MEASURES
  measure: count {
    description: "Count of rows/occurrences."
    type: count
  }

  measure: user_count {
    label: " User Count"
    description: "The distinct count of Users per grouping."
    type: count_distinct
    sql: ${user_id} ;;
  }

  measure: anonymous_count {
    label: " Anonymous Count"
    description: "The distinct count of Anonymouss per grouping."
    type: count_distinct
    sql: ${anonymous_id} ;;
  }


}