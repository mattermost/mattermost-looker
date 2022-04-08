# The name of this view in Looker is "Arr Rollforward"
view: arr_rollforward {

  sql_table_name: "FINANCE"."ARR_ROLLFORWARD"
    ;;


  dimension: account_expand {
    type: number
    sql: ${TABLE}."ACCOUNT_EXPAND" ;;
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

  dimension: active_customer {
    type: number
    sql: ${TABLE}."ACTIVE_CUSTOMER" ;;
  }

  dimension: arr_delta {
    type: number
    sql: ${TABLE}."ARR_DELTA" ;;
  }


  # measures


  measure: total_arr_delta {
    type: sum
    sql: ${arr_delta} ;;
  }

  measure: average_arr_delta {
    type: average
    sql: ${arr_delta} ;;
  }

  dimension: beg_arr {
    type: number
    sql: ${TABLE}."BEG_ARR" ;;
  }

  dimension: check_2_amt {
    type: number
    sql: ${TABLE}."CHECK_2_AMT" ;;
  }

  dimension: check_amt {
    type: number
    sql: ${TABLE}."CHECK_AMT" ;;
  }

  dimension: churn {
    type: number
    sql: ${TABLE}."CHURN" ;;
  }

  dimension: contract_expand {
    type: number
    sql: ${TABLE}."CONTRACT_EXPAND" ;;
  }

  dimension: contraction {
    type: number
    sql: ${TABLE}."CONTRACTION" ;;
  }

  dimension: end_arr {
    type: number
    sql: ${TABLE}."END_ARR" ;;
  }

  dimension: new_arr {
    type: number
    sql: ${TABLE}."NEW_ARR" ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: refresh {
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
    sql: ${TABLE}."REFRESH_DATE" ;;
  }

  dimension: renewal_expand {
    type: number
    sql: ${TABLE}."RENEWAL_EXPAND" ;;
  }

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

  dimension: resurrect_arr {
    type: number
    sql: ${TABLE}."RESURRECT_ARR" ;;
  }

  dimension: trans_no {
    type: number
    sql: ${TABLE}."TRANS_NO" ;;
  }

  measure: count {
    type: count
    drill_fields: [account_name]
  }

  measure: begin_arr {
    type: min
    sql: ${beg_arr} ;;
    drill_fields: [account_name]
  }

  measure: max_end_arr {
    type: max
    sql: ${end_arr} ;;
    drill_fields: [account_name]
  }

  measure: arr_change {
    type: sum
    sql: ${arr_delta} ;;
    drill_fields: [account_name]
  }

  measure: resurrect {
    type: sum
    sql: ${resurrect_arr} ;;
    drill_fields: [account_name]
  }

  measure: new {
    type: sum
    sql: ${new_arr} ;;
    drill_fields: [account_name]
  }

  measure: renewal_expansion {
    type: sum
    sql: ${renewal_expand} ;;
    drill_fields: [account_name]
  }

  measure: renewal_churn {
    type: sum
    sql: ${churn} ;;
    drill_fields: [account_name]
  }

  measure: renewal_contraction {
    type: sum
    sql: ${contraction} ;;
    drill_fields: [account_name]
  }

  measure: expansion_contract {
    type: sum
    sql: ${contract_expand} ;;
    drill_fields: [account_name]
  }

  measure: expansion_account {
    type: sum
    sql: ${account_expand} ;;
    drill_fields: [account_name]
  }


}
