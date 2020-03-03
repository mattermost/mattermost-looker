connection: "orgm"

include: "/orgm/orgm_views/orgm/*.view.lkml"
include: "/orgm/orgm_views/staging/*.view.lkml"
fiscal_month_offset: -11


explore: delete_history {
  group_label: "zHeroku Postgres OrgM"
}


explore: opportunity {
  group_label: "zHeroku Postgres OrgM"
}

explore: user {
  group_label: "zHeroku Postgres OrgM"
}

explore: opportunity_snapshot {
  group_label: "zHeroku Postgres OrgM"
}

explore: account {
  group_label: "zHeroku Postgres OrgM"

  join: opportunity {
    sql_on: ${account.sfid} = ${opportunity.accountid} ;;
    relationship: many_to_one
  }

  join: account_csm {
    from: user
    sql_on: ${account.csm_lookup} = ${account_csm.sfid} ;;
    relationship: many_to_one
  }

  join: opportunitylineitem {
    sql_on: ${opportunity.sfid} = ${opportunitylineitem.opportunityid} ;;
    relationship: many_to_one
  }

  join: product2 {
    sql_on: ${opportunitylineitem.product2id} = ${product2.sfid} ;;
    relationship: many_to_one
  }

  join: parent_account {
    from: account
    view_label: "Parent Account"
    sql_on: ${parent_account.sfid} = ${account.parentid} ;;
    relationship: many_to_one
  }

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

  join: account_csm {
    from: user
    sql_on: ${account.csm_lookup} = ${account_csm.sfid} ;;
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

explore: account_data_check {
  persist_for: "0 seconds"
  fields: [account.sfid, orgm_account_data_check.sfid,
    account.systemmodstamp_time, orgm_account_data_check.systemmodstamp_time,
    account.created_time, orgm_account_data_check.created_time,
    orgm_account_data_check.processed_time,
          delete_history.name,delete_history.deleted_time]
  group_label: "zHeroku Postgres OrgM"
  from: account
  view_name: account

  join: orgm_account_data_check {
    view_label: "Snowflake Account"
    type: full_outer
    relationship: one_to_one
    sql_on: ${account.sfid} = ${orgm_account_data_check.sfid} ;;
  }

  join: delete_history {
    sql_on: ${delete_history.sfid} = ${orgm_account_data_check.sfid} ;;
    relationship: one_to_one
  }
}

explore: opportunity_data_check {
  persist_for: "0 seconds"
  fields: [opportunity.sfid, orgm_opportunity_data_check.sfid,
          opportunity.systemmodstamp_time, orgm_opportunity_data_check.systemmodstamp_time,
          opportunity.created_time, orgm_opportunity_data_check.created_time,
          orgm_opportunity_data_check.processed_time,
          delete_history.name,delete_history.deleted_time]
  group_label: "zHeroku Postgres OrgM"
  from: opportunity
  view_name: opportunity

  join: orgm_opportunity_data_check {
    view_label: "Snowflake Opportunity"
    type: full_outer
    relationship: one_to_one
    sql_on: ${opportunity.sfid} = ${orgm_opportunity_data_check.sfid} ;;
  }

  join: delete_history {
    sql_on: ${delete_history.sfid} = ${orgm_opportunity_data_check.sfid} ;;
    relationship: one_to_one
  }
}

explore: opportunitylineitem_data_check {
  persist_for: "0 seconds"
  fields: [opportunitylineitem.sfid, orgm_opportunitylineitem_data_check.sfid,
          opportunitylineitem.systemmodstamp_time, orgm_opportunitylineitem_data_check.systemmodstamp_time,
          opportunitylineitem.created_time, orgm_opportunitylineitem_data_check.created_time,
          orgm_opportunitylineitem_data_check.processed_time,
          delete_history.name,delete_history.deleted_time]
  group_label: "zHeroku Postgres OrgM"
  from: opportunitylineitem
  view_name: opportunitylineitem
  view_label: "Opportunity Line Item"
  join: orgm_opportunitylineitem_data_check {
    view_label: "Snowflake Opportunity Line Item"
    type: full_outer
    relationship: one_to_one
    sql_on: ${opportunitylineitem.sfid} = ${orgm_opportunitylineitem_data_check.sfid} ;;
  }

  join: delete_history {
    sql_on: ${delete_history.sfid} = ${orgm_opportunitylineitem_data_check.sfid} ;;
    relationship: one_to_one
  }
}
