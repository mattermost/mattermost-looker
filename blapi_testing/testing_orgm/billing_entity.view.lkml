view: billing_entity {
  sql_table_name: testing_orgm.billing_entity__c ;;

  dimension: company__c {
    type: string
    sql: ${TABLE}."company__c" ;;
  }

  dimension: contactid__c {
    type: string
    sql: ${TABLE}."contactid__c" ;;
  }

  dimension: email__c {
    type: string
    sql: ${TABLE}."email__c" ;;
  }

  dimension: firstname__c {
    type: string
    sql: ${TABLE}."firstname__c" ;;
  }

  dimension: lastname__c {
    type: string
    sql: ${TABLE}."lastname__c" ;;
  }

  dimension: payment_method__c {
    type: string
    sql: ${TABLE}."payment_method__c" ;;
  }

  dimension: payment_method_detail__c {
    type: string
    sql: ${TABLE}."payment_method_detail__c" ;;
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

}
