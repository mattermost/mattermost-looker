view: tva_all_by_mo {
  sql_table_name: "TVA"."TVA_ALL_BY_MO";;

  dimension: compound_primary {
    sql: ${target_slug}||${month} ;;
    primary_key: yes
    hidden: yes
  }

  dimension: month {
    type: date
    sql: ${TABLE}."MONTH" ;;
  }

  dimension: period_last_day {
    type: date
    sql: ${TABLE}."PERIOD_LAST_DAY" ;;
  }

  dimension: category {
    type: string
    sql: ${TABLE}."CATEGORY" ;;
  }

  dimension: target_slug {
    hidden: yes
    type: string
    sql: ${TABLE}."TARGET_SLUG" ;;
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
