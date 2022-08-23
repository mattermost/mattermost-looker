view: arr_expiry {
  derived_table: {
    sql: select
          fiscal_year as fiscal_yr
          ,fiscal_quarter as fiscal_qtr
          ,report_month as report_mo
          ,parent_id
          ,parent_name
          ,account_id
          ,account_name
          ,product
          ,account_owner
          ,country
          ,company_type
          ,geo
          ,customer_tier as tier
          ,cosize
          ,industry
          ,sum(expire_arr) as expired_arr
          ,sum(opportunity_arr) as closed_won
          ,iff(sum(opportunity_arr) + expired_arr> 0, expired_arr*-1,sum(opportunity_arr)) as renewed_arr
          ,iff(sum(opportunity_arr)>abs(expired_arr),sum(opportunity_arr)+expired_arr,0) as expansion
          ,iff(renewed_arr*-1>expired_arr,expired_arr + renewed_arr,0) as contraction
          ,round(div0(renewed_arr,expired_arr)*-1,2) as renewal_rate
          ,max(license_start_date) as renewal_start
          ,max(closing_date) as close_date
          ,datediff('day',renewal_start,close_date) as days_late
      from analytics.finance.arr_transactions
      group by 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15
      order by report_mo asc, parent_name asc, account_name asc
 ;;
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: fiscal_yr {
    type: string
    sql: ${TABLE}."FISCAL_YR"::varchar ;;
  }

  dimension: fiscal_qtr {
    type: string
    sql: ${TABLE}."FISCAL_QTR"::varchar ;;
  }

  dimension: report_mo {
    type: string
    sql: ${TABLE}."REPORT_MO"::varchar ;;
  }

  dimension: parent_id {
    type: string
    sql: ${TABLE}."PARENT_ID" ;;
  }

  dimension: parent_name {
    type: string
    sql: ${TABLE}."PARENT_NAME" ;;
  }

  dimension: account_id {
    type: string
    sql: ${TABLE}."ACCOUNT_ID" ;;
  }

  dimension: account_name {
    type: string
    sql: ${TABLE}."ACCOUNT_NAME" ;;
  }

  dimension: product {
    type: string
    sql: ${TABLE}."PRODUCT" ;;
  }

  dimension: account_owner {
    type: string
    sql: ${TABLE}."ACCOUNT_OWNER" ;;
  }

  dimension: country {
    type: string
    sql: ${TABLE}."COUNTRY" ;;
  }

  dimension: company_type {
    type: string
    sql: ${TABLE}."COMPANY_TYPE" ;;
  }

  dimension: geo {
    type: string
    sql: ${TABLE}."GEO" ;;
  }

  dimension: industry {
    type: string
    sql: ${TABLE}."INDUSTRY" ;;
  }

  dimension: tier {
    type: string
    sql: ${TABLE}."TIER" ;;
  }

  dimension: cosize {
    type: string
    sql: ${TABLE}."COSIZE" ;;
  }

  measure: expired_arr {
    type: sum
    value_format: "$#,##0;($#,##0)"
    description: "Original amount signed for that is expiring/expired"
    sql: ${TABLE}."EXPIRED_ARR" ;;
  }

  measure: closed_won {
    type: sum
    value_format: "$#,##0;($#,##0)"
    description: "Opportunity won in the same period of renewal"
    sql: ${TABLE}."CLOSED_WON" ;;
  }

  measure: renewed_arr {
    type: sum
    value_format: "$#,##0;($#,##0)"
    description: "The lower of closed won opportunity or original amount expiring"
    sql: ${TABLE}."RENEWED_ARR" ;;
  }

  measure: renewal_expansion {
    type: sum
    value_format: "$#,##0;($#,##0)"
    description: "Expansion concurrent with renewal"
    sql: ${TABLE}."EXPANSION" ;;
  }

  measure: renewal_contraction {
    type: sum
    value_format: "$#,##0;($#,##0)"
    description: "Contraction concurrent with renewal"
    sql: ${TABLE}."CONTRACTION" ;;
  }

  dimension: account_renewal {
    type: number
    description: "Renewal rate of the transaction"
    sql: ${TABLE}."RENEWAL_RATE" ;;
  }

  measure:  period_renewal_rate {
    type: number
    value_format: "0.00%"
    sql: div0(SUM(${TABLE}."RENEWED_ARR"),SUM(${TABLE}."EXPIRED_ARR"))*-1  ;;
  }

  dimension: renewal_start {
    type: date
    sql: ${TABLE}."RENEWAL_START" ;;
  }

  dimension: close_date {
    type: date
    sql: ${TABLE}."CLOSE_DATE" ;;
  }

  measure: days_late {
    type: average
    value_format: "0"
    sql: ${TABLE}."DAYS_LATE" ;;
  }

  set: detail {
    fields: [
      fiscal_yr,
      fiscal_qtr,
      report_mo,
      parent_id,
      parent_name,
      account_id,
      account_name,
      product,
      account_owner,
      country,
      company_type,
      geo,
      tier,
      cosize,
      expired_arr,
      closed_won,
      renewed_arr,
      renewal_expansion,
      renewal_contraction,
      period_renewal_rate,
      renewal_start,
      close_date,
      days_late
    ]
  }

}
