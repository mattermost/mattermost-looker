# User data from salesforce.
#
# Groups Labels
# -


view: user {
  sql_table_name: orgm."USER" ;;
  drill_fields: [user_drill_fields*]


  #
  # Sets
  #

  set: user_drill_fields {
    fields: [id]
  }


  #
  # Dimensions
  #

  dimension: id {
    primary_key: yes
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

  dimension: senderemail {
    type: string
    sql: ${TABLE}.SENDEREMAIL ;;
  }

  dimension: sendername {
    type: string
    sql: ${TABLE}.SENDERNAME ;;
  }

  dimension: sfid {
    type: string
    sql: ${TABLE}.SFID ;;
  }

  dimension: signature {
    type: string
    sql: ${TABLE}.SIGNATURE ;;
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


  #
  # Measures
  #

  measure: count {
    type: count
    drill_fields: [id, sendername, name, username]
  }
}
