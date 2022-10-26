# The name of this view in Looker is "Arr Ltv"
view: arr_ltv {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "FINANCE"."ARR_LTV"
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Avg Arr" in Explore.

  measure: avg_arr {
    type: average
    description: "Ending ARR $ divided by Ending Customers of the same period for a particular ARR BIN"
    value_format: "$#,##0;($#,##0)"
    sql: ${TABLE}."AVG_ARR" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_avg_arr {
    type: number
    description: "Aggregate ARR for Multiple Bins Selected"
    value_format: "$#,##0;($#,##0)"
    sql: DIV0(${TABLE}."END_ARR",${TABLE}."END_CUSTOMERS") ;;
  }

  dimension: bin_avg_arr {
    type: string
    sql: ${TABLE}."BIN_AVG_ARR" ;;
  }

  measure: retained_ltv_arr {
    type: average
    description: "Ending ARR / Ending Customers x retention rate for a particular ARR BIN"
    value_format: "$#,##0;($#,##0)"
    sql: ${TABLE}."RETAINED_LTV_ARR" ;;
  }

  measure: annual_ltv_cashflow {
    type: sum
    description: "Retained LTV ARR x 0.97 contribution margin for particular ARR BIN"
    value_format: "$#,##0;($#,##0)"
    sql: ${TABLE}."CMARGIN_LTV_CASHFLOW" ;;
  }


  measure: cum_ltv {
    type: average
    value_format: "$#,##0;($#,##0)"
    sql: ${TABLE}."CUM_LTV" ;;
  }



  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension: cohort_yr {
    type: string
    sql: ${TABLE}."COHORT_YR"::varchar ;;
  }



  measure: cust_retention {
    type: average
    value_format: "0.00%"
    sql: ${TABLE}."CUST_RETENTION" ;;
  }

  measure: end_arr {
    type: sum
    sql: ${TABLE}."END_ARR" ;;
  }

  measure: end_customers {
    type: sum
    sql: ${TABLE}."END_CUSTOMERS" ;;
  }

  measure: expand_rate {
    type: average
    value_format: "0.00%"
    sql: ${TABLE}."EXPAND_RATE" ;;
  }

  dimension: fiscal_qtr {
    type: string
    sql: ${TABLE}."FISCAL_QTR"::date ;;
  }

  dimension: month_after {
    type: number
    sql: ${TABLE}."MONTH_AFTER" ;;
  }

  measure: ndr_pcnt {
    type: average
    value_format: "0.00%"
    sql: ${TABLE}."NDR_PCNT" ;;
  }



  dimension: unique_key {
    type: string
    sql: ${TABLE}."UNIQUE_KEY" ;;
  }

  dimension: year_end {
    type: yesno
    sql: ${TABLE}."YEAR_END" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
