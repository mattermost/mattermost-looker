view: lead {
  sql_table_name: testing_orgm.lead ;;

  dimension: campaign_id__c {
    type: string
    sql: ${TABLE}."campaign_id__c" ;;
  }

  dimension: channel__c {
    type: string
    sql: ${TABLE}."channel__c" ;;
  }

  dimension: channel_detail__c {
    type: string
    sql: ${TABLE}."channel_detail__c" ;;
  }

  dimension: company {
    type: string
    sql: ${TABLE}."company" ;;
  }

  dimension: convertedaccountid {
    type: string
    sql: ${TABLE}."convertedaccountid" ;;
  }

  dimension: convertedcontactid {
    type: string
    sql: ${TABLE}."convertedcontactid" ;;
  }

  dimension_group: converteddate {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."converteddate" ;;
  }

  dimension: convertedopportunityid {
    type: string
    sql: ${TABLE}."convertedopportunityid" ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}."country" ;;
  }

  dimension: countrycode {
    type: string
    sql: ${TABLE}."countrycode" ;;
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

  dimension: geo__c {
    type: string
    sql: ${TABLE}."geo__c" ;;
  }

  dimension: lastname {
    type: string
    sql: ${TABLE}."lastname" ;;
  }

  dimension: lead_source_detail__c {
    type: string
    sql: ${TABLE}."lead_source_detail__c" ;;
  }

  dimension: lead_source_text__c {
    type: string
    sql: ${TABLE}."lead_source_text__c" ;;
  }

  dimension: lead_type__c {
    type: string
    sql: ${TABLE}."lead_type__c" ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}."name" ;;
  }

  dimension: ownerid {
    type: string
    sql: ${TABLE}."ownerid" ;;
  }

  dimension: phone {
    type: string
    sql: ${TABLE}."phone" ;;
  }

  dimension: postalcode {
    type: string
    sql: ${TABLE}."postalcode" ;;
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

  dimension: statecode {
    type: string
    sql: ${TABLE}."statecode" ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}."status" ;;
  }

  dimension: territory__c {
    type: string
    sql: ${TABLE}."territory__c" ;;
  }

  dimension: website {
    type: string
    sql: ${TABLE}."website" ;;
  }

  measure: count {
    type: count
    drill_fields: [name, lastname, firstname]
  }
}
