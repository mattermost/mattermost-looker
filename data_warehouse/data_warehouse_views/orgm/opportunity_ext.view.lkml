view: opportunity_ext {
  sql_table_name: "ORGM"."OPPORTUNITY_EXT";;

  dimension: opportunityid {
    hidden: yes
    type: string
    sql: ${TABLE}."OPPORTUNITY_SFID" ;;
  }

  dimension: accountid {
    hidden: yes
    type: string
    sql: ${TABLE}."ACCOUNTID" ;;
  }

  dimension: expansion_amount {
    group_label: "Line Item Totals"
    description: "Total where Product Line Type = 'Expansion' (includes Co-Term and Leftover Expansion) "
    value_format_name: usd_0
    type: number
    sql: ${TABLE}."SUM_EXPANSION_AMOUNT" ;;
  }

  dimension: expansion_w_proration_amount {
    group_label: "Line Item Totals"
    label: "Expansion w/ Co-Term & Leftover Proration "
    description: "Annualized total where Product Line Type = 'Expansion' (includes Co-Term and Leftover Expansion) "
    value_format_name: usd_0
    type: number
    sql: ${TABLE}."SUM_EXPANSION_W_PRORATION_AMOUNT" ;;
  }

  dimension_group: first_commit_date {
    group_label: "Commit Date (First)"
    type: time
    timeframes: [
      date,
      month,
      fiscal_quarter,
      fiscal_quarter_of_year,
      year,
      fiscal_year
    ]
    sql: ${TABLE}.FIRST_COMMIT_DATE ;;
    label: "First Commit"
    description: "First date an opportunity reaches Commit"
  }

  dimension_group: last_commit_date {
    group_label: "Commit Date (Last)"
    type: time
    timeframes: [
      date,
      month,
      fiscal_quarter,
      fiscal_quarter_of_year,
      year,
      fiscal_year
    ]
    sql: ${TABLE}.LAST_COMMIT_DATE ;;
    label: "Last Commit"
    description: "Last date an opportunity reaches Commit"
  }

  dimension: num_times_commit {
    type: number
    sql: ${TABLE}.NUM_TIMES_SLIPPED ;;
    label: "# Commit Months"
    description: "# of unique months that a deal has been committed"
  }

  dimension_group: license_min_end_date {
    group_label: "License Dates (End)"
    type: time
    timeframes: [
      date,
      month,
      fiscal_quarter,
      fiscal_quarter_of_year,
      year,
      fiscal_year
    ]
    sql: ${TABLE}.MIN_END_DATE ;;
    label: "License End Date (Min)"
    description: "Min end date for all line items in that opportunity. Populated hourly via DWH script. Not the fields on the opportunity."
    }

  dimension_group: license_min_start_date {
    group_label: "License Dates (Start)"
    type: time
    timeframes: [
      date,
      month,
      fiscal_quarter,
      fiscal_quarter_of_year,
      year,
      fiscal_year
    ]
    sql: ${TABLE}.MIN_START_DATE ;;
    description: "Min start date for all line items in that opportunity. Populated hourly via DWH script. Not the fields on the opportunity."
    label: "License Start Date (Min)"
  }

  dimension_group: license_max_end_date {
    group_label: "License Dates (End)"
    type: time
    timeframes: [
      date,
      month,
      fiscal_quarter,
      fiscal_quarter_of_year,
      year,
      fiscal_year
    ]
    sql: ${TABLE}.MAX_END_DATE ;;
    label: "License End Date (Max)"
    description: "Max end date for all line items in that opportunity. Populated hourly via DWH script. Not the fields on the opportunity."
    }

  dimension_group: license_max_start_date {
    group_label: "License Dates (Start)"
    type: time
    timeframes: [
      date,
      month,
      fiscal_quarter,
      fiscal_quarter_of_year,
      year,
      fiscal_year
    ]
    sql: ${TABLE}.MAX_START_DATE ;;
    label: "License Start Date (Max)"
    description: "Max end date for all line items in that opportunity. Populated hourly via DWH script. Not the fields on the opportunity."
  }

  dimension: marketing_generated {
    type: yesno
    sql: ${TABLE}.MARKETING_GENERATED ;;
    label: "Marketing Generated?"
    description: "A Contact on the Opportunity triggered a MQL prior to Opportunity creation"
  }

  dimension: amount_in_commit {
    group_label: "Forecast Category Totals"
    description: "Total where Forecast Category = 'Commit' "
    value_format_name: usd_0
    type: number
    sql: ${TABLE}."AMOUNT_IN_COMMIT" ;;
  }

  dimension: amount_in_best_case {
    group_label: "Forecast Category Totals"
    description: "Total where Forecast Category = 'Best Case' "
    value_format_name: usd_0
    type: number
    sql: ${TABLE}."AMOUNT_IN_BEST_CASE" ;;
  }

  dimension: amount_in_pipeline {
    group_label: "Forecast Category Totals"
    description: "Total where Forecast Category = 'Pipeline' "
    value_format_name: usd_0
    type: number
    sql: ${TABLE}."AMOUNT_IN_PIPELINE" ;;
  }

  dimension: multi_amount {
    group_label: "Line Item Totals"
    description: "Total where Product Line Type = 'Multi' "
    value_format_name: usd_0
    type: number
    sql: ${TABLE}."SUM_MULTI_AMOUNT" ;;
  }

  dimension: new_amount {
    group_label: "Line Item Totals"
    description: "Total where Product Line Type = 'New' "
    value_format_name: usd_0
    type: number
    sql: ${TABLE}."SUM_NEW_AMOUNT" ;;
  }

  dimension: num_diff_license_end_dates {
    group_label: "License Dates (End)"
    type: number
    sql: ${TABLE}.NUM_DIFF_END_DATES ;;
    description: "# of unique end dates in Oppt Line Items. Populated hourly via DWH script."
  }

  dimension: num_diff_license_start_dates {
    group_label: "License Dates (Start)"
    type: number
    sql: ${TABLE}.NUM_DIFF_START_DATES ;;
    description: "# of unique end dates in Oppt Line Items. Populated hourly via DWH script."
  }

  dimension: paid {
    label: "Is Paid?"
    description: "Netsuite has marked the opportunity as paid"
    sql: ${TABLE}.paid ;;
    type: yesno
  }

  dimension: paid_type {
    label: "Paid Type"
    description: "Netsuite Paid Type"
    sql: ${TABLE}.paid_type ;;
    type: string
  }

  dimension: is_credit_card {
    type: yesno
    label: "Is Credit Card?"
    sql: (${TABLE}.payment_method IS NULL AND ${opportunity.stripe_id} IS NOT NULL) OR ${TABLE}.payment_method IN ('E-Invoice','Stripe') ;;
  }

  dimension: payment_method {
    label: "Payment Method"
    description: "Netsuite Payment Method"
    sql: CASE WHEN ${TABLE}.payment_method IS NULL AND ${opportunity.stripe_id} IS NOT NULL THEN 'Stripe' ELSE ${TABLE}.payment_method END;;
    type: string
  }

  dimension_group: paid {
    type: time
    timeframes: [
      date,
      month,
      fiscal_quarter,
      fiscal_quarter_of_year,
      year,
      fiscal_year
    ]
    sql: ${TABLE}.paid_date ;;
  }

  dimension: renewal_amount {
    group_label: "Line Item Totals"
    description: "Total where Product Line Type = 'Ren' "
    value_format_name: usd_0
    type: number
    sql: ${TABLE}."SUM_RENEWAL_AMOUNT" ;;
  }

  dimension: new_and_expansion_amount {
    group_label: "Line Item Totals"
    label: "New & Expansion w/Proration Amount"
    description: "Annualized total where Product Line Type = 'New' or 'Expansion' (includes Co-Term and Leftover Expansion)"
    value_format_name: usd_0
    type: number
    sql: ${new_amount} + ${expansion_w_proration_amount} ;;
  }

}
