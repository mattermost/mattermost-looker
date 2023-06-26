# The name of this view in Looker is "Fct Source Fanout"
view: fct_source_fanout {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "MART_DBT_PROJECT_EVALUATOR"."FCT_SOURCE_FANOUT"
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Model Children" in Explore.

  dimension: model_children {
    type: string
    sql: ${TABLE}."MODEL_CHILDREN" ;;
  }

  dimension: parent {
    type: string
    sql: ${TABLE}."PARENT" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
