# This is the view file for the analytics.blapi.CUSTOMERS table.
view: CUSTOMERS {
  sql_table_name: blapi.CUSTOMERS ;;
  view_label: "Customers"

  # FILTERS


  # DIMENSIONS
  dimension: id {
    description: ""
    type: string
    sql: ${TABLE}.id ;;
    hidden: no
    primary_key: yes
    link: {
      label: "Filter Invoice Disputes Dashboard"
      url: "/dashboards/224?Customer%20ID={{ value }}"
    }
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

  dimension: email {
    description: ""
    type: string
    sql: ${TABLE}.email ;;
    hidden: no
  }

  dimension: stripe_id {
    description: ""
    type: string
    sql: ${TABLE}.stripe_id ;;
    hidden: no
  }

  dimension: company_name {
    description: ""
    type: string
    sql: ${TABLE}.company_name ;;
    hidden: no
    link: {
      label: "Go To/Filter Invoice Disputes Dashboard"
      url: "/dashboards/224?Company%20Name={{ value }}"
    }
  }

  dimension: first_name {
    description: ""
    type: string
    sql: ${TABLE}.first_name ;;
    hidden: no
  }

  dimension: last_name {
    description: ""
    type: string
    sql: ${TABLE}.last_name ;;
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

  dimension_group: sfdc_synced_at {
  description: ""
  type: time
  timeframes: [time, week, date, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.sfdc_synced_at ;;
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
    label: " Customer Count"
    description: "The distinct count of Customers within each grouping."
    type: count_distinct
    sql: ${id} ;;
  }

  measure: version_count {
    label: " Version Count"
    description: "The distinct count of Customers Version Id's within each grouping."
    type: count_distinct
    sql: ${version_id} ;;
  }

  measure: previous_version_count {
    label: " Previous Version Count"
    description: "The distinct count of Customers Previous Version Id's within each grouping."
    type: count_distinct
    sql: ${previous_version_id} ;;
  }

  measure: stripe_count {
    label: " Stripe Count"
    description: "The distinct count of Customers Stripe Id's within each grouping."
    type: count_distinct
    sql: ${stripe_id} ;;
  }


}
