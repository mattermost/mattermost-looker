# The name of this view in Looker is "Fct Rejoining of Upstream Concepts"
view: fct_rejoining_of_upstream_concepts {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "MART_DBT_PROJECT_EVALUATOR"."FCT_REJOINING_OF_UPSTREAM_CONCEPTS"
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

  dimension: is_loop_independent {
    type: yesno
    sql: ${TABLE}."IS_LOOP_INDEPENDENT" ;;
  }

  dimension: parent {
    type: string
    sql: ${TABLE}."PARENT" ;;
  }

  dimension: parent_and_child {
    type: string
    sql: ${TABLE}."PARENT_AND_CHILD" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
