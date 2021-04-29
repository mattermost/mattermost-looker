# This is the view file for the analytics.focalboard.focalboard_fact table.
view: focalboard_fact {
  sql_table_name: focalboard.focalboard_fact ;;
  view_label: "Focalboard Fact"

  # FILTERS

  # DIMENSIONS
  dimension: instance_id {
    description: "" 
    type: string
    sql: ${TABLE}.instance_id ;;
    hidden: no
  }

  dimension: daily_active_users_max {
    description: "" 
    type: number
    sql: ${TABLE}.daily_active_users_max ;;
    hidden: no
  }

  dimension: weekly_active_users_max {
    description: "" 
    type: number
    sql: ${TABLE}.weekly_active_users_max ;;
    hidden: no
  }

  dimension: monthly_active_users_max {
    description: "" 
    type: number
    sql: ${TABLE}.monthly_active_users_max ;;
    hidden: no
  }

  
  # DIMENSION GROUPS/DATES
  dimension_group: first_active {
	description: "" 
	type: time
	timeframes: [time, week, date, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.first_active ;;
    hidden: no
  }

  dimension_group: last_active {
	description: "" 
	type: time
	timeframes: [time, week, date, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.last_active ;;
    hidden: no
  }

  
  # MEASURES
  measure: count {
    description: "Count of rows/occurrences."
    type: count
  }

  measure: instance_count {
    label: " Instance Count"
    description: "The distinct count of Focalboard Fact Instances within each grouping."
    type: count_distinct
    sql: ${instance_id} ;;
  }

  measure: daily_active_users_max_sum {
    description: "The Sum of Daily Active Users Max."
    type: sum
    group_label: "Daily Active Users Max Measures"
    sql: ${daily_active_users_max} ;;
  }

  measure: daily_active_users_max_max {
    description: "The Max. Daily Active Users Max."
    type: max
    group_label: "Daily Active Users Max Measures"
    sql: ${daily_active_users_max} ;;
  }

  measure: daily_active_users_max_min {
    description: "The Min. Daily Active Users Max."
    type: min
    group_label: "Daily Active Users Max Measures"
    sql: ${daily_active_users_max} ;;
  }

  measure: daily_active_users_max_avg {
    description: "The Average Daily Active Users Max."
    type: average
    group_label: "Daily Active Users Max Measures"
    sql: ${daily_active_users_max} ;;
  }

  measure: daily_active_users_max_median {
    description: "The Median Daily Active Users Max."
    type: median
    group_label: "Daily Active Users Max Measures"
    sql: ${daily_active_users_max} ;;
  }

  measure: weekly_active_users_max_sum {
    description: "The Sum of Weekly Active Users Max."
    type: sum
    group_label: "Weekly Active Users Max Measures"
    sql: ${weekly_active_users_max} ;;
  }

  measure: weekly_active_users_max_max {
    description: "The Max. Weekly Active Users Max."
    type: max
    group_label: "Weekly Active Users Max Measures"
    sql: ${weekly_active_users_max} ;;
  }

  measure: weekly_active_users_max_min {
    description: "The Min. Weekly Active Users Max."
    type: min
    group_label: "Weekly Active Users Max Measures"
    sql: ${weekly_active_users_max} ;;
  }

  measure: weekly_active_users_max_avg {
    description: "The Average Weekly Active Users Max."
    type: average
    group_label: "Weekly Active Users Max Measures"
    sql: ${weekly_active_users_max} ;;
  }

  measure: weekly_active_users_max_median {
    description: "The Median Weekly Active Users Max."
    type: median
    group_label: "Weekly Active Users Max Measures"
    sql: ${weekly_active_users_max} ;;
  }

  measure: monthly_active_users_max_sum {
    description: "The Sum of Monthly Active Users Max."
    type: sum
    group_label: "Monthly Active Users Max Measures"
    sql: ${monthly_active_users_max} ;;
  }

  measure: monthly_active_users_max_max {
    description: "The Max. Monthly Active Users Max."
    type: max
    group_label: "Monthly Active Users Max Measures"
    sql: ${monthly_active_users_max} ;;
  }

  measure: monthly_active_users_max_min {
    description: "The Min. Monthly Active Users Max."
    type: min
    group_label: "Monthly Active Users Max Measures"
    sql: ${monthly_active_users_max} ;;
  }

  measure: monthly_active_users_max_avg {
    description: "The Average Monthly Active Users Max."
    type: average
    group_label: "Monthly Active Users Max Measures"
    sql: ${monthly_active_users_max} ;;
  }

  measure: monthly_active_users_max_median {
    description: "The Median Monthly Active Users Max."
    type: median
    group_label: "Monthly Active Users Max Measures"
    sql: ${monthly_active_users_max} ;;
  }


}