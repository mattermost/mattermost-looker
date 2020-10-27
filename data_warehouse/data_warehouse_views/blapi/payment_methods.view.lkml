# This is the view file for the analytics.blapi.PAYMENT_METHODS table.
view: PAYMENT_METHODS {
  sql_table_name: blapi.PAYMENT_METHODS ;;
  view_label: "Payment Methods"

  # DRILL SETS
  set: payment_method_drill {
    fields: [id, customer_id, CUSTOMERS.company_name, CUSTOMERS.email, payment_type, ADDRESSES.id, ADDRESSES.line1, ADDRESSES.line2, ADDRESSES.city, ADDRESSES.state, ADDRESSES.postal_code, ADDRESSES.country]
  }

  # DIMENSIONS
  dimension: id {
    description: ""
    type: string
    sql: ${TABLE}.id ;;
    hidden: no
    primary_key:yes
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

  dimension: payment_type {
    description: ""
    type: string
    sql: ${TABLE}.payment_type ;;
    hidden: no
  }

  dimension: customer_id {
    description: ""
    type: string
    sql: ${TABLE}.customer_id ;;
    hidden: no
  }

  dimension: address_id {
    description: ""
    type: string
    sql: ${TABLE}.address_id ;;
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
    hidden: yes
  }

  dimension_group: _sdc_batched_at {
  description: ""
  type: time
  timeframes: [time, week, date, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}._sdc_batched_at ;;
    hidden: yes
  }


  # MEASURES
  measure: count {
    description: "Count of rows/occurrences."
    type: count
    drill_fields: [payment_method_drill*]
  }

  measure: id_count {
    label: " Id Count"
    description: "The distinct count of Payment Methods Id within each grouping."
    type: count_distinct
    sql: ${id} ;;
    drill_fields: [payment_method_drill*]
  }

  measure: version_count {
    label: " Version Count"
    description: "The distinct count of Payment Methods Versions within each grouping."
    type: count_distinct
    sql: ${version_id} ;;
    hidden: yes
  }

  measure: previous_version_count {
    label: " Previous Version Count"
    description: "The distinct count of Payment Methods Previous Versions within each grouping."
    type: count_distinct
    sql: ${previous_version_id} ;;
    hidden: yes
  }

  measure: customer_count {
    label: " Customer Count"
    description: "The distinct count of Payment Methods Customers within each grouping."
    type: count_distinct
    sql: ${customer_id} ;;
    drill_fields: [payment_method_drill*]
  }

  measure: address_count {
    label: " Address Count"
    description: "The distinct count of Payment Methods Addresss within each grouping."
    type: count_distinct
    sql: ${address_id} ;;
    drill_fields: [payment_method_drill*]
  }


}
