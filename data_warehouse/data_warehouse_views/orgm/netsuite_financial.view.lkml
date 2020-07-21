view: netsuite_financial {
  sql_table_name: "ORGM"."NETSUITE_CONN__NETSUITE_FINANCIAL__C"
    ;;

  dimension: createdbyid {
    hidden: yes
    type: string
    sql: ${TABLE}."CREATEDBYID" ;;
  }

  dimension_group: createddate {
    type: time
    timeframes: [
      raw,
      date,
      month,
      fiscal_quarter,
      fiscal_year
    ]
    sql: CAST(${TABLE}."CREATEDDATE" AS TIMESTAMP_NTZ) ;;
  }

  dimension: isdeleted {
    type: yesno
    sql: ${TABLE}."ISDELETED" ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}."NAME" ;;
  }

  dimension: accountid {
    hidden: yes
    type: string
    sql: ${TABLE}."NETSUITE_CONN__ACCOUNT__C" ;;
  }

  dimension: currency {
    type: string
    sql: ${TABLE}."NETSUITE_CONN__CURRENCY__C" ;;
  }

  dimension: days_overdue {
    type: number
    sql: ${TABLE}."NETSUITE_CONN__DAYS_OVERDUE__C" ;;
  }

  dimension: discount_total {
    type: number
    sql: ${TABLE}."NETSUITE_CONN__DISCOUNT_TOTAL__C" ;;
  }

  dimension: document_id {
    type: string
    sql: ${TABLE}."NETSUITE_CONN__DOCUMENT_ID__C" ;;
  }

  dimension_group: due_date {
    type: time
    timeframes: [
      raw,
      date,
      month,
      fiscal_quarter,
      fiscal_year
    ]
    sql: CAST(${TABLE}."NETSUITE_CONN__DUE_DATE__C" AS TIMESTAMP_NTZ) ;;
  }

  dimension: memo {
    type: string
    sql: ${TABLE}."NETSUITE_CONN__MEMO__C" ;;
  }

  dimension: netsuite_id {
    type: string
    sql: ${TABLE}."NETSUITE_CONN__NETSUITE_ID__C" ;;
  }

  dimension: opportunityid {
    hidden: yes
    type: string
    sql: ${TABLE}."NETSUITE_CONN__OPPORTUNITY__C" ;;
  }

  dimension: pdf_file {
    type: string
    sql: ${TABLE}."NETSUITE_CONN__PDF_FILE__C" ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}."NETSUITE_CONN__STATUS__C" ;;
  }

  dimension: subtotal {
    type: number
    sql: ${TABLE}."NETSUITE_CONN__SUBTOTAL__C" ;;
  }

  dimension: total {
    type: number
    sql: ${TABLE}."NETSUITE_CONN__TOTAL__C" ;;
  }

  dimension_group: transaction_date {
    type: time
    timeframes: [
      raw,
      date,
      month,
      fiscal_quarter,
      fiscal_year
    ]
    sql: CAST(${TABLE}."NETSUITE_CONN__TRANSACTION_DATE__C" AS TIMESTAMP_NTZ) ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}."NETSUITE_CONN__TYPE__C" ;;
  }

  dimension: opportunity_stage {
    type: string
    sql: ${TABLE}."OPPORTUNITY_STAGE__C" ;;
  }

  dimension: ownerid {
    hidden: yes
    type: string
    sql: ${TABLE}."OWNERID" ;;
  }

  dimension: sfid {
    primary_key: yes
    type: string
    sql: ${TABLE}."SFID" ;;
  }

  dimension_group: systemmodstamp {
    hidden: yes
    type: time
    timeframes: [
      raw,
      date,
      month,
      fiscal_quarter,
      fiscal_year
    ]
    sql: CAST(${TABLE}."SYSTEMMODSTAMP" AS TIMESTAMP_NTZ) ;;
  }

  measure: count {
    type: count
    drill_fields: [name]
  }
}
