# This is the view file for the analytics.bizops.snowflake_amortized_rates table.
view: snowflake_amortized_rates {
  sql_table_name: bizops.snowflake_amortized_rates ;;
  view_label: "Snowflake Amortized Rates"

  # FILTERS

  # DIMENSIONS
  dimension: rate {
    description: "" 
    type: number
    sql: ${TABLE}.rate ;;
    hidden: no
  }

  
  # DIMENSION GROUPS/DATES
  dimension_group: effective_start {
    description: "" 
    type: time
    timeframes: [date, month, year]
    sql: ${TABLE}.effective_start_date ;;
    hidden: no
  }

  dimension_group: effective_end {
    description: "" 
    type: time
    timeframes: [date, month, year]
    sql: ${TABLE}.effective_end_date ;;
    hidden: no
  }

  dimension_group: date_day {
    description: "" 
    type: time
    timeframes: [date, month, year]
    sql: ${TABLE}.date_day ;;
    hidden: no
  }

  
  # MEASURES
  measure: count {
    description: "Count of rows/occurrences."
    type: count
  }


}