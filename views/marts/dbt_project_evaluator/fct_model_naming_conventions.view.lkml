# The name of this view in Looker is "Fct Model Naming Conventions"
view: fct_model_naming_conventions {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "MART_DBT_PROJECT_EVALUATOR"."FCT_MODEL_NAMING_CONVENTIONS"
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Appropriate Prefixes" in Explore.

  dimension: appropriate_prefixes {
    type: string
    sql: ${TABLE}."APPROPRIATE_PREFIXES" ;;
  }

  dimension: model_type {
    type: string
    sql: ${TABLE}."MODEL_TYPE" ;;
  }

  dimension: prefix {
    type: string
    sql: ${TABLE}."PREFIX" ;;
  }

  dimension: resource_name {
    type: string
    sql: ${TABLE}."RESOURCE_NAME" ;;
  }

  measure: count {
    type: count
    drill_fields: [resource_name]
  }
}
