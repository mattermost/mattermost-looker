view: campaignmember {
  sql_table_name: testing_orgm.campaignmember ;;
  view_label: "Campaign Member"

  dimension: campaignid {
    hidden: yes
    type: string
    sql: ${TABLE}."campaignid" ;;
  }

  dimension: city {
    group_label: "Personal Info"
    type: string
    sql: ${TABLE}."city" ;;
  }

  dimension: contactid {
    hidden: yes
    type: string
    sql: ${TABLE}."contactid" ;;
  }

  dimension: country {
    group_label: "Personal Info"
    type: string
    map_layer_name: countries
    sql: ${TABLE}."country" ;;
  }

  dimension: dwh_external_id {
    hidden: yes
    type: string
    sql: ${TABLE}."dwh_external_id__c" ;;
  }

  dimension: email {
    group_label: "Personal Info"
    type: string
    sql: ${TABLE}."email" ;;
  }

  dimension: firstname {
    group_label: "Personal Info"
    type: string
    sql: ${TABLE}."firstname" ;;
  }

  dimension: lastname {
    group_label: "Personal Info"
    type: string
    sql: ${TABLE}."lastname" ;;
  }

  dimension: leadid {
    hidden: yes
    type: string
    sql: ${TABLE}."leadid" ;;
  }

  dimension: leadorcontactid {
    hidden: yes
    type: string
    sql: ${TABLE}."leadorcontactid" ;;
  }

  dimension: leadsource {
    group_label: "Marketing"
    type: string
    sql: ${TABLE}."leadsource" ;;
  }

  dimension: name {
    group_label: "Personal Info"
    type: string
    sql: ${TABLE}."name" ;;
  }

  dimension: phone {
    group_label: "Personal Info"
    type: string
    sql: ${TABLE}."phone" ;;
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

  dimension: state {
    group_label: "Personal Info"
    type: string
    sql: ${TABLE}."state" ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}."status" ;;
  }

  dimension: street {
    group_label: "Personal Info"
    type: string
    sql: ${TABLE}."street" ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}."type" ;;
  }

}
