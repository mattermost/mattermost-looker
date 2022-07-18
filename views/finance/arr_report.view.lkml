# The name of this view in Looker is "Arr Report"
view: arr_report {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "FINANCE"."ARR_REPORT"
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Arr Change" in Explore.

  dimension: arr_change {
    type: number
    value_format: "$#,##0;($#,##0)"
    sql: ${TABLE}."ARR_CHANGE" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_arr_change {
    type: sum
    value_format: "$#,##0;($#,##0)"
    sql: ${arr_change} ;;
  }

  measure: average_arr_change {
    type: average
    value_format: "$#,##0;($#,##0)"
    sql: ${arr_change} ;;
  }

  dimension: arr_expired {
    type: number
    value_format: "$#,##0;($#,##0)"
    sql: ${TABLE}."ARR_EXPIRED" ;;
  }

  dimension: arr_signed {
    type: number
    value_format: "$#,##0;($#,##0)"
    sql: ${TABLE}."ARR_SIGNED" ;;
  }

  dimension: avg_churn {
    type: number
    value_format: "$#,##0;($#,##0)"
    sql: ${TABLE}."AVG_CHURN" ;;
  }

  dimension: avg_contract {
    type: number
    value_format: "$#,##0;($#,##0)"
    sql: ${TABLE}."AVG_CONTRACT" ;;
  }

  dimension: avg_expand {
    type: number
    value_format: "$#,##0;($#,##0)"
    sql: ${TABLE}."AVG_EXPAND" ;;
  }

  dimension: avg_new {
    type: number
    value_format: "$#,##0;($#,##0)"
    sql: ${TABLE}."AVG_NEW" ;;
  }

  dimension: beg_customers {
    type: number
    sql: ${TABLE}."BEG_CUSTOMERS" ;;
  }

  dimension: change_cnt {
    type: number
    sql: ${TABLE}."CHANGE_CNT" ;;
  }

  dimension: churn_cnt {
    type: number
    sql: ${TABLE}."CHURN_CNT" ;;
  }

  dimension: churn_rate {
    type: number
    value_format: "0.0%"
    sql: ${TABLE}."CHURN_RATE" ;;
  }

  dimension: churned {
    type: number
    value_format: "$#,##0;($#,##0)"
    sql: ${TABLE}."CHURNED" ;;
  }

  dimension: contract_cnt {
    type: number
    sql: ${TABLE}."CONTRACT_CNT" ;;
  }

  dimension: contracted {
    type: number
    value_format: "$#,##0;($#,##0)"
    sql: ${TABLE}."CONTRACTED" ;;
  }

  dimension: end_arr {
    type: number
    value_format: "$#,##0;($#,##0)"
    sql: ${TABLE}."END_ARR" ;;
  }

  dimension: end_customers {
    type: number
    sql: ${TABLE}."END_CUSTOMERS" ;;
  }

  dimension: expand_cnt {
    type: number
    sql: ${TABLE}."EXPAND_CNT" ;;
  }

  dimension: expanded {
    type: number
    value_format: "$#,##0;($#,##0)"
    sql: ${TABLE}."EXPANDED" ;;
  }

  dimension: expire_cnt {
    type: number
    sql: ${TABLE}."EXPIRE_CNT" ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: fiscal_year {
    type: time
    timeframes: [
      raw,
      date,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."FISCAL_YEAR" ;;
  }

  dimension: new {
    type: number
    value_format: "$#,##0;($#,##0)"
    sql: ${TABLE}."NEW" ;;
  }

  dimension: new_cnt {
    type: number
    sql: ${TABLE}."NEW_CNT" ;;
  }

  dimension: renew_cnt {
    type: number
    sql: ${TABLE}."RENEW_CNT" ;;
  }

  dimension: renew_rate {
    type: number
    value_format: "0.0%"
    sql: ${TABLE}."RENEW_RATE" ;;
  }

  dimension: renewed {
    type: number
    value_format: "$#,##0;($#,##0)"
    sql: ${TABLE}."RENEWED" ;;
  }

  dimension_group: report_month {
    type: time
    timeframes: [
      raw,
      date,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."REPORT_MONTH" ;;
  }

  dimension: resurrect_cnt {
    type: number
    sql: ${TABLE}."RESURRECT_CNT" ;;
  }

  dimension: resurrected {
    type: number
    value_format: "$#,##0;($#,##0)"
    sql: ${TABLE}."RESURRECTED" ;;
  }

  dimension: tcv_signed {
    type: number
    value_format: "$#,##0;($#,##0)"
    sql: ${TABLE}."TCV_SIGNED" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
