view: opportunitycontactrole {
  sql_table_name: "ORGM"."OPPORTUNITYCONTACTROLE"
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."ID" ;;
    label: "System"
  }

  dimension: _hc_lastop {
    type: string
    sql: ${TABLE}."_HC_LASTOP" ;;
    label: "System"
  }

  dimension_group: _sdc_batched {
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
    sql: ${TABLE}."_SDC_BATCHED_AT" ;;
    label: "System"
  }

  dimension_group: _sdc_extracted {
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
    sql: ${TABLE}."_SDC_EXTRACTED_AT" ;;
    label: "System"
  }

  dimension_group: _sdc_received {
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
    sql: ${TABLE}."_SDC_RECEIVED_AT" ;;
    label: "System"
  }

  dimension: _sdc_sequence {
    type: number
    sql: ${TABLE}."_SDC_SEQUENCE" ;;
    label: "System"
  }

  dimension: _sdc_table_version {
    type: number
    sql: ${TABLE}."_SDC_TABLE_VERSION" ;;
    label: "System"
  }

  dimension: contactid {
    type: string
    sql: ${TABLE}."CONTACTID" ;;
    label: "Contact ID"
  }

  dimension: createdbyid {
    type: string
    sql: ${TABLE}."CREATEDBYID" ;;
    label: "Created"
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
    sql: ${TABLE}."CREATEDDATE" ;;
    label: "Created"
  }

  dimension: isdeleted {
    type: yesno
    sql: ${TABLE}."ISDELETED" ;;
    hidden:  yes
  }

  dimension: isprimary {
    type: yesno
    sql: ${TABLE}."ISPRIMARY" ;;
    label: "Primary?"
  }

  dimension: lastmodifiedbyid {
    type: string
    sql: ${TABLE}."LASTMODIFIEDBYID" ;;
    label: "Last Modified"
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
    sql: ${TABLE}."LASTMODIFIEDDATE" ;;
    label: "Last Modified"
  }

  dimension: opportunityid {
    type: string
    sql: ${TABLE}."OPPORTUNITYID" ;;
    label: "Oppt SFID"
  }

  dimension: role {
    type: string
    sql: ${TABLE}."ROLE" ;;
    label: "Role"
  }

  dimension: sfid {
    type: string
    sql: ${TABLE}."SFID" ;;
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
    sql: ${TABLE}."SYSTEMMODSTAMP" ;;
    label: "System"
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
