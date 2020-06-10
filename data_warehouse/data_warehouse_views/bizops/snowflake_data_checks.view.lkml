view: snowflake_data_checks {
  sql_table_name: "BIZOPS"."SNOWFLAKE_DATA_CHECKS"
    ;;

  dimension: count {
    type: number
    sql: ${TABLE}."COUNT" ;;
  }

  dimension: count_distinct {
    type: number
    sql: ${TABLE}."COUNT_DISTINCT" ;;
  }

  dimension: table_name {
    type: string
    sql: ${TABLE}."TABLE_NAME" ;;
  }
}
