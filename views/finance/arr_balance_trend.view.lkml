view: arr_balance_trend {
  sql_table_name: "FINANCE"."ARR_BALANCE_TREND" ;;


  dimension: cohort_year {
    description: "Fiscal year cohort of when customer started as paying customer"
    type: date
    sql: ${TABLE}."FISCAL_YEAR" ;;
  }

  dimension: report_month {
    description: "Customer activity period for new renewal expansion contraction and churn"
    type: date

    sql: ${TABLE}."REPORT_MONTH" ;;
  }

  measure: tcv_signed {
    description: "Total Contract Value signed over contract period"
    type: sum
    value_format: "$#,##0"
    sql: ${TABLE}."TCV_SIGNED" ;;
  }

  dimension: trans_mo {
    description: "Transaction months after customer joins"
    type: number
    sql: datediff('month',${cohort_year},${report_month})+12 ;;

  }

  measure: arr_signed {
    description: "ARR value of TCV"
    type: sum
    value_format: "$#,##0"
    sql: ${TABLE}."ARR_SIGNED" ;;
  }

  measure: arr_expired {
    type: sum
    value_format: "$#,##0"
    sql: ${TABLE}."ARR_EXPIRED" ;;
  }

  measure: arr_change {
    type: sum
    value_format: "$#,##0"
    sql: ${TABLE}."ARR_CHANGE" ;;
  }

  measure: new {
    type: sum
    value_format: "$#,##0"
    sql: ${TABLE}."NEW" ;;
  }

  measure: resurrected {
    type: sum
    value_format: "$#,##0"
    sql: ${TABLE}."RESURRECTED" ;;
  }

  measure: expanded {
    type: sum
    value_format: "$#,##0"
    sql: ${TABLE}."EXPANDED" ;;
  }

  measure: contracted {
    type: sum
    value_format: "$#,##0"
    sql: ${TABLE}."CONTRACTED" ;;
  }

  measure: churned {
    type: sum
    value_format: "$#,##0"
    sql: ${TABLE}."CHURNED" ;;
  }

  measure: active_arr {
    type: sum
    value_format: "$#,##0"
    sql: ${TABLE}."ACTIVE_ARR" ;;
  }

  measure: avg_arr {
    type: number
    value_format: "$#,##0"
    sql:div0(sum(${TABLE}."ACTIVE_ARR"),sum(${TABLE}."ACTIVE_CNT")) ;;
  }

  measure: new_cnt {
    type: sum
    sql: ${TABLE}."NEW_CNT" ;;
  }

  measure: resurrect_cnt {
    type: sum
    sql: ${TABLE}."RESURRECT_CNT" ;;
  }

  measure: churn_cnt {
    type: sum
    sql: ${TABLE}."CHURN_CNT" ;;
  }

  measure: change_cnt {
    type: sum
    sql: ${TABLE}."CHANGE_CNT" ;;
  }

  measure: active_cnt {
    type: sum
    sql: ${TABLE}."ACTIVE_CNT" ;;
  }


  measure: expansion_cnt {
    type: sum
    sql: ${TABLE}."EXPANSION_CNT" ;;
  }

  measure: contraction_cnt {
    type: sum
    sql: ${TABLE}."CONTRACTION_CNT" ;;
  }
}
