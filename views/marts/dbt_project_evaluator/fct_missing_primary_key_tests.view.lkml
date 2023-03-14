# The name of this view in Looker is "Fct Missing Primary Key Tests"
view: fct_missing_primary_key_tests {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "MART_DBT_PROJECT_EVALUATOR"."FCT_MISSING_PRIMARY_KEY_TESTS"
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Is Primary Key Tested" in Explore.

  dimension: is_primary_key_tested {
    type: yesno
    sql: ${TABLE}."IS_PRIMARY_KEY_TESTED" ;;
  }

  dimension: model_type {
    type: string
    sql: ${TABLE}."MODEL_TYPE" ;;
  }

  dimension: number_of_tests_on_model {
    type: number
    sql: ${TABLE}."NUMBER_OF_TESTS_ON_MODEL" ;;
  }

  dimension: resource_name {
    type: string
    sql: ${TABLE}."RESOURCE_NAME" ;;
  }

  measure: count {
    type: count
    drill_fields: [resource_name]
  }
}
