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
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension: po_number {
    description: "PO ID"
    primary_key: yes
    type: string
    sql: ${TABLE}.po_number ;;
  }

  dimension: external_id {
    description: "External system reference"
    type: string
    sql: ${TABLE}.external_id ;;
  }

  dimension: requested_by {
    description: "PO Requestor"
    type: string
    sql: ${TABLE}.requested_by ;;
  }

  dimension: submitted_by {
    description: "Submission made by"
    type: string
    sql: ${TABLE}.submitted_by ;;
  }

  dimension: department {
    description: "Department budget owner"
    type: string
    sql: ${TABLE}.dept ;;
  }

  dimension: vendor_id {
    type: string
    sql: ${TABLE}.vendor_id ;;
  }

  dimension: vendor_name {
    type: string
    sql: ${TABLE}.vendor_name ;;
  }

  dimension: po_issuedate {
    description: "Date PO was requested"
    type: date
    sql: ${TABLE}.po_issue_date::date ;;
  }

  dimension: start_date {
    description: "PO start date"
    type:  date
    sql: ${TABLE}.start_date::date ;;
  }

  dimension: end_date {
    description: "PO end date"
    type:  date
    sql: ${TABLE}.start_date::date ;;
  }

  dimension: status {
    description: "Active Status of PO"
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: approval_workflow {
    description: "Workflow stage of PO"
    type: string
    sql: ${TABLE}.approval_workflow ;;
  }

  dimension: approver_pending {
    description: "Awaiting approval of this person"
    type: string
    sql:${TABLE}.approver_pending ;;
  }

  dimension: location {
    description: "Geography of spend"
    type: string
    sql: ${TABLE}.location ;;
  }

  dimension: business_unit {
    description: "Business Unit"
    type: string
    sql: ${TABLE}.business_unit ;;
  }

  dimension: last_approved_date {
    description: "Last Approved Date"
    type: date
    sql: ${TABLE}.last_approved_date::date ;;
  }

  dimension: final_approval_date {
    description: "Final Approved Date"
    type: date
    sql: ${TABLE}.final_approval_date::date ;;
  }

  dimension: days_open {
    description: "No of days PO is open"
    type: number
    sql: datediff(day,${po_issuedate},${final_approval_date}) ;;
  }

  dimension: transact_currency {
    description: "Transaction Currency"
    type: string
    sql: ${TABLE}.currency_code ;;
  }

  dimension: functional_currency {
    description: "Functional Currency"
    type: string
    sql: ${TABLE}.functional_currency_code ;;
  }

  dimension: expense_acct {
    description: "GL account expense is debited"
    type: string
    sql: spit_part(${TABLE}.debit_entries,':',1) ;;
  }

  dimension: expense_sub_acct {
    description: "GL expense subaccount debited"
    type: string
    sql: spit_part(${TABLE}.debit_entries,':',2) ;;
  }

  measure: count_po_submitted {
    description: "Count of PO's submitted during period"
    type:  count_distinct
    sql:${TABLE}.po_number ;;
  }

  measure: count_po_rejected {
    description: "Count of PO's rejected"
    type: sum
    sql: iff(${status}='REJECTED',1,0) ;;
  }

  measure: count_po_closed {
    description: "Count of PO's closed"
    type: sum
    sql: iff(${status}='closed',1,0) ;;
  }

  measure: count_po_open {
    description: "Count of PO's open"
    type: sum
    sql: iff(${status}='open',1,0) ;;
  }

  measure: count_po_pending {
    description: "Count of PO's pending"
    type: sum
    sql: iff(${status}='open',1,0) ;;
  }

  measure: po_gross_amount {
    description: "Accrualify PO Gross Amount"
    type:  sum
    sql: ${TABLE}.gross_amt ;;
  }

  measure: invoice_total {
    type: sum
    sql: ${TABLE}.invoice_total ;;
  }

  measure: receiving_total {
    type: sum
    sql: ${TABLE}.receiving_total ;;
  }

  measure: accrual_total {
    type:  sum
    sql: ${TABLE}.accrual_total ;;
  }

  measure: open_po_balance {
    type: sum
    sql: ${TABLE}.accrual_total ;;
  }

  measure: absolute_net {
    type: sum
    sql: ${TABLE}.absolute_net ;;
  }





}
