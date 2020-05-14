view: tva_all_by_qtr {
  sql_table_name: "TVA"."TVA_ALL_BY_QTR";;
  view_label: "TvA by Quarter"

  dimension: compound_primary {
    sql: ${target_slug}||${qtr} ;;
    primary_key: yes
    hidden: yes
  }

  dimension: drill_dimension {
    label: "Additional Granularity"
    group_label: "Target Info"
    type: string
    sql: CASE
          WHEN ${user.name} IS NOT NULL THEN ${user.name}
          WHEN REPLACE(${target_slug},'attain_new_and_exp_by_segment_by_qtr_') = 'AMER_APAC' THEN 'AMER/APAC'
          WHEN REPLACE(${target_slug},'bookings_ren_by_segment_by_qtr_') = 'AMER_APAC' THEN 'AMER/APAC'
          WHEN ${target_slug} like 'attain_new_and_exp_by_segment_by_qtr_%' THEN REPLACE(${target_slug},'attain_new_and_exp_by_segment_by_qtr_')
          WHEN ${target_slug} like 'bookings_ren_by_segment_by_qtr_%' THEN REPLACE(${target_slug},'bookings_ren_by_segment_by_qtr_')
          ELSE NULL END;;
  }

  dimension: qtr {
    label: "Fiscal Quarter"
    group_label: "Time Period"
    type: string
    sql: ${TABLE}."QTR" ;;
  }

  dimension: quarter {
    group_label: "Time Period"
    type: string
    sql: util.fiscal_quarter(${period_first_day});;
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

  dimension: qtd {
    hidden: yes
    type: yesno
    sql: ${period_first_day} < current_date ;;
  }

  dimension: ytd {
    hidden: yes
    type: yesno
    sql: util.fiscal_quarter_end(util.fiscal_year(${period_first_day})||'-'||util.fiscal_quarter(${period_first_day})) < current_date ;;
  }

  measure: current_target {
    group_label: "Current Quarter"
    group_item_label: "Target"
    label: "Target (Current Quarter)"
    type: sum
    sql: ${target} ;;
    filters: {
      field: current_quarter
      value: "yes"
    }
    value_format_name: decimal_0
  }

  measure: current_actual {
    group_label: "Current Quarter"
    group_item_label: "Actual"
    label: "Actual (Current Quarter)"
    type: sum
    sql: ${actual} ;;
    filters: {
      field: current_quarter
      value: "yes"
    }
    value_format_name: decimal_0
  }

  measure: current_left {
    group_label: "Current Quarter"
    group_item_label: "Target Left"
    label: "Target Left (Current Quarter)"
    type: number
    sql: greatest(${current_target}-${current_actual},0) ;;
    value_format_name: decimal_0
  }

  measure: not_current_target {
    hidden: yes
    group_label: "Not Current Quarter"
    group_item_label: "Target"
    label: "Target (Not Current Quarter)"
    type: sum
    sql: ${target} ;;
    filters: {
      field: current_quarter
      value: "no"
    }
    value_format_name: decimal_0
  }

  measure: not_current_actual {
    hidden: yes
    group_label: "Not Current Quarter"
    group_item_label: "Actual"
    label: "Actual (Not Current Quarter)"
    type: sum
    sql: ${actual} ;;
    filters: {
      field: current_quarter
      value: "no"
    }
    value_format_name: decimal_0
  }

  measure: not_current_left {
    hidden: yes
    group_label: "Not Current Quarter"
    group_item_label: "Target Left"
    label: "Target Left (Not Current Quarter)"
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
    filters: {
      field: qtd
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
    filters: {
      field: qtd
      value: "yes"
    }
  }

  measure: total_left_curr_qtr {
    label: "Target Left Current Quarter (TD)"
    group_label: "To Date"
    group_item_label: "Target Left (Quarter)"
    type: number
    sql: greatest(${total_target_curr_qtr}-${total_actual_curr_qtr},0) ;;
    value_format_name: decimal_0
  }

  measure: td_curr_qtr {
    label: "Quarter TD"
    group_label: "To Date"
    group_item_label: "TD % (QTD)"
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
    filters: {
      field: ytd
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
    filters: {
      field: ytd
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
    label: "Year TD"
    group_label: "To Date"
    group_item_label: "TD % (YTD)"
    type: number
    value_format: "@{percent}"
    sql: 100*${total_actual_curr_fy}/${total_target_curr_fy};;
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
    html: @{cond_style_attain} ;;
  }
}
