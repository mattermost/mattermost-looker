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
  drill_fields: [opportunitylineitem_drill*]


  #
  # Sets
  #

  set: opportunitylineitem_drill {
    fields: [account.name,opportunity.name, account.csm_name, account.owner_name, opportunity.close_date,opportunityproduct.name,opportunity.license_start_date,opportunity.license_end_date]
  }

  set: opportunitylineitem_core {
    fields: [
      sfid,
      name,
      product_name,
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
      open_arr,
      total_open_arr,
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


  #
  # Dimensions
  #

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

  dimension: is_loe {
    hidden: yes
    sql: ${is_prorated_expansion} = 'Leftover Expansion';;
    type: yesno
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
      date,
      month,
      fiscal_quarter,
      fiscal_quarter_of_year,
      year,
      fiscal_year
    ]
    type: time
  }

  dimension: list_price {
    sql: ${TABLE}.listprice;;
    type: number
  }

  dimension: name {
    description: "Name of the Opportunity Line Item"
    sql: ${TABLE}.name ;;
    type: string
    link: {
      url: "@{salesforce_link}{{sfid}}"
      label: "Salesforce Opportunity Line Item"
    }
    label: "Name"
  }

  dimension: opportunityid {
    hidden: yes
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
    hidden: yes
    sql: ${TABLE}.product2id;;
    type: string
  }

  dimension: product_name {
    sql: ${product2.name} ;;
    type: string
  }

  dimension: product_line_type {
    sql: ${TABLE}.product_line_type__c;;
    type: string
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
    label: "Opportunity Line Item SFID"
    primary_key: yes
    sql: ${TABLE}.sfid;;
    type: string
    link: {
      url: "@{salesforce_link}{{sfid}}"
      label: "Salesforce Opportunity Line Item"
    }
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
      week,
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

  dimension: totalprice {
    label: "Total Contract Value"
    sql: ${TABLE}.totalprice;;
    type: number
    value_format_name: "usd_0"
  }


  dimension: arr {
    label: "ARR"
    sql: case when ${opportunity.iswon} AND ${length_days} <> 0 AND ${product_type} = 'Recurring' then 365*${totalprice}/${length_days} else 0 end ;;
    type: number
    value_format_name: "usd_0"
  }

  dimension: open_arr {
    label: "Open ARR"
    sql: case when not ${opportunity.isclosed} AND ${length_days} <> 0 AND ${product_type} = 'Recurring' then 365*${totalprice}/${length_days} else 0 end ;;
    type: number
    value_format_name: "usd_0"
  }

  dimension: potential_arr {
    label: "Potential Renewal & Expansion ARR"
    sql: case when not ${opportunity.isclosed} AND ${opportunity.type} != 'New Subscription' AND ${length_days} <> 0 AND ${product_type} = 'Recurring' then 365*${totalprice}/${length_days} else 0 end ;;
    type: number
    value_format_name: "usd_0"
  }

  dimension: lost_arr {
    label: "Lost ARR"
    sql: case when ${opportunity.isclosed} AND not ${opportunity.iswon} AND ${opportunity.type} != 'New Subscription' AND ${length_days} <> 0 AND ${product_type} = 'Recurring' then 365*${totalprice}/${length_days} else 0 end ;;
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
    sql: case when ${length_days} >=365 then ${arr} + ${open_arr} + ${lost_arr} else ${totalprice} end;;
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
      field: opportunity.iswon
      value: "yes"
    }
    drill_fields: [opportunitylineitem_drill*,total_bookings]
  }

  measure: total_bookings_open {
    group_label: "Historical"
    label: "Total Bookings Open"
    sql: case when ${length_days} >=365 then ${open_arr} else ${totalprice} end;;
    type: sum
    value_format_name: "usd_0"
    filters: {
      field: opportunity.isclosed
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
      field: opportunity.isclosed
      value: "yes"
    }
    filters: {
      field: opportunity.iswon
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
      field: opportunity.close_current_fy
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
      field: opportunity.iswon
      value: "yes"
    }
    filters: {
      field: opportunity.close_current_fy
      value: "yes"
    }
    drill_fields: [opportunitylineitem_drill*,total_bookings_curr_fy]
  }

  measure: total_bookings_open_curr_fy {
    group_label: "Current FY"
    group_item_label: "Total Bookings Open"
    label: "Total Bookings Open (Curr FY)"
    sql: case when ${length_days} >=365 then ${open_arr} else ${totalprice} end;;
    type: sum
    value_format_name: "usd_0"
    filters: {
      field: opportunity.isclosed
      value: "no"
    }
    filters: {
      field: opportunity.close_current_fy
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
      field: opportunity.isclosed
      value: "yes"
    }
    filters: {
      field: opportunity.iswon
      value: "no"
    }
    filters: {
      field: opportunity.close_current_fy
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
      field: opportunity.iswon
      value: "yes"
    }
    filters: {
      field: opportunity.close_current_qtr
      value: "yes"
    }
    drill_fields: [opportunitylineitem_drill*,total_bookings_curr_qtr]
  }

  measure: total_bookings_open_curr_qtr {
    group_label: "Current Qtr"
    group_item_label: "Total Bookings Open"
    label: "Total Bookings Open (Curr Qtr)"
    sql: case when ${length_days} >=365 then ${open_arr} else ${totalprice} end;;
    type: sum
    value_format_name: "usd_0"
    filters: {
      field: opportunity.isclosed
      value: "no"
    }
    filters: {
      field: opportunity.close_current_qtr
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
      field: opportunity.isclosed
      value: "yes"
    }
    filters: {
      field: opportunity.iswon
      value: "no"
    }
    filters: {
      field: opportunity.close_current_qtr
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
      field: opportunity.iswon
      value: "yes"
    }
    filters: {
      field: opportunity.close_current_mo
      value: "yes"
    }
    drill_fields: [opportunitylineitem_drill*,total_bookings_curr_mo]
  }

  measure: total_bookings_open_curr_mo {
    group_label: "Current Mo"
    group_item_label: "Total Bookings Open"
    label: "Total Bookings Open (Curr Mo)"
    sql: case when ${length_days} >=365 then ${open_arr} else ${totalprice} end;;
    type: sum
    value_format_name: "usd_0"
    filters: {
      field: opportunity.isclosed
      value: "no"
    }
    filters: {
      field: opportunity.close_current_mo
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
      field: opportunity.isclosed
      value: "yes"
    }
    filters: {
      field: opportunity.iswon
      value: "no"
    }
    filters: {
      field: opportunity.close_current_mo
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

  measure: total_open_arr {
    label: "Total Open ARR"
    sql: ${open_arr} ;;
    type: sum
    value_format_name: "usd_0"
    drill_fields: [opportunitylineitem_drill*,total_price,total_open_arr]
  }

  measure: total_potential_arr {
    label: "Total Potential Renewal & Expansion ARR"
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

  measure: total_open_and_booked_arr {
    label: "Total Open & Booked ARR"
    sql: ${open_arr} + ${arr} ;;
    type: sum
    value_format_name: "usd_0"
    drill_fields: [opportunitylineitem_drill*,total_price,total_open_arr,total_arr,total_open_and_booked_arr]
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
    sql: ${opportunitylineitem.totalprice};;
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

}
