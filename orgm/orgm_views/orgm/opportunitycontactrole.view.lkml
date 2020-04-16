view: opportunitycontactrole {
  sql_table_name: orgm.opportunitycontactrole ;;
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
    group_label: "System"
    }

  dimension: contactid {
    type: string
    sql: ${TABLE}."contactid" ;;
  }

  dimension: contactname {
    type: string
    sql: ${ocr_contact.name} ;;
    label: "OCR Contact Name"
  }

  dimension: createdbyid {
    type: string
    sql: ${TABLE}."createdbyid" ;;
    group_label: "Created"
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
    group_label: "Created"
    }

  dimension: isdeleted {
    type: yesno
    sql: ${TABLE}."isdeleted" ;;
    hidden: yes
  }

  dimension: isprimary {
    type: yesno
    sql: ${TABLE}."isprimary" ;;
    label: "Primary?"
  }

  dimension: lastmodifiedbyid {
    type: string
    sql: ${TABLE}."lastmodifiedbyid" ;;
    group_label: "System"
  }

  dimension_group: lastmodifieddate {
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
    sql: ${TABLE}."lastmodifieddate" ;;
    group_label: "System"
    }

  dimension: opportunityid {
    type: string
    sql: ${TABLE}."opportunityid" ;;
    label: "OCR Oppt ID"
  }

  dimension: role {
    type: string
    sql: ${TABLE}."role" ;;
  }

  dimension: sfid {
    type: string
    sql: ${TABLE}."sfid" ;;
    label: "OCR ID"
  }

  dimension_group: systemmodstamp {
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
    sql: ${TABLE}."systemmodstamp" ;;
    group_label: "System"
    }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
