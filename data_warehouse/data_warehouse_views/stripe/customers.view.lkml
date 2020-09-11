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

  measure: count_customers {
    label: "# of Customers"
    type: count_distinct
    sql: ${id} ;;
    drill_fields: [id]
  }
}
