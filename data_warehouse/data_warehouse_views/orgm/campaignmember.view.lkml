view: campaignmember {
  sql_table_name: ORGM.CAMPAIGNMEMBER ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.ID ;;
  }

  dimension: _hc_lastop {
    type: string
    sql: ${TABLE}._HC_LASTOP ;;
  }

  dimension_group: _sdc_batched {
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
    sql: ${TABLE}._SDC_BATCHED_AT ;;
  }

  dimension_group: _sdc_extracted {
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
    sql: ${TABLE}._SDC_EXTRACTED_AT ;;
  }

  dimension_group: _sdc_received {
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
    sql: ${TABLE}._SDC_RECEIVED_AT ;;
  }

  dimension: _sdc_sequence {
    type: number
    sql: ${TABLE}._SDC_SEQUENCE ;;
  }

  dimension: _sdc_table_version {
    type: number
    sql: ${TABLE}._SDC_TABLE_VERSION ;;
  }

  dimension: accounttype {
    type: string
    sql: ${TABLE}.ACCOUNTTYPE__C ;;
  }

  dimension: campaignid {
    type: string
    # hidden: yes
    sql: ${TABLE}.CAMPAIGNID ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.CITY ;;
  }

  dimension: companyoraccount {
    type: string
    sql: ${TABLE}.COMPANYORACCOUNT ;;
  }

  dimension: contactid {
    type: string
    sql: ${TABLE}.CONTACTID ;;
  }

  dimension_group: converted_date {
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
    sql: ${TABLE}.CONVERTED_DATE__C ;;
  }

  dimension: cosize {
    type: string
    sql: ${TABLE}.COSIZE__C ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.COUNTRY ;;
  }

  dimension: createdbyid {
    type: string
    sql: ${TABLE}.CREATEDBYID ;;
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
    sql: ${TABLE}.CREATEDDATE ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.DESCRIPTION ;;
  }

  dimension: donotcall {
    type: yesno
    sql: ${TABLE}.DONOTCALL ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.EMAIL ;;
  }

  dimension_group: first_responded_on {
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
    sql: ${TABLE}.FIRST_RESPONDED_ON__C ;;
  }

  dimension: firstname {
    type: string
    sql: ${TABLE}.FIRSTNAME ;;
  }

  dimension_group: firstrespondeddate {
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
    sql: ${TABLE}.FIRSTRESPONDEDDATE ;;
  }

  dimension: g2_k_rank {
    type: number
    sql: ${TABLE}.G2K_RANK__C ;;
  }

  dimension: geo {
    type: string
    sql: ${TABLE}.GEO__C ;;
  }

  dimension: hasoptedoutofemail {
    type: yesno
    sql: ${TABLE}.HASOPTEDOUTOFEMAIL ;;
  }

  dimension: hasoptedoutoffax {
    type: yesno
    sql: ${TABLE}.HASOPTEDOUTOFFAX ;;
  }

  dimension: hasresponded {
    type: yesno
    sql: ${TABLE}.HASRESPONDED ;;
  }

  dimension: isdeleted {
    type: yesno
    sql: ${TABLE}.ISDELETED ;;
  }

  dimension: lastmodifiedbyid {
    type: string
    sql: ${TABLE}.LASTMODIFIEDBYID ;;
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
    sql: ${TABLE}.LASTMODIFIEDDATE ;;
  }

  dimension: lastname {
    type: string
    sql: ${TABLE}.LASTNAME ;;
  }

  dimension: leadid {
    type: string
    # hidden: yes
    sql: ${TABLE}.LEADID ;;
  }

  dimension: leadorcontactid {
    type: string
    sql: ${TABLE}.LEADORCONTACTID ;;
  }

  dimension: leadorcontactownerid {
    type: string
    sql: ${TABLE}.LEADORCONTACTOWNERID ;;
  }

  dimension: leadsource {
    type: string
    sql: ${TABLE}.LEADSOURCE ;;
  }

  dimension: mobilephone {
    type: string
    sql: ${TABLE}.MOBILEPHONE ;;
  }

  dimension: mql {
    type: yesno
    sql: ${TABLE}.MQL__C ;;
  }

  dimension_group: mql_date {
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
    sql: ${TABLE}.MQL_DATE__C ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.NAME ;;
  }

  dimension: named_account {
    type: yesno
    sql: ${TABLE}.NAMED_ACCOUNT__C ;;
  }

  dimension: phone {
    type: string
    sql: ${TABLE}.PHONE ;;
  }

  dimension: postalcode {
    type: string
    sql: ${TABLE}.POSTALCODE ;;
  }

  dimension_group: pql_date {
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
    sql: ${TABLE}.PQL_DATE__C ;;
  }

  dimension: region {
    type: string
    sql: ${TABLE}.REGION__C ;;
  }

  dimension: senior_title {
    type: yesno
    sql: ${TABLE}.SENIOR_TITLE__C ;;
  }

  dimension: sfid {
    type: string
    sql: ${TABLE}.SFID ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.STATE ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.STATUS ;;
  }

  dimension: street {
    type: string
    sql: ${TABLE}.STREET ;;
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
    sql: ${TABLE}.SYSTEMMODSTAMP ;;
  }

  dimension: technical_title {
    type: yesno
    sql: ${TABLE}.TECHNICAL_TITLE__C ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.TITLE ;;
  }

  dimension_group: trial_req_date {
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
    sql: ${TABLE}.TRIAL_REQ_DATE__C ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.TYPE ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      lastname,
      firstname,
      name,
      lead.firstname,
      lead.id,
      lead.lastname,
      lead.name,
      campaign.name,
      campaign.id
    ]
  }
}
