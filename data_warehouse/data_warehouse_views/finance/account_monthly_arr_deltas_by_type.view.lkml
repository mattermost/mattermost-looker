view: account_monthly_arr_deltas_by_type {
  sql_table_name: FINANCE.ACCOUNT_MONTHLY_ARR_DELTAS_BY_TYPE ;;
  view_label: "Account Monthly ARR Changes"

  dimension: compound_primary {
    type: string
    sql: ${account_sfid}||${month_start_date} ;;
    primary_key: yes
    hidden: yes
  }

  dimension: last_and_next_12mo {
    label: "Last & Next 12 Mo."
    description: "ARR Month falls between 12 months ago and 12 months from now"
    sql: ${month_start_date} >= date_trunc('month',current_date()) - interval '12 month' AND ${month_start_date} <= date_trunc('month',current_date()) + interval '12 month'  ;;
    type: yesno
  }

  dimension: fiscal_year {
    type:  string
    sql: util.fiscal_year(${month_start_date});;
    group_label: "Timeframes"
    label: "FY"
  }

  dimension: current_fy {
    type:  yesno
    sql: ${fiscal_year} = util.fiscal_year(current_date);;
    group_label: "Timeframes"
    label: " Is Current FY?"
  }

  dimension: current_qtr {
    type:  yesno
    sql:${month_start_fiscal_quarter_of_year} = util.fiscal_quarter(current_date) AND ${fiscal_year} = util.fiscal_year(current_date);;
    group_label: "Timeframes"
    label: " Is Current Qtr?"
  }

  dimension: current_mo {
    type:  yesno
    sql: ${month_start_date} = date_trunc('month',current_date);;
    group_label: "Timeframes"
    label: " Is Current Mo?"
  }

  dimension: month {
    type:  string
    sql: ${month_start_month};;
    group_label: "Timeframes"
    label: " Month"
  }

  dimension: quarter {
    type:  string
    sql:${month_start_fiscal_year} || '-' || ${month_start_fiscal_quarter_of_year};;
    group_label: "Timeframes"
    label: "Qtr"
  }

  dimension: account_sfid {
    type: string
    sql: ${TABLE}."ACCOUNT_SFID" ;;
    hidden: yes
  }

  dimension: master_account_sfid {
    type: string
    sql: ${TABLE}."MASTER_ACCOUNT_SFID" ;;
    hidden: yes
  }

  dimension_group: month_end {
    label: "End"
    type: time
    timeframes: [
      date,
      month,
      fiscal_quarter,
      fiscal_quarter_of_year,
      year,
      fiscal_year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."MONTH_END" ;;
  }

  dimension_group: month_start {
    label: "Start"
    type: time
    timeframes: [
      date,
      month,
      fiscal_quarter,
      fiscal_quarter_of_year,
      year,
      fiscal_year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."MONTH_START" ;;
  }

  dimension: arr_type {
    label: "ARR Change Type"
    description: "ARR Change is due to New, Expansion, Resurrection, Contraction, or Churn"
    sql: ${TABLE}."ARR_TYPE" ;;
    type: string
    order_by_field: arr_type_order
  }

  dimension: arr_type_order {
    hidden: yes
    case: {
      when: {
        label: "0"
        sql: ${arr_type} = 'New ARR';;
      }
      when: {
        label: "1"
        sql: ${arr_type} = 'Expansion ARR';;
      }
      when: {
        label: "2"
        sql: ${arr_type} = 'Resurrection ARR';;
      }
      when: {
        label: "3"
        sql: ${arr_type} = 'Contraction ARR';;
      }
      when: {
        label: "4"
        sql: ${arr_type} = 'Churn ARR';;
      }
    }
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
    label: "Total ARR Change"
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

  measure: total_arr_resurrection {
    label: "Total ARR Resurrection"
    type: sum
    sql: ${TABLE}."TOTAL_ARR_RESURRECTION" ;;
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

  measure: count_arr_new_accounts {
    label: "# of ARR New Accounts"
    type: count_distinct
    sql: case when ${TABLE}."TOTAL_ARR_NEW" > 0 then ${account_sfid} else null end ;;
    group_label: "ARR"
  }

  measure: count_arr_explansion_accounts {
    label: "# of ARR Explansion Accounts"
    type: count_distinct
    sql: case when ${TABLE}."TOTAL_ARR_EXPANSION" > 0 then ${account_sfid} else null end ;;
    group_label: "ARR"
  }

  measure: count_arr_resurrection_accounts {
    label: "# of ARR Resurrection Accounts"
    type: count_distinct
    sql: case when ${TABLE}."TOTAL_ARR_RESURRECTION" > 0 then ${account_sfid} else null end ;;
    group_label: "ARR"
  }

  measure: count_arr_contraction_accounts {
    label: "# of ARR Contraction Accounts"
    type: count_distinct
    sql: case when ${TABLE}."TOTAL_ARR_CONTRACTION" < 0 then ${account_sfid} else null end ;;
    group_label: "ARR"
  }

  measure: count_arr_churn_accounts {
    label: "# of ARR Churn Accounts"
    type: count_distinct
    sql: case when ${TABLE}."TOTAL_ARR_CHURN" < 0 then ${account_sfid} else null end ;;
    group_label: "ARR"
  }

  measure: total_arr_churn_curr_qtr {
    group_label: "Current Qtr"
    label: "ARR Churn"
    type: sum
    sql: ${TABLE}."TOTAL_ARR_CHURN" ;;
    filters: {
      field: current_qtr
      value: "yes"
    }
    value_format_name: "usd_0"
    drill_fields: [arr_change_details*]
  }

  measure: total_arr_contraction_curr_qtr {
    group_label: "Current Qtr"
    label: "ARR Contractions"
    type: sum
    sql: ${TABLE}."TOTAL_ARR_CONTRACTION" ;;
    filters: {
      field: current_qtr
      value: "yes"
    }
    value_format_name: "usd_0"
    drill_fields: [arr_change_details*]
  }

  measure: total_arr_delta_curr_qtr {
    group_label: "Current Qtr"
    label: "ARR Deltas"
    type: sum
    sql: ${TABLE}."TOTAL_ARR_DELTA" ;;
    filters: {
      field: current_qtr
      value: "yes"
    }
    value_format_name: "usd_0"
    drill_fields: [arr_change_details*]
  }

  measure: total_arr_expansion_curr_qtr {
    group_label: "Current Qtr"
    label: "ARR Expansions"
    type: sum
    sql: ${TABLE}."TOTAL_ARR_EXPANSION" ;;
    filters: {
      field: current_qtr
      value: "yes"
    }
    value_format_name: "usd_0"
    drill_fields: [arr_change_details*]
  }

  measure: total_arr_resurrection_curr_qtr {
    group_label: "Current Qtr"
    label: "ARR Resurrection"
    type: sum
    sql: ${TABLE}."TOTAL_ARR_RESURRECTION" ;;
    value_format_name: "usd_0"
    filters: {
      field: current_qtr
      value: "yes"
    }
    drill_fields: [arr_change_details*]
  }

  measure: total_arr_new_curr_qtr {
    group_label: "Current Qtr"
    label: "ARR New"
    type: sum
    sql: ${TABLE}."TOTAL_ARR_NEW" ;;
    value_format_name: "usd_0"
    filters: {
      field: current_qtr
      value: "yes"
    }
    drill_fields: [arr_change_details*]
  }

  measure: total_arr_churn_curr_fy {
    group_label: "Current FY"
    label: "ARR Churn"
    type: sum
    sql: ${TABLE}."TOTAL_ARR_CHURN" ;;
    filters: {
      field: current_fy
      value: "yes"
    }
    value_format_name: "usd_0"
    drill_fields: [arr_change_details*]
  }

  measure: total_arr_contraction_curr_fy {
    group_label: "Current FY"
    label: "ARR Contractions"
    type: sum
    sql: ${TABLE}."TOTAL_ARR_CONTRACTION" ;;
    filters: {
      field: current_fy
      value: "yes"
    }
    value_format_name: "usd_0"
    drill_fields: [arr_change_details*]
  }

  measure: total_arr_delta_curr_fy {
    group_label: "Current FY"
    label: "ARR Deltas"
    type: sum
    sql: ${TABLE}."TOTAL_ARR_DELTA" ;;
    filters: {
      field: current_fy
      value: "yes"
    }
    value_format_name: "usd_0"
    drill_fields: [arr_change_details*]
  }

  measure: total_arr_expansion_curr_fy {
    group_label: "Current FY"
    label: "ARR Expansions"
    type: sum
    sql: ${TABLE}."TOTAL_ARR_EXPANSION" ;;
    filters: {
      field: current_fy
      value: "yes"
    }
    value_format_name: "usd_0"
    drill_fields: [arr_change_details*]
  }

  measure: total_arr_resurrection_curr_fy {
    group_label: "Current FY"
    label: "ARR Resurrection"
    type: sum
    sql: ${TABLE}."TOTAL_ARR_RESURRECTION" ;;
    value_format_name: "usd_0"
    filters: {
      field: current_fy
      value: "yes"
    }
    drill_fields: [arr_change_details*]
  }

  measure: total_arr_new_curr_fy {
    group_label: "Current FY"
    label: "ARR New"
    type: sum
    sql: ${TABLE}."TOTAL_ARR_NEW" ;;
    value_format_name: "usd_0"
    filters: {
      field: current_fy
      value: "yes"
    }
    drill_fields: [arr_change_details*]
  }

  set: arr_change_details {
    fields: [month_end_date, master_account.name, account.name, arr_type, total_arr_delta]
  }
}
