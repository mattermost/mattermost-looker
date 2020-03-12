view: tva_all_by_mo {
  sql_table_name: "TVA"."TVA_ALL_BY_MO";;
  view_label: "TvA by Month"

  dimension: compound_primary {
    sql: ${target_slug}||${month} ;;
    primary_key: yes
    hidden: yes
  }

  dimension: month {
    group_label: "Time Period"
    type: date
    sql: ${TABLE}."MONTH" ;;
  }

  dimension: quarter {
    group_label: "Time Period"
    type: string
    sql: util.fiscal_quarter(${period_first_day});;
  }

  dimension: fy_quarter {
    group_label: "Time Period"
    type: string
    sql: util.fiscal_year(${period_first_day}) || '-' || util.fiscal_quarter(${period_first_day});;
  }

  dimension: fiscal_year {
    group_label: "Time Period"
    type: string
    sql: util.fiscal_year(${period_first_day});;
  }

  dimension: target_slug {
    hidden: yes
    type: string
    sql: ${TABLE}."TARGET_SLUG" ;;
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

  dimension: period_first_day {
    group_label: "Time Period"
    type: date
    sql: ${TABLE}."PERIOD_FIRST_DAY" ;;
  }

  dimension: period_last_day {
    group_label: "Time Period"
    type: date
    sql: ${TABLE}."PERIOD_LAST_DAY" ;;
  }

  dimension: current_quarter {
    group_label: "Time Period"
    label: " Is Current Quarter?"
    type: yesno
    sql: util.fiscal_quarter(${period_first_day}) = util.fiscal_quarter(current_date());;
  }

  dimension: current_fiscal_year {
    group_label: "Time Period"
    label: " Is Current Fiscal Year?"
    type: yesno
    sql: util.fiscal_year(${period_first_day}) = util.fiscal_year(current_date());;
  }

  dimension: current_month {
    group_label: "Time Period"
    label: " Is Current Month?"
    type: yesno
    sql: ${period_last_day}::date >= current_date AND ${period_first_day}::date <= current_date;;
  }

  measure: total_month_target {
    label: "Current Month Target"
    group_label: "Current Month"
    group_item_label: "Target"
    type: sum
    sql: ${target} ;;
    filters: {
      field: current_month
      value: "yes"
    }
  }

  measure: total_month_actual {
    label: "Current Month Actual"
    group_label: "Current Month"
    group_item_label: "Actual"
    type: sum
    sql: ${actual} ;;
    filters: {
      field: current_month
      value: "yes"
    }
    value_format_name: decimal_0
  }

  measure: total_month_left {
    label: "Current Month Target Left"
    group_label: "Current Month"
    group_item_label: "Target Left"
    type: number
    sql: greatest(${total_month_target}-${total_month_actual},0) ;;
    value_format_name: decimal_0
  }

  measure: td_curr_mo {
    label: "Month TD"
    group_label: "To Date"
    group_item_label: "Month %"
    type: number
    value_format: "@{percent}"
    sql: 100*${total_actual_curr_fy}/${total_target_curr_fy};;
  }

  measure: not_current_target {
    group_item_label: "Target"
    group_label: "Not Current Month"
    label: "Target (Not Current Month)"
    type: sum
    sql: ${target} ;;
    filters: {
      field: current_month
      value: "no"
    }
    value_format_name: decimal_0
  }

  measure: not_current_actual {
    group_item_label: "Actual"
    group_label: "Not Current Month"
    label: "Actual (Not Current Month)"
    type: sum
    sql: ${actual} ;;
    filters: {
      field: current_month
      value: "no"
    }
    value_format_name: decimal_0
  }

  measure: not_current_left {
    group_item_label: "Target Left"
    group_label: "Not Current Month"
    label: "Target Left (Not Current Month)"
    type: number
    sql: greatest(${not_current_target}-${not_current_actual},0) ;;
    value_format_name: decimal_0
  }

  measure: total_actual_curr_qtr {
    label: "Actual Current Quarter (TD)"
    group_label: "To Date"
    group_item_label: "Actual (Quarter)"
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
    group_label: "To Date"
    group_item_label: "Target (Quarter)"
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
    group_label: "To Date"
    group_item_label: "Target Left (Quarter)"
    type: number
    sql: greatest(${total_target_curr_qtr}-${total_actual_curr_qtr},0) ;;
    value_format_name: decimal_0
  }

  measure: td_curr_qtr {
    label: "Quarter TD"
    group_label: "To Date"
    group_item_label: "Quarter %"
    type: number
    value_format: "@{percent}"
    sql: 100*${total_actual_curr_qtr}/${total_target_curr_qtr};;
  }

  measure: total_actual_curr_fy {
    label: "Actual Current FY (TD)"
    group_label: "To Date"
    group_item_label: "Actual (Fiscal Year)"
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
    group_label: "To Date"
    group_item_label: "Target (Fiscal Year)"
    type: sum
    sql: ${target} ;;
    filters: {
      field: current_fiscal_year
      value: "yes"
    }
  }

  measure: total_left_curr_fy {
    label: "Target Left Current Quarter (TD)"
    group_label: "To Date"
    group_item_label: "Target Left (Fiscal Year)"
    type: number
    sql: greatest(${total_target_curr_fy}-${total_actual_curr_fy},0) ;;
    value_format_name: decimal_0
  }

  measure: td_curr_fy {
    label: "Fiscal Year TD"
    group_label: "To Date"
    group_item_label: "Fiscal Year %"
    type: number
    value_format: "@{percent}"
    sql: 100*${total_actual_curr_fy}/${total_target_curr_fy};;
  }

  measure: total_actual {
    label: " Actual"
    type: sum
    sql: ${actual} ;;
    value_format_name: decimal_0
  }

  measure: total_target {
    label: " Target"
    type: sum
    sql: ${target} ;;
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
