view: opportunitylineitem {
  sql_table_name: orgm.opportunitylineitem ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id;;
  }

  dimension: _hc_err {
    type: string
    sql: ${TABLE}._hc_err;;
  }

  dimension: _hc_lastop {
    type: string
    sql: ${TABLE}._hc_lastop;;
  }

  dimension: closedwon {
    type: yesno
    sql: ${TABLE}.closedwon__c;;
  }

  dimension: createdbyid {
    type: string
    sql: ${TABLE}.createdbyid;;
  }

  dimension_group: createddate {
    type: time
    timeframes: [
      date,
      month,
      year
    ]
    sql: ${TABLE}.createddate;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description;;
  }

  dimension: discount {
    type: number
    sql: ${TABLE}.discount;;
  }

  dimension: discounted_unit_price {
    type: number
    sql: ${TABLE}.discounted_unit_price__c;;
  }

#   dimension_group: end {
#     type: time
#     timeframes: [
#       date,
#       month,
#       fiscal_quarter,
#       year,
#       fiscal_year
#     ]
#     convert_tz: no
#     datatype: date
#     sql: ${TABLE}.end_date__c;;
#   }

  dimension: is_prorated_expansion {
    type: string
    sql: ${TABLE}.is_prorated_expansion__c;;
  }

  dimension: isdeleted {
    type: yesno
    sql: ${TABLE}.isdeleted;;
  }

  dimension: lastmodifiedbyid {
    type: string
    sql: ${TABLE}.lastmodifiedbyid;;
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
    sql: ${TABLE}.lastmodifieddate;;
  }

  dimension: lineitemid {
    type: string
    sql: ${TABLE}.lineitemid__c;;
  }

  dimension: listprice {
    type: number
    sql: ${TABLE}.listprice;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name;;
  }

  dimension: opportunityid {
    type: string
    # hidden: yes
    sql: ${TABLE}.opportunityid;;
  }

  dimension: pricebookentryid {
    type: string
    sql: ${TABLE}.pricebookentryid;;
  }

  dimension: product2id {
    type: string
    # hidden: yes
    sql: ${TABLE}.product2id;;
  }

  dimension: product_name {
    type: string
    sql: ${product2.name} ;;
  }

  dimension_group: product_end_datef {
    type: time
    timeframes: [
      date,
      month,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.product_end_datef__c;;
  }

  dimension: product_line_type {
    type: string
    sql: ${TABLE}.product_line_type__c;;
  }

  dimension_group: product_start_datef {
    type: time
    timeframes: [
      date,
      month,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.product_start_datef__c;;
  }

  dimension: product_type {
    type: string
    sql: ${TABLE}.product_type__c;;
  }

  dimension: productcode {
    type: string
    sql: ${TABLE}.productcode;;
  }

  dimension: quantity {
    type: number
    sql: ${TABLE}.quantity;;
  }

  dimension: recalculate_sales_price {
    type: yesno
    sql: ${TABLE}.recalculate_sales_price__c;;
  }

  dimension_group: renewal_end_date {
    type: time
    timeframes: [
      date,
      month,
      fiscal_quarter,
      year,
      fiscal_year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.renewal_end_date__c;;
  }

  dimension_group: renewal_start_date {
    type: time
    timeframes: [
      date,
      month,
      fiscal_quarter,
      year,
      fiscal_year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.renewal_start_date__c;;
  }

  dimension: revenue_type {
    type: string
    sql: ${TABLE}.revenue_type__c;;
  }

  dimension: sales_price_needs_to_be_updated {
    type: yesno
    sql: ${TABLE}.sales_price_needs_to_be_updated__c;;
  }

  dimension_group: servicedate {
    type: time
    timeframes: [
      date,
      month,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.servicedate;;
  }

  dimension: sfid {
    type: string
    sql: ${TABLE}.sfid;;
  }

  dimension: sortorder {
    type: number
    sql: ${TABLE}.sortorder;;
  }

#   dimension_group: start {
#     type: time
#     timeframes: [
#       date,
#       month,
#       fiscal_quarter,
#       year,
#       fiscal_year
#     ]
#     convert_tz: no
#     datatype: date
#     sql: ${TABLE}.start_date__c;;
#   }

  dimension: subtotal {
    type: number
    sql: ${TABLE}.subtotal;;
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
    sql: ${TABLE}.systemmodstamp;;
  }

  dimension: term_months {
    type: number
    sql: ${TABLE}.term_months__c;;
  }

  dimension: total_price_with_annualized_expansion {
    type: number
    sql: ${TABLE}.total_price_with_annualized_expansion__c;;
  }

  dimension: totalprice {
    label: "Total Price"
    type: number
    sql: ${TABLE}.totalprice;;
    value_format_name: "usd"
  }

  dimension: arr_norm {
    label: "ARR Norm"
    type: number
    sql: 365*${totalprice}/${length_days} ;;
    value_format_name: "usd"
  }

  dimension: length_days {
    type: number
    sql: ${TABLE}.end_date__c::date-${TABLE}.start_date__c::date ;;
  }

  dimension: arr_per_seat {
    type: number
    sql: ${totalprice}/${quantity} ;;
    value_format_name: "usd"
  }

  dimension: arr_norm_per_seat {
    type: number
    sql: ${arr_norm}/${quantity} ;;
    value_format_name: "usd"
  }

  dimension: unitprice {
    type: number
    sql: ${TABLE}.unitprice;;
    value_format_name: "usd"
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: total_price {
    label: "Total Price"
    type: sum
    sql: ${totalprice} ;;
    value_format_name: "usd"
  }

  measure: total_arr_norm {
    label: "Total ARR Norm."
    type: sum
    sql: ${arr_norm} ;;
    value_format_name: "usd"
  }

  measure: total_arr_per_seat {
    label: "Total ARR per Seat"
    type: sum
    sql: ${arr_per_seat} ;;
    value_format_name: "usd"
  }

  measure: total_arr_norm_per_seat {
    label: "Total ARR Norm. per Seat"
    type: sum
    sql: ${arr_norm_per_seat} ;;
    value_format_name: "usd"
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      name,
      opportunity.original_opportunity_id__c,
      opportunity.name,
      product2.name,
      product2.id
    ]
  }
}
