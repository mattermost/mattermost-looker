view: account_daily_arr_deltas {
  sql_table_name: FINANCE.ACCOUNT_DAILY_ARR_DELTAS ;;

  dimension: compound_primary {
    type: string
    sql: ${account_sfid}||${ ${new_day_date} ;;
    primary_key: yes
    hidden: yes
  }

  dimension: last_and_next_12mo {
    sql: ${new_day_month} >= date_trunc('month',current_date()) - interval '12 month' AND ${new_day_month} <= date_trunc('month',current_date()) + interval '12 month'  ;;
    type: yesno
  }

  dimension: account_new_arr {
    type: yesno
    sql: ${TABLE}."ACCOUNT_NEW_ARR" ;;
  }

  dimension: account_sfid {
    type: string
    sql: ${TABLE}."ACCOUNT_SFID" ;;
  }

  dimension: master_account_sfid {
    type: string
    sql: ${TABLE}."MASTER_ACCOUNT_SFID" ;;
  }

  dimension_group: new_day {
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
    sql: ${TABLE}."NEW_DAY" ;;
  }

  dimension_group: previous_day {
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
    sql: ${TABLE}."PREVIOUS_DAY" ;;
  }

  dimension: new_day_arr {
    label: "New Day ARR"
    hidden: yes
    type: number
    sql: ${TABLE}."NEW_DAY_TOTAL_ARR" ;;
    value_format_name: "usd_0"
  }

  dimension: previous_day_arr {
    label: "Previous Day ARR"
    hidden: yes
    type: number
    sql: ${TABLE}."PREVIOUS_DAY_TOTAL_ARR" ;;
    value_format_name: "usd_0"
  }

  dimension: arr_delta {
    label: "Total ARR Delta"
    hidden: yes
    type: number
    sql: ${TABLE}."TOTAL_ARR_DELTA" ;;
    value_format_name: "usd_0"
    drill_fields: []
  }

  dimension: type_of_change {
    label: "Type of Change"
    type: string
    sql: CASE WHEN ${previous_day_arr} < ${new_day_arr} THEN 'Increase' WHEN ${previous_day_arr} > ${new_day_arr} THEN 'Decrease' ELSE 'No Change' END;;
    value_format_name: "usd_0"
    drill_fields: []
  }

  measure: new_day_total_arr {
    label: "New Day ARR"
    type: sum
    sql: ${new_day_arr} ;;
    value_format_name: "usd_0"
    group_label: "ARR"
    drill_fields: []
  }

  measure: previous_day_total_arr {
    label: "Previous Day ARR"
    type: sum
    sql: ${previous_day_arr} ;;
    value_format_name: "usd_0"
    group_label: "ARR"
    drill_fields: []
  }

  measure: total_arr_delta {
    label: "Total ARR Delta"
    type: sum
    sql: ${arr_delta} ;;
    value_format_name: "usd_0"
    group_label: "ARR"
    drill_fields: [account.name, new_day_date, type_of_change, total_arr_delta]
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
