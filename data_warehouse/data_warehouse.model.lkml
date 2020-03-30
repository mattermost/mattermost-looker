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

access_grant: full_financial {
  user_attribute: full_financial
  allowed_values: [ "yes" ]
}

access_grant: mlt_only {
  user_attribute: is_group_mlt
  allowed_values: [ "yes" ]
}

#
# Formats
#

# BP: Define your own global named value formats to make changing defaults easy
named_value_format: mm_usd_short {
  value_format: "$###,###"
}

named_value_format: mm_integer_percent {
  value_format: "0\%"
}



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
include: "/data_warehouse/data_warehouse_views/tva/*.view.lkml"
include: "/data_warehouse/data_warehouse_views/util/*.view.lkml"
include: "/data_warehouse/data_warehouse_views/bizops/*.view.lkml"
include: "/data_warehouse/data_warehouse_tests/*.lkml"

#
# Base Explores for Extensions
#

explore: _base_account_explore {
  extension: required

  join: account {
    view_label: "Account"
    relationship: many_to_one
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
  }

  join: parent_account {
    from: account
    sql_on: ${account.parentid} = ${parent_account.sfid} ;;
    relationship:one_to_one
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
    relationship:one_to_one
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

  join: opportunitylineitem {
    sql_on: ${opportunity.sfid} = ${opportunitylineitem.opportunityid};;
    relationship: many_to_one
  }

  join: product2 {
    view_label: "Product"
    sql_on: ${opportunitylineitem.product2id} = ${product2.sfid} ;;
    relationship: many_to_one
  }

  join: opportunity_owner {
    from: user
    sql_on: ${opportunity.ownerid} = ${opportunity_owner.sfid} ;;
    relationship: many_to_one
  }

  join: opportunity_csm {
    view_label: "Opportunity CSM"
    from: user
    sql_on: left(${opportunity.csm_owner_id},15) = left(${opportunity_csm.sfid},15) ;;
    relationship: many_to_one
  }
}

explore: _base_opportunity_core_explore {
  extension: required

  join: opportunity {
    relationship: many_to_one
    fields: [opportunity.opportunity_core*]
  }

  join: opportunitylineitem {
    sql_on: ${opportunity.sfid} = ${opportunitylineitem.opportunityid};;
    relationship: many_to_one
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
    sql_on: left(${opportunity.csm_owner_id},15) = left(${opportunity_csm.sfid},15) ;;
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

explore: opportunityfieldhistory {
  view_label: "Opportunity Field History"
  group_label: "Salesforce"
  extends: [_base_account_core_explore,_base_opportunity_explore]
  join: opportunity {
    sql_on: ${opportunity.sfid} = ${opportunityfieldhistory.opportunityid} ;;
  }

  join: account {
    sql_on: ${opportunity.accountid} = ${account.sfid} ;;
  }
}

explore: lead {
  label: "Lead to Account"
  group_label: "Salesforce"
  extends: [_base_account_core_explore,_base_opportunity_core_explore]

  join: lead_status_dates {
    sql_on: ${lead.sfid} = ${lead_status_dates.leadid} ;;
    relationship: one_to_one
    fields: []
  }

  join: created_by {
    from: user
    sql_on: ${lead.createdbyid} = ${created_by.sfid} ;;
    relationship: many_to_one
  }

  join: contact {
    sql_on: ${lead.convertedcontactid} = ${contact.sfid} ;;
    relationship: one_to_one
  }

  join: account {
    sql_on: ${contact.accountid} = ${account.sfid} ;;
  }

  join: opportunity {
    sql_on: ${lead.convertedopportunityid} = ${opportunity.sfid} ;;
    relationship: one_to_one
  }
}

explore: contributor_employee_map_data {
  group_label: "Contributors & Employees"
}

explore: daily_traffic {
  group_label: "Google Analytics"
  label: "Daily Traffic"
}

explore: daily_page_visits {
  group_label: "Google Analytics"
  label: "Daily Page Vistis"
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
    opportunitylineitem.total_potential_and_booked_arr,
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

  join: lead {
    sql_on: ${campaignmember.leadid}= ${lead.sfid} ;;
    relationship: many_to_one
  }

  join: lead_status_dates {
    sql_on: ${lead.sfid} = ${lead_status_dates.leadid} ;;
    relationship: one_to_one
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

explore: server_daily_details {
  group_label: "Product"
  description: "Contains a daily snapshot of each non-test/dev server's state. Use this to trend server counts, TEDAS/TEDAU, and age over time. Includes server version, ip, active users, registered users, operating system, Salesforce Account ID, database type, etc."

  join: server_fact {
    sql_on: ${server_daily_details.server_id} = ${server_fact.server_id} ;;
    relationship: many_to_one
    type: inner
    fields: []
  }
}

explore: delete_history {
  view_label: "Delete History"
  group_label: "Salesforce"
}

explore: server_fact {
  group_label: "Product"
  description: "Contains the most recent state of a server. Includes first active date, last active date, license id, Salesforce Account ID, version, max active user counts, etc."
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
    sql_on: ${account.sfid} = ${zendesk_ticket_details.account_sfid} AND ${zendesk_ticket_details.status} <> 'deleted';;
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
    fields: [name]
  }

}

explore: zendesk_ticket_details {
  label: "Zendesk Tickets"
  group_label: "Customer Success"
  sql_always_where: ${zendesk_ticket_details.status} <> 'deleted' AND coalesce(${organization_name},'') <> 'Mattermost';;
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

# BP: Method to hide an explore based on a user attribute
# explore: test_full_financial {
#   from: user
#   group_label: "Test"
#   required_access_grants: [full_financial]
# }

explore: nps_user_monthly_score {
  group_label: "Product"
  label: "NPS User Monthly Score"
  description: "Contains NPS Score data per user per month for all users that have submitted an NPS survey (Updated every 30 minutes for new submissions). Can be used to trend NPS monthly by server version, server age, user role, user age, etc.."
  extends: [_base_account_core_explore]

  join: license_overview {
    sql_on: ${nps_user_monthly_score.license_id} = ${license_overview.licenseid}  ;;
    relationship: many_to_many
    fields: []
  }

  join: account {
    sql_on: ${license_overview.account_sfid} = ${account.sfid} ;;
    fields: [account.account_core*]
  }
}

explore: server_daily_details_ext {
  group_label: "Product"
  label: "Server Daily Details Ext"
  description: "An extension of 'Server Daily Details' explore that includes all server configuration and activity data. Can be used to report the volume of servers by day with various configuration settings activated, activity thresholds reached, or age milestones attained."
  extends: [_base_account_core_explore]


  join: account {
    sql_on: ${server_daily_details_ext.account_sfid} = ${account.sfid} ;;
    fields: [account.account_core*]
  }
}

explore: tva_all_by_mo {
  required_access_grants: [mlt_only]
  group_label: "Target vs Actual"
  label: "Monthly TvA"

  join: target_fact {
    sql_on: ${target_fact.slug} = ${tva_all_by_mo.target_slug};;
    relationship: many_to_one
  }
}

explore: tva_all_by_qtr {
  required_access_grants: [mlt_only]
  group_label: "Target vs Actual"
  label: "Quarterly TvA"

  join: target_fact {
    sql_on: ${target_fact.slug} = ${tva_all_by_qtr.target_slug};;
    relationship: many_to_one
  }
}

explore: tva_all_by_fy {
  required_access_grants: [mlt_only]
  group_label: "Target vs Actual"
  label: "Fiscal Year TvA"

  join: target_fact {
    sql_on: ${target_fact.slug} = ${tva_all_by_fy.target_slug};;
    relationship: many_to_one
  }
}

explore: events_registry {
  label: "Events Registry"
  group_label: "Product"
  description: "Contains the name and details of all user events currently, and historically, captured on the Mattermost platform. Including the first and most recent date the event was logged."
}
explore: user_events_by_date {
  label: "User Events By Date"
  group_label: "Product"
  description: "Contains all 'whitelist' user events by day. 1 row per user per event per day (for all 'whitelist' events performed by that user across web, desktop, and mobile). Also provides the sum of events performed for each row, which captures the total number of events performed by the user, for the given event, on the given date (must be >= 1). Use this to track and trend the volume of individual events by day, by browser, by os, etc.."
}
explore: user_events_by_date_agg {
  label: "User Events By Date Agg"
  group_label: "Product"
  description: "Contains an aggregated version of the 'User Events By Date' explore. Sums all events performed by the user across mobile, web, and desktop. Use this to trend DAU and MAU over time. 1 row per user per day for all dates >= the user's first event date (i.e. contains row for users on dates where user has not performed event to track disengagement)."
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
  group_label: "License"
  hidden: yes
}
explore: license_daily_details {
  label: "License Daily Details"
  group_label: "BLP"
  description: "Contains a daily snapshot of license data including aggregate measures for all servers associated with a license, Salesforce account information, # licensed users, # registered users, licensed MAU, licensed DAU, and aggregate server activity totals. You can use this to track specific customers over time or view the most up-to-date data available for trial and non-trial licenses."
}
