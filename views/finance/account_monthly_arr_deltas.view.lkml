view: account_monthly_arr_deltas {
  sql_table_name: "FINANCE"."ACCOUNT_MONTHLY_ARR_DELTAS"
    ;;

  dimension: compound_primary {
    type: string
    sql: ${account_sfid} || ${month_end_date};;
    hidden: yes
    primary_key: yes
  }

  dimension: account_new_arr {
    type: yesno
    sql: ${TABLE}."ACCOUNT_NEW_ARR" ;;
    hidden: yes
  }

  dimension: account_sfid {
    type: string
    sql: ${TABLE}."ACCOUNT_SFID" ;;
    hidden: yes
  }

  dimension: account_name {
    type: string
    sql: ${account.name} ;;
  }

  dimension: master_account_sfid {
    type: string
    sql: ${TABLE}."MASTER_ACCOUNT_SFID" ;;
    hidden: yes
  }

  dimension_group: month_end {
    type: time
    timeframes: [
      date,
      month,
      fiscal_quarter,
      fiscal_year
    ]
    convert_tz: no
    datatype: date
    sql: coalesce(greatest(${TABLE}."MONTH_END",'2016-02-29'::date),${dates.date_date});;
  }

  dimension: month_ending_arr {
    type: number
    sql: coalesce(${TABLE}."MONTH_ENDING_ARR",0) ;;
    hidden: yes
  }

  dimension: month_ending_arr_ongoing {
    type: number
    sql: ${account_monthly_arr_deltas.month_ending_arr} ;;
    hidden: yes
  }

  dimension_group: cohort_start {
    type: time
    timeframes: [
      date,
      month,
      fiscal_quarter,
      fiscal_year
    ]
    convert_tz: no
    datatype: date
    sql: coalesce(greatest(${TABLE}."MONTH_END",'2016-02-01'::date),date_trunc('month',${dates.date_date}::date)) ;;
  }

  dimension: total_arr_delta {
    type: number
    sql: coalesce(${TABLE}."TOTAL_ARR_DELTA",0) ;;
    hidden: yes
  }

  dimension: age_of_account {
    type: number
    sql: DATEDIFF('month',${cohort_start_date},${dates.date_date}) + 1;;
  }

  dimension: first_month_ending_arr {
    type: number
    sql: ${month_ending_arr};;
    hidden: yes
  }

  measure: count_accounts {
    type: count_distinct
    sql: ${account_sfid} ;;
    drill_fields: [account.name,account_monthly_arr_deltas_first_month.month_start_month,account_monthly_arr_deltas.month_end_month,account_monthly_arr_deltas.month_ending_arr]
    filters: [account_monthly_arr_deltas.month_ending_arr: "> 0"]
  }

  measure: total_ending_arr {
    label: "ARR"
    type: sum
    sql: ${month_ending_arr} ;;
    drill_fields: [account.name,account_monthly_arr_deltas_first_month.month_start_month,account_monthly_arr_deltas.month_end_month,account_monthly_arr_deltas.month_ending_arr]
  }

  measure: total_ending_arr_ongoing {
    label: "ARR (Ongoing)"
    type: sum
    sql: ${month_ending_arr_ongoing} ;;
    hidden: yes
  }

  measure: total_first_month_ending_arr {
    label: "First ARR"
    type: sum
    sql: ${first_month_ending_arr} ;;
    drill_fields: [account.name,account_monthly_arr_deltas_first_month.month_start_month,first_month_ending_arr,account_monthly_arr_deltas.month_end_month,account_monthly_arr_deltas.month_ending_arr]
  }

  measure: ending_arr_starting_arr_ratio {
    label: "First ARR / ARR"
    type: number
    value_format_name: percent_0
    sql:${total_ending_arr_ongoing}/nullif(${total_first_month_ending_arr},0) ;;
    drill_fields: [account_name,cohort_start_month,first_month_ending_arr,account_monthly_arr_deltas.month_ending_arr,ending_arr_starting_arr_ratio]
  }
}
