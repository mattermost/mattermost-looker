view: account {
  sql_table_name: testing_orgm.account ;;

  dimension: account_owner {
    group_label: "Owners"
    type: string
    sql: ${account_owner.name} ;;
  }

  dimension: billingcity {
    group_label: "Billing Address"
    type: string
    sql: ${TABLE}."billingcity" ;;
  }

  dimension: billingcountry {
    group_label: "Billing Address"
    type: string
    sql: ${TABLE}."billingcountry" ;;
  }

  dimension: billingcountrycode {
    group_label: "Billing Address"
    type: string
    sql: ${TABLE}."billingcountrycode" ;;
  }

  dimension: billingpostalcode {
    group_label: "Billing Address"
    type: string
    sql: ${TABLE}."billingpostalcode" ;;
  }

  dimension: billingstate {
    group_label: "Billing Address"
    type: string
    sql: ${TABLE}."billingstate" ;;
  }

  dimension: billingstatecode {
    group_label: "Billing Address"
    type: string
    sql: ${TABLE}."billingstatecode" ;;
  }

  dimension: billingstreet {
    group_label: "Billing Address"
    type: string
    sql: ${TABLE}."billingstreet" ;;
  }

  dimension: company_type {
    type: string
    sql: ${TABLE}."company_type__c" ;;
  }

  dimension: csm_lookup {
    hidden: yes
    type: string
    sql: ${TABLE}."csm_lookup__c" ;;
  }

  dimension: csm_override {
    group_label: "Owners"
    type: yesno
    sql: ${TABLE}."csm_override__c" ;;
  }

  dimension: dwh_external_id {
    hidden: yes
    type: string
    sql: ${TABLE}."dwh_external_id__c" ;;
  }

  dimension: geo {
    type: string
    sql: ${TABLE}."geo__c" ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}."name" ;;
  }

  dimension: ownerid {
    hidden: yes
    type: string
    sql: ${TABLE}."ownerid" ;;
  }

  dimension: parentid {
    hidden: yes
    type: string
    sql: ${TABLE}."parentid" ;;
  }

  dimension: region {
    type: string
    sql: ${TABLE}."region__c" ;;
  }

  dimension: scenario {
    group_label: "Scenario"
    type: string
    sql: ${TABLE}."scenario" ;;
  }

  dimension: scenario_category {
    group_label: "Scenario"
    type: string
    sql: ${TABLE}."scenario_category" ;;
  }

  dimension: sfid {
    hidden: yes
    type: string
    sql: ${TABLE}."sfid" ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}."type" ;;
  }

  dimension: website {
    type: string
    sql: ${TABLE}."website" ;;
  }

}
