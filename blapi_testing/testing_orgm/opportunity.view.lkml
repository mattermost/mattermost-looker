view: opportunity {
  sql_table_name: testing_orgm.opportunity ;;

  dimension: account__dwh_external_id {
    hidden: yes
    group_label: "System"
    type: string
    sql: ${TABLE}."account__dwh_external_id__c" ;;
  }

  dimension: accountid {
    label: "Account ID"
    hidden: yes
    type: string
    sql: ${TABLE}."accountid" ;;
  }

  dimension: amount {
    type: number
    sql: ${TABLE}."amount" ;;
  }

  dimension: closedate {
    label: "Close Date"
    type: date
    sql: ${TABLE}."closedate" ;;
  }

  dimension: csm_override {
    group_label: "Owners"
    type: yesno
    sql: ${TABLE}."csm_override__c" ;;
  }

  dimension: csm_owner {
    group_label: "Owners"
    type: string
    sql: ${TABLE}."csm_owner__c" ;;
  }

  dimension: dwh_external_id {
    hidden: yes
    group_label: "System"
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

  dimension: new_logo {
    type: string
    sql: ${TABLE}."new_logo__c" ;;
  }

  dimension: ownerid {
    hidden: yes
    group_label: "Owners"
    type: string
    sql: ${TABLE}."ownerid" ;;
  }

  dimension: opportunity_owner {
    group_label: "Owners"
    type: string
    sql: ${opportunity_owner.name} ;;
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
    label: "SFID"
    hidden: yes
    type: string
    sql: ${TABLE}."sfid" ;;
  }

  dimension: stagename {
    label: "Stage Name"
    type: string
    sql: ${TABLE}."stagename" ;;
  }

  dimension: territory {
    type: string
    sql: ${TABLE}."territory__c" ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}."type" ;;
  }

}
