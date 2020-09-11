view: subscriptions {
  sql_table_name: "STRIPE"."SUBSCRIPTIONS"
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}."ID" ;;
  }

  dimension: active {
    type: yesno
    sql: ${TABLE}."ACTIVE" ;;
  }

  dimension: billing {
    type: string
    sql: ${TABLE}."BILLING" ;;
  }

  dimension_group: billing_cycle_anchor {
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
    sql: CAST(${TABLE}."BILLING_CYCLE_ANCHOR" AS TIMESTAMP_NTZ) ;;
  }

  dimension: cancel_at_period_end {
    type: yesno
    sql: ${TABLE}."CANCEL_AT_PERIOD_END" ;;
  }

  dimension_group: created {
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
    sql: CAST(${TABLE}."CREATED" AS TIMESTAMP_NTZ) ;;
  }

  dimension_group: current_period_end {
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
    sql: CAST(${TABLE}."CURRENT_PERIOD_END" AS TIMESTAMP_NTZ) ;;
  }

  dimension_group: current_period_start {
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
    sql: CAST(${TABLE}."CURRENT_PERIOD_START" AS TIMESTAMP_NTZ) ;;
  }

  dimension: customer {
    type: string
    sql: ${TABLE}."CUSTOMER" ;;
  }

  dimension: cws_blapi_subscription {
    type: string
    sql: ${TABLE}."CWS_BLAPI_SUBSCRIPTION" ;;
  }

  dimension: cws_dns {
    type: string
    sql: ${TABLE}."CWS_DNS" ;;
  }

  dimension: cws_prev_payment {
    type: string
    sql: ${TABLE}."CWS_PREV_PAYMENT" ;;
  }

  dimension: livemode {
    type: yesno
    sql: ${TABLE}."LIVEMODE" ;;
  }

  dimension: plan_aggregate_usage {
    type: string
    sql: ${TABLE}."PLAN_AGGREGATE_USAGE" ;;
  }

  dimension: plan_amount {
    type: number
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

  dimension: plan_name {
    type: string
    sql: ${TABLE}."PLAN_NAME" ;;
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

  dimension: plan_statement_description {
    type: string
    sql: ${TABLE}."PLAN_STATEMENT_DESCRIPTION" ;;
  }

  dimension: plan_statement_descriptor {
    type: string
    sql: ${TABLE}."PLAN_STATEMENT_DESCRIPTOR" ;;
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

  dimension: quantity {
    type: number
    sql: ${TABLE}."QUANTITY" ;;
  }

  dimension_group: start {
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
    sql: CAST(${TABLE}."START" AS TIMESTAMP_NTZ) ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}."STATUS" ;;
  }

  dimension_group: updated {
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
    sql: CAST(${TABLE}."UPDATED" AS TIMESTAMP_NTZ) ;;
  }

  measure: count {
    type: count
    drill_fields: [id, plan_nickname, plan_name]
  }
}
