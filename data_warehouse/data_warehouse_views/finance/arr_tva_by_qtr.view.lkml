view: arr_tva_by_qtr {
  sql_table_name: "FINANCE"."TVA_ARR_BY_QTR";;
  view_label: "ARR TvA by Quarter"

  dimension: qtr {
    label: "Fiscal Quarter"
    group_label: "Time Period"
    type: string
    sql: ${TABLE}."QTR" ;;
  }
  dimension: target {
    hidden: yes
    label: "Target"
    type: number
    sql: abs(${TABLE}."TARGET") ;;
  }

  dimension: actual {
    hidden: yes
    label: "Actual"
    type: number
    sql: abs(coalesce(${TABLE}."ACTUAL",0)) ;;
  }

  dimension: tva {
    hidden: yes
    type: number
    sql: ${TABLE}."TVA" ;;
  }

  measure: total_target {
    label: " Target"
    type: sum
    sql: ${target} ;;
    value_format_name: decimal_0
  }

  measure: total_actual {
    label: " Actual"
    type: sum
    sql: ${actual} ;;
    value_format_name: decimal_0
  }

  measure: total_left {
    label: " Target Left"
    type: number
    sql: greatest(${total_target}-${total_actual},0) ;;
    value_format_name: decimal_0
  }

  measure: total_tva {
    label: " TvA"
    type: number
    value_format: "@{percent}"
    sql: 100*${total_actual}/${total_target};;
  }
}
