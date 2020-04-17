view: account {
  sql_table_name: testing_orgm.account ;;

  dimension: account_owner {
    type: string
    sql: ${account_owner.name} ;;
  }

  dimension: billingcity {
    type: string
    sql: ${TABLE}."billingcity" ;;
  }

  dimension: billingcountry {
    type: string
    sql: ${TABLE}."billingcountry" ;;
  }

  dimension: billingcountrycode {
    type: string
    sql: ${TABLE}."billingcountrycode" ;;
  }

  dimension: billingpostalcode {
    type: string
    sql: ${TABLE}."billingpostalcode" ;;
  }

  dimension: billingstate {
    type: string
    sql: ${TABLE}."billingstate" ;;
  }

  dimension: billingstatecode {
    type: string
    sql: ${TABLE}."billingstatecode" ;;
  }

  dimension: billingstreet {
    type: string
    sql: ${TABLE}."billingstreet" ;;
  }

  dimension: company_type__c {
    type: string
    sql: ${TABLE}."company_type__c" ;;
  }

  dimension: csm_lookup__c {
    type: string
    sql: ${TABLE}."csm_lookup__c" ;;
  }

  dimension: csm_override__c {
    type: yesno
    sql: ${TABLE}."csm_override__c" ;;
  }

  dimension: dwh_external_id__c {
    type: string
    sql: ${TABLE}."dwh_external_id__c" ;;
  }

  dimension: geo__c {
    type: string
    sql: ${TABLE}."geo__c" ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}."name" ;;
  }

  dimension: ownerid {
    type: string
    sql: ${TABLE}."ownerid" ;;
  }

  dimension: parentid {
    type: string
    sql: ${TABLE}."parentid" ;;
  }

  dimension: region__c {
    type: string
    sql: ${TABLE}."region__c" ;;
  }

  dimension: scenario {
    type: string
    sql: ${TABLE}."scenario" ;;
  }

  dimension: scenario_category {
    type: string
    sql: ${TABLE}."scenario_category" ;;
  }

  dimension: sfid {
    type: string
    sql: ${TABLE}."sfid" ;;
  }

  dimension: territory__c {
    type: string
    sql: ${TABLE}."territory__c" ;;
  }

  dimension: territoryid__c {
    type: string
    sql: ${TABLE}."territoryid__c" ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}."type" ;;
  }

  dimension: website {
    type: string
    sql: ${TABLE}."website" ;;
  }

  measure: count {
    type: count
    drill_fields: [name]
  }
}
