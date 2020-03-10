view: opportunitylineitem {
  sql_table_name: orgm.opportunitylineitem ;;
  drill_fields: [id]

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
    type: time
    timeframes: [
      date,
      month,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."end_date__c" ;;
  }

  dimension: is_prorated_expansion {
    type: string
    sql: ${TABLE}."is_prorated_expansion__c" ;;
  }

  dimension: isdeleted {
    type: yesno
    sql: ${TABLE}."isdeleted" ;;
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
    type: time
    timeframes: [
      date,
      month,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."start_date__c" ;;
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

  dimension: arr_contributed {
    label: "ARR Contributed"
    type: number
    sql: ${TABLE}.arr_contributed__c ;;
    value_format_name: "usd"
  }

  dimension: arr_delta {
    label: "ARR Delta"
    type: number
    sql: ${arr} - ${arr_contributed} ;;
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

   measure: count {
    label: "# of Opportunity Line Items"
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
