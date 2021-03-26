view: opportunity_daily_arr {
  sql_table_name: "FINANCE"."OPPORTUNITY_DAILY_ARR"
    ;;

  dimension: account_sfid {
    type: string
    sql: ${TABLE}."ACCOUNT_SFID" ;;
    hidden: yes
  }

  dimension_group: day {
    type: time
    timeframes: [
      date,
      week,
      month,
      fiscal_quarter,
      fiscal_year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."DAY" ;;
  }

  dimension: master_account_sfid {
    type: string
    sql: ${TABLE}."MASTER_ACCOUNT_SFID" ;;
    hidden: yes
  }

  dimension: opportunity_sfid {
    primary_key: yes
    type: string
    sql: ${TABLE}."OPPORTUNITY_SFID" ;;
    hidden: yes
  }

  dimension: won_arr {
    label: "Won ARR"
    type: number
    sql: ${TABLE}."TOTAL_ARR" ;;
  }

  dimension: lost_arr {
    label: "Lost ARR"
    type: number
    sql: ${TABLE}."LOST_ARR" ;;
  }

  dimension: open_arr {
    label: "Open ARR"
    type: number
    sql: ${TABLE}."OPEN_ARR" ;;
  }

  dimension: total_arr {
    label: "ARR"
    type: number
    sql: greatest(${won_arr},${lost_arr},${open_arr}) ;;
  }

  measure: count_arr_totals {
    label: "Count of ARR Totals"
    type: count_distinct
    sql: ${total_arr} ;;
  }

  measure: list_arr_totals {
    label: "List of ARR Totals"
    type: string
    sql: LISTAGG(DISTINCT to_char(${total_arr}, '$B9,999,990'),' - ') ;;
  }

  measure: arr {
    label: "ARR"
    type: sum_distinct
    sql: ${total_arr} ;;
    value_format_name: usd_0
  }
}
