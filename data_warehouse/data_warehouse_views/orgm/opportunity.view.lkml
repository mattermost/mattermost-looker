# BP
# Opportunity data from salesforce.
#
# Groups Labels
# - Amounts
# - Account
# - ARR
# - Total Amounts
# - System
# - Marketing
# - Renewals
# - Forecast
# - Closed
# - Created


include: "_hc_fields.view"
include: "_systemmodstamp.view"

view: opportunity {
  sql_table_name: orgm.opportunity ;;
  extends: [ _hc_fields, _systemmodstamp ]

  # BP: Leverage sets for drill fields
  drill_fields: [opportunity_drill_fields*]


  #
  # Sets
  #

  set: opportunity_drill_fields {
    fields: [sfid, name]
  }

  set: opportunity_drill_fields_long {
    fields: [sfid, name]
    #opportunitylineitem.count
  }

  set: opportunity_core {
    fields: [
      name,
      sfid,
      close_date,
      close_month,
      close_fiscal_quarter_of_year,
      close_fiscal_year,
      license_start_date,
      license_start_month,
      license_start_fiscal_quarter_of_year,
      license_start_fiscal_year,
      license_end_date,
      license_end_month,
      license_end_fiscal_quarter_of_year,
      license_end_fiscal_year,
      iswon,
      stagename,
      probability,
      owner_name,
      csm_name,
      type
    ]
  }




  #
  # Filters
  #

  filter:   is_closed_curr_mo {
    type: yesno
    sql: ${close_month} = get_sys_var('curr_mo') ;;
    label: "Close Current Month"

  }


  #
  # Dimensions
  #

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

  dimension: campaignid {
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
      fiscal_quarter,
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

  dimension: createdbyid {
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

  dimension: csm_name {
    type: string
    sql: ${opportunity_csm.name};;
    group_label: "Renewals"
    label: "CSM Name"
  }

  dimension: expectedrevenue {
    description: "Calculated revenue based on the Amount and Probability fields."
    sql: ${TABLE}.expectedrevenue ;;
    type: number
    value_format_name: mm_usd_short
    group_label: "Amounts"
    label: "Expected Revenue"
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

  # BP: use is_ for yes/no fields
  dimension: isclosed {
    # description: "TODO"
    sql: ${TABLE}.isclosed ;;
    type: yesno
    label: "Closed?"
    group_label: "Closed"
  }

  dimension: isdeleted {
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

  dimension: lastmodifiedbyid {
    type: string
    sql: ${TABLE}.lastmodifiedbyid ;;
  }

  dimension_group: lastmodified {
    type: time
    timeframes: [
      date,
      month,
      fiscal_quarter,
      fiscal_quarter_of_year,
      year,
      fiscal_year
    ]
    sql: ${TABLE}.lastmodifieddate ;;
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
    description: "Name of the Opportunity"
    sql: ${TABLE}.name ;;
    type: string
    link: {
      url: "@{salesforce_link}{{sfid}}"
      label: "Salesforce Opportunity"
    }
    label: "Name"
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

  dimension: original_opportunity_sfid {
    # description: "TODO"
    sql: coalesce(${TABLE}.original_opportunity__c, ${TABLE}.original_opportunity_id__c) ;;
    type: string
    label: "Original Opportunity SFID"
  }

  dimension: ownerid {
    label: "Owner ID"
    sql: ${TABLE}.ownerid ;;
    type: string
  }

  dimension: owner_name {
    type: string
    sql: ${opportunity_owner.name};;
    label: "Owner Name"
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

  dimension: renewed_by_opportunity_id {
    # description: "TODO"
    sql: ${TABLE}.renewed_by_opportunity_id__c ;;
    type: string
    group_label: "Renewals"
  }

  dimension: sfid {
    label: "Opportunity SFID"
    primary_key: yes
    # description: "TODO"
    sql: ${TABLE}.sfid ;;
    type: string
  }

  dimension: stagename {
    description: "Forecast Stage"
    label: "Stage"
    sql: ${TABLE}.stagename ;;
    type: string
  }

  dimension: status_wlo {
    case: {
      when: {
        sql: ${iswon};;
        label: "Won"
      }
      when: {
        sql: ${isclosed};;
        label: "Lost"
      }
      else: "Open"
    }
    type: string
    label: "Status"
  }

  dimension: type {
    description: "Type of Opportunity. For example, New, Renewal, etc."
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
    sql: ${sfid} ;;
    drill_fields: [opportunity_drill_fields_long*]
    label: "# of Opportunities"
    type: count_distinct
  }

  measure: total_amount {
    # description: "TODO"
    group_label: "Total Amounts"
    sql: ${amount};;
    type: sum
    value_format_name: mm_usd_short
  }

  measure: arr {
    description: "Annual Recurring Revenue"
    group_label: "ARR"
    label: "ARR"
    sql: ${opportunitylineitem.arr} ;;
    type: sum
    value_format_name: mm_usd_short
    sql_distinct_key: ${opportunitylineitem.sfid} ;;
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
