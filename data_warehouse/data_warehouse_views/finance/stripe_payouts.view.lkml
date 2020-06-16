view: stripe_payouts {
  sql_table_name: "STRIPE"."PAYOUTS"
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

  dimension: amount_reversed {
    type: number
    sql: ${TABLE}."AMOUNT_REVERSED" ;;
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
  }

  dimension: automatic {
    type: yesno
    sql: ${TABLE}."AUTOMATIC" ;;
  }

  dimension: balance_transaction {
    type: string
    sql: ${TABLE}."BALANCE_TRANSACTION" ;;
  }

  dimension: bank_account {
    type: string
    sql: ${TABLE}."BANK_ACCOUNT" ;;
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
  }

  dimension: currency {
    type: string
    sql: ${TABLE}."CURRENCY" ;;
  }

  dimension_group: date {
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
  }

  dimension: destination {
    type: string
    sql: ${TABLE}."DESTINATION" ;;
  }

  dimension: livemode {
    type: yesno
    sql: ${TABLE}."LIVEMODE" ;;
  }

  dimension: metadata {
    type: string
    sql: ${TABLE}."METADATA" ;;
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
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
