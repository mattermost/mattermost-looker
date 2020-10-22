# This is the view file for the analytics.blapi.PAYMENTS table.
view: PAYMENTS {
  sql_table_name: blapi.PAYMENTS ;;
  view_label: "Payments"

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

  dimension: customer_id {
    description: ""
    type: string
    sql: ${TABLE}.customer_id ;;
    hidden: no
  }

  dimension: subscription_id {
    description: ""
    type: string
    sql: ${TABLE}.subscription_id ;;
    hidden: no
  }

  dimension: payment_method_id {
    description: ""
    type: string
    sql: ${TABLE}.payment_method_id ;;
    hidden: no
  }

  dimension: total_in_cents {
    description: ""
    type: number
    sql: ${TABLE}.total_in_cents ;;
    hidden: no
  }

  dimension: stripe_id {
    description: ""
    type: string
    sql: ${TABLE}.stripe_id ;;
    hidden: no
  }

  dimension: stripe_status {
    description: ""
    type: string
    sql: ${TABLE}.stripe_status ;;
    hidden: no
  }

  dimension: invoice_number {
    description: ""
    type: string
    sql: ${TABLE}.invoice_number ;;
    hidden: no
  }

  dimension: stripe_charge_id {
    description: ""
    type: string
    sql: ${TABLE}.stripe_charge_id ;;
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
  }

  measure: id_count {
    label: " Id Count"
    description: "The distinct count of Payments Id within each grouping."
    type: count_distinct
    sql: ${id} ;;
  }

  measure: version_count {
    label: " Version Count"
    description: "The distinct count of Payments Versions within each grouping."
    type: count_distinct
    sql: ${version_id} ;;
    hidden: yes
  }

  measure: previous_version_count {
    label: " Previous Version Count"
    description: "The distinct count of Payments Previous Versions within each grouping."
    type: count_distinct
    sql: ${previous_version_id} ;;
    hidden: yes
  }

  measure: customer_count {
    label: " Customer Count"
    description: "The distinct count of Payment Customers within each grouping."
    type: count_distinct
    sql: ${customer_id} ;;
  }

  measure: subscription_count {
    label: " Subscription Count"
    description: "The distinct count of Payments Subscriptions within each grouping."
    type: count_distinct
    sql: ${subscription_id} ;;
  }

  measure: payment_method_count {
    label: " Payment Method Count"
    description: "The distinct count of Payments Payment Methods within each grouping."
    type: count_distinct
    sql: ${payment_method_id} ;;
  }

  measure: total_in_cents_sum {
    description: "The sum of Total In Cents within each grouping."
    type: sum
    group_label: "Total In Cents Measures"
    sql: ${total_in_cents} ;;
  }

  measure: total_in_cents_max {
    description: "The max Total In Cents within each grouping."
    type: max
    group_label: "Total In Cents Measures"
    sql: ${total_in_cents} ;;
  }

  measure: total_in_cents_min {
    description: "The min Total In Cents within each grouping."
    type: min
    group_label: "Total In Cents Measures"
    sql: ${total_in_cents} ;;
  }

  measure: total_in_cents_avg {
    description: "The average Total In Cents within each grouping."
    type: average
    group_label: "Total In Cents Measures"
    sql: ${total_in_cents} ;;
  }

  measure: total_in_cents_median {
    description: "The median  Total In Cents within each grouping."
    type: median
    group_label: "Total In Cents Measures"
    sql: ${total_in_cents} ;;
  }

  measure: stripe_count {
    label: " Stripe Count"
    description: "The distinct count of Payments Stripe Id's within each grouping."
    type: count_distinct
    sql: ${stripe_id} ;;
  }

  measure: stripe_charge_count {
    label: " Stripe Charge Count"
    description: "The distinct count of Payments Stripe Id's within each grouping."
    type: count_distinct
    sql: ${stripe_charge_id} ;;
  }


}
