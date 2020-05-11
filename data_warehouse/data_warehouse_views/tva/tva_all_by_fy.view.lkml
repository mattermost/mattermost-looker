view: tva_all_by_fy {
  sql_table_name: "TVA"."TVA_ALL_BY_FY";;
  view_label: "TvA by FY"

  dimension: compound_primary {
    sql: ${target_slug}||${fiscal_year} ;;
    primary_key: yes
    hidden: yes
  }

  dimension: drill_dimension {
    label: "Additional Granularity"
    group_label: "Target Info"
    type: string
    sql: CASE
          WHEN ${user.name} IS NOT NULL THEN ${user.name}
          WHEN REPLACE(${target_slug},'bookings_new_and_exp_by_segment_by_fy_') = 'AMER_APAC' THEN 'AMER/APAC'
          WHEN ${target_slug} like 'bookings_new_and_exp_by_segment_by_fy_%' THEN REPLACE(${target_slug},'bookings_new_and_exp_by_segment_by_fy_')
          ELSE NULL END;;
  }

  dimension: fiscal_year {
    group_label: "Time Period"
    type: string
    sql: ${TABLE}."FY" ;;
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

  dimension: current_fiscal_year {
    group_label: "Time Period"
    label: " Is Current Fiscal Year?"
    type: yesno
    sql: util.fiscal_year(${period_first_day}) = util.fiscal_year(current_date());;
  }

  measure: current_target {
    label: "Current FY Target"
    type: sum
    sql: ${target} ;;
    filters: {
      field: current_fiscal_year
      value: "yes"
    }
    value_format_name: decimal_0
  }

  measure: current_actual {
    label: "Current FY Actual"
    type: sum
    sql: ${actual} ;;
    filters: {
      field: current_fiscal_year
      value: "yes"
    }
    value_format_name: decimal_0
  }

  measure: current_left {
    label: "Current FY Target Left"
    type: number
    sql: greatest(${current_target}-${current_actual},0) ;;
    value_format_name: decimal_0
  }

  measure: not_current_target {
    label: "Target"
    type: sum
    sql: ${target} ;;
    filters: {
      field: current_fiscal_year
      value: "no"
    }
    value_format_name: decimal_0
  }

  measure: not_current_actual {
    label: "Actual"
    type: sum
    sql: ${actual} ;;
    filters: {
      field: current_fiscal_year
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
