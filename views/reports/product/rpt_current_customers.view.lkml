view: rpt_current_customers {
  sql_table_name: "REPORTS_PRODUCT".rpt_current_customers ;;
  label: "Active Customers"

  dimension: opportunity_id {
    type: string
    sql: ${TABLE}.opportunity_id ;;
    view_label: "Opportunity"
    primary_key: yes
  }

  ###
  ### Other IDs
  ###


  dimension: account_id {
    type: string
    sql: ${TABLE}.account_id ;;
    view_label: "Account"
  }

  ###
  ### Opportunity info
  ###



  dimension: ending_arr {
    type: number
    sql: ${TABLE}.ending_arr ;;
    view_label: "Opportunity"
  }



  dimension_group: close {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: CAST(${TABLE}.close_at AS TIMESTAMP_NTZ) ;;
    view_label: "Opportunity"
  }


  dimension: opportunity_name {
    type: string
    sql: ${TABLE}.opportunity_name ;;
    label: "Name"
    view_label: "Opportunity"
  }


  dimension: license_key {
    type: string
    sql: ${TABLE}.license_key ;;
    label: "License key(s)"
    view_label: "Opportunity"

  }


  dimension_group: license_starts {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.license_starts_at ;;
    view_label: "Opportunity"
  }


  dimension_group: license_ends {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.license_ends_at ;;
    view_label: "Opportunity"
  }


  ###
  ### Account info
  ###


  dimension: account_name {
    type: string
    sql: ${TABLE}.account_name ;;
    view_label: "Account"
  }

  dimension: account_type {
    type: string
    sql: ${TABLE}.account_type ;;
    view_label: "Account"
  }


  dimension: account_current_arr {
    type: number
    sql: ${TABLE}.account_current_arr ;;
    label: "Current ARR"
    view_label: "Account"
  }

  dimension: total_ending_arr {
    type: number
    sql: ${TABLE}.total_ending_arr ;;
    label: "Total Ending ARR"
    view_label: "Account"
  }

  ###
  ### Metrics
  ###

  measure: count {
    type: count
    drill_fields: [opportunity_id, opportunity_name, account_name]
  }

  measure: count_distinct_accounts {
    type: count_distinct
    sql: ${account_id} ;;
  }
}
