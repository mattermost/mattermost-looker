view: lead {
  sql_table_name: testing_orgm.lead ;;

  dimension: campaign_id {
    group_label: "Marketing"
    type: string
    sql: ${TABLE}."campaign_id__c" ;;
  }

  dimension: channel {
    group_label: "Marketing"
    type: string
    sql: ${TABLE}."channel__c" ;;
  }

  dimension: channel_detail {
    group_label: "Marketing"
    type: string
    sql: ${TABLE}."channel_detail__c" ;;
  }

  dimension: company {
    type: string
    sql: ${TABLE}."company" ;;
  }

  dimension: convertedaccountid {
    group_label: "Converted"
    type: string
    sql: ${TABLE}."convertedaccountid" ;;
  }

  dimension: convertedcontactid {
    group_label: "Converted"
    type: string
    sql: ${TABLE}."convertedcontactid" ;;
  }

  dimension: converted_date {
    group_label: "Converted"
    type: date
    sql: ${TABLE}."converteddate" ;;
  }

  dimension: convertedopportunityid {
    group_label: "Converted"
    type: string
    sql: ${TABLE}."convertedopportunityid" ;;
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
    label: "First Name"
    type: string
    sql: ${TABLE}."firstname" ;;
  }

  dimension: lastname {
    group_label: "Personal Info"
    label: "Last Name"
    type: string
    sql: ${TABLE}."lastname" ;;
  }

  dimension: lead_source_detail {
    group_label: "Marketing"
    type: string
    sql: ${TABLE}."lead_source_detail__c" ;;
  }

  dimension: lead_source_text {
    group_label: "Marketing"
    type: string
    sql: ${TABLE}."lead_source_text__c" ;;
  }

  dimension: lead_type {
    group_label: "Marketing"
    type: string
    sql: ${TABLE}."lead_type__c" ;;
  }

  dimension: name {
    group_label: "Personal Info"
    type: string
    sql: ${TABLE}."name" ;;
  }

  dimension: ownerid {
    hidden: yes
    type: string
    sql: ${TABLE}."ownerid" ;;
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

  dimension: status {
    group_label: "Marketing"
    type: string
    sql: ${TABLE}."status" ;;
  }

  dimension: website {
    type: string
    sql: ${TABLE}."website" ;;
  }

}
