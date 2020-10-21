# This is the view file for the analytics.blapi.CREDIT_CARDS table.
view: CREDIT_CARDS {
  sql_table_name: blapi.CREDIT_CARDS ;;
  view_label: "Credit Cards"

  # FILTERS

  # DIMENSIONS
  dimension: id {
    description: "" 
    type: string
    sql: ${TABLE}.id ;;
    hidden: no
  }

  dimension: fingerprint {
    description: "" 
    type: string
    sql: ${TABLE}.fingerprint ;;
    hidden: no
  }

  dimension: stripe_id {
    description: "" 
    type: string
    sql: ${TABLE}.stripe_id ;;
    hidden: no
  }

  dimension: card_brand {
    description: "" 
    type: string
    sql: ${TABLE}.card_brand ;;
    hidden: no
  }

  dimension: last4 {
    description: "" 
    type: number
    sql: ${TABLE}.last4 ;;
    hidden: no
  }

  dimension: exp_month {
    description: "" 
    type: number
    sql: ${TABLE}.exp_month ;;
    hidden: no
  }

  dimension: exp_year {
    description: "" 
    type: number
    sql: ${TABLE}.exp_year ;;
    hidden: no
  }

  dimension: address_check {
    description: "" 
    type: string
    sql: ${TABLE}.address_check ;;
    hidden: no
  }

  dimension: cvc_check {
    description: "" 
    type: string
    sql: ${TABLE}.cvc_check ;;
    hidden: no
  }

  dimension: zip_check {
    description: "" 
    type: string
    sql: ${TABLE}.zip_check ;;
    hidden: no
  }

  dimension: three_d_secure_support {
    description: "" 
    type: string
    sql: ${TABLE}.three_d_secure_support ;;
    hidden: no
  }

  dimension: card_country {
    description: "" 
    type: string
    sql: ${TABLE}.card_country ;;
    hidden: no
  }

  dimension: _sdc_deleted_at {
    description: "" 
    type: string
    sql: ${TABLE}._sdc_deleted_at ;;
    hidden: no
  }

  
  # DIMENSION GROUPS/DATES
  dimension_group: _sdc_extracted_at {
	description: "" 
	type: time
	timeframes: [time, week, date, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}._sdc_extracted_at ;;
    hidden: no
  }

  dimension_group: _sdc_batched_at {
	description: "" 
	type: time
	timeframes: [time, week, date, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}._sdc_batched_at ;;
    hidden: no
  }

  
  # MEASURES
  measure: count {
    description: "Count of rows/occurrences."
    type: count
  }

  measure: id_count {
    label: " Id Count"
    description: "The distinct count of Credit Cards Id within each grouping."
    type: count_distinct
    sql: ${id} ;;
  }

  measure: stripe_count {
    label: " Stripe Count"
    description: "The distinct count of Credit Cards Stripes within each grouping."
    type: count_distinct
    sql: ${stripe_id} ;;
  }

  measure: last4_max {
    description: "The max Last4s within each grouping."
    type: max
    group_label: "Last4 Measures"
    sql: ${last4} ;;
  }

  measure: last4_min {
    description: "The min Last4s within each grouping."
    type: min
    group_label: "Last4 Measures"
    sql: ${last4} ;;
  }

  measure: last4_avg {
    description: "The average Last4s within each grouping."
    type: average
    group_label: "Last4 Measures"
    sql: ${last4} ;;
  }

  measure: last4_median {
    description: "The median  Last4s within each grouping."
    type: median
    group_label: "Last4 Measures"
    sql: ${last4} ;;
  }

  measure: exp_month_max {
    description: "The max Exp Months within each grouping."
    type: max
    group_label: "Exp Month Measures"
    sql: ${exp_month} ;;
  }

  measure: exp_month_min {
    description: "The min Exp Months within each grouping."
    type: min
    group_label: "Exp Month Measures"
    sql: ${exp_month} ;;
  }

  measure: exp_month_avg {
    description: "The average Exp Months within each grouping."
    type: average
    group_label: "Exp Month Measures"
    sql: ${exp_month} ;;
  }

  measure: exp_month_median {
    description: "The median  Exp Months within each grouping."
    type: median
    group_label: "Exp Month Measures"
    sql: ${exp_month} ;;
  }

  measure: exp_year_max {
    description: "The max Exp Years within each grouping."
    type: max
    group_label: "Exp Year Measures"
    sql: ${exp_year} ;;
  }

  measure: exp_year_min {
    description: "The min Exp Years within each grouping."
    type: min
    group_label: "Exp Year Measures"
    sql: ${exp_year} ;;
  }

  measure: exp_year_avg {
    description: "The average Exp Years within each grouping."
    type: average
    group_label: "Exp Year Measures"
    sql: ${exp_year} ;;
  }

  measure: exp_year_median {
    description: "The median  Exp Years within each grouping."
    type: median
    group_label: "Exp Year Measures"
    sql: ${exp_year} ;;
  }


}