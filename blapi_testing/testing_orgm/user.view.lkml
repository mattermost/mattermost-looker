view: user {
  sql_table_name: testing_orgm."user" ;;

  dimension: name {
    type: string
    sql: ${TABLE}."name" ;;
  }

  dimension: scenario {
    type: string
    sql: ${TABLE}."scenario" ;;
  }

  dimension: scenario_category {
    type: string
    sql: ${TABLE}."scenario_category" ;;
  }

  dimension: sfid {
    type: string
    sql: ${TABLE}."sfid" ;;
  }

  measure: count {
    type: count
    drill_fields: [name]
  }
}
