view: campaign {
  sql_table_name: ORGM.CAMPAIGN ;;
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

  dimension: amountallopportunities {
    type: number
    sql: ${TABLE}.AMOUNTALLOPPORTUNITIES ;;
  }

  dimension: amountwonopportunities {
    type: number
    sql: ${TABLE}.AMOUNTWONOPPORTUNITIES ;;
  }

  dimension: bizible2__bizible_attribution_synctype {
    type: string
    sql: ${TABLE}.BIZIBLE2__BIZIBLE_ATTRIBUTION_SYNCTYPE__C ;;
  }

  dimension: bizible2__uniqueid {
    type: string
    sql: ${TABLE}.BIZIBLE2__UNIQUEID__C ;;
  }

  dimension: campaign_offer {
    type: string
    sql: ${TABLE}.CAMPAIGN_OFFER__C ;;
  }

  dimension: campaign_offer_detail {
    type: string
    sql: ${TABLE}.CAMPAIGN_OFFER_DETAIL__C ;;
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

  dimension: dscorgpkg__suppress_from_discoverorg {
    type: yesno
    sql: ${TABLE}.DSCORGPKG__SUPPRESS_FROM_DISCOVERORG__C ;;
  }

  dimension: expectedresponse {
    type: number
    sql: ${TABLE}.EXPECTEDRESPONSE ;;
  }

  dimension: hierarchyactualcost {
    type: number
    sql: ${TABLE}.HIERARCHYACTUALCOST ;;
  }

  dimension: hierarchyamountallopportunities {
    type: number
    sql: ${TABLE}.HIERARCHYAMOUNTALLOPPORTUNITIES ;;
  }

  dimension: hierarchyamountwonopportunities {
    type: number
    sql: ${TABLE}.HIERARCHYAMOUNTWONOPPORTUNITIES ;;
  }

  dimension: hierarchybudgetedcost {
    type: number
    sql: ${TABLE}.HIERARCHYBUDGETEDCOST ;;
  }

  dimension: hierarchyexpectedrevenue {
    type: number
    sql: ${TABLE}.HIERARCHYEXPECTEDREVENUE ;;
  }

  dimension: hierarchynumberofcontacts {
    type: number
    sql: ${TABLE}.HIERARCHYNUMBEROFCONTACTS ;;
  }

  dimension: hierarchynumberofconvertedleads {
    type: number
    sql: ${TABLE}.HIERARCHYNUMBEROFCONVERTEDLEADS ;;
  }

  dimension: hierarchynumberofleads {
    type: number
    sql: ${TABLE}.HIERARCHYNUMBEROFLEADS ;;
  }

  dimension: hierarchynumberofopportunities {
    type: number
    sql: ${TABLE}.HIERARCHYNUMBEROFOPPORTUNITIES ;;
  }

  dimension: hierarchynumberofresponses {
    type: number
    sql: ${TABLE}.HIERARCHYNUMBEROFRESPONSES ;;
  }

  dimension: hierarchynumberofwonopportunities {
    type: number
    sql: ${TABLE}.HIERARCHYNUMBEROFWONOPPORTUNITIES ;;
  }

  dimension: hierarchynumbersent {
    type: number
    sql: ${TABLE}.HIERARCHYNUMBERSENT ;;
  }

  dimension: isactive {
    type: yesno
    sql: ${TABLE}.ISACTIVE ;;
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

  dimension: name {
    type: string
    sql: ${TABLE}.NAME ;;
  }

  dimension: numberofcontacts {
    type: number
    sql: ${TABLE}.NUMBEROFCONTACTS ;;
  }

  dimension: numberofconvertedleads {
    type: number
    sql: ${TABLE}.NUMBEROFCONVERTEDLEADS ;;
  }

  dimension: numberofleads {
    type: number
    sql: ${TABLE}.NUMBEROFLEADS ;;
  }

  dimension: numberofopportunities {
    type: number
    sql: ${TABLE}.NUMBEROFOPPORTUNITIES ;;
  }

  dimension: numberofresponses {
    type: number
    sql: ${TABLE}.NUMBEROFRESPONSES ;;
  }

  dimension: numberofwonopportunities {
    type: number
    sql: ${TABLE}.NUMBEROFWONOPPORTUNITIES ;;
  }

  dimension: numbersent {
    type: number
    sql: ${TABLE}.NUMBERSENT ;;
  }

  dimension: ownerid {
    type: string
    sql: ${TABLE}.OWNERID ;;
  }

  dimension: parentid {
    type: string
    sql: ${TABLE}.PARENTID ;;
  }

  dimension: sfid {
    type: string
    sql: ${TABLE}.SFID ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.STATUS ;;
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

  dimension: type {
    type: string
    sql: ${TABLE}.TYPE ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name, campaignmember.count]
  }
}
