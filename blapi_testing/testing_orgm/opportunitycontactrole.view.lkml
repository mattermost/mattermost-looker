view: opportunitycontactrole {
  sql_table_name: testing_orgm.opportunitycontactrole ;;
  view_label: "Opportunity Contact Role"

  dimension: contactid {
    hidden: yes
    type: string
    sql: ${TABLE}."contactid" ;;
  }

  dimension: deleted {
    type: yesno
    sql: ${TABLE}."isdeleted" ;;
  }

  dimension: primary {
    type: yesno
    sql: ${TABLE}."isprimary" ;;
  }

  dimension: opportunityid {
    hidden: yes
    type: string
    sql: ${TABLE}."opportunityid" ;;
  }

  dimension: role {
    type: string
    sql: ${TABLE}."role" ;;
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
