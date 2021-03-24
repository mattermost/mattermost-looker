# Product2 data from salesforce.
#
# Groups Labels
# -




view: product2 {
  label: "Product"
  sql_table_name: orgm.product2 ;;


  #
  # Sets
  #


  #
  # Dimensions
  #

  dimension: createdbyid {
    label: "Created By ID"
    sql: ${TABLE}.createdbyid ;;
    type: string
  }

  dimension_group: created {
    sql: ${TABLE}.createddate ;;
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    type: time
  }

  dimension: description {
    sql: ${TABLE}.description ;;
    type: string
  }

  dimension: display_url {
    sql: ${TABLE}.displayurl ;;
    type: string
  }

  dimension: family {
    sql: ${TABLE}.family ;;
    type: string
  }

  dimension: is_active {
    sql: ${TABLE}.isactive ;;
    type: yesno
  }

  dimension: is_deleted {
    sql: ${TABLE}.isdeleted ;;
    type: yesno
  }

  dimension: lastmodifiedbyid {
    label: "Last Modified By ID"
    sql: ${TABLE}.lastmodifiedbyid ;;
    type: string
  }

  dimension_group: last_modified {
    sql: ${TABLE}.lastmodifieddate ;;
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    type: time
  }

  dimension_group: last_referenced {
    sql: ${TABLE}.lastreferenceddate ;;
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    type: time
  }

  dimension_group: last_viewed {
    sql: ${TABLE}.lastvieweddate ;;
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    type: time
  }

  dimension: name {
    sql: ${TABLE}.name ;;
    type: string
  }

  measure: max_product_name {
    type: string
    sql: MAX(DISTINCT CASE WHEN ${general_product} != 'Unknown' THEN ${general_product} ELSE NULL END) ;;
  }

  dimension: general_product {
    sql: CASE WHEN ${name} like '%E10%' THEN 'E10' WHEN ${name} like '%E20%' THEN 'E20' ELSE 'Unknown' END  ;;
    type: string
  }

  # TODO: These netsuite fields do not exist in the db
  # dimension: netsuite_conn__item_category {
  #   group_item_label: "Item Category"
  #   group_label: "Netsuite"
  #   label: "Netsuite Item Category"
  #   sql: ${TABLE}.netsuite_conn__item_category__c ;;
  #   type: string
  # }

  # dimension: netsuite_conn__netsuite_item_type {
  #   group_item_label: "Item Type"
  #   group_label: "Netsuite"
  #   label: "Netsuite Item Type"
  #   sql: ${TABLE}.netsuite_conn__netsuite_item_type__c ;;
  #   type: string
  # }

  # dimension: netsuite_conn__sync_in_progress {
  #   group_item_label: "Sync In Progress"
  #   group_label: "Netsuite"
  #   label: "Netsuite Sync In Progress"
  #   sql: ${TABLE}.netsuite_conn__sync_in_progress__c ;;
  #   type: yesno
  # }

  # dimension: netsuite_conn__term_contract_pricing_type {
  #   group_item_label: "Term Contract Pricing Type"
  #   group_label: "Netsuite"
  #   label: "Netsuite Term Contract Pricing Type"
  #   sql: ${TABLE}.netsuite_conn__term_contract_pricing_type__c ;;
  #   type: string
  # }

  dimension: netsuite_conn__celigo_update {
    group_item_label: "Celigo Update"
    group_label: "Netsuite"
    label: "Netsuite Celigo Update"
    sql: ${TABLE}.netsuite_conn__celigo_update__c ;;
    type: yesno
  }

  dimension: netsuite_conn__netsuite_id {
    group_item_label: "Netsuite ID"
    group_label: "Netsuite"
    label: "Netsuite ID"
    sql: ${TABLE}.netsuite_conn__netsuite_id__c ;;
    type: string
  }

  dimension: netsuite_conn__netsuite_sync_err {
    group_item_label: "Sync Error"
    group_label: "Netsuite"
    label: "Netsuite Sync Error"
    sql: ${TABLE}.netsuite_conn__netsuite_sync_err__c ;;
    type: string
  }

  dimension: netsuite_conn__push_to_netsuite {
    group_item_label: "Push to Netsuite"
    group_label: "Netsuite"
    label: "Push to Netsuite"
    sql: ${TABLE}.netsuite_conn__push_to_netsuite__c ;;
    type: yesno
  }

  dimension: netsuite_conn__sub_type {
    group_item_label: "Sub Type"
    group_label: "Netsuite"
    label: "Netsuite Sub Type"
    sql: ${TABLE}.netsuite_conn__sub_type__c ;;
    type: string
  }

  dimension: product_id_18_digit {
    sql: ${TABLE}.product_id_18_digit__c ;;
    type: string
  }

  dimension: product_id {
    sql: ${TABLE}.product_id__c ;;
    type: string
  }

  dimension: product_code {
    sql: ${TABLE}.productcode ;;
    type: string
  }

  dimension: quantity_unit_of_measure {
    sql: ${TABLE}.quantityunitofmeasure ;;
    type: string
  }

  dimension: sfid {
    label: "Product ID"
    primary_key: yes
    sql: ${TABLE}.sfid ;;
    type: string
  }

  dimension: stock_keeping_unit {
    sql: ${TABLE}.stockkeepingunit ;;
    type: string
  }


  #
  # Measures
  #

  measure: count {
    drill_fields: [name, opportunitylineitem.count]
    label: "# of Product2s"
    type: count
  }

  measure: list_of_general_products {
    type: string
    sql: LISTAGG(DISTINCT ${general_product}, ',') ;;
    description: "A list of general products. General products groups products into E10, E20, etc."
  }

  measure: list_of_products {
    type: string
    sql: LISTAGG(DISTINCT ${name}, ',') ;;
  }
}
