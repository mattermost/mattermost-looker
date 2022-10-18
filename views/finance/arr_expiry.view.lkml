view: arr_expiry {
  derived_table: {
    sql: select
            fiscal_yr
            ,fiscal_qtr
            ,'present' as period_type
            ,report_mo
            ,close_day as closing_date
            ,closing_delay as days_late
            ,parent_id
            ,parent as parent_name
            ,account_id
            ,account_name
            ,(product) as product
            ,(account_owner) as account_owner
            ,(country) as country
            ,(company_type) as company_type
            ,(geo) as geo
            ,(tier) as customer_tier
            ,(company_size) as cosize
            ,(industry) as industry
            ,license_beg as renewal_start
            ,(expire) as expired_arr
            ,(arr) as closed_won
            ,renewed as renewed_arr
            ,(late_renewal) as late_renew
            ,(resurrected) as resurrection
            ,(expanded) as expansion
            ,(contracted) as contraction
            ,(churned) as churn
        from analytics.finance.arr_reporting
        where
            abs(expire)+renewed+late_renewal+resurrected+abs(churned) !=0
            --and account_id = '00136000011cyDyAAI'
            and report_mo <= last_day(date_trunc('month',current_date),'month')

        union

        select
            fiscal_year as fiscal_yr
            ,fiscal_quarter as fiscal_qtr
            ,'future_expiry' as period_type
            ,report_month as report_mo
            ,closing_date
            ,0 as days_late
            ,parent_id
            ,parent_name
            ,account_id
            ,account_name
            ,product
            ,account_owner
            ,country
            ,company_type
            ,geo
            ,customer_tier
            ,cosize
            ,industry
            ,max(license_start_date) as renewal_start
            ,sum(expire_arr) as expired_arr
            ,sum(opportunity_arr) as closed_won
            ,iff(sum(opportunity_arr) + expired_arr> 0, expired_arr*-1,sum(opportunity_arr)) as renewed_arr
            ,sum(0) as late_renew
            ,sum(0) as resurrection
            ,iff(sum(opportunity_arr)>abs(expired_arr) and renewed_arr>0,sum(opportunity_arr)+expired_arr,0) as expansion
            ,iff(renewed_arr*-1>expired_arr and renewed_arr >0,expired_arr + renewed_arr,0) as contraction
            ,0 as churn
        from analytics.finance.arr_transactions
            where report_month > last_day(date_trunc('month',current_date))
        group by 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18
        having expired_arr <0
        order by period_type desc,parent_name asc,account_name asc,report_mo asc
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

  dimension: period_type {
    type: string
    sql: ${TABLE}."PERIOD_TYPE" ;;
  }

  dimension: report_mo {
    type: string
    sql: ${TABLE}."REPORT_MO"::varchar ;;
  }

  dimension: closing_date {
    type: date
    sql: ${TABLE}."CLOSING_DATE" ;;
  }

  measure: days_late {
    type: average
    value_format: "0.0"
    sql: ${TABLE}."DAYS_LATE" ;;
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

  dimension: customer_tier {
    type: string
    sql: ${TABLE}."CUSTOMER_TIER" ;;
  }

  dimension: cosize {
    type: string
    sql: ${TABLE}."COSIZE" ;;
  }

  dimension: industry {
    type: string
    sql: ${TABLE}."INDUSTRY" ;;
  }

  dimension: renewal_start {
    type: date
    sql: ${TABLE}."RENEWAL_START" ;;
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
    description: "On time renewal before expansion and inclusive of "
    sql: ${TABLE}."RENEWED_ARR" ;;
  }

  measure: renewal_rate {
    type: number
    value_format: "0.00%"
    sql: div0((SUM(${TABLE}."RENEWED_ARR")+SUM(${TABLE}."LATE_RENEW")),SUM(${TABLE}."EXPIRED_ARR"))*-1 ;;
  }

  measure: ontime_renewal_rate {
    type: number
    value_format: "0.00%"
    sql: div0((SUM(${TABLE}."RENEWED_ARR")),SUM(${TABLE}."EXPIRED_ARR"))*-1 ;;
  }

  measure:late_renewal_rate {
    type: number
    value_format: "0.00%"
    sql: div0((SUM(${TABLE}."LATE_RENEW")),SUM(${TABLE}."EXPIRED_ARR"))*-1 ;;
  }

  measure: late_renew {
    type: sum
    description: "When renewal occurs after expiry month and <= 90 days after license renew start date"
    value_format: "$#,##0;($#,##0)"
    sql: ${TABLE}."LATE_RENEW" ;;
  }

  measure: resurrection {
    type: sum
    description: "When renewal occurs after expiry month and > 90 days after license renew start date"
    value_format: "$#,##0;($#,##0)"
    sql: ${TABLE}."RESURRECTION" ;;

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

  measure: churn {
    type: sum
    value_format: "$#,##0;($#,##0)"
    description: "Churn when no renewal occurs on expiry month.  Excluding late renewals"
    sql:  ${TABLE}."CHURN" ;;
  }

  measure: net_churn {
    type: number
    value_format: "$#,##0;($#,##0)"
    description: "Churn net of late renewals"
    sql:  ${churn}+${late_renew} ;;
  }






  set: detail {
    fields: [
      fiscal_yr,
      fiscal_qtr,
      report_mo,
      days_late,
      closing_date,
      parent_id,
      parent_name,
      account_id,
      account_name,
      product,
      account_owner,
      country,
      company_type,
      geo,
      customer_tier,
      cosize,
      expired_arr,
      closed_won,
      renewed_arr,
      renewal_expansion,
      renewal_contraction,
      renewal_rate,
      renewal_start,
    ]
  }

}
