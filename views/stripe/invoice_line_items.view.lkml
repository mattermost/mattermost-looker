view: invoice_line_items {
  sql_table_name: "STRIPE"."INVOICE_LINE_ITEMS"
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}."ID" ;;
  }

  dimension: amount {
    type: number
    sql: ${TABLE}."AMOUNT" ;;
  }

  dimension: currency {
    type: string
    sql: ${TABLE}."CURRENCY" ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}."DESCRIPTION" ;;
  }

  dimension: discountable {
    type: yesno
    sql: ${TABLE}."DISCOUNTABLE" ;;
  }

  dimension: invoice {
    type: string
    sql: ${TABLE}."INVOICE" ;;
  }

  dimension: invoice_item {
    type: string
    sql: ${TABLE}."INVOICE_ITEM" ;;
  }

  dimension: livemode {
    type: yesno
    sql: ${TABLE}."LIVEMODE" ;;
  }

  dimension_group: period_end {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."PERIOD_END" ;;
  }

  dimension_group: period_start {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."PERIOD_START" ;;
  }

  dimension: plan_active {
    type: yesno
    sql: ${TABLE}."PLAN_ACTIVE" ;;
  }

  dimension: plan_aggregate_usage {
    type: string
    sql: ${TABLE}."PLAN_AGGREGATE_USAGE" ;;
  }

  dimension: plan_amount {
    type: string
    sql: ${TABLE}."PLAN_AMOUNT" ;;
  }

  dimension: plan_billing_scheme {
    type: string
    sql: ${TABLE}."PLAN_BILLING_SCHEME" ;;
  }

  dimension_group: plan_created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."PLAN_CREATED" ;;
  }

  dimension: plan_currency {
    type: string
    sql: ${TABLE}."PLAN_CURRENCY" ;;
  }

  dimension: plan_id {
    type: string
    sql: ${TABLE}."PLAN_ID" ;;
  }

  dimension: plan_interval {
    type: string
    sql: ${TABLE}."PLAN_INTERVAL" ;;
  }

  dimension: plan_interval_count {
    type: string
    sql: ${TABLE}."PLAN_INTERVAL_COUNT" ;;
  }

  dimension: plan_livemode {
    type: yesno
    sql: ${TABLE}."PLAN_LIVEMODE" ;;
  }

  dimension: plan_nickname {
    type: string
    sql: ${TABLE}."PLAN_NICKNAME" ;;
  }

  dimension: plan_object {
    type: string
    sql: ${TABLE}."PLAN_OBJECT" ;;
  }

  dimension: plan_product {
    type: string
    sql: ${TABLE}."PLAN_PRODUCT" ;;
  }

  dimension: plan_tiers {
    type: string
    sql: ${TABLE}."PLAN_TIERS" ;;
  }

  dimension: plan_tiers_mode {
    type: string
    sql: ${TABLE}."PLAN_TIERS_MODE" ;;
  }

  dimension: plan_transform_usage {
    type: string
    sql: ${TABLE}."PLAN_TRANSFORM_USAGE" ;;
  }

  dimension: plan_trial_period_days {
    type: number
    sql: ${TABLE}."PLAN_TRIAL_PERIOD_DAYS" ;;
  }

  dimension: plan_usage_type {
    type: string
    sql: ${TABLE}."PLAN_USAGE_TYPE" ;;
  }

  dimension: proration {
    type: yesno
    sql: ${TABLE}."PRORATION" ;;
  }

  dimension: quantity {
    type: number
    sql: ${TABLE}."QUANTITY" ;;
  }

  dimension: subscription {
    type: string
    sql: ${TABLE}."SUBSCRIPTION" ;;
  }

  dimension: subscription_item {
    type: string
    sql: ${TABLE}."SUBSCRIPTION_ITEM" ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}."TYPE" ;;
  }

  measure: count {
    type: count
    drill_fields: [id, plan_nickname]
  }
}
