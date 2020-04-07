view: opportunity_ext {
  sql_table_name: "ORGM"."OPPORTUNITY_EXT";;

  dimension: opportunityid {
    type: string
    sql: ${TABLE}."OPPORTUNITYID" ;;
  }

  dimension: sum_expansion_amount {
    value_format_name: usd_0
    type: number
    sql: ${TABLE}."SUM_EXPANSION_AMOUNT" ;;
  }

  dimension: sum_multi_amount {
    value_format_name: usd_0
    type: number
    sql: ${TABLE}."SUM_MULTI_AMOUNT" ;;
  }

  dimension: sum_new_amount {
    value_format_name: usd_0
    type: number
    sql: ${TABLE}."SUM_NEW_AMOUNT" ;;
  }

  dimension: sum_renewal_amount {
    value_format_name: usd_0
    type: number
    sql: ${TABLE}."SUM_RENEWAL_AMOUNT" ;;
  }
}
