# The name of this view in Looker is "Fact Ns Billing"
view: fact_ns_billing {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "FINANCE"."FACT_NS_BILLING"
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Account ID" in Explore.

  dimension: account_id {
    type: string
    sql: ${TABLE}."ACCOUNT_ID" ;;
  }

  measure: account_id_cnt {
    type: count_distinct
    sql: ${account_id} ;;
  }

  dimension: companyname {
    type: string
    sql: ${TABLE}."COMPANYNAME" ;;
  }

  dimension: csm_owner {
    type: string
    sql: ${TABLE}."CSM_OWNER" ;;
  }

  dimension: days_open {
    type: number
    sql: ${TABLE}."DAYS_OPEN" ;;
  }

  dimension: days_overdue {
    type: number
    sql: ${TABLE}."DAYS_OVERDUE" ;;
  }

  dimension: defaultbillingaddress {
    type: number
    sql: ${TABLE}."DEFAULTBILLINGADDRESS" ;;
  }

  dimension: domain {
    type: string
    sql: ${TABLE}."DOMAIN" ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: due {
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
    sql: ${TABLE}."DUE_DATE" ;;
  }

  dimension: email {
    type: string
    hidden: yes
    sql: ${TABLE}."EMAIL" ;;
  }

  dimension: entity_no {
    type: number
    sql: ${TABLE}."ENTITY_NO" ;;
  }

  dimension: fiscal_quarter {
    type: string
    sql: ${TABLE}."FISCAL_QUARTER"::varchar ;;
  }

  dimension: fiscal_year {
    type: string
    sql: ${TABLE}."FISCAL_YEAR"::varchar ;;
  }

  dimension: foreigntotal {
    type: number
    description: "Local currency amount"
    sql: ${TABLE}."FOREIGNTOTAL" ;;
  }

  dimension: fx_currency_code {
    type: number
    hidden: yes
    sql: ${TABLE}."FX_CURRENCY_CODE" ;;
  }

  dimension: fxrate {
    type: number
    sql: ${TABLE}."FXRATE" ;;
  }

  dimension_group: invoice {
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
    sql: ${TABLE}."INVOICE_DATE" ;;
  }

  dimension: invoice_id {
    type: string
    sql: ${TABLE}."INVOICE_ID" ;;
  }

  measure: invoice_cnt {
    type: number
    drill_fields: [periodname,invoice_date,product,domain,companyname,account_id,opportunity_id,opportunity_owner,invoice_id,usd_amount]
    sql:  count(distinct ${invoice_id}) ;;
  }

  dimension: invoice_sent {
    type: string
    sql: ${TABLE}."INVOICE_SENT" ;;
  }

  dimension: online {
    type: string
    sql: ${TABLE}."ONLINE" ;;
  }

  dimension: opportunity_id {
    type: string
    sql: ${TABLE}."OPPORTUNITY_ID" ;;
  }

  dimension: opportunity_owner {
    type: string
    sql: ${TABLE}."OPPORTUNITY_OWNER" ;;
  }

  dimension: parent_id {
    type: string
    sql: ${TABLE}."PARENT_ID" ;;
  }

  dimension: parent_name {
    type: string
    sql: ${TABLE}."PARENT_NAME" ;;
  }

  dimension: period_no {
    type: number
    hidden: yes
    sql: ${TABLE}."PERIOD_NO" ;;
  }

  dimension: periodname {
    type: string
    sql: ${TABLE}."PERIODNAME" ;;
  }

  dimension: product {
    type: string
    sql: ${TABLE}."PRODUCT" ;;
  }

  dimension: report_month {
    type: string
    sql: ${TABLE}."REPORT_MONTH"::varchar ;;
  }

  dimension: report_week {
    type: string
    sql: ${TABLE}."REPORT_WEEK"::varchar ;;
  }

  dimension: sfdc_name {
    type: string
    sql: ${TABLE}."SFDC_NAME" ;;
  }

  dimension: shippingaddress {
    type: number
    sql: ${TABLE}."SHIPPINGADDRESS" ;;
  }

  dimension: so_id {
    type: number
    sql: ${TABLE}."SO_ID" ;;
  }

  dimension: stripe_charge_id {
    type: string
    sql: ${TABLE}."STRIPE_CHARGE_ID" ;;
  }

  measure: stripe_charge_id_cnt {
    type: count_distinct
    sql: ${stripe_charge_id} ;;
  }

  dimension: stripe_inv_id {
    type: string
    sql: ${TABLE}."STRIPE_INV_ID" ;;
  }

  dimension: transaction_id {
    type: number
    sql: ${TABLE}."TRANSACTION_ID" ;;
  }

  dimension: usd_amount {
    type: number
    sql: ${TABLE}."USD_AMOUNT" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_usd_amount {
    type: sum
    value_format: "$#,##0.00"
    drill_fields: [periodname,invoice_date,product,domain,companyname,account_id,opportunity_id,opportunity_owner,invoice_id,usd_amount]
    sql: ${usd_amount} ;;
  }

  measure: average_usd_amount {
    type: number
    value_format: "$#,##0.00"
    drill_fields: [periodname,invoice_date,product,domain,companyname,account_id,opportunity_id,opportunity_owner,invoice_id,usd_amount]
    sql: div0(${total_usd_amount},${invoice_cnt}) ;;
  }

  measure: average_days_open {
    type: number
    value_format: "0.0"
    drill_fields: [days_open,companyname, sfdc_name, periodname, parent_name,invoice_id,invoice_date,due_date,usd_amount]
    sql: sum(${days_open}*${usd_amount})/${total_usd_amount} ;;
  }

  measure: average_days_overdue {
    type: number
    value_format: "0.0"
    drill_fields: [days_overdue,companyname, sfdc_name, periodname, parent_name,invoice_id,invoice_date,due_date,usd_amount]
    sql: sum(${days_overdue}*${usd_amount})/${total_usd_amount} ;;
  }
}
