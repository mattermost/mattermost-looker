view: campaignmember {
  sql_table_name: orgm.campaignmember ;;
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

  dimension: accounttype__c {
    type: string
    sql: ${TABLE}."accounttype__c" ;;
  }

  dimension_group: bizible2__bizible_touchpoint_date__c {
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
    sql: ${TABLE}."bizible2__bizible_touchpoint_date__c" ;;
  }

  dimension: bizible2__touchpoint_status_contact__c {
    type: string
    sql: ${TABLE}."bizible2__touchpoint_status_contact__c" ;;
  }

  dimension_group: bizible2__touchpoint_status_date__c {
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
    sql: ${TABLE}."bizible2__touchpoint_status_date__c" ;;
  }

  dimension: bizible2__touchpoint_status_lead__c {
    type: string
    sql: ${TABLE}."bizible2__touchpoint_status_lead__c" ;;
  }

  dimension: bizible2__touchpoint_status_opportunity__c {
    type: string
    sql: ${TABLE}."bizible2__touchpoint_status_opportunity__c" ;;
  }

  dimension: campaignid {
    type: string
    sql: ${TABLE}."campaignid" ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}."city" ;;
  }

  dimension: companyoraccount {
    type: string
    sql: ${TABLE}."companyoraccount" ;;
  }

  dimension: contact_us_notes__c {
    type: string
    sql: ${TABLE}."contact_us_notes__c" ;;
  }

  dimension: contactid {
    type: string
    sql: ${TABLE}."contactid" ;;
  }

  dimension_group: converted_date__c {
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
    sql: ${TABLE}."converted_date__c" ;;
  }

  dimension: cosize__c {
    type: string
    sql: ${TABLE}."cosize__c" ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}."country" ;;
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

  dimension: description {
    type: string
    sql: ${TABLE}."description" ;;
  }

  dimension: donotcall {
    type: yesno
    sql: ${TABLE}."donotcall" ;;
  }

  dimension_group: e_purchase_date__c {
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
    sql: ${TABLE}."e_purchase_date__c" ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}."email" ;;
  }

  dimension: fax {
    type: string
    sql: ${TABLE}."fax" ;;
  }

  dimension_group: first_responded_on__c {
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
    sql: ${TABLE}."first_responded_on__c" ;;
  }

  dimension: firstname {
    type: string
    sql: ${TABLE}."firstname" ;;
  }

  dimension_group: firstrespondeddate {
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
    sql: ${TABLE}."firstrespondeddate" ;;
  }

  dimension: g2k_rank__c {
    type: number
    sql: ${TABLE}."g2k_rank__c" ;;
  }

  dimension: geo__c {
    type: string
    sql: ${TABLE}."geo__c" ;;
  }

  dimension: hasoptedoutofemail {
    type: yesno
    sql: ${TABLE}."hasoptedoutofemail" ;;
  }

  dimension: hasoptedoutoffax {
    type: yesno
    sql: ${TABLE}."hasoptedoutoffax" ;;
  }

  dimension: hasresponded {
    type: yesno
    sql: ${TABLE}."hasresponded" ;;
  }

  dimension: isdeleted {
    type: yesno
    sql: ${TABLE}."isdeleted" ;;
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

  dimension: lastname {
    type: string
    sql: ${TABLE}."lastname" ;;
  }

  dimension: lead_source__c {
    type: string
    sql: ${TABLE}."lead_source__c" ;;
  }

  dimension_group: leadcontact_create_date__c {
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
    sql: ${TABLE}."leadcontact_create_date__c" ;;
  }

  dimension: leadid {
    type: string
    sql: ${TABLE}."leadid" ;;
  }

  dimension: leadorcontactid {
    type: string
    sql: ${TABLE}."leadorcontactid" ;;
  }

  dimension: leadorcontactownerid {
    type: string
    sql: ${TABLE}."leadorcontactownerid" ;;
  }

  dimension: leadsource {
    type: string
    sql: ${TABLE}."leadsource" ;;
  }

  dimension: marketing_ops_fix_detail__c {
    type: string
    sql: ${TABLE}."marketing_ops_fix_detail__c" ;;
  }

  dimension: member_channel__c {
    type: string
    sql: ${TABLE}."member_channel__c" ;;
  }

  dimension: member_channel_campaign__c {
    type: string
    sql: ${TABLE}."member_channel_campaign__c" ;;
  }

  dimension: member_channel_detail__c {
    type: string
    sql: ${TABLE}."member_channel_detail__c" ;;
  }

  dimension: mobilephone {
    type: string
    sql: ${TABLE}."mobilephone" ;;
  }

  dimension: mql__c {
    type: yesno
    sql: ${TABLE}."mql__c" ;;
  }

  dimension_group: mql_date__c {
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
    sql: ${TABLE}."mql_date__c" ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}."name" ;;
  }

  dimension: named_account__c {
    type: yesno
    sql: ${TABLE}."named_account__c" ;;
  }

  dimension: nurture_persona__c {
    type: string
    sql: ${TABLE}."nurture_persona__c" ;;
  }

  dimension: phone {
    type: string
    sql: ${TABLE}."phone" ;;
  }

  dimension: postalcode {
    type: string
    sql: ${TABLE}."postalcode" ;;
  }

  dimension_group: pql_date__c {
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
    sql: ${TABLE}."pql_date__c" ;;
  }

  dimension: region__c {
    type: string
    sql: ${TABLE}."region__c" ;;
  }

  dimension: salutation {
    type: string
    sql: ${TABLE}."salutation" ;;
  }

  dimension: senior_title__c {
    type: yesno
    sql: ${TABLE}."senior_title__c" ;;
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

  dimension: technical_title__c {
    type: yesno
    sql: ${TABLE}."technical_title__c" ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}."title" ;;
  }

  dimension_group: trial_req_date__c {
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
    sql: ${TABLE}."trial_req_date__c" ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}."type" ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name, lastname, firstname]
  }
}
