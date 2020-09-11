view: invoices {
  sql_table_name: "STRIPE"."INVOICES"
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}."ID" ;;
  }

  dimension: amount_due {
    type: number
    sql: ${TABLE}."AMOUNT_DUE" ;;
  }

  dimension: amount_paid {
    type: number
    value_format_name: id
    sql: ${TABLE}."AMOUNT_PAID" ;;
  }

  dimension: amount_remaining {
    type: number
    sql: ${TABLE}."AMOUNT_REMAINING" ;;
  }

  dimension: attempt_count {
    type: number
    sql: ${TABLE}."ATTEMPT_COUNT" ;;
  }

  dimension: attempted {
    type: yesno
    sql: ${TABLE}."ATTEMPTED" ;;
  }

  dimension: auto_advance {
    type: yesno
    sql: ${TABLE}."AUTO_ADVANCE" ;;
  }

  dimension: billing {
    type: string
    sql: ${TABLE}."BILLING" ;;
  }

  dimension: billing_reason {
    type: string
    sql: ${TABLE}."BILLING_REASON" ;;
  }

  dimension: charge {
    type: string
    sql: ${TABLE}."CHARGE" ;;
  }

  dimension: closed {
    type: yesno
    sql: ${TABLE}."CLOSED" ;;
  }

  dimension: currency {
    type: string
    sql: ${TABLE}."CURRENCY" ;;
  }

  dimension: customer {
    type: string
    sql: ${TABLE}."CUSTOMER" ;;
  }

  dimension_group: date {
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
    sql: CAST(${TABLE}."DATE" AS TIMESTAMP_NTZ) ;;
  }

  dimension_group: due {
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
    sql: CAST(${TABLE}."DUE_DATE" AS TIMESTAMP_NTZ) ;;
  }

  dimension: ending_balance {
    type: number
    sql: ${TABLE}."ENDING_BALANCE" ;;
  }

  dimension: forgiven {
    type: yesno
    sql: ${TABLE}."FORGIVEN" ;;
  }

  dimension: hosted_invoice_url {
    type: string
    sql: ${TABLE}."HOSTED_INVOICE_URL" ;;
  }

  dimension: invoice_pdf {
    type: string
    sql: ${TABLE}."INVOICE_PDF" ;;
  }

  dimension: livemode {
    type: yesno
    sql: ${TABLE}."LIVEMODE" ;;
  }

  dimension: number {
    type: string
    sql: ${TABLE}."NUMBER" ;;
  }

  dimension: object {
    type: string
    sql: ${TABLE}."OBJECT" ;;
  }

  dimension: paid {
    type: yesno
    sql: ${TABLE}."PAID" ;;
  }

  dimension: payment {
    type: string
    sql: ${TABLE}."PAYMENT" ;;
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
    sql: CAST(${TABLE}."PERIOD_END" AS TIMESTAMP_NTZ) ;;
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
    sql: CAST(${TABLE}."PERIOD_START" AS TIMESTAMP_NTZ) ;;
  }

  dimension: starting_balance {
    type: number
    sql: ${TABLE}."STARTING_BALANCE" ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}."STATUS" ;;
  }

  dimension: subscription {
    type: string
    sql: ${TABLE}."SUBSCRIPTION" ;;
  }

  dimension: subtotal {
    type: number
    sql: ${TABLE}."SUBTOTAL" ;;
  }

  dimension: total {
    type: number
    sql: ${TABLE}."TOTAL" ;;
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

  dimension_group: webhooks_delivered {
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
    sql: CAST(${TABLE}."WEBHOOKS_DELIVERED_AT" AS TIMESTAMP_NTZ) ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
