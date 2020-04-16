view: campaignmember {
  sql_table_name: testing_orgm.campaignmember ;;

  dimension: campaignid {
    type: string
    sql: ${TABLE}."campaignid" ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}."city" ;;
  }

  dimension: contactid {
    type: string
    sql: ${TABLE}."contactid" ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}."country" ;;
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

  dimension: leadid {
    type: string
    sql: ${TABLE}."leadid" ;;
  }

  dimension: leadorcontactid {
    type: string
    sql: ${TABLE}."leadorcontactid" ;;
  }

  dimension: leadsource {
    type: string
    sql: ${TABLE}."leadsource" ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}."name" ;;
  }

  dimension: phone {
    type: string
    sql: ${TABLE}."phone" ;;
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

  dimension: state {
    type: string
    sql: ${TABLE}."state" ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}."status" ;;
  }

  dimension: street {
    type: string
    sql: ${TABLE}."street" ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}."type" ;;
  }

  measure: count {
    type: count
    drill_fields: [name, firstname, lastname]
  }
}
