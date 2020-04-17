view: user {
  sql_table_name: testing_orgm."user" ;;

  dimension: name {
    type: string
    sql: ${TABLE}."name" ;;
  }

  dimension: scenario {
    group_label: "Scenario"
    type: string
    sql: ${TABLE}."scenario" ;;
  }

  dimension: scenario_category {
    group_label: "Scenario"
    type: string
    sql: ${TABLE}."scenario_category" ;;
  }

  dimension: sfid {
    hidden: yes
    type: string
    sql: ${TABLE}."sfid" ;;
  }

}
