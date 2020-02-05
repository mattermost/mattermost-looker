view: account_monthly_arr_deltas_by_type {
  sql_table_name: FINANCE.ACCOUNT_MONTHLY_ARR_DELTAS_BY_TYPE_V2 ;;
  view_label: "Account Monthly ARR Changes"

  dimension: compound_primary {
    type: string
    sql: ${account_sfid}||${month_start_date} ;;
    primary_key: yes
    hidden: yes
  }

  dimension: last_and_next_12mo {
    sql: ${month_start_date} >= date_trunc('month',current_date()) - interval '12 month' AND ${month_start_date} <= date_trunc('month',current_date()) + interval '12 month'  ;;
    type: yesno
  }

  dimension: account_sfid {
    type: string
    sql: ${TABLE}."ACCOUNT_SFID" ;;
  }

  dimension: account_name {
    type: string
    sql: ${account.name} ;;
    link: {
      label: "Salesforce Account"
      url: "@{salesforce_link}{{account_sfid}}"
    }
  }

  dimension: master_account_sfid {
    type: string
    sql: ${TABLE}."MASTER_ACCOUNT_SFID" ;;
  }

  dimension: master_account_name {
    type: string
    sql: ${master_account.name} ;;
    link: {
      label: "Salesforce Master Account"
      url: "@{salesforce_link}{{master_account_sfid}}"
    }
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
    label: "Count ARR New Accounts"
    type: count_distinct
    sql: case when ${TABLE}."TOTAL_ARR_NEW" > 0 then ${account_sfid} else null end ;;
    group_label: "ARR"
  }

  measure: count_arr_explansion_accounts {
    label: "Count ARR Explansion Accounts"
    type: count_distinct
    sql: case when ${TABLE}."TOTAL_ARR_EXPANSION" > 0 then ${account_sfid} else null end ;;
    group_label: "ARR"
  }

  measure: count_arr_contraction_accounts {
    label: "Count ARR Contraction Accounts"
    type: count_distinct
    sql: case when ${TABLE}."TOTAL_ARR_CONTRACTION" > 0 then ${account_sfid} else null end ;;
    group_label: "ARR"
  }

  measure: count_arr_churn_accounts {
    label: "Count ARR Churn Accounts"
    type: count_distinct
    sql: case when ${TABLE}."TOTAL_ARR_CHURN" > 0 then ${account_sfid} else null end ;;
    group_label: "ARR"
  }

  set: arr_change_details {
    fields: [month_end_date, master_account_name, account_name, arr_type, total_arr_delta]
  }
}
