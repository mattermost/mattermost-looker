view: arr_customertype {
  derived_table: {
    sql: select
      *
      from analytics.finance.arr_customertype
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: account_id {
    type: string
    sql: ${TABLE}."ACCOUNT_ID" ;;
  }

  dimension: account_name {
    type: string
    sql: ${TABLE}."ACCOUNT_NAME" ;;
  }

  dimension: customer_type {
    type: string
    sql: ${TABLE}."CUSTOMER_TYPE" ;;
  }

  set: detail {
    fields: [account_id, account_name, customer_type]
  }
}
