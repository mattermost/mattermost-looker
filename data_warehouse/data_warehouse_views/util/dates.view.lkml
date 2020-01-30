view: dates {
  sql_table_name: UTIL.DATES ;;

  filter: last_and_next_12mo {
    sql: ${date_month_full_date} >= date_trunc('month',current_date()) - interval '12 month' AND ${date_month_full_date} <= date_trunc('month',current_date()) + interval '12 month'  ;;
    type: yesno
  }

  dimension_group: date {
    type: time
    timeframes: [
      date,
      week,
      month,
      quarter,
      fiscal_quarter,
      fiscal_year,
      year,
      day_of_year,
      day_of_month
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."DATE" ;;
  }

  dimension: date_month_full_date {
    group_label: "Date Date"
    sql: date_trunc('month',${TABLE}."DATE") ;;
    type: date
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
