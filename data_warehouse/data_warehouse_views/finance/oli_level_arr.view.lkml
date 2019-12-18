view: oli_level_arr {
  sql_table_name: FINANCE.OLI_LEVEL_ARR ;;

  dimension: account_name {
    type: string
    sql: ${TABLE}."ACCOUNT_NAME" ;;
    description: "Account Name in Salesforce"
    link: {
      label: "Salesforce"
      url: "https://na82.lightning.force.com/lightning/r/Account/{{account_sfid}}/view"
      icon_url: "https://cdn.worldvectorlogo.com/logos/salesforce-2.svg"
    }
  }

  dimension: account_sfid {
    type: string
    sql: ${TABLE}."ACCOUNT_SFID" ;;
    description: "Account ID in Salesforce"
  }

  dimension_group: date {
    type: time
    timeframes: [
      date,
      month,
      fiscal_quarter,
      year,
      fiscal_year
    ]
    datatype: date
    sql: ${TABLE}."DATE" ;;
  }

  dimension: length {
    type: number
    sql: ${TABLE}."DAYS";;
    description: "product end date - product start date (days)"
  }

  dimension_group: start {
    type: time
    timeframes: [
      date,
      month,
      fiscal_quarter,
      year,
      fiscal_year
    ]
    datatype: date
    sql: ${TABLE}."START_DATE" ;;
    description: "Product start date"
  }

  dimension_group: end {
    type: time
    timeframes: [
      date,
      month,
      fiscal_quarter,
      year,
      fiscal_year
    ]
    datatype: date
    sql: ${TABLE}."END_DATE" ;;
    description: "Product end date"
  }

  dimension: iswon {
    type: yesno
    label: "Is Won?"
    sql: ${TABLE}."ISWON" ;;
    description: "Opportunity marked as Closed Won"
  }

  dimension: oli_arr {
    type: number
    sql: ${TABLE}."OLI_ARR" ;;
    description: "Total price of product"
  }

  dimension: oli_arr_norm {
    type: number
    sql: ${TABLE}."OLI_ARR_NORM" ;;
    description: "365 * (Total price of product) / (product end date - product start date)"
  }

  dimension: oli_sfid {
    type: string
    sql: ${TABLE}."OLI_SFID" ;;
    description: "Opportunity Line Item ID in Salesforce"
  }

  dimension: opportunity_sfid {
    type: string
    sql: ${TABLE}."OPPORTUNITY_SFID" ;;
    description: "Opportunity ID in Salesforce"
  }

  dimension: parent_account_name {
    type: string
    sql: ${TABLE}."PARENT_ACCOUNT_NAME" ;;
    description: "Parent Account Name in Salesforce"
    link: {
      label: "Salesforce"
      url: "https://na82.lightning.force.com/lightning/r/Account/{{parent_account_sfid}}/view"
      icon_url: "https://cdn.worldvectorlogo.com/logos/salesforce-2.svg"
    }
  }

  dimension: parent_account_sfid {
    type: string
    sql: ${TABLE}."PARENT_ACCOUNT_SFID" ;;
    description: "Parent Account ID in Salesforce"
  }

  dimension: product_line_type {
    type: string
    sql: ${TABLE}."PRODUCT_LINE_TYPE" ;;
    description: "Opportunity line item product line type"
  }

  dimension: product_name {
    type: string
    sql: ${TABLE}."PRODUCT_NAME" ;;
    description: "Product name of opportunity line item"
  }

  dimension: is_seat {
    type: yesno
    sql: (${product_name} like '%E10%' or ${product_name} like '%E20%' or ${product_name} like '%E25%') AND ${product_name} not like '%Support%';;
  }

  dimension: is_support {
    type: yesno
    sql: ${product_name} like '%Support%' AND  (${product_name} not like '%E10%' and ${product_name} not like '%E20%' and ${product_name} not like '%E25%');;
  }

  dimension: is_seat_w_support {
    type: yesno
    sql: (${product_name} like '%E10%' or ${product_name} like '%E20%' or ${product_name} like '%E25%') AND ${product_name} like '%Support%' ;;
  }

  dimension: product_type {
    type: string
    sql: ${TABLE}."PRODUCT_TYPE" ;;
    description: "Opportunity line item product type"
  }

  dimension: revenue_type {
    type: string
    sql: ${TABLE}."REVENUE_TYPE" ;;
    description: "Opportunity line item revenue type"
  }

  dimension: seats {
    type: number
    sql: ${TABLE}."SEATS" ;;
    description: "Opportunity line item seats"
  }

  measure: total_seats {
    type: sum
    sql: ${seats} ;;
    description: "Total seats"
  }

  measure: total_oli_arr_norm {
    type: sum
    sql: ${oli_arr_norm} ;;
    label: "Total ARR Norm."
    description: "Total ARR Norm."
  }

  measure: total_oli_arr {
    type: sum
    sql: ${oli_arr} ;;
    label: "Total ARR"
    description: "Total ARR"
  }

  measure: oli_arr_per_seat {
    type: number
    sql: ${total_oli_arr}/${total_seats} ;;
    label: "Total ARR per Seat"
    description: "Total ARR / Total Seats"
  }

  measure: oli_arr_norm_per_seat {
    type: number
    sql: ${total_oli_arr_norm}/${total_seats} ;;
    label: "Total ARR Norm. per Seat"
    description: "Total ARR / Total Seats"
  }

  measure: count {
    type: count
    drill_fields: [parent_account_name, account_name, product_name]
  }
}
