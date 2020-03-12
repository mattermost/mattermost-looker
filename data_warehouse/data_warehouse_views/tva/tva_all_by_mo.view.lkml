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

  dimension: quarter {
    type: string
    sql: util.fiscal_year(${period_first_day})|| '-' || util.fiscal_quarter(${period_first_day});;
  }

  dimension: fiscal_year {
    type: string
    sql: util.fiscal_year(${period_first_day});;
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

  dimension: current_quarter {
    label: "Is Current Quarter?"
    type: yesno
    sql: util.fiscal_quarter(${period_first_day}) = util.fiscal_quarter(current_date());;
  }

  dimension: current_fiscal_year {
    label: "Is Current Fiscal Year?"
    type: yesno
    sql: util.fiscal_year(${period_first_day}) = util.fiscal_year(current_date());;
  }

  dimension: current_period {
    label: "Is Current Period?"
    type: yesno
    sql: ${period_last_day}::date >= current_date AND ${period_first_day}::date <= current_date;;
  }

  measure: total_month_target {
    label: "Current Month Target"
    type: sum
    sql: ${target} ;;
    filters: {
      field: current_period
      value: "yes"
    }
  }

  measure: total_month_actual {
    label: "Current Month Actual"
    type: sum
    sql: ${actual} ;;
    filters: {
      field: current_period
      value: "yes"
    }
    value_format_name: decimal_0
  }

  measure: total_month_left {
    label: "Current Month Target Left"
    type: number
    sql: greatest(${total_month_target}-${total_month_actual},0) ;;
    value_format_name: decimal_0
  }

  measure: td_curr_mo {
    label: "Month TD"
    type: number
    value_format: "@{percent}"
    sql: 100*${total_actual_curr_fy}/${total_target_curr_fy};;
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

  measure: total_actual {
    label: "Total Actual"
    type: sum
    sql: ${actual} ;;
    value_format_name: decimal_0
  }

  measure: total_target {
    label: "Total Target"
    type: sum
    sql: ${target} ;;
  }

  measure: total_left {
    label: "Total Target Left"
    type: number
    sql: greatest(${total_target}-${total_actual},0) ;;
    value_format_name: decimal_0
  }

  measure: total_actual_curr_qtr {
    label: "Actual Current Quarter (TD)"
    type: sum
    sql: ${actual} ;;
    value_format_name: decimal_0
    filters: {
      field: current_quarter
      value: "yes"
    }
  }

  measure: total_target_curr_qtr {
    label: "Target Current Quarter (TD)"
    type: sum
    sql: ${target} ;;
    value_format_name: decimal_0
    filters: {
      field: current_quarter
      value: "yes"
    }
  }

  measure: total_left_curr_qtr {
    label: "Target Left Current FY (TD)"
    type: number
    sql: greatest(${total_target_curr_qtr}-${total_actual_curr_qtr},0) ;;
    value_format_name: decimal_0
  }

  measure: td_curr_qtr {
    label: "Quarter TD"
    type: number
    value_format: "@{percent}"
    sql: 100*${total_actual_curr_qtr}/${total_target_curr_qtr};;
  }

  measure: total_actual_curr_fy {
    label: "Actual Current FY (TD)"
    type: sum
    sql: ${actual} ;;
    value_format_name: decimal_0
    filters: {
      field: current_fiscal_year
      value: "yes"
    }
  }

  measure: total_target_curr_fy {
    label: "Target Current FY (TD)"
    type: sum
    sql: ${target} ;;
    filters: {
      field: current_fiscal_year
      value: "yes"
    }
  }

  measure: total_left_curr_fy {
    label: "Target Left Current Quarter (TD)"
    type: number
    sql: greatest(${total_target_curr_fy}-${total_actual_curr_fy},0) ;;
    value_format_name: decimal_0
  }

  measure: td_curr_fy {
    label: "Fiscal Year TD"
    type: number
    value_format: "@{percent}"
    sql: 100*${total_actual_curr_fy}/${total_target_curr_fy};;
  }

  measure: total_tva {
    label: "TvA"
    type: number
    value_format: "@{percent}"
    sql: 100*${total_actual}/${total_target};;
  }
}
