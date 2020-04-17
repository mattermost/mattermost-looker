view: opportunitylineitem {
  sql_table_name: testing_orgm.opportunitylineitem ;;

  dimension: coterm_expansion_amount {
    group_label: "Sales Ops"
    type: number
    sql: ${TABLE}."coterm_expansion_amount__c" ;;
  }

  dimension: dwh_external_id {
    hidden: yes
    group_label: "System"
    type: string
    sql: ${TABLE}."dwh_external_id__c" ;;
  }

  dimension: end_date {
    label: "License End Date"
    type: date
    sql: ${TABLE}."end_date__c" ;;
  }

  dimension: expansion_amount {
    group_label: "Sales Ops"
    type: number
    sql: ${TABLE}."expansion_amount__c" ;;
  }

  dimension: is_prorated_expansion {
    group_label: "Sales Ops"
    type: string
    sql: ${TABLE}."is_prorated_expansion__c" ;;
  }

  dimension: leftover_expansion_amount {
    group_label: "Sales Ops"
    type: number
    sql: ${TABLE}."leftover_expansion_amount__c" ;;
  }

  dimension: listprice {
    group_label: "Pricing"
    type: number
    sql: ${TABLE}."listprice" ;;
  }

  dimension: manual_override {
    group_label: "Sales Ops"
    type: yesno
    sql: ${TABLE}."manual_override" ;;
  }

  dimension: multi_amount {
    group_label: "Sales Ops"
    type: number
    sql: ${TABLE}."multi_amount__c" ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}."name" ;;
  }

  dimension: new_amount {
    group_label: "Sales Ops"
    type: number
    sql: ${TABLE}."new_amount__c" ;;
  }

  dimension: opportunity__dwh_external_id {
    hidden: yes
    group_label: "System"
    type: string
    sql: ${TABLE}."opportunity__dwh_external_id__c" ;;
  }

  dimension: opportunityid {
    hidden: yes
    label: "Opportunity ID"
    type: string
    sql: ${TABLE}."opportunityid" ;;
  }

  dimension: previous_version_id {
    group_label: "{ blapi }"
    type: string
    sql: ${TABLE}."previous_version_id" ;;
  }

  dimension: pricebookentryid {
    hidden: yes
    group_label: "Pricebook"
    type: string
    sql: ${TABLE}."pricebookentryid" ;;
  }

  dimension: product2id {
    hidden: yes
    group_label: "Product"
    type: string
    sql: ${TABLE}."product2id" ;;
  }

  dimension: product_type {
    group_label: "Product"
    type: string
    sql: ${TABLE}."product_type__c" ;;
  }

  dimension: productcode {
    hidden: yes
    group_label: "Product"
    type: string
    sql: ${TABLE}."productcode" ;;
  }

  dimension: quantity {
    label: "License Quantity"
    type: number
    sql: ${TABLE}."quantity" ;;
  }

  dimension: renewal_amount {
    group_label: "Sales Ops"
    type: number
    sql: ${TABLE}."renewal_amount__c" ;;
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
    label: "SFID"
    type: string
    sql: ${TABLE}."sfid" ;;
  }

  dimension: start_date {
    label: "License Start Date"
    type: date
    sql: ${TABLE}."start_date__c" ;;
  }

  dimension: subscription_id {
    group_label: "{ blapi }"
    type: string
    sql: ${TABLE}."subscription_id" ;;
  }

  dimension: term_months {
    label: "License Term Months"
    type: number
    sql: ${TABLE}."term_months__c" ;;
  }

  dimension: totalprice {
    group_label: "Pricing"
    type: number
    sql: ${TABLE}."totalprice" ;;
  }

  dimension: unitprice {
    group_label: "Pricing"
    type: number
    sql: ${TABLE}."unitprice" ;;
  }

  dimension: version_id {
    group_label: "{ blapi }"
    type: string
    sql: ${TABLE}."version_id" ;;
  }

}
