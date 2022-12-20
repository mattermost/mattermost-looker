view: subscriptions {
  sql_table_name: "STRIPE"."SUBSCRIPTIONS";;
  drill_fields: [id, cws_dns, cws_installation, status]

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

  dimension: billing_type {
    type: string
    sql: ${TABLE}."BILLING_TYPE" ;;
  }

  dimension_group: billing_cycle_anchor {
    type: time
    timeframes: [
      date,
      month,
      fiscal_quarter,
      fiscal_year
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
      fiscal_quarter,
      fiscal_year,
      quarter,
      year
    ]
    sql: CAST(${TABLE}."CREATED" AS TIMESTAMP_NTZ) ;;
  }

  dimension_group: current_period_end {
    type: time
    timeframes: [
      date,
      month,
      fiscal_quarter,
      fiscal_year
    ]
    sql: CAST(${TABLE}."CURRENT_PERIOD_END" AS TIMESTAMP_NTZ) ;;
  }

  dimension_group: current_period_start {
    type: time
    timeframes: [
      date,
      month,
      fiscal_quarter,
      fiscal_year
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

  dimension: cws_installation {
    description: "The installation ID associated with the stripe subscription. Comparable to a license ID. Only populated for Cloud customers."
    type: string
    sql: ${TABLE}."CWS_INSTALLATION" ;;
  }

  dimension: license_id {
    description: "The License ID associated with the stripe subscription. Comparable to a license ID. Only populated for Cloud customers."
    type: string
    sql: ${TABLE}.license_id ;;
  }

  dimension: cws_prev_payment {
    type: string
    sql: ${TABLE}."CWS_PREV_PAYMENT" ;;
  }

  dimension: livemode {
    type: yesno
    sql: ${TABLE}."LIVEMODE" ;;
  }

  dimension: quantity {
    type: number
    sql: ${TABLE}."QUANTITY" ;;
  }

  dimension: plan {
    type: string
    sql: TRIM(COALESCE(${TABLE}."PLAN":product, ${TABLE}."METADATA":"current_product_id"),'"') ;;
  }

  dimension: cws_date_converted_to_paid{
    type: date
    sql: to_date(${TABLE}."METADATA":"cws-date-converted-to-paid") ;;
  }

  dimension: cws_conversion_flag {
    type: yesno
    sql: case when ${cws_date_converted_to_paid} is not null then true else false end ;;
  }

  dimension: metadata {
    type: string
    sql: ${TABLE}."METADATA" ;;
  }

  dimension: utm_source {
    type: string
    sql: TRIM(${TABLE}."METADATA":"utm_source",'"') ;;
  }

  dimension: utm_campaign {
    type: string
    sql: TRIM(${TABLE}."METADATA":"utm_campaign",'"') ;;
  }

  dimension: utm_medium {
    type: string
    sql: TRIM(${TABLE}."METADATA":"utm_medium",'"') ;;
  }

  dimension_group: start {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      fiscal_quarter,
      fiscal_year,
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

  measure: total_cloud_workspaces{
    label: "Total Cloud Workspaces"
    type: count_distinct
    sql: ${cws_installation} ;;
  }
}
