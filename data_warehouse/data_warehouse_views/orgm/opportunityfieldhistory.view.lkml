view: opportunityfieldhistory {
  sql_table_name: "ORGM"."OPPORTUNITYFIELDHISTORY"
    ;;
  drill_fields: [id]

  dimension: id {
    type: number
    sql: ${TABLE}."ID" ;;
  }

  dimension: _hc_lastop {
    type: string
    sql: ${TABLE}."_HC_LASTOP" ;;
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
  }

  dimension: _sdc_sequence {
    type: number
    sql: ${TABLE}."_SDC_SEQUENCE" ;;
  }

  dimension: _sdc_table_version {
    type: number
    sql: ${TABLE}."_SDC_TABLE_VERSION" ;;
  }

  dimension: createdbyid {
    type: string
    sql: ${TABLE}."CREATEDBYID" ;;
  }

  dimension_group: created {
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
  }

  dimension: field {
    type: string
    sql: ${TABLE}."FIELD" ;;
  }

  dimension: isdeleted {
    type: yesno
    sql: ${TABLE}."ISDELETED" ;;
  }

  dimension: newvalue {
    type: string
    sql: ${TABLE}."NEWVALUE" ;;
  }

  dimension: oldvalue {
    type: string
    sql: ${TABLE}."OLDVALUE" ;;
  }

  dimension: opportunityid {
    type: string
    sql: ${TABLE}."OPPORTUNITYID" ;;
  }

  dimension: sfid {
    primary_key: yes
    type: string
    sql: ${TABLE}."SFID" ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
