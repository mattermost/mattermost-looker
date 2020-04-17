view: opportunitylineitem {
  sql_table_name: testing_orgm.opportunitylineitem ;;

  dimension: coterm_expansion_amount__c {
    type: number
    sql: ${TABLE}."coterm_expansion_amount__c" ;;
  }

  dimension: dwh_external_id__c {
    type: string
    sql: ${TABLE}."dwh_external_id__c" ;;
  }

  dimension_group: end_date__c {
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
    sql: ${TABLE}."end_date__c" ;;
  }

  dimension: expansion_amount__c {
    type: number
    sql: ${TABLE}."expansion_amount__c" ;;
  }

  dimension: is_prorated_expansion__c {
    type: string
    sql: ${TABLE}."is_prorated_expansion__c" ;;
  }

  dimension: leftover_expansion_amount__c {
    type: number
    sql: ${TABLE}."leftover_expansion_amount__c" ;;
  }

  dimension: listprice {
    type: number
    sql: ${TABLE}."listprice" ;;
  }

  dimension: manual_override {
    type: yesno
    sql: ${TABLE}."manual_override" ;;
  }

  dimension: multi_amount__c {
    type: number
    sql: ${TABLE}."multi_amount__c" ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}."name" ;;
  }

  dimension: new_amount__c {
    type: number
    sql: ${TABLE}."new_amount__c" ;;
  }

  dimension: opportunity__dwh_external_id__c {
    type: string
    sql: ${TABLE}."opportunity__dwh_external_id__c" ;;
  }

  dimension: opportunityid {
    type: string
    sql: ${TABLE}."opportunityid" ;;
  }

  dimension: previous_version_id {
    type: string
    sql: ${TABLE}."previous_version_id" ;;
  }

  dimension: pricebookentryid {
    type: string
    sql: ${TABLE}."pricebookentryid" ;;
  }

  dimension: product2id {
    type: string
    sql: ${TABLE}."product2id" ;;
  }

  dimension: product_type__c {
    type: string
    sql: ${TABLE}."product_type__c" ;;
  }

  dimension: productcode {
    type: string
    sql: ${TABLE}."productcode" ;;
  }

  dimension: quantity {
    type: number
    sql: ${TABLE}."quantity" ;;
  }

  dimension: renewal_amount__c {
    type: number
    sql: ${TABLE}."renewal_amount__c" ;;
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

  dimension_group: start_date__c {
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
    sql: ${TABLE}."start_date__c" ;;
  }

  dimension: subscription_id {
    type: string
    sql: ${TABLE}."subscription_id" ;;
  }

  dimension: term_months__c {
    type: number
    sql: ${TABLE}."term_months__c" ;;
  }

  dimension: totalprice {
    type: number
    sql: ${TABLE}."totalprice" ;;
  }

  dimension: unitprice {
    type: number
    sql: ${TABLE}."unitprice" ;;
  }

  dimension: version_id {
    type: string
    sql: ${TABLE}."version_id" ;;
  }

  measure: count {
    type: count
    drill_fields: [name]
  }
}
