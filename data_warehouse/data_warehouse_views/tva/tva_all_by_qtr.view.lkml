view: tva_all_by_qtr {
  sql_table_name: "TVA"."TVA_ALL_BY_QTR";;

  dimension: compound_primary {
    sql: ${target_slug}||${qtr} ;;
    primary_key: yes
    hidden: yes
  }

  dimension: qtr {
    type: string
    sql: ${TABLE}."QTR" ;;
  }

  dimension: target_slug {
    hidden: yes
    type: string
    sql: ${TABLE}."TARGET_SLUG" ;;
  }

  dimension: target {
    label: "Target"
    type: number
    sql: abs(${TABLE}."TARGET") ;;
  }

  dimension: actual {
    label: "Actual"
    type: number
    sql: abs(coalesce(${TABLE}."ACTUAL",0)) ;;
  }

  dimension: tva {
    hidden: yes
    type: number
    sql: ${TABLE}."TVA" ;;
  }

  dimension: period_first_day {
    type: date
    sql: ${TABLE}."PERIOD_FIRST_DAY" ;;
  }

  dimension: period_last_day {
    type: date
    sql: ${TABLE}."PERIOD_LAST_DAY" ;;
  }

  dimension: current_period {
    label: "Is Current Period?"
    type: yesno
    sql: ${period_last_day}::date >= current_date AND ${period_first_day}::date <= current_date;;
  }

  measure: current_target {
    label: "Current Qtr Target"
    type: sum
    sql: ${target} ;;
    filters: {
      field: current_period
      value: "yes"
    }
    value_format_name: decimal_0
  }

  measure: current_actual {
    label: "Current Qtr Actual"
    type: sum
    sql: ${actual} ;;
    filters: {
      field: current_period
      value: "yes"
    }
    value_format_name: decimal_0
  }

  measure: current_left {
    label: "Current Qtr Target Left"
    type: number
    sql: greatest(${current_target}-${current_actual},0) ;;
    value_format_name: decimal_0
  }

  measure: not_current_target {
    label: "Target"
    type: sum
    sql: ${target} ;;
    filters: {
      field: current_period
      value: "no"
    }
    value_format_name: decimal_0
  }

  measure: not_current_actual {
    label: "Actual"
    type: sum
    sql: ${actual} ;;
    filters: {
      field: current_period
      value: "no"
    }
    value_format_name: decimal_0
  }

  measure: not_current_left {
    label: "Target Left"
    type: number
    sql: greatest(${not_current_target}-${not_current_actual},0) ;;
    value_format_name: decimal_0
  }

  measure: total_target {
    label: "Total Target"
    type: sum
    sql: ${target} ;;
    value_format_name: decimal_0
  }

  measure: total_actual {
    label: "Total Actual"
    type: sum
    sql: ${actual} ;;
    value_format_name: decimal_0
  }

  measure: total_left {
    label: "Total Target Left"
    type: number
    sql: greatest(${total_target}-${total_actual},0) ;;
    value_format_name: decimal_0
  }

  measure: total_tva {
    label: "TvA"
    type: number
    value_format: "@{percent}"
    sql: 100*${total_actual}/${total_target};;
  }
}
