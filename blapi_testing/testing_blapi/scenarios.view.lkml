view: scenarios {
  sql_table_name: testing_blapi.scenarios ;;

  dimension: id {
    hidden: yes
    type: string
    sql: ${TABLE}."id"::varchar ;;
  }

  dimension: id_int {
    label: "Scenario ID"
    primary_key: yes
    type: number
    sql: ${TABLE}."id";;
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

  dimension: sku {
    type: string
    sql: ${TABLE}."sku" ;;
  }

  dimension: quantity {
    type: string
    sql: ${TABLE}."quantity" ;;
  }

  dimension: price {
    type: string
    sql: ${TABLE}."price" ;;
  }

}
