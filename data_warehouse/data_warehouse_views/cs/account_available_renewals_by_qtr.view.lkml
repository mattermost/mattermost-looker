view: account_available_renewals_by_qtr {
  sql_table_name: "CS"."ACCOUNT_AVAILABLE_RENEWALS_BY_QTR";;
  view_label: "Account Available Renewals by Qtr"

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

  dimension: license_end_fy {
    type: string
    sql: SPLIT_PART(${license_end_qtr},'-',1) ;;
  }

  dimension: close_same_fy {
    hidden: yes
    type:  yesno
    sql: ${opportunity.close_fiscal_year} = ${license_end_fy};;
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

  measure: total_bookings_renewal_year {
    label: "Total Bookings in Renewal Year"
    sql: case when ${opportunitylineitem.length_days} >=365 then ${opportunitylineitem.arr} else ${opportunitylineitem.totalprice} end;;
    type: sum
    value_format_name: "usd_0"
    filters: {
      field: opportunity.iswon
      value: "yes"
    }
    filters: {
      field: close_same_fy
      value: "yes"
    }
    filters: {
      field: is_renewal
      value: "yes"
    }
    drill_fields: [account.name, opportunity.name, total_bookings_renewal_year]
    sql_distinct_key: ${opportunitylineitem.sfid} ;;
  }

  measure: total_bookings_same_qtr {
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
    sql_distinct_key: ${opportunitylineitem.sfid} ;;
  }

  measure: total_lost_renewal_year {
    label: "Total Closed Lost in Renewal Year"
    sql: case when ${opportunitylineitem.length_days} >=365 then ${opportunitylineitem.lost_arr} else ${opportunitylineitem.totalprice} end;;
    type: sum
    value_format_name: "usd_0"
    filters: {
      field: opportunity.iswon
      value: "no"
    }
    filters: {
      field: opportunity.isclosed
      value: "yes"
    }
    filters: {
      field: is_renewal
      value: "yes"
    }
    drill_fields: [account.name, opportunity.name, total_lost_renewal_year]
    sql_distinct_key: ${opportunitylineitem.sfid} ;;
  }

  measure: total_bookings_not_same_qtr {
    label: "Total Closed Not in Renewal Qtr"
    sql: case when ${opportunitylineitem.length_days} >=365 then ${opportunitylineitem.arr} else ${opportunitylineitem.totalprice} end;;
    type: sum
    value_format_name: "usd_0"
    filters: {
      field: opportunity.iswon
      value: "yes"
    }
    filters: {
      field: close_same_qtr
      value: "no"
    }
    filters: {
      field: close_same_fy
      value: "yes"
    }
    filters: {
      field: is_renewal
      value: "yes"
    }
    drill_fields: [account.name, opportunity.name, total_bookings_not_same_qtr]
    sql_distinct_key: ${opportunitylineitem.sfid} ;;
  }
}
