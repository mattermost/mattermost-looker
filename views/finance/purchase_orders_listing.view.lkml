# The name of this view in Looker is "Purchase Orders Listing"
view: purchase_orders_listing {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "FINANCE_ACCRUALIFY"."PURCHASE_ORDERS_LISTING"
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called " Sdc Row" in Explore.


  measure: absolute_net {
    type: sum
    sql: ${TABLE}."ABSOLUTE_NET" ;;
  }

  measure: accrual_total {
    type: sum
    sql: ${TABLE}."ACCRUAL_TOTAL" ;;
  }

  dimension: approval_workflow {
    type: string
    sql: ${TABLE}."APPROVAL_WORKFLOW" ;;
  }

  dimension: approver_pending {
    type: string
    sql: ${TABLE}."APPROVER_PENDING" ;;
  }

  dimension: business_unit {
    type: string
    sql: ${TABLE}."BUSINESS_UNIT" ;;
  }

  dimension: currency_code {
    type: string
    sql: ${TABLE}."CURRENCY_CODE" ;;
  }

  dimension: days_open {
    type: string
    sql: ${TABLE}."DAYS_OPEN" ;;
  }

  dimension: days_open__de {
    type: number
    sql: ${TABLE}."DAYS_OPEN__DE" ;;
  }

  dimension: debit_entries {
    type: string
    sql: ${TABLE}."DEBIT_ENTRIES" ;;
  }

  dimension: account {
    type: string
    sql: split_part(${debit_entries},':',1) ;;
  }

  dimension: account_detail {
    type: string
    sql: split_part(${debit_entries},':',2) ;;
  }

  dimension: dept {
    type: string
    sql: ${TABLE}."DEPT" ;;
  }

  dimension: end_date {
    type: date
    sql: ${TABLE}."END_DATE"::date ;;
  }

  dimension: external_id {
    type: string
    sql: ${TABLE}."EXTERNAL_ID" ;;
  }

  dimension: final_approval_date {
    type: date
    sql: ${TABLE}."FINAL_APPROVAL_DATE"::date ;;
  }

  measure: functional_amount {
    type: sum
    sql: ${TABLE}."FUNCTIONAL_AMOUNT" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.


  dimension: functional_currency_code {
    type: string
    sql: ${TABLE}."FUNCTIONAL_CURRENCY_CODE" ;;
  }

  measure: gross_amount {
    type: sum
    sql: ${TABLE}."GROSS_AMOUNT" ;;
  }

  measure: invoice_balance {
    type: sum
    sql: ${TABLE}."INVOICE_BALANCE" ;;
  }

  measure: invoice_total {
    type: sum
    sql: ${TABLE}."INVOICE_TOTAL" ;;
  }

  dimension: last_approved_date {
    type: date
    sql: ${TABLE}."LAST_APPROVED_DATE"::date ;;
  }

  dimension: location {
    type: string
    sql: ${TABLE}."LOCATION" ;;
  }

  dimension: notes {
    type: string
    sql: ${TABLE}."NOTES" ;;
  }

  measure: open_po_balance {
    type: sum
    sql: ${TABLE}."OPEN_PO_BALANCE" ;;
  }

  dimension: po_issue_date {
    type: date
    sql: ${TABLE}."PO_ISSUE_DATE"::date ;;
  }

  dimension: po_number {
    type: string
    sql: ${TABLE}."PO_NUMBER" ;;
  }

  measure: receiving_total {
    type: sum
    sql: ${TABLE}."RECEIVING_TOTAL" ;;
  }

  dimension: requested_by {
    type: string
    sql: ${TABLE}."REQUESTED_BY" ;;
  }

  dimension: start_date {
    type: date
    sql: ${TABLE}."START_DATE"::date ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}."STATUS" ;;
  }

  dimension: submitted_by {
    type: string
    sql: ${TABLE}."SUBMITTED_BY" ;;
  }

  dimension: subsidiary {
    type: string
    sql: ${TABLE}."SUBSIDIARY" ;;
  }

  dimension: vendor_id {
    type: string
    sql: ${TABLE}."VENDOR_ID" ;;
  }

  dimension: vendor_name {
    type: string
    sql: ${TABLE}."VENDOR_NAME" ;;
  }

  measure: count {
    type: count
    drill_fields: [vendor_name]
  }
}
