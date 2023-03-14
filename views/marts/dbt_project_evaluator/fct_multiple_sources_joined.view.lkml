# The name of this view in Looker is "Fct Multiple Sources Joined"
view: fct_multiple_sources_joined {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "MART_DBT_PROJECT_EVALUATOR"."FCT_MULTIPLE_SOURCES_JOINED"
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

  dimension: source_parents {
    type: string
    sql: ${TABLE}."SOURCE_PARENTS" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
