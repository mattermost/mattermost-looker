connection: "orgm"

include: "/orgm/orgm_views/orgm/*.view.lkml"
include: "/orgm/orgm_views/staging/*.view.lkml"
fiscal_month_offset: -11

explore: opportunity {
  group_label: "zHeroku Postgres OrgM"
}

explore: opportunity_snapshot {
  group_label: "zHeroku Postgres OrgM"
}

explore: product_line_item {
  group_label: "zHeroku Postgres OrgM"
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

  join: util_dates {
    sql_on: ${util_dates.date_date} >= ${opportunitylineitem.start_date} and ${util_dates.date_date} <= ${opportunitylineitem.end_date} ;;
    relationship: many_to_many
  }
}

explore: campaignmember {
  group_label: "zHeroku Postgres OrgM"
}
