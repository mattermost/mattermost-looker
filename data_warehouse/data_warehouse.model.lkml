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
  value_format: "$###,###"
}

named_value_format: mm_integer_percent {
  value_format: "0\%"
}



#
# Views
#

include: "/data_warehouse/data_warehouse_views/blp/*.view.lkml"
include: "/data_warehouse/data_warehouse_views/employee/*.view.lkml"
include: "/data_warehouse/data_warehouse_views/events/*.view.lkml"
include: "/data_warehouse/data_warehouse_views/finance/*.view.lkml"
include: "/data_warehouse/data_warehouse_views/ga/*.view.lkml"
include: "/data_warehouse/data_warehouse_views/orgm/*.view.lkml"
include: "/data_warehouse/data_warehouse_views/mattermost/*.view.lkml"
include: "/data_warehouse/data_warehouse_views/util/*.view.lkml"


#
# Explores
#


explore: _base_account_explore {
  extension: required

  join: account {
    # NOTE: foreign key is not set and must be set by the extending explore
    relationship: many_to_one
  }

  join: account_csm {
    from: user
    sql_on: coalesce(left(${account.csm_override},15),left(${account.csm_id},15)) = left(${account_csm.sfid},15) ;;
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
}

explore: opportunitylineitem {
  view_name: opportunitylineitem
  label: "Line Item to Account"
  group_label: "Salesforce"
  sql_always_where: ${opportunitylineitem.length_days} <> 0 ;;
  extends: [ _base_account_explore ]

  join: opportunity {
    sql_on: ${opportunitylineitem.opportunityid} = ${opportunity.sfid};;
    relationship: many_to_one
  }

  join: account {
    view_label: "Account"
    sql_on: ${opportunity.accountid} = ${account.sfid} ;;
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


explore: account_monthly_arr_deltas_by_type {
  label: "Monthly Account ARR Changes by Type"
  group_label: "ARR"
  extends: [ _base_account_explore ]

  join: master_account {
    from: account
    sql_on: ${master_account.sfid} = ${account_monthly_arr_deltas_by_type.master_account_sfid} ;;
    relationship: many_to_one
    fields: []
  }

  join: account {
    sql_on: ${account.sfid} = ${account_monthly_arr_deltas_by_type.account_sfid} ;;
    relationship: many_to_one
    fields: []
  }

}

explore: master_account_monthly_arr_deltas_by_type {
  label: "Monthly Master Account ARR Changes by Type"
  group_label: "ARR"
  join: account {
    sql_on: ${account.sfid} = ${master_account_monthly_arr_deltas_by_type.master_account_sfid} ;;
    relationship: many_to_one
    fields: []
  }

  join: child_account {
    from: account
    sql_on: ${account.sfid} = ${child_account.parentid} ;;
    relationship: many_to_one
    fields: []
  }

  join: account_owner {
    from: user
    sql_on: ${account.ownerid} = ${account_owner.sfid} ;;
    relationship: many_to_one
  }

  join: csm_account_owner {
    from: user
    sql_on: left(${account.csm_id},15) = left(${csm_account_owner.sfid},15) ;;
    relationship: many_to_one
  }

  join: opportunity {
    sql_on: (${opportunity.accountid} = ${account.sfid} OR ${opportunity.accountid} = ${child_account.sfid}) AND ${opportunity.is_won};;
    relationship: one_to_many
    fields: [opportunity.name, opportunity.sfid]
  }

  join: opportunitylineitem {
    sql_on: ${opportunitylineitem.opportunityid} = ${opportunity.sfid}
      AND (${opportunitylineitem.start_month} = ${master_account_monthly_arr_deltas_by_type.month_start_month});;
    relationship: one_to_many
    fields: [opportunitylineitem.name, opportunitylineitem.sfid,
      opportunitylineitem.revenue_type, opportunitylineitem.product_type, opportunitylineitem.product_line_type,
      opportunitylineitem.total_price, opportunitylineitem.total_arr
    ]
  }
}

explore: account_daily_arr_deltas {
  label: "Daily Account ARR Changes"
  group_label: "ARR"
  view_label: "Account Daily ARR Deltas"
  extends: [ _base_account_explore ]

  join: account {
    sql_on: ${account.sfid} = ${account_daily_arr_deltas.account_sfid} ;;
    relationship: many_to_one
    fields: [name]
  }

  join: master_account {
    from: account
    sql_on: ${master_account.sfid} = ${account_daily_arr_deltas.master_account_sfid} ;;
    relationship: many_to_one
    fields: []
  }

  join: opportunity {
    sql_on: ${opportunity.accountid} = ${account.sfid} AND ${opportunity.is_won};;
    relationship: one_to_many
    fields: [opportunity.name, opportunity.sfid]
  }

 join: opportunitylineitem {
   sql_on: ${opportunitylineitem.opportunityid} = ${opportunity.sfid}
           AND (${opportunitylineitem.start_month} = ${account_daily_arr_deltas.new_day_date}
               OR ${opportunitylineitem.end_month} = ${account_daily_arr_deltas.previous_day_date});;
   relationship: one_to_many
   fields: [opportunitylineitem.name, opportunitylineitem.sfid,
     opportunitylineitem.revenue_type, opportunitylineitem.product_type, opportunitylineitem.product_line_type,
     opportunitylineitem.total_price, opportunitylineitem.total_arr]
 }

 join: product2 {
   sql_on: ${product2.sfid} = ${opportunitylineitem.product2id} ;;
   relationship: many_to_one
 }

}

explore: master_account_daily_arr_deltas {
  label: "Daily Master Account ARR Changes"
  group_label: "ARR"
  join: account {
    sql_on: ${account.sfid} = ${master_account_daily_arr_deltas.master_account_sfid} ;;
    relationship: many_to_one
    fields: []
  }
  join: child_account {
    from: account
    sql_on: ${account.sfid} = ${child_account.parentid} ;;
    relationship: many_to_one
    fields: []
  }

  join: opportunity {
    sql_on: (${opportunity.accountid} = ${account.sfid} OR ${opportunity.accountid} = ${child_account.sfid}) AND ${opportunity.is_won};;
    relationship: one_to_many
    fields: [opportunity.name, opportunity.sfid]
  }

  join: opportunitylineitem {
    sql_on: ${opportunitylineitem.opportunityid} = ${opportunity.sfid}
           AND (${opportunitylineitem.start_month} = ${master_account_daily_arr_deltas.new_day_date}
               OR ${opportunitylineitem.end_month} = ${master_account_daily_arr_deltas.previous_day_date});;
    relationship: one_to_many
    fields: [opportunitylineitem.name, opportunitylineitem.sfid,
      opportunitylineitem.revenue_type, opportunitylineitem.product_type, opportunitylineitem.product_line_type,
      opportunitylineitem.total_price, opportunitylineitem.total_arr]
  }

  join: product2 {
    sql_on: ${product2.sfid} = ${opportunitylineitem.product2id} ;;
    relationship: many_to_one
  }

  join: account_owner {
    from: user
    sql_on: ${account.ownerid} = ${account_owner.sfid} ;;
    relationship: many_to_one
  }

  join: csm_account_owner {
    from: user
    sql_on: left(${account.csm_id},15) = left(${csm_account_owner.sfid},15) ;;
    relationship: many_to_one
  }

}

explore: lead {
  label: "Lead to Account"
  group_label: "Salesforce"

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
    relationship: many_to_one
  }

  join: opportunity {
    sql_on: ${lead.convertedopportunityid} = ${opportunity.sfid} ;;
    relationship: one_to_one
  }

  join: opportunitylineitem {
    sql_on: ${opportunity.sfid} = ${opportunitylineitem.opportunityid};;
    relationship: one_to_many
    fields: []
  }

  join: product2 {
    sql_on: ${opportunitylineitem.product2id} = ${product2.sfid};;
    relationship: one_to_many
    fields: []
  }

  join: parent_account {
    from: account
    sql_on: ${account.parentid} = ${parent_account.sfid} ;;
    relationship:one_to_one
    fields: []
  }

  join: account_owner {
    from: user
    sql_on: ${account.ownerid} = ${account_owner.sfid} ;;
    relationship: many_to_one
    fields: []
  }

  join: opportunity_owner {
    from: user
    sql_on: ${opportunity.ownerid} = ${opportunity_owner.sfid} ;;
    relationship: many_to_one
    fields: []
  }

  join: account_csm {
    view_label: "Account CSM"
    from: user
    sql_on: coalesce(left(${account.csm_override},15),left(${account.csm_id},15)) = left(${account_csm.sfid},15) ;;
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

explore: staff_list {
  join: contributor_employee_map_data {
    sql_on: ${staff_list.email} = ${contributor_employee_map_data.email};;
    relationship: many_to_one
    fields: []
  }
}

explore: contributor_employee_map_data {}

explore: daily_traffic {
  group_label: "Google Analytics"
  label: "Daily Traffic"
}

explore: downloads {}

explore: arr {
  label: "ARR Granular Reporting"
  group_label: "ARR"
  sql_always_where: ${opportunitylineitem.length_days} <> 0 and ${opportunity.iswon};;
  extends: [opportunitylineitem]

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
  dates.date_fiscal_year,
  dates.next_fiscal_year,
  dates.previous_fiscal_year,
  opportunitylineitem.opportunitylineitem_core*,
  account.account_core*,
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

  join: account {
    sql_on: ${lead.matched_account} = ${account.sfid} ;;
    relationship: many_to_one
  }
}


explore: github_contributions {
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
