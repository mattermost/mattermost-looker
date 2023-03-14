# The name of this view in Looker is "Fct Model Directories"
view: fct_model_directories {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "MART_DBT_PROJECT_EVALUATOR"."FCT_MODEL_DIRECTORIES"
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Change File Path To" in Explore.

  dimension: change_file_path_to {
    type: string
    sql: ${TABLE}."CHANGE_FILE_PATH_TO" ;;
  }

  dimension: current_file_path {
    type: string
    sql: ${TABLE}."CURRENT_FILE_PATH" ;;
  }

  dimension: model_type {
    type: string
    sql: ${TABLE}."MODEL_TYPE" ;;
  }

  dimension: resource_name {
    type: string
    sql: ${TABLE}."RESOURCE_NAME" ;;
  }

  dimension: resource_type {
    type: string
    sql: ${TABLE}."RESOURCE_TYPE" ;;
  }

  measure: count {
    type: count
    drill_fields: [resource_name]
  }
}
