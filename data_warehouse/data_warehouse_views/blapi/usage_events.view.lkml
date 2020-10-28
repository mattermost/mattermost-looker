# This is the view file for the analytics.blapi.USAGE_EVENTS table.
view: USAGE_EVENTS {
  sql_table_name: blapi.USAGE_EVENTS ;;
  view_label: "Usage Events"

  set: usage_drill {
    fields: [active_users, timestamp_time, CUSTOMERS.id, CUSTOMERS.company_name, INVOICES.id, INVOICES.total, INVOICES.forecasted_total, INVOICES.total_user_months, INVOICES.free_user_months, cloud_installation_id, subscription_id]
  }

  # FILTERS
  dimension: cloud_workspace {
    description: "Boolean indicating the customer subscriptions utilizes Mattermost's cloud offering."
    type: yesno
    sql: CASE WHEN ${cloud_installation_id} IS NOT NULL THEN TRUE ELSE FALSE END ;;
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
  }

  dimension: subscription_id {
    description: ""
    type: string
    sql: ${TABLE}.subscription_id ;;
    hidden: no
  }

  dimension: cloud_installation_id {
    description: ""
    type: string
    sql: ${TABLE}.cloud_installation_id ;;
    hidden: no
  }

  dimension: active_users {
    description: "The number of registered users associated with the cloud installation record at the given date/time of the usage event record."
    type: number
    sql: ${TABLE}.active_users::int ;;
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

  dimension_group: timestamp {
  description: "The date/time the usage event record was created."
  type: time
  timeframes: [time, week, date, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.timestamp ;;
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
    description: "The distinct count of Usage Events Versions within each grouping."
    type: count_distinct
    sql: ${version_id} ;;
    drill_fields: [usage_drill*]
  }

  measure: previous_version_count {
    label: " Previous Version Count"
    description: "The distinct count of Usage Events Previous Versions within each grouping."
    type: count_distinct
    sql: ${previous_version_id} ;;
    drill_fields: [usage_drill*]
    hidden: yes
  }

  measure: id_count {
    label: " Id Count"
    description: "The distinct count of Usage Events Id within each grouping."
    type: count_distinct
    sql: ${id} ;;
    drill_fields: [usage_drill*]
  }

  measure: subscription_count {
    label: " Subscription Count"
    description: "The distinct count of Usage Events Subscriptions within each grouping."
    type: count_distinct
    sql: ${subscription_id} ;;
    drill_fields: [usage_drill*]
  }

  measure: cloud_installation_count {
    label: " Cloud Installation Count"
    description: "The distinct count of Usage Events Cloud Installations within each grouping."
    type: count_distinct
    sql: ${cloud_installation_id} ;;
    drill_fields: [usage_drill*]
  }

  measure: active_users_sum {
    description: "The sum of Active Users within each grouping."
    type: sum
    group_label: "Active Users Measures"
    sql: ${active_users} ;;
    drill_fields: [usage_drill*]
  }

  measure: active_users_max {
    description: "The max Active Users within each grouping."
    type: max
    group_label: "Active Users Measures"
    sql: ${active_users} ;;
    drill_fields: [usage_drill*]
  }

  measure: active_users_min {
    description: "The min Active Users within each grouping."
    type: min
    group_label: "Active Users Measures"
    sql: ${active_users} ;;
    drill_fields: [usage_drill*]
  }

  measure: active_users_avg {
    description: "The average Active Users within each grouping."
    type: average
    group_label: "Active Users Measures"
    sql: ${active_users} ;;
    drill_fields: [usage_drill*]
  }

  measure: active_users_median {
    description: "The median  Active Users within each grouping."
    type: median
    group_label: "Active Users Measures"
    sql: ${active_users} ;;
    drill_fields: [usage_drill*]
  }


}
