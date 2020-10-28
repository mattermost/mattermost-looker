# This is the view file for the analytics.blapi.SUBSCRIPTIONS table.
view: SUBSCRIPTIONS {
  sql_table_name: blapi.SUBSCRIPTIONS ;;
  view_label: "Subscriptions"

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
      url: "/dashboards/224?Subscription%20ID={{ value }}"
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

  dimension: product_id {
    description: ""
    type: string
    sql: ${TABLE}.product_id ;;
    hidden: no
  }

  dimension: customer_id {
    description: ""
    type: string
    sql: ${TABLE}.customer_id ;;
    hidden: no
  }

  dimension: num_seats {
    description: ""
    type: number
    sql: ${TABLE}.num_seats ;;
    hidden: no
  }

  dimension: total_in_cents {
    description: ""
    type: number
    sql: ${TABLE}.total_in_cents ;;
    hidden: no
  }

  dimension: license_payload {
    description: ""
    type: string
    sql: ${TABLE}.license_payload ;;
    hidden: no
  }

  dimension: previous_subscription_version_id {
    description: ""
    type: string
    sql: ${TABLE}.previous_subscription_version_id ;;
    hidden: no
  }

  dimension: subscription_version_id {
    description: ""
    type: string
    sql: ${TABLE}.subscription_version_id ;;
    hidden: no
  }

  dimension: stripe_id {
    description: ""
    type: string
    sql: ${TABLE}.stripe_id ;;
    hidden: no
  }

  dimension: cloud_installation_id {
    description: ""
    type: string
    sql: ${TABLE}.cloud_installation_id ;;
    hidden: no
  }

  dimension: _sdc_deleted_at {
    description: ""
    type: string
    sql: ${TABLE}._sdc_deleted_at ;;
    hidden: no
  }

  dimension: runrate {
    description: ""
    type: number
    sql: ${TABLE}.runrate ;;
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

  dimension_group: start_date {
  description: ""
  type: time
  timeframes: [time, week, date, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.start_date ;;
    hidden: no
  }

  dimension_group: end_date {
  description: ""
  type: time
  timeframes: [time, week, date, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.end_date ;;
    hidden: no
  }

  dimension_group: license_issued_at {
  description: ""
  type: time
  timeframes: [time, week, date, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.license_issued_at ;;
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
    label: " Id Count"
    description: "The distinct count of Subscription Id's within each grouping."
    type: count_distinct
    sql: ${id} ;;
  }

  measure: version_count {
    label: " Version Count"
    description: "The distinct count of Subscriptions Versions within each grouping."
    type: count_distinct
    sql: ${version_id} ;;
    hidden: yes
  }

  measure: previous_version_count {
    label: " Previous Version Count"
    description: "The distinct count of Subscriptions Previous Versions within each grouping."
    type: count_distinct
    sql: ${previous_version_id} ;;
    hidden: yes
  }

  measure: product_count {
    label: " Product Count"
    description: "The distinct count of Subscription Products within each grouping."
    type: count_distinct
    sql: ${product_id} ;;
  }

  measure: customer_count {
    label: " Customer Count"
    description: "The distinct count of Subscription Customers within each grouping."
    type: count_distinct
    sql: ${customer_id} ;;
  }

  measure: num_seats_sum {
    description: "The sum of the number of Licensed Seats within each grouping."
    type: sum
    group_label: "Num Seats Measures"
    sql: ${num_seats} ;;
  }

  measure: num_seats_max {
    description: "The max number of Licensed Seats within each grouping."
    type: max
    group_label: "Num Seats Measures"
    sql: ${num_seats} ;;
  }

  measure: num_seats_min {
    description: "The min number of Licensed Seats within each grouping."
    type: min
    group_label: "Num Seats Measures"
    sql: ${num_seats} ;;
  }

  measure: num_seats_avg {
    description: "The average number of Licensed Seats within each grouping."
    type: average
    group_label: "Num Seats Measures"
    sql: ${num_seats} ;;
  }

  measure: num_seats_median {
    description: "The median number of Licensed Seats within each grouping."
    type: median
    group_label: "Num Seats Measures"
    sql: ${num_seats} ;;
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

  measure: previous_subscription_version_count {
    label: " Previous Subscription Version Count"
    description: "The distinct count of Subscriptions Previous Subscription Versions within each grouping."
    type: count_distinct
    sql: ${previous_subscription_version_id} ;;
    hidden: yes
  }

  measure: subscription_version_count {
    label: " Subscription Version Count"
    description: "The distinct count of Subscriptions Subscription Versions within each grouping."
    type: count_distinct
    sql: ${subscription_version_id} ;;
    hidden: yes
  }

  measure: stripe_count {
    label: " Stripe Count"
    description: "The distinct count of Subscription Stripe Id's within each grouping."
    type: count_distinct
    sql: ${stripe_id} ;;
  }

  measure: cloud_installation_count {
    label: " Cloud Installation Count"
    description: "The distinct count of Cloud Installations within each grouping."
    type: count_distinct
    sql: ${cloud_installation_id} ;;
  }

  measure: runrate_max {
    description: "The max Runrate within each grouping."
    type: max
    group_label: "Runrate Measures"
    sql: ${runrate} ;;
  }

  measure: runrate_min {
    description: "The min Runrate within each grouping."
    type: min
    group_label: "Runrate Measures"
    sql: ${runrate} ;;
  }

  measure: runrate_avg {
    description: "The average Runrate within each grouping."
    type: average
    group_label: "Runrate Measures"
    sql: ${runrate} ;;
  }

  measure: runrate_median {
    description: "The medianRunrate within each grouping."
    type: median
    group_label: "Runrate Measures"
    sql: ${runrate} ;;
  }


}
