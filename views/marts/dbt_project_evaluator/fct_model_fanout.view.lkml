# The name of this view in Looker is "Fct Model Fanout"
view: fct_model_fanout {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "MART_DBT_PROJECT_EVALUATOR"."FCT_MODEL_FANOUT"
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Leaf Children" in Explore.

  dimension: leaf_children {
    type: string
    sql: ${TABLE}."LEAF_CHILDREN" ;;
  }

  dimension: parent {
    type: string
    sql: ${TABLE}."PARENT" ;;
  }

  dimension: parent_model_type {
    type: string
    sql: ${TABLE}."PARENT_MODEL_TYPE" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
