# This is the view file for the analytics.util.telemetry_columns table.
view: telemetry_columns {
  sql_table_name: util.telemetry_columns ;;
  view_label: "Telemetry Columns"

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

  dimension: column_name {
    description: "" 
    type: string
    sql: ${TABLE}.column_name ;;
    hidden: no
  }

  dimension: rank {
    description: "" 
    type: number
    sql: ${TABLE}.rank ;;
    hidden: no
  }

  dimension: data_type {
    description: "" 
    type: string
    sql: ${TABLE}.data_type ;;
    hidden: no
  }

  dimension: ordinal_position {
    description: "" 
    type: number
    sql: ${TABLE}.ordinal_position ;;
    hidden: no
  }

  
  # DIMENSION GROUPS/DATES
  dimension_group: date_added {
    description: "" 
    type: time
    timeframes: [week, date, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.date_added ;;
    hidden: no
  }

  
  # MEASURES
  measure: count {
    description: "Count of rows/occurrences."
    type: count
  }

  measure: rank_max {
    description: "The max Ranks within each grouping."
    type: max
    group_label: "Rank Measures"
    sql: ${rank} ;;
  }

  measure: rank_min {
    description: "The min Ranks within each grouping."
    type: min
    group_label: "Rank Measures"
    sql: ${rank} ;;
  }

  measure: rank_avg {
    description: "The average Ranks within each grouping."
    type: average
    group_label: "Rank Measures"
    sql: ${rank} ;;
  }

  measure: rank_median {
    description: "The median  Ranks within each grouping."
    type: median
    group_label: "Rank Measures"
    sql: ${rank} ;;
  }

  measure: ordinal_position_max {
    description: "The max Ordinal Positions within each grouping."
    type: max
    group_label: "Ordinal Position Measures"
    sql: ${ordinal_position} ;;
  }

  measure: ordinal_position_min {
    description: "The min Ordinal Positions within each grouping."
    type: min
    group_label: "Ordinal Position Measures"
    sql: ${ordinal_position} ;;
  }

  measure: ordinal_position_avg {
    description: "The average Ordinal Positions within each grouping."
    type: average
    group_label: "Ordinal Position Measures"
    sql: ${ordinal_position} ;;
  }

  measure: ordinal_position_median {
    description: "The median  Ordinal Positions within each grouping."
    type: median
    group_label: "Ordinal Position Measures"
    sql: ${ordinal_position} ;;
  }


}