connection: "snowflake"

include: "/data_warehouse/data_warehouse_views/orgm/*.view.lkml"
include: "/data_warehouse/data_warehouse_views/finance/*.view.lkml"
include: "/data_warehouse/data_warehouse_views/util/*.view.lkml"
include: "/data_warehouse/data_warehouse_views/mattermost/*.view.lkml"
fiscal_month_offset: -11

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

  join: opportunity {
    sql_on: ${opportunity.sfid} = ${opportunitylineitem.opportunityid} ;;
    relationship: many_to_one
  }

  join: account {
    view_label: "Account"
    sql_on: ${account.sfid} = ${opportunity.accountid} ;;
    relationship: many_to_one
  }

  join: parent_account {
    from: account
    view_label: "Parent Account"
    sql_on: ${parent_account.sfid} = ${account.parentid} ;;
    relationship: many_to_one
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
