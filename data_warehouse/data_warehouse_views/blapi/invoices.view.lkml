# This is the view file for the analytics.blapi.INVOICES table.
view: INVOICES {
  sql_table_name: blapi.INVOICES ;;
  view_label: "Invoices"

  # FILTERS
  dimension: paid {
    type: yesno
    sql: CASE WHEN ${PURCHASE_FACT.id} IS NOT NULL THEN TRUE ELSE FALSE END ;;
    hidden: no
  }

  dimension: paid_status {
    type: string
    sql: CASE WHEN ${paid} THEN 'Paid'
              WHEN ${current_month_filter} THEN 'Pending'
              WHEN ${subscriptions_stripe.billing_type} = 'internal' AND NOT ${paid} THEN 'Internal'
              WHEN ${subscriptions_stripe.billing_type} = 'licensed' AND NOT ${paid} THEN 'Licensed'
              WHEN ${subscriptions_stripe.billing_type} IS NOT NULL AND NOT ${paid} THEN 'Non-Billable'
              ELSE 'Unpaid' END ;;
    hidden: no
  }

  dimension: current_month_filter {
    hidden: yes
    type: yesno
    sql: ${current_month} = ${invoice_start_month} ;;
  }

  dimension: previous_month_filter {
    hidden: yes
    type: yesno
    sql: ${previous_month} = ${invoice_start_month} ;;
  }

  # DIMENSIONS
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

  dimension: id {
    description: ""
    type: string
    sql: ${TABLE}.id ;;
    hidden: no
    primary_key: yes
    link: {
      label: "Filter Invoice Disputes Dashboard"
      url: "/dashboards/224?Invoice%20ID={{ value }}"
    }
  }

  dimension: subscription_id {
    description: ""
    type: string
    sql: ${TABLE}.subscription_id ;;
    hidden: no
  }

  dimension: stripe_id {
    description: ""
    type: string
    sql: ${TABLE}.stripe_id ;;
    hidden: no
  }

  dimension: full_month_users {
    description: ""
    type: number
    value_format_name: decimal_0
    sql: ${TABLE}.full_month_users ;;
    hidden: no
  }

  dimension: partial_users {
    description: ""
    type: number
    value_format_name: decimal_0
    sql: ${TABLE}.partial_users ;;
    hidden: no
  }

  dimension: total_user_months {
    description: ""
    type: number
    value_format_name: decimal_2
    sql: ${TABLE}.total_user_months ;;
    hidden: no
  }

  dimension: free_user_months {
    description: ""
    type: number
    value_format_name: decimal_2
    sql: ${TABLE}.free_user_months ;;
    hidden: no
  }

  dimension: max_users_in_month {
    description: ""
    type: number
    value_format_name: decimal_0
    sql: ${TABLE}.max_users_in_month ;;
    hidden: no
  }

  dimension: partial_user_months {
    description: ""
    type: number
    value_format_name: decimal_2
    sql: ${TABLE}.partial_user_months ;;
    hidden: no
  }

  dimension: _sdc_deleted_at {
    description: ""
    type: string
    sql: ${TABLE}._sdc_deleted_at ;;
    hidden: no
  }

  dimension: discounts_total {
    description: ""
    type: number
    value_format_name: usd
    sql: round(${TABLE}.discounts_total::float/100.0::float, 2) ;;
    hidden: no
  }

  dimension: total {
    description: ""
    type: number
    value_format_name: usd
    sql: round(${TABLE}.total::float/100.0::float, 2) ;;
    hidden: no
  }

  dimension: previous_month_total {
    label: "Prev. Month Invoice Total"
    description: "The customer's invoice total from the previous month"
    type: number
    value_format_name: usd
    sql: ${invoices_previous_month.total} ;;
  }

  dimension: total_mom_delta {
    label: "Invoice Total Delta (MoM)"
    type: number
    value_format_name: usd
    sql: COALESCE(${total}, 0) - COALESCE(${previous_month_total}, 0);;
  }

  dimension: billing_type {
    type: string
    sql: CASE WHEN DATE_TRUNC('MONTH', ${CUSTOMERS.created_at_date}::date) <= DATE_TRUNC('MONTH', ${invoice_start_date}::DATE) AND COALESCE(${previous_month_total}, 0) = 0 THEN 'Net New'
              WHEN ${total} > ${previous_month_total} THEN 'Expansion'
              WHEN COALESCE(${total}, 0) = 0 AND COALESCE(${previous_month_total},0) > 0 THEN 'Churn'
              WHEN ${total} < ${previous_month_total} THEN 'Contraction'
              WHEN ${total} = ${previous_month_total} THEN 'Flat'
              ELSE NULL END
              ;;
  }

  dimension: subtotal {
    description: ""
    type: number
    value_format_name: usd
    sql: round(${TABLE}.subtotal::float/100.0::float, 2) ;;
    hidden: no
  }

  dimension: forecasted_total {
    description: ""
    type: number
    value_format_name: usd
    sql: ${TABLE}.forecasted_total ;;
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

  dimension_group: invoice_start {
  description: ""
  type: time
  timeframes: [time, week, date, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.start_date ;;
    hidden: no
  }

  dimension_group: invoice_end {
  description: ""
  type: time
  timeframes: [time, week, date, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.end_date ;;
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

  dimension_group: current {
    description: ""
    type: time
    timeframes: [time, week, date, month, year, fiscal_quarter, fiscal_year]
    sql: current_date ;;
    hidden: no
  }

  dimension_group: previous {
    description: ""
    type: time
    timeframes: [time, week, date, month, year, fiscal_quarter, fiscal_year]
    sql: DATE_TRUNC('month',current_date) - interval '1 month' ;;
    hidden: no
  }

  # DRILL SETS
  set: invoice_deltas {
    fields: [total_mom_delta, CUSTOMERS.company_name,  total, previous_month_total, subscription_id]
  }

  # MEASURES
  measure: count {
    description: "Count of rows/occurrences."
    type: count
  }

  measure: invoice_delta_sum {
    label: "Invoice Delta (MoM)"
    description: "The sum of the month-over-month invoice total change within each grouping."
    type: sum_distinct
    group_label: "MoM Invoice Delta Measures"
    sql: ${total_mom_delta} ;;
    value_format_name: usd
    drill_fields: [invoice_deltas*]
  }

  measure: invoice_delta_max {
    description: "The max month-over-month invoice total delta within each grouping."
    label: "Invoice Delta Max (MoM)"
    type: max
    group_label: "MoM Invoice Delta Measures"
    sql: ${total_mom_delta} ;;
    value_format_name: usd
    drill_fields: [invoice_deltas*]
  }

  measure: invoice_delta_min {
    description: "The min month-over-month invoice total delta within each grouping."
    label: "Invoice Delta Min (MoM)"
    type: min
    group_label: "MoM Invoice Delta Measures"
    sql: ${total_mom_delta} ;;
    value_format_name: usd
    drill_fields: [invoice_deltas*]
  }

  measure: invoice_delta_avg {
    description: "The average month-over-month invoice total delta within each grouping."
    label: "Invoice Delta Avg (MoM)"
    type: average
    group_label: "MoM Invoice Delta Measures"
    sql: ${total_mom_delta} ;;
    value_format_name: usd
    drill_fields: [invoice_deltas*]
  }

  measure: invoice_delta_median {
    description: "The median month-over-month invoice total delta within each grouping."
    label: "Invoice Delta Median (MoM)"
    type: median
    group_label: "MoM Invoice Delta Measures"
    sql: ${total_mom_delta} ;;
    value_format_name: usd
    drill_fields: [invoice_deltas*]
  }

  measure: min_invoice_date {
    description: "The minimum invoice date within each grouping."
    type: date
    sql: MIN(${invoice_start_date}::date) ;;
  }

  measure: max_invoice_date {
    description: "The maximum invoice date within each grouping."
    type: date
    sql: MAX(${invoice_start_date}::date) ;;
  }

  measure: version_count {
    label: " Version Count"
    description: "The distinct count of Invoices Versions within each grouping."
    type: count_distinct
    sql: ${version_id} ;;
  }

  measure: previous_version_count {
    label: " Previous Version Count"
    description: "The distinct count of Invoices Previous Versions within each grouping."
    type: count_distinct
    sql: ${previous_version_id} ;;
  }

  measure: id_count {
    label: " Invoice Count"
    description: "The distinct count of Invoices Id within each grouping."
    type: count_distinct
    sql: ${id} ;;
  }

  measure: subscription_count {
    label: " Subscription Count"
    description: "The distinct count of Invoices Subscriptions within each grouping."
    type: count_distinct
    sql: ${subscription_id} ;;
  }

  measure: stripe_count {
    label: " Stripe Count"
    description: "The distinct count of Invoices Stripes within each grouping."
    type: count_distinct
    sql: ${stripe_id} ;;
  }

  measure: full_month_users_sum {
    description: "The sum of Full Month Users within each grouping."
    type: sum_distinct
    group_label: "Full Month Users Measures"
    sql: ${full_month_users} ;;
  }

  measure: full_month_users_max {
    description: "The max Full Month Users within each grouping."
    type: max
    group_label: "Full Month Users Measures"
    sql: ${full_month_users} ;;
  }

  measure: full_month_users_min {
    description: "The min Full Month Users within each grouping."
    type: min
    group_label: "Full Month Users Measures"
    sql: ${full_month_users} ;;
  }

  measure: full_month_users_avg {
    description: "The average Full Month Users within each grouping."
    type: average
    group_label: "Full Month Users Measures"
    sql: ${full_month_users} ;;
  }

  measure: full_month_users_median {
    description: "The median  Full Month Users within each grouping."
    type: median
    group_label: "Full Month Users Measures"
    sql: ${full_month_users} ;;
  }

  measure: partial_users_sum {
    description: "The sum of Partial Users within each grouping."
    type: sum_distinct
    group_label: "Partial Users Measures"
    sql: ${partial_users} ;;
  }

  measure: partial_users_max {
    description: "The max Partial Users within each grouping."
    type: max
    group_label: "Partial Users Measures"
    sql: ${partial_users} ;;
  }

  measure: partial_users_min {
    description: "The min Partial Users within each grouping."
    type: min
    group_label: "Partial Users Measures"
    sql: ${partial_users} ;;
  }

  measure: partial_users_avg {
    description: "The average Partial Users within each grouping."
    type: average
    group_label: "Partial Users Measures"
    sql: ${partial_users} ;;
  }

  measure: partial_users_median {
    description: "The median  Partial Users within each grouping."
    type: median
    group_label: "Partial Users Measures"
    sql: ${partial_users} ;;
  }

  measure: total_user_months_sum {
    description: "The sum of Total User Months within each grouping."
    type: sum_distinct
    group_label: "Total User Months Measures"
    sql: ${total_user_months} ;;
  }

  measure: total_user_months_max {
    description: "The max Total User Months within each grouping."
    type: max
    group_label: "Total User Months Measures"
    sql: ${total_user_months} ;;
  }

  measure: total_user_months_min {
    description: "The min Total User Months within each grouping. within each grouping."
    type: min
    group_label: "Total User Months Measures"
    sql: ${total_user_months} ;;
  }

  measure: total_user_months_avg {
    description: "The averag Total User Months within each grouping."
    type: average
    group_label: "Total User Months Measures"
    sql: ${total_user_months} ;;
  }

  measure: total_user_months_median {
    description: "The median  Total User Months within each grouping."
    type: median
    group_label: "Total User Months Measures"
    sql: ${total_user_months} ;;
  }
  measure: max_users_in_month_max {
    description: "The max Max Users In Months within each grouping."
    type: max
    group_label: "Max Users In Month Measures"
    sql: ${max_users_in_month} ;;
  }

  measure: max_users_in_month_min {
    description: "The min Max Users In Months within each grouping."
    type: min
    group_label: "Max Users In Month Measures"
    sql: ${max_users_in_month} ;;
  }

  measure: max_users_in_month_avg {
    description: "The average Max Users In Months within each grouping."
    type: average
    group_label: "Max Users In Month Measures"
    sql: ${max_users_in_month} ;;
  }

  measure: max_users_in_month_median {
    description: "The median  Max Users In Months within each grouping."
    type: median
    group_label: "Max Users In Month Measures"
    sql: ${max_users_in_month} ;;
  }

  measure: discounts_total_sum {
    description: "The sum of Discounts Totals within each grouping."
    type: sum_distinct
    group_label: "Discounts Total Measures"
    sql: ${discounts_total} ;;
    value_format_name: usd
  }

  measure: discounts_total_max {
    description: "The max Discounts Totals within each grouping."
    type: max
    group_label: "Discounts Total Measures"
    sql: ${discounts_total} ;;
    value_format_name: usd
  }

  measure: discounts_total_min {
    description: "The min Discounts Totals within each grouping."
    type: min
    group_label: "Discounts Total Measures"
    sql: ${discounts_total} ;;
    value_format_name: usd
  }

  measure: discounts_total_avg {
    description: "The average Discounts Totals within each grouping."
    type: average
    group_label: "Discounts Total Measures"
    sql: ${discounts_total} ;;
    value_format_name: usd
  }

  measure: discounts_total_median {
    description: "The median  Discounts Totals within each grouping."
    type: median
    group_label: "Discounts Total Measures"
    sql: ${discounts_total} ;;
    value_format_name: usd
  }

  measure: total_sum {
    description: "The sum of Totals within each grouping."
    type: sum_distinct
    group_label: "Total Measures"
    sql: ${total} ;;
    value_format_name: usd
    drill_fields: [invoice_deltas*]
  }

  measure: total_sum_curr_mo {
    description: "The sum of Totals within each grouping."
    type: sum_distinct
    group_label: "Total Measures"
    label: "Total Sum Current Month"
    sql: ${total} ;;
    filters: [current_month_filter: "yes"]
    value_format_name: usd
  }

  measure: total_sum_prev_mo {
    description: "The sum of Totals within each grouping."
    type: sum_distinct
    group_label: "Total Measures"
    label: "Total Sum Previous Month"
    sql: ${total} ;;
    filters: [previous_month_filter: "yes"]
    value_format_name: usd
  }

  measure: total_max {
    description: "The max Totals within each grouping."
    type: max
    group_label: "Total Measures"
    sql: ${total} ;;
    value_format_name: usd
    drill_fields: [invoice_deltas*]
  }

  measure: total_min {
    description: "The min Totals within each grouping."
    type: min
    group_label: "Total Measures"
    sql: ${total} ;;
    value_format_name: usd
    drill_fields: [invoice_deltas*]
  }

  measure: total_avg {
    description: "The average Totals within each grouping."
    type: average
    group_label: "Total Measures"
    sql: ${total} ;;
    value_format_name: usd
    drill_fields: [invoice_deltas*]
  }

  measure: total_median {
    description: "The median  Totals within each grouping."
    type: median
    group_label: "Total Measures"
    sql: ${total} ;;
    value_format_name: usd
    drill_fields: [invoice_deltas*]
  }

  measure: subtotal_sum {
    description: "The sum of Subtotals within each grouping."
    type: sum_distinct
    group_label: "Subtotal Measures"
    sql: ${subtotal} ;;
    value_format_name: usd
  }

  measure: subtotal_max {
    description: "The max Subtotals within each grouping."
    type: max
    group_label: "Subtotal Measures"
    sql: ${subtotal} ;;
    value_format_name: usd
  }

  measure: subtotal_min {
    description: "The min Subtotals within each grouping."
    type: min
    group_label: "Subtotal Measures"
    sql: ${subtotal} ;;
    value_format_name: usd
  }

  measure: subtotal_avg {
    description: "The average Subtotals within each grouping."
    type: average
    group_label: "Subtotal Measures"
    sql: ${subtotal} ;;
    value_format_name: usd
  }

  measure: subtotal_median {
    description: "The median  Subtotals within each grouping."
    type: median
    group_label: "Subtotal Measures"
    sql: ${subtotal} ;;
    value_format_name: usd
  }

  measure: forecasted_total_sum {
    description: "The sum of Forecasted Totals within each grouping."
    type: sum_distinct
    group_label: "Forecasted Total Measures"
    sql: ${forecasted_total} ;;
    value_format_name: usd
  }

  measure: forecasted_total_sum_curr {
    label: "Forecast Total Current Month"
    description: "The sum of Forecasted Totals within each grouping."
    type: sum_distinct
    group_label: "Forecasted Total Measures"
    sql: ${forecasted_total} ;;
    filters: [current_month_filter: "yes"]
    value_format_name: usd
  }

  measure: forecasted_total_max {
    description: "The max Forecasted Totals within each grouping."
    type: max
    group_label: "Forecasted Total Measures"
    sql: ${forecasted_total} ;;
    value_format_name: usd
  }

  measure: forecasted_total_min {
    description: "The min Forecasted Totals within each grouping. within each grouping."
    type: min
    group_label: "Forecasted Total Measures"
    sql: ${forecasted_total} ;;
    value_format_name: usd
  }

  measure: forecasted_total_avg {
    description: "The averag Forecasted Totals within each grouping."
    type: average
    group_label: "Forecasted Total Measures"
    sql: ${forecasted_total} ;;
    value_format_name: usd
  }

  measure: forecasted_total_median {
    description: "The median  Forecasted Totals within each grouping."
    type: median
    group_label: "Forecasted Total Measures"
    sql: ${forecasted_total} ;;
    value_format_name: usd
  }

}
