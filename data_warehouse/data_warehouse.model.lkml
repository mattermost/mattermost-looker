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

include: "/data_warehouse/data_warehouse_views/orgm/*.view.lkml"
include: "/data_warehouse/data_warehouse_views/finance/*.view.lkml"
include: "/data_warehouse/data_warehouse_views/util/*.view.lkml"
include: "/data_warehouse/data_warehouse_views/mattermost/*.view.lkml"


#
# Explores
#

explore: oli_level_arr {
  label: "OLI Level ARR"
  group_label: "  Favorite Explores"
}

explore: account_monthly_arr_net_changes {
  label: "Account ARR Changes"
  join: account {
    sql_on: ${account.sfid} = ${account_monthly_arr_net_changes.account_sfid} ;;
    relationship: many_to_one
    fields: []
  }
  join: master_account {
    from: account
    sql_on: ${master_account.sfid} = ${account_monthly_arr_net_changes.master_account_sfid} ;;
    relationship: many_to_one
    fields: []
  }
}

explore: lead {
  join: user {
    from: user
    sql_on: ${lead.createdbyid} = ${user.sfid} ;;
    relationship: many_to_one
  }
}

explore: staff_list {
  join: world_cities {
    sql_on: ${staff_list.major_city} = ${world_cities.city} and ${staff_list.region_country} = ${world_cities.country};;
    relationship: many_to_one
  }
}


explore: product_line_item {
  from: opportunitylineitem
  view_name: opportunitylineitem

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
    sql_on: ${opportunity.account_id} = ${account.sfid} ;;
    relationship: many_to_one
  }

  join: parent_account {
    from: account
    view_label: "Parent Account"
    sql_on: ${account.parentid} = ${parent_account.sfid} ;;
    relationship: many_to_one
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
  }

  join: opportunity_owner {
    from: user
    sql_on: ${account.ownerid} = ${opportunity_owner.sfid} ;;
    relationship: many_to_one
  }

  join: dates {
    sql_on: ${dates.date_date} >= ${opportunitylineitem.start_date} and ${dates.date_date} <= ${opportunitylineitem.end_date} ;;
    relationship: many_to_many
  }
}

# explore: product_line_item_cs {
#   extends: [product_line_item]
#   required_access_grants: [debugging_fields]

#   fields: [opportunity.sfid, opportunity.probability, account.name]
# }
