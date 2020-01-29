# Lead data from salesforce.
#
# Groups Labels
# -

include: "_hc_fields.view"
include: "_systemmodstamp.view"

view: opportunitylineitem {
  view_label: "Opportunity Line Item"
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

  set: opportunitylineitem_core {
    fields: [
      sfid,
      product_name,
      start_date,
      start_fiscal_quarter,
      start_fiscal_year,
      end_date,
      end_fiscal_quarter,
      end_fiscal_year,
      length_days,
      quantity,
      product_line_type,
      total_arr,
      totalprice,
      total_quantity,
      total_arr_per_seat,
      total_price,
      total_acv,
      total_price_per_seat
    ]
  }


  #
  # Dimensions
  #

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
    label: "Opport. Line Item ID"
    primary_key: yes
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
    label: "Total Contract Value"
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
    sql: case when ${TABLE}.end_date__c::date - ${TABLE}.start_date__c::date > 0 then ${TABLE}.end_date__c::date - ${TABLE}.start_date__c::date + 1 - ${leap_day_adjustment} else 0 end;;
    type: number
  }

  dimension: leap_day_adjustment {
    sql:
        case when '2000-02-29'::date between ${TABLE}.start_date__c::date and ${TABLE}.end_date__c::date then 1 else 0 end +
        case when '2004-02-29'::date between ${TABLE}.start_date__c::date and ${TABLE}.end_date__c::date then 1 else 0 end +
        case when '2008-02-29'::date between ${TABLE}.start_date__c::date and ${TABLE}.end_date__c::date then 1 else 0 end +
        case when '2012-02-29'::date between ${TABLE}.start_date__c::date and ${TABLE}.end_date__c::date then 1 else 0 end +
        case when '2016-02-29'::date between ${TABLE}.start_date__c::date and ${TABLE}.end_date__c::date then 1 else 0 end +
        case when '2020-02-29'::date between ${TABLE}.start_date__c::date and ${TABLE}.end_date__c::date then 1 else 0 end +
        case when '2024-02-29'::date between ${TABLE}.start_date__c::date and ${TABLE}.end_date__c::date then 1 else 0 end +
        case when '2028-02-29'::date between ${TABLE}.start_date__c::date and ${TABLE}.end_date__c::date then 1 else 0 end +
        case when '2032-02-29'::date between ${TABLE}.start_date__c::date and ${TABLE}.end_date__c::date then 1 else 0 end +
        case when '2036-02-29'::date between ${TABLE}.start_date__c::date and ${TABLE}.end_date__c::date then 1 else 0 end +
        case when '2040-02-29'::date between ${TABLE}.start_date__c::date and ${TABLE}.end_date__c::date then 1 else 0 end +
        case when '2044-02-29'::date between ${TABLE}.start_date__c::date and ${TABLE}.end_date__c::date then 1 else 0 end +
        case when '2048-02-29'::date between ${TABLE}.start_date__c::date and ${TABLE}.end_date__c::date then 1 else 0 end
        ;;
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
    label: "Total TCV"
    sql: ${totalprice} ;;
    type: sum
    value_format_name: "usd_0"
  }

  measure: total_acv {
    label: "Total ACV"
    sql: case when ${length_days} >=365 then ${arr} else ${totalprice} end;;
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
    sql: ${total_arr} / ${total_quantity} ;;
    type: number
    value_format_name: "usd_0"
  }

  measure: total_price_per_seat {
    label: "Total TCV per Seat"
    sql: ${total_price} / ${total_quantity} ;;
    type: number
    value_format_name: "usd_0"
  }

  measure: total_acv_per_seat {
    label: "Total ACV per Seat"
    sql: ${total_acv} / ${total_quantity} ;;
    type: number
    value_format_name: "usd_0"
  }

  measure: total_quantity {
    sql: case when ${product_name} like 'Premier Support%' then 0 else ${quantity} end;;
    type: sum_distinct
  }
}
