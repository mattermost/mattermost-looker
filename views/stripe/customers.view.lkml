view: customers {
  sql_table_name: "STRIPE"."CUSTOMERS"
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}."ID" ;;
  }

  dimension: account_balance {
    type: number
    sql: ${TABLE}."ACCOUNT_BALANCE" ;;
  }

  dimension: cards {
    type: string
    sql: ${TABLE}."CARDS" ;;
  }

  dimension: contactfirstname {
    type: string
    sql: ${TABLE}."CONTACTFIRSTNAME" ;;
  }

  dimension: contactlastname {
    type: string
    sql: ${TABLE}."CONTACTLASTNAME" ;;
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

  dimension: cws_blapi_customer {
    type: string
    sql: ${TABLE}."CWS_BLAPI_CUSTOMER" ;;
  }

  dimension: cws_customer {
    type: string
    sql: ${TABLE}."CWS_CUSTOMER" ;;
  }

  dimension: default_source {
    type: string
    sql: ${TABLE}."DEFAULT_SOURCE" ;;
  }

  dimension: delinquent {
    type: yesno
    sql: ${TABLE}."DELINQUENT" ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}."EMAIL" ;;
  }

  dimension: invoice_prefix {
    type: string
    sql: ${TABLE}."INVOICE_PREFIX" ;;
  }

  dimension: livemode {
    type: yesno
    sql: ${TABLE}."LIVEMODE" ;;
  }

  dimension: sources {
    type: string
    sql: ${TABLE}."SOURCES" ;;
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

  dimension: cws_first_purchase_intent_wire_transfer {
    label: "First Purchase"
    group_label: "Wire Transfer Intent"
    type: string
    sql: CASE WHEN parse_json(${TABLE}."CWS_FIRST_PURCHASE_INTENT_WIRE_TRANSFER"):"wire" = True THEN 'Wire'
      WHEN parse_json(${TABLE}."CWS_FIRST_PURCHASE_INTENT_WIRE_TRANSFER"):"ach" = True THEN 'ACH'
      WHEN parse_json(${TABLE}."CWS_FIRST_PURCHASE_INTENT_WIRE_TRANSFER"):"other" = True THEN 'Other' ELSE null END;;
  }

  dimension: cws_renewal_self_intent_wire_transfer {
    label: "Renewal"
    group_label: "Wire Transfer Intent"
    type: string
    sql: CASE WHEN parse_json(${TABLE}."CWS_RENEWAL_SELF_INTENT_WIRE_TRANSFER"):"wire" = True THEN 'Wire'
      WHEN parse_json(${TABLE}."CWS_RENEWAL_SELF_INTENT_WIRE_TRANSFER"):"ach" = True THEN 'ACH'
      WHEN parse_json(${TABLE}."CWS_RENEWAL_SELF_INTENT_WIRE_TRANSFER"):"other" = True THEN 'Other' ELSE null END;;
  }

  dimension: cws_monthly_sub_intent_wire_transfer {
    label: "Monthly Subscription"
    group_label: "Wire Transfer Intent"
    type: string
    sql: CASE WHEN parse_json(${TABLE}."CWS_MONTHLY_SUB_INTENT_WIRE_TRANSFER"):"wire" = True THEN 'Wire'
      WHEN parse_json(${TABLE}."CWS_MONTHLY_SUB_INTENT_WIRE_TRANSFER"):"ach" = True THEN 'ACH'
      WHEN parse_json(${TABLE}."CWS_MONTHLY_SUB_INTENT_WIRE_TRANSFER"):"other" = True THEN 'Other' ELSE null END;;
  }


  measure: count_customers {
    label: "# of Customers"
    type: count_distinct
    sql: ${id} ;;
    drill_fields: [id]
  }
}
