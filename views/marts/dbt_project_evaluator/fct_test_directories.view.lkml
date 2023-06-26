# The name of this view in Looker is "Fct Test Directories"
view: fct_test_directories {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "MART_DBT_PROJECT_EVALUATOR"."FCT_TEST_DIRECTORIES"
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Change Test Directory To" in Explore.

  dimension: change_test_directory_to {
    type: string
    sql: ${TABLE}."CHANGE_TEST_DIRECTORY_TO" ;;
  }

  dimension: current_test_directory {
    type: string
    sql: ${TABLE}."CURRENT_TEST_DIRECTORY" ;;
  }

  dimension: model_name {
    type: string
    sql: ${TABLE}."MODEL_NAME" ;;
  }

  dimension: test_name {
    type: string
    sql: ${TABLE}."TEST_NAME" ;;
  }

  measure: count {
    type: count
    drill_fields: [model_name, test_name]
  }
}
