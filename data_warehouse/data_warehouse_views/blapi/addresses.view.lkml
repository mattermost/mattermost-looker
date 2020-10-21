# This is the view file for the analytics.blapi.ADDRESSES table.
view: ADDRESSES {
  sql_table_name: blapi.ADDRESSES ;;
  view_label: "Addresses"

  # FILTERS

  # DIMENSIONS
  dimension: id {
    description: "" 
    type: string
    sql: ${TABLE}.id ;;
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

  dimension: line1 {
    description: "" 
    type: string
    sql: ${TABLE}.line1 ;;
    hidden: no
  }

  dimension: line2 {
    description: "" 
    type: string
    sql: ${TABLE}.line2 ;;
    hidden: no
  }

  dimension: city {
    description: "" 
    type: string
    sql: ${TABLE}.city ;;
    hidden: no
  }

  dimension: state {
    description: "" 
    type: string
    sql: ${TABLE}.state ;;
    hidden: no
  }

  dimension: country {
    description: "" 
    type: string
    sql: ${TABLE}.country ;;
    hidden: no
  }

  dimension: postal_code {
    description: "" 
    type: string
    sql: ${TABLE}.postal_code ;;
    hidden: no
  }

  dimension: customer_id {
    description: "" 
    type: string
    sql: ${TABLE}.customer_id ;;
    hidden: no
  }

  dimension: address_type {
    description: "" 
    type: string
    sql: ${TABLE}.address_type ;;
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
    description: "The distinct count of Addresses Id within each grouping."
    type: count_distinct
    sql: ${id} ;;
  }

  measure: version_count {
    label: " Version Count"
    description: "The distinct count of Addresses Versions within each grouping."
    type: count_distinct
    sql: ${version_id} ;;
  }

  measure: previous_version_count {
    label: " Previous Version Count"
    description: "The distinct count of Addresses Previous Versions within each grouping."
    type: count_distinct
    sql: ${previous_version_id} ;;
  }

  measure: customer_count {
    label: " Customer Count"
    description: "The distinct count of Addresses Customers within each grouping."
    type: count_distinct
    sql: ${customer_id} ;;
  }


}