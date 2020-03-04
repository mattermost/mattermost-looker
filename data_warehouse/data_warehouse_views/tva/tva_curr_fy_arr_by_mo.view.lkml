view: tva_curr_fy_arr_by_mo {
  sql_table_name: "TVA"."TVA_CURR_FY_ARR_BY_MO"
    ;;

  dimension: month {
    type: date
    sql: ${TABLE}."MONTH" ;;
  }

  dimension: target {
    label: "Target ARR"
    type: number
    sql: ${TABLE}."TARGET" ;;
  }

  dimension: total_arr {
    label: "Actual ARR"
    type: number
    sql: ${TABLE}."TOTAL_ARR" ;;
  }

  dimension: tva {
    hidden: yes
    label: "Actual ARR"
    type: number
    sql: ${TABLE}."TVA" ;;
  }

  measure: total_tva {
    label: "Target vs Actual"
    type: sum
    value_format: "@{percent}"
    sql: 100*${tva} ;;
  }

}
