view: product2 {
  sql_table_name: orgm.product2 ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: _hc_err {
    type: string
    sql: ${TABLE}._hc_err ;;
  }

  dimension: _hc_lastop {
    type: string
    sql: ${TABLE}._hc_lastop ;;
  }

  dimension: createdbyid {
    type: string
    sql: ${TABLE}.createdbyid ;;
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
    sql: ${TABLE}.createddate ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: displayurl {
    type: string
    sql: ${TABLE}.displayurl ;;
  }

  dimension: family {
    type: string
    sql: ${TABLE}.family ;;
  }

  dimension: isactive {
    type: yesno
    sql: ${TABLE}.isactive ;;
  }

  dimension: isdeleted {
    type: yesno
    sql: ${TABLE}.isdeleted ;;
  }

  dimension: lastmodifiedbyid {
    type: string
    sql: ${TABLE}.lastmodifiedbyid ;;
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
    sql: ${TABLE}.lastmodifieddate ;;
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
    sql: ${TABLE}.lastreferenceddate ;;
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
    sql: ${TABLE}.lastvieweddate ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: netsuite_conn__celigo_update {
    type: yesno
    sql: ${TABLE}.netsuite_conn__celigo_update__c ;;
  }

  dimension: netsuite_conn__item_category {
    type: string
    sql: ${TABLE}.netsuite_conn__item_category__c ;;
  }

  dimension: netsuite_conn__netsuite_id {
    type: string
    sql: ${TABLE}.netsuite_conn__netsuite_id__c ;;
  }

  dimension: netsuite_conn__netsuite_item_type {
    type: string
    sql: ${TABLE}.netsuite_conn__netsuite_item_type__c ;;
  }

  dimension: netsuite_conn__netsuite_sync_err {
    type: string
    sql: ${TABLE}.netsuite_conn__netsuite_sync_err__c ;;
  }

  dimension: netsuite_conn__push_to_netsuite {
    type: yesno
    sql: ${TABLE}.netsuite_conn__push_to_netsuite__c ;;
  }

  dimension: netsuite_conn__sub_type {
    type: string
    sql: ${TABLE}.netsuite_conn__sub_type__c ;;
  }

  dimension: netsuite_conn__sync_in_progress {
    type: yesno
    sql: ${TABLE}.netsuite_conn__sync_in_progress__c ;;
  }

  dimension: netsuite_conn__term_contract_pricing_type {
    type: string
    sql: ${TABLE}.netsuite_conn__term_contract_pricing_type__c ;;
  }

  dimension: product_id_18_digit {
    type: string
    sql: ${TABLE}.product_id_18_digit__c ;;
  }

  dimension: product_id {
    type: string
    sql: ${TABLE}.product_id__c ;;
  }

  dimension: productcode {
    type: string
    sql: ${TABLE}.productcode ;;
  }

  dimension: quantityunitofmeasure {
    type: string
    sql: ${TABLE}.quantityunitofmeasure ;;
  }

  dimension: sfid {
    type: string
    sql: ${TABLE}.sfid ;;
  }

  dimension: stockkeepingunit {
    type: string
    sql: ${TABLE}.stockkeepingunit ;;
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
    sql: ${TABLE}.systemmodstamp ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name, opportunitylineitem.count]
  }
}
