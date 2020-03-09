# This is the view file for the analytics.bizops.snowflake_warehouse_cost table.
view: snowflake_warehouse_cost {
  sql_table_name: bizops.snowflake_warehouse_cost ;;
  view_label: "Snowflake Warehouse Cost"

  # FILTERS

  # DIMENSIONS
  dimension: warehouse_id {
    description: "" 
    type: number
    sql: ${TABLE}.warehouse_id ;;
    hidden: no
  }

  dimension: warehouse_name {
    description: "" 
    type: string
    sql: ${TABLE}.warehouse_name ;;
    hidden: no
  }

  dimension: usage_length {
    description: "" 
    type: number
    sql: ${TABLE}.usage_length ;;
    hidden: no
  }

  dimension: credit_rate {
    description: "" 
    type: number
    sql: ${TABLE}.credit_rate ;;
    hidden: no
  }

  dimension: dollars_spent {
    description: "" 
    type: number
    sql: ${TABLE}.dollars_spent ;;
    hidden: no
  }

  
  # DIMENSION GROUPS/DATES
  dimension_group: start_time {
	description: "" 
	type: time
	timeframes: [date, month, year]
    sql: ${TABLE}.start_time ;;
    hidden: no
  }

  dimension_group: end_time {
	description: "" 
	type: time
	timeframes: [date, month, year]
    sql: ${TABLE}.end_time ;;
    hidden: no
  }

  dimension_group: usage_month {
    description: "" 
    type: time
    timeframes: [date, month, year]
    sql: ${TABLE}.usage_month ;;
    hidden: no
  }

  dimension_group: usage_day {
    description: "" 
    type: time
    timeframes: [date, month, year]
    sql: ${TABLE}.usage_day ;;
    hidden: no
  }

  
  # MEASURES
  measure: count {
    description: "Count of rows/occurrences."
    type: count
  }


}