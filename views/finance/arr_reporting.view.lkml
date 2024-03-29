# The name of this view in Looker is "Arr Reporting"
view: arr_reporting {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "FINANCE"."ARR_REPORTING"
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Above30 Days Expired" in Explore.

  dimension: above30_days_expired {
    type: number
    value_format: "$#,##0;($#,##0)"
    description: "Above 30 days from expiry date without renewal"

    sql: ${TABLE}."ABOVE30DAYS_EXPIRED" ;;
  }

  dimension: child_no {
    description: "Numeric sequence of child account created based on cohort month"
    type:  number
    sql: ${TABLE}."CHILD_NO" ;;
  }

  dimension: account_id {
    type: string
    description: "Child Account ID or Parent ID in the absence of child accounts"
    sql: ${TABLE}."ACCOUNT_ID" ;;
  }

  dimension: account_name {
    type: string
    description: "Child Account Name"
    sql: ${TABLE}."ACCOUNT_NAME" ;;
  }

  dimension: account_owner {
    type: string
    description: "Sales Executive managing the account"
    sql: ${TABLE}."ACCOUNT_OWNER" ;;
  }

  dimension: acct_beg_arr {
    type: number
    value_format: "$#,##0;($#,##0)"
    description: "Beginning arr balance of the child account (account id) for the report month"
    sql: ${TABLE}."ACCT_BEG_ARR" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.


  dimension: acct_end_arr {
    type: number
    description: "Ending arr balance of the child account (account id) for the report month"
    value_format: "$#,##0;($#,##0)"
    sql: ${TABLE}."ACCT_END_ARR" ;;
  }

  measure: active_customers {
    type: sum
    value_format: "#,##0"
    description: "Active paying ARR customers"
    sql: ${TABLE}."ACTIVE_CUSTOMERS" ;;
  }

  measure: opportunity_arr {
    type: sum
    value_format: "$#,##0;($#,##0)"
    description: "Opportunity ARR closed won during the period"
    sql: ${TABLE}."ARR" ;;
  }

  measure: arr_delta {
    type: sum
    value_format: "$#,##0;($#,##0)"
    description: "The net change in ARR during the period"
    drill_fields: [report_mo,account_name,account_id,parent_id,account_owner,opportunity_description,geo,industry,tier,company_type,term,license_beg,license_end,tcv,opportunity_arr,expired,renewed,arr_delta,new,resurrected,expanded,contracted,churned]
    sql: ${TABLE}."ARR_DELTA" ;;
  }



  dimension: average_arr {
    type: number
    description: "Average ARR of a Parent ID from inception"
    value_format: "$#,##0;($#,##0)"
    sql: ${TABLE}."AVERAGE_ARR" ;;
  }

  dimension: bin_avg_arr {
    type: string
    sql: ${TABLE}."BIN_AVG_ARR" ;;
  }

  measure: churned {
    type: sum
    description: "Gross churn before late renewals.  When a renewal did not happen during the month expiry occurred"
    value_format: "$#,##0;($#,##0)"
    drill_fields: [report_mo,account_name,account_id,parent_id,account_owner,opportunity_description,geo,industry,tier,company_type,term,license_beg,license_end,tcv,opportunity_arr,expired,renewed,arr_delta,new,resurrected,expanded,contracted,churned]
    sql: ${TABLE}."CHURNED" ;;
  }

  measure: net_churned {
    type: number
    value_format: "$#,##0;($#,##0)"
    description: "Gross churned less late renewals"
    sql:${churned}+${late_renewal} ;;
  }

  measure: new_booking {
    type:  number
    description: "Gross Booking - On Time Renewals - Late Renewals"
    sql: ${tcv}-coalesce(${renewed},0)-coalesce(${late_renewal},0) ;;
  }

  measure: net_new_booking {
    type: number
    description: "Gross Booking - On Time Renewals - Late Renewals - Churn"
    sql: ${tcv}-${renewed}-${late_renewal}+${churned} ;;
  }

  measure: churned_avg {
    type:  number
    description: "Average churn value"
    value_format: "$#,##0;($#,##0)"
    sql: div0(${churned},${cnt_churned}) ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension: close_day {
    type: date_day_of_month
    datatype: date
    sql: ${TABLE}."CLOSE_DAY" ;;
  }

  dimension: close_date {
      type: date
      datatype: date
      sql: ${TABLE}."CLOSE_DAY" ;;
  }

  measure: closing_delay {
      type: average
      description: "Renewal closing date less license start date"
      sql: ${TABLE}."CLOSING_DELAY" ;;
  }


  measure: cnt_changed {
    type: sum
    value_format: "#,##0;(#,##0)"
    description: "Change in active ARR customer count between periods"
    sql: ${TABLE}."CNT_CHANGED" ;;
  }

  measure: cnt_churned {
    type: sum
    value_format: "#,##0;(#,##0)"
    description: "Gross churn before late renewals. Account ID expiries that resulted to zero ending ARR balance during the period"
    sql: ${TABLE}."CNT_CHURNED" ;;
  }

  measure: cnt_net_churned {
    type: number
    value_format: "#,##0;(#,##0)"
    description: "Gross churn less late renewal"
    sql: ${cnt_churned}-${cnt_late_renewal} ;;
  }

  measure: cnt_contracted {
    type: sum
    value_format: "#,##0;(#,##0)"
    description: "Count of account ids that contracted declined in ARR during the period "
    sql: ${TABLE}."CNT_CONTRACTED" ;;
  }

  measure: cnt_expanded {
    type: sum
    value_format: "#,##0;(#,##0)"
    description: "Count of account ids that expanded in ARR during the period "
    sql: ${TABLE}."CNT_EXPANDED" ;;
  }

  measure: cnt_expired {
    type: sum
    value_format: "#,##0;(#,##0)"
    description: "Count of account ids that had license end date + 1 during the period "
    sql: ${TABLE}."CNT_EXPIRED" ;;
  }

  measure: cnt_late_renewal {
    type: sum
    value_format: "#,##0;(#,##0)"
    description: "Count of renewals that closed after license start date"
    sql: ${TABLE}."CNT_LATE_RENEWAL" ;;
  }

  measure: freq_late_renewal {
    type: number
    value_format: "0.0%"
    description: "Count of late renewals over expiry count"
    sql: div0(${cnt_late_renewal},${cnt_expired})*-1 ;;
  }

  measure: cnt_new {
    type: sum
    value_format: "#,##0;(#,##0)"
    description: "Count of new account ids during the period "
    sql: ${TABLE}."CNT_NEW" ;;
  }

  measure: cnt_renewed {
    type: sum
    value_format: "#,##0;(#,##0)"
    description: "Count of new account ids during the period "
    sql: ${TABLE}."CNT_RENEWED" ;;
  }

  measure: freq_renew_ontime {
    type: number
    value_format: "0.0%"
    description: "Renewed within the month over expiry count"
    sql: div0(${cnt_renewed},${cnt_expired})*-1 ;;
  }

  measure: cnt_resurrected {
    type: sum
    value_format: "#,##0;(#,##0)"
    description: "Count of account ids re-engaging with Mattermost "
    sql: ${TABLE}."CNT_RESURRECTED" ;;
  }

  dimension: cohort_fiscal_qtr {
    type: string
    description: "Fiscal Quarter Account ID first started as a paying customer"
    sql: ${TABLE}."COHORT_FISCAL_QTR"::varchar ;;
  }

  dimension: cohort_fiscal_yr {
    type: string
    description: "Fiscal Year Account ID first started as a paying customer"
    sql: ${TABLE}."COHORT_FISCAL_YR"::varchar ;;
  }

  dimension: cohort_month {
    type: string
    sql: ${TABLE}."COHORT_MONTH"::varchar ;;
  }

  dimension: company_size {
    type: string
    sql: ${TABLE}."COMPANY_SIZE" ;;
  }

  dimension: company_type {
    type: string
    sql: ${TABLE}."COMPANY_TYPE" ;;
  }

  measure: contracted {
    type: sum
    value_format: "$#,##0;($#,##0)"
    description: "Account ID contraction in ARR value"
    drill_fields: [report_mo,account_name,account_id,parent_id,account_owner,opportunity_description,geo,industry,tier,company_type,term,license_beg,license_end,tcv,opportunity_arr,expired,renewed,arr_delta,new,resurrected,expanded,contracted,churned]
    sql: ${TABLE}."CONTRACTED" ;;
  }

  measure: contracted_avg {
    type: number
    value_format: "$#,##0;($#,##0)"
    description: "Average contraction value"
    sql: div0(${contracted},${cnt_contracted}) ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}."COUNTRY" ;;
  }

  measure: expanded {
    type: sum
    value_format: "$#,##0;($#,##0)"
    description: "Account ID expansion in ARR value"
    drill_fields: [report_mo,account_name,account_id,parent_id,account_owner,opportunity_description,geo,industry,tier,company_type,term,license_beg,license_end,tcv,opportunity_arr,expired,renewed,arr_delta,new,resurrected,expanded,contracted,churned]
    sql: ${TABLE}."EXPANDED" ;;
  }

  measure: expanded_avg {
    type: number
    value_format: "$#,##0;($#,##0)"
    description: "Average expansion value"
    sql: div0(${expanded},${cnt_expanded}) ;;
  }

  measure: expired {
    type: sum
    value_format: "$#,##0;($#,##0)"
    description: "Account ID expansion in ARR value"
    drill_fields: [report_mo,account_name,account_id,parent_id,account_owner,opportunity_description,geo,industry,tier,company_type,term,license_beg,license_end,tcv,opportunity_arr,expired,renewed,arr_delta,new,resurrected,expanded,contracted,churned]
    sql: ${TABLE}."EXPIRE" ;;
  }

  measure: expired_avg {
    type: number
    value_format: "$#,##0;($#,##0)"
    description: "Average expired amount"
    sql: div0(${expired},${cnt_expired}) ;;
  }

  dimension: fiscal_month_no {
    type: number
    description: "Fiscal months after account id joined"
    sql: ${TABLE}."FISCAL_MONTH_NO" ;;
  }

  dimension: fiscal_qtr {
    type: string
    description: "Fiscal quarter the closed won opportunity falls under"
    drill_fields: [report_mo,account_name,account_id,parent_id,account_owner,opportunity_description,geo,industry,tier,company_type,term,license_beg,license_end,tcv,opportunity_arr,expired,renewed,arr_delta,new,resurrected,expanded,contracted,churned]
    sql: ${TABLE}."FISCAL_QTR"::varchar ;;
  }

  dimension: fiscal_quarter_no {
    type: number
    description: "No of fiscal quarters since account id joined"
    sql: ${TABLE}."FISCAL_QUARTER_NO" ;;
  }

  dimension: fiscal_year_no {
    type: number
    description: "No of fiscal years since account id joined"
    sql: ${TABLE}."FISCAL_YEAR_NO" ;;
  }

  dimension: fiscal_yr {
    type: string
    description: "Fiscal Yr of the reporting period"
    drill_fields: [report_mo,account_name,account_id,parent_id,account_owner,opportunity_description,geo,industry,tier,company_type,term,license_beg,license_end,tcv,opportunity_arr,expired,renewed,arr_delta,new,resurrected,expanded,contracted,churned]
    sql: ${TABLE}."FISCAL_YR"::varchar ;;
  }

  dimension: geo {
    type: string
    sql: ${TABLE}."GEO" ;;
  }

  dimension: government {
    type: yesno
    sql: ${TABLE}."GOVERNMENT" ;;
  }

  measure: gross_booking {
    type: sum
    drill_fields: [report_mo,account_name,account_id,parent_id,account_owner,opportunity_description,geo,industry,tier,company_type,term,license_beg,license_end,tcv,opportunity_arr,expired,renewed,arr_delta,new,resurrected,expanded,contracted,churned]
    value_format: "$#,##0;($#,##0)"
    sql: ${TABLE}."TCV" ;;
  }

  dimension: health_score {
    type: number
    sql: ${TABLE}."HEALTH_SCORE" ;;
  }

  dimension: industry {
    type: string
    sql: ${TABLE}."INDUSTRY" ;;
  }

  measure: late_renewal {
    type: sum
    value_format: "$#,##0;($#,##0)"
    description: "Value of renewals closed <= 90 days after license start date excluding expansion and contraction"
    drill_fields: [report_mo,account_name,account_id,parent_id,account_owner,opportunity_description,geo,industry,tier,company_type,term,license_beg,license_end,tcv,opportunity_arr,expired,renewed,arr_delta,new,resurrected,late_renewal,expanded,contracted,churned]
    sql: ${TABLE}."LATE_RENEWAL" ;;
  }

  measure: late_renewal_avg {
    type:  number
    description: "Average late renewals"
    value_format: "$#,##0;($#,##0)"
    sql: div0(${late_renewal},${cnt_late_renewal}) ;;
  }


  dimension: license_beg {
    type: date
    convert_tz: no
    datatype: date
    sql: ${TABLE}."LICENSE_BEG" ;;
  }

  dimension: license_end {
    type: date
    datatype: date
    sql: ${TABLE}."LICENSE_END" ;;
  }

  measure: multi_yr {
    type: sum
    description: "Net bookings for term > 12 months.  Negative for < 12 months"
    value_format: "$#,##0;($#,##0)"
    sql: ${TABLE}."MULTI_YR" ;;
  }

  measure: new {
    type: sum
    value_format: "$#,##0;($#,##0)"
    description: "New Account ID ARR"
    drill_fields: [report_mo,account_name,account_id,parent_id,account_owner,opportunity_description,geo,industry,tier,company_type,term,license_beg,license_end,tcv,opportunity_arr,expired,renewed,arr_delta,new,resurrected,expanded,contracted,churned]
    sql: ${TABLE}."NEW" ;;
  }

  measure: new_avg {
    type: number
    value_format: "$#,##0;($#,##0)"
    description: "New Account ID ARR"
    drill_fields: [report_mo,account_name,account_id,parent_id,account_owner,opportunity_description,geo,industry,tier,company_type,term,license_beg,license_end,tcv,opportunity_arr,expired,renewed,arr_delta,new,resurrected,expanded,contracted,churned]
    sql: round(div0(${new},${cnt_new}),0) ;;
  }

  dimension: opportunity_description {
    type: string
    sql: ${TABLE}."OPPORTUNITY_DESCRIPTION" ;;
  }

  dimension: parent_name {
    type: string
    drill_fields: [account_name,child_no,account_id]
    sql: ${TABLE}."PARENT" ;;
  }

  dimension: parent_id {
    type: string
    sql: ${TABLE}."PARENT_ID" ;;
  }

  dimension: plan {
    type: string
    sql: ${TABLE}."PLAN" ;;
  }

  dimension: product {
    type: string
    sql: ${TABLE}."PRODUCT" ;;
  }

  dimension: report_day {
    type: date
    description: "For opportunity closed won, this is the later of close date or license start date.  For expired licenses this is license end date + 1"
    convert_tz: no
    datatype: date
    sql: ${TABLE}."REPORT_DAY" ;;
  }

  dimension: report_mo {
    type: string
    description: "For opportunity closed won, this is the later of close month or license start month.  For expired licenses this is the expiry month"
    drill_fields: [report_mo,account_name,account_id,parent_id,account_owner,opportunity_description,geo,industry,tier,company_type,term,license_beg,license_end,tcv,opportunity_arr,expired,renewed,arr_delta,new,resurrected,expanded,contracted,churned]
    sql: ${TABLE}."REPORT_MO"::varchar ;;
  }

  dimension: report_wk {
    type: string
    drill_fields: [report_mo,account_name,account_id,parent_id,account_owner,opportunity_description,geo,industry,tier,company_type,term,license_beg,license_end,tcv,opportunity_arr,expired,renewed,arr_delta,new,resurrected,expanded,contracted,churned]
    sql: ${TABLE}."REPORT_WK"::varchar ;;
  }

  measure: renewed {
    type: sum
    description: "ARR renewed excluding expansion but reflecting contraction"
    value_format: "$#,##0;($#,##0)"
    drill_fields: [report_mo,account_name,account_id,parent_id,account_owner,opportunity_description,geo,industry,tier,company_type,term,license_beg,license_end,tcv,opportunity_arr,expired,renewed,arr_delta,new,resurrected,expanded,contracted,churned]
    sql: ${TABLE}."RENEWED" ;;
  }

  measure: renewed_avg {
    type: number
    value_format: "$#,##0;($#,##0)"
    sql: div0(${renewed},${cnt_renewed}) ;;
  }

  measure: resurrected {
    type: sum
    value_format: "$#,##0;($#,##0)"
    description: "Account IDs rengaging with Mattermost"
    drill_fields: [report_mo,account_name,account_id,parent_id,account_owner,opportunity_description,geo,industry,tier,company_type,term,license_beg,license_end,tcv,opportunity_arr,expired,renewed,arr_delta,new,resurrected,expanded,contracted,churned]
    sql: ${TABLE}."RESURRECTED" ;;
  }

  measure: resurrected_avg {
    type: number
    value_format: "$#,##0;($#,##0)"
    sql: div0(${resurrected},${cnt_resurrected}) ;;
  }

  measure: tcv {
    type: sum
    value_format: "$#,##0;($#,##0)"
    description: "Total contract value signed with account id during the period"
    drill_fields: [report_mo,account_name,account_id,parent_id,account_owner,opportunity_description,geo,industry,tier,company_type,term,license_beg,license_end,tcv,opportunity_arr,expired,renewed,arr_delta,new,resurrected,expanded,contracted,churned]
    sql: ${TABLE}."TCV" ;;
  }

  measure: tcv_avg {
    type: number
    value_format: "$#,##0;($#,##0)"
    sql: div0(${tcv},${count}) ;;
  }

  dimension: term {
    type: number
    sql: ${TABLE}."TERM" ;;
  }

  dimension: tier {
    type: string
    sql: ${TABLE}."TIER" ;;
  }

  dimension: total_beg_arr {
    type: number
    value_format: "$#,##0;($#,##0)"
    description: "This is the rolling Mattermost beginning ARR balance after each transaction being closed won or lost"
    sql: ${TABLE}."TOTAL_BEG_ARR" ;;
  }

  dimension: total_end_arr {
    type: number
    value_format: "$#,##0;($#,##0)"
    description: "This is the rolling Mattermost ending ARR balance after each transaction being closed won or lost"
    sql: ${TABLE}."TOTAL_END_ARR" ;;
  }

  dimension: trans_no {
    type: number
    sql: ${TABLE}."TRANS_NO" ;;
  }

  dimension: unique_key {
    type: string
    description: "this is the distinct id of each transaction"
    primary_key: yes
    sql: ${TABLE}."UNIQUE_KEY" ;;
  }

  measure: yr1_billing {
    type: sum
    value_format: "$#,##0;($#,##0)"
    description: "Forecasted year 1 billing for opportunity closed won based on 1 year value or actual TCV if less than a year"
    sql: ${TABLE}."YR1_BILLING" ;;
  }

  measure: yr1_billing_avg {
    type: average
    value_format: "$#,##0;($#,##0)"
    sql: ${TABLE}."YR1_BILLING" ;;
  }

  measure: count {
    type: count
    drill_fields: [account_name]
  }
}
