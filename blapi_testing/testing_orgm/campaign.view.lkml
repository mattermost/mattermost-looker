view: campaign {
  sql_table_name: testing_orgm.campaign ;;

  dimension: active {
    type: yesno
    sql: ${TABLE}."isactive" ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}."name" ;;
  }

  dimension: parentid {
    hidden: yes
    type: string
    sql: ${TABLE}."parentid" ;;
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

  dimension: status {
    type: string
    sql: ${TABLE}."status" ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}."type" ;;
  }

}
