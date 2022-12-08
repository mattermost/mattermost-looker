# The name of this view in Looker is "Funnel Opportunity"
view: funnel_opportunity {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "FINANCE"."FUNNEL_OPPORTUNITY"
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Account ID" in Explore.

  dimension: account_id {
    type: string
    sql: ${TABLE}."ACCOUNT_ID" ;;
  }

  dimension: account_name {
    type: string
    sql: ${TABLE}."ACCOUNT_NAME" ;;
  }

  dimension: arr {
    type: number
    value_format: "$#,##0;($#,##0)"
    sql: ${TABLE}."ARR" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_arr {
    type: sum
    value_format: "$#,##0;($#,##0)"
    sql: ${arr} ;;
  }

  measure: average_arr {
    type: average
    value_format: "$#,##0;($#,##0)"
    sql: ${arr} ;;
  }

  dimension: booking {
    type: number
    value_format: "$#,##0;($#,##0)"

    sql: ${TABLE}."BOOKING" ;;
  }

  measure: total_booking {
    type: sum
    value_format: "$#,##0;($#,##0)"
    sql: ${booking} ;;
  }

  measure: average_booking {
    type: average
    value_format: "$#,##0;($#,##0)"
    sql: ${booking} ;;
  }

  dimension: campaign_id {
    type: string
    sql: ${TABLE}."CAMPAIGN_ID" ;;
  }

  dimension: categoryorder {
    type: number
    sql: ${TABLE}."CATEGORYORDER" ;;
  }

  dimension: ce_name {
    type: string
    sql: ${TABLE}."CE_NAME" ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: close {
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
    sql: ${TABLE}."CLOSE_DATE" ;;
  }

  dimension: close_mo {
    type: string
    sql: ${TABLE}."CLOSE_MONTH"::varchar ;;
  }

  dimension: close_wk_beg {
    type: string
    sql: ${TABLE}."CLOSE_WEEK_BEG"::varchar ;;
  }

  dimension: close_wk_end {
    type: string
    sql: ${TABLE}."CLOSE_WEEK_END"::varchar ;;
  }

  dimension: company_type {
    type: string
    sql: ${TABLE}."COMPANY_TYPE" ;;
  }

  dimension: createdbyid {
    type: string
    sql: ${TABLE}."CREATEDBYID" ;;
  }

  dimension: creator_name {
    type: string
    sql: ${TABLE}."CREATOR_NAME" ;;
  }

  dimension: csm_name {
    type: string
    sql: ${TABLE}."CSM_NAME" ;;
  }

  dimension: forecastcategory {
    type: string
    sql: ${TABLE}."FORECASTCATEGORY" ;;
  }

  dimension: geo {
    type: string
    sql: ${TABLE}."GEO" ;;
  }

  dimension: isclosed {
    type: yesno
    sql: ${TABLE}."ISCLOSED" ;;
  }

  dimension: iswon {
    type: yesno
    sql: ${TABLE}."ISWON" ;;
  }

  dimension: lead_category {
    type: string
    sql: ${TABLE}."LEAD_CATEGORY" ;;
  }

  dimension_group: lead_created {
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
    sql: ${TABLE}."LEAD_CREATED" ;;
  }

  dimension: lead_detail {
    type: string
    sql: ${TABLE}."LEAD_DETAIL" ;;
  }

  dimension: lead_id {
    type: string
    sql: ${TABLE}."LEAD_ID" ;;
  }

  dimension: lead_created_mo {
    type: string
    sql: ${TABLE}."LEAD_MONTH"::varchar ;;
  }

  dimension: lead_type {
    type: string
    sql: ${TABLE}."LEAD_TYPE__C" ;;
  }

  dimension: lead_upon_conversion {
    type: string
    sql: ${TABLE}."LEAD_UPON_CONVERSION" ;;
  }

  dimension: lead_week_beg {
    type: string
    sql: ${TABLE}."LEAD_WEEK_BEG"::varchar ;;
  }

  dimension: lead_week_end {
    type: string
    sql: ${TABLE}."LEAD_WEEK_END"::varchar ;;
  }

  dimension: license_active {
    type: yesno
    sql: ${TABLE}."LICENSE_ACTIVE__C" ;;
  }

  dimension_group: license_end {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."LICENSE_END" ;;
  }

  dimension_group: license_start {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."LICENSE_START" ;;
  }

  dimension: new_logo__c {
    type: string
    sql: ${TABLE}."NEW_LOGO__C" ;;
  }

  dimension_group: opp_created {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."OPP_CREATED" ;;
  }

  dimension: opp_created_mo {
    type: string
    sql: ${TABLE}."OPP_CREATED_MONTH"::varchar ;;
  }

  dimension: opp_created_week_beg {
    type: string
    sql: ${TABLE}."OPP_CREATED_WEEK_BEG"::varchar ;;
  }

  dimension: opp_created_week_end {
    type: string
    sql: ${TABLE}."OPP_CREATED_WEEK_END"::varchar ;;
  }

  dimension: opp_products__c {
    type: number
    sql: ${TABLE}."OPP_PRODUCTS__C" ;;
  }

  dimension: opportunity_id {
    type: string
    sql: ${TABLE}."OPPORTUNITY_ID" ;;
  }

  dimension: opportunity_name {
    type: string
    sql: ${TABLE}."OPPORTUNITY_NAME" ;;
  }

  dimension: order_type {
    type: string
    sql: ${TABLE}."ORDER_TYPE" ;;
  }

  dimension: owner_id {
    type: string
    sql: ${TABLE}."OWNER_ID" ;;
  }

  dimension: owner_name {
    type: string
    sql: ${TABLE}."OWNER_NAME" ;;
  }

  dimension: parent_id {
    type: string
    sql: ${TABLE}."PARENT_ID" ;;
  }

  dimension: parent_name {
    type: string
    sql: ${TABLE}."PARENT_NAME" ;;
  }

  dimension: prob_weight_arr {
    type: number
    value_format: "$#,##0;($#,##0)"
    sql: ${TABLE}."PROB_WEIGHT_ARR" ;;
  }

  measure: total_prob_weight_arr {
    type: sum
    value_format: "$#,##0;($#,##0)"
    sql:  ${prob_weight_arr} ;;
  }

  measure: average_prob_weight_arr {
    type: average
    value_format: "$#,##0;($#,##0)"
    sql:  ${prob_weight_arr} ;;
  }

  dimension: prob_weight_booking {
    type: number
    value_format: "$#,##0;($#,##0)"
    sql: ${TABLE}."PROB_WEIGHT_BOOKING" ;;
  }

  measure: total_prob_weight_booking {
    type: sum
    value_format: "$#,##0;($#,##0)"
    sql: ${prob_weight_booking} ;;
  }

  measure: average_prob_weight_booking {
    type: average
    value_format: "$#,##0;($#,##0)"
    sql: ${prob_weight_booking} ;;
  }

  dimension: probability {
    type: number
    sql: ${TABLE}."PROBABILITY" ;;
  }

  measure: avg_probability {
    type: average
    value_format: "0"
    sql: ${probability} ;;
  }

  dimension_group: stage_changed {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."STAGE_CHANGED" ;;
  }

  dimension: stage_changed_mo {
    type: string
    sql: ${TABLE}."STAGE_CHANGED_MONTH"::varchar ;;
  }

  dimension: stage_changed_wk_beg {
    type: string
    sql: ${TABLE}."STAGE_CHANGED_WEEK_BEG"::varchar ;;
  }

  dimension: stage_changed_wk_end {
    type: string
    sql: ${TABLE}."STAGE_CHANGED_WEEK_END"::varchar ;;
  }

  dimension: stagename {
    type: string
    sql: ${TABLE}."STAGENAME" ;;
  }

  dimension: stripe_id {
    type: string
    sql: ${TABLE}."STRIPE_ID" ;;
  }

  dimension: term_mos {
    type: number
    sql: ${TABLE}."TERM_MOS" ;;
  }

  dimension: dealtype {
    type: string
    sql: ${TABLE}."DEALTYPE" ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      forecastcategory,
      stagename,
      owner_name,
      parent_name,
      account_name,
      account_id,
      opportunity_id,
      booking,
      arr,
      probability,
      opportunity_name,
      geo,
      company_type,
      lead_created_date,
      opp_created_date,
      stage_changed_date,
      close_date
    ]
  }
}
