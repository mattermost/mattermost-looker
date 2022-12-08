view: arr_evolution {
  derived_table: {
    sql: with a as (
              select
                bin_avg_arr,
                cohort_yr,
                report_mo,
                datediff('month',cohort_yr,report_mo) as month_after,
                sum(arr_os) as end_arr,
                sum(active_cnt) as end_customers,
                round(div0(end_arr,end_customers),0) as avg_arr
              from analytics.finance.arr_vintages
              where cohort_yr > date '2016-01-31'
              group by 1,2,3,4
              order by 1,2,3,4
          )
          ,b as (
              select
                bin_avg_arr,
                cohort_yr,
                end_arr as max_arr,
                avg_arr as start_avg_arr,
                end_customers as max_customers
              from a
              where month_after = 0
          )
          --THIS IS THE SUBQUERY FOR ALL BINS
          ,c as (
              select
              '0 - ALL' as bin_avg_arr,
              cohort_yr,
              report_mo,
              datediff('month',cohort_yr,report_mo) as month_after,
              sum(arr_os) as end_arr,
              sum(active_cnt) as end_customers,
              round(div0(end_arr,end_customers),0) as avg_arr
          from analytics.finance.arr_vintages
          where cohort_yr > date '2016-01-31'
          group by 1,2,3,4
          order by 1,2,3,4
          )

          ,d as (
              select
                bin_avg_arr,
                cohort_yr,
                end_arr as max_arr,
                avg_arr as start_avg_arr,
                end_customers as max_customers
              from c
              where month_after = 0
          )

          select
            a.bin_avg_arr,
            a.cohort_yr,
            a.month_after,
            a.end_arr,
            div0(a.avg_arr,b.start_avg_arr) as expand_rate,
            div0(a.end_arr,max_arr) as ndr_pcnt,
            a.end_customers,
            div0(a.end_customers,max_customers) as cust_retention,
            a.avg_arr
          from a
          left join b on b.cohort_yr = a.cohort_yr and a.bin_avg_arr = b.bin_avg_arr

          union

          select
            c.bin_avg_arr,
            c.cohort_yr,
            c.month_after,
            c.end_arr,
            div0(c.avg_arr,d.start_avg_arr) as expand_rate,
            div0(c.end_arr,d.max_arr) as ndr_pcnt,
            c.end_customers,
            div0(c.end_customers,max_customers) as cust_retention,
            c.avg_arr
          from c
          left join d on d.cohort_yr = c.cohort_yr and d.bin_avg_arr = c.bin_avg_arr
        ;;
    }

  dimension: bin_avg_arr {
    type:  string
    sql:${TABLE}."BIN_AVG_ARR" ;;
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

  measure: expand_rate {
    type: average
    value_format: "0.0%"
    sql: coalesce(${TABLE}."EXPAND_RATE",null) ;;
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
    value_format: "$#,##0;($#,##0)"
    sql: ${TABLE}."AVG_ARR" ;;
  }




 }
