view: scenarios {
  sql_table_name: testing_blapi.scenarios ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }

  dimension: detail {
    type: string
    sql: ${TABLE}."detail" ;;
  }

  dimension: source {
    type: string
    sql: ${TABLE}."source" ;;
  }

}
