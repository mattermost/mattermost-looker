view: scenarios {
  sql_table_name: testing_blapi.scenarios ;;

  dimension: id {
    primary_key: yes
    type: string
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

  dimension: category {
    type: string
    sql: ${TABLE}."category" ;;
  }

  dimension: setup_compplete {
    type: yesno
    sql: ${TABLE}."setup_compplete" ;;
  }

}
