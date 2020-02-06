view: opportunity {
  sql_table_name: orgm.opportunity ;;
  drill_fields: [original_opportunity_id__c]


# Filters
  filter: is_close_curr_mo {
    type:  yesno
    sql: to_char(${close_date},'YYYY-MM') = get_sys_var('curr_mo') ;;
    label: "Close Current Month"

  }


  dimension: original_opportunity_id__c {
    type: string
    sql: ${TABLE}."original_opportunity_id__c" ;;
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

  dimension: amount_in_commit__c {
    type: number
    sql: ${TABLE}."amount_in_commit__c" ;;
  }

  dimension: amount_in_pipeline__c {
    type: number
    sql: ${TABLE}."amount_in_pipeline__c" ;;
  }

  dimension: campaignid {
    type: string
    sql: ${TABLE}."campaignid" ;;
  }

  dimension_group: close {
    type: time
    timeframes: [
      date,
      month,
      quarter,
      fiscal_quarter,
      year,
      fiscal_year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."closedate" ;;
  }

  dimension: contactid {
    type: string
    sql: ${TABLE}."contactid" ;;
  }

  dimension: createdbyid {
    type: string
    sql: ${TABLE}."createdbyid" ;;
  }

  dimension_group: createddate {
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
    sql: ${TABLE}."createddate" ;;
  }

  dimension: days_past_renewal__c {
    type: number
    sql: ${TABLE}."days_past_renewal__c" ;;
  }

  dimension: delta_amount__c {
    type: number
    sql: ${TABLE}."delta_amount__c" ;;
  }

  dimension: expectedrevenue {
    type: number
    sql: ${TABLE}."expectedrevenue" ;;
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

  dimension_group: lead_created_date__c {
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

  dimension: lead_source_detail__c {
    type: string
    sql: ${TABLE}."lead_source_detail__c" ;;
  }

  dimension: lead_source_detail_upon_conversion__c {
    type: string
    sql: ${TABLE}."lead_source_detail_upon_conversion__c" ;;
  }

  dimension: lead_source_upon_conversion__c {
    type: string
    sql: ${TABLE}."lead_source_upon_conversion__c" ;;
  }

  dimension: lead_type__c {
    type: string
    sql: ${TABLE}."lead_type__c" ;;
  }

  dimension: leadid__c {
    type: string
    sql: ${TABLE}."leadid__c" ;;
  }

  dimension: leadsource {
    type: string
    sql: ${TABLE}."leadsource" ;;
  }

  dimension_group: mql_date__c {
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
    type: string
    sql: ${TABLE}."name" ;;
  }

  dimension: new_expansion_total__c {
    type: number
    sql: ${TABLE}."new_expansion_total__c" ;;
  }

  dimension: new_logo__c {
    type: string
    sql: ${TABLE}."new_logo__c" ;;
  }

  dimension: order_type__c {
    type: string
    sql: ${TABLE}."order_type__c" ;;
  }

  dimension: original_opportunity__c {
    type: string
    sql: ${TABLE}."original_opportunity__c" ;;
  }

  dimension: original_opportunity_amount__c {
    type: number
    sql: ${TABLE}."original_opportunity_amount__c" ;;
  }

  dimension_group: original_opportunity_end_date__c {
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
    sql: ${TABLE}."original_opportunity_end_date__c" ;;
  }

  dimension: original_opportunity_length_in_months__c {
    type: number
    sql: ${TABLE}."original_opportunity_length_in_months__c" ;;
  }

  dimension: original_opportunityid__c {
    type: string
    sql: ${TABLE}."original_opportunityid__c" ;;
  }

  dimension: ownerid {
    type: string
    sql: ${TABLE}."ownerid" ;;
  }

  dimension: probability {
    type: number
    sql: ${TABLE}."probability" ;;
  }

  dimension: renewal_amount_total__c {
    type: number
    sql: ${TABLE}."renewal_amount_total__c" ;;
  }

  dimension_group: renewal_created_date__c {
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

  dimension: renewal_includes_leftover_expansion__c {
    type: string
    sql: ${TABLE}."renewal_includes_leftover_expansion__c" ;;
  }

  dimension: renewal_risk_amount__c {
    type: number
    sql: ${TABLE}."renewal_risk_amount__c" ;;
  }

  dimension: renewal_risk_competitor__c {
    type: string
    sql: ${TABLE}."renewal_risk_competitor__c" ;;
  }

  dimension: renewal_risk_reason_additional_details__c {
    type: string
    sql: ${TABLE}."renewal_risk_reason_additional_details__c" ;;
  }

  dimension: renewal_risk_reasons__c {
    type: string
    sql: ${TABLE}."renewal_risk_reasons__c" ;;
  }

  dimension: renewal_risk_status__c {
    type: string
    sql: ${TABLE}."renewal_risk_status__c" ;;
  }

  dimension: renewed_by_opp_prob__c {
    type: number
    sql: ${TABLE}."renewed_by_opp_prob__c" ;;
  }

  dimension: renewed_by_opportunity_id__c {
    type: string
    sql: ${TABLE}."renewed_by_opportunity_id__c" ;;
  }

  dimension: sfid {
    type: string
    primary_key: yes
    sql: ${TABLE}."sfid" ;;
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

  dimension: territory__c {
    type: string
    sql: ${TABLE}."territory__c" ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}."type" ;;
  }

  measure: count {
    type: count
    drill_fields: [original_opportunity_id__c, name, opportunitylineitem.count]
  }
}
