# The name of this view in Looker is "Arr Vintages"
view: arr_vintages {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "FINANCE"."ARR_VINTAGES"
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Account ID" in Explore.




  dimension: account_id {
    type: string
    sql: ${TABLE}."ACCOUNT_ID" ;;
  }

  dimension: account_name {
    type: string
    sql: ${TABLE}."ACCOUNT_NAME" ;;
  }

  dimension: active_cnt {
    type: number
    sql: ${TABLE}."ACTIVE_CNT" ;;
  }

  measure: total_active_cnt {
    type: sum
    sql: ${active_cnt} ;;
  }

  dimension: arr_delta {
    type: number
    value_format: "$#,##0;($#,##0)"
    sql: ${TABLE}."ARR_DELTA" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_arr_delta {
    type: sum
    value_format: "$#,##0;($#,##0)"
    sql: ${arr_delta} ;;
  }

  measure: average_arr_delta {
    type: average
    value_format: "$#,##0;($#,##0)"
    sql: ${arr_delta} ;;
  }

  dimension: arr_os {
    type: number
    value_format: "$#,##0;($#,##0)"
    sql: ${TABLE}."ARR_OS" ;;
  }

  measure: avg_arr {
    type: average
    value_format: "$#,##0;($#,##0)"
    drill_fields: [account_name,account_id,cohort_month,cohort_yr,report_mo,arr_os,arr_delta]
    sql:  ${TABLE}."ARR_OS";;
  }

  measure: month_end_arr {
    type: sum
    value_format: "$#,##0;($#,##0)"
    drill_fields: [account_name,account_id,cohort_month,cohort_yr,report_mo,arr_os,arr_delta]
    sql:  ${TABLE}."ARR_OS";;
  }

  measure: pcnt_delta {
    type: number
    value_format: "0.00%;(0.00%)"
    sql: div0(${total_arr_delta},${month_end_arr}) ;;
  }

  dimension: bin_avg_arr {
    type: string
    sql: ${TABLE}."BIN_AVG_ARR" ;;
  }

  measure: churn {
    type: sum
    value_format: "$#,##0;($#,##0)"
    sql: ${TABLE}."CHURN" ;;
  }

  measure: cnt_churned {
    type: sum
    sql: ${TABLE}."CNT_CHURNED" ;;
  }

  measure: cnt_contract {
    type: sum
    sql: ${TABLE}."CNT_CONTRACT" ;;
  }

  dimension: cnt_delta {
    type: number
    sql: ${TABLE}."CNT_DELTA" ;;
  }

  measure: total_cnt_delta {
    type: sum
    sql: ${cnt_delta} ;;
  }

  measure: pcnt_cnt_delta {
    type: number
    value_format: "0.00%;(0.00%)"
    sql: div0(${total_cnt_delta},${total_active_cnt}) ;;
  }

  measure: cnt_expand {
    type: sum
    sql: ${TABLE}."CNT_EXPAND" ;;
  }

  measure: cnt_new {
    type: sum
    sql: ${TABLE}."CNT_NEW" ;;
  }

  measure: cnt_resurrect {
    type: sum
    sql: ${TABLE}."CNT_RESURRECT" ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension: cohort_month {
    type: string
    sql: ${TABLE}."COHORT_MONTH"::varchar ;;
  }

  dimension: cohort_qtr_no {
    type: number
    sql: ${TABLE}."COHORT_QTR_NO" ;;
  }

  dimension: cohort_yr {
    type: string
    sql: ${TABLE}."COHORT_YR"::varchar ;;
  }

  dimension: company_size {
    type: string
    sql: ${TABLE}."COMPANY_SIZE" ;;
  }

  dimension: company_type {
    type: string
    sql: ${TABLE}."COMPANY_TYPE" ;;
  }

  measure: contract {
    type: sum
    sql: ${TABLE}."CONTRACT" ;;
  }

  dimension: cust_type {
    type: string
    sql: ${TABLE}."CUST_TYPE" ;;
  }

  measure: expand {
    type: sum
    value_format: "$#,##0;($#,##0)"
    sql: ${TABLE}."EXPAND" ;;
  }

  dimension: fiscal_yearno {
    type: number
    sql: ${TABLE}."FISCAL_YEARNO" ;;
  }

  dimension: fiscalyr {
    type: string
    sql: ${TABLE}."FISCALYR"::varchar ;;
  }

  dimension: geo {
    type: string
    sql: ${TABLE}."GEO" ;;
  }

  dimension: industry {
    type: string
    sql: ${TABLE}."INDUSTRY" ;;
  }

  measure: new {
    type: sum
    value_format: "$#,##0;($#,##0)"
    sql: ${TABLE}."NEW" ;;
  }

  dimension: product {
    type: string
    sql: ${TABLE}."PRODUCT" ;;
  }

  dimension: quarter_end {
    type: number
    sql: ${TABLE}."QUARTER_END" ;;
  }

  dimension: report_mo {
    type: string
    sql: ${TABLE}."REPORT_MO"::varchar ;;
  }

  dimension: resurrect {
    type: number
    value_format: "$#,##0;($#,##0)"
    sql: ${TABLE}."RESURRECT" ;;
  }

  measure: count {
    type: count
    drill_fields: [account_name]
  }
}
