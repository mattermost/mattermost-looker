view: dates {
  sql_table_name: UTIL.DATES ;;

  dimension_group: date {
    type: time
    timeframes: [
      date,
      week,
      month,
      quarter,
      day_of_year,
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."DATE" ;;
  }

  filter: last_and_next_12mo {
    sql: ${month_full_date} >= date_trunc('month',current_date()) - interval '12 month' AND ${month_full_date} <= date_trunc('month',current_date()) + interval '12 month'  ;;
    type: yesno
  }

  dimension: day_num {
    group_label: "Date"
    type: number
    sql: ${TABLE}."DAY_NUM" ;;
  }

  dimension: fiscal_month {
    group_label: "Date"
    type: string
    sql: ${TABLE}."FISCAL_MONTH" ;;
  }

  dimension: fiscal_quarter {
    group_label: "Date"
    type: string
    sql: ${TABLE}."FISCAL_QUARTER" ;;
  }

  dimension: fiscal_year {
    group_label: "Date"
    type: number
    sql: ${TABLE}."FISCAL_YEAR" ;;
  }

  dimension: month_full_date {
    group_label: "Date"
    type: date
    sql: ${TABLE}."MONTH_DATE" ;;
  }

  dimension: month_name_short {
    group_label: "Date"
    type: string
    sql: ${TABLE}."MONTH_NAME_SHORT_STRING" ;;
  }

  dimension: month_name {
    group_label: "Date"
    type: string
    sql: ${TABLE}."MONTH_NAME_STRING" ;;
  }

  dimension: month_num {
    group_label: "Date"
    type: number
    sql: ${TABLE}."MONTH_NUM" ;;
  }

  dimension: year_full_date {
    group_label: "Date"
    type: date
    sql: ${TABLE}."YEAR_DATE" ;;
  }

  dimension: year {
    group_label: "Date"
    type: number
    sql: ${TABLE}."YEAR_NUM" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
