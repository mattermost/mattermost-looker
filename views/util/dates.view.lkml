view: dates {
  sql_table_name: UTIL.DATES ;;

  filter: last_and_next_12mo {
    group_label: "Date Filters"
    sql: ${date_month_full_date} >= date_trunc('month',current_date()) - interval '12 month' AND ${date_month_full_date} <= date_trunc('month',current_date()) + interval '12 month'  ;;
    type: yesno
  }

  dimension_group: date {
    type: time
    timeframes: [raw, date, week, month, fiscal_quarter, fiscal_year, day_of_year, day_of_month]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."DATE" ;;
  }

  dimension_group: next {
    type: time
    timeframes: [
      date,
      week,
      month,
      fiscal_quarter,
      fiscal_year,
      day_of_year,
      day_of_month
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."DATE" + interval '1 day';;
    hidden: yes
  }

  dimension: date_month_full_date {
    group_label: "Date Date"
    sql: date_trunc('month',${TABLE}."DATE") ;;
    type: date
  }

  filter: first_day_of_month {
    group_label: "Date Filters"
    type:  yesno
    sql: EXTRACT(DAY FROM ${TABLE}."DATE") = 1 ;;
  }

  filter: last_day_of_month {
    group_label: "Date Filters"
    type:  yesno
    sql: EXTRACT(DAY FROM ${TABLE}."DATE" + interval '1 day') = 1 ;;
  }

  filter: last_day_of_fiscal_year {
    group_label: "Date Filters"
    type:  yesno
    sql: ${TABLE}."DATE" like '%-01-31' ;;
  }

  filter: first_day_of_fiscal_year {
    group_label: "Date Filters"
    type:  yesno
    sql: ${TABLE}."DATE" like '%-02-01' ;;
  }

  filter: first_day_of_fiscal_quarter {
    group_label: "Date Filters"
    type:  yesno
    sql: ${TABLE}."DATE" like '%-02-01' OR ${TABLE}."DATE" like '%-05-01' OR ${TABLE}."DATE" like '%-08-01' OR ${TABLE}."DATE" like '%-11-01' ;;
  }

  filter: last_day_of_fiscal_quarter {
    group_label: "Date Filters"
    type:  yesno
    sql: ${TABLE}."DATE" like '%-01-31' OR ${TABLE}."DATE" like '%-04-30' OR ${TABLE}."DATE" like '%-07-31' OR ${TABLE}."DATE" like '%-10-31' ;;
  }


  dimension: previous_current_future_month {
    label: "Previous/Current/Future Month"
    group_label: "Date Date"
    sql: case
          when date_trunc('month', ${TABLE}.date) > date_trunc('month', current_date()) then 'future'
          when date_trunc('month', ${TABLE}.date) = date_trunc('month', current_date()) then 'current'
          when date_trunc('month', ${TABLE}.date) < date_trunc('month', current_date()) then 'past'
        end;;
    type: string
  }
}
