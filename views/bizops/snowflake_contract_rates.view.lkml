# This is the view file for the analytics.bizops.snowflake_contract_rates table.
view: snowflake_contract_rates {
  sql_table_name: bizops.snowflake_contract_rates ;;
  view_label: "Snowflake Contract Rates"

  # FILTERS

  # DIMENSIONS
  dimension: rate {
    description: ""
    type: number
    sql: ${TABLE}.rate ;;
    hidden: no
  }


  # DIMENSION GROUPS/DATES
  dimension_group: effective {
    description: ""
    type: time
    timeframes: [date, month, year]
    sql: ${TABLE}.effective_date ;;
    hidden: no
  }


  # MEASURES
  measure: count {
    description: "Count of rows/occurrences."
    type: count
  }

  measure: avg_rate {
    type: average
    sql: ${rate} ;;
  }

  measure: max_rate {
    type: max
    sql: ${rate} ;;
  }

  measure: min_rate {
    type: min
    sql: ${rate} ;;
  }


}
