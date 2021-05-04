view: sys_vars {
  sql_table_name: UTIL.SYS_VARS ;;

  dimension: var_description {
    type: number
    sql: ${TABLE}."VAR_DESCRIPTION" ;;
  }

  dimension: var_name {
    type: string
    sql: ${TABLE}."VAR_NAME" ;;
  }

  dimension: var_value {
    type: string
    sql: ${TABLE}."VAR_VALUE" ;;
  }

  measure: count {
    type: count
    drill_fields: [var_name]
  }
}
