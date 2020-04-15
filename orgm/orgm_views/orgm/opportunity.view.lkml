view: opportunity {
  sql_table_name: orgm.opportunity ;;

  #
  # Sets
  #

  set: opportunity_drill_fields {
    fields: [close_date, status_wlo, stagename,
      forecastcategoryname, total_new_amount, total_exp_amount, total_ren_amount]
  }

  set: opportunity_core {
    fields: [
      name,
      sfid,
      close_date,
      close_month,
      close_fiscal_quarter_of_year,
      close_fiscal_year,
      forecastcategory,
      license_start_date,
      license_start_month,
      license_start_fiscal_quarter_of_year,
      license_start_fiscal_year,
      license_end_date,
      license_end_month,
      license_end_fiscal_quarter_of_year,
      license_end_fiscal_year,
      iswon,
      isclosed,
      stagename,
      probability,
      type
    ]
  }


# Filters
  filter: is_close_curr_mo {
    type:  yesno
    sql: to_char(${close_date},'YYYY-MM') = get_sys_var('curr_mo') ;;
    label: "Close Current Month"

  }

  dimension: _hc_err {
    type: string
    sql: ${TABLE}."_hc_err" ;;
  }

  dimension: _hc_lastop {
    type: string
    sql: ${TABLE}."_hc_lastop" ;;
  }

  dimension: accountid {
    type: string
    sql: ${TABLE}."accountid" ;;
  }

  dimension: amount {
    type: number
    sql: ${TABLE}."amount" ;;
  }


  dimension: campaignid {
    type: string
    sql: ${TABLE}."campaignid" ;;
  }

  dimension_group: close {
    convert_tz: no
    description: "Date when the opportunity is expected to close."
    sql: ${TABLE}."closedate" ;;
    timeframes: [
      date,
      month,
      fiscal_quarter,
      fiscal_quarter_of_year,
      year,
      fiscal_year
    ]
    type: time
    group_label: "Closed"
  }

  dimension: close_current_fy {
    type:  yesno
    sql: ${close_fiscal_year} = util.fiscal_year(current_date);;
    group_label: "Closed"
    label: "Close Current FY"
  }

  dimension: close_current_qtr {
    type:  yesno
    sql:${close_fiscal_quarter_of_year} = util.fiscal_quarter(current_date) AND ${close_fiscal_year} = util.fiscal_year(current_date);;
    group_label: "Closed"
    label: "Close Current Qtr"
  }

  dimension: close_in_renewal_qtr {
    type:  yesno
    sql: util.fiscal_quarter(${TABLE}.closedate) ||'-'|| util.fiscal_year(${TABLE}.closedate) = util.fiscal_quarter(${license_start_date}) ||'-'|| util.fiscal_year(${license_start_date});;
    group_label: "Closed"
    label: "Closed in Renewal Qtr?"
  }

  dimension: close_vs_renewal_qtr {
    type:  string
    sql: CASE WHEN ${close_fiscal_quarter} < ${license_start_fiscal_quarter} THEN 'Early' WHEN ${close_fiscal_quarter} = ${license_start_fiscal_quarter} THEN 'Same' ELSE 'Late' END;;
    group_label: "Closed"
    label: "Same, Early or Later Renewal by Qtr"
  }

  dimension: close_current_mo {
    type:  yesno
    sql: date_trunc('month',${TABLE}.closedate)::date = date_trunc('month',current_date);;
    group_label: "Closed"
    label: "Close Current Mo"
  }

  dimension: contactid {
    type: string
    sql: ${TABLE}."contactid" ;;
  }

  dimension: createdbyid {
    type: string
    sql: ${TABLE}."createdbyid" ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      time,
      date
    ]
    sql: ${TABLE}."createddate" ;;
    label: "Create Date"
  }

  dimension: e_purchase_date__c {
    type: date
    sql: ${TABLE}."e_purchase_date__c" ;;
    label: "E-Purchase Date"
  }

  dimension: expectedrevenue {
    type: number
    sql: ${TABLE}."expectedrevenue" ;;
  }

  dimension: forecastcategory {
    type: string
    sql: ${TABLE}.forecastcategory ;;
    group_label: "Forecast"
    label: "Forecast Category"
  }

  dimension: forecastcategoryname {
    type: string
    sql: ${TABLE}.forecastcategoryname ;;
    group_label: "Forecast"
    label: "Forecast Category Name"
  }

  dimension: id {
    type: number
    sql: ${TABLE}."id" ;;
  }

  dimension: isclosed {
    type: yesno
    sql: ${TABLE}."isclosed" ;;
  }

  dimension: isdeleted {
    type: yesno
    sql: ${TABLE}."isdeleted" ;;
  }

  dimension: iswon {
    type: yesno
    sql: ${TABLE}."iswon" ;;
  }

  dimension: lastmodifiedbyid {
    type: string
    sql: ${TABLE}."lastmodifiedbyid" ;;
  }

  dimension_group: lastmodifieddate {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."lastmodifieddate" ;;
  }

  dimension_group: lead_created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."lead_created_date__c" ;;
  }

  dimension: lead_source_detail {
    type: string
    sql: ${TABLE}."lead_source_detail__c" ;;
  }

  dimension: lead_source_detail_upon_conversion {
    type: string
    sql: ${TABLE}."lead_source_detail_upon_conversion__c" ;;
  }

  dimension: lead_source_upon_conversion {
    type: string
    sql: ${TABLE}."lead_source_upon_conversion__c" ;;
  }

  dimension: lead_type {
    type: string
    sql: ${TABLE}."lead_type__c" ;;
  }

  dimension: leadid {
    type: string
    sql: ${TABLE}."leadid__c" ;;
  }

  dimension: leadsource {
    type: string
    sql: ${TABLE}."lead_source_text__c" ;;
  }

  dimension_group: license_end {
    convert_tz: no
    description: "Date when the license is ending. Max end date of all Product Line Items in Opportunity."
    sql: ${TABLE}.license_end_date__c ;;
    timeframes: [
      date,
      month,
      fiscal_quarter,
      fiscal_quarter_of_year,
      year,
      fiscal_year
    ]
    type: time
    group_label: "License"
  }

  dimension_group: license_start {
    convert_tz: no
    description: "Date when the license is starting. Min start date of all Product Line Items in Opportunity."
    sql: ${TABLE}.license_start_date__c ;;
    timeframes: [
      date,
      month,
      fiscal_quarter,
      fiscal_quarter_of_year,
      year,
      fiscal_year
    ]
    type: time
    group_label: "License"
  }

  dimension_group: mql_date {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."mql_date__c" ;;
  }

  dimension: name {
    description: "Name of opportunity in Salesforce"
    label: "Opportunity Name"
    link: {
      label: "Salesforce Opportunity"
      # BP: Leverage constants to enable more reused
      url: "@{salesforce_link}{{sfid}}"
    }
    sql: ${TABLE}.name ;;
    type: string
  }

  dimension: new_logo {
    type: string
    sql: ${TABLE}."new_logo__c" ;;
  }

  dimension: order_type {
    type: string
    sql: ${TABLE}."order_type__c" ;;
  }

  dimension: original_opportunity_sfid {
    # description: "TODO"
    sql: coalesce(${TABLE}.original_opportunity__c, ${TABLE}.original_opportunityid__c ;;
    type: string
    label: "Original Opportunity SFID"
  }

  dimension: ownerid {
    type: string
    sql: ${TABLE}."ownerid" ;;
  }

  dimension: probability {
    type: number
    sql: ${TABLE}."probability" ;;
  }

  dimension_group: renewal_created_date {
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
    sql: ${TABLE}."renewal_created_date__c" ;;
  }

  dimension: renewal_risk_amount {
    type: number
    sql: ${TABLE}."renewal_risk_amount__c" ;;
  }

  dimension: renewal_risk_competitor {
    type: string
    sql: ${TABLE}."renewal_risk_competitor__c" ;;
  }

  dimension: renewal_risk_reason_additional_details {
    type: string
    sql: ${TABLE}."renewal_risk_reason_additional_details__c" ;;
  }

  dimension: renewal_risk_reasons {
    type: string
    sql: ${TABLE}."renewal_risk_reasons__c" ;;
  }

  dimension: renewal_risk_status {
    type: string
    sql: ${TABLE}."renewal_risk_status__c" ;;
  }

  dimension: renewed_by_opportunity_id {
    type: string
    sql: ${TABLE}."renewed_by_opportunity_id__c" ;;
  }

  dimension: stagename {
    type: string
    sql: ${TABLE}."stagename" ;;
    label: "Stage"
  }

  dimension: status_wlo {
    type: string
    sql: ${TABLE}."status_wlo__c" ;;
    label: "Status WLO"
  }


  dimension: sfid {
    type: string
    primary_key: yes
    sql: ${TABLE}."sfid" ;;
    link: {
      label: "Salesforce Opportunity"
      # BP: Leverage constants to enable more reused
      url: "@{salesforce_link}{{sfid}}"
    }
  }

  dimension_group: systemmodstamp {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."systemmodstamp" ;;
  }

  dimension: territory {
    type: string
    sql: ${TABLE}."territory__c" ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}."type" ;;
  }


  measure: count {
    type: count_distinct
    sql: ${sfid} ;;
    drill_fields: [sfid, name, opportunitylineitem.count]
  }

  measure: total_amount {
    type: sum
    value_format_name: usd_0
    sql: ${amount} ;;
  }
  measure: total_arr {
    label: "Total ARR"
    type: sum
    sql: ${opportunitylineitem.arr} ;;
  }

  measure: total_exp_count {
    group_label: "Product Line Type Counts"
    label: "# Exp Oppts"
    sql: ${opportunitylineitem.sfid};;
    type: count_distinct
    drill_fields: [opportunity_drill_fields*,total_new_amount]
    filters: {
      field: opportunitylineitem.product_line_type
      value: "Expansion"
    }
    sql_distinct_key: ${opportunitylineitem.sfid} ;;
  }

  measure: total_exp_amount {
    group_label: "Product Line Type Totals"
    sql: ${opportunitylineitem.totalprice};;
    type: sum
    value_format_name: mm_usd_short
    drill_fields: [opportunity_drill_fields*,total_exp_amount]
    filters: {
      field: opportunitylineitem.product_line_type
      value: "Expansion"
    }
    filters: {
      field: opportunitylineitem.is_loe
      value: "no"
    }
    sql_distinct_key: ${opportunitylineitem.sfid} ;;
  }

  measure: total_exp_with_loe_amount {
    group_label: "Product Line Type Totals"
    sql: ${opportunitylineitem.totalprice};;
    type: sum
    value_format_name: mm_usd_short
    drill_fields: [opportunity_drill_fields*,total_exp_amount]
    filters: {
      field: opportunitylineitem.product_line_type
      value: "Expansion"
    }
    sql_distinct_key: ${opportunitylineitem.sfid} ;;
  }

  measure: total_new_count {
    group_label: "Product Line Type Counts"
    label: "# New Oppts"
    sql: ${opportunitylineitem.sfid};;
    type: count_distinct
    drill_fields: [opportunity_drill_fields*,total_new_amount]
    filters: {
      field: opportunitylineitem.product_line_type
      value: "New"
    }
    sql_distinct_key: ${opportunitylineitem.sfid} ;;
  }

  measure: total_new_amount {
    group_label: "Product Line Type Totals"
    sql: ${opportunitylineitem.totalprice};;
    type: sum
    value_format_name: mm_usd_short
    drill_fields: [opportunity_drill_fields*,total_new_amount]
    filters: {
      field: opportunitylineitem.product_line_type
      value: "New"
    }
    sql_distinct_key: ${opportunitylineitem.sfid} ;;
  }

  measure: total_new_exp_count {
    group_label: "Product Line Type Counts"
    label: "# New and Exp Oppts"
    sql: ${total_new_count}+${total_exp_count};;
    type: number
    drill_fields: [opportunity_drill_fields*,total_new_amount]
  }

  measure: total_new_and_exp_with_loe_amount {
    label: "Total New and Exp w/LOE Amount"
    group_label: "Product Line Type Totals"
    sql: ${total_new_amount}+${total_exp_amount};;
    type: number
    value_format_name: mm_usd_short
    drill_fields: [opportunity_drill_fields*,total_new_amount,total_exp_with_loe_amount,total_new_and_exp_with_loe_amount]
  }

  measure: total_new_and_exp_amount {
    group_label: "Product Line Type Totals"
    sql: ${total_new_amount}+${total_exp_amount};;
    type: number
    value_format_name: mm_usd_short
    drill_fields: [opportunity_drill_fields*,total_new_amount,total_exp_amount,total_new_and_exp_amount]
  }



  measure: total_ren_amount {
    group_label: "Product Line Type Totals"
    sql: ${opportunitylineitem.totalprice};;
    type: sum
    value_format_name: mm_usd_short
    drill_fields: [opportunity_drill_fields*,total_ren_amount]
    filters: {
      field: opportunitylineitem.product_line_type
      value: "Ren"
    }
    sql_distinct_key: ${opportunitylineitem.sfid} ;;
  }


  measure: total_multi_amount {
    group_label: "Product Line Type Totals"
    sql: ${opportunitylineitem.totalprice};;
    type: sum
    value_format_name: mm_usd_short
    drill_fields: [opportunity_drill_fields*,total_multi_amount]
    filters: {
      field: opportunitylineitem.product_line_type
      value: "Multi"
    }
    sql_distinct_key: ${opportunitylineitem.sfid} ;;
  }


}
