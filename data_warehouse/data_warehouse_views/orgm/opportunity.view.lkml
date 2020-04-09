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
    fields: [account.name,name,owner_name,csm_name]
  }

  set: opportunity_core {
    fields: [
      name,
      sfid,
      close_date,
      close_month,
      close_fiscal_quarter_of_year,
      close_quarter,
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

  dimension: known_attrition_curr_fy {
    type: yesno
    sql: ${accountid} in ('0013600000j6g7oAAA','0013600000dCeAzAAK') ;;
  }

  dimension: amount {
    description: "The estimated total sale amount. For opportunities with products, the amount is the sum of the related products. Any attempt to update this field, if the record has products, will be ignored. The update call will not be rejected, and other fields will be updated as specified, but the Amount will be unchanged."
    group_label: "Amounts"
    # BP: Override drill fields using sets
    drill_fields: [opportunity_drill_fields*,amount]
    sql: ${TABLE}.amount ;;
    type: number

    # BP: Leverage named value formats
    value_format: "@{mm_usd_short}"
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

  dimension: e_purchase_date__c {
    type: date
    sql: ${TABLE}."e_purchase_date__c" ;;
    label: "E-Purchase Date"
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
    sql: ${TABLE}.lead_source_text__c ;;
    group_label: "Marketing"
    label: "Lead Source"
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
    sql: CASE WHEN ${TABLE}.renewal_risk_reasons__c = 'No relationship with Decision Maker' THEN 'No Tie to Decision Maker' ELSE ${TABLE}.renewal_risk_reasons__c END;;
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
    sql: ${TABLE}.status_wlo__c;;
    label: "Status WLO"
    type: string
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
    drill_fields: [opportunity_drill_fields*]
    label: "# of Opportunities"
    type: count_distinct
  }

  measure: count_open_oppt {
    description: "The total number of open opportunities"
    sql: ${sfid} ;;
    drill_fields: [opportunity_drill_fields*]
    label: "# of Open Oppty"
    type: count_distinct
    filters: {
      field: isclosed
      value: "no"
    }
  }

  measure: count_open_oppt_current_fy {
    group_label: "Current FY Close"
    group_item_label: "# of Open Oppty"
    description: "The total number of open opportunities set to close this fiscal year"
    sql: ${sfid} ;;
    drill_fields: [opportunity_drill_fields*]
    label: "# of Open Oppty (Curr FY Close)"
    type: count_distinct
    filters: {
      field: isclosed
      value: "no"
    }
    filters: {
      field: close_current_fy
      value: "yes"
    }
  }

  measure: risk_amount_current_fy {
    group_label: "Current FY Close"
    group_item_label: "Renewal At Risk & Early Warning Amount"
    description: "At Risk & Early Warning amount with known attrition removed (FY21 JPMC & Uber Removed)"
    sql: ${renewal_risk_amount} ;;
    drill_fields: [opportunity_drill_fields*,risk_amount_current_fy]
    label: "Risk Amount (Curr FY Close)"
    value_format_name: mm_usd_short
    type: sum
    filters: {
      field: isclosed
      value: "no"
    }
    filters: {
      field: close_current_fy
      value: "yes"
    }
    filters: {
      field: known_attrition_curr_fy
      value: "No"
    }
  }

  measure: at_risk_amount_current_fy {
    group_label: "Current FY Close"
    group_item_label: "Renewal At Risk Amount"
    description: "At Risk amount with known attrition removed (FY21 JPMC & Uber Removed)"
    sql: ${renewal_risk_amount} ;;
    drill_fields: [opportunity_drill_fields*,at_risk_amount_current_fy]
    label: "Risk Amount (Curr FY Close)"
    value_format_name: mm_usd_short
    type: sum
    filters: {
      field: isclosed
      value: "no"
    }
    filters: {
      field: close_current_fy
      value: "yes"
    }
    filters: {
      field: renewal_risk_status
      value: "At Risk"
    }
    filters: {
      field: known_attrition_curr_fy
      value: "No"
    }
  }

  measure: risk_amount_current_qtr {
    group_label: "Current Qtr Close"
    group_item_label: "Renewal At Risk & Early Warning Amount"
    description: "At Risk & Early Warning amount with known attrition removed (FY21 JPMC & Uber Removed)"
    sql: ${renewal_risk_amount} ;;
    drill_fields: [opportunity_drill_fields*,risk_amount_current_qtr]
    label: "At Risk & Early Warning Amount (Curr Qtr Close)"
    value_format_name: mm_usd_short
    type: sum
    filters: {
      field: isclosed
      value: "no"
    }
    filters: {
      field: close_current_qtr
      value: "yes"
    }
    filters: {
      field: known_attrition_curr_fy
      value: "No"
    }
  }

  measure: at_risk_amount_current_qtr {
    group_label: "Current Qtr Close"
    group_item_label: "Renewal At Risk Amount"
    description: "At Risk amount with known attrition removed (FY21 JPMC & Uber Removed)"
    sql: ${renewal_risk_amount} ;;
    drill_fields: [opportunity_drill_fields*,at_risk_amount_current_qtr]
    label: "At Risk Amount (Curr Qtr Close)"
    value_format_name: mm_usd_short
    type: sum
    filters: {
      field: isclosed
      value: "no"
    }
    filters: {
      field: close_current_qtr
      value: "yes"
    }
    filters: {
      field: renewal_risk_status
      value: "At Risk"
    }
    filters: {
      field: known_attrition_curr_fy
      value: "No"
    }
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
    drill_fields: [opportunity_drill_fields*,total_renewal_risk_amount]
  }

  measure: total_renewal_risk_amount_open {
    # description: "TODO"
    group_label: "Total Amounts"
    sql: ${renewal_risk_amount};;
    type: sum
    value_format_name: mm_usd_short
    drill_fields: [opportunity_drill_fields*,total_renewal_risk_amount]
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


  #
  # Hidden Fields (Used for derived values or joins)
  #


}
