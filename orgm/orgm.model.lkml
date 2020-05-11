connection: "orgm"

include: "/orgm/orgm_views/orgm/*.view.lkml"
include: "/orgm/orgm_views/staging/*.view.lkml"
include: "/orgm/orgm_views/sandbox/*.view.lkml"
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

explore: sandbox_account {
  group_label: "zHeroku Postgres OrgM"
  sql_always_where: ${sandbox_opportunity.createdbyid} = '0051R00000I5BTgQAN' AND ${sandbox_opportunity.type} != 'Renewal';;
  fields: [
            sandbox_account.sfid,sandbox_account.name,sandbox_account.owner,sandbox_account.website,
            sandbox_account.billingstate,sandbox_account.billingcountry,sandbox_account.billingcountrycode,
            sandbox_account.billingstreet,sandbox_account.billingstatecode,sandbox_account.billingcity,
            sandbox_account.billingpostalcode,

            sandbox_opportunity.sfid,sandbox_opportunity.name,sandbox_opportunity.type,sandbox_opportunity.amount,
            sandbox_opportunity.close_date,sandbox_opportunity.close_month,sandbox_opportunity.close_fiscal_quarter,
            sandbox_opportunity.close_fiscal_year,sandbox_opportunity.stagename,sandbox_opportunity.e_purchase_date__c,

            sandbox_opportunitycontactrole.role,

            opportunitycontactrole_contact.name, opportunitycontactrole_contact.email, opportunitycontactrole_contact.sfid,

            sandbox_billing_entity.sfid,sandbox_billing_entity.cust_company,sandbox_billing_entity.cust_email,
            sandbox_billing_entity.cust_firstname,sandbox_billing_entity.cust_lastname,sandbox_billing_entity.cust_payment_method,
            sandbox_billing_entity.cust_payment_method_detail,sandbox_billing_entity.cust_id,

            billing_entity_contact.name, billing_entity_contact.email, billing_entity_contact.sfid,

            sandbox_opportunitylineitem.sfid,sandbox_opportunitylineitem.name,sandbox_opportunitylineitem.quantity,
            sandbox_opportunitylineitem.unitprice,sandbox_opportunitylineitem.totalprice,sandbox_opportunitylineitem.listprice,
            sandbox_opportunitylineitem.discount,sandbox_opportunitylineitem.discounted_unit_price,sandbox_opportunitylineitem.end_date,
            sandbox_opportunitylineitem.start_date,sandbox_opportunitylineitem.is_prorated_expansion,sandbox_opportunitylineitem.product_type,
            sandbox_opportunitylineitem.product_line_type,sandbox_opportunitylineitem.subs_id,sandbox_opportunitylineitem.subs_version_id__c,
            sandbox_opportunitylineitem.subs_prev_version_id,sandbox_opportunitylineitem.amount_manual_override,sandbox_opportunitylineitem.new_amount,
            sandbox_opportunitylineitem.renewal_amount,sandbox_opportunitylineitem.expansion_amount,sandbox_opportunitylineitem.coterm_expansion_amount,
            sandbox_opportunitylineitem.leftover_expansion_amount,sandbox_opportunitylineitem.multi_amount,

            lead.email,lead.sfid,lead.converted_date

          ]

  join: sandbox_opportunity {
    view_label: "Oppportunity"
    sql_on: ${sandbox_account.sfid} = ${sandbox_opportunity.accountid} ;;
    relationship: one_to_many
  }

  join: sandbox_opportunitycontactrole {
    view_label: "OCR Contacts"
    sql_on: ${sandbox_opportunity.sfid} = ${sandbox_opportunitycontactrole.opportunityid} ;;
    relationship: one_to_many
  }

  join: opportunitycontactrole_contact {
    view_label: "OCR Contacts"
    from: sandbox_contact
    sql_on: ${sandbox_opportunitycontactrole.contactid} = ${opportunitycontactrole_contact.sfid};;
    relationship: many_to_one
  }

  join: sandbox_billing_entity {
    view_label: "Billing Entity"
    sql_on: ${sandbox_billing_entity.sfid} = ${sandbox_opportunity.billing_entity_id};;
    relationship: many_to_one
  }

  join: billing_entity_contact {
    from: sandbox_contact
    sql_on: ${sandbox_billing_entity.contactid} = ${billing_entity_contact.sfid};;
    relationship: many_to_one
  }

  join: lead {
    from: lead
    sql_on: ${billing_entity_contact.duplicate_lead_id} = ${lead.sfid} ;;
    relationship: many_to_one
  }

  join: sandbox_opportunitylineitem {
    view_label: "Opportunity Line Item"
    sql_on: ${sandbox_opportunity.sfid} = ${sandbox_opportunitylineitem.opportunityid} ;;
    relationship: many_to_one
  }

  join: account_csm {
    from: user
    sql_on: ${sandbox_account.csm_lookup} = ${account_csm.sfid} ;;
    relationship: many_to_one
    fields: []
  }

  join: account_owner {
    from: user
    sql_on: ${sandbox_account.ownerid} = ${account_owner.sfid} ;;
    relationship: many_to_one
    fields: []
  }

  join: product2 {
    view_label: "Opportunity Line Item"
    sql_on: ${sandbox_opportunitylineitem.product2id} = ${product2.sfid} ;;
    relationship: many_to_one
    fields: [product2.name]
  }

  join: parent_account {
    from: sandbox_account
    view_label: "Parent Account"
    sql_on: ${parent_account.sfid} = ${sandbox_account.parentid} ;;
    relationship: many_to_one
    fields: []
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
  fields: [lead.sfid, lead.ownerid, lead.status, lead.email, lead.status, lead.status_order, lead.converted_time, lead.created_time, lead.systemmodstamp_time, lead.count,
          orgm_lead_data_check.sfid, orgm_lead_data_check.ownerid, orgm_lead_data_check.email, orgm_lead_data_check.status, orgm_lead_data_check.converted_time,
          orgm_lead_data_check.created_time, orgm_lead_data_check.systemmodstamp_time, orgm_lead_data_check.count,
          orgm_lead_data_check.processed_time, delete_history.name,delete_history.deleted_time]
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

explore: user_sales_reps {
  from:  user
  label: "Sales Reps"
  group_label: "zHeroku Postgres OrgM"
  sql_always_where: ${owner_type} IN ('Field Rep', 'Commercial Rep', 'Sales Mgt');;
}
