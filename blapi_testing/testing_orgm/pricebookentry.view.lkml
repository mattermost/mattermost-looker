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
    type: string
    sql: ${TABLE}."product2id" ;;
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

  dimension: unitprice {
    label: "Pricebook Price"
    type: number
    sql: ${TABLE}."unitprice" ;;
  }

  measure: count {
    type: count
    drill_fields: [name]
  }
}
