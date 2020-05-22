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
    fields: [account.name,name,owner_name,csm_name, close_date, status_wlo, stagename,
             forecastcategoryname, total_new_amount, total_exp_amount, total_ren_amount]
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
      forecastcategoryname,
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
    sql: ${close_month} = util.get_sys_var('curr_mo') ;;
    label: "Close Current Month?"
    group_label: "Close"

  }

  filter:   is_closed_curr_yr {
    type: yesno
    sql: ${close_fiscal_year} = util.get_sys_var('curr_fy') ;;
    label: "Close Current Fiscal Year?"
    group_label: "Close"

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
    group_label: "Renewals"
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
      week,
      month,
      fiscal_quarter,
      fiscal_quarter_of_year,
      year,
      fiscal_year
    ]
    type: time
    group_label: "Close"
  }

  dimension: close_yyyy_mm {
    type: string
    sql: to_char(${TABLE}.closedate,'YYYY-MM');;
    label: "Close YYYY-MM"
    group_label: "Close"
  }

  dimension: close_yyyy_qq {
    type: string
    sql: ${close_fiscal_year} || '-' || ${close_fiscal_quarter_of_year};;
    label: "Close YYYY-QQ"
    group_label: "Close"
  }

  dimension: close_current_fy {
    type:  yesno
    sql: ${close_fiscal_year} = util.fiscal_year(current_date);;
    group_label: "Close"
    label: "Close Current FY"
  }

  dimension: close_current_qtr {
    type:  yesno
    sql:${close_fiscal_quarter_of_year} = util.fiscal_quarter(current_date) AND ${close_fiscal_year} = util.fiscal_year(current_date);;
    group_label: "Close"
    label: "Close Current Qtr"
  }

  dimension: close_in_renewal_qtr {
    type:  yesno
    sql: util.fiscal_quarter(${TABLE}.closedate) ||'-'|| util.fiscal_year(${TABLE}.closedate) = util.fiscal_quarter(${license_start_date}) ||'-'|| util.fiscal_year(${license_start_date});;
    group_label: "Close"
    label: "Closed in Renewal Qtr?"
  }

  dimension: close_vs_renewal_qtr {
    type:  string
    sql: CASE WHEN ${close_fiscal_quarter} < ${license_start_fiscal_quarter} THEN 'Early' WHEN ${close_fiscal_quarter} = ${license_start_fiscal_quarter} THEN 'Same' ELSE 'Late' END;;
    group_label: "Close"
    label: "Same, Early or Later Renewal by Qtr"
  }

  dimension: close_current_mo {
    type:  yesno
    sql: date_trunc('month',${TABLE}.closedate)::date = date_trunc('month',current_date);;
    group_label: "Close"
    label: "Close Current Mo"
  }


  dimension: close_quarter {
    type:  string
    sql:${close_fiscal_year} || '-' || ${close_fiscal_quarter_of_year};;
    group_label: "Close"
  }

  dimension: contactid {
    # description: "TODO"
    sql: ${TABLE}.contactid ;;
    type: string
    group_label: "System"
  }

  dimension: createdbyid {
    description: "The ID of the user who created the opportunity"
    sql: ${TABLE}.createdbyid ;;
    type: string
    group_label: "System"
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
    group_label: "System"
  }

  dimension: csm_name {
    type: string
    sql: ${opportunity_csm.name};;
    label: "CSM Owner Name"
  }

  dimension: e_purchase_date__c {
    type: date
    sql: ${TABLE}.e_purchase_date__c ;;
    label: "E-Purchase Date"
  }

  dimension: expectedrevenue {
    description: "Calculated revenue based on the Amount and Probability fields."
    sql: ${TABLE}.expectedrevenue ;;
    type: number
    value_format_name: mm_usd_short
    label: "Expected Revenue"
    group_label: "Forecasting"
  }


  dimension: forecastcategoryname {
    type: string
    sql: ${TABLE}.forecastcategoryname ;;
    group_label: "Forecasting"
    label: "Forecast Category"
    order_by_field: forecastcategoryname_sort
  }

  dimension: forecastcategoryname_sort {
    type: number
    sql: CASE
          WHEN ${forecastcategoryname} = 'Closed' THEN 1
          WHEN ${forecastcategoryname} = 'Commit' THEN 2
          WHEN ${forecastcategoryname} = 'Best Case' THEN 3
          WHEN ${forecastcategoryname} = 'Pipeline' THEN 4
          WHEN ${forecastcategoryname} = 'Omitted' THEN 5
        ELSE 6 END ;;
    group_label: "Forecasting"
    label: "Forecast Category Name"
    hidden: yes
  }

  # BP: use is_ for yes/no fields
  dimension: isclosed {
    # description: "TODO"
    sql: ${TABLE}.isclosed ;;
    type: yesno
    label: "Closed?"
    group_label: "Close"
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
    group_label: "Close"
  }

  dimension: lastmodifiedbyid {
    type: string
    sql: ${TABLE}.lastmodifiedbyid ;;
    group_label: "System"
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
    group_label: "System"
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

  dimension: license_key {
    type: string
    sql: ${TABLE}.license_key__c ;;
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
    group_label: "License Dates (Deprecating)"
  }

  dimension: license_end_yyyy_mm {
#    description: "Date when the license is ending. Max end date of all Product Line Items in Opportunity."
    sql: to_char(${TABLE}.license_end_date__c,'YYYY-MM') ;;
    type: string
    group_label: "License Dates (Deprecating)"
    label: "License End YYYY-MM"
  }

  dimension: license_end_yyyy_qq {
    type: string
    sql: ${license_end_fiscal_year} || '-' || ${license_end_fiscal_quarter_of_year};;
    label: "License End YYYY-QQ"
    group_label: "License Dates (Deprecating)"
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
    group_label: "License Dates (Deprecating)"
    }

  dimension: license_start_yyyy_qq {
    type: string
    sql: ${license_start_fiscal_year} || '-' || ${license_start_fiscal_quarter_of_year};;
    label: "License Start YYYY-QQ"
    group_label: "License Dates (Deprecating)"
    }


  dimension: license_start_yyyy_mm {
    description: "Date when the license is starting. Min start date of all Product Line Items in Opportunity."
    sql: to_char(${TABLE}.license_end_date__c,'YYYY-MM') ;;
    type: string
    group_label: "License Dates (Deprecating)"
    label: "License Start YYYY-MM"
  }

  dimension: lost_reason {
    group_label: "Lost Details"
    type: string
    sql: ${TABLE}.lost_reason__c ;;
  }

  dimension: lost_to_competitor {
    group_label: "Lost Details"
    type: string
    sql: ${TABLE}.lost_to_competitor__c ;;
  }

  dimension: lost_reason_details {
    group_label: "Lost Details"
    type: string
    sql: ${TABLE}.closed_lost_other__c ;;
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
    label: "Oppt Name"
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
    sql: coalesce(${TABLE}.original_opportunity__c, ${TABLE}.original_opportunity_id__c) ;;
    type: string
    label: "Original Opportunity SFID"
    group_label: "Renewals"
  }

  measure: original_opportunity_amount {
    sql: ${TABLE}.original_opportunity_amount__c ;;
    type: sum
    label: "Original Opportunity Amount"
    group_label: "Original Opportunity"
  }


  dimension_group: original_opportunity_end {
    convert_tz: no
    description: "Date when the opportunity is expected to close."
    sql: ${TABLE}.original_opportunity_end_date__c ;;
    timeframes: [
      date,
      week,
      month,
      fiscal_quarter,
      year,
      fiscal_year
    ]
    type: time
    group_label: "Original Opportunity End"
  }

  dimension: ownerid {
    label: "Owner ID"
    sql: ${TABLE}.ownerid ;;
    type: string
    group_label: "System"
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
    group_label: "Forecasting"
  }

  dimension: probability_color_tiers {
    description: "Likelihood that opportunity will close, stated as a percentage."
    sql: ${probability} ;;
    html: @{colored_tiered_percent} ;;
    type: number
#     value_format_name: mm_integer_percent
    label: "Prob %"
    group_label: "Forecasting"
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
    sql: ${TABLE}.renewal_risk_status__c;;
    type: string
    group_label: "Renewals"
  }

  dimension: renewed_by_opportunity_id {
    # description: "TODO"
    sql: ${TABLE}.renewed_by_opportunity_id__c ;;
    type: string
    group_label: "Renewals"
  }

  dimension: sales_channel {
    type: string
    sql: CASE WHEN ${e_purchase_date__c} IS NULL THEN 'Direct Sales' ELSE 'Self Service' END;;
    label: "Sales Channel"
    description: "Direct Sales or Self Service"
  }


  dimension: sfid {
    label: "Oppt SFID"
    primary_key: yes
    # description: "TODO"
    sql: ${TABLE}.sfid ;;
    type: string
  }

  dimension: stagename {
    description: "Oppt Stage"
    label: "Stage"
    sql: ${TABLE}.stagename ;;
    type: string
    group_label: "Forecasting"
  }

  dimension: status_wlo {
    sql: ${TABLE}.status_wlo__c;;
    label: "Status WLO"
    description: "Values are Won, Open or Lost"
    type: string
    group_label: "Forecasting"
  }

  dimension: territory_sales_segment {
    type: string
    sql: CASE WHEN  ${TABLE}.territory_segment__c  = 'AMER_APAC' THEN 'AMER/APAC' ELSE ${TABLE}.territory_segment__c END;;
    group_label: "Territory"
    label: "Territory Sales Segment"
  }

  dimension: type {
    description: "Type of Opportunity. For example, New, Renewal, etc."
    label: "Oppt Type"
    sql: ${TABLE}.type ;;
    type: string
  }

#   dimension: won_reason {
#     group_label: "Won Details"
#     label: "Won Reason"
# #     TO BE ADDED IN SFDC
#     sql: ${TABLE}. ;;
#     type: string
#   }
#
#   dimension: won_reason_details {
#     group_label: "Won Details"
#     label: "Won Reason Details"
#     #     TO BE ADDED IN SFDC
#     sql: ${TABLE}. ;;
#     type: string
#   }


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

  measure: arr {
    description: "Annual Recurring Revenue"
    group_label: "ARR"
    label: "ARR"
    sql: ${opportunitylineitem.arr} ;;
    type: sum
    value_format_name: mm_usd_short
    sql_distinct_key: ${opportunitylineitem.sfid} ;;
  }

  measure: count {
    description: "The total number of opportunities"
    sql: ${sfid} ;;
    drill_fields: [opportunity_drill_fields*]
    label: "# Oppts"
    group_label: "Counts"
    type: count_distinct
  }

  measure: count_lost_oppt {
    description: "The total number of open opportunities"
    sql: ${sfid} ;;
    drill_fields: [opportunity_drill_fields*]
    label: "# Oppts (Lost)"
    group_label: "Counts"
    type: count_distinct
    filters: {
      field: status_wlo
      value: "Lost"
    }
  }

  measure: count_open_oppt {
    description: "The total number of open opportunities"
    sql: ${sfid} ;;
    drill_fields: [opportunity_drill_fields*]
    label: "# Oppts (Open)"
    group_label: "Counts"
    type: count_distinct
    filters: {
      field: status_wlo
      value: "Open"
    }
  }

  measure: count_won_oppt {
    description: "The total number of open opportunities"
    sql: ${sfid} ;;
    drill_fields: [opportunity_drill_fields*]
    label: "# Oppts (Won)"
    group_label: "Counts"
    type: count_distinct
    filters: {
      field: status_wlo
      value: "Won"
    }
  }

  measure: count_open_oppt_current_fy {
    group_label: "Current FY Close"
    group_item_label: "# Oppts (Open CFY)"
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

  measure: total_renewal_at_risk_amount {
    label: "At Risk Renewal Amount"
    group_label: "Total Amounts"
    sql: ${renewal_risk_amount};;
    filters: [renewal_risk_status: "At Risk"]
    type: sum
    value_format_name: mm_usd_short
    drill_fields: [opportunity_drill_fields*,total_renewal_risk_amount]
  }

  measure: total_renewal_early_warning_amount {
    label: "Early Warning Renewal Amount"
    group_label: "Total Amounts"
    sql: ${renewal_risk_amount};;
    filters: [renewal_risk_status: "Early Warning"]
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




  measure: total_loe_amount {
    label: "LOE Amount"
    group_label: "Product Line Type Totals"
    description: "Total where Product Line Type = 'Expansion' and Is Prorated Expansion = 'Leftover Expansion'"
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
      value: "yes"
    }
    sql_distinct_key: ${opportunitylineitem.sfid} ;;
  }

  measure: total_exp_with_loe_amount {
    description: "Total where Product Line Type = 'Expansion' (includes Co-Term and Leftover Expansion)"
    label: "Exp w/LOE Amount"
    group_label: "Product Line Type Totals"
    sql: ${opportunitylineitem.totalprice};;
    type: sum
    value_format_name: mm_usd_short
    drill_fields: [opportunity_drill_fields*,total_exp_with_loe_amount]
    filters: {
      field: opportunitylineitem.product_line_type
      value: "Expansion"
    }
    sql_distinct_key: ${opportunitylineitem.sfid} ;;
  }

  measure: total_new_and_exp_with_loe_amount {
    description: "Total where Product Line Type = 'New' or 'Expansion' (includes Co-Term and Leftover Expansion)"
    label: "New and Exp w/LOE Amount"
    group_label: "Product Line Type Totals"
    sql: ${total_new_amount}+${total_exp_with_loe_amount};;
    type: number
    value_format_name: mm_usd_short
    drill_fields: [opportunity_drill_fields*,total_new_amount,total_exp_with_loe_amount,total_new_and_exp_with_loe_amount]
  }




  measure: total_exp_count {
    group_label: "Counts"
    label: "# OLI (Exp)"
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
    description: "Total where Product Line Type = 'Expansion'"
    label: "Exp Amount"
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

  measure: total_exp_amount_self_serve {
    description: "Total where Product Line Type = 'Expansion' and E Purchase Date is Filled In"
    label: "Exp Amount (Self Serve)"
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
      field: opportunity.sales_channel
      value: "Self Service"
    }
    sql_distinct_key: ${opportunitylineitem.sfid} ;;
  }

  measure: total_new_count {
    group_label: "Counts"
    label: "# OLI (New)"
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
    label: "New Amount"
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

  measure: total_new_amount_self_serv {
    description: "Total where Product Line Type = 'New' and E Purchase Date is Filled In"
    label: "New Amount (Self Serve)"
    group_label: "Product Line Type Totals"
    sql: ${opportunitylineitem.totalprice};;
    type: sum
    value_format_name: mm_usd_short
    drill_fields: [opportunity_drill_fields*,total_new_amount]
    filters: {
      field: opportunitylineitem.product_line_type
      value: "New"
    }
    filters: {
      field: opportunity.sales_channel
      value: "Self Service"
    }
    sql_distinct_key: ${opportunitylineitem.sfid} ;;
  }

  measure: total_new_exp_count {
    group_label: "Counts"
    label: "# OLI (New & Exp)"
    sql: ${total_new_count}+${total_exp_count};;
    type: number
    drill_fields: [opportunity_drill_fields*,total_new_amount]
  }

  measure: total_new_and_exp_amount {
    description: "Total where Product Line Type = 'New' or 'Expansion' (includes Co-Term and Leftover Expansion)"
    label: "New and Exp Amount"
    group_label: "Product Line Type Totals"
    sql: ${total_new_amount}+${total_exp_amount};;
    type: number
    value_format_name: mm_usd_short
    drill_fields: [opportunity_drill_fields*,total_new_amount,total_exp_amount,total_new_and_exp_amount]
  }

  measure: total_new_and_exp_amount_self_serve {
    description: "Total where Product Line Type = 'New' or 'Expansion' (includes Co-Term and Leftover Expansion) and E Purchase Date is Filled In"
    label: "New and Exp Amount (Self Serve)"
    group_label: "Product Line Type Totals"
    sql: ${total_new_amount_self_serv}+${total_exp_amount_self_serve};;
    type: number
    value_format_name: mm_usd_short
    drill_fields: [opportunity_drill_fields*,total_new_amount,total_exp_amount,total_new_and_exp_amount]
  }

  measure: total_ren_amount {
    description: "Total where Product Line Type = 'Ren'"
    label: "Ren Amount"
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

  measure: total_ren_amount_self_serve {
    description: "Total where Product Line Type = 'Ren' and E Purchase Date is Filled In"
    label: "Ren Amount (Self Serve)"
    group_label: "Product Line Type Totals"
    sql: ${opportunitylineitem.totalprice};;
    type: sum
    value_format_name: mm_usd_short
    drill_fields: [opportunity_drill_fields*,total_ren_amount]
    filters: {
      field: opportunitylineitem.product_line_type
      value: "Ren"
    }
    filters: {
      field: opportunity.sales_channel
      value: "Self Service"
    }
    sql_distinct_key: ${opportunitylineitem.sfid} ;;
  }

  measure: total_multi_amount {
    description: "Total where Product Line Type = 'Multi'"
    label: "Multi Amount"
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

  measure: total_multi_amount_self_service {
    description: "Total where Product Line Type = 'Multi' and E Purchase Date is Filled In"
    label: "Multi Amount (Self Serve)"
    group_label: "Product Line Type Totals"
    sql: ${opportunitylineitem.totalprice};;
    type: sum
    value_format_name: mm_usd_short
    drill_fields: [opportunity_drill_fields*,total_multi_amount]
    filters: {
      field: opportunitylineitem.product_line_type
      value: "Multi"
    }
    filters: {
      field: opportunity.sales_channel
      value: "Self Service"
    }
    sql_distinct_key: ${opportunitylineitem.sfid} ;;
  }

  measure: new_logo_count {
    label: "# New Logo"
    group_label: "Counts"
    sql: ${opportunity.sfid};;
    type: count_distinct
    drill_fields: [opportunity_drill_fields*,new_logo]
    filters: {
      field: new_logo
      value: "Yes"
    }
  }

  #  measure: total_loe_amount_5k_plus {
#    label: "LOE Amount ($5k+)"
#    group_label: "Product Line Type Totals"
#    sql: ${opportunitylineitem.totalprice};;
#    type: sum
#    value_format_name: mm_usd_short
#    drill_fields: [opportunity_drill_fields*,total_exp_amount]
#    filters: {
#      field: opportunitylineitem.product_line_type
##      value: "Expansion"
#    }
#    filters: {
#      field: opportunitylineitem.is_loe
#      value: "yes"
#    }
#    filters: {
#      field: opportunity_ext.new_and_expansion_amount
#      value: ">5000"
#    }
#    sql_distinct_key: ${opportunitylineitem.sfid} ;;
#  }

#  measure: new_logo_count_5k_plus {
#    label: "# New Logo ($5k+)"
#    group_label: "Counts"
#    sql: ${opportunity.sfid};;
#    type: count_distinct
#    drill_fields: [opportunity_drill_fields*,new_logo]
#    filters: {
#      field: new_logo
#      value: "Yes"
#    }
#    filters: {
#      field: opportunity_ext.new_and_expansion_amount
#      value: ">5000"
#    }
#  }

#  measure: count_5k_plus {
#    description: "The total number of opportunities"
#    sql: ${sfid} ;;
#    drill_fields: [opportunity_drill_fields*]
#    label: "# Oppts ($5k+)"
#    group_label: "Counts"
#    type: count_distinct
##    filters: {
#      field: opportunity_ext.new_and_expansion_amount
#      value: ">5000"
#    }
#  }


#  measure: total_new_and_exp_with_loe_amount_5k_plus {
#    label: "New and Exp w/LOE Amount ($5k+)"
#    group_label: "Product Line Type Totals"
#    sql: ${total_new_amount_5k_plus}+${total_exp_with_loe_amount_5k_plus};;
#    type: number
#    value_format_name: mm_usd_short
##    drill_fields: [opportunity_drill_fields*,total_new_amount,total_exp_with_loe_amount,total_new_and_exp_with_loe_amount]
#  }

#  measure: total_new_and_exp_amount_5k_plus {
#    label: "New and Exp Amount ($5k+)"
 #   group_label: "Product Line Type Totals"
 #   sql: ${total_new_amount_5k_plus}+${total_exp_amount_5k_plus};;
#    type: number
#    value_format_name: mm_usd_short
#    drill_fields: [opportunity_drill_fields*,total_new_amount,total_exp_amount,total_new_and_exp_amount]
#  }


#  measure: total_new_amount_5k_plus {
#    label: "New Amount ($5k+)"
 #   group_label: "Product Line Type Totals"
#    sql: ${opportunitylineitem.totalprice};;
#    type: sum
#    value_format_name: mm_usd_short
#    drill_fields: [opportunity_drill_fields*,total_new_amount]
#    filters: {
#      field: opportunitylineitem.product_line_type
#      value: "New"
#    }
#    filters: {
#      field: opportunity_ext.new_and_expansion_amount
#      value: ">5000"
#    }
#    sql_distinct_key: ${opportunitylineitem.sfid} ;;
#  }

#  measure: total_exp_with_loe_amount_5k_plus {
#    label: "Exp w/LOE Amount ($5k+)"
#    group_label: "Product Line Type Totals"
#    sql: ${opportunitylineitem.totalprice};;
#    type: sum
#    value_format_name: mm_usd_short
#    drill_fields: [opportunity_drill_fields*,total_exp_with_loe_amount]
#    filters: {
#      field: opportunitylineitem.product_line_type
#      value: "Expansion"
#    }
#    filters: {
#      field: opportunity_ext.new_and_expansion_amount
#      value: ">5000"
#    }
#    sql_distinct_key: ${opportunitylineitem.sfid} ;;
#  }

#  measure: total_exp_amount_5k_plus {
#    label: "Exp Amount ($5k+)"
#    group_label: "Product Line Type Totals"
#    sql: ${opportunitylineitem.totalprice};;
#    type: sum
#    value_format_name: mm_usd_short
#    drill_fields: [opportunity_drill_fields*,total_exp_amount]
#    filters: {
#      field: opportunitylineitem.product_line_type
#      value: "Expansion"
#    }
#    filters: {
#      field: opportunitylineitem.is_loe
#      value: "no"
#    }
#    filters: {
#      field: opportunity_ext.new_and_expansion_amount
 #     value: ">5000"
 #   }
 #   sql_distinct_key: ${opportunitylineitem.sfid} ;;
 # }


  #
  # Hidden Fields (Used for derived values or joins)
  #


}
