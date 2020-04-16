view: territory {
  sql_table_name: testing_orgm.territory__c ;;

  dimension: commercial_rep__c {
    type: string
    sql: ${TABLE}."commercial_rep__c" ;;
  }

  dimension: country_code__c {
    type: string
    sql: ${TABLE}."country_code__c" ;;
  }

  dimension: country_name__c {
    type: string
    sql: ${TABLE}."country_name__c" ;;
  }

  dimension: field_rep__c {
    type: string
    sql: ${TABLE}."field_rep__c" ;;
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

  dimension: region__c {
    type: string
    sql: ${TABLE}."region__c" ;;
  }

  dimension: renewal_rep__c {
    type: string
    sql: ${TABLE}."renewal_rep__c" ;;
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

  dimension: state_code__c {
    type: string
    sql: ${TABLE}."state_code__c" ;;
  }

  dimension: state_name__c {
    type: string
    sql: ${TABLE}."state_name__c" ;;
  }

  dimension: territory__c {
    type: string
    sql: ${TABLE}."territory__c" ;;
  }

  measure: count {
    type: count
    drill_fields: [name]
  }
}
