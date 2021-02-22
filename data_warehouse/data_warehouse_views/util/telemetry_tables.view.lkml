# This is the view file for the analytics.util.telemetry_tables table.
view: telemetry_tables {
  sql_table_name: util.telemetry_tables ;;
  view_label: "Telemetry Tables"

  # FILTERS

  # DIMENSIONS
  dimension: table_catalog {
    description: "" 
    type: string
    sql: ${TABLE}.table_catalog ;;
    hidden: no
  }

  dimension: table_schema {
    description: "" 
    type: string
    sql: ${TABLE}.table_schema ;;
    hidden: no
  }

  dimension: table_name {
    description: "" 
    type: string
    sql: ${TABLE}.table_name ;;
    hidden: no
  }

  dimension: update_type {
    description: "" 
    type: string
    sql: ${TABLE}.update_type ;;
    hidden: no
  }

  dimension: column_count {
    description: "" 
    type: number
    sql: ${TABLE}.column_count ;;
    hidden: no
  }

  dimension: prev_day_column_count {
    description: "" 
    type: number
    sql: ${TABLE}.prev_day_column_count ;;
    hidden: no
  }

  
  # DIMENSION GROUPS/DATES
  dimension_group: snapshot {
    description: "" 
    type: time
    timeframes: [week, date, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.snapshot_date ;;
    hidden: no
  }

  
  # MEASURES
  measure: count {
    description: "Count of rows/occurrences."
    type: count
  }

  measure: column_count_sum {
    description: "The sum of Column Counts within each grouping."
    type: sum
    group_label: "Column Count Measures"
    sql: ${column_count} ;;
  }

  measure: column_count_max {
    description: "The max Column Counts within each grouping."
    type: max
    group_label: "Column Count Measures"
    sql: ${column_count} ;;
  }

  measure: column_count_min {
    description: "The min Column Counts within each grouping."
    type: min
    group_label: "Column Count Measures"
    sql: ${column_count} ;;
  }

  measure: column_count_avg {
    description: "The average Column Counts within each grouping."
    type: average
    group_label: "Column Count Measures"
    sql: ${column_count} ;;
  }

  measure: column_count_median {
    description: "The median  Column Counts within each grouping."
    type: median
    group_label: "Column Count Measures"
    sql: ${column_count} ;;
  }

  measure: prev_day_column_count_sum {
    description: "The sum of Prev Day Column Counts within each grouping."
    type: sum
    group_label: "Prev Day Column Count Measures"
    sql: ${prev_day_column_count} ;;
  }

  measure: prev_day_column_count_max {
    description: "The max Prev Day Column Counts within each grouping."
    type: max
    group_label: "Prev Day Column Count Measures"
    sql: ${prev_day_column_count} ;;
  }

  measure: prev_day_column_count_min {
    description: "The min Prev Day Column Counts within each grouping."
    type: min
    group_label: "Prev Day Column Count Measures"
    sql: ${prev_day_column_count} ;;
  }

  measure: prev_day_column_count_avg {
    description: "The average Prev Day Column Counts within each grouping."
    type: average
    group_label: "Prev Day Column Count Measures"
    sql: ${prev_day_column_count} ;;
  }

  measure: prev_day_column_count_median {
    description: "The median  Prev Day Column Counts within each grouping."
    type: median
    group_label: "Prev Day Column Count Measures"
    sql: ${prev_day_column_count} ;;
  }


}