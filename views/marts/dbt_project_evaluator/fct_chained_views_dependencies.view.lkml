# The name of this view in Looker is "Fct Chained Views Dependencies"
view: fct_chained_views_dependencies {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "MART_DBT_PROJECT_EVALUATOR"."FCT_CHAINED_VIEWS_DEPENDENCIES"
    ;;

  dimension: parent {
    type: string
    sql: ${TABLE}."PARENT" ;;
  }

  dimension: child {
    type: string
    sql: ${TABLE}."CHILD" ;;
  }

  dimension: distance {
    type: number
    sql: ${TABLE}."DISTANCE" ;;
  }

  dimension: path {
    type: string
    sql: ${TABLE}."PATH" ;;
  }


  measure: count {
    type: count
    drill_fields: []
  }
}
