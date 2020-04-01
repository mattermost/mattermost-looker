view: available_renewals {
  sql_table_name: "CS"."FY21_AVAILABLE_RENEWALS";;

  dimension: compound_primary {
    hidden: yes
    type: string
    primary_key: yes
    sql: ${account_sfid} || ${license_end_qtr} ;;
  }

  dimension: account_name {
    hidden: yes
    type: string
    sql: ${TABLE}."ACCOUNT_NAME" ;;
  }

  dimension: account_sfid {
    hidden: yes
    type: string
    sql: ${TABLE}."ACCOUNT_SFID" ;;
  }

  dimension: available_renewals {
    hidden: yes
    type: number
    sql: ${TABLE}."AVAILABLE_RENEWALS" ;;
  }

  dimension: bookings_ending {
    hidden: yes
    type: number
    sql: ${TABLE}."BOOKINGS_ENDING" ;;
  }

  dimension: early_renewal_bookings {
    hidden: yes
    type: number
    sql: ${TABLE}."EARLY_RENEWAL_BOOKINGS" ;;
  }

  dimension: early_renewal_qtr {
    type: string
    sql: ${TABLE}."EARLY_RENEWAL_QTR" ;;
  }

  dimension: license_end_qtr {
    type: string
    sql: ${TABLE}."LICENSE_END_QTR" ;;
  }

  dimension: close_current_fy {
    hidden: yes
    type:  yesno
    sql: ${opportunity.close_fiscal_year} = util.fiscal_year(current_date);;
  }

  dimension: close_current_qtr {
    hidden: yes
    type:  yesno
    sql: ${opportunity.close_quarter} = util.fiscal_year(current_date)||'-'||util.fiscal_quarter(current_date);;
  }

  dimension: close_same_qtr {
    hidden: yes
    type:  yesno
    sql: ${opportunity.close_quarter} = license_end_qtr;;
  }

  dimension: is_renewal {
    hidden: yes
    type:  yesno
    sql: ${opportunitylineitem.product_line_type} = 'Ren';;
  }

  measure: count_accounts {
    type: count_distinct
    sql: ${account_sfid} ;;
    drill_fields: [account_name]
  }

  measure: total_available_renewals {
    value_format_name: "usd_0"
    type: sum_distinct
    sql: ${available_renewals} ;;
  }

  measure: total_bookings_ending {
    value_format_name: "usd_0"
    type: sum_distinct
    sql: ${bookings_ending} ;;
  }

  measure: total_early_renewal_bookings {
    value_format_name: "usd_0"
    type: sum_distinct
    sql: ${early_renewal_bookings} ;;
  }

  measure: total_bookings_curr_fy {
    group_label: "Total Bookings"
    group_item_label: "Current FY"
    label: "Total Bookings Current FY"
    sql: case when ${opportunitylineitem.length_days} >=365 then ${opportunitylineitem.arr} else ${opportunitylineitem.totalprice} end;;
    type: sum
    value_format_name: "usd_0"
    filters: {
      field: opportunity.iswon
      value: "yes"
    }
    filters: {
      field: close_current_fy
      value: "yes"
    }
    filters: {
      field: is_renewal
      value: "yes"
    }
    drill_fields: [account.name, opportunity.name, total_bookings_curr_fy]
  }

  measure: total_bookings_same_qtr {
    group_label: "Total Bookings"
    group_item_label: "Closed in Renewal Qtr"
    label: "Total Bookings Closed in Renewal Qtr"
    sql: case when ${opportunitylineitem.length_days} >=365 then ${opportunitylineitem.arr} else ${opportunitylineitem.totalprice} end;;
    type: sum
    value_format_name: "usd_0"
    filters: {
      field: opportunity.iswon
      value: "yes"
    }
    filters: {
      field: close_same_qtr
      value: "yes"
    }
    filters: {
      field: is_renewal
      value: "yes"
    }
    drill_fields: [account.name, opportunity.name, total_bookings_same_qtr]
  }

  measure: total_bookings_open {
    group_label: "Total Bookings"
    group_item_label: "Open Current Qtr"
    label: "Total Bookings Open Current Qtr"
    sql: case when ${opportunitylineitem.length_days} >=365 then ${opportunitylineitem.potential_arr} else ${opportunitylineitem.totalprice} end;;
    type: sum
    value_format_name: "usd_0"
    filters: {
      field: opportunity.isclosed
      value: "no"
    }
    filters: {
      field: close_current_qtr
      value: "yes"
    }
    filters: {
      field: is_renewal
      value: "yes"
    }
    drill_fields: [account.name, opportunity.name, total_bookings_forcast]
  }

  measure: total_bookings_forcast {
    group_label: "Total Bookings"
    group_item_label: "Forecasted Current Qtr"
    label: "Total Bookings Forecasted Current Qtr"
    sql: ${opportunity.probability}/100.00 * (case when ${opportunitylineitem.length_days} >=365 then ${opportunitylineitem.potential_arr} else ${opportunitylineitem.totalprice} end);;
    type: sum
    value_format_name: "usd_0"
    filters: {
      field: opportunity.isclosed
      value: "no"
    }
    filters: {
      field: close_current_qtr
      value: "yes"
    }
    filters: {
      field: is_renewal
      value: "yes"
    }
    drill_fields: [account.name, opportunity.name, total_bookings_forcast]
  }
}
