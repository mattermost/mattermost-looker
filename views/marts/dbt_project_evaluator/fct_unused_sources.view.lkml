# The name of this view in Looker is "Fct Unused Sources"
view: fct_unused_sources {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "MART_DBT_PROJECT_EVALUATOR"."FCT_UNUSED_SOURCES"
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Parent" in Explore.

  dimension: parent {
    type: string
    sql: ${TABLE}."PARENT" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
