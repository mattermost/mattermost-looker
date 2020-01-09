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
# include: "/data_warehouse/data_warehouse_views/events/*.view.lkml"
include: "/data_warehouse/data_warehouse_views/finance/*.view.lkml"
include: "/data_warehouse/data_warehouse_views/ga/*.view.lkml"
include: "/data_warehouse/data_warehouse_views/orgm/*.view.lkml"
include: "/data_warehouse/data_warehouse_views/mattermost/*.view.lkml"
include: "/data_warehouse/data_warehouse_views/util/*.view.lkml"


#
# Explores
#

explore: oli_level_arr {
  label: "ARR: OLI Level"
  group_label: "ARR"
}

explore: account_monthly_arr_deltas_by_type {
  label: "Monthly Account ARR Changes by Type"
  group_label: "ARR"
  join: account {
    sql_on: ${account.sfid} = ${account_monthly_arr_deltas_by_type.account_sfid} ;;
    relationship: many_to_one
    fields: []
  }

  join: master_account {
    from: account
    sql_on: ${master_account.sfid} = ${account_monthly_arr_deltas_by_type.master_account_sfid} ;;
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
}

explore: account_daily_arr_deltas {
  label: "Daily Account ARR Changes"
  group_label: "ARR"
  join: account {
    sql_on: ${account.sfid} = ${account_daily_arr_deltas.account_sfid} ;;
    relationship: many_to_one
    fields: []
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
     opportunitylineitem.total_price
   ]
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
  join: world_cities {
    sql_on: ${staff_list.major_city} = ${world_cities.city} and ${staff_list.region_country} = ${world_cities.country};;
    relationship: many_to_one
  }
}

explore: daily_traffic {
  group_label: "Google Analytics"
  label: "Daily Traffic"
}


explore: product_line_item {
  from: opportunitylineitem
  view_name: opportunitylineitem
  label: "Line Item to Account"
  group_label: "Salesforce"
  sql_always_where: ${opportunitylineitem.length_days} <> 0 ;;

  # BP: Override the data group if the explore includes data that needs to be refreshed more frequently than the default
  persist_with: mm_salesforce_data_group

  join: opportunity {
    sql_on: ${opportunitylineitem.opportunityid} = ${opportunity.sfid};;
    relationship: many_to_one
    # BP: Use sets where possible to increase reusability
    # fields: [opportunity_drill_fields_long*]
  }

  join: account {
    view_label: "Account"
    # BP: Limit the joined fields to what's needed in this explore
    # fields: [account_fields_core*]

    # BP: Always have the FROM table listed first and the joined TO table list second
    # BP: Always join on the primary key of the "one" table so Looker can detect fanout
    sql_on: ${opportunity.accountid} = ${account.sfid} ;;
    relationship: many_to_one
  }

  join: parent_account {
    from: account
    view_label: "Parent Account"
    sql_on: ${account.parentid} = ${parent_account.sfid} ;;
    relationship: many_to_one
    fields: []
  }

  join: product2 {
    view_label: "Product"
    sql_on: ${opportunitylineitem.product2id} = ${product2.sfid} ;;
    relationship: many_to_one
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


explore: arr {
  label: "ARR"
  group_label: "ARR"
  sql_always_where: ${opportunitylineitem.length_days} <> 0 ;;
  extends: [product_line_item]
#   required_access_grants: [debugging_fields]

  join: dates {
    view_label: "ARR Date"
    sql_on: ${dates.date_date} >= ${opportunitylineitem.start_date} and ${dates.date_date} <= ${opportunitylineitem.end_date} ;;
    relationship: many_to_many
  }
fields: [
  dates.date_date,
  account.name, account.sfid, account.owner_name, account.ownerid, account.csm_name,
  opportunity.name, opportunity.sfid, opportunity.close_date, opportunity.iswon, opportunity.probability, opportunity.owner_name, opportunity.csm_name, opportunity.type,
  opportunitylineitem.product_name,
  opportunitylineitem.start_date, opportunitylineitem.start_fiscal_quarter, opportunitylineitem.start_fiscal_year,
  opportunitylineitem.end_date, opportunitylineitem.start_fiscal_quarter, opportunitylineitem.start_fiscal_year,
  opportunitylineitem.quantity, opportunitylineitem.product_line_type, opportunitylineitem.total_arr]
}
