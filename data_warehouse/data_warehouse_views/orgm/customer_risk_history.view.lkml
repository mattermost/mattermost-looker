view: customer_risk_history {
  sql_table_name: "ORGM"."CUSTOMER_RISK__HISTORY"
    ;;

  dimension: createdbyid {
    type: string
    sql: ${TABLE}."CREATEDBYID" ;;
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
    sql: CAST(${TABLE}."CREATEDDATE" AS TIMESTAMP_NTZ) ;;
  }

  dimension: field {
    type: string
    sql: ${TABLE}."FIELD" ;;
  }

  dimension: isdeleted {
    type: yesno
    sql: ${TABLE}."ISDELETED" ;;
  }

  dimension: sfid {
    primary_key: yes
    type: string
    sql: ${TABLE}."SFID" ;;
  }

  dimension: new_value {
    type: string
    sql: ${TABLE}."NEWVALUE" ;;
  }

  dimension: old_value {
    type: string
    sql: ${TABLE}."OLDVALUE" ;;
  }

  dimension: customer_risk_id {
    type: string
    sql: ${TABLE}."PARENTID" ;;
  }
}
