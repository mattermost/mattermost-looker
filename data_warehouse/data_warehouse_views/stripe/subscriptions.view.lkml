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
}
