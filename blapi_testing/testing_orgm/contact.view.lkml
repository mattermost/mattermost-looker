view: contact {
  sql_table_name: testing_orgm.contact ;;

  dimension: accountid {
    hidden: yes
    type: string
    sql: ${TABLE}."accountid" ;;
  }

  dimension: dwh_external_id {
    hidden: yes
    type: string
    sql: ${TABLE}."dwh_external_id__c" ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}."email" ;;
  }

  dimension: firstname {
    hidden: yes
    type: string
    sql: ${TABLE}."firstname" ;;
  }

  dimension: lastname {
    hidden: yes
    type: string
    sql: ${TABLE}."lastname" ;;
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

}
