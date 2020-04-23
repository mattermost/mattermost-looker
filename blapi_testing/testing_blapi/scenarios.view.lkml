view: scenarios {
  sql_table_name: testing_blapi.scenarios ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}."id" ;;
    link: {
      label: "Filter on Scenario"
      url: "/dashboards/92?Scenario ID={{value}}"
    }
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

  dimension: setup_completed {
    type: yesno
    sql: ${TABLE}."setup_completed" ;;
  }

  dimension: phase {
    type: number
    sql: ${TABLE}."phase" ;;
  }

}
