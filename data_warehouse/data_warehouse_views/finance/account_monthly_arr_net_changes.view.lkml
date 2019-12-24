view: account_monthly_arr_net_changes {
  sql_table_name: FINANCE.ACCOUNT_MONTHLY_ARR_NET_CHANGES ;;

  dimension: account_sfid {
    type: string
    sql: ${TABLE}."ACCOUNT_SFID" ;;
  }

  dimension: account_name {
    type: string
    sql: ${account.name} ;;
  }

  dimension: master_account_sfid {
    type: string
    sql: ${TABLE}."MASTER_ACCOUNT_SFID" ;;
  }

  dimension: master_account_name {
    type: string
    sql: ${master_account.name} ;;
  }

  dimension_group: month_end {
    type: time
    timeframes: [
      date,
      month,
      fiscal_quarter,
      year,
      fiscal_year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."MONTH_END" ;;
  }

  dimension_group: month_start {
    type: time
    timeframes: [
      date,
      month,
      fiscal_quarter,
      year,
      fiscal_year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."MONTH_START" ;;
  }

  measure: total_arr_churn {
    label: "Total ARR Churn"
    type: sum
    sql: ${TABLE}."TOTAL_ARR_CHURN" ;;
    value_format_name: "usd"
    group_label: "ARR"
    drill_fields: [arr_change_details*]
  }

  measure: total_arr_contraction {
    label: "Total ARR Contraction"
    type: sum
    sql: ${TABLE}."TOTAL_ARR_CONTRACTION" ;;
    value_format_name: "usd"
    group_label: "ARR"
    drill_fields: [arr_change_details*]
  }

  measure: total_arr_delta {
    label: "Total ARR Delta"
    type: sum
    sql: ${TABLE}."TOTAL_ARR_DELTA" ;;
    value_format_name: "usd"
    group_label: "ARR"
    drill_fields: [arr_change_details*]
  }

  measure: total_arr_expansion {
    label: "Total ARR Expansion"
    type: sum
    sql: ${TABLE}."TOTAL_ARR_EXPANSION" ;;
    value_format_name: "usd"
    group_label: "ARR"
    drill_fields: [arr_change_details*]
  }

  measure: total_arr_new {
    label: "Total ARR New"
    type: sum
    sql: ${TABLE}."TOTAL_ARR_NEW" ;;
    value_format_name: "usd"
    group_label: "ARR"
    drill_fields: [arr_change_details*]
  }

  measure: total_arr_norm_churn {
    label: "Total ARR Norm Churn"
    type: sum
    sql: ${TABLE}."TOTAL_ARR_NORM_CHURN" ;;
    value_format_name: "usd"
    group_label: "ARR Norm."
    drill_fields: [arr_norm_change_details*]
  }

  measure: total_arr_norm_contraction {
    label: "Total ARR Norm Contraction"
    type: sum
    sql: ${TABLE}."TOTAL_ARR_NORM_CONTRACTION" ;;
    value_format_name: "usd"
    group_label: "ARR Norm."
    drill_fields: [arr_norm_change_details*]
  }

  measure: total_arr_norm_delta {
    label: "Total ARR Norm Delta"
    type: sum
    sql: ${TABLE}."TOTAL_ARR_NORM_DELTA" ;;
    value_format_name: "usd"
    group_label: "ARR Norm."
    drill_fields: [arr_norm_change_details*]
  }

  measure: total_arr_norm_expansion {
    label: "Total ARR Norm Expansion"
    type: sum
    sql: ${TABLE}."TOTAL_ARR_NORM_EXPANSION" ;;
    value_format_name: "usd"
    group_label: "ARR Norm."
    drill_fields: [arr_norm_change_details*]
  }

  measure: total_arr_norm_new {
    label: "Total ARR Norm New"
    type: sum
    sql: ${TABLE}."TOTAL_ARR_NORM_NEW" ;;
    value_format_name: "usd"
    group_label: "ARR Norm."
    drill_fields: [arr_norm_change_details*]
  }

  measure: count {
    type: count
    drill_fields: []
  }

  set: arr_norm_change_details {
    fields: [month_end_date, master_account_name, master_account_sfid, account.name, account_sfid,
             total_arr_norm_delta, total_arr_norm_new, total_arr_norm_expansion, total_arr_norm_contraction, total_arr_norm_churn]
  }

  set: arr_change_details {
    fields: [month_end_date, master_account_name, master_account_sfid, account.name, account_sfid,
      total_arr_delta, total_arr_new, total_arr_expansion, total_arr_contraction, total_arr_churn]
  }
}
