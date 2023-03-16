# The name of this view in Looker is "Fct Exposure Parents Materializations"
view: fct_exposure_parents_materializations {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "MART_DBT_PROJECT_EVALUATOR"."FCT_EXPOSURE_PARENTS_MATERIALIZATIONS"
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Exposure Name" in Explore.

  dimension: exposure_name {
    type: string
    sql: ${TABLE}."EXPOSURE_NAME" ;;
  }

  dimension: parent_model_materialization {
    type: string
    sql: ${TABLE}."PARENT_MODEL_MATERIALIZATION" ;;
  }

  dimension: parent_resource_name {
    type: string
    sql: ${TABLE}."PARENT_RESOURCE_NAME" ;;
  }

  dimension: parent_resource_type {
    type: string
    sql: ${TABLE}."PARENT_RESOURCE_TYPE" ;;
  }

  measure: count {
    type: count
    drill_fields: [exposure_name, parent_resource_name]
  }
}
