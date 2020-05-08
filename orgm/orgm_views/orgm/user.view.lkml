view: user {
  sql_table_name: orgm."user" ;;
  drill_fields: [id]

  dimension: id {
    type: number
    sql: ${TABLE}.ID ;;
  }

  dimension: _hc_lastop {
    type: string
    sql: ${TABLE}._HC_LASTOP ;;
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
    sql: ${TABLE}._SDC_BATCHED_AT ;;
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
    sql: ${TABLE}._SDC_EXTRACTED_AT ;;
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
    sql: ${TABLE}._SDC_RECEIVED_AT ;;
  }

  dimension: _sdc_sequence {
    type: number
    sql: ${TABLE}._SDC_SEQUENCE ;;
  }

  dimension: _sdc_table_version {
    type: number
    sql: ${TABLE}._SDC_TABLE_VERSION ;;
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
    sql: ${TABLE}.CREATEDDATE ;;
  }

  dimension: department {
    type: string
    sql: ${TABLE}.DEPARTMENT ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.EMAIL ;;
  }

  dimension: isactive {
    type: yesno
    sql: ${TABLE}.ISACTIVE ;;
  }

  dimension: managerid {
    type: string
    sql: ${TABLE}.MANAGERID ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.NAME ;;
  }

  dimension: owner_type {
    type: string
    sql: ${TABLE}.OWNER_TYPE__C ;;
  }

  dimension: sales_ops {
    type: yesno
    sql: ${TABLE}.SALES_OPS__C ;;
  }


  dimension: sfid {
    primary_key: yes
    type: string
    sql: ${TABLE}.SFID ;;
  }


  dimension_group: start_date {
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
    sql: ${TABLE}.START_DATE__C ;;
  }

  dimension: sales_segment {
    type: string
    sql: ${TABLE}.SALES_SEGMENT__C ;;
  }

  dimension: system_type {
    type: string
    sql: ${TABLE}.SYSTEM_TYPE__C ;;
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
    sql: ${TABLE}.SYSTEMMODSTAMP ;;
  }

  dimension: territory {
    type: string
    sql: ${TABLE}.TERRITORY__C ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.TITLE ;;
  }

  dimension: username {
    type: string
    sql: ${TABLE}.USERNAME ;;
  }

  dimension: userroleid {
    type: string
    sql: ${TABLE}.USERROLEID ;;
  }

  dimension: usertype {
    type: string
    sql: ${TABLE}.USERTYPE ;;
  }

  dimension: validation_exempt {
    type: string
    sql: ${TABLE}.VALIDATION_EXEMPT__C ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name, username]
  }
}
