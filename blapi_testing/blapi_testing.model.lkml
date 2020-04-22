connection: "orgm"

include: "/blapi_testing/testing_blapi/*.view.lkml"
include: "/blapi_testing/testing_orgm/*.view.lkml"

explore: scenarios {
  label: "{ blapi } Scenarios"
  group_label: "zzz { blapi } TESTING"
}

explore: blapi {
  label: "{ blapi }"
  from: scenarios
  view_name: scenarios
  group_label: "zzz { blapi } TESTING"

  join: customers {
    sql_on: ${scenarios.id} = ${customers.scenario} ;;
    relationship: one_to_many
  }

  join: addresses {
    sql_on: ${addresses.customer_id} = ${customers.id} AND ${addresses.scenario} = ${scenarios.id};;
    relationship: one_to_many
  }

  join: subscriptions {
    sql_on: ${subscriptions.customer_id} = ${customers.id} AND ${subscriptions.scenario} = ${scenarios.id};;
    relationship: one_to_many
  }

  join: subscriptions_version {
    sql_on: ${subscriptions_version.customer_id} = ${customers.id} AND ${subscriptions_version.id} = ${subscriptions.id} AND ${subscriptions_version.scenario} = ${scenarios.id};;
    relationship: one_to_many
  }
}

explore: account_to_line_item {
  label: "{ blapi } Account to Line Item"
  from: scenarios
  view_name: scenarios
  group_label: "zzz { blapi } TESTING"

  join: account {
    sql_on: ${scenarios.id} = ${account.scenario} ;;
    relationship: one_to_many
  }

  join: account_contact {
    from: contact
    sql_on: ${account.sfid} = ${account_contact.accountid} ;;
    relationship: one_to_many
  }

  join: account_owner {
    from: user
    sql_on: ${account.ownerid} = ${account_owner.sfid} ;;
    relationship: many_to_one
    fields: []
  }

  join: opportunity {
    sql_on: ${opportunity.accountid} = ${account.sfid} ;;
    relationship: one_to_many
  }

  join: opportunity_owner {
    from: user
    sql_on: ${opportunity.ownerid} = ${opportunity_owner.sfid} ;;
    relationship: many_to_one
    fields: []
  }

  join: opportunitylineitem {
    view_label: "Opportunity Line Item"
    sql_on: ${opportunitylineitem.opportunityid} = ${opportunity.sfid} ;;
    relationship: one_to_many
  }

  join: subscriptions_version {
    sql_on: ${subscriptions_version.version_id} = ${opportunitylineitem.version_id} AND ${subscriptions_version.id} = ${opportunitylineitem.subscription_id};;
    relationship: one_to_one
  }

  join: opportunitycontactrole {
    sql_on: ${opportunitycontactrole.opportunityid} = ${opportunity.sfid} ;;
    relationship: one_to_many
  }

  join: opportunity_contact_role_contact {
    from: contact
    sql_on: ${opportunity_contact_role_contact.sfid} = ${opportunitycontactrole.contactid} ;;
    relationship: many_to_one
  }

  join: product {
    view_label: "Opportunity Line Item"
    sql_on: ${product.sfid} = ${opportunitylineitem.product2id} ;;
    relationship: many_to_one
    fields: [product.name]
  }

  join: pricebookentry {
    view_label: "Opportunity Line Item"
    sql_on: ${pricebookentry.product2id} = ${product.sfid} ;;
    relationship: one_to_many
    fields: [pricebookentry.unitprice]
  }
}

explore: sales_requests {
  label: "{ blapi } Sales Requests"
  from: scenarios
  view_name: scenarios
  group_label: "zzz { blapi } TESTING"

  join: contact {
    sql_on: ${scenarios.id} = ${contact.scenario} ;;
    relationship: one_to_many
  }

  join: campaignmember {
    sql_on: ${campaignmember.contactid} = ${contact.sfid} ;;
    relationship: one_to_many
  }

  join: campaign {
    sql_on: ${campaign.sfid} = ${campaignmember.campaignid} ;;
    relationship: many_to_one
  }
}

explore: lead_explore {
  label: "{ blapi } Lead Explore"
  from: scenarios
  view_name: scenarios
  group_label: "zzz { blapi } TESTING"

  join: lead {
    sql_on: ${scenarios.id} = ${lead.scenario} ;;
    relationship: one_to_many
  }

  join: lead_contact {
    from: contact
    sql_on: ${lead_contact.sfid} = ${lead.convertedcontactid} ;;
    relationship: one_to_one
  }

  join: lead_account {
    from: account
    sql_on: ${lead_account.sfid} = ${lead.convertedaccountid} ;;
    relationship: one_to_one
  }

  join: lead_opportunity {
    from: opportunity
    sql_on: ${lead_opportunity.sfid} = ${lead.convertedopportunityid} ;;
    relationship: one_to_one
  }

  join: lead_opportunity_account {
    from: account
    sql_on: ${lead_opportunity_account.sfid} = ${lead_opportunity.accountid} ;;
    relationship: one_to_one
  }

  join: account_owner {
    from: user
    sql_on: ${lead_account.ownerid} = ${account_owner.sfid} ;;
    relationship: many_to_one
    fields: []
  }

  join: opportunity {
    sql_on: ${opportunity.accountid} = ${lead_account.sfid} ;;
    relationship: one_to_many
  }

  join: opportunity_owner {
    from: user
    sql_on: ${opportunity.ownerid} = ${opportunity_owner.sfid} ;;
    relationship: many_to_one
    fields: []
  }

  join: opportunitylineitem {
    view_label: "Opportunity Line Item"
    sql_on: ${opportunitylineitem.opportunityid} = ${opportunity.sfid} ;;
    relationship: one_to_many
  }

  join: opportunitycontactrole {
    sql_on: ${opportunitycontactrole.opportunityid} = ${opportunity.sfid} ;;
    relationship: one_to_many
  }

  join: opportunity_contact {
    from: contact
    sql_on: ${opportunity_contact.sfid} = ${opportunitycontactrole.contactid} ;;
    relationship: many_to_one
  }

  join: product {
    view_label: "Opportunity Line Item"
    sql_on: ${product.sfid} = ${opportunitylineitem.product2id} ;;
    relationship: many_to_one
    fields: [product.name]
  }

  join: pricebookentry {
    view_label: "Opportunity Line Item"
    sql_on: ${pricebookentry.product2id} = ${product.sfid} ;;
    relationship: one_to_many
    fields: [pricebookentry.unitprice]
  }

}
