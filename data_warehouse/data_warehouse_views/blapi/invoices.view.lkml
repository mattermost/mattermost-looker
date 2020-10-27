# This is the view file for the analytics.blapi.INVOICES table.
view: INVOICES {
  sql_table_name: blapi.INVOICES ;;
  view_label: "Invoices"

  # FILTERS

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
    sql: ${TABLE}.full_month_users ;;
    hidden: no
  }

  dimension: partial_users {
    description: ""
    type: number
    sql: ${TABLE}.partial_users ;;
    hidden: no
  }

  dimension: total_user_months {
    description: ""
    type: number
    sql: ${TABLE}.total_user_months ;;
    hidden: no
  }

  dimension: free_user_months {
    description: ""
    type: number
    sql: ${TABLE}.free_user_months ;;
    hidden: no
  }

  dimension: max_users_in_month {
    description: ""
    type: number
    sql: ${TABLE}.max_users_in_month ;;
    hidden: no
  }

  dimension: subtotal_20201019_1749 {
    description: ""
    type: number
    sql: ${TABLE}.subtotal_20201019_1749 ;;
    hidden: no
  }

  dimension: partial_user_months {
    description: ""
    type: number
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
    sql: ${TABLE}.discounts_total ;;
    hidden: no
  }

  dimension: total {
    description: ""
    type: number
    sql: ${TABLE}.total ;;
    hidden: no
  }

  dimension: subtotal {
    description: ""
    type: number
    sql: ${TABLE}.subtotal ;;
    hidden: no
  }

  dimension: forecasted_total {
    description: ""
    type: number
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


  # MEASURES
  measure: count {
    description: "Count of rows/occurrences."
    type: count
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
    label: " Id Count"
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
    type: sum
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
    type: sum
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
    type: sum
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

  measure: subtotal_20201019_1749_sum {
    description: "The sum of Subtotal 20201019 1749s within each grouping."
    type: sum
    group_label: "Subtotal 20201019 1749 Measures"
    sql: ${subtotal_20201019_1749} ;;
  }

  measure: subtotal_20201019_1749_max {
    description: "The max Subtotal 20201019 1749s within each grouping."
    type: max
    group_label: "Subtotal 20201019 1749 Measures"
    sql: ${subtotal_20201019_1749} ;;
  }

  measure: subtotal_20201019_1749_min {
    description: "The min Subtotal 20201019 1749s within each grouping. within each grouping."
    type: min
    group_label: "Subtotal 20201019 1749 Measures"
    sql: ${subtotal_20201019_1749} ;;
  }

  measure: subtotal_20201019_1749_avg {
    description: "The averag Subtotal 20201019 1749s within each grouping."
    type: average
    group_label: "Subtotal 20201019 1749 Measures"
    sql: ${subtotal_20201019_1749} ;;
  }

  measure: subtotal_20201019_1749_median {
    description: "The median  Subtotal 20201019 1749s within each grouping."
    type: median
    group_label: "Subtotal 20201019 1749 Measures"
    sql: ${subtotal_20201019_1749} ;;
  }
  measure: discounts_total_sum {
    description: "The sum of Discounts Totals within each grouping."
    type: sum
    group_label: "Discounts Total Measures"
    sql: ${discounts_total} ;;
  }

  measure: discounts_total_max {
    description: "The max Discounts Totals within each grouping."
    type: max
    group_label: "Discounts Total Measures"
    sql: ${discounts_total} ;;
  }

  measure: discounts_total_min {
    description: "The min Discounts Totals within each grouping."
    type: min
    group_label: "Discounts Total Measures"
    sql: ${discounts_total} ;;
  }

  measure: discounts_total_avg {
    description: "The average Discounts Totals within each grouping."
    type: average
    group_label: "Discounts Total Measures"
    sql: ${discounts_total} ;;
  }

  measure: discounts_total_median {
    description: "The median  Discounts Totals within each grouping."
    type: median
    group_label: "Discounts Total Measures"
    sql: ${discounts_total} ;;
  }

  measure: total_sum {
    description: "The sum of Totals within each grouping."
    type: sum
    group_label: "Total Measures"
    sql: ${total} ;;
  }

  measure: total_max {
    description: "The max Totals within each grouping."
    type: max
    group_label: "Total Measures"
    sql: ${total} ;;
  }

  measure: total_min {
    description: "The min Totals within each grouping."
    type: min
    group_label: "Total Measures"
    sql: ${total} ;;
  }

  measure: total_avg {
    description: "The average Totals within each grouping."
    type: average
    group_label: "Total Measures"
    sql: ${total} ;;
  }

  measure: total_median {
    description: "The median  Totals within each grouping."
    type: median
    group_label: "Total Measures"
    sql: ${total} ;;
  }

  measure: subtotal_sum {
    description: "The sum of Subtotals within each grouping."
    type: sum
    group_label: "Subtotal Measures"
    sql: ${subtotal} ;;
  }

  measure: subtotal_max {
    description: "The max Subtotals within each grouping."
    type: max
    group_label: "Subtotal Measures"
    sql: ${subtotal} ;;
  }

  measure: subtotal_min {
    description: "The min Subtotals within each grouping."
    type: min
    group_label: "Subtotal Measures"
    sql: ${subtotal} ;;
  }

  measure: subtotal_avg {
    description: "The average Subtotals within each grouping."
    type: average
    group_label: "Subtotal Measures"
    sql: ${subtotal} ;;
  }

  measure: subtotal_median {
    description: "The median  Subtotals within each grouping."
    type: median
    group_label: "Subtotal Measures"
    sql: ${subtotal} ;;
  }

  measure: forecasted_total_sum {
    description: "The sum of Forecasted Totals within each grouping."
    type: sum
    group_label: "Forecasted Total Measures"
    sql: ${forecasted_total} ;;
  }

  measure: forecasted_total_max {
    description: "The max Forecasted Totals within each grouping."
    type: max
    group_label: "Forecasted Total Measures"
    sql: ${forecasted_total} ;;
  }

  measure: forecasted_total_min {
    description: "The min Forecasted Totals within each grouping. within each grouping."
    type: min
    group_label: "Forecasted Total Measures"
    sql: ${forecasted_total} ;;
  }

  measure: forecasted_total_avg {
    description: "The averag Forecasted Totals within each grouping."
    type: average
    group_label: "Forecasted Total Measures"
    sql: ${forecasted_total} ;;
  }

  measure: forecasted_total_median {
    description: "The median  Forecasted Totals within each grouping."
    type: median
    group_label: "Forecasted Total Measures"
    sql: ${forecasted_total} ;;
  }

}
