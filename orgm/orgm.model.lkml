connection: "orgm"

include: "/orgm/orgm_views/orgm/*.view.lkml"
include: "/orgm/orgm_views/staging/*.view.lkml"
fiscal_month_offset: -11

#
# Formats
#

# BP: Define your own global named value formats to make changing defaults easy
named_value_format: mm_usd_short {
  value_format: "$###,##0"
}

named_value_format: mm_integer_percent {
  value_format: "0\%"
}


explore: account {
  group_label: "zHeroku Postgres OrgM"

  join: opportunity {
    sql_on: ${account.sfid} = ${opportunity.accountid} ;;
    relationship: one_to_many
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

explore: campaignmember {
  group_label: "zHeroku Postgres OrgM"
}

explore: delete_history {
  group_label: "zHeroku Postgres OrgM"
}


explore: forecast_ww {
  label: "Forecast (WW)"
  group_label: "zHeroku Postgres OrgM"

  join: forecast_ww_history {
    sql_on: ${forecast_ww.sfid} = ${forecast_ww_history.fc_to_history};;
    relationship: one_to_many
  }

}

explore: hc_object_status {
  group_label: "zHeroku Postgres OrgM"
}

explore: lead {
  group_label: "zHeroku Postgres OrgM"

  join: owner {
    from:  user
    sql_on: ${lead.ownerid} = ${owner.sfid} ;;
    relationship: many_to_one
    fields: []
  }
}

explore: opportunity {
  group_label: "zHeroku Postgres OrgM"

  join: opportunitylineitem {
    sql_on: ${opportunity.sfid} = ${opportunitylineitem.opportunityid} ;;
    relationship: one_to_many
  }

  join: opportunitycontactrole {
    sql_on: ${opportunity.sfid} = ${opportunitycontactrole.opportunityid} ;;
    relationship: one_to_many
  }

  join: ocr_contact {
    from: contact
    sql_on: ${opportunitycontactrole.contactid} = ${ocr_contact.sfid} ;;
    relationship: many_to_one
    fields: []
  }

}


explore: opportunity_snapshot {
  group_label: "zHeroku Postgres OrgM"
}

explore: profile {
  group_label: "zHeroku Postgres OrgM"
}

explore: task {
  group_label: "zHeroku Postgres OrgM"
  join: creator {
    from: user
    sql_on: ${task.createdbyid}= ${creator.sfid} ;;
    relationship: many_to_one
    fields: []
  }
}
explore: territory_mapping {
  group_label: "zHeroku Postgres OrgM"

  join: enterprise_rep {
    from: user
    sql_on: ${territory_mapping.enterprise_rep}= ${enterprise_rep.sfid} ;;
    relationship: one_to_one
    fields: []
  }
  join: commercial_rep {
    from: user
    sql_on: ${territory_mapping.commercial_rep}= ${commercial_rep.sfid} ;;
    relationship: one_to_one
    fields: []
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


explore: account_data_check {
  persist_for: "0 seconds"
  fields: [account.sfid, orgm_account_data_check.sfid, account.count,
    account.systemmodstamp_time, orgm_account_data_check.systemmodstamp_time,
    account.created_time, orgm_account_data_check.created_time,
    orgm_account_data_check.processed_time, orgm_account_data_check.count,
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
  fields: [opportunity.sfid, orgm_opportunity_data_check.sfid, opportunity.count,
          opportunity.systemmodstamp_time, orgm_opportunity_data_check.systemmodstamp_time,
          opportunity.created_time, orgm_opportunity_data_check.created_time,
          orgm_opportunity_data_check.processed_time, orgm_opportunity_data_check.count,
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
  fields: [opportunitylineitem.sfid, orgm_opportunitylineitem_data_check.sfid, opportunitylineitem.count,
          opportunitylineitem.systemmodstamp_time, orgm_opportunitylineitem_data_check.systemmodstamp_time,
          opportunitylineitem.created_time, orgm_opportunitylineitem_data_check.created_time,
          orgm_opportunitylineitem_data_check.processed_time, orgm_opportunitylineitem_data_check.count,
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
    sql_on: ${delete_history.object_id} = ${orgm_opportunitylineitem_data_check.sfid} ;;
    relationship: one_to_one
  }
}

explore: lead_data_check {
  persist_for: "0 seconds"
  fields: [lead.sfid, orgm_lead_data_check.sfid, lead.count,
    lead.systemmodstamp_time, orgm_lead_data_check.systemmodstamp_time,
    lead.created_time, orgm_lead_data_check.created_time,
    orgm_lead_data_check.processed_time, orgm_lead_data_check.count,
    delete_history.name,delete_history.deleted_time]
  group_label: "zHeroku Postgres OrgM"
  from: lead
  view_name: lead

  join: orgm_lead_data_check {
    view_label: "Snowflake Lead"
    type: full_outer
    relationship: one_to_one
    sql_on: ${lead.sfid} = ${orgm_lead_data_check.sfid} ;;
  }

  join: delete_history {
    sql_on: ${delete_history.sfid} = ${orgm_lead_data_check.sfid} ;;
    relationship: one_to_one
  }
}

explore: opportunity_field_history {
  group_label: "zHeroku Postgres OrgM"
  from:  opportunityfieldhistory
  join: opportunity {
    sql_on: ${opportunity_field_history.opportunityid} = ${opportunity.sfid} ;;
    relationship: many_to_one
    fields: [opportunity.name, opportunity.close_date, opportunity.close_month, opportunity.stagename, opportunity.status_wlo,
             opportunity.probability, opportunity.sfid, opportunity.total_amount]
  }
}

explore: opportunity_history {
  group_label: "zHeroku Postgres OrgM"
  from:  opportunityhistory

  join: opportunity {
    sql_on: ${opportunity_history.opportunityid} = ${opportunity.sfid} ;;
    relationship: many_to_one
    fields: [opportunity.name, opportunity.close_date, opportunity.close_month, opportunity.stagename, opportunity.status_wlo,
      opportunity.probability, opportunity.sfid, opportunity.total_amount]
  }
}


explore: user {
  group_label: "zHeroku Postgres OrgM"
}
