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
    fields: [account.name,opportunity.name, account.csm_name, account.owner_name, opportunity.close_date,
      opportunity.forecastcategoryname, opportunity.probability, opportunityproduct.name,opportunity.license_start_date,opportunity.license_end_date]
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
      total_seat_quantity,
      total_quantity,
      is_seat,
      total_price,
      total_bookings,
      is_prorated_expansion,
      new_amount,
      renewal_amount,
      expansion_amount,
      coterm_expansion_amount,
      leftover_expansion_amount,
      multi_amount,
      ren_multi_amount
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
    sql: ${TABLE}.discount_calc__c;;
    type: number
  }

  dimension: discount_old {
    sql: ${TABLE}.discount;;
    type: number
    hidden: yes
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

  dimension: is_coterm {
    hidden: yes
    sql: ${is_prorated_expansion} = 'Co-Termed Expansion';;
    type: yesno
  }

  dimension: is_discounted {
    hidden: yes
    sql: ${discount} != 0;;
    type: yesno
  }

  dimension: is_deleted {
    sql: ${TABLE}.isdeleted;;
    type: yesno
  }

  dimension: is_nonprofit {
    sql: ${name} like '%E%0 (Non-profit)';;
    hidden: yes
    type: yesno
  }

  dimension: is_academic {
    sql: ${name} like '%E%0 (Academic)' or ${name} like '%E%0 (Student)' ;;
    hidden: yes
    type: yesno
  }

  dimension: is_nfr {
    sql: ${name} like '%E%0 - Not For Resale';;
    hidden: yes
    type: yesno
  }

  dimension: is_nonrecurring {
    sql: ${product_type} != 'Recurring';;
    hidden: yes
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

  dimension: pricing_method {
    sql: ${TABLE}.Pricing_Method__c;;
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
    sql: case when not ${opportunity.isclosed} AND NOT (${opportunity.type} = 'New Subscription' OR (${opportunity.type} = 'Contract Expansion' AND ${product_line_type} = 'New')) AND ${length_days} <> 0 AND ${product_type} = 'Recurring' then 365*${totalprice}/${length_days} else 0 end ;;
    type: number
    value_format_name: "usd_0"
  }

  dimension: potential_new_arr {
    label: "Potential New ARR"
    sql: case when not ${opportunity.isclosed} AND (${opportunity.type} = 'New Subscription' OR (${opportunity.type} = 'Contract Expansion' AND ${product_line_type} = 'New')) AND ${length_days} <> 0 AND ${product_type} = 'Recurring' then 365*${totalprice}/${length_days} else 0 end ;;
    type: number
    value_format_name: "usd_0"
  }

  dimension: potential_expansion_arr {
    label: "Potential Expansion ARR"
    sql: case when not ${opportunity.isclosed} AND ((${product_line_type} = 'Expansion' AND NOT COALESCE(${is_loe},FALSE)) OR ${opportunity.type} = 'Account Expansion') AND ${length_days} <> 0 AND ${product_type} = 'Recurring' then 365*${totalprice}/${length_days} else 0 end ;;
    type: number
    value_format_name: "usd_0"
  }

  dimension: potential_renewal_arr {
    label: "Potential Renewal ARR"
    sql: case when not ${opportunity.isclosed} AND (${product_line_type} IN ('Ren','Multi','Ren-Multi') OR ${is_loe}) AND ${length_days} <> 0 AND ${product_type} = 'Recurring' then 365*${totalprice}/${length_days} else 0 end ;;
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


  dimension: amount_manual_override {
    group_label: "Product Line Type Totals"
    sql: ${TABLE}.amount_manual_override__c;;
    type: yesno
  }

  dimension: is_seat {
    hidden: yes
    sql: CASE WHEN ${product2.name} like '%E10%' OR ${product2.name} like '%E20%' OR ${product2.name} like '%E25%' THEN TRUE ELSE FALSE END;;
    type: yesno
  }

  dimension: subscription_id {
    sql: ${TABLE}.subs_id__c;;
    type: string
  }

  dimension: portal_purchased {
    label: "Portal Purchased?"
    sql: ${subscription_id} IS NOT NULL;;
    type: yesno
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

  measure: total_seat_quantity {
    label: "Total Seat Quantity"
    sql: ${quantity} ;;
    type: sum
    filters: {
      field: is_seat
      value: "yes"
    }
    drill_fields: [opportunitylineitem_drill*,total_seat_quantity]
  }

  measure: total_quantity {
    label: "Total SKU Quantity"
    description: ""
    sql: ${quantity} ;;
    type: sum
    drill_fields: [opportunitylineitem_drill*,total_quantity]
  }

  measure: total_discounted {
    label: "Count Discounted Line Items"
    group_label: "Counts"
    description: ""
    sql: ${sfid} ;;
    filters: [is_discounted: "yes"]
    type: count_distinct
    drill_fields: [opportunitylineitem_drill*,total_discounted, discount]
  }

  measure: total_nonprofit {
    label: "Count Non-Profit Line Items"
    group_label: "Counts"
    description: ""
    sql: ${sfid} ;;
    filters: [is_nonprofit: "yes"]
    type: count_distinct
    drill_fields: [opportunitylineitem_drill*,total_nonprofit]
  }

  measure: total_academic {
    label: "Count Academic / Student Line Items"
    group_label: "Counts"
    description: ""
    sql: ${sfid} ;;
    filters: [is_academic: "yes"]
    type: count_distinct
    drill_fields: [opportunitylineitem_drill*,total_academic]
  }

  measure: total_nfr {
    label: "Count NFR Line Items"
    group_label: "Counts"
    description: ""
    sql: ${sfid} ;;
    filters: [is_nfr: "yes"]
    type: count_distinct
    drill_fields: [opportunitylineitem_drill*,total_nfr]
  }

  measure: total_nonrecurring {
    label: "Count Non-Reccuring Line Items"
    group_label: "Counts"
    description: ""
    sql: ${sfid} ;;
    filters: [is_nonrecurring: "yes"]
    type: count_distinct
    drill_fields: [opportunitylineitem_drill*,total_nonrecurring]
  }

  measure: total_special_products {
    label: "Count Special Line Items"
    description: "Count Non-Profit, Student, Acadmic, or Not for Resale Line Items "
    group_label: "Counts"
    sql: ${total_academic} + ${total_nonprofit} + ${total_nfr} ;;
    type: number
    drill_fields: [opportunitylineitem_drill*,total_special_products]
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

  measure: total_potential_new_arr {
    label: "Total Potential New ARR"
    sql: ${potential_new_arr} ;;
    type: sum
    value_format_name: "usd_0"
    drill_fields: [opportunitylineitem_drill*,total_price,total_potential_new_arr]
  }

  measure: total_potential_expansion_arr {
    label: "Total Potential Expansion ARR"
    sql: ${potential_expansion_arr} ;;
    type: sum
    value_format_name: "usd_0"
    drill_fields: [opportunitylineitem_drill*,total_price,total_potential_expansion_arr]
  }

  measure: total_potential_renewal_arr {
    label: "Total Potential Renewal ARR"
    sql: ${potential_renewal_arr} ;;
    type: sum
    value_format_name: "usd_0"
    drill_fields: [opportunitylineitem_drill*,total_price,total_potential_renewal_arr]
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

  measure: total_new_amount_old {
    hidden: yes
    group_label: "Product Line Type Totals (Dep)"
    label: "New"
    description: "Total where Product Line Type = 'New' "
    sql: ${totalprice};;
    type: sum
    value_format_name: mm_usd_short
    drill_fields: [opportunitylineitem_drill*,total_new_amount_old]
    filters: {
      field: product_line_type
      value: "New"
    }
  }

  measure: total_ren_amount_old {
    hidden: yes
    group_label: "Product Line Type Totals (Dep)"
    label: "Renewal"
    description: "Total where Product Line Type = 'Ren' "
    sql: ${totalprice};;
    type: sum
    value_format_name: mm_usd_short
    drill_fields: [opportunitylineitem_drill*,total_ren_amount_old]
    filters: {
      field: product_line_type
      value: "Ren"
    }
  }

  measure: total_loe_amount_old {
    hidden: yes
    group_label: "Product Line Type Totals (Dep)"
    label: "LOE"
    description: "Total where Product Line Type = 'Expansion' and Is Prorated Expansion = 'Leftover Expansion'"
    sql: ${totalprice};;
    type: sum
    value_format_name: mm_usd_short
    drill_fields: [opportunitylineitem_drill*,total_loe_amount_old]
    filters: {
      field: product_line_type
      value: "Expansion"
    }
    filters: {
      field: is_loe
      value: "yes"
    }
  }

  measure: total_coterm_amount_old {
    hidden: yes
    group_label: "Product Line Type Totals (Dep)"
    label: "Co-Term"
    description: "Total where Product Line Type = 'Expansion' and Is Prorated Expansion = 'Co-Term Expansion'"
    sql: ${totalprice};;
    type: sum
    value_format_name: mm_usd_short
    drill_fields: [opportunitylineitem_drill*,total_coterm_amount_old]
    filters: {
      field: product_line_type
      value: "Expansion"
    }
    filters: {
      field: is_coterm
      value: "yes"
    }
  }

  measure: total_exp_only_amount_old {
    hidden: yes
    group_label: "Product Line Type Totals (Dep)"
    label: "Expansion Only"
    description: "Total where Product Line Type = 'Expansion' (does include Co-Term or LOE) "
    sql: ${totalprice};;
    type: sum
    value_format_name: mm_usd_short
    drill_fields: [opportunitylineitem_drill*,total_exp_only_amount_old]
    filters: {
      field: product_line_type
      value: "Expansion"
    }
    filters: {
      field: is_loe
      value: "no"
    }
    filters: {
      field: is_coterm
      value: "no"
    }
  }

  measure: total_exp_amount_old {
    hidden: yes
    group_label: "Product Line Type Totals (Dep)"
    label: "Expansion"
    description: "Total where Product Line Type = 'Expansion' (includes Co-Term) "
    sql: ${totalprice};;
    type: sum
    value_format_name: mm_usd_short
    drill_fields: [opportunitylineitem_drill*,total_exp_amount_old]
    filters: {
      field: product_line_type
      value: "Expansion"
    }
    filters: {
      field: is_loe
      value: "no"
    }
  }

  measure: total_exp_with_loe_amount_old {
    hidden: yes
    label: "Expansion w/LOE"
    group_label: "Product Line Type Totals (Dep)"
    description: "Total where Product Line Type = 'Expansion' (includes Co-Term & Leftover Expansion) "
    sql: ${opportunitylineitem.totalprice};;
    type: sum
    value_format_name: mm_usd_short
    drill_fields: [opportunitylineitem_drill*,total_exp_amount_old]
    filters: {
      field: product_line_type
      value: "Expansion"
    }
  }

  measure: total_multi_amount_old {
    hidden: yes
    group_label: "Product Line Type Totals (Dep)"
    label: "Multi"
    description: "Total where Product Line Type = 'Multi' "
    sql: ${totalprice};;
    type: sum
    value_format_name: mm_usd_short
    drill_fields: [opportunitylineitem_drill*,total_multi_amount_old]
    filters: {
      field: product_line_type
      value: "Multi"
    }
  }

  dimension: new_amount {
    hidden: yes
    sql: ${TABLE}.new_amount__c;;
    type: number
    value_format_name: mm_usd_short
    drill_fields: [opportunitylineitem_drill*,new_amount]
  }

  dimension: renewal_amount {
    hidden: yes
    sql: ${TABLE}.renewal_amount__c;;
    type: number
    value_format_name: mm_usd_short
    drill_fields: [opportunitylineitem_drill*,renewal_amount]
  }

  dimension: expansion_amount {
    hidden: yes
    sql: ${TABLE}.expansion_amount__c;;
    type: number
    value_format_name: mm_usd_short
    drill_fields: [opportunitylineitem_drill*,expansion_amount]
  }

  dimension: expansion_w_coterm_amount {
    hidden: yes
    sql: ${expansion_amount} + ${coterm_expansion_amount};;
    type: number
    value_format_name: mm_usd_short
    drill_fields: [opportunitylineitem_drill*,expansion_w_coterm_amount]
  }

  dimension: coterm_expansion_amount {
    hidden: yes
    sql: ${TABLE}.coterm_expansion_amount__c;;
    type: number
    value_format_name: mm_usd_short
    drill_fields: [opportunitylineitem_drill*,coterm_expansion_amount]
  }

  dimension: leftover_expansion_amount {
    hidden: yes
    sql: ${TABLE}.leftover_expansion_amount__c;;
    type: number
    value_format_name: mm_usd_short
    drill_fields: [opportunitylineitem_drill*,leftover_expansion_amount]
  }

  dimension: multi_amount {
    hidden: yes
    sql: ${TABLE}.multi_amount__c;;
    type: number
    value_format_name: mm_usd_short
    drill_fields: [opportunitylineitem_drill*,multi_amount]
  }

  dimension: ren_multi_amount {
    hidden: yes
    sql: ${TABLE}.renewal_multi_amount__c;;
    type: number
    value_format_name: mm_usd_short
    drill_fields: [opportunitylineitem_drill*,ren_multi_amount]
  }

  measure: total_new_amount {
    group_label: "Product Line Type Totals"
    label: "New"
    sql: ${new_amount};;
    type: sum_distinct
    sql_distinct_key: ${sfid} ;;
    value_format_name: mm_usd_short
    drill_fields: [opportunitylineitem_drill*,total_new_amount]
  }

  measure: total_ren_amount {
    group_label: "Product Line Type Totals"
    label: "Renewal"
    sql: ${renewal_amount};;
    type: sum_distinct
    sql_distinct_key: ${sfid} ;;
    value_format_name: mm_usd_short
    drill_fields: [opportunitylineitem_drill*,total_ren_amount]
  }

  measure: total_exp_only_amount {
    group_label: "Product Line Type Totals"
    label: "Exp Only"
    sql: ${expansion_amount};;
    type: sum_distinct
    sql_distinct_key: ${sfid} ;;
    value_format_name: mm_usd_short
    drill_fields: [opportunitylineitem_drill*,total_exp_only_amount]
  }

  measure: total_coterm_amount {
    group_label: "Product Line Type Totals"
    label: "Co-Term"
    sql: ${coterm_expansion_amount};;
    type: sum_distinct
    sql_distinct_key: ${sfid} ;;
    value_format_name: mm_usd_short
    drill_fields: [opportunitylineitem_drill*,total_coterm_amount]
  }

  measure: total_coterm_acv {
    group_label: "Product Line Type Totals"
    label: "Co-Term ACV"
    sql: ${arr};;
    filters: {
      field: is_coterm
      value: "yes"
    }
    type: sum_distinct
    sql_distinct_key: ${sfid} ;;
    value_format_name: mm_usd_short
    drill_fields: [opportunitylineitem_drill*,total_coterm_amount]
  }

  measure: total_exp_amount {
    group_label: "Product Line Type Totals"
    label: "Exp w/ CoTerm"
    sql: ${expansion_amount} + ${coterm_expansion_amount};;
    type: sum_distinct
    sql_distinct_key: ${sfid} ;;
    value_format_name: mm_usd_short
    drill_fields: [opportunitylineitem_drill*,total_exp_amount]
  }

  measure: total_loe_amount {
    group_label: "Product Line Type Totals"
    label: "LOE"
    sql: ${leftover_expansion_amount};;
    type: sum_distinct
    sql_distinct_key: ${sfid} ;;
    value_format_name: mm_usd_short
    drill_fields: [opportunitylineitem_drill*,total_loe_amount]
  }

  measure: total_exp_with_loe_amount {
    group_label: "Product Line Type Totals"
    label: "Exp w/ CoTerm & LOE"
    sql: ${expansion_amount} + ${coterm_expansion_amount} + ${leftover_expansion_amount};;
    type: sum_distinct
    sql_distinct_key: ${sfid} ;;
    value_format_name: mm_usd_short
    drill_fields: [opportunitylineitem_drill*,total_exp_with_loe_amount]
  }

  measure: total_new_and_exp_with_loe_amount {
    group_label: "Product Line Type Totals"
    label: "New & Exp w/ CoTerm & LOE"
    sql: ${new_amount} + ${expansion_amount} + ${coterm_expansion_amount} + ${leftover_expansion_amount};;
    type: sum_distinct
    sql_distinct_key: ${sfid} ;;
    value_format_name: mm_usd_short
    drill_fields: [opportunitylineitem_drill*,total_new_and_exp_with_loe_amount]
  }

  measure: total_multi_amount {
    group_label: "Product Line Type Totals"
    label: "Multi"
    sql: ${multi_amount};;
    type: sum_distinct
    sql_distinct_key: ${sfid} ;;
    value_format_name: mm_usd_short
    drill_fields: [opportunitylineitem_drill*,total_multi_amount]
  }

  measure: total_ren_multi_amount {
    group_label: "Product Line Type Totals"
    label: "Ren-Multi"
    sql: ${ren_multi_amount};;
    type: sum_distinct
    sql_distinct_key: ${sfid} ;;
    value_format_name: mm_usd_short
    drill_fields: [opportunitylineitem_drill*,total_ren_multi_amount]
  }

}
