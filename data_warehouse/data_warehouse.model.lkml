connection: "snowflake"
fiscal_month_offset: -11


#
# Persistence
#

datagroup: mm_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

datagroup: mm_salesforce_data_group {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "5 minutes"
}

persist_with: mm_default_datagroup


#
# Access grants
#

access_grant: debugging_fields {
  user_attribute: field_visibility
  allowed_values: [ "all", "developer", "admin" ]
}

access_grant: sales_mgmt_data_access {
  user_attribute: data_permissions
  allowed_values: ["'mlt,finance,finance_only,sales_mgmt,all'", "'mlt,finance,sales_mgmt,all'", "'sales_mgmt'"]
}

access_grant: admin_access {
  user_attribute: data_permissions
  allowed_values: ["'mlt,finance,finance_only,sales_mgmt,all'"]
}

#
# Formats
#

# BP: Define your own global named value formats to make changing defaults easy
named_value_format: mm_usd_short {
 value_format: "$###,##0"
}

named_value_format: mm_integer_percent {
  value_format: "0\%"
}


week_start_day: sunday

#
# Views
#

include: "/data_warehouse/**/**/*.view.lkml"


#
# Base Explores for Extensions
#

explore: tasks_filtered {
  group_label: "Salesforce"
  join: task_owner {
    from: user
    sql_on: ${tasks_filtered.ownerid} = ${task_owner.sfid} ;;
    relationship: many_to_one
    fields: []
  }

  join: account {
    sql: ${account.sfid} = ${tasks_filtered.accountid};;
    relationship: many_to_one
    fields: []
  }
}



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

  join: contact {
    view_label: "Oppt Contact Role (Contact)"
    sql_on: ${opportunitycontactrole.contactid} = ${contact.sfid};;
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



#
# Explores
#

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


explore: user_sales_reps {
  from:  user
  label: "Sales Reps"
  group_label: "Salesforce"
  sql_always_where: ${owner_type} IN ('Field Rep', 'Commercial Rep', 'Sales Mgt', 'CSM');;
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

explore: master_account_monthly_arr_deltas_by_type {
  label: "Monthly Master Account ARR Changes by Type"
  hidden: yes
  group_label: "Finance"
  extends: [_base_account_core_explore]

  join: account {
    view_label: "Master Account Monthly ARR Changes"
    relationship: one_to_one
    sql_on: ${account.sfid} = ${master_account_monthly_arr_deltas_by_type.master_account_sfid} ;;
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

explore: master_account_daily_arr_deltas {
  label: "Daily Master Account ARR Changes"
  view_label: "Master Account Daily ARR Deltas"
  hidden: yes
  group_label: "Finance"
  extends: [_base_account_core_explore]

  join: account {
    view_label: "Master Account Daily ARR Deltas"
    sql_on: ${account.sfid} = ${master_account_daily_arr_deltas.master_account_sfid} ;;
    relationship: many_to_one
    fields: [name,sfid]
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

explore: forecast_ww {
  label: "Forecast (WW)"
  group_label: "Target vs Actual"

  join: forecast_ww_history {
    sql_on: ${forecast_ww.sfid} = ${forecast_ww_history.fc_to_history};;
    relationship: one_to_many
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
#  extends: [_base_account_core_explore,_base_opportunity_core_explore]

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

  join: created_by {
    view_label: "Lead Created By"
    from: user
    sql_on: ${lead.createdbyid} = ${created_by.sfid} ;;
    relationship: many_to_one
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

explore: contributor_map_data {
  group_label: "Contributors"
}

explore: daily_traffic {
  group_label: "Marketing"
  label: "GA Daily Traffic"
}

explore: daily_page_visits {
  group_label: "Marketing"
  label: "GA Daily Page Visits"
  join: blog_paths {
    view_label: "Daily Page Visits"
    sql_on: ${daily_page_visits.page_path_2} = ${blog_paths.page_path} ;;
    relationship: many_to_one
    fields: [blog_paths.category]
  }
}

explore: downloads {
  group_label: "Product"
  description: "Contains all downloads from Mattermost web properties including server and dekstop app downloads. Use this to trend downloads over time."
}


explore: nps_data {
  label: "NPS Data"
  group_label: "Product"
  description: "Contains raw NPS data. Typically you will want to use 'NPS User Monthly Score' instead of this, which contains a structured version of this data that allows you to trend the aggregate NPS score, not just the score at time of submission."
  extends: [_base_account_core_explore]

  join: license_overview {
    sql_on: ${nps_data.license_id} = ${license_overview.licenseid}  ;;
    relationship: many_to_many
    fields: []
  }

  join: account {
    sql_on: ${license_overview.account_sfid} = ${account.sfid};;
    relationship: many_to_one
    fields: [account.account_core*]
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


explore: github_contributions {
  group_label: "Contributors & Employees"
  label: "GitHub Community Contributions"
  sql_always_where: ${is_staff} = FALSE ;;

  join: github_contributors {
    sql_on: ${github_contributions.author} = ${github_contributors.author} ;;
    relationship: many_to_one
    fields: []
  }

  join: staff_github_usernames {
    sql_on: ${github_contributions.author} = ${staff_github_usernames.username} ;;
    relationship: many_to_one
    fields: []
  }

  join: github_repo_categorization {
    sql_on: ${github_repo_categorization.repo} = ${github_contributions.repo} ;;
    relationship: many_to_one
    fields: [category]
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

explore: server_daily_details {
  group_label: "Product"
  label: " Server Daily Details"
  description: "Contains a daily snapshot of each non-test/dev server's state. Use this to trend server counts, TEDAS/TEDAU, and age over time. Includes server version, ip, active users, registered users, operating system, Salesforce Account ID, database type, etc."
  extends: [_base_account_core_explore]

  join: account {
    sql_on: ${license_server_fact.customer_id} = ${account.sfid} ;;
    relationship: many_to_one
    type: left_outer
    fields: [account.account_core*]
  }

  join: server_fact {
    sql_on: ${server_daily_details.server_id} = ${server_fact.server_id} ;;
    relationship: many_to_one
    type: inner
}

  join: subscriptions {
    view_label: "Subscriptions (BLApi)"
    sql_on: ${license_server_fact.license_id} = ${subscriptions.cws_installation} ;;
    relationship: one_to_one
    fields: [subscriptions.cws_dns]
  }

  join: nps_server_daily_score {
    view_label: "Server NPS"
    sql_on: ${nps_server_daily_score.server_id} = ${server_daily_details.server_id}
      AND ${nps_server_daily_score.date_date}::DATE = DATE_TRUNC('day', ${server_daily_details.logging_date}::DATE);;
    relationship: one_to_one
    type: left_outer
    fields: []
  }

  join: server_upgrades {
    view_label: " Server Daily Details"
    sql_on: ${server_upgrades.server_id} = ${server_daily_details.server_id}
      AND ${server_upgrades.logging_date} = ${server_daily_details.logging_date};;
    relationship: one_to_one
    fields: [server_upgrades.prev_version, server_upgrades.server_edition_upgrades, server_upgrades.server_version_upgrades, server_upgrades.is_version_upgrade_date, server_upgrades.is_edition_upgrade_date]
  }

  join: license_server_fact {
    type: left_outer
    relationship: many_to_one
    sql_on: (${license_server_fact.server_id} = ${server_daily_details.server_id}) and (${server_daily_details.logging_date} BETWEEN ${license_server_fact.start_date} AND ${license_server_fact.license_retired_date});;
  }

  join: trial_requests {
    sql_on: ${trial_requests.license_id} = ${license_server_fact.license_id} ;;
    relationship: many_to_one
    type: left_outer
    fields: []
  }

  join: server_events_by_date {
    view_label: " Server Daily Details"
    sql_on: ${server_daily_details.server_id} = ${server_events_by_date.server_id}
      AND ${server_daily_details.logging_date} = ${server_events_by_date.logging_date};;
    relationship: one_to_one
    fields: []
  }

  join: excludable_servers {
    view_label: " Server Daily Details"
    sql_on: ${excludable_servers.server_id} = ${server_daily_details.server_id} ;;
    relationship: many_to_one
    fields: [excludable_servers.reason]
  }

  join: server_daily_details_ext {
    view_label: " Server Daily Details"
    sql_on: ${server_daily_details.logging_date} = ${server_daily_details_ext.logging_date}
    AND ${server_daily_details.server_id} = ${server_daily_details_ext.server_id} ;;
    relationship: one_to_one
    fields: [server_daily_details_ext.active_users_daily, server_daily_details_ext.active_users_daily_band, server_daily_details_ext.active_users_monthly, server_daily_details_ext.registered_deactivated_users, server_daily_details_ext.registered_users,
      server_daily_details_ext.registered_users_band]
  }

  join: version_release_dates {
    view_label: " Server Daily Details"
    sql_on: ${server_daily_details.server_version_major} = split_part(${version_release_dates.version}, '.', 1) || '.' || split_part(${version_release_dates.version}, '.', 2) ;;
    relationship: many_to_one
    fields: [version_release_dates.supported]
  }

  join: user_events_telemetry {
    view_label: "User Events"
    sql_on: ${user_events_telemetry.user_id} = ${server_daily_details.server_id} and ${user_events_telemetry.event_date} = ${server_daily_details.logging_date} ;;
    relationship: one_to_many
    fields: [user_events_telemetry.post_count, user_events_telemetry.count1, user_events_telemetry.event_count, user_events_telemetry.thread_count, user_events_telemetry.members_added_to_team_sum,
      user_events_telemetry.members_removed_from_team_sum, user_events_telemetry.groups_removed_from_team_sum, user_events_telemetry.batch_add_members_sum, user_events_telemetry.user_actual_count, user_events_telemetry.event_count,
      user_events_telemetry.custom_emojis_added, user_events_telemetry.post_reaction_count, user_events_telemetry.groups_added_to_team_sum, user_events_telemetry.plugin_added_count, user_events_telemetry.plugin_updates_count]
  }
}

explore: delete_history {
  view_label: "Delete History"
  group_label: "Salesforce"
}

explore: server_fact {
  group_label: "Product"
  description: "Contains the most recent state of a server. Includes first active date, last active date, license id, Salesforce Account ID, version, max active user counts, etc."
  hidden: no

  join: license_server_fact {
    view_label: "License Fact"
    sql_on: ${license_server_fact.server_id} = ${server_fact.server_id};;
    relationship: one_to_many
  }

  join: lead {
    view_label: "Lead (Salesforce)"
    sql_on:  ${license_server_fact.license_email} = ${lead.email} ;;
    relationship: many_to_one
    fields: [lead.email, lead.name, lead.convertedaccountid, lead.existing_account__c, lead.matched_account, lead.sfid, lead.job_function, lead.convertedcontactid, lead.lead_source, lead.lead_type, lead.lead_status_combined, lead.most_recent_action]
  }

  join: trial_requests {
    sql_on: ${trial_requests.license_id} = ${license_server_fact.license_id} ;;
    relationship: many_to_one
    type: left_outer
    fields: []
  }

  join: excludable_servers {
    view_label: "Server Fact"
    sql_on: ${excludable_servers.server_id} = ${server_fact.server_id} ;;
    relationship: one_to_one
    fields: [excludable_servers.reason]
  }

  join: version_release_dates {
    view_label: "Server Fact"
    sql_on: ${server_fact.server_version_major} = split_part(${version_release_dates.version}, '.', 1) || '.' || split_part(${version_release_dates.version}, '.', 2) ;;
    relationship: many_to_one
    fields: [version_release_dates.supported]
  }

  join: cloud_clearbit {
    view_label: "Clearbit (Cloud)"
    sql_on: ${server_fact.server_id} = ${cloud_clearbit.server_id} ;;
    relationship: one_to_one
  }

  join: server_daily_details_ext {
    view_label: "Enabled Plugins"
    sql_on: ${server_daily_details_ext.server_id} = ${license_server_fact.server_id} AND ${server_daily_details_ext.logging_date} = ${server_fact.last_mm2_telemetry_date} ;;
    relationship: one_to_one
    fields: [server_daily_details_ext.enable_plugins_count, server_daily_details_ext.enable_antivirus_count, server_daily_details_ext.enable_autolink_count, server_daily_details_ext.enable_aws_sns_count,
      server_daily_details_ext.enable_custom_user_attributes_count, server_daily_details_ext.enable_github_count, server_daily_details_ext.enable_gitlab_count, server_daily_details_ext.enable_health_check_count,
      server_daily_details_ext.enable_jenkins_count, server_daily_details_ext.enable_jira_count, server_daily_details_ext.enable_marketplace_count, server_daily_details_ext.enable_nps_count, server_daily_details_ext.enable_remote_marketplace_count,
      server_daily_details_ext.enable_uploads_count, server_daily_details_ext.enable_webex_count, server_daily_details_ext.enable_welcome_bot_count, server_daily_details_ext.enable_zoom_count, server_daily_details_ext.enable_confluence_count,
      server_daily_details_ext.enable_jitsi_count, server_daily_details_ext.enable_mscalendar_count, server_daily_details_ext.enable_todo_count, server_daily_details_ext.enable_skype4business_count, server_daily_details_ext.enable_giphy_count,
      server_daily_details_ext.enable_digital_ocean_count, server_daily_details_ext.enable_incident_response_count, server_daily_details_ext.enable_memes_count, server_daily_details_ext.ask_community_link_enabled_count, server_daily_details_ext.enable_matterpoll_count,
      server_daily_details_ext.enable_channel_recommender_count, server_daily_details_ext.enable_agenda_count, server_daily_details_ext.enable_msteamsmeeting_count, server_daily_details_ext.enable_icebreaker_count]
  }
}

explore: dates {
  group_label: "Utility"
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

  join: tasks_filtered {
    sql_on: ${account.sfid} = ${tasks_filtered.accountid} ;;
    relationship: one_to_many
  }

  join: task_owner {
    from: user
    sql_on: ${tasks_filtered.ownerid} = ${task_owner.sfid} ;;
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

explore: nps_user_monthly_score {
  group_label: "Product"
  label: "NPS User Daily Score"
  description: "Contains NPS Score data per user per day for all users that have submitted an NPS survey (Updated every 30 minutes for new submissions). Can be used to trend NPS by date by server version, server age, user role, user age, etc.."
  extends: [_base_account_core_explore]
  always_filter: {
    filters: [21days_since_release: "yes"]
  }

  join: nps_feedback_classification {
    view_label: "NPS User Daily Score"
    sql_on: ${nps_feedback_classification.user_id} = ${nps_user_monthly_score.user_id}
      AND ${nps_feedback_classification.server_id} = ${nps_user_monthly_score.server_id}
      AND ${nps_feedback_classification.last_feedback_date} = ${nps_user_monthly_score.last_feedback_date} ;;
    relationship: many_to_one
    type: left_outer
    fields: [nps_feedback_classification.categorized_at_date, nps_feedback_classification.categorized_at_month, nps_feedback_classification.categorized_at_week, nps_feedback_classification.categorized_at_year, nps_feedback_classification.categorized_at_time, nps_feedback_classification.categorized_by, nps_feedback_classification.category_rank]
  }

  join: account {
    sql_on: ${server_fact.account_sfid} = ${account.sfid} ;;
    fields: [account.account_core*]
    relationship: many_to_one
  }

  join: server_fact {
    view_label: "NPS User Daily Score"
    sql_on: ${nps_user_monthly_score.server_id} = ${server_fact.server_id};;
    relationship: many_to_one
    fields: [server_fact.first_server_version_major]
  }

  join: license_server_fact {
    sql_on: ${nps_user_monthly_score.server_id} = ${license_server_fact.server_id} AND ${nps_user_monthly_score.last_score_date} between CASE WHEN ${license_server_fact.edition} = 'Mattermost Cloud' THEN ${license_server_fact.issued_date} ELSE ${license_server_fact.start_date} END AND ${license_server_fact.license_retired_date} ;;
    relationship: many_to_one
  }

  join: trial_requests {
    sql_on: ${trial_requests.license_id} = ${license_server_fact.license_id} ;;
    relationship: many_to_one
    type: left_outer
    fields: []
  }

  join: excludable_servers {
    sql_on: ${excludable_servers.server_id} = ${nps_user_monthly_score.server_id} ;;
    relationship: many_to_one
    fields: [excludable_servers.reason]
  }

  join: version_release_dates {
    view_label: "NPS User Daily Score"
    sql_on: ${nps_user_monthly_score.server_version} = ${version_release_dates.version} ;;
    relationship: many_to_one
    fields: [version_release_dates.release_date, version_release_dates.release_month, version_release_dates.release_year, version_release_dates.release_week]
  }

  join: server_daily_details {
    sql_on: ${nps_user_monthly_score.server_id} = ${server_daily_details.server_id} and ${nps_user_monthly_score.last_score_date} = ${server_daily_details.logging_date} ;;
    relationship: many_to_one
    type: left_outer
    fields: []
  }

  join: server_daily_details_ext {
    view_label: "Enabled Plugins"
    sql_on: ${nps_user_monthly_score.server_id} = ${server_daily_details_ext.server_id} and ${nps_user_monthly_score.month_date}::date = ${server_daily_details_ext.logging_date}::date ;;
    relationship: many_to_one
    type: left_outer
    fields: [server_daily_details_ext.enable_plugins, server_daily_details_ext.enable_antivirus, server_daily_details_ext.enable_autolink, server_daily_details_ext.enable_aws_sns,
      server_daily_details_ext.enable_custom_user_attributes, server_daily_details_ext.enable_github, server_daily_details_ext.enable_gitlab, server_daily_details_ext.enable_health_check,
      server_daily_details_ext.enable_jenkins, server_daily_details_ext.enable_jira, server_daily_details_ext.enable_marketplace, server_daily_details_ext.enable_nps, server_daily_details_ext.enable_remote_marketplace,
      server_daily_details_ext.enable_uploads, server_daily_details_ext.enable_webex, server_daily_details_ext.enable_welcome_bot, server_daily_details_ext.enable_zoom, server_daily_details_ext.enable_confluence,
      server_daily_details_ext.enable_jitsi, server_daily_details_ext.enable_mscalendar, server_daily_details_ext.enable_todo, server_daily_details_ext.enable_skype4business, server_daily_details_ext.enable_giphy,
      server_daily_details_ext.enable_digital_ocean, server_daily_details_ext.enable_incident_response, server_daily_details_ext.enable_memes, server_daily_details_ext.enable_comgithubmatterpollmatterpoll,
      server_daily_details_ext.enable_agenda, server_daily_details_ext.enable_commattermostmsteamsmeetings, server_daily_details_ext.enable_comnilsbrinkmannicebreaker, server_daily_details_ext.enable_comgithubjespinorecommend]
  }
}

explore: server_daily_details_ext {
  group_label: "Product"
  label: " Server Daily Details Ext"
  description: "An extension of 'Server Daily Details' explore that includes all server configuration and activity data. Can be used to report the volume of servers by day with various configuration settings activated, activity thresholds reached, or age milestones attained."
  extends: [_base_account_core_explore]


  join: account {
    sql_on: ${license_server_fact.customer_id} = ${account.sfid} ;;
    type: left_outer
    relationship: many_to_one
    fields: [account.account_core*]
  }

  join: server_fact {
    sql_on: ${server_daily_details_ext.server_id} = ${server_fact.server_id} ;;
    type: left_outer
    relationship: many_to_one
  }

  join: server_daily_details_ext2 {
    from: server_daily_details_ext
    view_label: "Enabled Plugins First 7 Days"
    sql_on: ${server_daily_details_ext2.server_id} = ${server_fact.server_id} AND ${server_daily_details_ext2.logging_date}::date <= ${server_fact.first_active_date}::date + interval '7 days' ;;
    relationship: one_to_many
    fields: [server_daily_details_ext2.enable_plugins_count, server_daily_details_ext2.enable_antivirus_count, server_daily_details_ext2.enable_autolink_count, server_daily_details_ext2.enable_aws_sns_count,
      server_daily_details_ext2.enable_custom_user_attributes_count, server_daily_details_ext2.enable_github_count, server_daily_details_ext2.enable_gitlab_count, server_daily_details_ext2.enable_health_check_count,
      server_daily_details_ext2.enable_jenkins_count, server_daily_details_ext2.enable_jira_count, server_daily_details_ext2.enable_marketplace_count, server_daily_details_ext2.enable_nps_count, server_daily_details_ext2.enable_remote_marketplace_count,
      server_daily_details_ext2.enable_uploads_count, server_daily_details_ext2.enable_webex_count, server_daily_details_ext2.enable_welcome_bot_count, server_daily_details_ext2.enable_zoom_count, server_daily_details_ext2.enable_confluence_count,
      server_daily_details_ext2.enable_jitsi_count, server_daily_details_ext2.enable_mscalendar_count, server_daily_details_ext2.enable_todo_count, server_daily_details_ext2.enable_skype4business_count, server_daily_details_ext2.enable_giphy_count,
      server_daily_details_ext2.enable_digital_ocean_count, server_daily_details_ext2.enable_incident_response_count, server_daily_details_ext2.enable_memes_count, server_daily_details_ext2.enable_matterpoll_count,
      server_daily_details_ext2.enable_channel_recommender_count, server_daily_details_ext2.enable_agenda_count, server_daily_details_ext2.enable_msteamsmeeting_count, server_daily_details_ext2.enable_icebreaker_count]
  }

  join: nps_server_daily_score {
    view_label: "NPS Score"
    sql_on: ${nps_server_daily_score.server_id} = ${server_daily_details_ext.server_id}
    AND ${nps_server_daily_score.date_date}::DATE = DATE_TRUNC('day', ${server_daily_details_ext.logging_date}::DATE);;
    relationship: one_to_one
    type: left_outer
    fields: [nps_server_daily_score.nps_server_core*]
  }

  join: server_upgrades {
    view_label: " Server Daily Details Ext"
    sql_on: ${server_upgrades.server_id} = ${server_daily_details_ext.server_id}
    AND ${server_upgrades.logging_date} = ${server_daily_details_ext.logging_date};;
    relationship: one_to_one
    fields: [server_upgrades.prev_version, server_upgrades.server_edition_upgrades, server_upgrades.server_version_upgrades]
  }

  join: server_events_by_date {
    sql_on: ${server_daily_details_ext.server_id} = ${server_events_by_date.server_id}
    AND ${server_daily_details_ext.logging_date} = ${server_events_by_date.logging_date};;
    relationship: one_to_one
    fields: []
  }

  join: excludable_servers {
    view_label: " Server Daily Details Ext"
    sql_on: ${excludable_servers.server_id} = ${server_daily_details_ext.server_id} ;;
    relationship: many_to_one
    fields: [excludable_servers.reason]
  }

  join: version_release_dates {
    view_label: " Server Daily Details Ext"
    sql_on: ${server_daily_details_ext.server_version_major} = split_part(${version_release_dates.version}, '.', 1) || '.' || split_part(${version_release_dates.version}, '.', 2) ;;
    relationship: many_to_one
    fields: [version_release_dates.supported]
  }

  join: license_server_fact {
    type: left_outer
    relationship: many_to_one
    sql_on: (${license_server_fact.server_id} = ${server_daily_details_ext.server_id}) and (${server_daily_details_ext.logging_date} BETWEEN ${license_server_fact.start_date} AND ${license_server_fact.license_retired_date});;
  }

  join: trial_requests {
    sql_on: ${trial_requests.license_id} = ${license_server_fact.license_id} ;;
    relationship: many_to_one
    type: left_outer
    fields: []
  }
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

explore: mql_to_close {
  group_label: "Finance"
  label: "MQL to Close"
}


explore: arr_tva_by_qtr { hidden: yes}

explore: events_registry {
  label: "Events Registry"
  group_label: "Product"
  description: "Contains the name and details of all user events currently, and historically, captured on the Mattermost platform. Including the first and most recent date the event was logged."
}

explore: user_events_by_date {
  extends: [_base_account_core_explore, server_fact]
  label: " User Events By Date"
  group_label: "Product"
  description: "Contains all 'whitelist' user events by day. 1 row per user per event per day (for all 'whitelist' events performed by that user across web, desktop, and mobile). Also provides the sum of events performed for each row, which captures the total number of events performed by the user, for the given event, on the given date (must be >= 1). Use this to track and trend the volume of individual events by day, by browser, by os, etc.."

  join: server_daily_details {
    view_label: "Server Details"
    sql_on: ${user_events_by_date.server_id} = ${server_daily_details.server_id}
    AND ${user_events_by_date.logging_date} = ${server_daily_details.logging_date};;
    relationship: many_to_one
    fields: [server_daily_details.server_version_major, server_daily_details.version, server_daily_details.edition2]
  }

  join: account {
    sql: ${server_fact.account_sfid} = ${account.sfid} ;;
  }

  join: server_fact {
    view_label: "Server Details"
    sql_on: ${server_fact.server_id} = ${user_events_by_date.server_id} ;;
    relationship: many_to_one
#     fields: [server_fact.license_all, server_fact.license_id_filter, server_fact.gitlab_install, server_fact.first_active_date, server_fact.first_active_week, server_fact.first_active_month, server_fact.first_active_year, server_fact.first_active_fiscal_quarter, server_fact.first_active_fiscal_year, server_fact.license_id, server_fact.account_sfid, server_fact.first_server_version, server_fact.first_server_version_major, server_fact.first_server_edition]
  }

  join: events_registry {
    view_label: " User Events By Date"
    sql_on: ${events_registry.event_name} = ${user_events_by_date.event_name} ;;
    relationship: many_to_one
    fields: [events_registry.event_category, events_registry.date_added_date, events_registry.last_triggered_date]
  }

  join: user_fact {
    view_label: " User Events By Date"
    sql_on: ${user_fact.user_id} = ${user_events_by_date.user_id} ;;
    relationship: many_to_one
    fields: [user_fact.first_event_name, user_fact.second_event_name, user_fact.third_event_name, user_fact.fourth_event_name, user_fact.fifth_event_name, user_fact.sixth_event_name, user_fact.seventh_event_name, user_fact.eighth_event_name, user_fact.ninth_event_name, user_fact.tenth_event_name]
  }

  join: user_agent_registry {
    view_label: "User Agent Details"
    sql_on: ${user_agent_registry.context_useragent} = ${user_events_by_date.user_agent} ;;
    relationship: many_to_one
    type: left_outer
    fields: [user_agent_registry.device_type, user_agent_registry.device_model, user_agent_registry.device_brand]
  }

  join: excludable_servers {
    view_label: "Server Details"
    sql_on: ${user_events_by_date.server_id} =  ${excludable_servers.server_id};;
    relationship: many_to_one
    fields: [excludable_servers.reason]
  }

  join: license_current {
    from: license_server_fact
    type: left_outer
    relationship: many_to_one
    sql_on: (${license_current.server_id} = ${user_events_by_date.server_id}) and (${user_events_by_date.logging_date} BETWEEN ${license_current.start_date} AND ${license_current.license_retired_date});;
    fields: []
  }


}

explore: user_events_by_date_agg {
  extends: [_base_account_core_explore, server_fact]
  label: "User Events By Date Agg"
  group_label: "Product"
  description: "Contains an aggregated version of the 'User Events By Date' explore. Sums all events performed by the user across mobile, web, and desktop. Use this to trend DAU and MAU over time. 1 row per user per day for all dates >= the user's first event date (i.e. contains row for users on dates where user has not performed event to track disengagement)."

  join: server_daily_details {
    view_label: "Server Details"
    sql_on: ${user_events_by_date_agg.server_id} = ${server_daily_details.server_id}
      AND ${user_events_by_date_agg.logging_date} = ${server_daily_details.logging_date};;
    relationship: many_to_one
    fields: [server_daily_details.server_version_major, server_daily_details.version, server_daily_details.edition2]
  }

  join: account {
    sql: ${server_fact.account_sfid} = ${account.sfid} ;;
  }

  join: server_fact {
    view_label: "Server Details"
    sql_on: ${server_fact.server_id} = ${user_events_by_date_agg.server_id} ;;
    relationship: many_to_one
    fields: [server_fact.license_all, server_fact.license_id_filter, server_fact.gitlab_install, server_fact.first_active_date, server_fact.first_active_week, server_fact.first_active_month, server_fact.first_active_year, server_fact.first_active_fiscal_quarter, server_fact.first_active_fiscal_year, server_fact.license_id, server_fact.account_sfid, server_fact.first_server_version, server_fact.first_server_version_major, server_fact.first_server_edition]
  }

  join: excludable_servers {
    view_label: "Server Details"
    sql_on: ${user_events_by_date_agg.server_id} =  ${excludable_servers.server_id};;
    relationship: many_to_one
    fields: [excludable_servers.reason]
  }

  join: user_fact {
    view_label: "User Events By Date Agg"
    sql_on: ${user_fact.user_id} = ${user_events_by_date_agg.user_id} ;;
    relationship: many_to_one
    fields: [user_fact.first_event_name, user_fact.second_event_name, user_fact.third_event_name, user_fact.fourth_event_name, user_fact.fifth_event_name, user_fact.sixth_event_name, user_fact.seventh_event_name, user_fact.eighth_event_name, user_fact.ninth_event_name, user_fact.tenth_event_name]
  }

  join: license_current {
    from: license_server_fact
    type: left_outer
    relationship: many_to_one
    sql_on: (${license_current.server_id} = ${user_events_by_date_agg.server_id}) and (${user_events_by_date_agg.logging_date} BETWEEN ${license_current.start_date} AND ${license_current.license_retired_date});;
    fields: []
  }
}

explore: snowflake_amortized_rates {
  label: "Snowflake Amortized Rates"
  group_label: "zBizOps Spend"
  description: "Contains Snowflake spend data. Primarily for BizOps to track Snowflake cost of usage."
}
explore: snowflake_contract_rates {
  label: "Snowflake Contract Rates"
  group_label: "zBizOps Spend"
  description: "Contains Snowflake spend data. Primarily for BizOps to track Snowflake cost of usage."
}
explore: snowflake_warehouse_cost {
  label: "Snowflake Warehouse Cost"
  group_label: "zBizOps Spend"
  description: "Contains Snowflake spend data. Primarily for BizOps to track Snowflake cost of usage."
}

explore: licenses {
  label: "Licenses"
  group_label: "BLP"
  hidden: yes
}

explore: license_daily_details {
  label: "License Daily Details"
  group_label: "BLP"
  description: "Contains a daily snapshot of license data including aggregate measures for all servers associated with a license, Salesforce account information, # licensed users, # registered users, licensed MAU, licensed DAU, and aggregate server activity totals. You can use this to track specific customers over time or view the most up-to-date data available for trial and non-trial licenses."
  hidden: yes
}

explore: data_errors {
  label: "Business Data Errors"
  group_label: "zBizOps"

  join: account {
    sql_on: ${account.sfid} = ${data_errors.object_id} and ${data_errors.object} = 'account';;
    relationship: many_to_many
    fields: []
  }

  join: opportunity {
    sql_on: ${opportunity.sfid} = ${data_errors.object_id} and ${data_errors.object} = 'opportunity';;
    relationship: many_to_many
    fields: []
  }
}

explore: user_fact {
  label: "User Fact"
  description: "Contains the current state (or last recorded state) of a user including first active dates, all time event/activity counts, NPS scores/dates, etc."
  group_label: "Product"
  extends: [_base_account_core_explore]

  join: account {
    sql_on: ${user_fact.account_sfid} = ${account.sfid} ;;
    relationship: many_to_one
    fields: [account.account_core*]
  }

  join: server_fact {
    view_label: "User Fact"
    sql_on: ${user_fact.server_id} = ${server_fact.server_id} ;;
    relationship: many_to_one
    fields: [server_fact.server_edition, server_fact.server_version, server_fact.server_version_major]
  }

  join: server_fact2 {
    from: server_fact
    view_label: "User Fact"
    sql_on: ${user_fact.first_server_id} = ${server_fact2.server_id} ;;
    relationship: many_to_one
    fields: [server_fact2.first_server_edition, server_fact2.first_server_version, server_fact2.first_server_version_major]
  }
}

explore: user_daily_details {
  label: "User Daily Details"
  description: "Use this to trend the state of a users activity (events), mau status, NPS score, etc. over time. Contains a daily snapshot of user allowing you to trend by various dimensions and measures including user age at the time of the logging data (snapshot date)."
  group_label: "Product"
  extends: [_base_account_core_explore]

  join: account {
    sql_on: ${user_daily_details.account_sfid} = ${account.sfid} ;;
    relationship: many_to_one
    fields: [account.account_core*]
  }

  join: user_fact {
    view_label: "User Daily Details"
    relationship: many_to_one
    sql_on: ${user_daily_details.user_id} = ${user_fact.user_id} ;;
    fields: []
  }
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


explore: server_upgrades {
  label: " Server Upgrades"
  description: "Use this to trend the number of server upgrades by version or edition over time."
  group_label: "Product"
  extends: [_base_account_core_explore, server_fact]
  hidden: no

  join: account {
    sql_on: ${server_fact.account_sfid} = ${account.sfid} ;;
    relationship: many_to_one
    fields: [account.account_core*]
  }

  join: server_fact {
    sql_on: ${server_fact.server_id} = ${server_upgrades.server_id} ;;
    relationship: many_to_one
  }

  join: license_current {
    from: license_server_fact
    type: left_outer
    relationship: many_to_one
    sql_on: (${license_current.server_id} = ${server_upgrades.server_id}) and (${server_upgrades.logging_date} BETWEEN ${license_current.start_date} AND ${license_current.license_retired_date});;
    fields: []
  }

  join: excludable_servers {
    view_label: " Server Upgrades"
    sql_on: ${excludable_servers.server_id} = ${server_upgrades.server_id} ;;
    relationship: many_to_one
    fields: [excludable_servers.reason]
  }

  join: version_release_dates {
    view_label: "Server Daily Details"
    sql_on: ${server_upgrades.current_version_major} = split_part(${version_release_dates.version}, '.', 1) || '.' || split_part(${version_release_dates.version}, '.', 2) ;;
    relationship: many_to_one
    fields: [version_release_dates.supported, version_release_dates.release_date, version_release_dates.release_month, version_release_dates.release_year, version_release_dates.release_week]
  }

  join: server_daily_details {
    view_label: "Server Daily Details"
    sql_on: ${server_upgrades.server_id} = ${server_daily_details.server_id} and ${server_upgrades.logging_date} = ${server_daily_details.logging_date} ;;
    fields: [server_daily_details.active_user_count]
    relationship: many_to_one
  }

  join: server_daily_details_ext {
    view_label: "Server Daily Details"
    sql_on: ${server_upgrades.server_id} = ${server_daily_details_ext.server_id} and ${server_upgrades.logging_date} = ${server_daily_details_ext.logging_date} ;;
    relationship: many_to_one
    fields: []
  }
}

# explore: nps_server_daily_score {
#   label: "Nps Server Daily Score"
#   group_label: "Product"
#   description: "Use this explore to trend NPS at the daily server level to track how a servers NPS changes over time."
#   hidden: yes
# }

explore: excludable_servers {
  label: "Excludable Servers"
  hidden: yes
}

explore: server_events_by_date {
  label: "Server Events By Date"
  hidden: yes
}

explore: nps_server_version_daily_score {
  label: "NPS Server Version Daily Score"
  group_label: "Product"
  always_filter: {
    filters: [21days_since_release: "yes"]
  }

  # join: account {
  #   sql_on: ${server_fact.account_sfid} = ${account.sfid} ;;
  #   fields: [account.account_core*]
  #   relationship: many_to_one
  # }

  join: server_fact {
    view_label: "Server Fact"
    sql_on: ${nps_server_version_daily_score.server_id} = ${server_fact.server_id};;
    relationship: many_to_one
  }

  join: license_server_fact {
    type: left_outer
    relationship: many_to_one
    sql_on: (${license_server_fact.server_id} = ${nps_server_version_daily_score.server_id}) and (${nps_server_version_daily_score.last_score_date} BETWEEN CASE WHEN ${license_server_fact.edition} = 'Mattermost Cloud' THEN ${license_server_fact.issued_date} ELSE ${license_server_fact.start_date} END AND ${license_server_fact.license_retired_date});;
  }

  join: trial_requests {
    sql_on: ${trial_requests.license_id} = ${license_server_fact.license_id} ;;
    relationship: many_to_one
    type: left_outer
    fields: []
  }

  join: excludable_servers {
    sql_on: ${excludable_servers.server_id} = ${nps_server_version_daily_score.server_id} ;;
    relationship: many_to_one
    fields: [excludable_servers.reason]
  }

  join: version_release_dates {
    view_label: "NPS Server Version Daily Score"
    sql_on: ${nps_server_version_daily_score.server_version} = ${version_release_dates.version} ;;
    relationship: many_to_one
    fields: [version_release_dates.release_date, version_release_dates.release_month, version_release_dates.release_year, version_release_dates.release_week]
  }

  join: server_daily_details {
    sql_on: ${nps_server_version_daily_score.server_id} = ${server_daily_details.server_id} and ${nps_server_version_daily_score.last_score_date} = ${server_daily_details.logging_date} ;;
    relationship: many_to_one
    type: left_outer
    fields: []
  }
}

explore: licenses_grouped {
  label: "Licenses (Server Level)"
  group_label: "BLP"
  hidden: yes
}

explore: licenses_only {
  label: "Licenses"
  group_label: "BLP"
  hidden: yes
}

explore: version_release_dates {
  label: "Version Release Dates"
  hidden: yes
}


explore: hist_license_mapping {
  label: "Legacy License Mapping"
  view_label: "Legacy License Mapping"
  group_label: "BLP"
  join: account {
    view_label: "Legacy License Mapping"

    relationship: many_to_one
    sql_on: ${hist_license_mapping.account_sfid} = ${account.sfid} ;;
    fields: [name, sfid]
  }
}

explore: enterprise_license_fact {
  extends: [_base_account_core_explore]
  group_label: "BLP"
  join: account {
    sql_on: ${account.sfid} = ${enterprise_license_fact.account_sfid} ;;
    type: full_outer
  }
}

explore: trial_licenses {
  label: "Trial Licenses"
  sql_always_where: ${license_daily_details.is_trial} ;;
  from: license_daily_details
  view_label: "License Daily Details"
  view_name: license_daily_details
  extends: [license_daily_details]

  join: lead {
    view_label: "Associated Lead"
    sql_on: lower(${license_daily_details.license_email}) = lower(${lead.email});;
    relationship: many_to_many
    fields: [email,sfid,lead.status,lead.status_order]
  }

  join: contact {
    view_label: "Associated Contact"
    sql_on: lower(${license_daily_details.license_email}) = lower(${contact.email});;
    relationship: many_to_many
    fields: [email,sfid]
  }

  join: owner {
    view_label: "Associated Lead / Contact Owner"
    from: user
    relationship: many_to_one
    sql_on: ${owner.sfid} = coalesce(${contact.ownerid},${lead.ownerid});;
    fields: [name]
  }
}

explore: in_product_trial_requests {
  group_label: "Product"
  label: "In Product Trial Requests"
  from: trial_requests

  join: lead {
    view_label: "Associated Lead"
    sql_on: ${in_product_trial_requests.is_lead} AND ${in_product_trial_requests.sfid} = ${lead.sfid};;
    relationship: many_to_one
    fields: []
  }

  join: contact {
    view_label: "Associated Contact"
    sql_on: ${in_product_trial_requests.is_contact} AND ${in_product_trial_requests.sfid} = ${contact.sfid};;
    relationship: many_to_one
    fields: []
  }

  join: owner {
    view_label: "Associated Lead / Contact Owner"
    from: user
    relationship: many_to_one
    sql_on: ${owner.sfid} = coalesce(${contact.ownerid},${lead.ownerid});;
    fields: []
  }

  join: server_fact {
    relationship: many_to_one
    sql_on: ${in_product_trial_requests.server_id} = ${server_fact.server_id} ;;
  }

  join: license_server_fact {
    view_label: "Server Fact"
    sql_on: ${license_server_fact.server_id} = ${server_fact.server_id};;
    relationship: one_to_many
    fields: []
  }


}

explore: user_agent_registry {
  label: "User Agent Registry"
  group_label: "Website"
  hidden: yes
}

explore: daily_website_traffic {
  group_label: "Website"
  label: "Daily Website Traffic"

  join: user_agent_registry {
    view_label: "Daily Website Traffic"
    relationship: many_to_one
    sql_on: ${daily_website_traffic.context_useragent} = ${user_agent_registry.context_useragent} ;;
    fields: [user_agent_registry.bot, user_agent_registry.browser, user_agent_registry.browser_version, user_agent_registry.browser_w_version, user_agent_registry.operating_system, user_agent_registry.os_version, user_agent_registry.os_w_version, user_agent_registry.device_brand, user_agent_registry.device_type, user_agent_registry.device_model]
  }
}

explore: snowflake_data_checks {
  group_label: "zBizOps"
}

explore: stripe_charges {
  label: "Stripe Charges"
  group_label: "Finance"
  from: charges
  view_name: charges
  join: customers {
    sql_on: ${customers.id} = ${charges.customer} ;;
    relationship: many_to_one
    fields: []
  }
}

explore: customers {
  view_label: "Stripe Customers"
  group_label: "Finance"

  join: customers_blapi {
    from: CUSTOMERS
    view_label: "Customer (BLApi)"
    sql_on: ${customers_blapi.stripe_id} = ${customers.id} ;;
    relationship: one_to_one
  }

  join: subscriptions {
    sql_on: ${customers.id} = ${subscriptions.customer} ;;
    relationship: one_to_many
  }

  join: subscriptions_blapi {
    from: SUBSCRIPTIONS
    view_label: "Subscriptions (BLApi)"
    sql_on: ${subscriptions_blapi.stripe_id} = ${subscriptions.id} ;;
    relationship: one_to_one

  }

  join: subscription_items {
    sql_on: ${subscriptions.id} = ${subscription_items.subscription} ;;
    relationship: one_to_many
  }

  join: invoices {
    sql_on: ${subscriptions.id} = ${invoices.subscription} ;;
    relationship: one_to_many
  }

  join: invoices_blapi {
    from: INVOICES
    sql_on: ${invoices_blapi.stripe_id} = ${invoices.id} ;;
    relationship: one_to_one
    view_label: "Invoices (BLApi)"
  }

  join: PAYMENTS {
    view_label: "Payments (BLApi)"
    sql_on: ${PAYMENTS.id} = ${PURCHASE_FACT.payment_id} ;;
    relationship: one_to_one
  }

  join: PURCHASE_FACT {
    view_label: "Purchase Fact (Blapi)"
    sql_on: ${PURCHASE_FACT.invoice_stripe_id} = ${invoices.id} ;;
    relationship: one_to_one
  }

  join: invoice_line_items {
    sql_on: ${invoices.id} = ${invoice_line_items.invoice} ;;
    relationship: one_to_many
  }

  join: charges {
    sql_on: ${customers.id} = ${charges.customer} AND (${charges.invoice} = ${invoices.charge} OR ${charges.invoice} IS NULL);;
    relationship: one_to_many
  }

  join: products {
    sql_on: ${products.id} = ${subscription_items.plan_product} OR ${products.id} = ${invoice_line_items.plan_product};;
    relationship: many_to_one
  }

  join: server_fact {
    sql_on: ${subscriptions.cws_installation} = ${server_fact.installation_id} ;;
    relationship: one_to_one
    view_label: "Stripe Customer Server Details"
    fields: [server_fact.active_users, server_fact.monthly_active_users, server_fact.direct_message_channels, server_fact.public_channels, server_fact.private_channels, server_fact.slash_commands, server_fact.teams, server_fact.bot_posts_previous_day, server_fact.posts_previous_day, server_fact.bot_accounts, server_fact.guest_accounts, server_fact.incoming_webhooks, server_fact.outgoing_webhooks, server_fact.first_active_date, server_fact.first_active_month, server_fact.first_active_week, server_fact.first_active_year, server_fact.last_active_date, server_fact.last_active_month, server_fact.last_active_week, server_fact.last_active_year, server_fact.max_registered_users, server_fact.max_registered_deactivated_users, server_fact.max_posts]
  }
}

explore: stripe_charges_data_check {
  extends: [_base_opportunity_core_explore]
  from: charges
  view_name: charges
  label: "Stripe Charges to Opportunity"
  group_label: "zBizOps"
  join: customers {
    sql_on: ${customers.id} = ${charges.customer} ;;
    relationship: many_to_one
    fields: []
  }

  join: opportunity {
    sql_on: (${opportunity.stripe_id} = ${charges.id} OR ${opportunity.stripe_id} = ${charges.payment_intent})
            AND ${opportunity.iswon};;
    relationship: one_to_one
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
    fields: [license_max_end_date_date, license_max_end_date_fiscal_quarter]
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
    fields: [sfid, name, stagename, order_type, total_amount, close_date, close_fiscal_quarter, close_fiscal_year, status_wlo, count, is_monthly_billing]
  }

  join: renewal_opportunity_ext {
    from: opportunity_ext
    view_label: "Renewal Opportunity"
    sql_on: ${renewal_opportunity.sfid} = ${renewal_opportunity_ext.opportunityid};;
    relationship: one_to_one
    fields: [license_min_start_date_date, license_min_start_date_fiscal_quarter]
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

explore: issues {
  label: "Jira Tickets (Issues)"
  group_label: "Product"

  join: issue_comments {
    sql_on: ${issue_comments.issueid} = ${issues.id} ;;
    type: left_outer
    relationship: one_to_many
    fields: [issue_comments.comment_count]
  }
  }

explore: netsuite_opportunity {
  label: "Netsuite (Opportunity Level)"
  extends: [account]
  view_name: account
  group_label: "Finance"

  join: netsuite_financial {
    sql_on: ${opportunity.sfid} = ${netsuite_financial.opportunityid} ;;
    relationship: many_to_one
  }
}

explore: issue_comments {
  label: "Jira Comments (Issues)"
  group_label: "Product"

  join: issues {
    view_label: "Jira Tickets (Issues)"
    sql_on: ${issue_comments.issueid} = ${issues.id} ;;
    type: left_outer
    relationship: many_to_one
    fields: [issues.id, issues.key, issues.customfield_11101_value, issues.label, issues.description_filter, issues.telemetry_ticket, issues.fix_version, issues.resolution_name, issues.status_name, issues.created_date, issues.created_month, issues.created_year, issues.created_week, issues.labels, issues.description, issues.summary, issues.creator_displayname, issues.reporter_displayname, issues.customfield_11100_displayname]
  }
}

explore: server_telemetry {
  label: "Server Telemetry"
  group_label: "Quality Assurance"

  join: server_version {
    view_label: "Server Details"
    from: server_telemetry
    sql_on: ${server_telemetry.user_id} = ${server_version.user_id} and ${server_telemetry.timestamp_date} = ${server_version.timestamp_date} AND ${server_version.telemetry_relation} = 'SERVER' ;;
    type: left_outer
    relationship: many_to_many
    fields: [server_version.version]
  }

  join: server_license {
    view_label: "Server Details"
    from: server_telemetry
    sql_on: ${server_telemetry.user_id} = ${server_license.user_id} and ${server_telemetry.timestamp_date} = ${server_license.timestamp_date} AND ${server_license.telemetry_relation} = 'LICENSE';;
    type: left_outer
    relationship: many_to_many
    fields: [server_license.license_id]
  }
}
explore: events_web_desktop_telemetry {
  label: "Events Web Desktop Telemetry"
  group_label: "Quality Assurance"
}
explore: events_mobile_telemetry {
  label: "Events Mobile Telemetry"
  group_label: "Quality Assurance"
}
explore: plugins_telemetry {
  label: "Plugins Telemetry"
  group_label: "Quality Assurance"
}

explore: twitter {
  label: "Twitter Mentions"
  description: "Contains all tweets, replies, and retweets for and to tweets containing the keyword 'Mattermost'."
  group_label: "Mattermost Community"
}

explore: nps_feedback_classification {
  label: "Nps Feedback Classification"
  hidden: yes
}

explore: p2p_forum_activity {
  label: "Peer-to-Peer Forum Activity"
  description: "Contains a dailys snapshot of the aggregate counts of registrations and posts to Mattermost Peer-to-Peer Forums."
  group_label: "Mattermost Community"
}
explore: community_program_members {
  label: "Community Program Members"
  description: "Contains Members and/or Partners participating in Mattermost Community Programs (i.e. Mattermost Superstars & Trusted Partners)."
  group_label: "Mattermost Community"
}

explore: license_server_fact {
  group_label: "BLP"
  label: "License Server Fact"
  hidden: no
  extends: [person]

  join: server_fact {
    sql_on: ${license_server_fact.server_id} = ${server_fact.server_id} ;;
    relationship: many_to_one
    type: left_outer
    }

  join: excludable_servers {
    view_label: "License Server Fact"
    sql_on: ${license_server_fact.server_id} = ${excludable_servers.server_id} ;;
    relationship: many_to_one
    type: left_outer
    fields: [excludable_servers.reason]
  }

  join: trial_requests {
    sql_on: ${trial_requests.license_id} = ${license_server_fact.license_id} ;;
    relationship: many_to_one
    type: left_outer
    fields: []

  }

  join: person {
    view_label: "Person"
    sql_on: ${person.email} = ${license_server_fact.license_email};;
    relationship: many_to_one
  }
  }

explore: incident_response_events {
  description: "Contains all Incident Response events recorded by servers with Incident Response enabled. Including, but not limited to: Update/Create Playbook, Add/Remove Checklist Items, and Create/End Incident."
  view_label: "Incident Management"
  label: "Incident Management"
  group_label: "Integrations"
  extends: [license_server_fact]

  join: server_daily_details {
    view_label: "Incident Management"
    sql_on: TRIM(${incident_response_events.user_id}) = TRIM(${server_daily_details.server_id}) AND ${incident_response_events.timestamp_date} = ${server_daily_details.logging_date} ;;
    relationship: many_to_one
    type: left_outer
    fields: [server_daily_details.db_type, server_daily_details.database_type_version,server_daily_details.database_version, server_daily_details.database_version_major, server_daily_details.database_version_major_release, server_daily_details.server_version_major, server_daily_details.version, server_daily_details.edition]
  }

  join: server_fact {
    view_label: "Incident Management"
    sql_on: TRIM(${incident_response_events.user_id}) = TRIM(${server_fact.server_id}) ;;
    relationship: many_to_one
    fields: [server_fact.installation_id, server_fact.first_server_version, server_fact.first_server_version_major, server_fact.first_server_edition, server_fact.server_edition, server_fact.cloud_server, server_fact.max_registered_users]
  }

  join: excludable_servers {
    view_label: "Incident Management"
    sql_on: TRIM(${incident_response_events.user_id}) = TRIM(${excludable_servers.server_id}) ;;
    relationship: many_to_one
    fields: [excludable_servers.reason]
  }

  join: license_server_fact {
    sql_on: TRIM(${license_server_fact.server_id}) = TRIM(${incident_response_events.user_id}) AND ${incident_response_events.timestamp_date}::DATE BETWEEN ${license_server_fact.start_date} AND ${license_server_fact.license_retired_date} ;;
    relationship: many_to_one
  }

  join: license_current {
    from: license_server_fact
    view_label: "License Current"
    sql_on: TRIM(${license_current.server_id}) = TRIM(${incident_response_events.user_id}) AND ${license_current.current_customer} ;;
    relationship: many_to_one
    fields: []
  }

  join: version_release_dates {
    sql_on: ${incident_response_events.serverversion_major} = SPLIT_PART(${version_release_dates.version}, '.',1) || '.' || SPLIT_PART(${version_release_dates.version}, '.',2) ;;
    relationship: many_to_one
    fields: []
  }

  join: dates {
    view_label: "Monthly Active Dates"
    sql_on: ${incident_response_events.timestamp_date}::date <= ${dates.date_date}::date AND ${incident_response_events.timestamp_date}::date >= ${dates.date_date}::date - INTERVAL '30 DAYS' AND ${dates.date_date}::DATE <= CURRENT_DATE::DATE ;;
    relationship: many_to_many
    type: left_outer
  }
}

explore: plugin_events {
  label: "Plugin Telemetry"
  view_label: "Plugin Telemetry"
  group_label: "Integrations"
  description: "Contains all Plugin event telemetry recorded by servers on versions where plugin telemetry has been enabled (v. 5.27+)."
  extends: [person]

  join: server_daily_details {
    view_label: "Plugin Telemetry"
    sql_on: ${plugin_events.user_id} = ${server_daily_details.server_id} AND ${plugin_events.timestamp_date}_date} = ${server_daily_details.logging_date} ;;
    relationship: many_to_one
    type: left_outer
    fields: [server_daily_details.database_version, server_daily_details.database_version_major, server_daily_details.database_version_major_release, server_daily_details.server_version_major, server_daily_details.version, server_daily_details.edition]
  }

  join: server_fact {
    view_label: "Plugin Telemetry"
    sql_on: ${plugin_events.user_id} = ${server_fact.server_id} ;;
    relationship: many_to_one
    fields: [server_fact.installation_id, server_fact.first_server_version, server_fact.first_server_version_major, server_fact.first_server_edition, server_fact.cloud_server]
  }

  join: excludable_servers {
    view_label: "Plugin Telemetry"
    sql_on: ${plugin_events.user_id} = ${excludable_servers.server_id} ;;
    relationship: many_to_one
    fields: [excludable_servers.reason]
  }

  join: license_server_fact {
    sql_on: ${license_server_fact.server_id} = ${plugin_events.user_id} AND ${plugin_events.original_timestamp_date}::DATE BETWEEN ${license_server_fact.start_date} AND ${license_server_fact.license_retired_date} ;;
    relationship: many_to_one
    fields: [license_server_fact.customer_id, license_server_fact.customer_name, license_server_fact.edition, license_server_fact.license_email]
  }

  join: person {
    sql_on: ${person.email} = ${license_server_fact.license_email};;
    relationship: many_to_one
  }
}

explore: ADDRESSES {
  hidden: yes
  group_label: "BLApi"
  description: "Contains all billing and shipping addresses provided by Mattermost customers."
  label: "Addresses"
}

explore: CONTACT_US_REQUESTS {
  hidden: yes
  group_label: "BLApi"
  description: "Contains all contact us requests recieved by Mattermost users, customers, and interested parties."
  label: "Contact Us Requests"
}

explore: CREDIT_CARDS {
  hidden: yes
  group_label: "BLApi"
  description: "Contains all credit cards provided by Mattermost Customers."
  label: "Credit Cards"

  join: CUSTOMERS {
    sql_on: ${CUSTOMERS.stripe_id} = ${CREDIT_CARDS.stripe_id} ;;
    relationship: many_to_one
    view_label: "Customers (BLApi)"
  }

  join: SUBSCRIPTIONS {
    sql_on: ${CUSTOMERS.id} = ${SUBSCRIPTIONS.customer_id} ;;
    relationship: one_to_many
  }
}

explore: CUSTOMERS {
  group_label: "BLApi"
  description: "Contains all Mattermost customer records."
  label: "Customers (Blapi)"

  join: SUBSCRIPTIONS {
    view_label: "Subscriptions (BLApi)"
    sql_on: ${CUSTOMERS.id} = ${SUBSCRIPTIONS.customer_id} ;;
    relationship: one_to_many
  }

  join: subscriptions_stripe {
    from: subscriptions
    view_label: "Subscriptions (Stripe)"
    sql_on: ${SUBSCRIPTIONS.stripe_id} = ${subscriptions_stripe.id} ;;
    relationship: one_to_one
  }

  join: INVOICES {
    view_label: "Invoices (BLApi)"
    sql_on: ${INVOICES.subscription_id} = ${SUBSCRIPTIONS.id} ;;
    relationship: one_to_many
  }

  join: invoices_stripe {
    from: invoices
    sql_on: ${INVOICES.stripe_id} = ${invoices_stripe.id} ;;
    relationship: one_to_one
    view_label: "Invoices (Stripe)"
  }

  join: CREDIT_CARDS {
    view_label: "Credit Cards (BLApi)"
    sql_on: ${CUSTOMERS.stripe_id} = ${CREDIT_CARDS.stripe_id} ;;
    relationship: one_to_many
  }

  join: PAYMENT_METHODS {
    view_label: "Payment Methods (BLApi)"
    sql_on: ${PAYMENT_METHODS.customer_id} = ${CUSTOMERS.id} ;;
    relationship: one_to_many
  }

  join: ADDRESSES {
    view_label: "Addresses (Billing)"
    sql_on: ${ADDRESSES.customer_id} = ${CUSTOMERS.id} AND ${ADDRESSES.id} = ${PAYMENT_METHODS.address_id} AND ${ADDRESSES.address_type} = 'billing' ;;
    relationship: one_to_one
  }

  join: company_addresses {
    from: ADDRESSES
    view_label: "Addresses (Company)"
    sql_on: ${ADDRESSES.customer_id} = ${CUSTOMERS.id} AND ${ADDRESSES.address_type} = 'company' ;;
    relationship: one_to_one
  }

  join: CONTACT_US_REQUESTS {
    sql_on: ${CUSTOMERS.id} = ${CONTACT_US_REQUESTS.customer_id} ;;
    relationship: one_to_many
  }

  join: USAGE_EVENTS {
    sql_on: ${INVOICES.subscription_id} = ${USAGE_EVENTS.subscription_id} AND ${USAGE_EVENTS.timestamp_date} between ${INVOICES.invoice_start_date} AND ${INVOICES.invoice_end_date} ;;
    relationship: many_to_one
  }

  join: customers_stripe {
    from: customers
    view_label: "Customer (Stripe)"
    sql_on: ${CUSTOMERS.stripe_id} = ${customers_stripe.id} ;;
    relationship: one_to_one
  }

  join: PAYMENTS {
    view_label: "Payments (BLApi)"
    sql_on: ${PAYMENTS.id} = ${PURCHASE_FACT.payment_id} ;;
    relationship: one_to_one
  }

  join: PURCHASE_FACT {
    view_label: "Purchase Fact (Blapi)"
    sql_on: ${PURCHASE_FACT.invoice_stripe_id} = ${invoices_stripe.id} ;;
    relationship: one_to_one
  }


  join: server_fact {
    sql_on: ${subscriptions_stripe.cws_installation} = ${server_fact.installation_id} ;;
    relationship: one_to_one
    view_label: "Stripe Customer Server Details"
    fields: [server_fact.active_users, server_fact.monthly_active_users, server_fact.direct_message_channels, server_fact.public_channels, server_fact.private_channels, server_fact.slash_commands, server_fact.teams, server_fact.bot_posts_previous_day, server_fact.posts_previous_day, server_fact.bot_accounts, server_fact.guest_accounts, server_fact.incoming_webhooks, server_fact.outgoing_webhooks, server_fact.first_active_date, server_fact.first_active_month, server_fact.first_active_week, server_fact.first_active_year, server_fact.last_active_date, server_fact.last_active_month, server_fact.last_active_week, server_fact.last_active_year, server_fact.max_registered_users, server_fact.max_registered_deactivated_users, server_fact.max_posts]
  }

  join: person {
    view_label: "Person"
    sql_on: ${person.email} = ${CUSTOMERS.email};;
    relationship: one_to_one
  }

  join: person_owner {
    from: user
    sql_on: ${person.object_ownerid} = ${person_owner.sfid} ;;
    fields: []
    relationship: many_to_one
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


explore: FEATURES {
  hidden: yes
  group_label: "BLApi"
  description: "Contains a list of features provided by varioius Mattermost SKU's."
  label: "Features"
}

explore: INVOICES {
  group_label: "BLApi"
  description: "Contains all invoices for Mattermost Cloud customers."
  label: "Invoices (BLApi)"

  join: SUBSCRIPTIONS {
    sql_on: ${SUBSCRIPTIONS.id} = ${INVOICES.subscription_id} ;;
    relationship: many_to_one
    view_label: "Subscriptions (BLApi)"
  }

  join: CUSTOMERS {
    sql_on: ${CUSTOMERS.id} = ${SUBSCRIPTIONS.customer_id} ;;
    relationship: many_to_one
    view_label: "Customers (BLApi)"
  }

  join: invoices_blapi {
    from: invoices
    sql_on: ${INVOICES.stripe_id} = ${invoices_blapi.id} ;;
    relationship: one_to_one
    view_label: "Invoices (Stripe)"
  }

  join: PAYMENTS {
    view_label: "Payments (BLApi)"
    sql_on: ${PAYMENTS.id} = ${PURCHASE_FACT.payment_id} ;;
    relationship: one_to_one
  }

  join: PURCHASE_FACT {
    view_label: "Purchase Fact (Blapi)"
    sql_on: ${PURCHASE_FACT.invoice_stripe_id} = ${invoices_blapi.id} ;;
    relationship: one_to_one
  }
}

explore: PAYMENTS {
  hidden: yes
  group_label: "BLApi"
  description: "Contains all future, received and currently processing payments from Mattermost customers."
  label: "Payments"

  join: charges {
    view_label: "Charges (Stripe)"
    sql_on: ${PAYMENTS.stripe_charge_id} = ${charges.id} ;;
    relationship: one_to_one
  }

  join: customers {
    view_label: "Charges (Stripe)"
    sql_on: ${charges.customer} = ${customers.id} ;;
    relationship: many_to_one
    fields: []
  }
}

explore: PAYMENT_METHODS {
  hidden: yes
  group_label: "BLApi"
  description: "Contains all identifying information for all payment methods provided by customers."
  label: "Payment Methods"

  join: CUSTOMERS {
    sql_on: ${CUSTOMERS.id} = ${PAYMENT_METHODS.customer_id} ;;
    relationship: many_to_one
  }

  join: SUBSCRIPTIONS {
    sql_on: ${CUSTOMERS.id} = ${SUBSCRIPTIONS.customer_id} ;;
    relationship: one_to_many
  }

  join: ADDRESSES {
    sql_on: ${PAYMENT_METHODS.address_id} = ${ADDRESSES.id} AND ${ADDRESSES.customer_id} = ${CUSTOMERS.id} ;;
    relationship: one_to_many
  }
}

explore: PURCHASE_FACT {
  group_label: "BLApi"
  description: "Contains all customers and key identifiers/most recent customer attributes."
  label: "Purchase Fact"
  hidden: yes
}

explore: SUBSCRIPTIONS {
  hidden: yes
  group_label: "BLApi"
  description: "Contains all subscriptions for Mattermost customers."
  label: "Subscriptions (BLApi)"

  join: CUSTOMERS {
    sql_on: ${CUSTOMERS.id} = ${SUBSCRIPTIONS.customer_id} ;;
    relationship: many_to_one
    view_label: "Customers (BLApi)"
  }

  join: INVOICES {
    view_label: "Invoices (BLApi)"
    sql_on: ${INVOICES.subscription_id} = ${SUBSCRIPTIONS.id} ;;
    relationship: one_to_many
  }

  join: invoices_stripe {
    from: invoices
    sql_on: ${INVOICES.stripe_id} = ${invoices_stripe.id} ;;
    relationship: one_to_one
  }

  join: PAYMENTS {
    view_label: "Payments (BLApi)"
    sql_on: ${PAYMENTS.id} = ${PURCHASE_FACT.payment_id} ;;
    relationship: one_to_one
  }

  join: PURCHASE_FACT {
    view_label: "Purchase Fact (Blapi)"
    sql_on: ${PURCHASE_FACT.invoice_stripe_id} = ${invoices_stripe.id} ;;
    relationship: one_to_one
  }

  join: subscriptions_stripe {
    from: subscriptions
    view_label: "Subscriptions (Stripe)"
    sql_on: ${SUBSCRIPTIONS.stripe_id} = ${subscriptions_stripe.id} ;;
    relationship: one_to_one
  }
}

explore: USAGE_EVENTS {
  group_label: "BLApi"
  label: "Usage Events"
  description: "Daily snapshot of registered users associated with each cloud installation, as well as incremental snapshots for deltas (changes) throughout the day. Supports invoicing."
  hidden: yes

  join: SUBSCRIPTIONS {
    sql_on: ${USAGE_EVENTS.subscription_id} = ${SUBSCRIPTIONS.id} ;;
    relationship: many_to_one
  }

  join: CUSTOMERS {
    sql_on: ${SUBSCRIPTIONS.customer_id} = ${CUSTOMERS.id} ;;
    relationship: many_to_one
  }

  join: INVOICES {
    sql_on: ${INVOICES.subscription_id} = ${USAGE_EVENTS.subscription_id} AND ${USAGE_EVENTS.timestamp_date} between ${INVOICES.invoice_start_date} AND ${INVOICES.invoice_end_date} ;;
    relationship: many_to_one
  }

  join: invoices_stripe {
    from: invoices
    sql_on: ${INVOICES.stripe_id} = ${invoices_stripe.id} ;;
    relationship: one_to_one
  }

  join: PAYMENTS {
    view_label: "Payments (BLApi)"
    sql_on: ${PAYMENTS.id} = ${PURCHASE_FACT.payment_id} ;;
    relationship: one_to_one
  }

  join: PURCHASE_FACT {
    view_label: "Purchase Fact (Blapi)"
    sql_on: ${PURCHASE_FACT.invoice_stripe_id} = ${invoices_stripe.id} ;;
    relationship: one_to_one
  }

  join: CREDIT_CARDS {
    view_label: "Credit Cards (BLApi)"
    sql_on: ${CUSTOMERS.stripe_id} = ${CREDIT_CARDS.stripe_id} ;;
    relationship: one_to_many
  }

  join: PAYMENT_METHODS {
    view_label: "Payment Methods (BLApi)"
    sql_on: ${PAYMENT_METHODS.customer_id} = ${CUSTOMERS.id} ;;
    relationship: one_to_many
  }

  join: ADDRESSES {
    view_label: "Address (Billing)"
    sql_on: ${ADDRESSES.customer_id} = ${CUSTOMERS.id} AND ${ADDRESSES.id} = ${PAYMENT_METHODS.address_id} AND ${ADDRESSES.address_type} = 'billing' ;;
    relationship: one_to_one
  }

  join: company_addresses {
    from: ADDRESSES
    view_label: "Address (Company)"
    sql_on: ${ADDRESSES.customer_id} = ${CUSTOMERS.id} AND ${ADDRESSES.address_type} = 'company' ;;
    relationship: one_to_one
  }
}

explore: cloud_onboarding_flows {
  label: "Cloud Onboarding Flows"
  hidden: yes
}

explore: incident_response_telemetry {
  label: "Incident Management Telemetry"
  group_label: "Quality Assurance"
}

explore: cloud_clearbit {
  label: "Cloud Clearbit"
  hidden: yes

  join: license_server_fact {
    sql_on: ${cloud_clearbit.server_id} = ${license_server_fact.server_id} AND ${license_server_fact.edition} = 'Mattermost Cloud' ;;
    relationship: one_to_one
    fields: []
  }
}

explore: hacktoberboard_dev {
  label: "Hacktoberboard Dev"
  group_label: "Experimental"
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

explore: telemetry_columns {
  label: "Telemetry Columns"

  join: telemetry_tables {
    type: left_outer
    relationship: many_to_one
    sql_on: ${telemetry_columns.table} = ${telemetry_tables.table} AND ${telemetry_columns.date_added_date}::date = ${telemetry_tables.snapshot_date}::date ;;
    fields: []
  }
}
explore: telemetry_tables {
  label: "Telemetry Tables"
}

explore: daily_server_user_agent_events {
  label: "Daily Server User Agent Events"
  group_label: " User Agent Analysis"

  join: server_daily_details {
    type: left_outer
    view_label: "Server Details"
    relationship: many_to_one
    sql_on: ${daily_server_user_agent_events.logging_date} = ${server_daily_details.logging_date} AND ${server_daily_details.server_id} = ${daily_server_user_agent_events.server_id} ;;
    fields: [server_daily_details.database_version, server_daily_details.database_version_major, server_daily_details.server_version_major, server_daily_details.version, server_daily_details.edition, server_daily_details.edition2]
  }

  join: excludable_servers {
    view_label: "Daily Server User Agent Events"
    relationship: many_to_one
    type: left_outer
    sql_on: ${excludable_servers.server_id} = ${daily_server_user_agent_events.server_id} ;;
    fields: [excludable_servers.reason]
  }

  join: server_fact {
    relationship: many_to_one
    view_label: "Server Details"
    type: left_outer
    sql_on: ${server_fact.server_id} = ${daily_server_user_agent_events.server_id} ;;
    fields: [server_fact.cloud_server, server_fact.first_server_edition, server_fact.first_server_version, server_fact.first_server_version_major]
  }

  join: license_server_fact {
    type: left_outer
    relationship: many_to_one
    view_label: "License & Customer Details"
    sql_on: (${license_server_fact.server_id} = ${server_daily_details.server_id}) and (${server_daily_details.logging_date} BETWEEN ${license_server_fact.start_date} AND ${license_server_fact.license_retired_date});;
    fields: [license_server_fact.customer_name, license_server_fact.license_email, license_server_fact.customer_id, license_server_fact.users]
  }


}
