view: lead_status_dates {
  sql_table_name: "ORGM"."LEAD_STATUS_DATES"
    ;;

  dimension: __sdc_primary_key {
    type: string
    sql: ${TABLE}."__SDC_PRIMARY_KEY" ;;
  }

  dimension_group: _sdc_batched {
    type: time
    timeframes: [
      date,
      week,
      month,
      fiscal_quarter,
      fiscal_year
    ]
    sql: ${TABLE}."_SDC_BATCHED_AT" ;;
  }

  dimension_group: _sdc_extracted {
    type: time
    timeframes: [
      date,
      week,
      month,
      fiscal_quarter,
      fiscal_year
    ]
    sql: ${TABLE}."_SDC_EXTRACTED_AT" ;;
  }

  dimension_group: _sdc_received {
    type: time
    timeframes: [
      date,
      week,
      month,
      fiscal_quarter,
      fiscal_year
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

  dimension_group: first_mcl {
    type: time
    timeframes: [
      date,
      week,
      month,
      fiscal_quarter,
      fiscal_year
    ]
    sql: ${TABLE}."FIRST_MCL_DATE" ;;
  }

  dimension_group: first_mel {
    type: time
    timeframes: [
      date,
      week,
      month,
      fiscal_quarter,
      fiscal_year
    ]
    sql: ${TABLE}."FIRST_MEL_DATE" ;;
  }

  dimension_group: first_mql {
    type: time
    timeframes: [
      date,
      week,
      month,
      fiscal_quarter,
      fiscal_year
    ]
    sql: ${TABLE}."FIRST_MQL_DATE" ;;
  }

  dimension_group: first_not_a_lead {
    type: time
    timeframes: [
      date,
      week,
      month,
      fiscal_quarter,
      fiscal_year
    ]
    sql: ${TABLE}."FIRST_NOT_A_LEAD_DATE" ;;
  }

  dimension_group: first_qsc {
    type: time
    timeframes: [
      date,
      week,
      month,
      fiscal_quarter,
      fiscal_year
    ]
    sql: ${TABLE}."FIRST_QSC_DATE" ;;
  }

  dimension_group: first_qso {
    type: time
    timeframes: [
      date,
      week,
      month,
      fiscal_quarter,
      fiscal_year
    ]
    sql: ${TABLE}."FIRST_QSO_DATE" ;;
  }

  dimension_group: first_recycle {
    type: time
    timeframes: [
      date,
      week,
      month,
      fiscal_quarter,
      fiscal_year
    ]
    sql: ${TABLE}."FIRST_RECYCLE_DATE" ;;
  }

  dimension_group: first_scl {
    type: time
    timeframes: [
      date,
      week,
      month,
      fiscal_quarter,
      fiscal_year
    ]
    sql: ${TABLE}."FIRST_SCL_DATE" ;;
  }

  dimension: leadid {
    type: string
    primary_key: yes
    sql: ${TABLE}."LEADID" ;;
  }

  dimension_group: most_recent_mcl {
    type: time
    timeframes: [
      date,
      week,
      month,
      fiscal_quarter,
      fiscal_year
    ]
    sql: ${TABLE}."MOST_RECENT_MCL_DATE" ;;
  }

  dimension_group: most_recent_mel {
    type: time
    timeframes: [
      date,
      week,
      month,
      fiscal_quarter,
      fiscal_year
    ]
    sql: ${TABLE}."MOST_RECENT_MEL_DATE" ;;
  }

  dimension_group: most_recent_mql {
    type: time
    timeframes: [
      date,
      week,
      month,
      fiscal_quarter,
      fiscal_year
    ]
    sql: ${TABLE}."MOST_RECENT_MQL_DATE" ;;
  }

  dimension_group: most_recent_qsc {
    type: time
    timeframes: [
      date,
      week,
      month,
      fiscal_quarter,
      fiscal_year
    ]
    sql: ${TABLE}."MOST_RECENT_QSC_DATE" ;;
  }

  dimension_group: most_recent_qso {
    type: time
    timeframes: [
      date,
      week,
      month,
      fiscal_quarter,
      fiscal_year
    ]
    sql: ${TABLE}."MOST_RECENT_QSO_DATE" ;;
  }

  dimension_group: most_recent_recycle {
    type: time
    timeframes: [
      date,
      week,
      month,
      fiscal_quarter,
      fiscal_year
    ]
    sql: ${TABLE}."MOST_RECENT_RECYCLE_DATE" ;;
  }

  dimension_group: most_recent_scl {
    type: time
    timeframes: [
      date,
      week,
      month,
      fiscal_quarter,
      fiscal_year
    ]
    sql: ${TABLE}."MOST_RECENT_SCL_DATE" ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [
      date,
      week,
      month,
      fiscal_quarter,
      fiscal_year
    ]
    sql: ${TABLE}."UPDATED_AT" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
