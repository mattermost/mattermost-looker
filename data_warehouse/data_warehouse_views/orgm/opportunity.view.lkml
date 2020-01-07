# BP
# Opportunity information from salesforce.
#
# Groups Labels
# - Amounts
# - ARR
# - Total Amounts

view: opportunity {
  sql_table_name: orgm.opportunity ;;

  # BP: Leverage sets for drill fields
  drill_fields: [opportunity_drill_fields_short*]


  #
  # Sets
  #

  set: opportunity_drill_fields_short {
    fields: [original_opportunity_id, name]
  }

  set: opportunity_drill_fields_long {
    fields: [original_opportunity_id, name]
    #opportunitylineitem.count
  }



  #
  # Dimensions
  #

#Filters

filter:   is_closed_curr_mo {
  type: yesno
  sql: ${close_month} = get_sys_var('curr_mo') ;;
  label: "Close Current Month"

}
  dimension: original_opportunity_id {
    sql: ${TABLE}.original_opportunity_id__c ;;
    type: string
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
    description: "Account SFID in Salesforce"
    group_label: "Account"
    label: "Account SFID"
  }

  dimension: amount {
    description: "The estimated total sale amount. For opportunities with products, the amount is the sum of the related products. Any attempt to update this field, if the record has products, will be ignored. The update call will not be rejected, and other fields will be updated as specified, but the Amount will be unchanged."
    group_label: "Amounts"
    # BP: Override drill fields using sets
    drill_fields: [opportunity_drill_fields_long*]
    sql: ${TABLE}.amount ;;
    type: number

    # BP: Leverage named value formats
    value_format_name: mm_usd_short
  }

  dimension: amount_in_commit {
    # description: "TODO"
    group_label: "Amounts"
    sql: ${TABLE}.amount_in_commit__c ;;
    type: number
    value_format_name: mm_usd_short
  }

  dimension: amount_in_pipeline {
    # description: "TODO"
    group_label: "Amounts"
    sql: ${TABLE}.amount_in_pipeline__c ;;
    type: number
    value_format_name: mm_usd_short
  }

  dimension: arr {
    description: "Annual Recurring Revenue"
    group_label: "ARR"
    label: "ARR"
    sql: ${TABLE}.arr__c ;;
    type: number
    value_format_name: mm_usd_short
  }

  dimension: arr_month_15 {
    # description: "TODO"
    group_label: "ARR"
    label: "ARR Month 15"
    sql: ${TABLE}.arrmonth15__c ;;
    type: number
    value_format_name: mm_usd_short
  }

  dimension: arr_month_18 {
    # description: "TODO"
    group_label: "ARR"
    label: "ARR Month 18"
    sql: ${TABLE}.arrmonth18__c ;;
  }

  dimension: arrmonth_check {
    type: string
    sql: ${TABLE}.arrmonth_check__c ;;
    group_label: "ARR"
  }

  dimension: arrmonths {
    type: number
    value_format_name: mm_usd_short
    sql: ${TABLE}.arrmonths__c ;;
    group_label: "ARR"
  }

  dimension: arr_month_check {
    # description: "TODO"
    group_label: "ARR"
    label: "ARR Month Check"
    sql: ${TABLE}.arrmonth_check__c ;;
    type: string
    value_format_name: mm_usd_short
  }

  dimension: arr_months {
    # description: "TODO"
    group_label: "ARR"
    label: "ARR Months"
    sql: ${TABLE}.arrmonths__c ;;
    type: number
    value_format_name: mm_usd_short
  }

  dimension: campaign_id {
    description: "The ID of the campaign responsible for generating the opportunity."
    sql: ${TABLE}.campaignid ;;
    type: string
    group_label: "Marketing"
  }

  dimension_group: close {
    convert_tz: no
    description: "Date when the opportunity is expected to close."
    sql: ${TABLE}.closedate ;;
    timeframes: [
      date,
      month,
#      fiscal_quarter,
      fiscal_quarter_of_year,
      year,
      fiscal_year
    ]
    type: time
    group_label: "Closed"
  }

  dimension: close_quarter {
    type:  string
    sql:${close_fiscal_year} || '-' || ${close_fiscal_quarter_of_year};;
    group_label: "Closed"
  }
  dimension: contactid {
    # description: "TODO"
    sql: ${TABLE}.contactid ;;
    type: string
  }

  dimension: created_by_id {
    description: "The ID of the user who created the opportunity"
    sql: ${TABLE}.createdbyid ;;
    type: string
  }

  dimension_group: created {
    # description: "TODO"
    sql: ${TABLE}.createddate ;;
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
    group_label: "Created"
  }

  dimension: csm_owner_id {
    type: string
    sql: ${TABLE}.csm_owner__c ;;
    group_label: "Renewals"
  }

  dimension: days_past_renewal {
    # description: "TODO"
    sql: ${TABLE}.days_past_renewal__c ;;
    group_label: "Renewals"
    type: number
  }

  dimension: days_past_renewal_tiers {
    # description: "TODO"
    sql: ${amount} ;;
    style: relational
    tiers: [30, 60, 90]
    type: tier
    group_label: "Renewals"
  }

  dimension: delta_amount {
    # description: "TODO"
    group_label: "Amounts"
    sql: ${TABLE}.delta_amount__c ;;
    type: number
    value_format_name: mm_usd_short
  }

  dimension: delta_arr {
    # description: "TODO"
    group_label: "ARR"
    label: "Delta ARR"
    sql: ${TABLE}.delta_arr__c ;;
    type: number
    value_format_name: mm_usd_short
  }

  dimension: expected_revenue {
    description: "Calculated revenue based on the Amount and Probability fields."
    sql: ${TABLE}.expectedrevenue ;;
    type: number
    value_format_name: mm_usd_short
    group_label: "Amounts"
  }


  dimension: forecastcategory {
    type: number
    sql: ${TABLE}.forecastcategory ;;
    group_label: "Forecast"
    label: "Forecast Category"
  }

  dimension: forecast_category_custom {
    type: number
    sql: ${TABLE}.forecast_category_custom__c ;;
    group_label: "Forecast"
    label: "Forecast Category Custom"
  }

  dimension: forecastcategoryname {
    type: number
    sql: ${TABLE}.forecastcategoryname ;;
    group_label: "Forecast"
    label: "Forecast Category Name"
  }

  dimension: geo {
    type: number
    sql: ${TABLE}.geo__c ;;
    label: "Geo"
  }

  dimension: id {
    # description: "TODO"
    sql: ${TABLE}.id ;;
    type: number
    hidden:  yes
  }

  # BP: use is_ for yes/no fields
  dimension: is_closed {
    # description: "TODO"
    sql: ${TABLE}.isclosed ;;
    type: yesno
    label: "Closed?"
    group_label: "Closed"
  }

  dimension: is_deleted {
    description: "Indicates whether this opportunity has been moved to the Recycle Bin (yes) or not (no)."
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

  dimension: is_won {
    description: "Directly controlled by StageName. You can query and filter on this field, but you can’t directly set the value. It can only be set via StageName. Label is Won."
    sql: ${TABLE}.iswon ;;
    type: yesno
  }

  dimension_group: lead_created {
    # description: "TODO"
    sql: ${TABLE}.lead_created_date__c ;;
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
    group_label: "Marketing"
  }

  dimension: lead_source_detail {
    # description: "TODO"
    sql: ${TABLE}.lead_source_detail__c ;;
    type: string
    group_label: "Marketing"
  }

  dimension: lead_source_detail_upon_conversion {
    # description: "TODO"
    sql: ${TABLE}.lead_source_detail_upon_conversion__c ;;
    type: string
    group_label: "Marketing"
  }

  dimension: lead_source_upon_conversion {
    # description: "TODO"
    sql: ${TABLE}.lead_source_upon_conversion__c ;;
    type: string
    group_label: "Marketing"
  }

  dimension: lead_type {
    # description: "TODO"
    sql: ${TABLE}.lead_type__c ;;
    type: string
    group_label: "Marketing"
  }

  dimension: lead_id {
    # description: "TODO"
    sql: ${TABLE}.leadid__c ;;
    group_label: "Marketing"
  }

  dimension: leadsource {
    type: string
    sql: ${TABLE}.leadsource ;;
    group_label: "Marketing"
  }

  dimension: lead_source {
    description: "Source of the opportunity, for example, Advertisement, Partner, or Web. Entry is selected from a picklist of available values, which are set by an administrator."
    sql: ${TABLE}.leadsource ;;
    type: string
  }

  dimension_group: mql {
    description: "Marketing Qualified Lead Date"
    sql: ${TABLE}.mql_date__c ;;
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
    group_label: "Marketing"
  }

  dimension: name {
    description: "Name of the opportunity, for example, Acme.com - Office Equipment Order. Up to 120 characters are allowed in this field."
    sql: ${TABLE}.name ;;
    type: string
    link: {
      url: "@{salesforce_link}{{sfid}}"
    }
    label: "Name"
  }

  dimension: new_expansion_total {
    # description: "TODO"
    sql: ${TABLE}.new_expansion_total__c ;;
    type: number
    value_format_name: mm_usd_short
    group_label: "Amount"
  }

  dimension: new_logo {
    # description: "TODO"
    sql: ${TABLE}.new_logo__c ;;
    type: string
    group_label: "Marketing"
  }

  dimension: order_type {
    # description: "TODO"
    sql: ${TABLE}.order_type__c ;;
    type: string
    label: "Order Type"
  }

  dimension: original_opportunity {
    # description: "TODO"
    sql: ${TABLE}.original_opportunity__c ;;
    type: string
    group_label: "Original Opportunity"
  }

  dimension: original_opportunity_amount {
    # description: "TODO"
    sql: ${TABLE}.original_opportunity_amount__c ;;
    type: number
    value_format_name: mm_usd_short
    group_label: "Original Opportunity"
  }

  dimension: original_opportunity_arr {
    # description: "TODO"
    label: "Original Opportunity ARR"
    sql: ${TABLE}.original_opportunity_arr__c ;;
    type: number
    value_format_name: mm_usd_short
    group_label: "Original Opportunity"
  }

  dimension_group: original_opportunity_end {
    type: time
    # description: "TODO"
    sql: ${TABLE}.original_opportunity_end_date__c ;;
    timeframes: [
      date,
      month,
      quarter,
      year
    ]
    group_label: "Original Opportunity"
  }

  dimension: original_opportunity_length_in_months {
    # description: "TODO"
    sql: ${TABLE}.original_opportunity_length_in_months__c ;;
    type: number
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
    description: "Likelihood that opportunity will close, stated as a percentage."
    sql: ${TABLE}.probability ;;
    type: number
    value_format_name: mm_integer_percent
  }

  dimension: probability_color_tiers {
    description: "Likelihood that opportunity will close, stated as a percentage."
    sql: ${probability} ;;
    html: @{colored_tiered_percent} ;;
    type: number
#     value_format_name: mm_integer_percent
    label: "Prob %"
  }

  dimension: renewal_amount_total {
    # description: "TODO"
    sql: ${TABLE}.renewal_amount_total__c ;;
    type: number
    value_format_name: mm_usd_short
    group_label: "Renewals"
  }

  dimension_group: renewal_created {
    type: time
    # description: "TODO"
    sql: ${TABLE}.renewal_created_date__c ;;
    timeframes: [
      date,
      month,
      quarter,
      year
    ]
    group_label: "Renewals"
  }

  dimension: renewal_includes_leftover_expansion {
    # description: "TODO"
    sql: ${TABLE}.renewal_includes_leftover_expansion__c ;;
    type: string
    group_label: "Renewals"
  }

  dimension: renewal_risk_amount {
    # description: "TODO"
    sql: ${TABLE}.renewal_risk_amount__c ;;
    type: number
    value_format_name: mm_usd_short
    group_label: "Renewals"
  }

  dimension: renewal_risk_competitor {
    # description: "TODO"
    sql: ${TABLE}.renewal_risk_competitor__c ;;
    type: string
    group_label: "Renewals"
  }

  dimension: renewal_risk_reason_additional_details {
    # description: "TODO"
    sql: ${TABLE}.renewal_risk_reason_additional_details__c ;;
    type: string
    group_label: "Renewals"
  }

  dimension: renewal_risk_reasons {
    # description: "TODO"
    sql: ${TABLE}.renewal_risk_reasons__c ;;
    type: string
    group_label: "Renewals"
  }

  dimension: renewal_risk_status {
    # description: "TODO"
    sql: ${TABLE}.renewal_risk_status__c ;;
    type: string
    group_label: "Renewals"
  }

  dimension: renewed_by_opp_arr {
    # description: "TODO"
    label: "Renewed By Opportunity ARR"
    sql: ${TABLE}.renewed_by_opp_arr__c ;;
    type: number
    value_format_name: mm_usd_short
    group_label: "Renewals"
  }

  dimension: renewed_by_opp_prob {
    # description: "TODO"
    label: "Renewed By Opportunity Probability"
    sql: ${TABLE}.renewed_by_opp_prob__c ;;
    type: number
    value_format_name: mm_integer_percent
    group_label: "Renewals"
  }

  dimension: renewed_by_opportunity_id {
    # description: "TODO"
    sql: ${TABLE}.renewed_by_opportunity_id__c ;;
    type: string
    group_label: "Renewals"
  }

  dimension: sfid {
    primary_key: yes
    # description: "TODO"
    sql: ${TABLE}.sfid ;;
    type: string
    label: "Oppt. ID"
  }

  dimension_group: systemmodstamp {
    label: "System Mod Timestamp"
    required_access_grants: [debugging_fields]
    sql: ${TABLE}.systemmodstamp ;;
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    type: time
    group_label: "Last Modified"
  }

  dimension: territory {
    description: "Territory with which the opportunity is associated."
    sql: ${TABLE}.territory__c ;;
    type: string
  }

  dimension: type {
    description: "Type of opportunity, for example, Existing Business or New Business. Entry is selected from a picklist of available values, which are set by an administrator."
    label: "Type"
    sql: ${TABLE}.type ;;
    type: string
  }


  #
  # Measures
  #

  # BP
  measure: avg_opportunity_probability {
    # description: "TODO"
    sql: ${probability};;
    type: average
    value_format_name: mm_integer_percent
  }

# Measure
  measure: count {
    description: "The total number of opportunities"
    # BP
    drill_fields: [opportunity_drill_fields_long*]
    label: "# of Opportunities"
    type: count
  }

  measure: total_amount {
    # description: "TODO"
    group_label: "Total Amounts"
    sql: ${amount};;
    type: sum
    value_format_name: mm_usd_short
  }

  measure: total_amount_in_commit {
    # description: "TODO"
    group_label: "Total Amounts"
    sql: ${amount_in_commit};;
    type: sum
    value_format_name: mm_usd_short
  }

  measure: total_amount_in_pipeline {
    # description: "TODO"
    group_label: "Total Amounts"
    sql: ${amount_in_pipeline};;
    type: sum
    value_format_name: mm_usd_short
  }

  measure: total_delta_amount {
    # description: "TODO"
    group_label: "Total Amounts"
    sql: ${delta_amount};;
    type: sum
    value_format_name: mm_usd_short
  }

  measure: total_original_opportunity_amount {
    # description: "TODO"
    group_label: "Total Amounts"
    sql: ${original_opportunity_amount};;
    type: sum
    value_format_name: mm_usd_short
  }

  measure: total_renewal_amount_total {
    # description: "TODO"
    group_label: "Total Amounts"
    sql: ${renewal_amount_total};;
    type: sum
    value_format_name: mm_usd_short
  }

  measure: total_renewal_risk_amount {
    # description: "TODO"
    group_label: "Total Amounts"
    sql: ${renewal_risk_amount};;
    type: sum
    value_format_name: mm_usd_short
  }


  #
  # Hidden Fields (Used for derived values or joins)
  #


}
