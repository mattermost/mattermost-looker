view: account_monthly_arr_deltas_by_type {
  sql_table_name: FINANCE.ACCOUNT_MONTHLY_ARR_DELTAS_BY_TYPE ;;
  view_label: "Account Monthly ARR Changes"

  dimension: compound_primary {
    type: string
    sql: ${account_sfid}||${month_start_date} ;;
    primary_key: yes
    hidden: yes
  }

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

  measure: total_arr_norm_churn {
    label: "Total ARR Churn"
    type: sum
    sql: ${TABLE}."TOTAL_ARR_NORM_CHURN" ;;
    value_format_name: "usd_0"
    group_label: "ARR"
    drill_fields: [arr_norm_change_details*]
  }

  measure: total_arr_norm_contraction {
    label: "Total ARR Contraction"
    type: sum
    sql: ${TABLE}."TOTAL_ARR_NORM_CONTRACTION" ;;
    value_format_name: "usd_0"
    group_label: "ARR"
    drill_fields: [arr_norm_change_details*]
  }

  measure: total_arr_norm_delta {
    label: "Total ARR Delta"
    type: sum
    sql: ${TABLE}."TOTAL_ARR_NORM_DELTA" ;;
    value_format_name: "usd_0"
    group_label: "ARR"
    drill_fields: [arr_norm_change_details*]
  }

  measure: total_arr_norm_expansion {
    label: "Total ARR Expansion"
    type: sum
    sql: ${TABLE}."TOTAL_ARR_NORM_EXPANSION" ;;
    value_format_name: "usd_0"
    group_label: "ARR"
    drill_fields: [arr_norm_change_details*]
  }

  measure: total_arr_norm_new {
    label: "Total ARR New"
    type: sum
    sql: ${TABLE}."TOTAL_ARR_NORM_NEW" ;;
    value_format_name: "usd_0"
    group_label: "ARR"
    drill_fields: [arr_norm_change_details*]
  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure: count_arr_norm_new_accounts {
    label: "Count ARR New Accounts"
    type: count_distinct
    sql: case when ${TABLE}."TOTAL_ARR_NORM_NEW" > 0 then ${account_sfid} else null end ;;
    group_label: "ARR"
  }

  measure: count_arr_norm_explansion_accounts {
    label: "Count ARR Explansion Accounts"
    type: count_distinct
    sql: case when ${TABLE}."TOTAL_ARR_NORM_EXPANSION" > 0 then ${account_sfid} else null end ;;
    group_label: "ARR"
  }

  measure: count_arr_norm_contraction_accounts {
    label: "Count ARR Contraction Accounts"
    type: count_distinct
    sql: case when ${TABLE}."TOTAL_ARR_NORM_CONTRACTION" > 0 then ${account_sfid} else null end ;;
    group_label: "ARR"
  }

  measure: count_arr_norm_churn_accounts {
    label: "Count ARR Churn Accounts"
    type: count_distinct
    sql: case when ${TABLE}."TOTAL_ARR_NORM_CHURN" > 0 then ${account_sfid} else null end ;;
    group_label: "ARR"
  }

  set: arr_norm_change_details {
    fields: [month_end_date, master_account_name, master_account_sfid, account.name, account_sfid,
             total_arr_norm_delta, total_arr_norm_new, total_arr_norm_expansion, total_arr_norm_contraction, total_arr_norm_churn]
  }

  set: arr_change_details {
    fields: [month_end_date, master_account_name, master_account_sfid, account.name, account_sfid]
  }
}
