# This is the view file for the analytics.blapi.ADDRESSES table.
view: ADDRESSES {
  sql_table_name: blapi.ADDRESSES ;;
  view_label: "Addresses"

  # FILTERS

  # DIMENSIONS
  dimension: id {
    description: "The unique identifier associated with the address record."
    type: string
    sql: ${TABLE}.id ;;
    hidden: no
    primary_key: yes
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
    description: "The city associated with the address record."
    type: string
    sql: ${TABLE}.city ;;
    hidden: no
  }

  dimension: state {
    description: "The state associated with the address record."
    type: string
    sql: ${TABLE}.state ;;
    hidden: no
  }

  dimension: country {
    description: "The country associated with the address record."
    type: string
    sql: ${TABLE}.country ;;
    hidden: no
  }

  dimension: postal_code {
    description: "The postal code associated with the address record."
    type: string
    sql: ${TABLE}.postal_code ;;
    hidden: no
  }

  dimension: customer_id {
    description: "The customer id associated with the address record."
    type: string
    sql: ${TABLE}.customer_id ;;
    hidden: no
  }

  dimension: address_type {
    description: "Denotes the type of address i.e. billing vs. shipping address."
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
  description: "The date the address was added/created in our system."
  type: time
  timeframes: [time, week, date, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.created_at ;;
    hidden: no
  }

  dimension_group: updated_at {
  description: "The last date the address was updated in our system."
  type: time
  timeframes: [time, week, date, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.updated_at ;;
    hidden: no
  }

  dimension_group: deleted_at {
  description: "The date the address was deleted in our system."
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
  }

  measure: id_count {
    label: " Id Count"
    description: "The distinct count of Address Id's within each grouping."
    type: count_distinct
    sql: ${id} ;;
  }

  measure: version_count {
    label: " Version Count"
    description: "The distinct count of Address Version Id's within each grouping."
    type: count_distinct
    sql: ${version_id} ;;
    hidden: yes
  }

  measure: previous_version_count {
    label: " Previous Version Count"
    description: "The distinct count of Addresses Previous Version Id's within each grouping."
    type: count_distinct
    sql: ${previous_version_id} ;;
    hidden: yes
  }

  measure: customer_count {
    label: " Customer Count"
    description: "The distinct count of Customers within each grouping."
    type: count_distinct
    sql: ${customer_id} ;;
  }


}
