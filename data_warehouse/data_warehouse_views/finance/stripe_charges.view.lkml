view: stripe_charges {
  sql_table_name: "STRIPE"."CHARGES"
    ;;
  drill_fields: [id]

  dimension: id {
    label: "Charge ID"
    primary_key: yes
    type: string
    sql: ${TABLE}."ID" ;;
  }

  dimension: amount {
    type: number
    sql: ${TABLE}."AMOUNT"/100 ;;
    hidden: yes
  }

  dimension: amount_refunded {
    type: number
    sql: ${TABLE}."AMOUNT_REFUNDED"/100 ;;
    hidden: yes
  }

  dimension: balance_transaction {
    type: string
    sql: ${TABLE}."BALANCE_TRANSACTION" ;;
    hidden: yes
  }

  dimension: captured {
    type: yesno
    sql: ${TABLE}."CAPTURED" ;;
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
  }

  dimension: customer {
    type: string
    sql: ${TABLE}."CUSTOMER" ;;
    hidden: yes
  }

  dimension: failure_code {
    type: string
    sql: ${TABLE}."FAILURE_CODE" ;;
    hidden: yes
  }

  dimension: failure_message {
    type: string
    sql: ${TABLE}."FAILURE_MESSAGE" ;;
  }

  dimension: fraud_details {
    type: string
    sql: ${TABLE}."FRAUD_DETAILS" ;;
    hidden: yes
  }

  dimension: is_fraud {
    type: yesno
    sql: ${fraud_details}!='{}';;
    label: "Fraud"
  }

  dimension: outcome {
    type: string
    sql: ${TABLE}."OUTCOME" ;;
    hidden: yes
  }

  dimension: paid {
    type: yesno
    sql: ${TABLE}."PAID" ;;
  }

  dimension: payment_intent {
    type: string
    sql: ${TABLE}."PAYMENT_INTENT" ;;
    hidden: yes
  }

  dimension: payment_method_details {
    type: string
    sql: ${TABLE}."PAYMENT_METHOD_DETAILS" ;;
    hidden: yes
  }

  dimension: refunded {
    type: yesno
    sql: ${TABLE}."REFUNDED" ;;
  }

  dimension: refunds {
    type: string
    sql: ${TABLE}."REFUNDS" ;;
    hidden: yes
  }

  dimension: source {
    type: string
    sql: ${TABLE}."SOURCE" ;;
    hidden: yes
  }

  dimension: status {
    type: string
    sql: ${TABLE}."STATUS" ;;
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

  measure: count_charges {
    type: count_distinct
    sql: ${id} ;;
    label: "# of Charges"
    drill_fields: [id]
  }

  measure: total_amount {
    label: "Charge Amount"
    type: sum
    sql: ${amount} ;;
    value_format_name: usd_0
  }

  measure: total_amount_refunded {
    label: "Refunded Amount"
    type: sum
    sql: ${amount_refunded} ;;
    value_format_name: usd_0
  }
}
