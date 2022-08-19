view: arr_outstanding {
  derived_table: {
    sql: select
      distinct report_wk as report_date,
      last_value(total_end_arr) over (partition by report_wk order by report_day,account_id) as end_arr
      from analytics.finance.arr_reporting

      union

      select
      distinct report_mo as report_date,
      last_value(total_end_arr) over (partition by report_mo order by report_day,account_id) as end_arr
      from analytics.finance.arr_reporting
      order by 1 asc
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: report_date {
    type: date
    sql: ${TABLE}."REPORT_DATE" ;;
  }

  dimension: report_month {
    type: date
    hidden: yes
    sql: last_day(${TABLE}."REPORT_DATE",'month');;
  }

  dimension: fiscal_quarter {
    type: date
    hidden: yes
    sql: last_day(dateadd('month',1,last_day(dateadd('month',2,date_trunc('quarter',dateadd('month',-1,last_day(${TABLE}."REPORT_DATE",'month'))))))) ;;
  }

  dimension: fiscal_year {
    type: date
    hidden: yes
    sql: last_day(dateadd('month',1,last_day(dateadd('month',11,date_trunc('year',dateadd('month',-1,last_day(${TABLE}."REPORT_DATE",'month'))))))) ;;
  }

  dimension: report_mo {
    type: string
    sql: ${report_month}::varchar ;;
  }

  dimension: fiscal_qtr {
    type: string
    sql: ${fiscal_quarter}::varchar ;;
  }

  dimension: fiscal_yr {
    type: string
    sql: ${fiscal_year}::varchar ;;
  }

  dimension: arr_os {
    description: "Outstanding ARR as of report day"
    value_format: "$#,##0"
    type: number
    sql: ${TABLE}."END_ARR" ;;
  }

  measure: arr_avg {
    type: average
    value_format: "$#,##0"
    sql: ${arr_os} ;;
  }

  set: detail {
    fields: [report_date, arr_os]
  }

  }
