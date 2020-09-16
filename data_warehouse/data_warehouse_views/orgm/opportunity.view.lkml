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
    fields: [account.name, name, owner_name, csm_name, ce_name, close_date, created_date, status_wlo, stagename,
             forecastcategoryname, total_new_amount, total_exp_amount, total_ren_amount, type]
  }

  set: opportunity_core {
    fields: [
      name,
      sfid,
      close_date,
      close_month,
      close_fiscal_quarter_of_year,
      close_fiscal_quarter,
      close_quarter,
      close_fiscal_year,
      forecastcategoryname,
      license_start_date,
      license_start_month,
      license_start_fiscal_quarter_of_year,
      license_start_fiscal_quarter,
      license_start_fiscal_year,
      license_end_date,
      license_end_month,
      license_end_fiscal_quarter_of_year,
      license_end_fiscal_quarter,
      license_end_fiscal_year,
      iswon,
      isclosed,
      stagename,
      probability,
      owner_name,
      csm_name,
      ce_name,
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
    group_label: "Amounts"
    sql: ${opportunity_ext.amount_in_commit} ;;
    type: number
    value_format_name: mm_usd_short
  }

  dimension: amount_in_pipeline {
    group_label: "Amounts"
    sql: ${opportunity_ext.amount_in_pipeline} ;;
    type: number
    value_format_name: mm_usd_short
  }

  dimension: amount_in_best_case {
    group_label: "Amounts"
    sql: ${opportunity_ext.amount_in_best_case} ;;
    type: number
    value_format_name: mm_usd_short
  }

  dimension: campaignid {
    description: "The ID of the campaign responsible for generating the opportunity."
    sql: ${TABLE}.campaignid ;;
    type: string
    group_label: "Marketing"
  }

  dimension: billing_country {
    group_label: "Address"
    type: string
    sql: ${TABLE}.BILLING_COUNTRY__C ;;
  }

  dimension: shipping_country {
    group_label: "Address"
    type: string
    sql: ${TABLE}.SHIPPING_COUNTRY__C ;;
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
    label: "Close Current Fiscal Qtr"
  }

  dimension: close_in_renewal_qtr {
    type:  yesno
    sql: util.fiscal_quarter(${TABLE}.closedate) ||'-'|| util.fiscal_year(${TABLE}.closedate) = util.fiscal_quarter(${license_start_date}) ||'-'|| util.fiscal_year(${license_start_date});;
    group_label: "Close"
    label: "Closed in Renewal Fiscal Qtr?"
  }

  dimension: close_vs_renewal_qtr {
    type:  string
    sql: CASE WHEN ${close_fiscal_quarter} < ${license_start_fiscal_quarter} THEN 'Early' WHEN ${close_fiscal_quarter} = ${license_start_fiscal_quarter} THEN 'Same' ELSE 'Late' END;;
    group_label: "Close"
    label: "Same, Early or Later Renewal by Fiscal Qtr"
  }

  dimension: close_vs_renewal_mo {
    type:  string
    sql: CASE WHEN ${close_month} < ${license_start_month} THEN 'Early' WHEN ${close_month} = ${license_start_month} THEN 'Same' ELSE 'Late' END;;
    group_label: "Close"
    label: "Same, Early or Later Renewal by Month"
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
    label: "Close Fiscal Quarter"
    group_item_label: "Close Fiscal Quarter (String)"
    group_label: "Close"
  }

  dimension: contactid {
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
    sql: ${TABLE}.createddate ;;
    type: time
    timeframes: [
      date,
      week,
      month,
      fiscal_quarter,
      fiscal_quarter_of_year,
      year,
      fiscal_year
    ]
    group_label: "Created"
  }


  dimension: ce_name {
    type: string
    sql: ${opportunity_ce.name} ;;
    label: "Customer Engineer Name"
  }

  dimension: csm_owner_id {
     type: string
     sql: ${TABLE}.csm_owner__c ;;
     group_label: "System"
  }

  dimension: csm_name {
    type: string
    sql: ${opportunity_csm.name};;
    label: "CSM Name"
  }

  dimension: ce_owner__c {
    hidden: yes
    type: string
    sql: ${TABLE}.ce_owner__c;;
    label: "Customer Engineer ID"
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
    label: "Forecast Category Name Sort"
    hidden: yes
  }

  dimension: forecastcategoryname_short {
    type: string
    sql: CASE
    WHEN ${forecastcategoryname} = 'Closed' THEN 'WON'
    WHEN ${forecastcategoryname} = 'Commit' THEN 'CO'
    WHEN ${forecastcategoryname} = 'Best Case' THEN 'BC'
    WHEN ${forecastcategoryname} = 'Pipeline' THEN 'PL'
    WHEN ${forecastcategoryname} = 'Omitted' THEN 'OM'
    ELSE 'XX' END ;;
    group_label: "Forecasting"
    label: "FC"
    order_by_field: forecastcategoryname_short_sort
  }

  dimension: forecastcategoryname_short_sort {
    type: number
    sql: CASE
          WHEN ${forecastcategoryname_short} = 'WON' THEN 1
          WHEN ${forecastcategoryname_short} = 'CO' THEN 2
          WHEN ${forecastcategoryname_short} = 'BC' THEN 3
          WHEN ${forecastcategoryname_short} = 'PL' THEN 4
          WHEN ${forecastcategoryname_short} = 'OM' THEN 5
        ELSE 6 END ;;
    group_label: "Forecasting"
    label: "Forecast Category Short Sort"
    hidden: yes
  }

  dimension: gtm_save_motions {
    type: string
    sql: ${TABLE}.gtm_save_motions__c ;;
    group_label: "Renewals"
  }

  dimension: how_did_you_hear_about_mattermost {
    type: string
    group_label: "Customer Journey (Business)"
    sql: ${TABLE}."HOW_DID_YOU_HEAR_ABOUT_MATTERMOST__C";;
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
      date,
      month,
      fiscal_quarter,
      fiscal_quarter_of_year,
      year,
      fiscal_year
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
      date,
      month,
      fiscal_quarter,
      fiscal_quarter_of_year,
      year,
      fiscal_year
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

  dimension: next_step {
    type: string
    sql: ${TABLE}.nextstep ;;
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
    hidden: yes
    label: "Original Opportunity SFID"
    group_label: "Renewals"
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

  dimension: at_risk_date {
    # description: "TODO"
    sql: ${TABLE}.at_risk_date__c;;
    type: date
    group_label: "Renewals"
  }

  dimension: early_warning_date {
    # description: "TODO"
    sql: ${TABLE}.early_warning_date__c;;
    type: date
    group_label: "Renewals"
  }

  dimension: renewal_risk_status {
    # description: "TODO"
    sql: ${TABLE}.renewal_risk_status__c;;
    type: string
    group_label: "Renewals"
  }

  dimension: renewal_risk_status_short {
    # description: "TODO"
    sql: CASE
           WHEN ${renewal_risk_status} = 'At Risk' THEN 'AR'
           WHEN ${renewal_risk_status} = 'Early Warning' THEN 'EW'
           ELSE '' END;;
    type: string
    label: "Renewal Risk Status (Short)"
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

  dimension: stripe_id {
    sql: ${TABLE}.stripe_id__c;;
    label: "Stripe Charge ID"
    description: "Stripe Charge ID"
    type: string
    group_label: "System"
  }

  dimension: territory_sales_segment {
    type: string
    sql: CASE WHEN  ${TABLE}.territory_segment__c  = 'AMER_APAC' THEN 'AMER/APAC' ELSE ${TABLE}.territory_segment__c END;;
    group_label: "Territory"
    label: "Territory Sales Segment"
  }

  dimension: time_in_stage {
    type: number
    sql: ${TABLE}.Time_in_Stage__c ;;
  }

  dimension: type {
    description: "Type of Opportunity. For example, New, Renewal, etc."
    label: "Oppt Type"
    sql: ${TABLE}.type ;;
    type: string
  }

  dimension: use_case {
    group_label: "Customer Journey (Business)"
    type: string
    sql: ${TABLE}.Use_Case__c ;;
  }

  dimension: compelling_event {
    group_label: "Customer Journey (Business)"
    type: string
    sql: ${TABLE}.Compelling_Event__c ;;
  }

  dimension: decision_criteria_process {
    group_label: "Customer Journey (Business)"
    type: string
    sql: ${TABLE}.Decision_Criteria_Process__c ;;
  }

  dimension: competitor {
    group_label: "Customer Journey (Business)"
    type: string
    sql: ${TABLE}.Competitor__c ;;
  }

  dimension: paper_process {
    group_label: "Customer Journey (Business)"
    type: string
    sql: ${TABLE}.Paper_trail_Process__c;;
  }

  dimension: risks {
    group_label: "Customer Journey (Business)"
    type: string
    sql: ${TABLE}.Risks__c;;
  }

  dimension: open_source_user {
    group_label: "Customer Journey (Business)"
    type: string
    sql: ${TABLE}.Open_Source_User__c;;
  }

  dimension: regulatory_requirements {
    group_label: "Customer Journey (Business)"
    type: string
    sql: ${TABLE}.Regulatory_Requirements__c;;
  }

  dimension: target_go_live_date {
    group_label: "Customer Journey (Technical)"
    type: date
    sql: ${TABLE}.Target_Go_Live_Date__c;;
  }

  dimension: target_integrations {
    group_label: "Customer Journey (Technical)"
    type: string
    sql: ${TABLE}.Target_Integrations__c;;
  }

  dimension: other_integrations {
    group_label: "Customer Journey (Technical)"
    type: string
    sql: ${TABLE}.Other_Integrations__c;;
  }

  dimension: existing_chat_solution {
    group_label: "Customer Journey (Technical)"
    type: string
    sql: ${TABLE}.Existing_Chat_Solution__c;;
  }

  dimension: existing_chat_solution_details {
    group_label: "Customer Journey (Technical)"
    type: string
    sql: ${TABLE}.Existing_Chat_Solution_Details__c;;
  }

  dimension: current_productivity_platform {
    group_label: "Customer Journey (Technical)"
    type: string
    sql: ${TABLE}.Current_Productivity_Platform__c;;
  }

  dimension: data_migration_required {
    group_label: "Customer Journey (Technical)"
    type: string
    sql: ${TABLE}.Data_Migration_Required__c;;
  }

  dimension: mobile_in_scope {
    group_label: "Customer Journey (Technical)"
    type: yesno
    sql: ${TABLE}.Mobile_in_Scope__c = 'Yes';;
  }

  dimension: emm_mdm{
    label: "EMM/MDM"
    group_label: "Customer Journey (Technical)"
    type: string
    sql: ${TABLE}.EMM_MDM__c;;
  }

  dimension: current_identitiy_provider_sso{
    label: "Current Identity Provider & SSO"
    group_label: "Customer Journey (Technical)"
    type: string
    sql: ${TABLE}.Current_Identitiy_Provider_SSO__c;;
  }

  dimension: infosec_questionnaire_completed{
    group_label: "Customer Journey (Technical)"
    type: yesno
    sql: ${TABLE}.INFOSEC_Questionnaire_Completed__c = 'Yes';;
  }

  dimension: requirements{
    group_label: "Customer Journey (Technical)"
    type: string
    sql: ${TABLE}.Requirements__c;;
  }

  dimension: extended_support_release_customer{
    group_label: "Customer Journey (Technical)"
    type: string
    sql: ${TABLE}.Extended_Support_Release_Customer__c;;
  }

  dimension: additional_environment_details{
    group_label: "Customer Journey (Technical)"
    type: string
    sql: ${TABLE}.Additional_Environment_Details__c;;
  }

  dimension: enterprise_trial_completed{
    group_label: "Customer Journey (Technical)"
    type: yesno
    sql: ${TABLE}.Enterprise_Trial_Completed__c = 'Yes';;
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
    type: sum_distinct
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
    type: sum_distinct
    sql_distinct_key: ${sfid} ;;
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
    type: sum_distinct
    sql_distinct_key: ${sfid} ;;
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
    type: sum_distinct
    sql_distinct_key: ${sfid} ;;
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
    type: sum_distinct
    sql_distinct_key: ${sfid} ;;
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
    type: sum_distinct
    sql_distinct_key: ${sfid} ;;
    value_format_name: mm_usd_short
  }

  measure: total_amount_in_commit {
    # description: "TODO"
    group_label: "Total Amounts"
    sql: ${amount_in_commit};;
    type: sum_distinct
    sql_distinct_key: ${sfid} ;;
    value_format_name: mm_usd_short
  }

  measure: total_amount_in_pipeline {
    # description: "TODO"
    group_label: "Total Amounts"
    sql: ${amount_in_pipeline};;
    type: sum_distinct
    sql_distinct_key: ${sfid} ;;
    value_format_name: mm_usd_short
  }

  measure: total_amount_in_best_case {
    group_label: "Total Amounts"
    sql: ${amount_in_best_case};;
    type: sum_distinct
    sql_distinct_key: ${sfid} ;;
    value_format_name: mm_usd_short
  }


  measure: total_renewal_risk_amount {
    # description: "TODO"
    group_label: "Total Amounts"
    sql: ${renewal_risk_amount};;
    type: sum_distinct
    sql_distinct_key: ${sfid} ;;
    value_format_name: mm_usd_short
    drill_fields: [opportunity_drill_fields*,total_renewal_risk_amount]
  }

  measure: total_renewal_at_risk_amount {
    label: "At Risk Renewal Amount"
    group_label: "Total Amounts"
    sql: ${renewal_risk_amount};;
    filters: [renewal_risk_status: "At Risk"]
    type: sum_distinct
    sql_distinct_key: ${sfid} ;;
    value_format_name: mm_usd_short
    drill_fields: [opportunity_drill_fields*,total_renewal_risk_amount]
  }

  measure: total_renewal_early_warning_amount {
    label: "Early Warning Renewal Amount"
    group_label: "Total Amounts"
    sql: ${renewal_risk_amount};;
    filters: [renewal_risk_status: "Early Warning"]
    type: sum_distinct
    sql_distinct_key: ${sfid} ;;
    value_format_name: mm_usd_short
    drill_fields: [opportunity_drill_fields*,total_renewal_risk_amount]
  }

  measure: total_renewal_risk_amount_open {
    # description: "TODO"
    group_label: "Total Amounts"
    sql: ${renewal_risk_amount};;
    type: sum_distinct
    sql_distinct_key: ${sfid} ;;
    value_format_name: mm_usd_short
    drill_fields: [opportunity_drill_fields*,total_renewal_risk_amount]
  }

  measure: total_loe_amount {
    label: "LOE Amount"
    group_label: "Product Line Type Totals"
    description: "Leftover Expansion"
    sql: ${opportunitylineitem.leftover_expansion_amount};;
    type: sum_distinct
    value_format_name: mm_usd_short
    drill_fields: [opportunity_drill_fields*,total_exp_amount]
    sql_distinct_key: ${opportunitylineitem.sfid} ;;
  }

  measure: total_exp_with_loe_amount {
    description: "Expansion (includes Co-Term and Leftover Expansion"
    label: "Exp w/LOE Amount"
    group_label: "Product Line Type Totals"
    sql: ${opportunitylineitem.expansion_amount} + ${opportunitylineitem.coterm_expansion_amount} + ${opportunitylineitem.leftover_expansion_amount};;
    type: sum_distinct
    value_format_name: mm_usd_short
    drill_fields: [opportunity_drill_fields*,total_exp_with_loe_amount]
    sql_distinct_key: ${opportunitylineitem.sfid} ;;
  }

  measure: total_new_and_exp_with_loe_amount {
    description: "New or Expansion (includes Co-Term and Leftover Expansion)"
    label: "New and Exp w/LOE Amount"
    group_label: "Product Line Type Totals"
    sql: ${opportunitylineitem.new_amount} + ${opportunitylineitem.expansion_amount} + ${opportunitylineitem.coterm_expansion_amount} + ${opportunitylineitem.leftover_expansion_amount};;
    type: sum_distinct
    value_format_name: mm_usd_short
    drill_fields: [opportunity_drill_fields*,total_new_amount,total_exp_with_loe_amount,total_new_and_exp_with_loe_amount]
    sql_distinct_key: ${opportunitylineitem.sfid} ;;
  }

  measure: total_exp_count {
    group_label: "Counts"
    label: "# OLI (Exp)"
    sql: ${opportunitylineitem.sfid};;
    type: count_distinct
    drill_fields: [opportunity_drill_fields*,total_new_amount]
    filters: {
      field: opportunitylineitem.expansion_w_coterm_amount
      value: ">0"
    }
    sql_distinct_key: ${opportunitylineitem.sfid} ;;
  }

  measure: total_exp_amount {
    description: "Expansion (includes Co-Term)"
    label: "Exp Amount"
    group_label: "Product Line Type Totals"
    sql: ${opportunitylineitem.expansion_amount} + ${opportunitylineitem.coterm_expansion_amount};;
    type: sum_distinct
    value_format_name: mm_usd_short
    drill_fields: [opportunity_drill_fields*,total_exp_amount]
    sql_distinct_key: ${opportunitylineitem.sfid} ;;
  }

  measure: total_exp_amount_self_serve {
    description: "Expansion (includes Co-Term) and E Purchase Date is Filled In"
    label: "Exp Amount (Self Serve)"
    group_label: "Product Line Type Totals"
    sql: ${opportunitylineitem.expansion_amount} + ${opportunitylineitem.coterm_expansion_amount};;
    type: sum_distinct
    value_format_name: mm_usd_short
    drill_fields: [opportunity_drill_fields*,total_exp_amount]
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
      field: opportunitylineitem.new_amount
      value: ">0"
    }
    sql_distinct_key: ${opportunitylineitem.sfid} ;;
  }

  measure: total_new_amount {
    label: "New Amount"
    group_label: "Product Line Type Totals"
    sql: ${opportunitylineitem.new_amount};;
    type: sum_distinct
    value_format_name: mm_usd_short
    drill_fields: [opportunity_drill_fields*,total_new_amount]
    sql_distinct_key: ${opportunitylineitem.sfid} ;;
  }

  measure: total_new_amount_self_serv {
    description: "New and E Purchase Date is Filled In"
    label: "New Amount (Self Serve)"
    group_label: "Product Line Type Totals"
    sql: ${opportunitylineitem.new_amount};;
    type: sum_distinct
    value_format_name: mm_usd_short
    drill_fields: [opportunity_drill_fields*,total_new_amount]
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
    description: "New or Expansion (includes Co-Term)"
    label: "New and Exp Amount"
    group_label: "Product Line Type Totals"
    sql: ${total_new_amount}+${total_exp_amount};;
    type: number
    value_format_name: mm_usd_short
    drill_fields: [opportunity_drill_fields*,total_new_amount,total_exp_amount,total_new_and_exp_amount]
  }

  measure: total_new_and_exp_amount_link_qtr_forecastcategory {
    #     This measure is used to link to another look and causes a fanout
    description: "New or Expansion (includes Co-Term and Leftover Expansion)"
    label: "New and Exp Amount (Warning: Link Fan Out)"
    group_label: "Product Line Type Totals"
    sql: ${total_new_amount}+${total_exp_amount};;
    type: number
    value_format_name: mm_usd_short
    link: {
      label: "List Pipeline"
      url:"https://mattermost.looker.com/looks/542?toggle&toggle=det,pik&f[opportunity.close_quarter]={{ close_quarter }}&f[opportunity.forecastcategoryname]={{ forecastcategoryname }}"
    }
  }

  measure: total_new_and_exp_amount_self_serve {
    description: "New or Expansion (includes Co-Term and Leftover Expansion) and E Purchase Date is Filled In"
    label: "New and Exp Amount (Self Serve)"
    group_label: "Product Line Type Totals"
    sql: ${total_new_amount_self_serv}+${total_exp_amount_self_serve};;
    type: number
    value_format_name: mm_usd_short
    drill_fields: [opportunity_drill_fields*,total_new_amount,total_exp_amount,total_new_and_exp_amount]
  }

  measure: total_ren_amount {
    description: "Renewal"
    label: "Ren Amount"
    group_label: "Product Line Type Totals"
    sql: ${opportunitylineitem.renewal_amount};;
    type: sum_distinct
    value_format_name: mm_usd_short
    drill_fields: [opportunity_drill_fields*,total_ren_amount]
    sql_distinct_key: ${opportunitylineitem.sfid} ;;
  }

  measure: total_ren_amount_self_serve {
    description: "Renewal and E Purchase Date is Filled In"
    label: "Ren Amount (Self Serve)"
    group_label: "Product Line Type Totals"
    sql: ${opportunitylineitem.renewal_amount};;
    type: sum_distinct
    value_format_name: mm_usd_short
    drill_fields: [opportunity_drill_fields*,total_ren_amount]
    filters: {
      field: opportunity.sales_channel
      value: "Self Service"
    }
    sql_distinct_key: ${opportunitylineitem.sfid} ;;
  }

  measure: total_multi_amount {
    description: "Multi Year"
    label: "Multi Amount"
    group_label: "Product Line Type Totals"
    sql: ${opportunitylineitem.multi_amount};;
    type: sum_distinct
    value_format_name: mm_usd_short
    drill_fields: [opportunity_drill_fields*,total_multi_amount]
    sql_distinct_key: ${opportunitylineitem.sfid} ;;
  }

  measure: total_multi_amount_self_service {
    description: "Multi Year and E Purchase Date is Filled In"
    label: "Multi Amount (Self Serve)"
    group_label: "Product Line Type Totals"
    sql: ${opportunitylineitem.multi_amount};;
    type: sum_distinct
    value_format_name: mm_usd_short
    drill_fields: [opportunity_drill_fields*,total_multi_amount]
    filters: {
      field: opportunity.sales_channel
      value: "Self Service"
    }
    sql_distinct_key: ${opportunitylineitem.sfid} ;;
  }

  measure: total_ren_multi_amount {
    description: "Multi Year"
    label: "Ren-Multi Amount"
    group_label: "Product Line Type Totals"
    sql: ${opportunitylineitem.ren_multi_amount};;
    type: sum_distinct
    value_format_name: mm_usd_short
    drill_fields: [opportunity_drill_fields*,total_ren_multi_amount]
    sql_distinct_key: ${opportunitylineitem.sfid} ;;
  }

  measure: total_ren_multi_amount_self_service {
    description: "Multi Year and E Purchase Date is Filled In"
    label: "Ren-Multi Amount (Self Serve)"
    group_label: "Product Line Type Totals"
    sql: ${opportunitylineitem.ren_multi_amount};;
    type: sum_distinct
    value_format_name: mm_usd_short
    drill_fields: [opportunity_drill_fields*,total_ren_multi_amount]
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

  measure: integration_jira_count {
    label: "Jira Count"
    group_label: "Customer Journey Integration Counts"
    type: sum_distinct
    sql: CASE WHEN ${target_integrations} like '%Jira%' THEN 1 ELSE 0 END;;
  }

  measure: integration_github_count {
    label: "GitHub Count"
    group_label: "Customer Journey Integration Counts"
    type: sum_distinct
    sql: CASE WHEN ${target_integrations} like '%Github%' THEN 1 ELSE 0 END;;
  }

  measure: integration_big_blue_button_count {
    label: "Big Blue Button Count"
    group_label: "Customer Journey Integration Counts"
    type: sum_distinct
    sql_distinct_key: ${sfid} ;;
    sql: CASE WHEN ${target_integrations} like '%Big Blue Button%' THEN 1 ELSE 0 END;;
  }

  measure: integration_bamboo_count {
    label: "Bamboo Count"
    group_label: "Customer Journey Integration Counts"
    type: sum_distinct
    sql: CASE WHEN ${target_integrations} like '%Bamboo%' THEN 1 ELSE 0 END;;
  }

  measure: integration_bitbucket_count {
    label: "Bitbucket Count"
    group_label: "Customer Journey Integration Counts"
    type: sum_distinct
    sql: CASE WHEN ${target_integrations} like '%Bitbucket%' THEN 1 ELSE 0 END;;
  }

  measure: integration_blue_jeans_count {
    label: "BlueJeans Count"
    group_label: "Customer Journey Integration Counts"
    type: sum_distinct
    sql: CASE WHEN ${target_integrations} like '%Blue Jeans%' THEN 1 ELSE 0 END;;
  }

  measure: integration_circle_ci_count {
    label: "CircleCI Count"
    group_label: "Customer Journey Integration Counts"
    type: sum_distinct
    sql: CASE WHEN ${target_integrations} like '%Circle CI%' THEN 1 ELSE 0 END;;
  }

  measure: integration_confluence_count {
    label: "Confluence Count"
    group_label: "Customer Journey Integration Counts"
    type: sum_distinct
    sql: CASE WHEN ${target_integrations} like '%Confluence%' THEN 1 ELSE 0 END;;
  }

  measure: integration_gitlab_count {
    label: "Gitlab Count"
    group_label: "Customer Journey Integration Counts"
    type: sum_distinct
    sql: CASE WHEN ${target_integrations} like '%Gitlab%' THEN 1 ELSE 0 END;;
  }

  measure: integration_internal_apps_count {
    label: "Internal Apps Count"
    group_label: "Customer Journey Integration Counts"
    type: sum_distinct
    sql: CASE WHEN ${target_integrations} like '%Internal Apps%' THEN 1 ELSE 0 END;;
  }

  measure: integration_jenkins_count {
    label: "Jenkins Count"
    group_label: "Customer Journey Integration Counts"
    type: sum_distinct
    sql: CASE WHEN ${target_integrations} like '%Jenkins%' THEN 1 ELSE 0 END;;
  }

  measure: integration_jitsi_count {
    label: "Jitsi Count"
    group_label: "Customer Journey Integration Counts"
    type: sum_distinct
    sql: CASE WHEN ${target_integrations} like '%Jitsi%' THEN 1 ELSE 0 END;;
  }

  measure: integration_matterbridge_count {
    label: "Matterbridge Count"
    group_label: "Customer Journey Integration Counts"
    type: sum_distinct
    sql: CASE WHEN ${target_integrations} like '%Matterbridge%' THEN 1 ELSE 0 END;;
  }

  measure: integration_o365_count {
    label: "O365 Count"
    group_label: "Customer Journey Integration Counts"
    type: sum_distinct
    sql: CASE WHEN ${target_integrations} like '%O365%' THEN 1 ELSE 0 END;;
  }

  measure: integration_pagerduty_count {
    label: "PagerDuty Count"
    group_label: "Customer Journey Integration Counts"
    type: sum_distinct
    sql: CASE WHEN ${target_integrations} like '%PagerDuty%' THEN 1 ELSE 0 END;;
  }

  measure: integration_salesforce_count {
    label: "Salesforce Count"
    group_label: "Customer Journey Integration Counts"
    type: sum_distinct
    sql: CASE WHEN ${target_integrations} like '%Salesforce%' THEN 1 ELSE 0 END;;
  }

  measure: integration_servicenow_count {
    label: "ServiceNow Count"
    group_label: "Customer Journey Integration Counts"
    type: sum_distinct
    sql: CASE WHEN ${target_integrations} like '%ServiceNow%' THEN 1 ELSE 0 END;;
  }

  measure: integration_skype4business_count {
    label: "Skype4Business Count"
    group_label: "Customer Journey Integration Counts"
    type: sum_distinct
    sql: CASE WHEN ${target_integrations} like '%Skype4Business%' THEN 1 ELSE 0 END;;
  }

  measure: integration_splunk_count {
    label: "Splunk Count"
    group_label: "Customer Journey Integration Counts"
    type: sum_distinct
    sql: CASE WHEN ${target_integrations} like '%Splunk%' THEN 1 ELSE 0 END;;
  }

  measure: integration_team_city_count {
    label: "Team City Count"
    group_label: "Customer Journey Integration Counts"
    type: sum_distinct
    sql: CASE WHEN ${target_integrations} like '%Team City%' THEN 1 ELSE 0 END;;
  }

  measure: integration_webex_count {
    label: "Webex Count"
    group_label: "Customer Journey Integration Counts"
    type: sum_distinct
    sql: CASE WHEN ${target_integrations} like '%Webex%' THEN 1 ELSE 0 END;;
  }

  measure: integration_zendesk_count {
    label: "ZenDesk Count"
    group_label: "Customer Journey Integration Counts"
    type: sum_distinct
    sql: CASE WHEN ${target_integrations} like '%ZenDesk%' THEN 1 ELSE 0 END;;
  }

  measure: integration_zoom_count {
    label: "Zoom Count"
    group_label: "Customer Journey Integration Counts"
    type: sum_distinct
    sql: CASE WHEN ${target_integrations} like '%Zoom%' THEN 1 ELSE 0 END;;
  }

  #
  # Hidden Fields (Used for derived values or joins)
  #


}
