view: arr_cohort {
  derived_table: {
    sql: select
          report_mo,
          fiscal_yr,
          (date_part('year',cohort_fiscal_yr)) as cohort_yr,
          iff(date_part('month',report_mo) in (4,7,9,1),1,0) as quarter_end,
          datediff('year',cohort_fiscal_yr,fiscal_yr) as year_after,
          sum(new) as new_arr,
          sum(resurrected) as resurrect_arr,
          sum(expanded) as expand_arr,
          sum(contracted) as contract_arr,
          sum(churned) as churn_arr,
          sum(arr_delta) as arr_change,
          sum(arr_change) over (partition by cohort_yr order by report_mo) as arr_os,
          sum(cnt_new) as new_cnt,
          sum(cnt_resurrected) as resurrect_cnt,
          sum(cnt_churned) as churned_cnt,
          sum(cnt_changed) as delta_cnt,
          sum(delta_cnt) over (partition by cohort_yr order by report_mo) as active_cnt,
          sum(cnt_expanded) as expand_cnt,
          sum(cnt_contracted) as contract_cnt
        from analytics.finance.arr_reporting
          group by 1,2,3,4,5
          order by report_mo, cohort_yr

       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: report_mo {
    type: string
    sql: ${TABLE}."REPORT_MO"::varchar ;;
  }

  dimension: fiscal_yr {
    type: string
    sql: ${TABLE}."FISCAL_YR"::varchar ;;
  }

  dimension: cohort_yr {
    type: string
    sql: ${TABLE}."COHORT_YR"::varchar ;;
  }

  dimension: quarter_end {
    type: number
    description: "If report month is also a quarter end"
    sql: ${TABLE}."QUARTER_END" ;;
  }

  dimension: year_after {
    type: number
    sql: ${TABLE}."YEAR_AFTER" ;;
  }


  measure: new_arr {
    type: sum
    value_format: "$#,##0;($#,##0)"
    sql: ${TABLE}."NEW_ARR" ;;
  }

  measure: new_avg {
    type: number
    value_format: "$#,##0;($#,##0)"
    sql: DIV0(SUM(${TABLE}."NEW_ARR"),SUM(${TABLE}."NEW_CNT"));;
  }

  measure: resurrect_arr {
    type: sum
    value_format: "$#,##0;($#,##0)"
    sql: ${TABLE}."RESURRECT_ARR" ;;
  }

  measure: resurrect_avg {
    type: number
    value_format: "$#,##0;($#,##0)"
    sql: DIV0(SUM(${TABLE}."RESURRECT_ARR"),SUM(${TABLE}."RESURRECT_CNT"));;
  }

  measure: expand_arr {
    type: sum
    value_format: "$#,##0;($#,##0)"
    sql: ${TABLE}."EXPAND_ARR" ;;
  }

  measure: expand_avg {
    type: number
    value_format: "$#,##0;($#,##0)"
    sql: DIV0(SUM(${TABLE}."EXPAND_ARR"),SUM(${TABLE}."EXPAND_CNT"));;
  }

  measure: contract_arr {
    type: sum
    value_format: "$#,##0;($#,##0)"
    sql: ${TABLE}."CONTRACT_ARR" ;;
  }

  measure: contract_avg {
    type: number
    value_format: "$#,##0;($#,##0)"
    sql: DIV0(SUM(${TABLE}."CONTRACT_ARR"),SUM(${TABLE}."CONTRACT_CNT"));;
  }

  measure: churn_arr {
    type: sum
    value_format: "$#,##0;($#,##0)"
    sql: ${TABLE}."CHURN_ARR" ;;
  }

  measure: churn_avg {
    type: number
    value_format: "$#,##0;($#,##0)"
    sql: DIV0(SUM(${TABLE}."CHURN_ARR"),SUM(${TABLE}."CHURNED_CNT"));;
  }

  measure: arr_change {
    type: sum
    value_format: "$#,##0;($#,##0)"
    sql: ${TABLE}."ARR_CHANGE" ;;
  }

  measure: change_avg {
    type: number
    value_format: "$#,##0;($#,##0)"
    sql: DIV0(SUM(${TABLE}."ARR_CHANGE"),SUM(${TABLE}."DELTA_CNT"));;
  }

  measure: arr_os {
    type: sum
    value_format: "$#,##0;($#,##0)"
    sql: ${TABLE}."ARR_OS" ;;
  }

  measure: arr_avg {
    type: number
    value_format: "$#,##0;($#,##0)"
    sql: DIV0(SUM(${TABLE}."ARR_OS"),SUM(${TABLE}."ACTIVE_CNT"));;
  }

  measure: new_cnt {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}."NEW_CNT" ;;
  }

  measure: resurrect_cnt {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}."RESURRECT_CNT" ;;
  }

  measure: churned_cnt {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}."CHURNED_CNT" ;;
  }

  measure: delta_cnt {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}."DELTA_CNT" ;;
  }

  measure: active_cnt {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}."ACTIVE_CNT" ;;
  }

  measure: expand_cnt {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}."EXPAND_CNT" ;;
  }

  measure: contract_cnt {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}."CONTRACT_CNT" ;;
  }



  set: detail {
    fields: [
      report_mo,
      fiscal_yr,
      cohort_yr,
      new_arr,
      resurrect_arr,
      expand_arr,
      contract_arr,
      churn_arr,
      arr_change,
      arr_os,
      new_cnt,
      resurrect_cnt,
      churned_cnt,
      delta_cnt,
      active_cnt
    ]
  }
}
