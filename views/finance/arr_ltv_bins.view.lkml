view: arr_ltv_bins {

  sql_table_name: "FINANCE"."ARR_LTV_BINS" ;;

  dimension: BIN_AVG_ARR {
     description: "ARR AVG BUCKET SALES SERVE ACCOUNT BELONGS TO"
     type: string
     sql: ${TABLE}.BIN_AVG_ARR ;;
  }

  dimension: FISCAL_QUARTER_NO {
    description: "Subsequent fiscal quarters after account joined"
    type:  number
    sql: ${TABLE}.FISCAL_QUARTER_NO ;;
  }

  dimension: FISCAL_YEAR {
    description: "Subsequent fiscal years after account joined"
    type:  number
    sql: ${TABLE}.FISCAL_YEAR ;;
  }

  measure:  ARR_AVG{
    description: "ARR AVG of the accounts periods after join"
    type:  average
    value_format: "$#,##0"
    sql:  ${TABLE}.ARR_AVG ;;
  }

  measure: EXPANSION_RATE {
    description: "Avg expansion rate of ARR over initial sign-up amount"
    type:  average
    value_format: "0.00%"
    sql: ${TABLE}.NET_EXPANSION ;;
  }

  measure: RETENTION {
    description: "Retention rate based on current outstanding customers over initial number of customers cohort had"
    type:  average
    value_format: "0.00%"
    sql: ${TABLE}.RETENTION ;;
  }

  measure: GROSS_CASH {
    description: "Annual cash flow expected inclusive of expansion/contraction but before churn"
    type:  average
    value_format: "$#,##0"
    sql: ${TABLE}.EXPECTED_CASH ;;
  }

  measure: NET_MARGIN  {
    description: "Net margin after cost of service, assumption supplied by Finance"
    type:  average
    value_format: "0.00%"
    sql: ${TABLE}.NET_MARGIN ;;
  }

  measure: NET_CASH {
    description: "Cash from customer after cost of sales"
    type: average
    value_format: "$#,##0"
    sql: ${TABLE}.NET_CASH ;;
  }

  measure: LTV {
    description: "Cumulative net cash from customer from month customer joined"
    type:  average
    value_format: "$#,##0"
    sql: ${TABLE}.LTV ;;
  }
}
