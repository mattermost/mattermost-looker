view: master_account_daily_arr_deltas {
  sql_table_name: FINANCE.MASTER_ACCOUNT_DAILY_ARR_DELTAS ;;
  view_label: "Master Account Monthly ARR Changes"

  dimension: compound_primary {
    type: string
    sql: ${master_account_sfid}||${ ${new_day_date} ;;
    primary_key: yes
    hidden: yes
  }

  dimension: last_and_next_12mo {
    label: "Last & Next 12 Mo."
    description: "ARR Date falls between 12 months ago and 12 months from now"
    sql: ${new_day_month} >= date_trunc('month',current_date()) - interval '12 month' AND ${new_day_month} <= date_trunc('month',current_date()) + interval '12 month'  ;;
    type: yesno
  }

  dimension: master_account_new_arr {
    label: "First Time ARR"
    description: "True when it is the first date a Master Account has ARR"
    type: yesno
    sql: ${TABLE}."ACCOUNT_NEW_ARR" ;;
  }

  dimension: master_account_sfid {
    hidden: yes
    type: string
    sql: ${TABLE}."MASTER_ACCOUNT_SFID" ;;
  }

  dimension_group: new_day {
    label: "ARR Day"
    type: time
    timeframes: [
      date,
      month,
      fiscal_quarter,
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
      fiscal_year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."PREVIOUS_DAY" ;;
  }

  dimension: new_day_arr {
    label: "ARR on Day"
    hidden: yes
    type: number
    sql: ${TABLE}."NEW_DAY_TOTAL_ARR" ;;
    value_format_name: "usd_0"
  }

  dimension: previous_day_arr {
    label: "ARR on Previous Day"
    hidden: yes
    type: number
    sql: ${TABLE}."PREVIOUS_DAY_TOTAL_ARR" ;;
    value_format_name: "usd_0"
  }

  dimension: arr_delta {
    label: "ARR Change"
    description: "ARR on Day - Previous Day ARR"
    hidden: yes
    type: number
    sql: ${TABLE}."TOTAL_ARR_DELTA" ;;
    value_format_name: "usd_0"
    drill_fields: []
  }

  dimension: type_of_change {
    label: "Type of ARR Change"
    description: "Change is either Increase, Decrease, or No Change between date and previous day"
    type: string
    sql: CASE WHEN ${previous_day_arr} < ${new_day_arr} THEN 'Increase' WHEN ${previous_day_arr} > ${new_day_arr} THEN 'Decrease' ELSE 'No Change' END;;
    value_format_name: "usd_0"
    drill_fields: []
  }

  measure: new_day_total_arr {
    label: "Total ARR on Day"
    type: sum
    sql: ${new_day_arr} ;;
    value_format_name: "usd_0"
    group_label: "ARR"
    drill_fields: []
  }

  measure: previous_day_total_arr {
    label: "Total ARR on Previous Day"
    type: sum
    sql: ${previous_day_arr} ;;
    value_format_name: "usd_0"
    group_label: "ARR"
    drill_fields: []
  }

  measure: total_arr_delta {
    label: "Total ARR Change"
    description: "ARR on Day - Previous Day ARR"
    type: sum
    sql: ${arr_delta} ;;
    value_format_name: "usd_0"
    group_label: "ARR"
    drill_fields: [master_account.name, new_day_date, type_of_change, total_arr_delta]
  }

}
