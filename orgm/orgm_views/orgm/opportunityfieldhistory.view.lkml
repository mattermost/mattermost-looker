view: opportunityfieldhistory {
  sql_table_name: orgm.opportunityfieldhistory ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
    group_label: "System"
  }

  dimension: _hc_err {
    type: string
    sql: ${TABLE}."_hc_err" ;;
    group_label: "System"
  }

  dimension: _hc_lastop {
    type: string
    sql: ${TABLE}."_hc_lastop" ;;
    group_label: "system"
  }

  dimension: createdbyid {
    type: string
    sql: ${TABLE}."createdbyid" ;;
  }

  dimension_group: createddate {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."createddate" ;;
  }

  dimension: field {
    type: string
    sql: ${TABLE}."field" ;;
  }

  dimension: isdeleted {
    type: yesno
    sql: ${TABLE}."isdeleted" ;;
  }

  dimension: newvalue {
    type: string
    sql: ${TABLE}."newvalue" ;;
  }

  dimension: oldvalue {
    type: string
    sql: ${TABLE}."oldvalue" ;;
  }

  dimension: opportunityid {
    type: string
    sql: ${TABLE}."opportunityid" ;;
  }

  dimension: sfid {
    type: string
    sql: ${TABLE}."sfid" ;;
  }


  measure: count {
    type: count
    drill_fields: [id]
  }
}
