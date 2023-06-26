# The name of this view in Looker is "Fct Test Coverage"
view: fct_test_coverage {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "MART_DBT_PROJECT_EVALUATOR"."FCT_TEST_COVERAGE"
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Intermediate Test Coverage Pct" in Explore.

  dimension: intermediate_test_coverage_pct {
    type: number
    sql: ${TABLE}."INTERMEDIATE_TEST_COVERAGE_PCT" ;;
  }


  dimension: marts_test_coverage_pct {
    type: number
    sql: ${TABLE}."MARTS_TEST_COVERAGE_PCT" ;;
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

  dimension: other_test_coverage_pct {
    type: number
    sql: ${TABLE}."OTHER_TEST_COVERAGE_PCT" ;;
  }

  dimension: staging_test_coverage_pct {
    type: number
    sql: ${TABLE}."STAGING_TEST_COVERAGE_PCT" ;;
  }

  dimension: test_coverage_pct {
    type: number
    sql: ${TABLE}."TEST_COVERAGE_PCT" ;;
  }

  dimension: test_to_model_ratio {
    type: number
    sql: ${TABLE}."TEST_TO_MODEL_RATIO" ;;
  }

  dimension: tested_models {
    type: number
    sql: ${TABLE}."TESTED_MODELS" ;;
  }

  dimension: total_models {
    type: number
    sql: ${TABLE}."TOTAL_MODELS" ;;
  }

  dimension: total_tests {
    type: number
    sql: ${TABLE}."TOTAL_TESTS" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
