view: contact {
  sql_table_name: testing_orgm.contact ;;

  dimension: accountid {
    type: string
    sql: ${TABLE}."accountid" ;;
  }

  dimension: dwh_external_id__c {
    type: string
    sql: ${TABLE}."dwh_external_id__c" ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}."email" ;;
  }

  dimension: firstname {
    type: string
    sql: ${TABLE}."firstname" ;;
  }

  dimension: lastname {
    type: string
    sql: ${TABLE}."lastname" ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}."name" ;;
  }

  dimension: ownerid {
    type: string
    sql: ${TABLE}."ownerid" ;;
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

  measure: count {
    type: count
    drill_fields: [name, firstname, lastname]
  }
}
