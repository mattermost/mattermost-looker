view: tva_all_by_qtr {
  sql_table_name: "TVA"."TVA_ALL_BY_QTR";;

  dimension: compound_primary {
    sql: ${name}||${qtr} ;;
    primary_key: yes
    hidden: yes
  }

  dimension: qtr {
    type: string
    sql: ${TABLE}."QTR" ;;
  }

  dimension: category {
    type: string
    sql: ${TABLE}."CATEGORY" ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}."NAME" ;;
  }

  dimension: target {
    label: "Target"
    type: number
    sql: ${TABLE}."TARGET" ;;
  }

  dimension: actual {
    label: "Actual"
    type: number
    sql: ${TABLE}."ACTUAL" ;;
  }

  dimension: tva {
    hidden: yes
    type: number
    sql: ${TABLE}."TVA" ;;
  }

  measure: total_target {
    label: "Total Target"
    type: sum
    sql: ${target} ;;
  }

  measure: total_actual {
    label: "Total Actual"
    type: sum
    sql: ${actual} ;;
  }

  measure: total_tva {
    label: "TvA"
    type: number
    value_format: "@{percent}"
    sql: CASE WHEN ${total_target} < 0 then 100-100*${total_actual}/${total_target} ELSE 100*${total_actual}/${total_target} END;;
  }
}
