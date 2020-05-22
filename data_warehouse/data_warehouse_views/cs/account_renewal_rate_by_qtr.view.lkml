view: account_renewal_rate_by_qtr {
  sql_table_name: "CS"."ACCOUNT_RENEWAL_RATE_BY_QTR"
    ;;

  set: standard_drill_fields {
    fields: [account.name, account.owner_name, account.csm_name, available_renewals, gross_renewal_amount, renewal_rate_by_qtr]
  }


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
    drill_fields: [standard_drill_fields*]
    value_format_name: usd_0
  }

  measure: gross_forecasted_renewal_total_amount {
    type: sum
    sql: ${TABLE}."GROSS_FORECASTED_RENEWAL_TOTAL_AMOUNT" + ${TABLE}."GROSS_RENEWAL_AMOUNT" ;;
    drill_fields: [standard_drill_fields*]
    value_format_name: usd_0
  }

  measure: gross_max_renewal_total_amount {
    type: sum
    sql: ${TABLE}."GROSS_OPEN_RENEWAL_TOTAL_AMOUNT" + ${TABLE}."GROSS_RENEWAL_AMOUNT" ;;
    drill_fields: [standard_drill_fields*]
    value_format_name: usd_0
  }

  dimension: gross_renewal_amount_dim {
    hidden: yes
    type: number
    sql: ${TABLE}."GROSS_RENEWAL_AMOUNT" ;;
    drill_fields: [standard_drill_fields*]
    value_format_name: usd_0
  }

  measure: gross_renewal_amount {
    type: sum
    sql: ${TABLE}."GROSS_RENEWAL_AMOUNT" ;;
    drill_fields: [standard_drill_fields*]
    value_format_name: usd_0
  }

  measure: forecast_renewal_rate_by_qtr {
    type: number
    sql: ((${gross_forecasted_renewal_total_amount})/${available_renewals})*100 ;;
    value_format: "@{percent}"
   html: @{cond_style_attain} ;;
    drill_fields: [standard_drill_fields*]
  }

  measure: gross_max_renewal_rate_by_qtr {
    type: number
    sql: ((${gross_max_renewal_total_amount})/${available_renewals})*100 ;;
    value_format: "@{percent}"
    html: @{cond_style_attain} ;;
    drill_fields: [standard_drill_fields*]
  }

  measure: renewal_rate_by_qtr {
    type: number
    sql: (${gross_renewal_amount}/${available_renewals})*100 ;;
    value_format: "@{percent}"
    html: @{cond_style_attain} ;;
    drill_fields: [standard_drill_fields*]
  }

  measure: count_accounts {
    type: count_distinct
    sql: ${account_sfid} ;;
    filters: {
      field: gross_renewal_amount_dim
      value: ">0"
    }
    drill_fields: [standard_drill_fields*]
  }

}
