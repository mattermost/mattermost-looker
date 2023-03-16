# The name of this view in Looker is "Fct Documentation Coverage"
view: fct_documentation_coverage {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "MART_DBT_PROJECT_EVALUATOR"."FCT_DOCUMENTATION_COVERAGE"
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Documentation Coverage Pct" in Explore.

  dimension: documentation_coverage_pct {
    type: number
    sql: ${TABLE}."DOCUMENTATION_COVERAGE_PCT" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  dimension: documented_models {
    type: number
    sql: ${TABLE}."DOCUMENTED_MODELS" ;;
  }

  dimension: intermediate_documentation_coverage_pct {
    type: number
    sql: ${TABLE}."INTERMEDIATE_DOCUMENTATION_COVERAGE_PCT" ;;
  }

  dimension: marts_documentation_coverage_pct {
    type: number
    sql: ${TABLE}."MARTS_DOCUMENTATION_COVERAGE_PCT" ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: measured {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."MEASURED_AT" ;;
  }

  dimension: other_documentation_coverage_pct {
    type: number
    sql: ${TABLE}."OTHER_DOCUMENTATION_COVERAGE_PCT" ;;
  }

  dimension: staging_documentation_coverage_pct {
    type: number
    sql: ${TABLE}."STAGING_DOCUMENTATION_COVERAGE_PCT" ;;
  }

  dimension: total_models {
    type: number
    sql: ${TABLE}."TOTAL_MODELS" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
