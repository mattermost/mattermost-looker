view: account_daily_arr_deltas {
  sql_table_name: FINANCE.ACCOUNT_DAILY_ARR_DELTAS ;;

  dimension: compound_primary {
    type: string
    sql: ${account_sfid}||${ ${new_day_date} ;;
    primary_key: yes
    hidden: yes
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

  measure: new_day_total_arr {
    label: "New Day ARR"
    type: sum
    sql: ${TABLE}."NEW_DAY_TOTAL_ARR" ;;
    value_format_name: "usd_0"
    group_label: "ARR"
    drill_fields: []
  }

  measure: new_day_total_arr_norm {
    label: "New Day ARR Norm"
    type: sum
    sql: ${TABLE}."NEW_DAY_TOTAL_ARR_NORM" ;;
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

  measure: previous_day_total_arr_norm {
    label: "Previous Day ARR Norm"
    type: sum
    sql: ${TABLE}."PREVIOUS_DAY_TOTAL_ARR_NORM" ;;
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

  measure: total_arr_norm_delta {
    label: "Total ARR Norm Delta"
    type: sum
    sql: ${TABLE}."TOTAL_ARR_NORM_DELTA" ;;
    value_format_name: "usd_0"
    group_label: "ARR"
    drill_fields: []
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
