# The name of this view in Looker is "Fct Hard Coded References"
view: fct_hard_coded_references {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "MART_DBT_PROJECT_EVALUATOR"."FCT_HARD_CODED_REFERENCES"
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Hard Coded References" in Explore.

  dimension: hard_coded_references {
    type: string
    sql: ${TABLE}."HARD_CODED_REFERENCES" ;;
  }

  dimension: model {
    type: string
    sql: ${TABLE}."MODEL" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
