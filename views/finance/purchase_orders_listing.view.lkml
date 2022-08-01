# The name of this view in Looker is "Purchase Orders Listing"
view: purchase_orders_listing {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "FINANCE_ACCRUALIFY"."POS"
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called " Sdc Row" in Explore.


  measure: absolute_net {
    description: "Original PO value minus all invoices logged (including OPEN and PENDING)"
    type: sum
    value_format: "$#,##0.00"
    sql: ${TABLE}."ABSOLUTE_NET" ;;
  }

  measure: accrual_total {
    description: "Unused portion of the PO"
    value_format: "$#,##0.00"
    type: sum
    sql: ${TABLE}."ACCRUAL_TOTAL" ;;
  }

  dimension: approval_workflow {
    type: string
    description: "Approved, Pending, Rejected"
    sql: ${TABLE}."APPROVAL_WORKFLOW" ;;
  }

  dimension: approver_pending {
    type: string
    description: "Approver needed before advancing to next stage"
    sql: ${TABLE}."APPROVER_PENDING" ;;
  }

  dimension: business_unit {
    type: string
    description: "Systems, Consultants, Community"
    sql: ${TABLE}."BUSINESS_UNIT" ;;
  }

  dimension: currency_code {
    type: string
    description: "USD EUR CAD"
    sql: ${TABLE}."CURRENCY_CODE" ;;
  }

  measure: days_open {
    type: average
    value_format: "0"
    description: "Average Processing Days to Open PO"
    sql: ${TABLE}."DAYS_OPEN" ;;
  }

  measure: count_opened_within_month {
    description: "PO's opened within 30 days"
    type: count_distinct
    sql: iff(days_open<=20,${po_number},null) ;;
  }

  dimension: opened_within_month {
    type: string
    description: "Purchase Order was successfully opened within 20 bus days"
    sql: iff(days_open <=20,'Yes','No') ;;
  }

  measure: days_finance {
    type: average
    value_format: "0"
    description: "Average Processing Days for Finance to approve after manager approval"
    sql: ${TABLE}.days_finance ;;
  }

  measure: days_legal {
    type: average
    value_format: "0"
    description: "Average Processing Days for Legal"
    sql: ${TABLE}.days_legal ;;
  }

  measure: days_manager {
    type: average
    value_format: "0"
    description: "Average Processing Days for Manager to approve after Legal approval"
    sql: ${TABLE}.days_manager__de::number ;;
  }

  dimension: debit_entries {
    type: string
    description: "List of multiple account numbers charged for the POs"
    sql: ${TABLE}."DEBIT_ENTRIES" ;;
  }

  dimension: first_account {
    type: string
    description: "First account allocated with PO amount"
    sql: split_part(${TABLE}."DEBIT_ENTRIES",',',1) ;;
  }

  dimension: first_account_number {
    type: string
    description: "Account number of first account"
    sql: split_part(${first_account},'-',1) ;;
  }

  dimension: first_account_name {
    type: string
    description: "Account name of first account"
    sql: split_part(${first_account},'-',2) ;;
  }

  dimension: second_account {
    type: string
    description: "Second account allocated with PO amount"
    sql: split_part(${TABLE}."DEBIT_ENTRIES",',',2) ;;
  }

  dimension: third_account {
    type: string
    description: "Second account allocated with PO amount"
    sql: split_part(${TABLE}."DEBIT_ENTRIES",',',3) ;;
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

  dimension: finance_approval {
    type: date
    sql: ${TABLE}."finance_approval"::date ;;
  }

  measure: functional_amount {
    type: sum
    value_format: "$#,##0.00"
    sql: ${TABLE}."FUNCTIONAL_AMOUNT" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.


  dimension: functional_currency_code {
    type: string
    sql: ${TABLE}."FUNCTIONAL_CURRENCY_CODE" ;;
  }

  measure: Total_PO_Amount {
    description: "Total PO Amount"
    type: sum
    value_format: "$#,##0.00"
    sql: ${TABLE}."GROSS_AMOUNT" ;;
  }

  measure: Average_PO_Amount {
    description: "Average PO Amount"
    type: average
    value_format: "$#,##0.00"
    sql: ${TABLE}."GROSS_AMOUNT" ;;
  }

  measure: invoice_balance {
    type: sum
    value_format: "$#,##0.00"
    sql: ${TABLE}."INVOICE_BALANCE" ;;
  }

  measure: invoice_total {
    type: sum
    value_format: "$#,##0.00"
    sql: ${TABLE}."INVOICE_TOTAL" ;;
  }

  dimension: last_approved_date {
    type: date
    sql: ${TABLE}."LAST_APPROVED_DATE"::date ;;
  }

  dimension: legal_approval {
    type: date
    sql: ${TABLE}."legal_approval"::date ;;
  }


  dimension: location {
    type: string
    sql: ${TABLE}."LOCATION" ;;
  }

  dimension: manager_approval {
    type: date
    sql: ${TABLE}."manager_approval"::date ;;
  }

  dimension: notes {
    type: string
    sql: ${TABLE}."NOTES" ;;
  }

  measure: open_po_balance {
    type: sum
    value_format: "$#,##0.00"
    sql: ${TABLE}."OPEN_PO_BALANCE" ;;
  }

  dimension: po_number {
    type: string
    sql: ${TABLE}."PO_NUMBER" ;;
  }

  dimension: vendor_name {
    type: string
    sql: ${TABLE}."VENDOR_NAME" ;;
  }

  dimension_group: po_queue_days {
    type: duration
    intervals: [day,week,month]
    drill_fields: [dept,vendor_name,po_number]
    sql_start: ${TABLE}."PO_ISSUE_DATE"::date ;;
    sql_end: ${final_approval_date} ;;
  }

  dimension: po_request_wk {
    description: "Week started Sunday"
    drill_fields: [dept,vendor_name,po_number,Total_PO_Amount]
    type: date_week
    sql: ${TABLE}."PO_ISSUE_DATE"::date;;
  }

  dimension: po_request_month {
    type: date_month
    sql: ${TABLE}."PO_ISSUE_DATE"::date;;
  }

  dimension: po_request_yr {
    description: "Week started Sunday"
    type: date_year
    sql: ${TABLE}."PO_ISSUE_DATE"::date;;
  }

  dimension: po_request {
    type: date
    sql: ${TABLE}."PO_ISSUE_DATE"::date;;
  }

  measure: po_cnt {
    type: count_distinct
    sql: ${TABLE}."PO_NUMBER" ;;
  }

  measure: receiving_total {
    value_format: "$#,##0.00"
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



  measure: count {
    type: count
    drill_fields: [vendor_name]
  }
}
