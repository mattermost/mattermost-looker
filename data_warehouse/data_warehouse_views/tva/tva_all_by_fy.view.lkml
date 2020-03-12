view: tva_all_by_fy {
  sql_table_name: "TVA"."TVA_ALL_BY_FY";;
  view_label: "TvA by FY"

  dimension: compound_primary {
    sql: ${target_slug}||${fiscal_year} ;;
    primary_key: yes
    hidden: yes
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
  }

  measure: current_actual {
    label: "Current FY Actual"
    type: sum
    sql: ${actual} ;;
    filters: {
      field: current_fiscal_year
      value: "yes"
    }
  }

  measure: current_left {
    label: "Current FY Target Left"
    type: number
    sql: greatest(${current_target}-${current_actual},0) ;;
  }

  measure: not_current_target {
    label: "Target"
    type: sum
    sql: ${target} ;;
    filters: {
      field: current_fiscal_year
      value: "no"
    }
  }

  measure: not_current_actual {
    label: "Actual"
    type: sum
    sql: ${actual} ;;
    filters: {
      field: current_fiscal_year
      value: "no"
    }
  }

  measure: not_current_left {
    label: "Target Left"
    type: number
    sql: greatest(${not_current_target}-${not_current_actual},0) ;;
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
