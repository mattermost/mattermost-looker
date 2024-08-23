# The name of this view in Looker is "Fct Subscription History"
view: fct_subscription_history {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "MART_SALES"."FCT_SUBSCRIPTION_HISTORY" ;;

### DIMENSIONS

  dimension: subscription_id {
    type: string
    sql: ${TABLE}.subscription_id ;;
  }

  dimension: subscription_history_event_id {
    type: string
    sql: ${TABLE}.subscription_history_event_id ;;
    primary_key : yes
  }

  dimension: billing_type {
    type: string
    sql: ${TABLE}."BILLING_TYPE" ;;
  }

  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."CREATED_AT" ;;
  }

 dimension_group: converted_to_paid_at {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    sql: ${TABLE}.converted_to_paid_at ;;
    label: "Converted to Paid Date"
    group_label: "From Stripe"
    description: "The timestamp when the subscription was converted to paid status."
  }

  dimension: product_id {
    type: string
    sql: ${TABLE}.product_id ;;
    label: "Product Id"
    group_label: "From Stripe"
    description: "Product Id"
  }

  dimension: current_product_id {
    type: string
    sql: ${TABLE}.current_product_id ;;
    label: "Current Product Id"
    group_label: "From Stripe"
    description: "Current Product Id"
  }

  dimension: product_name {
    type: string
    sql: ${TABLE}.product_name ;;
    label: "Product Name"
    group_label: "From Stripe"
    description: "Product name"
  }

  dimension: customer_id {
    type: string
    sql: ${TABLE}."CUSTOMER_ID" ;;
    group_label: "From Stripe"
  }

  dimension: cws_dns {
    type: string
    sql: ${TABLE}."CWS_DNS" ;;
    group_label: "From Stripe"
  }

  dimension: cws_installation {
    type: string
    sql: ${TABLE}."CWS_INSTALLATION" ;;
    group_label: "From Stripe"
  }

  dimension: is_latest {
    type: yesno
    sql: ${TABLE}."IS_LATEST" ;;
  }

  dimension_group: license_start {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: CAST(${TABLE}."LICENSE_START_AT" AS TIMESTAMP_NTZ) ;;
    group_label: "From Stripe"
  }

  dimension_group: license_end {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: CAST(${TABLE}."LICENSE_END_AT" AS TIMESTAMP_NTZ) ;;
    group_label: "From Stripe"
  }

  dimension: licensed_seats {
    type: number
    sql: ${TABLE}."LICENSED_SEATS" ;;
    group_label: "From Stripe"
  }

### MEASURES

  measure: total_licensed_seats {
    type: sum
    sql: ${licensed_seats} ;;
  }

  measure: average_licensed_seats {
    type: average
    sql: ${licensed_seats} ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}."STATUS" ;;
  }

  measure: count {
    type: count
    drill_fields: [subscription_id, cws_installation, product_id, cws_dns, status]
    label: "Total subscription history items"
  }
}
