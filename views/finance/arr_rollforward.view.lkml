# The name of this view in Looker is "Arr Rollforward"
view: arr_rollforward {

  sql_table_name: "FINANCE"."ARR_ROLLFORWARD"
    ;;

  dimension: cohort {
    description: "Calendar month of when a new customer signed up"
    type: string
    sql: ${TABLE}."COHORT_MONTH" ;;
  }

  dimension: cohort_fiscal_quarter {
    description: "Fiscal quarter of when a new customer signed up"
    type: string
    sql: ${TABLE}."COHORT_FISCAL_QUARTER" ;;
  }

  dimension: cohort_fiscal_year {
    description: "Fiscal year of when a new customer signed up"
    type: string
    drill_fields: [cohort_fiscal_quarter, cohort,account_name]
    sql: ${TABLE}."COHORT_FISCAL_YEAR" ;;
  }

  dimension: report_month {
    description: "Financial month for transactions"
    type: date
    drill_fields: [account_name,account_owner,opportunity_owner,tier,cohort,geo,industry]
    sql: ${TABLE}."REPORT_MONTH" ;;
  }

  dimension: fiscal_quarter {
    description: "Financial quarter for transactions"
    type: date
    drill_fields: [account_name,account_owner,opportunity_owner,tier,cohort,geo,industry]
    sql: ${TABLE}."FISCAL_QUARTER" ;;
  }

  dimension: fiscal_year {
    description: "Financial year for transactions"
    type: date
    drill_fields: [fiscal_quarter, report_month,account_name,account_owner,opportunity_owner,tier,cohort,geo,industry]
    sql: ${TABLE}."FISCAL_YEAR" ;;
  }

  dimension: usage_type {
    description: "Platform usage as DevOps or SecureMessaging as described by Finance"
    type: string
    sql: ${TABLE}."CUSTOMER_USAGE" ;;
  }

  dimension: company_type {
    description: "Company size as defined by sales"
    type: string
    sql: ${TABLE}."co_type" ;;
  }

  dimension: industry {
    description: "Industry as categorized by sales"
    type: string
    sql: ${TABLE}."INDUSTRY" ;;
  }

  dimension: account_id {
    description: "SFID at account level"
    primary_key: yes
    type: string
    sql: ${TABLE}."ACCOUNT_ID" ;;
  }

  dimension: tier {
    type: string
    sql: ${TABLE}."TIER" ;;
  }

  dimension: geo {
    type: string
    sql: ${TABLE}."GEOGRAPHY" ;;
  }

  dimension: account_name {
    type: string
    sql: ${TABLE}."ACCOUNT_NAME" ;;
  }

  dimension: account_owner {
    type: string
    drill_fields: [usage_type,tier,account_name]
    sql: ${TABLE}."ACCOUNT_OWNER" ;;
  }

  dimension: opportunity_owner {
    type: string
    drill_fields: [usage_type,tier,account_name]
    sql: ${TABLE}."OPPORTUNITY_OWNER" ;;
  }


  dimension: FISCAL_MO_NO {
    description: "Fiscal months after new customers have signed up"
    type: string
    drill_fields: [account_name]
    sql: ${TABLE}."FISCAL_MONTH_NO" ;;
  }

  dimension: FISCAL_QTR_NO {
    description: "Fiscal quarters after new customers have signed up"
    type: string
    drill_fields: [FISCAL_MO_NO,account_name]
    sql: ${TABLE}."FISCAL_QUARTER_NO" ;;
  }

  dimension: FISCAL_YR_NO {
    description: "Fiscal years after new customers have signed up"
    type: string
    drill_fields: [FISCAL_QTR_NO, account_name]
    sql: ${TABLE}."FISCAL_YEAR_NO" ;;
  }

  dimension: TRANSACT_NO {
    description: "Transaction counter made by customer after signing up"
    type: string
    drill_fields: [account_name]
    sql: ${TABLE}."TRANS_NO" ;;
  }

  dimension: active_customer {
    type: number
    sql: ${TABLE}."CNT_ACTIVE_CUSTOMER" ;;
  }

  dimension: license_beg {
    type: date
    sql: ${TABLE}."LICENSE_BEG" ;;
  }

  dimension: license_end {
    type: date
    sql: ${TABLE}."LICENSE_END" ;;
  }

  dimension: opportunity_tcv {
    description: "Total contract value of an opportunity over committed period"
    type: number
    value_format: "$#,##0"
    sql: ${TABLE}."TCV" ;;
  }

  dimension: opportunity_arr {
    description: "Calculated ARR from TCV based on TCV/Days x 360"
    type: number
    value_format: "$#,##0"
    sql: ${TABLE}."ARR" ;;
  }



  dimension: expiring_arr {
    description: "Expiring value of arr based on original won ARR amount on day after license end"
    type: number
    value_format: "$#,##0"
    sql: ${TABLE}."EXPIRE" ;;
  }

  dimension: arr_delta {
    description: "ARR change by report month.  Use this field as a cumulative number for ARR outstanding"
    type: number
    value_format: "$#,##0"
    sql: ${TABLE}."ARR_DELTA" ;;
  }

  dimension: beg_arr {
    description: "Beginning ARR at the start of a reporting month at account level. Do not sum to report portfolio level.  Use cumulative ARR Delta instead"
    type: number
    value_format: "$#,##0"
    sql: ${TABLE}."BEG_ARR" ;;
  }

  dimension: end_arr {
    description: "Ending ARR at the end of a reporting month at account level.  Do not sum to report porfolio level.  Use cumulative ARR Delta instead"
    type: number
    value_format: "$#,##0"
    sql: ${TABLE}."END_ARR" ;;
  }

  dimension: new_arr {
    type: number
    value_format: "$#,##0"
    sql: ${TABLE}."NEW_ARR" ;;
  }


  # measures

  measure: total_arr {
    description: "Sum of ARR contracted during the reporting period"
    type: sum
    value_format: "$#,##0"
    sql: ${TABLE}."ARR" ;;
  }

  measure: total_tcv {
    description: "Sum of TCV contracted during the reporting period"
    type: sum
    value_format: "$#,##0"
    sql: ${TABLE}."TCV" ;;
  }
  measure: total_arr_change {
    description: "Sum of ARR change during the reporting period including new churn expansion and contraction"
    type: sum
    value_format: "$#,##0"
    sql: ${TABLE}."ARR_DELTA" ;;
  }

  measure: total_new {
    description: "New ARR signed during the reporting period"
    type: sum
    value_format: "$#,##0"
    sql: ${TABLE}."NEW_ARR" ;;
  }

  measure: total_resurrect {
    description: "ARR from resurrected customers where previous month's ARR balance was zero"
    type: sum
    value_format: "$#,##0"
    sql: ${TABLE}."RESURRECT_ARR" ;;
  }
  measure: total_expansion {
    description: "ARR expansion during period as the total of account, contract and renewal expansion"
    type: sum
    value_format: "$#,##0"
    sql: ${TABLE}."TOTAL_EXPANSION" ;;
  }
  measure: total_contraction {
    description: "ARR contraction that do not result to zero ARR at end of reporting month"
    type: sum
    value_format: "$#,##0"
    sql: ${TABLE}."CONTRACTION" ;;
  }
  measure: total_churn {
    description: "ARR contraction that results to zero ARR at the end of reporting month"
    type: sum
    value_format: "$#,##0"
    sql: ${TABLE}."CHURN" ;;
  }
  measure: total_expire {
    description: "ARR expiration based on license end date + 1 day of previously closed and won opportunities at original amount"
    type: sum
    value_format: "$#,##0"
    sql: ${TABLE}."EXPIRE" ;;
  }
  measure:  cnt_new {
    type: sum
    sql: ${TABLE}."CNT_NEW_ACCOUNT" ;;
  }

  measure:  cnt_resurrect {
    type: sum
    sql: ${TABLE}."CNT_RESURRECT" ;;
  }

  measure:  cnt_churn {
    type: sum
    sql: ${TABLE}."CNT_CHURN" ;;
  }

  measure:  cnt_change {
    type: sum
    sql: ${TABLE}."CNT_CHANGE" ;;
  }

  measure:  cnt_expand {
    type: sum
    sql: ${TABLE}."CNT_TOTAL_EXPAND" ;;
  }

  measure:  cnt_contraction {
    type: sum
    sql: ${TABLE}."CNT_CONTRACTION" ;;
  }


}
