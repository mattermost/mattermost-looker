connection: "snowflake"

include: "/data_warehouse/data_warehouse_views/blp/*.view.lkml"
include: "/data_warehouse/data_warehouse_views/employee/*.view.lkml"
# include: "/data_warehouse/data_warehouse_views/events/*.view.lkml"
include: "/data_warehouse/data_warehouse_views/finance/*.view.lkml"
include: "/data_warehouse/data_warehouse_views/ga/*.view.lkml"
include: "/data_warehouse/data_warehouse_views/orgm/*.view.lkml"
include: "/data_warehouse/data_warehouse_views/mattermost/*.view.lkml"
include: "/data_warehouse/data_warehouse_views/util/*.view.lkml"

fiscal_month_offset: -11

explore: oli_level_arr {
  label: "OLI Level ARR"
  group_label: "  Favorite Explores"
}

explore: account_monthly_arr_deltas_by_type {
  label: "Monthly Account ARR Changes by Type"
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
    sql_on: ${opportunity.accountid} = ${account.sfid} AND ${opportunity.iswon};;
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
      opportunitylineitem.total_arr
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

explore: daily_traffic {
  group_label: "Google Analytics"
  label: "Daily Traffic"
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
