view: opportunitycontactrole {
  sql_table_name: testing_orgm.opportunitycontactrole ;;

  dimension: contactid {
    type: string
    sql: ${TABLE}."contactid" ;;
  }

  dimension: isdeleted {
    type: yesno
    sql: ${TABLE}."isdeleted" ;;
  }

  dimension: isprimary {
    type: yesno
    sql: ${TABLE}."isprimary" ;;
  }

  dimension: opportunityid {
    type: string
    sql: ${TABLE}."opportunityid" ;;
  }

  dimension: role {
    type: string
    sql: ${TABLE}."role" ;;
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
    drill_fields: []
  }
}
