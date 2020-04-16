view: opportunity {
  sql_table_name: testing_orgm.opportunity ;;

  dimension: accountid {
    type: string
    sql: ${TABLE}."accountid" ;;
  }

  dimension: amount {
    type: number
    sql: ${TABLE}."amount" ;;
  }

  dimension_group: closedate {
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
    sql: ${TABLE}."closedate" ;;
  }

  dimension: csm_override__c {
    type: yesno
    sql: ${TABLE}."csm_override__c" ;;
  }

  dimension: csm_owner__c {
    type: string
    sql: ${TABLE}."csm_owner__c" ;;
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

  dimension: new_logo__c {
    type: string
    sql: ${TABLE}."new_logo__c" ;;
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

  dimension: stagename {
    type: string
    sql: ${TABLE}."stagename" ;;
  }

  dimension: territory__c {
    type: string
    sql: ${TABLE}."territory__c" ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}."type" ;;
  }

  measure: count {
    type: count
    drill_fields: [name, stagename]
  }
}
