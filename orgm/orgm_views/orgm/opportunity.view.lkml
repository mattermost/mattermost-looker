view: opportunity {
  sql_table_name: orgm.opportunity ;;


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

  dimension: stage_name {
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



}
