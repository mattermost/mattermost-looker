view: _sdf_fields {
  dimension_group: _sdc_batched {
    group_label: "System"
    label: "SDC Batched"
    sql: ${TABLE}._SDC_BATCHED_AT ;;
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    type: time
  }

  dimension_group: _sdc_extracted {
    group_label: "System"
    label: "SDC Extracted"
    sql: ${TABLE}._SDC_EXTRACTED_AT ;;
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    type: time
  }

  dimension_group: _sdc_received {
    group_label: "System"
    label: "SDC Received"
    sql: ${TABLE}._SDC_RECEIVED_AT ;;
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    type: time
  }

  dimension: _sdc_sequence {
    group_label: "System"
    label: "SDC Sequence"
    sql: ${TABLE}._SDC_SEQUENCE ;;
    type: number
  }

  dimension: _sdc_table_version {
    group_label: "System"
    label: "SDC Table Version"
    sql: ${TABLE}._SDC_TABLE_VERSION ;;
    type: number
  }
}
