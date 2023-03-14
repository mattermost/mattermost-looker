# The name of this view in Looker is "Fct Marts or Intermediate Dependent on Source"
view: fct_marts_or_intermediate_dependent_on_source {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "MART_DBT_PROJECT_EVALUATOR"."FCT_MARTS_OR_INTERMEDIATE_DEPENDENT_ON_SOURCE"
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

  dimension: child_model_type {
    type: string
    sql: ${TABLE}."CHILD_MODEL_TYPE" ;;
  }

  dimension: parent {
    type: string
    sql: ${TABLE}."PARENT" ;;
  }

  dimension: parent_resource_type {
    type: string
    sql: ${TABLE}."PARENT_RESOURCE_TYPE" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
