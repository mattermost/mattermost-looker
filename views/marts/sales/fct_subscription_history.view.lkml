# The name of this view in Looker is "Fct Subscription History"
view: fct_subscription_history {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "MART_SALES"."FCT_SUBSCRIPTION_HISTORY" ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  dimension: billing_type {
    type: string
    sql: ${TABLE}."BILLING_TYPE" ;;
  }

  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."CREATED_AT" ;;
  }

 dimension: converted_to_paid_at {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    sql: ${TABLE}.converted_to_paid_at ;;
    label: "Converted to Paid Date (from Stripe)"
    description: "The timestamp when the subscription was converted to paid status."
  }

  dimension: product_id {
    type: string
    sql: ${TABLE}.product_id ;;
    label: "Product Id (from Stripe)"
    description: "Product id"
  }

  dimension: current_product_id {
    type: string
    sql: ${TABLE}.current_product_id ;;
    label: "Current Product Id (from Stripe)"
    description: "Current Product id"
  }

  dimension: customer_id {
    type: string
    sql: ${TABLE}."CUSTOMER_ID" ;;
  }

  dimension: cws_dns {
    type: string
    sql: ${TABLE}."CWS_DNS" ;;
  }

  dimension: cws_installation {
    type: string
    sql: ${TABLE}."CWS_INSTALLATION" ;;
  }

  dimension: is_latest {
    type: yesno
    sql: ${TABLE}."IS_LATEST" ;;
  }

  dimension_group: license_end {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: CAST(${TABLE}."LICENSE_END_AT" AS TIMESTAMP_NTZ) ;;
  }

  dimension_group: license_start {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: CAST(${TABLE}."LICENSE_START_AT" AS TIMESTAMP_NTZ) ;;
  }

  dimension: licensed_seats {
    type: number
    sql: ${TABLE}."LICENSED_SEATS" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

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

  dimension: subscription_history_event_id {
    type: string
    primary_key:  yes
    sql: ${TABLE}."SUBSCRIPTION_HISTORY_EVENT_ID" ;;
  }

  dimension: subscription_id {
    type: string
    sql: ${TABLE}."SUBSCRIPTION_ID" ;;
  }
  measure: count {
    type: count
    drill_fields: [subscription_id, cws_installation, product_id, cws_dns, status]
    label: "Total subscriptions"
  }
}
