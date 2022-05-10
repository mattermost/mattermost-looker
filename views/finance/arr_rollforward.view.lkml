# The name of this view in Looker is "Arr Rollforward"
view: arr_rollforward {

  sql_table_name: "FINANCE"."ARR_ROLLFORWARD"
    ;;

  dimension: report_month {
    type: date
    datatype: yyyymmdd
    drill_fields: [account_name]
    sql: ${TABLE}."REPORT_MONTH" ;;
  }

  dimension: fiscal_quarter {
    datatype: yyyymmdd
    type: date
    sql: ${TABLE}."FISCAL_QUARTER" ;;
  }

  dimension: fiscal_year {
    type: date
    datatype: yyyymmdd
    drill_fields: [fiscal_quarter, report_month]
    sql: ${TABLE}."FISCAL_YEAR" ;;
  }

  dimension: account_id {
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

  dimension: opportunity_owner {
    type: string
    sql: ${TABLE}."OPPORTUNITY_OWNER" ;;
  }

  dimension: LTV_YR {
    type: string
    sql: ${TABLE}."FISCAL_YEAR_NO" ;;
  }

  dimension: TRANSACT_NO {
    type: string
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
    type: number
    sql: ${TABLE}."TCV" ;;
  }

  dimension: opportunity_arr {
    type: number
    sql: ${TABLE}."ARR" ;;
  }

  dimension: expiring_arr {
    type: number
    sql: ${TABLE}."EXPIRE" ;;
  }

  dimension: arr_delta {
    type: number
    sql: ${TABLE}."ARR_DELTA" ;;
  }

  dimension: beg_arr {
    type: number
    sql: ${TABLE}."BEG_ARR" ;;
  }

  dimension: end_arr {
    type: number
    sql: ${TABLE}."END_ARR" ;;
  }

  dimension: new_arr {
    type: number
    sql: ${TABLE}."NEW_ARR" ;;
  }


  # measures

  measure: total_tcv {
    type: sum
    sql: ${TABLE}."TCV" ;;
  }
  measure: total_arr_change {
    type: sum
    sql: ${TABLE}."ARR_DELTA" ;;
  }

  measure: total_new {
    type: sum
    sql: ${TABLE}."NEW_ARR" ;;
  }

  measure: total_resurrect {
    type: sum
    sql: ${TABLE}."RESURRECT_ARR" ;;
  }
  measure: total_expansion {
    type: sum
    sql: ${TABLE}."TOTAL_EXPANSION" ;;
  }
  measure: total_contraction {
    type: sum
    sql: ${TABLE}."CONTRACTION" ;;
  }
  measure: total_churn {
    type: sum
    sql: ${TABLE}."CHURN" ;;
  }
  measure: total_expire {
    type: sum
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
