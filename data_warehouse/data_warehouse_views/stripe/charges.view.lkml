view: charges {
  sql_table_name: "STRIPE"."CHARGES"
    ;;
  drill_fields: [id]

  dimension: id {
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
  }

  dimension: captured {
    type: yesno
    sql: ${TABLE}."CAPTURED" ;;
  }
  
  dimension: is_fraud {
    type: yesno
    sql: ${fraud_details}!='{}';;
    label: "Fraud"
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

  dimension: customer {
    type: string
    sql: ${TABLE}."CUSTOMER" ;;
  }
  
  dimension: customer_email {
    type: string
    sql: ${customers.email} ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}."DESCRIPTION" ;;
  }

  dimension: failure_code {
    type: string
    sql: ${TABLE}."FAILURE_CODE" ;;
  }

  dimension: failure_message {
    type: string
    sql: ${TABLE}."FAILURE_MESSAGE" ;;
  }

  dimension: fraud_details {
    type: string
    sql: ${TABLE}."FRAUD_DETAILS" ;;
  }

  dimension: invoice {
    type: string
    sql: ${TABLE}."INVOICE" ;;
  }

  dimension: livemode {
    type: yesno
    sql: ${TABLE}."LIVEMODE" ;;
  }

  dimension: network_status {
    type: string
    sql: ${TABLE}."NETWORK_STATUS" ;;
  }

  dimension: paid {
    type: yesno
    sql: ${TABLE}."PAID" ;;
  }

  dimension: payment_intent {
    type: string
    sql: ${TABLE}."PAYMENT_INTENT" ;;
  }

  dimension: payment_method_card_brand {
    type: string
    sql: ${TABLE}."PAYMENT_METHOD_CARD_BRAND" ;;
  }

  dimension: payment_method_card_checks_address_line1 {
    type: string
    sql: ${TABLE}."PAYMENT_METHOD_CARD_CHECKS_ADDRESS_LINE1" ;;
  }

  dimension: payment_method_card_checks_cvc {
    type: string
    sql: ${TABLE}."PAYMENT_METHOD_CARD_CHECKS_CVC" ;;
  }

  dimension: payment_method_card_checks_postal_code {
    type: string
    sql: ${TABLE}."PAYMENT_METHOD_CARD_CHECKS_POSTAL_CODE" ;;
  }

  dimension: payment_method_card_country {
    type: string
    sql: ${TABLE}."PAYMENT_METHOD_CARD_COUNTRY" ;;
  }

  dimension: payment_method_card_exp_month {
    type: string
    sql: ${TABLE}."PAYMENT_METHOD_CARD_EXP_MONTH" ;;
  }

  dimension: payment_method_card_exp_year {
    type: string
    sql: ${TABLE}."PAYMENT_METHOD_CARD_EXP_YEAR" ;;
  }

  dimension: payment_method_card_fingerprint {
    type: string
    sql: ${TABLE}."PAYMENT_METHOD_CARD_FINGERPRINT" ;;
  }

  dimension: payment_method_card_funding {
    type: string
    sql: ${TABLE}."PAYMENT_METHOD_CARD_FUNDING" ;;
  }

  dimension: payment_method_card_last4 {
    type: string
    sql: ${TABLE}."PAYMENT_METHOD_CARD_LAST4" ;;
  }

  dimension: payment_method_card_three_d_secure {
    type: string
    sql: ${TABLE}."PAYMENT_METHOD_CARD_THREE_D_SECURE" ;;
  }

  dimension: payment_method_card_wallet {
    type: string
    sql: ${TABLE}."PAYMENT_METHOD_CARD_WALLET" ;;
  }

  dimension: payment_method_type {
    type: string
    sql: ${TABLE}."PAYMENT_METHOD_TYPE" ;;
  }

  dimension: reason {
    type: string
    sql: ${TABLE}."REASON" ;;
  }

  dimension: receipt_number {
    type: string
    sql: ${TABLE}."RECEIPT_NUMBER" ;;
  }

  dimension: refunded {
    type: yesno
    sql: ${TABLE}."REFUNDED" ;;
  }

  dimension: refunds {
    type: string
    sql: ${TABLE}."REFUNDS" ;;
  }

  dimension: risk_level {
    type: string
    sql: ${TABLE}."RISK_LEVEL" ;;
  }

  dimension: seller_message {
    type: string
    sql: ${TABLE}."SELLER_MESSAGE" ;;
  }

  dimension: source_address_city {
    type: string
    sql: ${TABLE}."SOURCE_ADDRESS_CITY" ;;
  }

  dimension: source_address_country {
    type: string
    sql: ${TABLE}."SOURCE_ADDRESS_COUNTRY" ;;
  }

  dimension: source_address_line1 {
    type: string
    sql: ${TABLE}."SOURCE_ADDRESS_LINE1" ;;
  }

  dimension: source_address_line1_check {
    type: string
    sql: ${TABLE}."SOURCE_ADDRESS_LINE1_CHECK" ;;
  }

  dimension: source_address_line2 {
    type: string
    sql: ${TABLE}."SOURCE_ADDRESS_LINE2" ;;
  }

  dimension: source_address_state {
    type: string
    sql: ${TABLE}."SOURCE_ADDRESS_STATE" ;;
  }

  dimension: source_address_zip {
    type: string
    sql: ${TABLE}."SOURCE_ADDRESS_ZIP" ;;
  }

  dimension: source_address_zip_check {
    type: string
    sql: ${TABLE}."SOURCE_ADDRESS_ZIP_CHECK" ;;
  }

  dimension: source_brand {
    type: string
    sql: ${TABLE}."SOURCE_BRAND" ;;
  }

  dimension: source_country {
    type: string
    sql: ${TABLE}."SOURCE_COUNTRY" ;;
  }

  dimension: source_customer {
    type: string
    sql: ${TABLE}."SOURCE_CUSTOMER" ;;
  }

  dimension: source_cvc_check {
    type: string
    sql: ${TABLE}."SOURCE_CVC_CHECK" ;;
  }

  dimension: source_dynamic_last4 {
    type: string
    sql: ${TABLE}."SOURCE_DYNAMIC_LAST4" ;;
  }

  dimension: source_exp_month {
    type: string
    sql: ${TABLE}."SOURCE_EXP_MONTH" ;;
  }

  dimension: source_exp_year {
    type: string
    sql: ${TABLE}."SOURCE_EXP_YEAR" ;;
  }

  dimension: source_fingerprint {
    type: string
    sql: ${TABLE}."SOURCE_FINGERPRINT" ;;
  }

  dimension: source_funding {
    type: string
    sql: ${TABLE}."SOURCE_FUNDING" ;;
  }

  dimension: source_id {
    type: string
    sql: ${TABLE}."SOURCE_ID" ;;
  }

  dimension: source_last4 {
    type: string
    sql: ${TABLE}."SOURCE_LAST4" ;;
  }

  dimension: source_name {
    type: string
    sql: ${TABLE}."SOURCE_NAME" ;;
  }

  dimension: source_object {
    type: string
    sql: ${TABLE}."SOURCE_OBJECT" ;;
  }

  dimension: source_tokenization_method {
    type: string
    sql: ${TABLE}."SOURCE_TOKENIZATION_METHOD" ;;
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

  measure: count_charges {
    type: count_distinct
    sql: ${id} ;;
    label: "# of Charges"
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
