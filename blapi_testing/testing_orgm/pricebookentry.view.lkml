view: pricebookentry {
  sql_table_name: testing_orgm.pricebookentry ;;

  dimension: isactive {
    type: yesno
    sql: ${TABLE}."isactive" ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}."name" ;;
  }

  dimension: product2id {
    hidden: yes
    type: string
    sql: ${TABLE}."product2id" ;;
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
    group_label: "Scenario"
    type: string
    sql: ${TABLE}."sfid" ;;
  }

  dimension: unitprice {
    group_label: "Pricing"
    label: "Pricebook Price"
    type: number
    sql: ${TABLE}."unitprice" ;;
  }

}
