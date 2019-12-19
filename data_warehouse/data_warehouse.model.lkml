connection: "snowflake"

include: "/data_warehouse/data_warehouse_views/orgm/*.view.lkml"
include: "/data_warehouse/data_warehouse_views/finance/*.view.lkml"
fiscal_month_offset: 1

explore: oli_level_arr {
  label: "OLI Level ARR"
  group_label: "  Favorite Explores"
}

explore: product2 {}

explore: product_line_item {
  from: opportunitylineitem
  view_name: opportunitylineitem
  group_label: "Favorite Explores"

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
}
