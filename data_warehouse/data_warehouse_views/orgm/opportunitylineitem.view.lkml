# Lead data from salesforce.
#
# Groups Labels
# -

include: "_hc_fields.view"
include: "_systemmodstamp.view"

view: opportunitylineitem {
  sql_table_name: orgm.opportunitylineitem ;;
  extends: [ _hc_fields, _systemmodstamp ]
  drill_fields: [opportunity_line_item_drill_fields*]


  #
  # Sets
  #

  set: opportunity_line_item_drill_fields {
    fields: [id]
  }

  set: opportunity_line_item_drill_fields_detailed {
    fields: [
      id,
      name,
      opportunity.original_opportunity_id__c,
      opportunity.name,
      product2.name,
      product2.id
    ]
  }


  #
  # Dimensions
  #

  dimension: id {
    primary_key: yes
    sql: ${TABLE}.id;;
    type: number
  }

  dimension: is_closed_won {
    sql: ${TABLE}.closedwon__c;;
    type: yesno
  }

  dimension: createdbyid {
    label: "Created By ID"
    sql: ${TABLE}.createdbyid;;
    type: string
  }

  dimension_group: created {
    sql: ${TABLE}.createddate;;
    timeframes: [
      date,
      month,
      year
    ]
    type: time
  }

  dimension: description {
    sql: ${TABLE}.description;;
    type: string
  }

  dimension: discount {
    sql: ${TABLE}.discount;;
    type: number
  }

  dimension: discounted_unit_price {
    sql: ${TABLE}.discounted_unit_price__c;;
    type: number
  }

  dimension_group: end {
    convert_tz: no
    datatype: date
    sql: ${TABLE}.end_date__c;;
    timeframes: [
      date,
      month,
      fiscal_quarter,
      year,
      fiscal_year
    ]
    type: time
  }

  dimension: is_prorated_expansion {
    sql: ${TABLE}.is_prorated_expansion__c;;
    type: string
  }

  dimension: is_deleted {
    sql: ${TABLE}.isdeleted;;
    type: yesno
  }

  dimension: lastmodifiedbyid {
    label: "Last Modified By ID"
    sql: ${TABLE}.lastmodifiedbyid;;
    type: string
  }

  dimension_group: last_modified {
    sql: ${TABLE}.lastmodifieddate;;
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

  dimension: lineitemid {
    label: "Line Item ID"
    sql: ${TABLE}.lineitemid__c;;
    type: string
  }

  dimension: list_price {
    sql: ${TABLE}.listprice;;
    type: number
  }

  dimension: name {
    sql: ${TABLE}.name;;
    type: string
  }

  dimension: opportunityid {
    # hidden: yes
    label: "Opportunity ID"
    sql: ${TABLE}.opportunityid;;
    type: string
  }

  dimension: pricebookentryid {
    label: "Price Book Entry ID"
    sql: ${TABLE}.pricebookentryid;;
    type: string
  }

  dimension: product2id {
    label: "Product2 ID"
    # hidden: yes
    sql: ${TABLE}.product2id;;
    type: string
  }

  dimension: product_name {
    sql: ${product2.name} ;;
    type: string
  }

  dimension_group: product_end {
    convert_tz: no
    datatype: date
    sql: ${TABLE}.product_end_datef__c;;
    timeframes: [
      date,
      month,
      year
    ]
    type: time
  }

  dimension: product_line_type {
    sql: ${TABLE}.product_line_type__c;;
    type: string
  }

  dimension_group: product_start_datef {
    convert_tz: no
    datatype: date
    sql: ${TABLE}.product_start_datef__c;;
    timeframes: [
      date,
      month,
      year
    ]
    type: time
  }

  dimension: product_type {
    sql: ${TABLE}.product_type__c;;
    type: string
  }

  dimension: product_code {
    sql: ${TABLE}.productcode;;
    type: string
  }

  dimension: quantity {
    sql: ${TABLE}.quantity;;
    type: number
  }

  dimension: recalculate_sales_price {
    sql: ${TABLE}.recalculate_sales_price__c;;
    type: yesno
  }

  dimension_group: renewal_end {
    convert_tz: no
    datatype: date
    sql: ${TABLE}.renewal_end_date__c;;
    timeframes: [
      date,
      month,
      fiscal_quarter,
      year,
      fiscal_year
    ]
    type: time
  }

  dimension_group: renewal_start {
    convert_tz: no
    datatype: date
    sql: ${TABLE}.renewal_start_date__c;;
    timeframes: [
      date,
      month,
      fiscal_quarter,
      year,
      fiscal_year
    ]
    type: time
  }

  dimension: revenue_type {
    sql: ${TABLE}.revenue_type__c;;
    type: string
  }

  dimension: sales_price_needs_to_be_updated {
    sql: ${TABLE}.sales_price_needs_to_be_updated__c;;
    type: yesno
  }

  dimension_group: service {
    convert_tz: no
    datatype: date
    sql: ${TABLE}.servicedate;;
    timeframes: [
      date,
      month,
      year
    ]
    type: time
  }

  dimension: sfid {
    sql: ${TABLE}.sfid;;
    type: string
  }

  dimension: sort_order {
    sql: ${TABLE}.sortorder;;
    type: number
  }

  dimension_group: start {
    convert_tz: no
    datatype: date
    sql: ${TABLE}.start_date__c;;
    timeframes: [
      date,
      month,
      fiscal_quarter,
      year,
      fiscal_year
    ]
    type: time
  }

  dimension: subtotal {
    sql: ${TABLE}.subtotal;;
    type: number
  }

  dimension: term_months {
    sql: ${TABLE}.term_months__c;;
    type: number
  }

  dimension: total_price_with_annualized_expansion {
    sql: ${TABLE}.total_price_with_annualized_expansion__c;;
    type: number
  }

  dimension: totalprice {
    label: "Total Price"
    sql: ${TABLE}.totalprice;;
    type: number
    value_format_name: "usd_0"
  }

  dimension: arr {
    label: "ARR"
    sql: 365*${totalprice}/${length_days} ;;
    type: number
    value_format_name: "usd_0"
  }

  dimension: length_days {
    sql: ${TABLE}.end_date__c::date-${TABLE}.start_date__c::date ;;
    type: number
  }

  dimension: arr_per_seat {
    sql: ${totalprice}/${quantity} ;;
    type: number
    value_format_name: "usd_0"
  }

  dimension: unit_price {
    sql: ${TABLE}.unitprice;;
    type: number
    value_format_name: "usd_0"
  }


  #
  # Measures
  #

  measure: count {
    label: "# of Opportunity Line Items"
    drill_fields: [opportunity_line_item_drill_fields_detailed*]
    type: count
  }

  measure: total_price {
    label: "Total Price"
    sql: ${totalprice} ;;
    type: sum
    value_format_name: "usd_0"
  }

  measure: total_arr {
    label: "Total ARR"
    sql: ${arr} ;;
    type: sum
    value_format_name: "usd_0"
  }

  measure: total_arr_per_seat {
    label: "Total ARR per Seat"
    sql: ${arr_per_seat} ;;
    type: sum
    value_format_name: "usd_0"
  }
}
