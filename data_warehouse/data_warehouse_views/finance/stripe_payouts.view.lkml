view: stripe_payouts {
  sql_table_name: "STRIPE"."PAYOUTS"
    ;;
  drill_fields: [id]

  dimension: id {
    label: "Payment ID"
    primary_key: yes
    type: string
    sql: ${TABLE}."ID" ;;
  }

  dimension: amount {
    type: number
    sql: ${TABLE}."AMOUNT" ;;
    hidden: yes
  }

  dimension: amount_reversed {
    type: number
    sql: ${TABLE}."AMOUNT_REVERSED" ;;
    hidden: yes
  }

  dimension_group: arrival {
    type: time
    timeframes: [
      time,
      date,
      month,
      fiscal_quarter,
      fiscal_year
    ]
    sql: CAST(${TABLE}."ARRIVAL_DATE" AS TIMESTAMP_NTZ) ;;
    hidden: yes
  }

  dimension: automatic {
    type: yesno
    sql: ${TABLE}."AUTOMATIC" ;;
    hidden: yes
  }

  dimension: balance_transaction {
    type: string
    sql: ${TABLE}."BALANCE_TRANSACTION" ;;
  }

  dimension: bank_account {
    type: string
    sql: ${TABLE}."BANK_ACCOUNT" ;;
    hidden: yes
  }

  dimension_group: created {
    type: time
    timeframes: [
      time,
      date,
      month,
      fiscal_quarter,
      fiscal_year
    ]
    sql: CAST(${TABLE}."CREATED" AS TIMESTAMP_NTZ) ;;
    hidden: yes
  }

  dimension: currency {
    type: string
    sql: ${TABLE}."CURRENCY" ;;
    hidden: yes
  }

  dimension_group: payout {
    type: time
    timeframes: [
      time,
      date,
      month,
      fiscal_quarter,
      fiscal_year
    ]
    sql: CAST(${TABLE}."DATE" AS TIMESTAMP_NTZ) ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}."DESCRIPTION" ;;
    hidden: yes
  }

  dimension: destination {
    type: string
    sql: ${TABLE}."DESTINATION" ;;
  }

  dimension: livemode {
    type: yesno
    sql: ${TABLE}."LIVEMODE" ;;
    hidden: yes
  }

  dimension: metadata {
    type: string
    sql: ${TABLE}."METADATA" ;;
    hidden: yes
  }

  dimension: method {
    type: string
    sql: ${TABLE}."METHOD" ;;
  }

  dimension: object {
    type: string
    sql: ${TABLE}."OBJECT" ;;
  }

  dimension: source_type {
    type: string
    sql: ${TABLE}."SOURCE_TYPE" ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}."STATUS" ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}."TYPE" ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [
      time,
      date,
      month,
      fiscal_quarter,
      fiscal_year
    ]
    sql: CAST(${TABLE}."UPDATED" AS TIMESTAMP_NTZ) ;;
    hidden: yes
  }

  measure: count_payouts {
    label: "# of Payouts"
    type: count_distinct
    sql: ${id} ;;
  }

  measure: total_amount {
    label: "Amount"
    type: sum
    sql: ${amount} ;;
  }

  measure: total_amount_reversed {
    label: "Amount Reversed"
    type: sum
    sql: ${amount_reversed} ;;
  }

}
