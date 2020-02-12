view: master_account_monthly_arr_deltas_by_type {
  sql_table_name: FINANCE.MASTER_ACCOUNT_MONTHLY_ARR_DELTAS_BY_TYPE ;;
  view_label: "Master Account Monthly ARR Changes"

  dimension: compound_primary {
    type: string
    sql: ${master_account_sfid}||${month_start_date} ;;
    primary_key: yes
    hidden: yes
  }

  dimension: last_and_next_12mo {
    sql: ${month_start_date} >= date_trunc('month',current_date()) - interval '12 month' AND ${month_start_date} <= date_trunc('month',current_date()) + interval '12 month'  ;;
    type: yesno
  }

  dimension: master_account_sfid {
    type: string
    sql: ${TABLE}."MASTER_ACCOUNT_SFID" ;;
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


  dimension: arr_type {
    label: "ARR Type"
    sql: ${TABLE}."ARR_TYPE" ;;
    type: string
  }

  measure: total_arr_churn {
    label: "Total ARR Churn"
    type: sum
    sql: ${TABLE}."TOTAL_ARR_CHURN" ;;
    value_format_name: "usd_0"
    group_label: "ARR"
    drill_fields: [arr_change_details*]
  }

  measure: total_arr_contraction {
    label: "Total ARR Contraction"
    type: sum
    sql: ${TABLE}."TOTAL_ARR_CONTRACTION" ;;
    value_format_name: "usd_0"
    group_label: "ARR"
    drill_fields: [arr_change_details*]
  }

  measure: total_arr_delta {
    label: "Total ARR Delta"
    type: sum
    sql: ${TABLE}."TOTAL_ARR_DELTA" ;;
    value_format_name: "usd_0"
    group_label: "ARR"
    drill_fields: [arr_change_details*]
  }

  measure: total_arr_expansion {
    label: "Total ARR Expansion"
    type: sum
    sql: ${TABLE}."TOTAL_ARR_EXPANSION" ;;
    value_format_name: "usd_0"
    group_label: "ARR"
    drill_fields: [arr_change_details*]
  }

  measure: total_arr_new {
    label: "Total ARR New"
    type: sum
    sql: ${TABLE}."TOTAL_ARR_NEW" ;;
    value_format_name: "usd_0"
    group_label: "ARR"
    drill_fields: [arr_change_details*]
  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure: count_arr_new_accounts {
    label: "Count ARR Norm New Master Accounts"
    type: count_distinct
    sql: case when ${TABLE}."TOTAL_ARR_NEW" > 0 then ${master_account_sfid} else null end ;;
    group_label: "ARR Norm."
  }

  measure: count_arr_explansion_accounts {
    label: "Count ARR Norm Explansion Master Accounts"
    type: count_distinct
    sql: case when ${TABLE}."TOTAL_ARR_EXPANSION" > 0 then ${master_account_sfid} else null end ;;
    group_label: "ARR Norm."
  }

  measure: count_arr_contraction_accounts {
    label: "Count ARR Norm Contraction Master Accounts"
    type: count_distinct
    sql: case when ${TABLE}."TOTAL_ARR_CONTRACTION" < 0 then ${master_account_sfid} else null end ;;
    group_label: "ARR Norm."
  }

  measure: count_arr_churn_accounts {
    label: "Count ARR Norm Churn Master Accounts"
    type: count_distinct
    sql: case when ${TABLE}."TOTAL_ARR_CHURN" < 0 then ${master_account_sfid} else null end ;;
    group_label: "ARR Norm."
  }

  set: arr_change_details {
    fields: [month_end_date, master_account_sfid,
      total_arr_delta, total_arr_new, total_arr_expansion, total_arr_contraction, total_arr_churn]
  }

 }
