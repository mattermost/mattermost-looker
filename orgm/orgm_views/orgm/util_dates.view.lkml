view: util_dates {
  sql_table_name: orgm.util_dates ;;

  dimension_group: date {
    type: time
    timeframes: [
      date,
      day_of_week,
      day_of_week_index,
      day_of_month,
      month,
      month_num,
      month_name,
      fiscal_month_num,
      day_of_year,
      year,
      fiscal_year,
      fiscal_quarter,
      fiscal_quarter_of_year
    ]
    datatype: date
    sql: ${TABLE}."date" ;;
  }

}
