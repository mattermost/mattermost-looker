# The name of this view in Looker is "Fct Direct Join to Source"
view: fct_direct_join_to_source {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "MART_DBT_PROJECT_EVALUATOR"."FCT_DIRECT_JOIN_TO_SOURCE"
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Child" in Explore.

  dimension: child {
    type: string
    sql: ${TABLE}."CHILD" ;;
  }

  dimension: child_directory_path {
    type: string
    sql: ${TABLE}."CHILD_DIRECTORY_PATH" ;;
  }

  dimension: child_file_name {
    type: string
    sql: ${TABLE}."CHILD_FILE_NAME" ;;
  }

  dimension: child_file_path {
    type: string
    sql: ${TABLE}."CHILD_FILE_PATH" ;;
  }

  dimension: child_id {
    type: string
    sql: ${TABLE}."CHILD_ID" ;;
  }

  dimension: child_materialized {
    type: string
    sql: ${TABLE}."CHILD_MATERIALIZED" ;;
  }

  dimension: child_model_type {
    type: string
    sql: ${TABLE}."CHILD_MODEL_TYPE" ;;
  }

  dimension: child_resource_type {
    type: string
    sql: ${TABLE}."CHILD_RESOURCE_TYPE" ;;
  }

  dimension: child_source_name {
    type: string
    sql: ${TABLE}."CHILD_SOURCE_NAME" ;;
  }

  dimension: distance {
    type: number
    sql: ${TABLE}."DISTANCE" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.


  dimension: is_dependent_on_chain_of_views {
    type: yesno
    sql: ${TABLE}."IS_DEPENDENT_ON_CHAIN_OF_VIEWS" ;;
  }

  dimension: parent {
    type: string
    sql: ${TABLE}."PARENT" ;;
  }

  dimension: parent_directory_path {
    type: string
    sql: ${TABLE}."PARENT_DIRECTORY_PATH" ;;
  }

  dimension: parent_file_name {
    type: string
    sql: ${TABLE}."PARENT_FILE_NAME" ;;
  }

  dimension: parent_file_path {
    type: string
    sql: ${TABLE}."PARENT_FILE_PATH" ;;
  }

  dimension: parent_id {
    type: string
    sql: ${TABLE}."PARENT_ID" ;;
  }

  dimension: parent_materialized {
    type: string
    sql: ${TABLE}."PARENT_MATERIALIZED" ;;
  }

  dimension: parent_model_type {
    type: string
    sql: ${TABLE}."PARENT_MODEL_TYPE" ;;
  }

  dimension: parent_resource_type {
    type: string
    sql: ${TABLE}."PARENT_RESOURCE_TYPE" ;;
  }

  dimension: parent_source_name {
    type: string
    sql: ${TABLE}."PARENT_SOURCE_NAME" ;;
  }

  dimension: path {
    type: string
    sql: ${TABLE}."PATH" ;;
  }

  measure: count {
    type: count
    drill_fields: [child_file_name, parent_source_name, child_source_name, parent_file_name]
  }
}
