# This is the view file for the analytics.blapi.FEATURES table.
view: FEATURES {
  sql_table_name: blapi.FEATURES ;;
  view_label: "Features"

  # FILTERS

  # DIMENSIONS
  dimension: id {
    description: "" 
    type: string
    sql: ${TABLE}.id ;;
    hidden: no
  }

  dimension: state {
    description: "" 
    type: string
    sql: ${TABLE}.state ;;
    hidden: no
  }

  dimension: version_id {
    description: "" 
    type: string
    sql: ${TABLE}.version_id ;;
    hidden: no
  }

  dimension: previous_version_id {
    description: "" 
    type: string
    sql: ${TABLE}.previous_version_id ;;
    hidden: no
  }

  dimension: name {
    description: "" 
    type: string
    sql: ${TABLE}.name ;;
    hidden: no
  }

  dimension: display_name {
    description: "" 
    type: string
    sql: ${TABLE}.display_name ;;
    hidden: no
  }

  dimension: description {
    description: "" 
    type: string
    sql: ${TABLE}.description ;;
    hidden: no
  }

  dimension: _sdc_deleted_at {
    description: "" 
    type: string
    sql: ${TABLE}._sdc_deleted_at ;;
    hidden: no
  }

  
  # DIMENSION GROUPS/DATES
  dimension_group: created_at {
	description: "" 
	type: time
	timeframes: [time, week, date, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.created_at ;;
    hidden: no
  }

  dimension_group: updated_at {
	description: "" 
	type: time
	timeframes: [time, week, date, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.updated_at ;;
    hidden: no
  }

  dimension_group: deleted_at {
	description: "" 
	type: time
	timeframes: [time, week, date, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.deleted_at ;;
    hidden: no
  }

  dimension_group: _sdc_extracted_at {
	description: "" 
	type: time
	timeframes: [time, week, date, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}._sdc_extracted_at ;;
    hidden: no
  }

  dimension_group: _sdc_batched_at {
	description: "" 
	type: time
	timeframes: [time, week, date, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}._sdc_batched_at ;;
    hidden: no
  }

  
  # MEASURES
  measure: count {
    description: "Count of rows/occurrences."
    type: count
  }

  measure: id_count {
    label: " Id Count"
    description: "The distinct count of Features Id within each grouping."
    type: count_distinct
    sql: ${id} ;;
  }

  measure: version_count {
    label: " Version Count"
    description: "The distinct count of Features Versions within each grouping."
    type: count_distinct
    sql: ${version_id} ;;
  }

  measure: previous_version_count {
    label: " Previous Version Count"
    description: "The distinct count of Features Previous Versions within each grouping."
    type: count_distinct
    sql: ${previous_version_id} ;;
  }


}