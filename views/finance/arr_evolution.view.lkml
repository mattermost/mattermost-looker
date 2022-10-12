view: arr_evolution {
  derived_table: {
    sql: with a as (
          select
          cohort_yr,
          report_mo,
          datediff('month',cohort_yr,report_mo) as month_after,
          sum(arr_os) as end_arr,
          sum(active_cnt) as end_customers,
          round(div0(end_arr,end_customers),0) as avg_arr
          from analytics.finance.arr_vintages
          group by 1,2,3
          order by 1,2,3
          )
          ,b as (
          select
          cohort_yr,
          end_arr as max_arr,
          end_customers as max_customers
          from a
          where month_after = 0
          )

          select
          a.cohort_yr,
          a.month_after,
          a.end_arr,
          div0(a.end_arr,max_arr) as ndr_pcnt,
          a.end_customers,
          div0(a.end_customers,max_customers) as cust_retention,
          a.avg_arr
          from a
          left join b on b.cohort_yr = a.cohort_yr
        ;;
    }

  dimension:  cohort_yr {
    type: string
    sql: ${TABLE}."COHORT_YR"::varchar;;
  }

  dimension:  month_after {
    type: number
    description: "Month after fiscal year end of cohort"
    sql: ${TABLE}."MONTH_AFTER";;
  }

  measure: end_arr {
    type: average
    value_format: "$#,##0;($#,##0)"
    sql: ${TABLE}."END_ARR" ;;
  }

  measure: ndr_pcnt {
    type: average
    value_format: "0.0%"
    sql: ${TABLE}."NDR_PCNT" ;;
  }

  measure: os_customers {
    type: sum
    value_format: "0"
    sql: ${TABLE}."END_CUSTOMERS" ;;
  }

  measure: retention_pcnt {
    type: average
    value_format: "0.0%"
    sql: ${TABLE}."CUST_RETENTION" ;;
  }

  measure: avg_arr {
    type: average
    sql: ${TABLE}."AVG_ARR" ;;
  }




 }
