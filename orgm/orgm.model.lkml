connection: "orgm"

include: "/orgm/orgm_views/orgm/*.view.lkml"
fiscal_month_offset: 1

explore: account {
  fields: [ALL_FIELDS*, -account.parent_account_name]
}
explore: product2 {}


explore: lead {
  join: user {
    from: user
    sql_on: ${lead.createdbyid} = ${user.sfid} ;;
    relationship: many_to_one
  }
}

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

  join: util_dates {
    sql_on: ${util_dates.date_date} >= ${opportunitylineitem.start_date} and ${util_dates.date_date} <= ${opportunitylineitem.end_date} ;;
    relationship: many_to_many
  }
}
