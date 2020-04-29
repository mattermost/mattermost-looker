view: opportunity_ext {
  sql_table_name: "ORGM"."OPPORTUNITY_EXT";;

  dimension: opportunityid {
    hidden: yes
    type: string
    sql: ${TABLE}."OPPORTUNITY_SFID" ;;
  }

  dimension: expansion_amount {
    group_label: "Line Item Totals"
    value_format_name: usd_0
    type: number
    sql: ${TABLE}."SUM_EXPANSION_AMOUNT" ;;
  }

  dimension: expansion_w_proration_amount {
    group_label: "Line Item Totals"
    label: "Expansion w/ Co-Term & Leftover Proration "
    value_format_name: usd_0
    type: number
    sql: ${TABLE}."SUM_EXPANSION_W_PRORATION_AMOUNT" ;;
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

  dimension: multi_amount {
    group_label: "Line Item Totals"
    value_format_name: usd_0
    type: number
    sql: ${TABLE}."SUM_MULTI_AMOUNT" ;;
  }

  dimension: new_amount {
    group_label: "Line Item Totals"
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

  dimension: renewal_amount {
    group_label: "Line Item Totals"
    value_format_name: usd_0
    type: number
    sql: ${TABLE}."SUM_RENEWAL_AMOUNT" ;;
  }

  dimension: new_and_expansion_amount {
    group_label: "Line Item Totals"
    label: "New & Expansion w/Proration Amount"
    value_format_name: usd_0
    type: number
    sql: ${new_amount} + ${expansion_w_proration_amount} ;;
  }

}
