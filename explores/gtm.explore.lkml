include: "/**/**/*.view.lkml"
include: "/**/**/*.explore.lkml"

explore: _base_account_explore {
  extension: required

  join: account {
    view_label: "Account"
    relationship: many_to_one
  }

  join: account_ext {
    view_label: "Account"
    sql_on: ${account.sfid} = ${account_ext.account_sfid};;
    relationship: one_to_one
  }

  join: account_csm {
    from: user
    sql_on: ${account.csm_lookup} = ${account_csm.sfid} ;;
    relationship: many_to_one
    view_label: "Account CSM"
  }

  join: account_ce {
    from: user
    sql_on: ${account.ce_lookup} = ${account_ce.sfid} ;;
    relationship: many_to_one
    view_label: "Account CE"
  }

  join: account_owner {
    from: user
    sql_on: ${account.ownerid} = ${account_owner.sfid} ;;
    relationship: many_to_one
    fields: [name, email, owner_type, system_type, sales_ops, username, is_active, validation_exempt]
  }

  join: parent_account {
    from: account
    sql_on: ${account.parentid} = ${parent_account.sfid} ;;
    relationship:one_to_one
  }

  join: parent_account_ext {
    from: account_ext
    view_label: "Parent Account"
    sql_on: ${parent_account.sfid} = ${parent_account_ext.account_sfid};;
    relationship: many_to_one
  }

  join: account_industry_mapping {
    sql_on: ${account.industry} = ${account_industry_mapping.industry} ;;
    relationship: many_to_one
    fields: []
  }

  join: territory_mapping {
    sql_on: coalesce(${account.shipping_country_code},${account.billing_country_code}) = ${territory_mapping.country_code}
      OR coalesce(${account.shipping_country},${account.billing_country}) = ${territory_mapping.country_name};;
    relationship: many_to_one
  }
}

explore: _base_account_core_explore {
  extension: required

  join: account {
    view_label: "Account"
    relationship: many_to_one
    fields: [account.account_core*]
  }

  join: account_csm {
    from: user
    sql_on: ${account.csm_lookup} = ${account_csm.sfid} ;;
    relationship: many_to_one
    fields: []
  }

  join: account_ce {
    from: user
    sql_on: ${account.ce_lookup} = ${account_ce.sfid} ;;
    relationship: many_to_one
    fields: []
  }

  join: account_owner {
    from: user
    sql_on: ${account.ownerid} = ${account_owner.sfid} ;;
    relationship: many_to_one
    fields: []
  }

  join: parent_account {
    from: account
    sql_on: ${account.parentid} = ${parent_account.sfid} ;;
    relationship:many_to_one
    fields: []
  }

  join: account_industry_mapping {
    sql_on: ${account.industry} = ${account_industry_mapping.industry} ;;
    relationship: many_to_one
    fields: []
  }
}

explore: _base_opportunity_explore {
  extension: required

  join: opportunity {
    relationship: many_to_one
  }

  join: opportunity_daily_arr {
    view_label: "Opportunity ARR by Date"
    sql_on: ${opportunity.sfid} = ${opportunity_daily_arr.opportunity_sfid} ;;
    relationship: one_to_many
  }

  join: opportunity_ext {
    view_label: "Opportunity"
    sql_on: ${opportunity.sfid} = ${opportunity_ext.opportunityid} ;;
    relationship: one_to_one
  }

  join: opportunity_owner {
    from: user
    sql_on: ${opportunity.ownerid} = ${opportunity_owner.sfid} ;;
    relationship: many_to_one
    fields: [name, email, owner_type, system_type, sales_ops, username, is_active, validation_exempt]
  }

  join: opportunity_csm {
    view_label: "Opportunity CSM"
    from: user
    sql_on: ${opportunity.csm_owner_id} = ${opportunity_csm.sfid} ;;
    relationship: many_to_one
    fields: []
  }

  join: opportunity_ce {
    view_label: "Opportunity Customer Engineer"
    from: user
    sql_on: ${opportunity.ce_owner__c} = ${opportunity_ce.sfid} ;;
    relationship: many_to_one
    fields: []
  }

  join: opportunitylineitem {
    sql_on: ${opportunity.sfid} = ${opportunitylineitem.opportunityid};;
    relationship: one_to_many
  }

  join: opportunitylineitem_daily_arr {
    view_label: "Opportunity Line Item ARR by Date"
    sql_on: ${opportunitylineitem.sfid} = ${opportunitylineitem_daily_arr.opportunitylineitem_sfid} and ${opportunitylineitem.start_date} = ${opportunitylineitem_daily_arr.day_date};;
    relationship: one_to_many
  }

  join: product2 {
    view_label: "Product"
    sql_on: ${opportunitylineitem.product2id} = ${product2.sfid} ;;
    relationship: many_to_one
  }

  join: opportunitycontactrole {
    view_label: "Oppt Contact Role"
    sql_on: ${opportunity.sfid} = ${opportunitycontactrole.opportunityid};;
    relationship: one_to_many
  }

  join: opportunity_contact {
    from: contact
    view_label: "Oppt Contact Role (Contact)"
    sql_on: ${opportunitycontactrole.contactid} = ${opportunity_contact.sfid};;
    relationship: many_to_one
  }

  join: territory_mapping {
    sql_on: coalesce(${opportunity.shipping_country_code},${opportunity.billing_country_code}) = ${territory_mapping.country_code}
      OR coalesce(${opportunity.shipping_country},${opportunity.billing_country}) = ${territory_mapping.country_name};;
    relationship: many_to_one
  }
}

explore: _base_opportunity_core_explore {
  extension: required

  join: opportunity {
    relationship: many_to_one
    fields: [opportunity.opportunity_core*]
  }

  join: opportunity_ext {
    view_label: "Opportunity"
    sql_on: ${opportunity.sfid} = ${opportunity_ext.opportunityid} ;;
    relationship: one_to_one
    fields: []
  }

  join: opportunitylineitem {
    sql_on: ${opportunity.sfid} = ${opportunitylineitem.opportunityid};;
    relationship: one_to_many
    fields: [opportunitylineitem.opportunitylineitem_core*]
  }

  join: product2 {
    view_label: "Opportunity Line Item"
    sql_on: ${opportunitylineitem.product2id} = ${product2.sfid} ;;
    relationship: many_to_one
    fields: [list_of_general_products]
  }

  join: opportunity_owner {
    from: user
    sql_on: ${opportunity.ownerid} = ${opportunity_owner.sfid} ;;
    relationship: many_to_one
    fields: []
  }

  join: opportunity_csm {
    view_label: "Opportunity CSM"
    from: user
    sql_on: ${opportunity.csm_owner_id} = ${opportunity_csm.sfid} ;;
    relationship: many_to_one
    fields: []
  }

  join: opportunity_ce {
    view_label: "Opportunity Customer Engineer"
    from: user
    sql_on: ${opportunity.ce_owner__c} = ${opportunity_ce.sfid} ;;
    relationship: many_to_one
    fields: []
  }

  join: territory_mapping {
    sql_on: coalesce(${opportunity.shipping_country_code},${opportunity.billing_country_code}) = ${territory_mapping.country_code};;
    relationship: many_to_one
    fields: []
  }
}

explore: account {
  label: "Account to Line Item"
  group_label: "Salesforce"
  description: "Contains Salesforce Account line item mapping."
  extends: [_base_opportunity_explore]

  join: contact {
    view_label: "Account Contacts"
    from: contact
    sql_on: ${account.sfid} = ${contact.accountid};;
    relationship: one_to_many
  }

  join: account_ext {
    view_label: "Account"
    sql_on: ${account.sfid} = ${account_ext.account_sfid};;
    relationship: one_to_one
  }

  join: account_territory_mapping {
    from: territory_mapping
    sql_on: coalesce(${account.billing_country_code},${account.shipping_country_code}) = ${account_territory_mapping.country_code}
      AND ((${account.billing_country_code} IN ('US','CA') AND ${account.billing_state_code} = ${account_territory_mapping.state_code}) OR COALESCE(${account.billing_country_code},'') NOT IN ('US','CA'));;
    relationship: many_to_one
  }

  join: account_csm {
    from: user
    sql_on: ${account.csm_lookup} = ${account_csm.sfid} ;;
    relationship: many_to_one
    view_label: "Account CSM"
    fields: []
  }

  join: account_ce {
    from: user
    sql_on: ${account.ce_lookup} = ${account_ce.sfid} ;;
    relationship: many_to_one
    fields: []
  }

  join: account_owner {
    from: user
    sql_on: ${account.ownerid} = ${account_owner.sfid} ;;
    relationship: many_to_one
    fields: []
  }

  join: parent_account {
    from: account
    sql_on: ${account.parentid} = ${parent_account.sfid} ;;
    relationship:one_to_one
    fields: []
  }

  join: opportunity {
    sql_on: ${account.sfid} = ${opportunity.accountid} ;;
  }

  join: renewal_rate_by_renewal_opportunity {
    view_label: "Available Renewals"
    sql_on: ${opportunity.sfid} = ${renewal_rate_by_renewal_opportunity.opportunityid} ;;
    relationship: one_to_one
  }

  join: original_opportunity {
    from: opportunity
    view_label: "Original Opportunity"
    sql_on: ${opportunity.original_opportunity_sfid} = ${original_opportunity.sfid};;
    relationship: one_to_many
    fields: [name, sfid, total_amount, status_wlo, is_monthly_billing]
  }

  join: original_opportunity_ext {
    from: opportunity_ext
    view_label: "Original Opportunity"
    sql_on: ${original_opportunity.sfid} = ${original_opportunity_ext.opportunityid};;
    relationship: one_to_one
    fields: [license_max_end_date_date,license_max_end_date_fiscal_quarter, license_max_end_date_fiscal_year]
  }

  join: original_opportunitylineitem {
    from: opportunitylineitem
    view_label: "Original Opportunity"
    sql_on: ${original_opportunity.sfid} = ${original_opportunitylineitem.opportunityid};;
    relationship: one_to_many
    fields: [total_new_amount, total_ren_amount, total_exp_only_amount, total_coterm_amount, total_loe_amount, total_multi_amount, is_monthly_billing]
  }

  join: account_industry_mapping {
    sql_on: ${account.industry} = ${account_industry_mapping.industry} ;;
    relationship: many_to_one
    fields: []
  }

  join: contract {
    view_label: "Account Contracts"
    sql_on: ${account.sfid} = ${contract.accountid} ;;
    relationship: one_to_many
  }

  join: opportunity_contracts {
    from: opportunity
    sql_on: ${contract.contract_opportunity} = ${opportunity_contracts.sfid} ;;
    relationship: one_to_one
    fields: []
  }

  join: customer_risk {
    sql_on: ${customer_risk.account} = ${account.sfid} and ${customer_risk.opportunity} = ${opportunity.sfid} ;;
    relationship: one_to_many
  }

  join: customer_risk_owner {
    from: user
    sql_on: ${customer_risk.owner} = ${customer_risk_owner.sfid} ;;
    relationship: many_to_one
    fields: []
  }

  join: customer_risk_ce {
    from: user
    sql_on: ${customer_risk.ce_owner} = ${customer_risk_ce.sfid} ;;
    relationship: many_to_one
    fields: []
  }

  join: customer_risk_csm {
    from: user
    sql_on: ${customer_risk.csm_owner} = ${customer_risk_csm.sfid} ;;
    relationship: many_to_one
    fields: []
  }

  join: customer_risk_contact {
    from: contact
    sql_on: ${customer_risk.key_contact} = ${customer_risk_contact.sfid} ;;
    relationship: many_to_one
    fields: []
  }
}

explore: opportunity_snapshot {
  group_label: "Salesforce"
  view_label: "Opportunity Snapshot"
  extends: [_base_opportunity_core_explore]

  join: opportunity {
    sql_on: ${opportunity_snapshot.opportunityid} = ${opportunity.sfid} ;;
    relationship: many_to_one
  }

  join: opportunity_owner {
    from: user
    sql_on: ${opportunity_snapshot.ownerid} = ${opportunity_owner.sfid} ;;
    relationship: many_to_one
    fields: []
  }
}

explore: task {
  group_label: "Salesforce"
  join: task_owner {
    from: user
    sql_on: ${task.ownerid} = ${task_owner.sfid} ;;
    relationship: many_to_one
    fields: []
  }

  join: account {
    sql: ${account.sfid} = ${task.accountid};;
    relationship: many_to_one
    fields: []
  }
}


explore: opportunityfieldhistory {
  view_label: "Opportunity Field History"
  group_label: "Salesforce"
  extends: [_base_account_core_explore,_base_opportunity_explore]
  join: opportunity {
    sql_on: ${opportunityfieldhistory.opportunityid} = ${opportunity.sfid} ;;
    relationship: many_to_one
  }

  join: customer_risk {
    view_label: "Opportunity"
    sql_on: ${customer_risk.opportunity} = ${opportunity.sfid} ;;
    relationship: one_to_one
    fields: [customer_risk.status,customer_risk.risk_assigned]
  }

  join: account {
    sql_on: ${opportunity.accountid} = ${account.sfid} ;;
    relationship: many_to_one
  }
}

explore: lead {
  label: "Lead Lifecycle"
  group_label: "Salesforce"
  extends: [_base_account_explore,_base_opportunity_explore]

  join: owner {
    view_label: "Lead Owner Current"
    from:  user
    sql_on: ${lead.ownerid} = ${owner.sfid} ;;
    relationship: many_to_one
    fields: []
  }

  join: original_owner {
    view_label: "Lead Owner Original"
    from:  user
    sql_on: ${lead.original_owner__c} = ${original_owner.sfid} ;;
    relationship: many_to_one
    fields: []
  }

  join: contact {
    sql_on: ${lead.convertedcontactid} = ${contact.sfid} ;;
    relationship: one_to_one
    fields: [email,sfid]
  }

  join: account {
    sql_on: coalesce(${contact.accountid},${lead.existing_account__c}) = ${account.sfid} ;;
    relationship: many_to_one
  }

  join: opportunitycontactrole {
    sql_on: ${opportunitycontactrole.contactid} = ${contact.sfid} ;;
    relationship: one_to_many
    fields: []
  }

  join: opportunity {
    sql_on: ${lead.convertedopportunityid} = ${opportunity.sfid};;
    relationship: one_to_one
  }

  join: opportunity_ext {
    view_label: "Opportunity"
    sql_on: ${opportunity.sfid} = ${opportunity_ext.opportunityid} ;;
    relationship: one_to_one
  }

  join: customer_risk {
    view_label: "Opportunity"
    sql_on: ${customer_risk.opportunity} = ${opportunity.sfid} ;;
    relationship: one_to_one
    fields: [customer_risk.status,customer_risk.risk_assigned]
  }

  join: account_domain_mapping {
    sql_on: lower(split_part(${lead.email},'@',2)) = ${account_domain_mapping.domain} ;;
    relationship: many_to_one
    fields: []
  }

  join: territory_mapping_country {
    from: territory_mapping
    sql_on: coalesce(${lead.country_code},${lead.company_country_code}) = ${territory_mapping_country.country_code};;
    relationship: many_to_one
    fields: []
  }
}

explore: lead_status_hist {
  extends: [_base_opportunity_core_explore, _base_account_core_explore]
  join: user {
    sql_on: ${user.sfid} = ${lead_status_hist.owner} ;;
    relationship: many_to_one
    fields: []
  }

  join: lead {
    sql_on: ${lead.sfid} = ${lead_status_hist.lead_sfid} ;;
    relationship: many_to_one
    fields: [
      email, sfid, status, status_order,
      lead.most_recent_scl_date, lead.most_recent_scl_month, lead.most_recent_scl_fiscal_quarter, lead.most_recent_scl_fiscal_year, lead.avg_scl_to_converted,
      lead.most_recent_mql_date, lead.most_recent_mql_month, lead.most_recent_mql_fiscal_quarter, lead.most_recent_mql_fiscal_year, lead.avg_mql_to_scl,
      lead.is_public_domain, lead.lead_status_minor, lead.status_minor_order, lead.lead_status_combined_order, lead.lead_status_combined,
      lead.count
    ]
  }

  join: owner {
    from: user
    sql_on: ${owner.sfid} = ${lead.ownerid} ;;
    relationship: many_to_one
    fields: []
  }

  join: account_domain_mapping {
    sql_on: lower(split_part(${lead.email},'@',2)) = ${account_domain_mapping.domain} ;;
    relationship: many_to_one
    fields: []
  }

  join: territory_mapping_country {
    from: territory_mapping
    sql_on: coalesce(${lead.country_code},${lead.company_country_code}) = ${territory_mapping_country.country_code};;
    relationship: many_to_one
    fields: []
  }

  join: opportunity {
    view_label: "Converted Opportunity"
    sql_on: ${opportunity.sfid} = ${lead.convertedopportunityid} ;;
    relationship: one_to_one
  }

  join: contact {
    view_label: "Converted Contact"
    sql_on: ${contact.sfid} = ${lead.convertedcontactid} ;;
    relationship: one_to_one
    fields: [email,name,sfid]
  }

  join: account {
    view_label: "Converted Account"
    sql_on: coalesce(${opportunity.accountid},${contact.accountid},${lead.convertedaccountid}) = ${account.sfid} ;;
    relationship: many_to_one
  }
}

explore: campaign {
  group_label: "Salesforce"
  extends: [_base_account_explore]
  fields: [ALL_FIELDS*, -account.territory_sales_segment_complex, -account.territory_sales_region, -parent_account.territory_sales_segment_complex, -parent_account.territory_sales_region]

  join: campaignmember {
    sql_on: ${campaign.sfid} = ${campaignmember.campaignid} ;;
    relationship: one_to_many
  }

  join: parent_campaign {
    from: campaign
    sql_on: ${parent_campaign.sfid} = ${campaign.parentid} ;;
    relationship: one_to_many
    fields: []
  }

  join: campaignmember_ext {
    sql_on: ${campaignmember.sfid} = ${campaignmember_ext.cm_sfid} ;;
    relationship: one_to_one
    fields: []
  }

  join: lead {
    sql_on: ${campaignmember.leadid}= ${lead.sfid} ;;
    relationship: many_to_one
  }

  join: territory_mapping_country {
    from: territory_mapping
    sql_on: coalesce(${lead.country_code},${lead.company_country_code}) = ${territory_mapping_country.country_code};;
    relationship: many_to_one
    fields: []
  }

  join: contact {
    sql_on: ${campaignmember.contactid}= ${contact.sfid} ;;
    relationship: many_to_one
  }

  join: account_domain_mapping {
    sql_on: lower(split_part(coalesce(${lead.email},${contact.name}),'@',2)) = ${account_domain_mapping.domain} ;;
    relationship: many_to_one
    fields: [account_domain_mapping.domain,account_domain_mapping.public]
  }

  join: owner {
    view_label: "Lead Owner Current"
    from:  user
    sql_on: ${lead.ownerid} = ${owner.sfid} ;;
    relationship: many_to_one
    fields: []
  }

  join: original_owner {
    view_label: "Lead Owner Original"
    from:  user
    sql_on: ${lead.original_owner__c} = ${original_owner.sfid} ;;
    relationship: many_to_one
    fields: []
  }

  join: account {
    sql_on: ${lead.matched_account} = ${account.sfid} ;;
    relationship: many_to_one
  }
}

explore: account_cs_extended  {
  label: "Account Overview for CS"
  group_label: "Customer Success"
  view_label: "Account"
  view_name: account
  extends: [account]

  join: account_health_score {
    sql_on: ${account.sfid} = ${account_health_score.account_sfid} ;;
    relationship: one_to_one
  }

  join: customer_onboarding {
    sql_on:${opportunity.sfid} = ${customer_onboarding.opportunity_name};;
    relationship: one_to_many
  }

  join: customer_onboarding_owner {
    from: user
    sql_on: ${customer_onboarding.owner} = ${customer_onboarding_owner.sfid} ;;
    relationship: many_to_one
    fields: []
  }

  join: customer_onboarding_csm {
    from: user
    sql_on: ${customer_onboarding.csm_owner} = ${customer_onboarding_csm.sfid} ;;
    relationship: many_to_one
    fields: []
  }

  join: customer_onboarding_primary_contact {
    from: contact
    view_label: "Primary Contact"
    sql_on: ${customer_onboarding.primary_contact} = ${customer_onboarding_primary_contact.sfid} ;;
    relationship: many_to_one
    fields: []
  }

  join: customer_onboarding_cse {
    from: user
    view_label: "CSE"
    sql_on: ${customer_onboarding_cse.sfid} = ${customer_onboarding.cse_owner} ;;
    relationship: many_to_one
    fields: []
  }

  join: customer_onboarding_executive_sponsor {
    from: contact
    view_label: "Executive Sponsor"
    sql_on: ${customer_onboarding.executive_sponsor} = ${customer_onboarding_executive_sponsor.sfid} ;;
    relationship: many_to_one
    fields: []
  }

  join: zendesk_ticket_details {
    sql_on: ${account.sfid} = ${zendesk_ticket_details.account_sfid} AND ${zendesk_ticket_details.status} <> 'deleted' AND ${zendesk_ticket_details.tags} NOT LIKE '%closed_by_merge%';;
    relationship: one_to_many
  }

  join: dates {
    sql_on: ${dates.date_date} >= ${zendesk_ticket_details.created_date} and ${dates.date_date} <= coalesce(${zendesk_ticket_details.solved_at_date},current_date);;
    relationship: many_to_many
    fields: []
  }

  join: task {
    sql_on: ${account.sfid} = ${task.accountid} ;;
    relationship: one_to_many
  }

  join: task_owner {
    from: user
    sql_on: ${task.ownerid} = ${task_owner.sfid} ;;
    relationship: many_to_one
    fields: []
  }

  join: customer_reference {
    sql_on: ${customer_reference.account} = ${account.sfid} ;;
    relationship: one_to_many
  }

  join: owner {
    from: user
    sql_on: ${owner.sfid}  = ${customer_reference.ownerid};;
    relationship: many_to_one
    fields: []
  }

  join: creator {
    from: user
    sql_on: ${creator.sfid}  = ${customer_reference.createdbyid};;
    relationship: many_to_one
    fields: []
  }

}

explore: customer_risk_history {
  extends: [_base_account_core_explore, _base_opportunity_core_explore]

  join: customer_risk {
    sql_on: ${customer_risk_history.customer_risk_id} = ${customer_risk.sfid} ;;
    relationship: many_to_one
  }

  join: opportunity {
    sql_on: ${opportunity.sfid} = ${customer_risk.opportunity} ;;
    relationship: one_to_one
  }

  join: account {
    sql_on: ${account.sfid} = ${customer_risk.account} ;;
    relationship: many_to_one
  }

  join: customer_risk_owner {
    from: user
    sql_on: ${customer_risk.owner} = ${customer_risk_owner.sfid} ;;
    relationship: many_to_one
    fields: []
  }

  join: customer_risk_ce {
    from: user
    sql_on: ${customer_risk.ce_owner} = ${customer_risk_ce.sfid} ;;
    relationship: many_to_one
    fields: []
  }

  join: customer_risk_csm {
    from: user
    sql_on: ${customer_risk.csm_owner} = ${customer_risk_csm.sfid} ;;
    relationship: many_to_one
    fields: []
  }

  join: customer_risk_contact {
    from: contact
    sql_on: ${customer_risk.key_contact} = ${customer_risk_contact.sfid} ;;
    relationship: many_to_one
    fields: []
  }
}

explore: scrub_segment {
  group_label: "Target vs Actual"
  label: "Scrub by Segment"
  view_label: "Scrub by Segment"
}

explore: scrub_ww {
  group_label: "Target vs Actual"
  label: "Scrub WW"
  view_label: "Scrub WW"
}

explore: historical_rep_attainment {
  group_label: "Target vs Actual"
  extends: [_base_opportunity_explore]
  join: user {
    sql_on: ${user.employeenumber} = ${historical_rep_attainment.employee_num} ;;
    relationship: many_to_one
    fields: []
  }

  join: opportunity {
    sql_on: ${opportunity.close_quarter} = ${historical_rep_attainment.fiscal_quarter}
            AND ${opportunity.ownerid} = ${user.sfid}
            AND ${opportunity.close_date} >= util.fiscal_quarter_start(util.get_sys_var('curr_qtr'));;
    relationship: one_to_many
  }

  join: customer_risk {
    view_label: "Opportunity"
    sql_on: ${customer_risk.opportunity} = ${opportunity.sfid} ;;
    relationship: one_to_one
    fields: [customer_risk.status,customer_risk.risk_assigned]
  }
}


explore: mql_to_close {
  group_label: "Finance"
  label: "MQL to Close"
}

explore: renewal_rate_by_renewal_opportunity {
  view_label: "Opportunity Renewal Rates"
  group_label: "Customer Success"
  extends: [_base_opportunity_core_explore, _base_account_core_explore]

  join: opportunity {
    sql_on: ${opportunity.sfid} = ${renewal_rate_by_renewal_opportunity.opportunityid} ;;
    relationship: one_to_one
    fields: [opportunity.opportunity_core*, opportunity.status_wlo, opportunity.count, opportunity.count_won_oppt,
      opportunity.lost_reason, opportunity.lost_reason_details, opportunity.lost_to_competitor,
      opportunity.gtm_save_motions, opportunity.use_case, opportunity.territory_sales_segment,
      opportunity.total_amount]
  }

  join: account {
    sql_on: ${account.sfid} = ${opportunity.accountid} ;;
    relationship: many_to_one
    fields: [account.account_core*, account.seats_licensed, account.seats_active_latest, account.seats_active_max, ]
  }

  join: customer_risk {
    sql_on: ${opportunity.sfid} = ${customer_risk.opportunity};;
    relationship: one_to_one
    fields: [customer_risk.status, customer_risk.competitor, customer_risk.additional_details, customer_risk.next_step, customer_risk.reason, customer_risk.type, customer_risk.seats_at_risk, customer_risk.risk_amount, customer_risk.at_risk_date, customer_risk.early_warning_date, customer_risk.is_at_risk, customer_risk.is_early_warning]
  }
}


explore: available_renewals_dynamic {
  # hidden: yes
  from: account
  view_name: account
  label: "Available Renewals Dynamic"
  group_label: "Customer Success"

  join: account_csm {
    from: user
    sql_on: ${account.csm_lookup} = ${account_csm.sfid} ;;
    relationship: many_to_one
    fields: []
  }

  join: account_ce {
    from: user
    sql_on: ${account.ce_lookup} = ${account_ce.sfid} ;;
    relationship: many_to_one
    fields: []
  }

  join: account_owner {
    from: user
    sql_on: ${account.ownerid} = ${account_owner.sfid} ;;
    relationship: many_to_one
    fields: []
  }

  join: parent_account {
    from: account
    sql_on: ${account.parentid} = ${parent_account.sfid} ;;
    relationship:one_to_one
    fields: []
  }

  join: parent_account_ext {
    from: account_ext
    view_label: "Parent Account"
    sql_on: ${parent_account.sfid} = ${parent_account_ext.account_sfid};;
    relationship: many_to_one
    fields: []
  }

  join: account_industry_mapping {
    sql_on: ${account.industry} = ${account_industry_mapping.industry} ;;
    relationship: many_to_one
    fields: []
  }

  join: opportunity {
    from: opportunity
    view_label: "Original Opportunity"
    sql_on: ${account.sfid} = ${opportunity.accountid};;
    relationship: one_to_many
    fields: [sfid, name, order_type, total_amount, status_wlo, close_date, count, is_monthly_billing, license_key, license_key_agg, license_key_count]
  }

  join: original_opportunity_ext {
    from: opportunity_ext
    view_label: "Original Opportunity"
    sql_on: ${opportunity.sfid} = ${original_opportunity_ext.opportunityid};;
    relationship: one_to_one
    fields: [license_max_end_date_date, license_max_end_date_fiscal_quarter, license_max_end_yyyy_mm, license_max_end_yyyy_qq]
  }

  join: opportunity_daily_arr {
    view_label: "Original Opportunity"
    sql_on: ${original_opportunity_ext.opportunityid} = ${opportunity_daily_arr.opportunity_sfid} and ${opportunity_daily_arr.day_date} = ${original_opportunity_ext.license_max_end_date_date} ;;
    relationship: one_to_one
    fields: [opportunity_daily_arr.arr]
  }

  join: original_opportunitylineitem {
    from: opportunitylineitem
    view_label: "Original Opportunity Line Items"
    sql_on: ${opportunity.sfid} = ${original_opportunitylineitem.opportunityid};;
    relationship: one_to_many
    fields: [sfid, total_arr, total_new_amount, total_ren_amount, total_exp_only_amount, is_coterm, total_coterm_amount, total_coterm_acv, total_loe_amount, total_multi_amount,
      start_date, end_date, length_days, quantity, discount, total_price,
      total_discounted, is_discounted, total_nonprofit, is_nonprofit, total_academic, is_academic, total_nfr, is_nfr, total_special_products, total_nonrecurring, is_nonrecurring, is_monthly_billing
    ]
  }

  join: original_product2 {
    from: product2
    view_label: "Original Opportunity Line Items"
    sql_on: ${original_opportunitylineitem.product2id} = ${original_product2.sfid};;
    relationship: many_to_one
    fields: [name]
  }

  join: renewal_opportunity {
    from: opportunity
    sql_on: ${opportunity.renewed_by_opportunity_id} = ${renewal_opportunity.sfid};;
    relationship: many_to_one
    fields: [sfid, name, stagename, order_type, total_amount, close_date, close_fiscal_quarter, close_fiscal_year, status_wlo, count, is_monthly_billing, total_available_renewal]
  }

  join: renewal_opportunity_ext {
    from: opportunity_ext
    view_label: "Renewal Opportunity"
    sql_on: ${renewal_opportunity.sfid} = ${renewal_opportunity_ext.opportunityid};;
    relationship: one_to_one
    fields: [license_min_start_date_date, license_min_start_date_fiscal_quarter]
  }

  join: new_opportunity_daily_arr {
    from: opportunity_daily_arr
    view_label: "Renewal Opportunity"
    sql_on: ${renewal_opportunity_ext.opportunityid} = ${new_opportunity_daily_arr.opportunity_sfid} and ${new_opportunity_daily_arr.day_date} = ${renewal_opportunity_ext.license_min_start_date_date} ;;
    relationship: one_to_one
    fields: [new_opportunity_daily_arr.arr]
  }

  join: renewal_opportunitylineitem {
    view_label: "Renewal Opportunity Line Items"
    from: opportunitylineitem
    sql_on: ${renewal_opportunity.sfid} = ${renewal_opportunitylineitem.opportunityid};;
    relationship: one_to_many
    fields: [sfid, total_arr, total_new_amount, total_ren_amount, total_exp_only_amount, total_coterm_amount, total_loe_amount, total_multi_amount,
      start_date, end_date, length_days, quantity, discount, total_price,
      total_discounted, is_discounted, total_nonprofit, is_nonprofit, total_academic, is_academic, total_nfr, is_nfr, total_special_products, total_nonrecurring, is_nonrecurring, is_monthly_billing
    ]
  }

  join: renewal_product2 {
    from: product2
    view_label: "Renewal Opportunity Line Items"
    sql_on: ${renewal_opportunitylineitem.product2id} = ${renewal_product2.sfid};;
    relationship: many_to_one
    fields: [name]
  }
}

explore: customer_reference {
  group_label: "Customer Success"
  join: account {
    sql_on: ${customer_reference.account} = ${account.sfid} ;;
    relationship: many_to_one
    fields: []
  }

  join: owner {
    from: user
    sql_on: ${customer_reference.ownerid} = ${owner.sfid} ;;
    relationship: many_to_one
    fields: []
  }


  join: account_owner {
    from: user
    sql_on: ${account.ownerid} = ${account_owner.sfid} ;;
    relationship: many_to_one
    fields: []
  }

  join: account_csm {
    from: user
    sql_on: ${account.csm_lookup} = ${account_csm.sfid} ;;
    relationship: many_to_one
    fields: []
  }

  join: account_ce {
    from: user
    sql_on: ${account.ce_lookup} = ${account_ce.sfid} ;;
    relationship: many_to_one
    fields: []
  }

  join: creator {
    from: user
    sql_on: ${customer_reference.createdbyid} = ${creator.sfid} ;;
    relationship: many_to_one
    fields: []
  }
}

explore: marketo_forms {
  group_label: "Marketing"
  label: "Marketo Forms"

  join: form_attribution {
    sql_on: ${marketo_forms.id} = ${form_attribution.form_fill_id} ;;
    relationship: one_to_one
  }

  join: marketo_form_names {
    sql_on: ${marketo_forms.formid} = ${marketo_form_names.form_id} ;;
    relationship: many_to_one
    fields: []
  }
}

explore: form_attribution {
  group_label: "Marketing"
  label: "Marketo Forms Attribution"
}

explore: person {
  extension: required
  label: "Person"

  join: person_owner {
    from: user
    sql_on: ${person.object_ownerid} = ${person_owner.sfid} ;;
    relationship: many_to_one
    fields: []
  }

  join: CUSTOMERS {
    sql_on: ${person.email} = ${CUSTOMERS.email};;
    relationship: one_to_one
    fields: []
  }

  join: SUBSCRIPTIONS {
    view_label: "Subscriptions (BLApi)"
    sql_on: ${CUSTOMERS.id} = ${SUBSCRIPTIONS.customer_id} ;;
    relationship: one_to_many
    fields: []
  }

  join: subscriptions_stripe {
    from: subscriptions
    view_label: "Subscriptions (Stripe)"
    sql_on: ${SUBSCRIPTIONS.stripe_id} = ${subscriptions_stripe.id} ;;
    relationship: one_to_one
    fields: []
  }

  join: lead {
    view_label: "Lead"
    sql_on: ${person.object} = 'Lead' AND ${lead.sfid} = ${person.sfid};;
    relationship: one_to_one
    fields: []
    required_joins: [person]
  }

  join: contact {
    view_label: "Contact"
    sql_on: ${person.object} = 'Contact' AND ${contact.sfid} = ${person.sfid};;
    relationship: one_to_one
    fields: []
    required_joins: [person]
  }

  join: account {
    view_label: "Account"
    sql_on: ${person.accountid} = ${account.sfid};;
    relationship: many_to_one
    fields: [name, account.owner_name, sfid]
    required_joins: [person,lead,contact]
  }

  join: account_domain_mapping {
    sql_on: ${person.domain} = ${account_domain_mapping.domain};;
    relationship: many_to_one
    fields: []
  }

  join: territory_mapping_domain {
    from: territory_mapping
    sql_on: concat('.',split_part(${person.domain},'.',2)) = ${territory_mapping_domain.domain};;
    relationship: many_to_one
    fields: []
  }

  join: territory_mapping_country {
    from: territory_mapping
    sql_on: ${person.country_code} = ${territory_mapping_country.country_code};;
    relationship: many_to_one
    fields: []
  }

  join: account_owner {
    from: user
    sql_on: ${account_owner.sfid} = ${account.ownerid} ;;
    relationship: many_to_one
    fields: []
  }
}

explore: zendesk_ticket_details {
  label: "Zendesk Tickets"
  group_label: "Customer Success"
  sql_always_where: ${zendesk_ticket_details.status} <> 'deleted' AND coalesce(${organization_name},'') <> 'Mattermost' AND ${zendesk_ticket_details.tags} NOT LIKE '%closed_by_merge%';;
  extends: [_base_account_core_explore]

  join: account {
    sql_on: ${account.sfid} = ${zendesk_ticket_details.account_sfid} ;;
    fields: [account.account_core*]
  }

  join: dates {
    sql_on: ${dates.date_date} >= ${zendesk_ticket_details.created_date} and ${dates.date_date} <= coalesce(${zendesk_ticket_details.solved_at_date},current_date);;
    relationship: many_to_many
  }
}

explore: zendesk_lead_creation {
  hidden: yes
  from: zendesk_ticket_details
  view_name: zendesk_ticket_details

  join: account {
    sql_on: ${account.sfid} = ${zendesk_ticket_details.account_sfid} ;;
    relationship: many_to_one
    fields: []
  }

  join: lead {
    sql_on: ${zendesk_ticket_details.submitter_email} = ${lead.email} ;;
    relationship: many_to_one
    fields: [email,sfid,most_recent_action, most_recent_action_detail, most_recent_lead_source, most_recent_lead_source_detail]
  }

  join: dates {
    sql_on: ${dates.date_date} >= ${zendesk_ticket_details.created_date} and ${dates.date_date} <= coalesce(${zendesk_ticket_details.solved_at_date},current_date);;
    relationship: many_to_many
  }
}

explore: account_monthly_arr_deltas_by_type {
  label: "Monthly Account ARR Changes"
  group_label: "Finance"
  extends: [_base_account_core_explore]

  join: account {
    view_label: "Account Monthly ARR Changes"
    sql_on: ${account.sfid} = ${account_monthly_arr_deltas_by_type.account_sfid} ;;
    relationship: one_to_one
  }

  join: opportunity_ext {
    sql_on: ${account.sfid} = ${opportunity_ext.accountid};;
    relationship: one_to_one
    fields: []
  }

  join: opportunity {
    sql_on: ${opportunity.sfid} = ${opportunity_ext.opportunityid} ;;
    relationship: one_to_many
    fields: []
  }

  join: opportunitylineitem {
    sql_on: ${opportunity.sfid} = ${opportunitylineitem.opportunityid}
            and ${opportunitylineitem.start_date} <= ${account_monthly_arr_deltas_by_type.month_end_date}
            and ${opportunitylineitem.end_date} >= ${account_monthly_arr_deltas_by_type.month_start_date};;
    relationship: one_to_many
    fields: []
  }

  join: product2 {
    view_label: "Account Monthly ARR Changes"
    sql_on: ${opportunitylineitem.product2id} = ${product2.sfid} ;;
    relationship: many_to_one
    fields: [max_product_name]
  }

  join: contract {
    view_label: "Account Monthly ARR Changes"
    sql_on: ${account.sfid} = ${contract.accountid} ;;
    relationship: one_to_many
    fields: [contract.agreement_status, contract.agreement_type]
  }
}

explore: account_daily_arr_deltas {
  label: "Daily Account ARR Changes"
  group_label: "Finance"
  view_label: "Account Daily ARR Deltas"
  extends: [_base_account_core_explore]

  join: account {
    view_label: "Account Daily ARR Deltas"
    sql_on: ${account.sfid} = ${account_daily_arr_deltas.account_sfid} ;;
    relationship: many_to_one
  }

  join: opportunity {
    view_label: "Related Opportunities"
    sql_on: ${account.sfid} = ${opportunity.accountid} and ${opportunity.license_start_date}=${account_daily_arr_deltas.new_day_date} ;;
    relationship: one_to_many
    fields: [count_open_oppt_current_fy,isclosed,iswon,close_current_fy,opportunity.close_date,opportunity.stagename,sfid,name,is_monthly_billing]
  }

  join: opportunity_ext {
    view_label: "Related Opportunities"
    sql_on: ${opportunity.sfid} = ${opportunity_ext.opportunityid} ;;
    relationship: one_to_one
  }

  join: opportunitylineitem {
    view_label: "Related Opportunities"
    sql_on: ${opportunity.sfid} = ${opportunitylineitem.opportunityid} AND ${opportunitylineitem.start_date} = ${account_daily_arr_deltas.new_day_date};;
    relationship: one_to_many
    fields: [total_bookings_open_curr_fy,total_bookings_curr_fy,total_new_amount,total_ren_amount,total_exp_amount,opportunitylineitem.product_line_type,is_loe,is_monthly_billing]
  }
}

explore: account_cohorts_arr {
  label: "Account Cohorts - ARR"
  group_label: "Finance"
  from: account_monthly_arr_deltas
  view_name: account_monthly_arr_deltas_first_month
  view_label: "Account ARR Monthly Changes"
  sql_always_where: ${account_monthly_arr_deltas_first_month.account_new_arr} ;;
  fields: [ALL_FIELDS*,
    -account_monthly_arr_deltas.ending_arr_starting_arr_ratio,
    -account_monthly_arr_deltas.cohort_start_date,
    -account_monthly_arr_deltas.cohort_start_month,
    -account_monthly_arr_deltas.cohort_start_fiscal_quarter,
    -account_monthly_arr_deltas.cohort_start_fiscal_year,
    -account_monthly_arr_deltas.account_name,
    -account_monthly_arr_deltas.age_of_account,
    -account_monthly_arr_deltas.age_of_account,
    -account_monthly_arr_deltas.total_first_month_ending_arr,
    -account_monthly_arr_deltas_first_month.month_end_date,
    -account_monthly_arr_deltas_first_month.month_end_month,
    -account_monthly_arr_deltas_first_month.month_end_fiscal_quarter,
    -account_monthly_arr_deltas_first_month.month_end_fiscal_year,
    -account_monthly_arr_deltas_first_month.total_ending_arr,
    -account_monthly_arr_deltas_first_month.count_accounts
  ]

  join: dates {
    view_label: "Account ARR Monthly Changes"
    sql_on: ${dates.date_date} >= ${account_monthly_arr_deltas_first_month.month_end_date} and ${dates.last_day_of_month};;
    relationship: many_to_many
    fields: [dates.last_day_of_fiscal_quarter, dates.last_day_of_fiscal_year]
  }
  join: account_monthly_arr_deltas {
    view_label: "Account ARR Monthly Changes"
    sql_on: ${account_monthly_arr_deltas.account_sfid} = ${account_monthly_arr_deltas_first_month.account_sfid} and ${dates.date_date} = ${account_monthly_arr_deltas.month_end_date};;
    relationship: many_to_many
  }
  join: account {
    view_label: "Account ARR Monthly Changes"
    sql_on: ${account.sfid} = ${account_monthly_arr_deltas_first_month.account_sfid} ;;
    relationship: many_to_one
    fields: [account.arr_current, account.total_current_arr]
  }
}

explore: arr {
  extends: [account]
  view_name: account
  label: "ARR Granular Reporting"
  group_label: "Finance"
  sql_always_where: ${opportunity.iswon} and ${opportunitylineitem.product_type} = 'Recurring';;

  join: dates {
    view_label: "ARR Date"
    sql_on: ${dates.date_date} >= ${opportunitylineitem.start_date} and ${dates.date_date} <= ${opportunitylineitem.end_date} ;;
    relationship: many_to_many
  }

  fields: [
    dates.date_date,
    dates.date_day_of_month,
    dates.date_day_of_year,
    dates.date_month,
    dates.date_fiscal_quarter,
    dates.date_fiscal_year,
    dates.date_month_full_date,
    dates.next_date,
    dates.next_month,
    dates.next_fiscal_quarter,
    dates.next_fiscal_year,
    dates.last_and_next_12mo,
    dates.first_day_of_month,
    dates.last_day_of_month,
    dates.previous_current_future_month,
    dates.first_day_of_fiscal_year,
    dates.last_day_of_fiscal_year,
    dates.first_day_of_fiscal_quarter,
    dates.last_day_of_fiscal_quarter,
    opportunitylineitem.opportunitylineitem_core*,
    opportunity_ext.license_min_start_date_date,opportunity_ext.license_min_start_date_month, opportunity_ext.license_min_start_date_fiscal_quarter, opportunity_ext.license_min_start_date_fiscal_year,
    opportunity_ext.license_max_end_date_date,opportunity_ext.license_max_end_date_month, opportunity_ext.license_max_end_date_fiscal_quarter, opportunity_ext.license_max_end_date_fiscal_year,
    account.account_core*,
    opportunity.opportunity_core*,
    product2.general_product,
    product2.list_of_general_products,
    opportunity.billing_country,
    opportunity.shipping_country,
    opportunity.expansion_type,
    opportunity_ext.paid,
    opportunity_ext.paid_type,
    opportunity_ext.paid_date,opportunity_ext.paid_month,opportunity_ext.paid_fiscal_quarter,opportunity_ext.paid_fiscal_year,
    opportunity_ext.marketing_generated
  ]
}

explore: current_potential_arr {
  view_name: account
  label: "Current & Potential ARR Reporting"
  hidden: yes
  group_label: "Finance"
  sql_always_where: ${opportunitylineitem.product_type} = 'Recurring';;
  extends: [arr]

  fields: [
    dates.date_date,
    dates.date_day_of_month,
    dates.date_day_of_year,
    dates.date_month,
    dates.date_fiscal_quarter,
    dates.date_fiscal_year,
    dates.date_month_full_date,
    dates.next_date,
    dates.next_month,
    dates.next_fiscal_quarter,
    dates.next_fiscal_year,
    dates.last_and_next_12mo,
    dates.first_day_of_month,
    dates.last_day_of_month,
    dates.previous_current_future_month,
    dates.first_day_of_fiscal_year,
    dates.last_day_of_fiscal_year,
    dates.first_day_of_fiscal_quarter,
    dates.last_day_of_fiscal_quarter,
    opportunitylineitem.opportunitylineitem_core*,
    opportunitylineitem.total_potential_arr,
    opportunitylineitem.total_open_and_booked_arr,
    opportunitylineitem.total_potential_new_arr,
    opportunitylineitem.total_potential_expansion_arr,
    opportunitylineitem.total_potential_renewal_arr,
    opportunitylineitem.potential_new_arr,
    opportunitylineitem.potential_expansion_arr,
    opportunitylineitem.potential_renewal_arr,
    account.account_core*,
    account.arr_current,
    opportunity.opportunity_core*,
    opportunity.renewed_by_opportunity_id
  ]
}

explore: financial_statements {
  sql_always_where: CONTAINS({{ _user_attributes['data_permissions']}},'finance');;
  group_label: "Finance"
  label: "Financial Statements"
}

explore: financial_model {
  sql_always_where: CONTAINS({{ _user_attributes['data_permissions']}},'finance_only');;
  group_label: "Finance"
  label: "Financial Model"
}

explore: dates {
  group_label: "Utility"
}
