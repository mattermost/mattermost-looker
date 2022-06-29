# The name of this view in Looker is "Arr Transactions"
view: arr_transactions {
  sql_table_name: "FINANCE"."ARR_TRANSACTIONS"

    ;;


  # Dates and timestamps


  dimension_group: report_month {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."REPORT_MONTH" ;;
  }


  dimension_group: account_start {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."ACCOUNT_START" ;;
  }

  dimension_group: closing {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."CLOSING_DATE" ;;
  }

  dimension_group: license_end {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."LICENSE_END_DATE" ;;
  }

  dimension_group: license_start {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."LICENSE_START_DATE" ;;
  }

  dimension_group: max_license {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."MAX_LICENSE" ;;
  }



# dimensions

  dimension: account_id {
    primary_key:yes
    type: string
    sql: ${TABLE}."ACCOUNT_ID" ;;
  }

  dimension: account_name {
    type: string
    sql: ${TABLE}."ACCOUNT_NAME" ;;
  }

  dimension: account_owner {
    type: string
    sql: ${TABLE}."ACCOUNT_OWNER" ;;
  }

  dimension: opportunity_id {
    type: string
    sql: ${TABLE}."OPPORTUNITY_ID" ;;
  }

  dimension: parent_id {
    type: string
    sql: ${TABLE}."PARENT_ID" ;;
  }

  dimension: parent_name {
    type: string
    sql: ${TABLE}."PARENT_NAME" ;;
  }

  dimension: accountsource {
    type: string
    sql: ${TABLE}."ACCOUNTSOURCE" ;;
  }

  dimension: arr_change {
    type: number
    value_format: "$#,##0"
    description: "Per opportunity id the net delta in ARR"
    sql: ${TABLE}."ARR_CHANGE" ;;
  }

  dimension: billing_amt {
    type: number
    value_format: "$#,##0"
    sql: ${TABLE}."BILLING_AMT" ;;
  }



  dimension: company_type {
    type: string
    sql: ${TABLE}."COMPANY_TYPE" ;;
  }

  dimension: account_expansion {
    type:  number
    value_format: "$#,##0"
    sql:  ${TABLE}."ACCOUNT_EXPANSION" ;;
  }

  dimension: contract_expansion {
    type: number
    value_format: "$#,##0"
    sql: ${TABLE}."CONTRACT_EXPANSION" ;;
  }

  dimension: cosize {
    type: string
    sql: ${TABLE}."COSIZE" ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}."COUNTRY" ;;
  }

  dimension: current_seats {
    type: number
    sql: ${TABLE}."CURRENT_SEATS" ;;
  }

  dimension: customer_tier {
    type: string
    sql: ${TABLE}."CUSTOMER_TIER" ;;
  }

  dimension_group: date_refreshed {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."DATE_REFRESHED" ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}."DESCRIPTION" ;;
  }

  dimension: ending_arr {
    type: number
    value_format: "$#,##0"
    sql: ${TABLE}."ENDING_ARR" ;;
  }

  dimension: expire_arr {
    type: number
    value_format: "$#,##0"
    sql: ${TABLE}."EXPIRE_ARR" ;;
  }

  dimension: geo {
    type: string
    sql: ${TABLE}."GEO" ;;
  }

  dimension: government {
    type: yesno
    sql: ${TABLE}."GOVERNMENT" ;;
  }

  dimension: health_score {
    type: number
    sql: ${TABLE}."HEALTH_SCORE" ;;
  }

  dimension: industry {
    type: string
    sql: ${TABLE}."INDUSTRY" ;;
  }

  dimension: is_won {
    type: yesno
    sql: ${TABLE}."IS_WON" ;;
  }

  dimension: license_active_calc {
    type: yesno
    sql: ${TABLE}."LICENSE_ACTIVE_CALC" ;;
  }

  dimension: license_activesf {
    type: yesno
    sql: ${TABLE}."LICENSE_ACTIVESF" ;;
  }


  dimension: new_arr {
    type: number
    value_format: "$#,##0"
    sql: ${TABLE}."NEW_ARR" ;;
  }

  dimension: opp_type {
    type: string
    sql: ${TABLE}."OPP_TYPE" ;;
  }

  dimension: opportunity_arr {
    type: number
    value_format: "$#,##0"
    sql: ${TABLE}."OPPORTUNITY_ARR" ;;
  }



  dimension: reduction_arr {
    type: number
    value_format: "$#,##0"
    sql: ${TABLE}."REDUCTION_ARR" ;;
  }

  dimension: renew_arr {
    type: number
    value_format: "$#,##0"
    sql: ${TABLE}."RENEW_ARR" ;;
  }



  dimension: status_aligned {
    type: yesno
    sql: ${TABLE}."STATUS_ALIGNED" ;;
  }

  dimension: tenure_yr {
    type: number
    sql: ${TABLE}."TENURE_YR" ;;
  }

  dimension: term_months {
    type: number
    sql: ${TABLE}."TERM_MONTHS" ;;
  }

  dimension: trans_no {
    type: number
    sql: ${TABLE}."TRANS_NO" ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}."TYPE" ;;
  }



  # measures


  measure: average_active_arr {
    type: average
    sql: ${TABLE}."ACTIVE_ARR" ;;
  }

  measure: count {
    type: count
    drill_fields: [account_name, parent_name]
  }

  measure: arr_ending {
    type: sum
    value_format: "$#,##0"
    description: "Cumulative ARR change during the period selected"
    sql: ${arr_change} ;;
    drill_fields: [account_name, parent_name]
  }

  measure: tcv_signed  {
    type:  sum
    description: "TCV signed during the period"
    value_format: "$#,##0"
    sql: ${billing_amt} ;;
  }

  measure: arr_signed {
    type: sum
    description: "ARR signed during the period which is calculated from TCV on a 365 day basis"
    value_format: "$#,##0"
    sql: ${opportunity_arr} ;;
  }

  measure: lifetime_billed {
    type: sum
    value_format: "$#,##0"
    sql: ${billing_amt} ;;
    drill_fields: [account_name, parent_name]
  }

  measure: years_tenure {
    type: max
    sql: ${tenure_yr} ;;
    drill_fields: [account_name, parent_name]
  }

  measure: health_sc {
    type: average
    sql: ${health_score} ;;
    drill_fields: [account_name, parent_name]
  }

  measure: newly_signed_arr {
    type: sum
    value_format: "$#,##0"
    sql: ${new_arr} ;;
  }

  measure: expired_arr {
    type: sum
    value_format: "$#,##0"
    sql: ${expire_arr};;
  }

  measure: renewed_arr {
    type: sum
    value_format: "$#,##0"
    sql: ${renew_arr} ;;
  }
}
