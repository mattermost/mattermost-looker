view: billing_entity {
  sql_table_name: orgm.billing_entity__c ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }

  dimension: _hc_err {
    type: string
    sql: ${TABLE}."_hc_err" ;;
  }

  dimension: _hc_lastop {
    type: string
    sql: ${TABLE}."_hc_lastop" ;;
  }

  dimension: createdbyid {
    type: string
    sql: ${TABLE}."createdbyid" ;;
  }

  dimension_group: createddate {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."createddate" ;;
  }

  dimension: cust_company {
    type: string
    sql: ${TABLE}."cust_company__c" ;;
  }

  dimension: cust_email {
    type: string
    sql: ${TABLE}."cust_email__c" ;;
  }

  dimension: cust_firstname {
    type: string
    sql: ${TABLE}."cust_firstname__c" ;;
  }

  dimension: cust_id {
    type: string
    sql: ${TABLE}."cust_id__c" ;;
  }

  dimension: cust_lastname {
    type: string
    sql: ${TABLE}."cust_lastname__c" ;;
  }

  dimension: cust_payment_method {
    type: string
    sql: ${TABLE}."cust_payment_method__c" ;;
  }

  dimension: cust_payment_method_detail {
    type: string
    sql: ${TABLE}."cust_payment_method_detail__c" ;;
  }

  dimension: dwh_external_id {
    type: string
    sql: ${TABLE}."dwh_external_id__c" ;;
  }

  dimension: isdeleted {
    type: yesno
    sql: ${TABLE}."isdeleted" ;;
  }

  dimension_group: lastactivitydate {
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
    sql: ${TABLE}."lastactivitydate" ;;
  }

  dimension: lastmodifiedbyid {
    type: string
    sql: ${TABLE}."lastmodifiedbyid" ;;
  }

  dimension_group: lastmodifieddate {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."lastmodifieddate" ;;
  }

  dimension_group: lastreferenceddate {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."lastreferenceddate" ;;
  }

  dimension_group: lastvieweddate {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."lastvieweddate" ;;
  }

  dimension: contactid {
    type: string
    sql: ${TABLE}."lu_contactid__c" ;;
  }

  dimension: lu_contactid__r__dwh_external_id {
    type: string
    sql: ${TABLE}."lu_contactid__r__dwh_external_id__c" ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}."name" ;;
  }

  dimension: ownerid {
    type: string
    sql: ${TABLE}."ownerid" ;;
  }

  dimension: sfid {
    type: string
    sql: ${TABLE}."sfid" ;;
  }

  dimension_group: systemmodstamp {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."systemmodstamp" ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name]
  }
}
