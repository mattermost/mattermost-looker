# The name of this view in Looker is "Contracted Arr Reporting"
view: contracted_arr_reporting {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "FINANCE"."CONTRACTED_ARR_REPORTING"
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Account ID" in Explore.

  dimension: account_id {
    type: string
    description: "SFDC Account Id.  Child Account Id if Parent Id is present"
    sql: ${TABLE}."ACCOUNT_ID" ;;
  }

  dimension: account_name {
    type: string
    description: "Account Name.  Child Account Name if Parent Name is present"
    sql: ${TABLE}."ACCOUNT_NAME" ;;
  }

  dimension: account_owner {
    type: string
    description: "Sales Executive managing the account"
    sql: ${TABLE}."ACCOUNT_OWNER" ;;
  }

  dimension: acct_beg_carr {
    type: number
    value_format: "$#,##0;($#,##0)"
    description: "Value of ARR O/S before current transaction"
    sql: ${TABLE}."ACCT_BEG_CARR" ;;
  }

  dimension: acct_end_carr {
    type: number
    value_format: "$#,##0;($#,##0)"
    description: "Value of ARR O/S after current transaction"
    sql: ${TABLE}."ACCT_END_CARR" ;;
  }

  dimension: arr_delta {
    type: number
    description: "Change in ARR O/S because of the current transaction"
    sql: ${TABLE}."ARR_DELTA" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_arr_delta {
    type: sum
    value_format: "$#,##0;($#,##0)"
    drill_fields: [close_day_date,license_quarter,account_name,arr_delta,account_id,account_owner,parent,tier,bin_avg_arr,tcv,geo,country,government,company_type, industry,license_beg_date,license_end_date,term]
    sql: ${arr_delta} ;;
  }

  dimension: arr_renewed {
    type: number
    description: "ARR value renewed"
    value_format: "$#,##0;($#,##0)"
    sql: ${TABLE}."ARR_RENEWED" ;;
  }

  measure: total_arr_renewed {
    type: sum
    value_format: "$#,##0;($#,##0)"
    drill_fields: [close_day_date,account_name,arr_renewed,account_id,account_owner,parent,tier,bin_avg_arr,tcv,geo,country,government,company_type, industry,license_beg_date,license_end_date,term]
    sql: ${arr_renewed} ;;
  }

  dimension: bin_avg_arr {
    type: string
    description: "Account level categorization by ARR size"
    sql: ${TABLE}."BIN_AVG_ARR" ;;
  }

  dimension: carr {
    type: number
    value_format: "$#,##0;($#,##0)"
    description: "Total contracted annualized recurring revenue"
    sql: ${TABLE}."CARR" ;;
  }

  measure: total_carr {
    type: sum
    value_format: "$#,##0;($#,##0)"
    drill_fields: [close_day_date,account_name,carr,account_id,account_owner,parent,tier,bin_avg_arr,tcv,geo,country,government,company_type, industry,license_beg_date,license_end_date,term]
    sql: ${carr} ;;
  }

  dimension: cfiscal_month_no {
    type: number
    description: "No of months after first opportunity was closed won with the account"
    sql: ${TABLE}."CFISCAL_MONTH_NO" ;;
  }

  dimension: cfiscal_quarter_no {
    type: number
    description: "No of quarters after first opportunity was closed won with the account"
    sql: ${TABLE}."CFISCAL_QUARTER_NO" ;;
  }

  dimension: cfiscal_year_no {
    type: number
    description: "No of fiscal years after first opportunity was closed won with the account"
    sql: ${TABLE}."CFISCAL_YEAR_NO" ;;
  }

  dimension: child_no {
    type: number
    description: "Child no by order of first closing date related to a parent id"
    sql: ${TABLE}."CHILD_NO" ;;
  }

  dimension: churned {
    type: number
    value_format: "$#,##0;($#,##0)"
    sql: ${TABLE}."CHURNED" ;;
  }

  measure: total_churned {
    type: sum
    value_format: "$#,##0;($#,##0)"
    drill_fields: [close_day_date,account_name,churned,account_id,account_owner,parent,tier,bin_avg_arr,tcv,geo,country,government,company_type, industry,license_beg_date,license_end_date,term]
    sql: ${churned} ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: close_day {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."CLOSE_DAY" ;;
  }

  dimension: fiscal_qtr {
    type: string
    description: "Fiscal Quarter when opporunity was closed"
    sql: ${TABLE}."CLOSING_FISCAL_QTR" ;;
  }

  dimension: fiscal_yr {
    type: string
    description: "Fiscal Quarter when opporunity was closed"
    sql: ${TABLE}."CLOSING_FISCAL_YR" ;;
  }

  dimension: closing_mo {
    type: string
    sql: ${TABLE}."CLOSING_MO" ;;
  }


  dimension: cmulti_yr {
    type: number
    value_format: "$#,##0;($#,##0)"
    description: "Value of TCV exceeding the first year by close day"
    sql: ${TABLE}."CMULTI_YR" ;;
  }

  measure: total_cmulti_yr {
    type: sum
    value_format: "$#,##0;($#,##0)"
    drill_fields: [close_day_date,account_name,cmulti_yr,account_id,account_owner,parent,tier,bin_avg_arr,tcv,geo,country,government,company_type, industry,license_beg_date,license_end_date,term]
    sql: ${cmulti_yr} ;;
  }

  dimension: cnet_booking {
    type: number
    value_format: "$#,##0;($#,##0)"
    description: "Total Contract Value net of license expired during the same period"
    sql: ${TABLE}."CNET_BOOKING" ;;
  }

  measure: total_cnet_booking {
    type: sum
    value_format: "$#,##0;($#,##0)"
    drill_fields: [close_day_date,account_name,cnet_booking,account_id,account_owner,parent,tier,bin_avg_arr,tcv,geo,country,government,company_type, industry,license_beg_date,license_end_date,term]
    sql: ${cnet_booking};;
  }

  dimension: cnt_changed {
    type: number
    description: "Change in number of active accounts"
    sql: ${TABLE}."CNT_CHANGED" ;;
  }

  measure: total_cnt_changed {
    type: sum
    sql: ${cnt_changed} ;;
  }

  dimension: cnt_churned {
    type: number
    description: "Accounts that declined to zero ARR outstanding at period end"
    sql: ${TABLE}."CNT_CHURNED" ;;
  }

  measure: total_cnt_churned  {
    type: sum
    sql:  ${cnt_churned} ;;
  }

  dimension: cnt_contracted {
    type: number
    description: "Accounts where ARR outstanding declined during the period"
    sql: ${TABLE}."CNT_CONTRACTED" ;;
  }

  measure: total_cnt_contracted {
    type: sum
    sql:  ${cnt_contracted} ;;
  }

  dimension: cnt_expanded {
    type: number
    description: "Accounts that had ARR outstanding increasing during the period"
    sql: ${TABLE}."CNT_EXPANDED" ;;
  }

  measure: total_cnt_expanded {
    type: sum
    sql:  ${cnt_expanded} ;;
  }

  dimension: cnt_expired {
    type: number
    description: "Accounts that had license expiries during the period"
    sql: ${TABLE}."CNT_EXPIRED" ;;
  }

  measure: total_cnt_expired {
    type: sum
    sql: ${cnt_expired} ;;
  }

  dimension: cnt_late_renewal {
    type: number
    description: "Accounts that had a renewal closing date after license end date and is less than equal to 90 days"
    sql: ${TABLE}."CNT_LATE_RENEWAL" ;;
  }

  measure: total_cnt_late_renewal {
    type: sum
    sql: ${cnt_late_renewal} ;;
  }

  dimension: cnt_new {
    type: number
    description: "New account count during period"
    sql: ${TABLE}."CNT_NEW" ;;
  }

  measure: total_cnt_new {
    type: sum
    sql: ${cnt_new} ;;
  }

  dimension: cnt_renewed {
    type: number
    description: "Renewals closed count during the period"
    sql: ${TABLE}."CNT_RENEWED" ;;
  }

  measure: total_cnt_renewed {
    type: sum
    sql: ${cnt_renewed} ;;
  }

  dimension: cnt_resurrected {
    type: number
    description: "When a late renewal is greater than 90 days"
    sql: ${TABLE}."CNT_RESURRECTED" ;;
  }

  measure: total_cnt_resurrected {
    type: sum
    sql: ${cnt_resurrected} ;;
  }

  dimension: cohort_fiscal_qtr {
    type: string
    sql: ${TABLE}."COHORT_FISCAL_QTR" ;;
  }

  dimension: cohort_fiscal_yr {
    type: string
    sql: ${TABLE}."COHORT_FISCAL_YR" ;;
  }

  dimension: cohort_month {
    type: string
    sql: ${TABLE}."COHORT_MONTH" ;;
  }

  dimension: company_size {
    type: string
    sql: ${TABLE}."COMPANY_SIZE" ;;
  }

  dimension: company_type {
    type: string
    sql: ${TABLE}."COMPANY_TYPE" ;;
  }

  dimension: contracted {
    type: number
    value_format: "$#,##0;($#,##0)"
    description: "Decline in ARR outstanding during the period"
    sql: ${TABLE}."CONTRACTED" ;;
  }

  measure: total_contracted {
    type: sum
    value_format: "$#,##0;($#,##0)"
    drill_fields: [close_day_date, account_name,contracted,account_id,account_owner,parent,tier,bin_avg_arr,tcv,geo,country,government,company_type, industry,license_beg_date,license_end_date,term]
    sql: ${contracted} ;;
  }

  measure: avg_contracted {
    type: average
    value_format: "$#,##0;($#,##0)"
    drill_fields: [close_day_date, account_name,contracted,account_id,account_owner,parent,tier,bin_avg_arr,tcv,geo,country,government,company_type, industry,license_beg_date,license_end_date,term]
    sql: ${contracted} ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}."COUNTRY" ;;
  }

  dimension: days_delayed {
    type: number
    value_format: "0.0"
    description: "Number of days close date exceeded license end date"
    sql: ${TABLE}."DAYS_DELAYED" ;;
  }

  measure: avg_days_delayed {
    type: average
    value_format: "0.0"
    sql: ${days_delayed} ;;
  }

  dimension: expanded {
    type: number
    value_format: "$#,##0;($#,##0)"
    description: "Increase in ARR Outstanding during the period"
    sql: ${TABLE}."EXPANDED" ;;
  }

  measure: total_expanded {
    type: sum
    value_format: "$#,##0;($#,##0)"
    drill_fields: [close_day_date,account_name,expanded,account_id,account_owner,parent,tier,bin_avg_arr,tcv,geo,country,government,company_type, industry,license_beg_date,license_end_date,term]
    sql: ${expanded} ;;
  }

  measure: avg_expanded {
    type: average
    value_format: "$#,##0;($#,##0)"
    drill_fields: [close_day_date,account_name,expanded,account_id,account_owner,parent,tier,bin_avg_arr,tcv,geo,country,government,company_type, industry,license_beg_date,license_end_date,term]
    sql: ${expanded} ;;
  }

  dimension: expire {
    type: number
    value_format: "$#,##0;($#,##0)"
    description: "Amount expired based on license end date during the period"
    sql: ${TABLE}."EXPIRE" ;;
  }

  measure: total_expire {
    type: sum
    value_format: "$#,##0;($#,##0)"
    drill_fields: [close_day_date,account_name,expire,account_id,account_owner,parent,tier,bin_avg_arr,tcv,geo,country,government,company_type, industry,license_beg_date,license_end_date,term]
    sql: ${expire} ;;
  }

  dimension: geo {
    type: string
    sql: ${TABLE}."GEO" ;;
  }

  dimension: government {
    type: yesno
    sql: ${TABLE}."GOVERNMENT" ;;
  }

  dimension: industry {
    type: string
    sql: ${TABLE}."INDUSTRY" ;;
  }

  dimension: late_renewal {
    type: number
    value_format: "$#,##0;($#,##0)"
    description: "Renewal closed based on the amount of latest license expired"
    sql: ${TABLE}."LATE_RENEWAL" ;;
  }

  measure: total_late_renewal {
    type: sum
    value_format: "$#,##0;($#,##0)"
    drill_fields: [close_day_date,account_name,late_renewal,account_id,account_owner,parent,tier,bin_avg_arr,tcv,geo,country,government,company_type, industry,license_beg_date,license_end_date,term]
    sql: ${late_renewal} ;;
  }

  dimension_group: license_beg {
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
    sql: ${TABLE}."LICENSE_BEG" ;;
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
    sql: ${TABLE}."LICENSE_END" ;;
  }

  dimension: license_month {
    type: string
    sql: ${TABLE}."LICENSE_MONTH" ;;
  }

  dimension: license_quarter {
    type: string
    sql: ${TABLE}."LICENSE_QUARTER" ;;
  }

  dimension: new {
    type: number
    value_format: "$#,##0;($#,##0)"
    description: "ARR signed up with new accounts"
    sql: ${TABLE}."NEW" ;;
  }

  measure: total_new {
    type: sum
    value_format: "$#,##0;($#,##0)"
    drill_fields: [close_day_date,account_name,new,account_id,account_owner,parent,tier,bin_avg_arr,tcv,geo,country,government,company_type, industry,license_beg_date,license_end_date,term]
    sql: ${new} ;;
  }

  measure: avg_new {
    type: average
    value_format: "$#,##0;($#,##0)"
    drill_fields: [close_day_date,account_name,new,account_id,account_owner,parent,tier,bin_avg_arr,tcv,geo,country,government,company_type, industry,license_beg_date,license_end_date,term]
    sql: ${new} ;;
  }

  dimension: opportunity_description {
    type: string
    sql: ${TABLE}."OPPORTUNITY_DESCRIPTION" ;;
  }

  dimension: parent {
    type: string
    description: "Parent company account belongs to"
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

  dimension: previous_expire {
    type: number
    value_format: "$#,##0;($#,##0)"
    description: "ARR that expired most recently"
    sql: ${TABLE}."PREVIOUS_EXPIRE" ;;
  }

  measure: total_preivous_expire {
    type: sum
    value_format: "$#,##0;($#,##0)"
    drill_fields: [close_day_date,account_name,previous_expire,account_id,account_owner,parent,tier,bin_avg_arr,tcv,geo,country,government,company_type, industry,license_beg_date,license_end_date,term]
    sql: ${previous_expire} ;;
  }

  dimension: product {
    type: string
    sql: ${TABLE}."PRODUCT" ;;
  }

  dimension: renewed {
    type: number
    value_format: "$#,##0;($#,##0)"
    description: "ARR renewed during the period"
    sql: ${TABLE}."RENEWED" ;;
  }

  measure: total_renewed {
    type: sum
    value_format: "$#,##0;($#,##0)"
    drill_fields: [close_day_date,account_name,renewed,account_id,account_owner,parent,tier,bin_avg_arr,tcv,geo,country,government,company_type, industry,license_beg_date,license_end_date,term]
    sql: ${renewed} ;;
  }

  dimension: resurrected {
    type: number
    value_format: "$#,##0;($#,##0)"
    description: "ARR renewed after 90 days of license expiry"
    sql: ${TABLE}."RESURRECTED" ;;
  }

  measure: total_resurrected {
    type: sum
    value_format: "$#,##0;($#,##0)"
    drill_fields: [close_day_date,account_name,resurrected,account_id,account_owner,parent,tier,bin_avg_arr,tcv,geo,country,government,company_type, industry,license_beg_date,license_end_date,term]
    sql: ${resurrected} ;;
  }

  dimension: tcv {
    type: number
    value_format: "$#,##0;($#,##0)"
    description: "Total contract value closed won including renewals, non-recurring revenue and multiyr arrangements"
    sql: ${TABLE}."TCV" ;;
  }

  measure: total_tcv {
    type: sum
    value_format: "$#,##0;($#,##0)"
    drill_fields: [close_day_date,account_name,tcv,account_id,account_owner,parent,tier,bin_avg_arr,tcv,geo,country,government,company_type, industry,license_beg_date,license_end_date,term]
    sql: ${tcv} ;;
  }

  dimension: term {
    type: number
    sql: ${TABLE}."TERM" ;;
  }

  dimension: tier {
    type: string
    sql: ${TABLE}."TIER" ;;
  }

  dimension: trans_no {
    type: number
    sql: ${TABLE}."TRANS_NO" ;;
  }

  dimension: unique_key {
    type: string
    sql: ${TABLE}."UNIQUE_KEY" ;;
  }

  dimension: yr1_billing {
    type: number
    value_format: "$#,##0;($#,##0)"
    description: "TCV that is billed during the first year calculated by total tcv divided by term"
    sql: ${TABLE}."YR1_BILLING" ;;
  }

  measure: total_yr1_billing {
    type: sum
    value_format: "$#,##0;($#,##0)"
    drill_fields: [close_day_date,account_name,yr1_billing,account_id,account_owner,parent,tier,bin_avg_arr,tcv,geo,country,government,company_type, industry,license_beg_date,license_end_date,term]
    sql: ${yr1_billing} ;;
  }
  measure: count {
    type: count
    drill_fields: [account_name]
  }
}
