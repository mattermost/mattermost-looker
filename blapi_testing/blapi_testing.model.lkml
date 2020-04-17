connection: "orgm"

include: "/blapi_testing/testing_blapi/*.view.lkml"
include: "/blapi_testing/testing_orgm/*.view.lkml"



explore: blapi {
  from: customers
  view_name: customers
  group_label: "zzzz BLAPI TESTING"

  join: addresses {
    sql_on: ${addresses.customer_id} = ${customers.id} ;;
    relationship: one_to_many
  }

  join: subscriptions {
    sql_on: ${subscriptions.customer_id} = ${customers.id} ;;
    relationship: one_to_many
  }

  join: subscriptions_version {
    sql_on: ${subscriptions_version.customer_id} = ${customers.id} AND ${subscriptions_version.id} = ${subscriptions.id};;
    relationship: one_to_many
  }
}

explore: account_to_lineitem {
  from: account
  view_name: account
  group_label: "zzzz BLAPI TESTING"

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

  join: opportunitycontactrole {
    sql_on: ${opportunitycontactrole.opportunityid} = ${opportunity.sfid} ;;
    relationship: one_to_many
  }

  join: contact {
    sql_on: ${contact.sfid} = ${opportunitycontactrole.contactid} ;;
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
  from: contact
  view_name: contact
  group_label: "zzzz BLAPI TESTING"

  join: campaignmember {
    sql_on: ${campaignmember.contactid} = ${contact.sfid} ;;
    relationship: one_to_many
  }

  join: campaign {
    sql_on: ${campaign.sfid} = ${campaignmember.campaignid} ;;
    relationship: many_to_one
  }
}
explore: lead {group_label: "zzzz BLAPI TESTING"}
