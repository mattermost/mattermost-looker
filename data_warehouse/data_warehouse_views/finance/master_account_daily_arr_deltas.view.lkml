view: master_account_daily_arr_deltas {
  sql_table_name: FINANCE.MASTER_ACCOUNT_DAILY_ARR_DELTAS ;;
  view_label: "Master Account Monthly ARR Changes"

  dimension: master_account_new_arr {
    type: yesno
    sql: ${TABLE}."MASTER_ACCOUNT_NEW_ARR" ;;
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

  measure: new_day_total_arr {
    label: "New Day ARR"
    type: sum
    sql: ${TABLE}."NEW_DAY_TOTAL_ARR" ;;
    value_format_name: "usd_0"
    group_label: "ARR"
    drill_fields: []
  }

  measure: previous_day_total_arr {
    label: "Previous Day ARR"
    type: sum
    sql: ${TABLE}."PREVIOUS_DAY_TOTAL_ARR" ;;
    value_format_name: "usd_0"
    group_label: "ARR"
    drill_fields: []
  }

  measure: total_arr_delta {
    label: "Total ARR Delta"
    type: sum
    sql: ${TABLE}."TOTAL_ARR_DELTA" ;;
    value_format_name: "usd_0"
    group_label: "ARR"
    drill_fields: []
  }

}
