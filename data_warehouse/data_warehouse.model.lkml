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

include: "/data_warehouse/data_warehouse_views/blp/*.view.lkml"
include: "/data_warehouse/data_warehouse_views/cs/*.view.lkml"
include: "/data_warehouse/data_warehouse_views/employee/*.view.lkml"
include: "/data_warehouse/data_warehouse_views/events/*.view.lkml"
include: "/data_warehouse/data_warehouse_views/finance/*.view.lkml"
include: "/data_warehouse/data_warehouse_views/ga/*.view.lkml"
include: "/data_warehouse/data_warehouse_views/mattermost/*.view.lkml"
include: "/data_warehouse/data_warehouse_views/orgm/*.view.lkml"
include: "/data_warehouse/data_warehouse_views/sales/*.view.lkml"
include: "/data_warehouse/data_warehouse_views/tva/*.view.lkml"
include: "/data_warehouse/data_warehouse_views/util/*.view.lkml"
include: "/data_warehouse/data_warehouse_views/bizops/*.view.lkml"
include: "/data_warehouse/data_warehouse_views/web/*.view.lkml"
include: "/data_warehouse/data_warehouse_tests/*.lkml"

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

  join: opportunity_csa {
    view_label: "Opportunity CSA"
    from: user
    sql_on: ${opportunity.csa_owner_id} = ${opportunity_csa.sfid} ;;
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
  }

  join: opportunitylineitem {
    sql_on: ${opportunity.sfid} = ${opportunitylineitem.opportunityid};;
    relationship: one_to_many
    fields: [opportunitylineitem.opportunitylineitem_core*]
  }

  join: product2 {
    sql_on: ${opportunitylineitem.product2id} = ${product2.sfid} ;;
    relationship: many_to_one
    fields: []
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

  join: opportunity_csa {
    view_label: "Opportunity CSA"
    from: user
    sql_on: ${opportunity.csa_owner_id} = ${opportunity_csa.sfid} ;;
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

  join: account_industry_mapping {
    sql_on: ${account.industry} = ${account_industry_mapping.industry} ;;
    relationship: many_to_one
    fields: []
  }
}

explore: opportunity_snapshot {
  group_label: "Salesforce"

  join: opportunity {
    sql_on: ${opportunity_snapshot.opportunityid} = ${opportunity.sfid} ;;
    relationship: many_to_one
    fields: []
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
    fields: [count_open_oppt_current_fy,isclosed,iswon,close_current_fy,opportunity.close_date,opportunity.stagename,sfid,name]
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
    fields: [total_bookings_open_curr_fy,total_bookings_curr_fy,total_new_amount,total_ren_amount,total_exp_amount,opportunitylineitem.product_line_type,is_loe]
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

explore: commit_ww {
  label: "Commits (WW)"
  group_label: "Target vs Actual"
}

explore: commit_segment {
  label: "Commits (Segment)"
  group_label: "Target vs Actual"
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
  }

  join: account {
    sql_on: coalesce(${contact.accountid},${lead.existing_account__c}) = ${account.sfid} ;;
    relationship: many_to_one
  }

  join: opportunity {
    sql_on: ${lead.convertedopportunityid} = ${opportunity.sfid} ;;
    relationship: one_to_one
  }

  join: opportunity_ext {
    view_label: "Opportunity"
    sql_on: ${opportunity.sfid} = ${opportunity_ext.opportunityid} ;;
    relationship: one_to_one
  }
}

explore: contributor_map_data {
  group_label: "Contributors"
}

explore: daily_traffic {
  group_label: "Google Analytics"
  label: "Daily Traffic"
}

explore: daily_page_visits {
  group_label: "Google Analytics"
  label: "Daily Page Visits"
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
    account.account_core*,
    opportunity.opportunity_core*
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
    account.account_core*,
    account.arr_current,
    opportunity.opportunity_core*
  ]
}

explore: campaign {
  group_label: "Salesforce"
  extends: [_base_account_explore]

  join: campaignmember {
    sql_on: ${campaign.sfid} = ${campaignmember.campaignid} ;;
    relationship: one_to_many
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

  join: contact {
    sql_on: ${campaignmember.contactid}= ${contact.sfid} ;;
    relationship: many_to_one
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
}

explore: github_all_contributions {
  group_label: "Contributors & Employees"
  label: "All Mattermost Org GitHub Contributions"
  view_label: "All Mattermost Org GitHub Contributions"

  join: github_all_contributors {
    sql_on: ${github_all_contributions.author} = ${github_all_contributors.author} ;;
    relationship: many_to_one
    fields: []
  }

  join: staff_github_usernames {
    sql_on: ${github_all_contributions.author} = ${staff_github_usernames.username} ;;
    relationship: many_to_one
    fields: []
  }

  join: github_repo_categorization {
    view_label: "All Mattermost Org GitHub Contributions"
    sql_on: ${github_repo_categorization.repo} = ${github_all_contributions.repo} ;;
    relationship: many_to_one
    fields: [category]
  }
}

explore: scrub_segment {
  group_label: "Target vs Actual"
}

explore: scrub_ww {
  group_label: "Target vs Actual"
  label: "Scrub WW"
  view_label: "Scrub WW"
}

explore: server_daily_details {
  group_label: "Product"
  label: " Server Daily Details"
  description: "Contains a daily snapshot of each non-test/dev server's state. Use this to trend server counts, TEDAS/TEDAU, and age over time. Includes server version, ip, active users, registered users, operating system, Salesforce Account ID, database type, etc."
  extends: [_base_account_core_explore]

  join: account {
    sql_on: ${server_daily_details.account_sfid} = ${account.sfid} ;;
    relationship: many_to_one
    type: left_outer
    fields: [account.account_core*]
  }

  join: server_fact {
    view_label: " Server Daily Details"
    sql_on: ${server_daily_details.server_id} = ${server_fact.server_id} ;;
    relationship: many_to_one
    type: inner
    fields: [server_fact.license_id, server_fact.first_trial_license_date, server_fact.first_trial_license_month, server_fact.first_trial_license_year, server_fact.first_trial_license_week, server_fact.first_server_version, server_fact.first_server_version_major, server_fact.last_active_date, server_fact.last_active_week, server_fact.last_active_month,
      server_fact.last_active_year, server_fact.last_active_fiscal_quarter, server_fact.last_active_fiscal_year,
      server_fact.first_active_date, server_fact.first_active_week, server_fact.first_active_year, server_fact.first_active_fiscal_quarter, server_fact.first_active_fiscal_year, server_fact.first_active_month,
      server_fact.first_paid_license_date, server_fact.first_paid_license_week, server_fact.first_paid_license_month, server_fact.first_paid_license_year, server_fact.first_paid_license_fiscal_quarter, server_fact.first_paid_license_fiscal_year,
      server_fact.has_admin_events, server_fact.has_invite_events, server_fact.has_post_events, server_fact.has_signup_email_events, server_fact.has_signup_events, server_fact.has_tutorial_events]
  }

  join: nps_server_daily_score {
    view_label: "Server NPS"
    sql_on: ${nps_server_daily_score.server_id} = ${server_daily_details.server_id}
      AND ${nps_server_daily_score.date_date}::DATE = DATE_TRUNC('day', ${server_daily_details.logging_date}::DATE);;
    relationship: one_to_one
    type: left_outer
    fields: [nps_server_daily_score.nps_server_core*]
  }

  join: server_upgrades {
    view_label: " Server Daily Details"
    sql_on: ${server_upgrades.server_id} = ${server_daily_details.server_id}
      AND ${server_upgrades.logging_date} = ${server_daily_details.logging_date};;
    relationship: one_to_one
    fields: [server_upgrades.prev_version, server_upgrades.server_edition_upgrades, server_upgrades.server_version_upgrades, server_upgrades.is_version_upgrade_date, server_upgrades.is_edition_upgrade_date]
  }

  join: licenses {
    view_label: "License Details (Hist)"
    sql_on: ${licenses.server_id} = ${server_daily_details.server_id}
    AND ${licenses.logging_date} = ${server_daily_details.logging_date}
    AND ${licenses.license_id} = ${server_daily_details.license_id} ;;
    relationship: one_to_one
#     fields: [licenses.company, licenses.trial, licenses.expire_date, licenses.expire_month, licenses.expire_week, licenses.expire_year,licenses.issued_date, licenses.issued_week,
#       licenses.issued_month, licenses.issued_year, licenses.start_date, licenses.start_month, licenses.start_week, licenses.start_year, licenses.edition, licenses.timestamp_date]
  }

  join: licenses_grouped {
    view_label: "License Details (Current)"
    sql_on: ${licenses_grouped.license_id} = ${server_daily_details.license_id2} AND ${licenses_grouped.server_id} = ${server_daily_details.server_id} ;;
    relationship: one_to_one
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
    fields: []
  }

  join: version_release_dates {
    view_label: " Server Daily Details"
    sql_on: ${server_daily_details.server_version_major} = LEFT(${version_release_dates.version},4) ;;
    relationship: many_to_one
    fields: [version_release_dates.supported]
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

  join: licenses_grouped {
    view_label: "Server Fact"
    sql_on: ${licenses_grouped.license_id} = ${server_fact.license_id}
    AND ${licenses_grouped.server_id} = ${server_fact.server_id};;
    relationship: one_to_one
    fields: [licenses_grouped.company, licenses_grouped.trial]
  }

  join: excludable_servers {
    view_label: "Server Fact"
    sql_on: ${excludable_servers.server_id} = ${server_fact.server_id} ;;
    relationship: one_to_one
    fields: [excludable_servers.reason]
  }

  join: version_release_dates {
    view_label: "Server Fact"
    sql_on: ${server_fact.server_version_major} = LEFT(${version_release_dates.version},4) ;;
    relationship: many_to_one
    fields: [version_release_dates.supported]
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

  join: zendesk_ticket_details {
    sql_on: ${account.sfid} = ${zendesk_ticket_details.account_sfid} AND ${zendesk_ticket_details.status} <> 'deleted' AND ${zendesk_ticket_details.tags} NOT LIKE '%closed_by_merge%';;
    relationship: one_to_many
    fields: [-solved_at_on_date,-created_on_date,-count_tickets_solved_on_date,-count_tickets_created_date]
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

explore: nps_user_monthly_score {
  group_label: "Product"
  label: "NPS User Daily Score"
  description: "Contains NPS Score data per user per day for all users that have submitted an NPS survey (Updated every 30 minutes for new submissions). Can be used to trend NPS by date by server version, server age, user role, user age, etc.."
  extends: [_base_account_core_explore]
  always_filter: {
    filters: [21days_since_release: "yes"]
  }

  join: licenses_grouped {
    sql_on: ${nps_user_monthly_score.license_id}  = ${licenses_grouped.license_id}
      AND ${nps_user_monthly_score.server_id} = ${licenses_grouped.server_id};;
    relationship: many_to_one
    fields: []
  }

  join: account {
    sql_on: ${licenses_grouped.account_sfid} = ${account.sfid} ;;
    fields: [account.account_core*]
    relationship: many_to_one
  }

  join: server_fact {
    sql_on: ${nps_user_monthly_score.server_id} = ${server_fact.server_id};;
    relationship: many_to_one
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
}

explore: server_daily_details_ext {
  group_label: "Product"
  label: " Server Daily Details Ext"
  description: "An extension of 'Server Daily Details' explore that includes all server configuration and activity data. Can be used to report the volume of servers by day with various configuration settings activated, activity thresholds reached, or age milestones attained."
  extends: [_base_account_core_explore]


  join: account {
    sql_on: ${server_daily_details_ext.account_sfid} = ${account.sfid} ;;
    fields: [account.account_core*]
  }

  join: licenses {
    view_label: "License Details (Hist)"
    sql_on: ${licenses.server_id} = ${server_daily_details_ext.server_id}
          AND ${licenses.logging_date} = ${server_daily_details_ext.logging_date}
          AND ${licenses.license_id} = ${server_daily_details_ext.license_id} ;;
    relationship: one_to_one
#     fields: [licenses.company, licenses.trial, licenses.expire_date, licenses.expire_month, licenses.expire_week, licenses.expire_year,licenses.issued_date, licenses.issued_week,
#       licenses.issued_month, licenses.issued_year, licenses.start_date, licenses.start_month, licenses.start_week, licenses.start_year, licenses.edition, licenses.timestamp_date]
  }

  join: licenses_grouped {
    view_label: "License Details (Current)"
    sql_on: ${licenses_grouped.license_id} = ${server_daily_details_ext.license_id3} and ${licenses_grouped.server_id} = ${server_daily_details_ext.server_id} ;;
    relationship: one_to_one
#     fields: [licenses_grouped.license_id, licenses_grouped.company, licenses_grouped.trial, licenses_grouped.expire_date, licenses_grouped.expire_month, licenses_grouped.expire_week, licenses_grouped.expire_year,licenses_grouped.issued_date, licenses_grouped.issued_week,
#       licenses_grouped.issued_month, licenses_grouped.issued_year, licenses_grouped.start_date, licenses_grouped.start_month, licenses_grouped.start_week, licenses_grouped.start_year, licenses_grouped.edition, licenses_grouped.timestamp_date]
  }

  join: server_fact {
    view_label: " Server Daily Details Ext"
    sql_on: ${server_daily_details_ext.server_id} = ${server_fact.server_id} ;;
    relationship: many_to_one
    fields: [server_fact.license_id, server_fact.first_trial_license_date, server_fact.first_trial_license_month, server_fact.first_trial_license_year, server_fact.first_trial_license_week, server_fact.first_server_version, server_fact.first_server_version_major, server_fact.last_active_date, server_fact.last_active_week, server_fact.last_active_month,
      server_fact.last_active_year, server_fact.last_active_fiscal_quarter, server_fact.last_active_fiscal_year,
      server_fact.first_active_date, server_fact.first_active_week, server_fact.first_active_year, server_fact.first_active_fiscal_quarter, server_fact.first_active_fiscal_year, server_fact.first_active_month,
      server_fact.first_paid_license_date, server_fact.first_paid_license_week, server_fact.first_paid_license_month, server_fact.first_paid_license_year, server_fact.first_paid_license_fiscal_quarter, server_fact.first_paid_license_fiscal_year,
      server_fact.has_admin_events, server_fact.has_invite_events, server_fact.has_post_events, server_fact.has_signup_email_events, server_fact.has_signup_events, server_fact.has_tutorial_events]
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
    view_label: "Server Daily Details Ext"
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
    sql_on: ${server_daily_details_ext.server_version_major} = LEFT(${version_release_dates.version},4) ;;
    relationship: many_to_one
    fields: [version_release_dates.supported]
  }
}

explore: financial_statements {
  sql_always_where: CONTAINS({{ _user_attributes['data_permissions']}},'finance');;
  group_label: "Finance"
  label: "Monthly Financial Statements"
}

explore: target_fact {
  group_label: "Target vs Actual"
  label: "Target Definitions"
}

explore: tva_all_by_mo {
  sql_always_where: CONTAINS({{ _user_attributes['data_permissions']}},${target_fact.visibility}) ;;
  group_label: "Target vs Actual"
  label: "Monthly TvA"

  join: target_fact {
    view_label: "TvA by Month"
    sql_on: CONTAINS(${tva_all_by_mo.target_slug},${target_fact.slug}) ;;
    relationship: many_to_one
  }

  join: user {
    sql_on: ${user.employeenumber} = REPLACE(${tva_all_by_mo.target_slug},'attain_new_and_exp_by_rep_by_mo_') ;;
    relationship: many_to_one
    fields: []
  }
}

explore: tva_all_by_qtr {
  sql_always_where: CONTAINS({{ _user_attributes['data_permissions']}},${target_fact.visibility}) ;;
  group_label: "Target vs Actual"
  label: "Quarterly TvA"

  join: target_fact {
    view_label: "TvA by Quarter"
    sql_on: CONTAINS(${tva_all_by_qtr.target_slug},${target_fact.slug}) ;;
    relationship: many_to_one
  }

  join: user {
    sql_on: ${user.employeenumber} = REPLACE(${tva_all_by_qtr.target_slug},'attain_new_and_exp_by_rep_by_qtr_') ;;
    relationship: many_to_one
    fields: []
  }
}

explore: tva_all_by_fy {
  sql_always_where: CONTAINS({{ _user_attributes['data_permissions']}},${target_fact.visibility}) ;;
  group_label: "Target vs Actual"
  label: "TvA by Fiscal Year"

  join: target_fact {
    view_label: "Fiscal TvA"
    sql_on: CONTAINS(${tva_all_by_fy.target_slug},${target_fact.slug});;
    relationship: many_to_one
  }

  join: user {
    sql_on: ${user.employeenumber} = REPLACE(${tva_all_by_fy.target_slug},'attain_new_and_exp_by_rep_by_fy_') ;;
    relationship: many_to_one
    fields: []
  }
}

explore: events_registry {
  label: "Events Registry"
  group_label: "Product"
  description: "Contains the name and details of all user events currently, and historically, captured on the Mattermost platform. Including the first and most recent date the event was logged."
}

explore: user_events_by_date {
  extends: [_base_account_core_explore]
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

  join: licenses {
    view_label: "Server Details"
    sql_on: ${licenses.server_id} = ${server_daily_details.server_id}
          AND ${licenses.logging_date} = ${server_daily_details.logging_date}
          AND ${licenses.license_id} = ${server_daily_details.license_id} ;;
    relationship: one_to_one
    fields: []
  }

  join: account {
    sql: ${licenses.account_sfid} = ${account.sfid} ;;
  }

  join: server_fact {
    view_label: "Server Details"
    sql_on: ${server_fact.server_id} = ${user_events_by_date.server_id} ;;
    relationship: many_to_one
    fields: [server_fact.gitlab_install, server_fact.first_active_date, server_fact.first_active_week, server_fact.first_active_month, server_fact.first_active_year, server_fact.first_active_fiscal_quarter, server_fact.first_active_fiscal_year, server_fact.license_id, server_fact.account_sfid, server_fact.first_server_version, server_fact.first_server_version_major, server_fact.first_server_edition]
  }

  join: licenses_grouped {
    view_label: "Server Details"
    sql_on: ${server_fact.server_id} = ${licenses_grouped.server_id}
      AND ${server_fact.license_id} = ${licenses_grouped.license_id};;
    fields: [licenses_grouped.company, licenses_grouped.trial]
    relationship: one_to_many
  }

  join: events_registry {
    view_label: " User Events By Date"
    sql_on: ${events_registry.event_name} = ${user_events_by_date.event_name} ;;
    relationship: many_to_one
    fields: [events_registry.event_category]
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
    fields: [user_agent_registry.device_type, user_agent_registry.device_model, user_agent_registry.device_brand]
  }

  join: excludable_servers {
    view_label: "Server Details"
    sql_on: ${user_events_by_date.server_id} =  ${excludable_servers.server_id};;
    relationship: many_to_one
    fields: [excludable_servers.reason]
  }
}

explore: user_events_by_date_agg {
  extends: [_base_account_core_explore]
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

  join: licenses {
    view_label: "Server Details"
    sql_on: ${licenses.server_id} = ${server_daily_details.server_id}
          AND ${licenses.logging_date} = ${server_daily_details.logging_date}
          AND ${licenses.license_id} = ${server_daily_details.license_id} ;;
    relationship: one_to_one
    fields: []
  }

  join: account {
    sql: ${licenses.account_sfid} = ${account.sfid} ;;
  }

  join: server_fact {
    view_label: "Server Details"
    sql_on: ${server_fact.server_id} = ${user_events_by_date_agg.server_id} ;;
    relationship: many_to_one
    fields: [server_fact.gitlab_install, server_fact.first_active_date, server_fact.first_active_week, server_fact.first_active_month, server_fact.first_active_year, server_fact.first_active_fiscal_quarter, server_fact.first_active_fiscal_year, server_fact.license_id, server_fact.account_sfid, server_fact.first_server_version, server_fact.first_server_version_major, server_fact.first_server_edition]
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

  join: licenses_grouped {
    view_label: "Server Details"
    sql_on: ${server_fact.server_id} = ${licenses_grouped.server_id}
    AND ${server_fact.license_id} = ${licenses_grouped.license_id};;
    fields: [licenses_grouped.company, licenses_grouped.trial]
    relationship: many_to_one
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

explore: account_renewal_rate_by_qtr {
#   hidden: yes
  group_label: "Customer Success"
  extends: [_base_account_core_explore]

  join: account {
    sql_on: ${account.sfid} = ${account_renewal_rate_by_qtr.account_sfid} ;;
  }
}


explore: server_upgrades {
  label: "Server Upgrades"
  description: "Use this to trend the number of server upgrades by version or edition over time."
  group_label: "Product"
  extends: [_base_account_core_explore]
  hidden: no

  join: account {
    sql_on: ${server_upgrades.account_sfid} = ${account.sfid} ;;
    relationship: many_to_one
    fields: [account.account_core*]
  }

  join: licenses {
    sql_on: ${server_upgrades.license_id} = ${licenses.license_id}
    AND ${server_upgrades.logging_date} = ${licenses.logging_date}
    AND ${licenses.server_id} = ${server_upgrades.server_id} ;;
    relationship: many_to_one
    fields: []
  }

  join: server_fact {
    view_label: "License Details (Current)"
    sql_on: ${server_fact.server_id} = ${server_upgrades.server_id} ;;
    relationship: many_to_one
    fields: [server_fact.license_id]
  }

  join: licenses_grouped {
    view_label: "License Details (Current)"
    sql_on: ${server_fact.server_id} = ${licenses_grouped.server_id}
      AND ${server_fact.license_id} = ${licenses.license_id};;
    relationship: one_to_one
    fields: [licenses_grouped.company, licenses_grouped.trial]
  }
}

explore: nps_server_daily_score {
  label: "Nps Server Daily Score"
  group_label: "Product"
  description: "Use this explore to trend NPS at the daily server level to track how a servers NPS changes over time."
  hidden: yes
}

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
  extends: [_base_account_core_explore]
  always_filter: {
    filters: [21days_since_release: "yes"]
  }

  join: licenses_grouped {
    sql_on: ${nps_server_version_daily_score.license_id}  = ${licenses_grouped.license_id}
      AND ${nps_server_version_daily_score.server_id} = ${licenses_grouped.server_id};;
    relationship: many_to_one
    fields: []
  }

  join: account {
    sql_on: ${licenses_grouped.account_sfid} = ${account.sfid} ;;
    fields: [account.account_core*]
    relationship: many_to_one
  }

  join: server_fact {
    sql_on: ${nps_server_version_daily_score.server_id} = ${server_fact.server_id};;
    relationship: many_to_one
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
}

explore: licenses_grouped {
  label: "Licenses (Server Level)"
  group_label: "BLP"
  hidden: yes
}

explore: licenses_only {
  label: "Licenses"
  group_label: "BLP"
  hidden: no
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
  extends: [_base_account_explore]
  group_label: "BLP"
  join: account {
    sql_on: ${account.sfid} = ${enterprise_license_fact.account_sfid} ;;
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
  join: stripe_customers {
    sql_on: ${stripe_customers.id} = ${stripe_charges.customer} ;;
    relationship: many_to_one
    fields: []
  }
}

explore: stripe_charges_data_check {
  extends: [_base_opportunity_core_explore]
  from: stripe_charges
  view_name: stripe_charges
  label: "Stripe Charges to Opportunity"
  group_label: "zBizOps"
  join: stripe_customers {
    sql_on: ${stripe_customers.id} = ${stripe_charges.customer} ;;
    relationship: many_to_one
    fields: []
  }

  join: opportunity {
    sql_on: (${opportunity.stripe_id} = ${stripe_charges.id} OR ${opportunity.stripe_id} = ${stripe_charges.payment_intent})
            AND ${opportunity.iswon};;
    relationship: one_to_one
  }
}


explore: stripe_payouts {
  group_label: "Finance"
}


explore: available_renewals_dynamic {
  hidden: yes
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
    fields: [sfid, name, total_amount, status_wlo, count]
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
    fields: [sfid, total_arr,  total_new_amount, total_ren_amount, total_exp_only_amount, total_coterm_amount, total_loe_amount, total_multi_amount, end_date]
  }

  join: renewal_opportunity {
    from: opportunity
    sql_on: ${opportunity.renewed_by_opportunity_id} = ${renewal_opportunity.sfid};;
    relationship: many_to_one
    fields: [sfid, name, total_amount, close_date, close_fiscal_year, status_wlo, count]
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
    fields: [sfid, total_arr, total_new_amount, total_ren_amount, total_exp_only_amount, total_coterm_amount, total_loe_amount, total_multi_amount]
  }
}
