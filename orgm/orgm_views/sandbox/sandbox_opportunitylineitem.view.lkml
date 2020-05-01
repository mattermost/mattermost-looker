view: sandbox_opportunitylineitem {
  sql_table_name: sandbox.opportunitylineitem ;;

  set: opportunitylineitem_drill {
    fields: [account.name,opportunity.name,opportunity.close_date,opportunityproduct.name,opportunity.license_start_date,opportunity.license_end_date]
  }

  set: opportunitylineitem_core {
    fields: [
      sfid,
      name,
      productcode,
      start_date,
      start_week,
      start_month,
      start_fiscal_quarter,
      start_fiscal_year,
      end_date,
      end_month,
      end_fiscal_quarter,
      end_fiscal_year,
      length_days,
      quantity,
      product_line_type,
      product_type,
      total_arr,
      potential_arr,
      total_lost_arr,
      lost_arr,
      totalprice,
      total_quantity,
      total_price,
      total_bookings,
      is_prorated_expansion
    ]
  }


  dimension: id {
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

  dimension: createdbyid {
    type: string
    sql: ${TABLE}."createdbyid" ;;
  }



  dimension_group: created {
    type: time
    timeframes: [
      time,
      date
    ]
    sql: ${TABLE}."createddate" ;;
    label: "Create Date"
  }

  dimension: description {
    type: string
    sql: ${TABLE}."description" ;;
  }

  dimension: discount {
    type: number
    sql: ${TABLE}."discount" ;;
  }

  dimension: discounted_unit_price {
    type: number
    sql: ${TABLE}."discounted_unit_price__c" ;;
  }

  dimension_group: end {
    convert_tz: no
    datatype: date
    sql: ${TABLE}."end_date__c";;
    timeframes: [
      date,
      month,
      fiscal_quarter,
      year,
      fiscal_year
    ]
    type: time
    group_label: "License End"
  }

  dimension: end_yyyy_mm {
    description: "Date when the license is ending. "
    sql: to_char(${TABLE}.end_date__c,'YYYY-MM') ;;
    type: string
    group_label: "License End"
    label: "End YYYY-MM"
  }

  dimension: is_prorated_expansion {
    type: string
    sql: ${TABLE}."is_prorated_expansion__c" ;;
  }

  dimension: isdeleted {
    type: yesno
    sql: ${TABLE}."isdeleted" ;;
  }

  dimension: is_loe {
    hidden: yes
    sql: ${is_prorated_expansion} = 'Leftover Expansion';;
    type: yesno
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

  dimension: listprice {
    type: number
    sql: ${TABLE}."listprice" ;;
  }

  dimension: lost_arr {
    label: "Lost ARR"
    sql: case when ${sandbox_opportunity.isclosed} AND not ${sandbox_opportunity.iswon} AND ${sandbox_opportunity.type} != 'New Subscription' AND ${length_days} <> 0 AND ${product_type} = 'Recurring' then 365*${totalprice}/${length_days} else 0 end ;;
    type: number
    value_format_name: "usd_0"
  }

  dimension: name {
    description: "Name of Line Item in Salesforce"
    label: "Opportunity Line Item Name"
    link: {
      label: "Salesforce Opportunity Line Item"
      # BP: Leverage constants to enable more reused
      url: "@{salesforce_link}{{sfid}}"
    }
    sql: ${TABLE}.name ;;
    type: string
  }

  dimension: opportunityid {
    type: string
    # hidden: yes
    sql: ${TABLE}."opportunityid" ;;
  }

  dimension: potential_arr {
    label: "Potential ARR"
    sql: case when not ${sandbox_opportunity.isclosed} AND ${sandbox_opportunity.type} != 'New Subscription' AND ${length_days} <> 0 AND ${product_type} = 'Recurring' then 365*${totalprice}/${length_days} else 0 end ;;
    type: number
    value_format_name: "usd_0"
  }



  dimension: pricebookentryid {
    type: string
    sql: ${TABLE}."pricebookentryid" ;;
  }

  dimension: product2id {
    type: string
    # hidden: yes
    sql: ${TABLE}."product2id" ;;
  }

  dimension: product_line_type {
    type: string
    sql: ${TABLE}."product_line_type__c" ;;
  }

  dimension: product_type {
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

  dimension_group: service {
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
    sql: ${TABLE}."servicedate" ;;
  }

  dimension: sfid {
    type: string
    primary_key: yes
    sql: ${TABLE}."sfid" ;;
    link: {
      label: "Salesforce Opportunity Line Item"
      # BP: Leverage constants to enable more reused
      url: "@{salesforce_link}{{sfid}}"
    }
  }

  dimension: sortorder {
    type: number
    sql: ${TABLE}."sortorder" ;;
  }

  dimension_group: start {
    convert_tz: no
    datatype: date
    sql: ${TABLE}."start_date__c";;
    timeframes: [
      date,
      week,
      month,
      fiscal_quarter,
      year,
      fiscal_year
    ]
    type: time
    group_label: "License Start"
  }

  dimension: subtotal {
    type: number
    sql: ${TABLE}."subtotal" ;;
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

  dimension: totalprice {
    label: "Total Price"
    type: number
    sql: ${TABLE}."totalprice" ;;
    value_format_name: "usd"
  }

  dimension: arr {
    label: "ARR"
    type: number
    sql: 365*${totalprice}/${length_days} ;;
    value_format_name: "usd"
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

  dimension: unitprice {
    type: number
    sql: ${TABLE}."unitprice" ;;
    value_format_name: "usd"
  }

  dimension: subs_id {
    type: string
    sql: ${TABLE}."subs_id__c" ;;
  }

  dimension: subs_version_id__c {
    type: string
    sql: ${TABLE}."subs_version_id__c" ;;
  }

  dimension: subs_prev_version_id {
    type: string
    sql: ${TABLE}."subs_prev_version_id__c" ;;
  }

  dimension: amount_manual_override {
    type: yesno
    sql: ${TABLE}."amount_manual_override__c" ;;
  }

  dimension: new_amount {
    type: number
    sql: ${TABLE}."new_amount__c" ;;
    value_format_name: "usd"
  }

  dimension: renewal_amount {
    type: number
    sql: ${TABLE}."renewal_amount__c" ;;
    value_format_name: "usd"
  }

  dimension: expansion_amount {
    type: number
    sql: ${TABLE}."expansion_amount__c" ;;
    value_format_name: "usd"
  }

  dimension: coterm_expansion_amount {
    type: number
    sql: ${TABLE}."coterm_expansion_amount__c" ;;
    value_format_name: "usd"
  }

  dimension: leftover_expansion_amount {
    type: number
    sql: ${TABLE}."leftover_expansion_amount__c" ;;
    value_format_name: "usd"
  }

  dimension: multi_amount {
    type: number
    sql: ${TABLE}."multi_amount__c" ;;
    value_format_name: "usd"
  }

  #
  # Measures
  #

  measure: count {
    label: "# of Opportunity Line Items"
    sql: ${sfid} ;;
    drill_fields: [opportunitylineitem_drill*]
    type: count_distinct
  }

  measure: total_quantity {
    label: "Total Quantity"
    sql: ${quantity} ;;
    type: sum
    drill_fields: [opportunitylineitem_drill*,total_quantity]
  }

  measure: total_price {
    group_label: "Historical"
    label: "Total TCV"
    sql: ${totalprice} ;;
    type: sum
    value_format_name: "usd_0"
    drill_fields: [opportunitylineitem_drill*,total_price]
  }

  measure: total_bookings_all {
    group_label: "Historical"
    label: "Total Bookings All"
    sql: case when ${length_days} >=365 then ${arr} + ${potential_arr} + ${lost_arr} else ${totalprice} end;;
    type: sum
    value_format_name: "usd_0"
    drill_fields: [opportunitylineitem_drill*,total_bookings]
  }

  measure: total_bookings {
    group_label: "Historical"
    label: "Total Bookings Won"
    sql: case when ${length_days} >=365 then ${arr} else ${totalprice} end;;
    type: sum
    value_format_name: "usd_0"
    filters: {
      field: sandbox_opportunity.iswon
      value: "yes"
    }
    drill_fields: [opportunitylineitem_drill*,total_bookings]
  }

  measure: total_bookings_open {
    group_label: "Historical"
    label: "Total Bookings Open"
    sql: case when ${length_days} >=365 then ${potential_arr} else ${totalprice} end;;
    type: sum
    value_format_name: "usd_0"
    filters: {
      field: sandbox_opportunity.isclosed
      value: "no"
    }
    drill_fields: [opportunitylineitem_drill*,total_bookings_open]
  }

  measure: total_bookings_lost {
    group_label: "Historical"
    label: "Total Bookings Lost"
    sql: case when ${length_days} >=365 then ${lost_arr} else ${totalprice} end;;
    type: sum
    value_format_name: "usd_0"
    filters: {
      field: sandbox_opportunity.isclosed
      value: "yes"
    }
    filters: {
      field: sandbox_opportunity.iswon
      value: "no"
    }
    drill_fields: [opportunitylineitem_drill*,total_bookings_lost]
  }


  measure: total_price_curr_fy {
    group_label: "Current FY"
    group_item_label: "Total TCV"
    label: "Total TCV (Curr FY)"
    sql: ${totalprice} ;;
    type: sum
    value_format_name: "usd_0"

    filters: {
      field: sandbox_opportunity.close_current_fy
      value: "yes"
    }
    drill_fields: [opportunitylineitem_drill*,total_price_curr_fy]
  }

  measure: total_bookings_curr_fy {
    group_label: "Current FY"
    group_item_label: "Total Bookings Won"
    label: "Total Bookings Won (Curr FY)"
    sql: case when ${length_days} >=365 then ${arr} else ${totalprice} end;;
    type: sum
    value_format_name: "usd_0"
    filters: {
      field: sandbox_opportunity.iswon
      value: "yes"
    }
    filters: {
      field: sandbox_opportunity.close_current_fy
      value: "yes"
    }
    drill_fields: [opportunitylineitem_drill*,total_bookings_curr_fy]
  }

  measure: total_bookings_open_curr_fy {
    group_label: "Current FY"
    group_item_label: "Total Bookings Open"
    label: "Total Bookings Open (Curr FY)"
    sql: case when ${length_days} >=365 then ${potential_arr} else ${totalprice} end;;
    type: sum
    value_format_name: "usd_0"
    filters: {
      field: sandbox_opportunity.isclosed
      value: "no"
    }
    filters: {
      field: sandbox_opportunity.close_current_fy
      value: "yes"
    }
    drill_fields: [opportunitylineitem_drill*,total_bookings_open_curr_fy]
  }

  measure: total_bookings_lost_curr_fy {
    group_label: "Current FY"
    group_item_label: "Total Bookings Lost"
    label: "Total Bookings Lost (Curr FY)"
    sql: case when ${length_days} >=365 then ${lost_arr} else ${totalprice} end;;
    type: sum
    value_format_name: "usd_0"
    filters: {
      field: sandbox_opportunity.isclosed
      value: "yes"
    }
    filters: {
      field: sandbox_opportunity.iswon
      value: "no"
    }
    filters: {
      field: sandbox_opportunity.close_current_fy
      value: "yes"
    }
    drill_fields: [opportunitylineitem_drill*,total_bookings_lost_curr_fy]
  }

  measure: total_bookings_curr_qtr {
    group_label: "Current Qtr"
    group_item_label: "Total Bookings Won"
    label: "Total Bookings Won (Curr Qtr)"
    sql: case when ${length_days} >=365 then ${arr} else ${totalprice} end;;
    type: sum
    value_format_name: "usd_0"
    filters: {
      field: sandbox_opportunity.iswon
      value: "yes"
    }
    filters: {
      field: sandbox_opportunity.close_current_qtr
      value: "yes"
    }
    drill_fields: [opportunitylineitem_drill*,total_bookings_curr_qtr]
  }

  measure: total_bookings_open_curr_qtr {
    group_label: "Current Qtr"
    group_item_label: "Total Bookings Open"
    label: "Total Bookings Open (Curr Qtr)"
    sql: case when ${length_days} >=365 then ${potential_arr} else ${totalprice} end;;
    type: sum
    value_format_name: "usd_0"
    filters: {
      field: sandbox_opportunity.isclosed
      value: "no"
    }
    filters: {
      field: sandbox_opportunity.close_current_qtr
      value: "yes"
    }
    drill_fields: [opportunitylineitem_drill*,total_bookings_open_curr_qtr]
  }

  measure: total_bookings_lost_curr_qtr {
    group_label: "Current Qtr"
    group_item_label: "Total Bookings Lost"
    label: "Total Bookings Lost (Curr Qtr)"
    sql: case when ${length_days} >=365 then ${lost_arr} else ${totalprice} end;;
    type: sum
    value_format_name: "usd_0"
    filters: {
      field: sandbox_opportunity.isclosed
      value: "yes"
    }
    filters: {
      field: sandbox_opportunity.iswon
      value: "no"
    }
    filters: {
      field: sandbox_opportunity.close_current_qtr
      value: "yes"
    }
    drill_fields: [opportunitylineitem_drill*,total_bookings_lost_curr_qtr]
  }

  measure: total_bookings_curr_mo {
    group_label: "Current Mo"
    group_item_label: "Total Bookings Won"
    label: "Total Bookings Won (Curr Mo)"
    sql: case when ${length_days} >=365 then ${arr} else ${totalprice} end;;
    type: sum
    value_format_name: "usd_0"
    filters: {
      field: sandbox_opportunity.iswon
      value: "yes"
    }
    filters: {
      field: sandbox_opportunity.close_current_mo
      value: "yes"
    }
    drill_fields: [opportunitylineitem_drill*,total_bookings_curr_mo]
  }

  measure: total_bookings_open_curr_mo {
    group_label: "Current Mo"
    group_item_label: "Total Bookings Open"
    label: "Total Bookings Open (Curr Mo)"
    sql: case when ${length_days} >=365 then ${potential_arr} else ${totalprice} end;;
    type: sum
    value_format_name: "usd_0"
    filters: {
      field: sandbox_opportunity.isclosed
      value: "no"
    }
    filters: {
      field: sandbox_opportunity.close_current_mo
      value: "yes"
    }
    drill_fields: [opportunitylineitem_drill*,total_bookings_open_curr_mo]
  }

  measure: total_bookings_lost_curr_mo {
    group_label: "Current Mo"
    group_item_label: "Total Bookings Lost"
    label: "Total Bookings Lost (Curr Mo)"
    sql: case when ${length_days} >=365 then ${lost_arr} else ${totalprice} end;;
    type: sum
    value_format_name: "usd_0"
    filters: {
      field: sandbox_opportunity.isclosed
      value: "yes"
    }
    filters: {
      field: sandbox_opportunity.iswon
      value: "no"
    }
    filters: {
      field: sandbox_opportunity.close_current_mo
      value: "yes"
    }
    drill_fields: [opportunitylineitem_drill*,total_bookings_lost_curr_mo]
  }

  measure: total_arr {
    label: "Total ARR"
    sql: ${arr} ;;
    type: sum
    value_format_name: "usd_0"
    drill_fields: [opportunitylineitem_drill*,total_price,total_arr]
  }

  measure: total_potential_arr {
    label: "Total Potential ARR"
    sql: ${potential_arr} ;;
    type: sum
    value_format_name: "usd_0"
    drill_fields: [opportunitylineitem_drill*,total_price,total_potential_arr]
  }

  measure: total_lost_arr {
    label: "Total Lost ARR"
    sql: ${lost_arr} ;;
    type: sum
    value_format_name: "usd_0"
    drill_fields: [opportunitylineitem_drill*,total_price,total_lost_arr]
  }

  measure: total_potential_and_booked_arr {
    label: "Total Potential & Booked ARR"
    sql: ${potential_arr} + ${arr} ;;
    type: sum
    value_format_name: "usd_0"
    drill_fields: [opportunitylineitem_drill*,total_price,total_potential_arr]
  }

  measure: total_new_amount {
    group_label: "Product Line Type Totals"
    sql: ${totalprice};;
    type: sum
    value_format_name: mm_usd_short
    drill_fields: [opportunitylineitem_drill*,total_new_amount]
    filters: {
      field: product_line_type
      value: "New"
    }
  }

  measure: total_ren_amount {
    group_label: "Product Line Type Totals"
    sql: ${totalprice};;
    type: sum
    value_format_name: mm_usd_short
    drill_fields: [opportunitylineitem_drill*,total_ren_amount]
    filters: {
      field: product_line_type
      value: "Ren"
    }
  }

  measure: total_exp_amount {
    group_label: "Product Line Type Totals"
    sql: ${totalprice};;
    type: sum
    value_format_name: mm_usd_short
    drill_fields: [opportunitylineitem_drill*,total_exp_amount]
    filters: {
      field: product_line_type
      value: "Expansion"
    }
    filters: {
      field: is_loe
      value: "no"
    }
  }

  measure: total_exp_with_loe_amount {
    label: "Total Exp w/LOE Amount"
    group_label: "Product Line Type Totals"
    sql: ${sandbox_opportunitylineitem.totalprice};;
    type: sum
    value_format_name: mm_usd_short
    drill_fields: [opportunitylineitem_drill*,total_exp_amount]
    filters: {
      field: product_line_type
      value: "Expansion"
    }
  }

  measure: total_multi_amount {
    group_label: "Product Line Type Totals"
    sql: ${totalprice};;
    type: sum
    value_format_name: mm_usd_short
    drill_fields: [opportunitylineitem_drill*,total_multi_amount]
    filters: {
      field: product_line_type
      value: "Multi"
    }
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      account.name,
      opportunity.name,
      name,
      product2.name,
      quantity,
      total_price,
      arr
    ]
  }
}
