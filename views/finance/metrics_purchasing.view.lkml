# The name of this view in Looker is "Metrics Purchasing"
view: metrics_purchasing {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "FINANCE"."METRICS_PURCHASING"
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Avg Process Days" in Explore.

  dimension: avg_process_days {
    type: number
    description: "Averarge process days between PO submission and final approval date for PO's not in pending status"
    sql: ${TABLE}."AVG_PROCESS_DAYS" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: period_avg_process_days {
    type: average
    sql: ${avg_process_days} ;;
  }

  measure: cohort_current_closed {
    type: sum
    description: "Submission Month Cohort's latest count of PO's that were approved/opened and fully spent"
    sql: ${TABLE}."COHORT_CURRENT_CLOSED" ;;
  }

  measure: cohort_current_open {
    type: sum
    description: "Submission Month Cohort's latest count of PO's that were approved/opened and not fully spent"
    sql: ${TABLE}."COHORT_CURRENT_OPEN" ;;
  }

  measure: cohort_current_pending {
    type: sum
    description: "Submission Month Cohort's latest count of PO's not yet approved and pending in queue"
    sql: ${TABLE}."COHORT_CURRENT_PENDING" ;;
  }

  measure: cohort_current_rejected {
    type: sum
    description: "Submission Month Cohort's latest count of PO's that were rejected"
    sql: ${TABLE}."COHORT_CURRENT_REJECTED" ;;
  }

  measure: cohort_submissions {
    type: sum
    description: "Submission Month Cohort's latest count of PO's submitted for approval"
    sql: ${TABLE}."COHORT_SUBMISSIONS" ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension: fiscal_year {
    type: date
    convert_tz: no
    datatype: date
    sql: ${TABLE}."FISCAL_YEAR" ;;
  }

  measure: opened_within30 {
    type: sum
    description: "Count of PO's that were submitted, approved and opened within 30 calendar days after submission"
    sql: ${TABLE}."OPENED_WITHIN30" ;;
  }

  measure: pcnt_utilized {
    type: average
    value_format: "0%"
    description: "To Date Closed/To Date Opened representing % of POs that are fully spent/utilized"
    sql: ${TABLE}."PCNT_UTILIZED" ;;
  }

  measure: pcnt_with30 {
    type: average
    value_format: "0%"
    description: "Percentage of POs opened within 30 days after submission"
    sql: ${TABLE}."PCNT_WITH30" ;;
  }

  measure: pct_current_pending {
    type: average
    value_format: "0%"
    description: "Percentage of PO's currently in pending status by submission cohort month"
    sql: ${TABLE}."PCT_CURRENT_PENDING" ;;
  }

  dimension: still_open {
    type: number
    description: "Current cnt of PO's still open (not fully utilized/spent) starting from FY2021"
    sql: ${TABLE}."STILL_OPEN" ;;
  }

  dimension: still_pending {
    type: number
    description: "Current count of PO's still pending (not yet approved) starting from FY2021"
    sql: ${TABLE}."STILL_PENDING" ;;
  }

  dimension: submission_month {
    type: date
    convert_tz: no
    datatype: date
    sql: ${TABLE}."SUBMISSION_MONTH" ;;
  }

  dimension: to_date_closed {
    type: number
    description: "Lifetime to date count of opened/approved PO's that are fully utilized/spent starting FY2021"
    sql: ${TABLE}."TO_DATE_CLOSED" ;;
  }

  dimension: to_date_opened {
    type: number
    description: "Lifetime to date count of PO's that were submitted and approved to be opened starting FY2021"
    sql: ${TABLE}."TO_DATE_OPENED" ;;
  }

  dimension: to_date_rejected {
    type: number
    description: "Lifetime to date count of PO's that were submitted and rejected starting FY2021"
    sql: ${TABLE}."TO_DATE_REJECTED" ;;
  }

  dimension: to_date_submitted {
    type: number
    description: "Lifetime to date count of PO's that were submitted starting FY2021"
    sql: ${TABLE}."TO_DATE_SUBMITTED" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
