view: opportunityfieldhistory {
  sql_table_name: "ORGM"."OPPORTUNITYFIELDHISTORY"
    ;;
  drill_fields: [id]

  dimension: id {
    type: number
    sql: ${TABLE}."ID" ;;
    group_label: "System"
  }

  dimension: _hc_lastop {
    type: string
    sql: ${TABLE}."_HC_LASTOP" ;;
    group_label: "System"
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
    group_label: "System"
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
    group_label: "System"
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
    group_label: "System"
  }

  dimension: _sdc_sequence {
    type: number
    sql: ${TABLE}."_SDC_SEQUENCE" ;;
    group_label: "System"
  }

  dimension: _sdc_table_version {
    type: number
    sql: ${TABLE}."_SDC_TABLE_VERSION" ;;
    group_label: "System"
  }

  dimension: createdbyid {
    type: string
    sql: ${TABLE}."CREATEDBYID" ;;
    group_label: "System"
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
    group_label: "System"
  }

  dimension: newvalue {
    type: string
    sql: ${TABLE}."NEWVALUE" ;;
  }

  dimension: oldvalue {
    type: string
    sql: ${TABLE}."OLDVALUE" ;;
  }

  dimension: new_fc_value {
    type: string
    sql: CASE WHEN ${field} = 'ForecastCategoryName' THEN ${newvalue} ELSE '' END;;
    order_by_field: new_fc_sort
    label: "New FC"
    group_label: "Forecast Category"
  }

  dimension: new_fc_sort {
    type: number
    sql: CASE
          WHEN ${newvalue} = 'Closed' THEN 1
          WHEN ${newvalue} = 'Commit' THEN 2
          WHEN ${newvalue} = 'Best Case' THEN 3
          WHEN ${newvalue} = 'Pipeline' THEN 4
          WHEN ${newvalue} = 'Omitted' THEN 5
        ELSE 6 END ;;
    label: "New FC Sort"
    hidden: yes
  }

  dimension: old_fc_value {
    type: string
    sql: CASE WHEN ${field} = 'ForecastCategoryName' THEN ${oldvalue} ELSE '' END;;
    order_by_field: old_fc_sort
    label: "Old FC"
    group_label: "Forecast Category"
  }

  dimension: old_fc_sort {
    type: number
    sql: CASE
          WHEN ${oldvalue} = 'Closed' THEN 1
          WHEN ${oldvalue} = 'Commit' THEN 2
          WHEN ${oldvalue} = 'Best Case' THEN 3
          WHEN ${oldvalue} = 'Pipeline' THEN 4
          WHEN ${oldvalue} = 'Omitted' THEN 5
        ELSE 6 END ;;
    label: "Old FC Sort"
    hidden: yes
  }

  dimension: opportunityid {
    type: string
    sql: ${TABLE}."OPPORTUNITYID" ;;
    label: "Oppt ID"
  }

  dimension: sfid {
    primary_key: yes
    type: string
    sql: ${TABLE}."SFID" ;;
  }

  measure: count {
    type: count
    drill_fields: [opportunityid, opportunity.name, opportunity.type, opportunity.owner_name, opportunity.forecastcategoryname,
                   opportunity.stagename,  opportunity.probability, opportunity.close_date, opportunity.csm_name, opportunity.amoumt]

  }
}
