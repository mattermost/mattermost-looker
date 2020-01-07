view: opportunity {
  sql_table_name: orgm.opportunity ;;
  drill_fields: [original_opportunity_id]

#Filters

filter:   is_closed_curr_mo {
  type: yesno
  sql: ${close_month} = get_sys_var('curr_mo') ;;
  label: "Close Current Month"

}
  dimension: original_opportunity_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.original_opportunity_id__c ;;
    group_label: "Original Opportunity"
  }

  dimension: _hc_err {
    type: string
    sql: ${TABLE}._hc_err ;;
    label: "HC Err"
    group_label: "System"
  }

  dimension: _hc_lastop {
    type: string
    sql: ${TABLE}._hc_lastop ;;
    label: "HC Last Op"
    group_label: "System"
  }

  dimension: accountid {
    type: string
    sql: ${TABLE}.accountid ;;
    label: "Account SFID"
    description: "Account SFID in Salesforce"
    group_label: "Account"
  }


  dimension: amount {
    type: number
    sql: ${TABLE}.amount ;;
    group_label: "Amount"
  }

  dimension: amount_in_commit {
    type: number
    sql: ${TABLE}.amount_in_commit__c ;;
    group_label: "Amount"
  }

  dimension: amount_in_pipeline {
    type: number
    sql: ${TABLE}.amount_in_pipeline__c ;;
    group_label: "Amount"
  }

  dimension: arr {
    type: number
    sql: ${TABLE}.arr__c ;;
    group_label: "ARR"
  }

  dimension: arrmonth15 {
    type: number
    sql: ${TABLE}.arrmonth15__c ;;
    group_label: "ARR"
  }

  dimension: arrmonth18 {
    type: number
    sql: ${TABLE}.arrmonth18__c ;;
    group_label: "ARR"
  }

  dimension: arrmonth_check {
    type: string
    sql: ${TABLE}.arrmonth_check__c ;;
    group_label: "ARR"
  }

  dimension: arrmonths {
    type: number
    sql: ${TABLE}.arrmonths__c ;;
    group_label: "ARR"
  }

  dimension: campaignid {
    type: string
    sql: ${TABLE}.campaignid ;;
    group_label: "Marketing"
  }

  dimension_group: close {
    type: time
    timeframes: [
      date,
      month,
      fiscal_quarter,
      fiscal_quarter_of_year,
      year,
      fiscal_year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.closedate ;;
    group_label: "Closed"
  }

  dimension: contactid {
    type: string
    sql: ${TABLE}.contactid ;;
  }

  dimension: createdbyid {
    type: string
    sql: ${TABLE}.createdbyid ;;
    group_label: "Created"
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
    sql: ${TABLE}.createddate ;;
    group_label: "Created"
  }

  dimension: csm_owner_id {
    type: string
    sql: ${TABLE}.csm_owner__c ;;
    group_label: "Renewals"
  }

  dimension: days_past_renewal {
    type: number
    sql: ${TABLE}.days_past_renewal__c ;;
    group_label: "Renewals"
  }

  dimension: delta_amount {
    type: number
    sql: ${TABLE}.delta_amount__c ;;
    group_label: "Amount"
  }

  dimension: delta_arr {
    type: number
    sql: ${TABLE}.delta_arr__c ;;
    group_label: "ARR"
  }

  dimension: expectedrevenue {
    type: number
    sql: ${TABLE}.expectedrevenue ;;
    group_label: "Amount"
  }

  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
    hidden:  yes
  }

  dimension: isclosed {
    type: yesno
    sql: ${TABLE}.isclosed ;;
    label: "Closed?"
    group_label: "Closed"
  }

  dimension: isdeleted {
    type: yesno
    sql: ${TABLE}.isdeleted ;;
    label: "Deleted?"
    group_label: "System"
  }

  dimension: iswon {
    type: yesno
    sql: ${TABLE}.iswon ;;
    label: "Closed Won?"
    group_label: "Closed"
  }

  dimension_group: lead_created_date {
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
    sql: ${TABLE}.lead_created_date__c ;;
    group_label: "Marketing"
  }

  dimension: lead_source_detail {
    type: string
    sql: ${TABLE}.lead_source_detail__c ;;
    group_label: "Marketing"
  }

  dimension: lead_source_detail_upon_conversion {
    type: string
    sql: ${TABLE}.lead_source_detail_upon_conversion__c ;;
    group_label: "Marketing"
  }

  dimension: lead_source_upon_conversion {
    type: string
    sql: ${TABLE}.lead_source_upon_conversion__c ;;
    group_label: "Marketing"
  }

  dimension: lead_type {
    type: string
    sql: ${TABLE}.lead_type__c ;;
    group_label: "Marketing"
  }

  dimension: leadid {
    type: string
    sql: ${TABLE}.leadid__c ;;
    group_label: "Marketing"
  }

  dimension: leadsource {
    type: string
    sql: ${TABLE}.leadsource ;;
    group_label: "Marketing"
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
    sql: ${TABLE}.mql_date__c ;;
    group_label: "Marketing"
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
    label: "Opportunity Name"
  }

  dimension: new_expansion_total {
    type: number
    sql: ${TABLE}.new_expansion_total__c ;;
    group_label: "Amount"
  }

  dimension: new_logo {
    type: string
    sql: ${TABLE}.new_logo__c ;;
    group_label: "Marketing"
  }

  dimension: order_type {
    type: string
    sql: ${TABLE}.order_type__c ;;
    label: "Order Type"
  }

  dimension: original_opportunity {
    type: string
    sql: ${TABLE}.original_opportunity__c ;;
    group_label: "Original Opportunity"
  }

  dimension: original_opportunity_amount {
    type: number
    sql: ${TABLE}.original_opportunity_amount__c ;;
    group_label: "Original Opportunity"
  }

  dimension: original_opportunity_arr {
    type: number
    sql: ${TABLE}.original_opportunity_arr__c ;;
    group_label: "Original Opportunity"
  }

  dimension_group: original_opportunity_end_date {
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
    sql: ${TABLE}.original_opportunity_end_date__c ;;
    group_label: "Original Opportunity"
  }

  dimension: original_opportunity_length_in_months {
    type: number
    sql: ${TABLE}.original_opportunity_length_in_months__c ;;
    group_label: "Original Opportunity"
  }

  dimension: original_opportunityid {
    type: string
    sql: ${TABLE}.original_opportunityid__c ;;
    group_label: "Original Opportunity"
  }

  dimension: ownerid {
    type: string
    sql: ${TABLE}.ownerid ;;
    label: "Owner ID"
  }

  dimension: probability {
    type: number
    sql: ${TABLE}.probability ;;
    label: "Prob %"
  }

  dimension: renewal_amount_total {
    type: number
    sql: ${TABLE}.renewal_amount_total__c ;;
    group_label: "Renewals"
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
    sql: ${TABLE}.renewal_created_date__c ;;
    group_label: "Renewals"
  }

  dimension: renewal_includes_leftover_expansion {
    type: string
    sql: ${TABLE}.renewal_includes_leftover_expansion__c ;;
    group_label: "Renewals"
  }

  dimension: renewal_risk_amount {
    type: number
    sql: ${TABLE}.renewal_risk_amount__c ;;
    group_label: "Renewals"
  }

  dimension: renewal_risk_competitor {
    type: string
    sql: ${TABLE}.renewal_risk_competitor__c ;;
    group_label: "Renewals"
  }

  dimension: renewal_risk_reason_additional_details {
    type: string
    sql: ${TABLE}.renewal_risk_reason_additional_details__c ;;
    group_label: "Renewals"
  }

  dimension: renewal_risk_reasons {
    type: string
    sql: ${TABLE}.renewal_risk_reasons__c ;;
    group_label: "Renewals"
  }

  dimension: renewal_risk_status {
    type: string
    sql: ${TABLE}.renewal_risk_status__c ;;
    group_label: "Renewals"
  }

  dimension: renewed_by_opp_arr {
    type: number
    sql: ${TABLE}.renewed_by_opp_arr__c ;;
    group_label: "Renewals"
  }

  dimension: renewed_by_opp_prob {
    type: number
    sql: ${TABLE}.renewed_by_opp_prob__c ;;
    group_label: "Renewals"
  }

  dimension: renewed_by_opportunity_id {
    type: string
    sql: ${TABLE}.renewed_by_opportunity_id__c ;;
    group_label: "Renewals"
  }

  dimension: sfid {
    type: string
    sql: ${TABLE}.sfid ;;
    label: "Oppt. ID"
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
    sql: ${TABLE}.systemmodstamp ;;
    group_label: "Last Modified"
  }

  dimension: territory {
    type: string
    sql: ${TABLE}.territory__c ;;
    label: "Territory"
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
    label: "Type"
  }

# Measure
  measure: count {
    type: count
    drill_fields: [original_opportunity_id, name, opportunitylineitem.count]
  }
}
