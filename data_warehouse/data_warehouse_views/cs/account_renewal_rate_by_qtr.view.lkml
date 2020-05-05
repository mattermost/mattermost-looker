view: account_renewal_rate_by_qtr {
  sql_table_name: "CS"."ACCOUNT_RENEWAL_RATE_BY_QTR"
    ;;

  dimension: curr_qtr {
    type: yesno
    sql: ${license_end_qtr} = (util.fiscal_year(current_date - interval '1 day') || '-' || util.fiscal_quarter(current_date - interval '1 day'));;
  }

  dimension: license_end_qtr {
    label: "Renewal Qtr"
    type: string
    sql: ${TABLE}."LICENSE_END_QTR" ;;
  }

  dimension: account_forecast_renewal_rate_by_qtr {
    hidden: yes
    type: number
    sql: ${TABLE}."ACCOUNT_FORECAST_RENEWAL_RATE_BY_QTR" ;;
  }

  dimension: account_renewal_rate_by_qtr {
    hidden: yes
    sql: ${TABLE}."ACCOUNT_RENEWAL_RATE_BY_QTR" ;;
  }

  dimension: account_sfid {
    hidden: yes
    sql: ${TABLE}."ACCOUNT_SFID" ;;
  }

  measure: available_renewals {
    type: sum
    sql: ${TABLE}."AVAILABLE_RENEWALS" ;;
    drill_fields: [account.name, account.account_owner, available_renewals]
    value_format_name: usd_0
  }

  measure: gross_forecasted_renewal_total_amount {
    type: sum
    sql: ${TABLE}."GROSS_FORECASTED_RENEWAL_TOTAL_AMOUNT" + ${TABLE}."GROSS_RENEWAL_AMOUNT" ;;
    drill_fields: [account.name, account.account_owner, available_renewals, gross_forecasted_renewal_total_amount, forecast_renewal_rate_by_qtr]
    value_format_name: usd_0
  }

  dimension: gross_renewal_amount_dim {
    hidden: yes
    type: number
    sql: ${TABLE}."GROSS_RENEWAL_AMOUNT" ;;
    drill_fields: [account.name, account.account_owner, available_renewals, gross_renewal_amount, renewal_rate_by_qtr]
    value_format_name: usd_0
  }


  measure: gross_renewal_amount {
    type: sum
    sql: ${TABLE}."GROSS_RENEWAL_AMOUNT" ;;
    drill_fields: [account.name, account.account_owner, available_renewals, gross_renewal_amount, renewal_rate_by_qtr]
    value_format_name: usd_0
  }

  measure: forecast_renewal_rate_by_qtr {
    type: number
    sql: (${gross_forecasted_renewal_total_amount})/${available_renewals} ;;
    value_format_name: percent_1
    drill_fields: [account.name, account.account_owner, available_renewals, gross_forecasted_renewal_total_amount, forecast_renewal_rate_by_qtr]
  }

  measure: renewal_rate_by_qtr {
    type: number
    sql: ${gross_renewal_amount}/${available_renewals} ;;
    value_format_name: percent_1
    drill_fields: [account.name, account.account_owner, available_renewals, gross_renewal_amount, renewal_rate_by_qtr]
  }

  measure: count_accounts {
    type: count_distinct
    sql: ${account_sfid} ;;
    filters: {
      field: gross_renewal_amount_dim
      value: ">0"
    }
    drill_fields: [account.name, account.account_owner, available_renewals, gross_renewal_amount, renewal_rate_by_qtr]
  }

}
