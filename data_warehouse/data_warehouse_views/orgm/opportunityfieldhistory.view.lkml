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

  dimension: new_value {
    type: string
    sql: ${TABLE}."NEWVALUE" ;;
  }

  dimension: old_value {
    type: string
    sql: ${TABLE}."OLDVALUE" ;;
  }

  dimension: new_fc_value {
    type: string
    sql: CASE WHEN ${field} = 'ForecastCategoryName' THEN ${new_value} ELSE '' END;;
    order_by_field: new_fc_sort
    label: "New FC"
    group_label: "Forecast Category"
  }

  dimension: new_fc_sort {
    type: number
    sql: CASE
          WHEN ${new_value} = 'Closed' THEN 1
          WHEN ${new_value} = 'Commit' THEN 2
          WHEN ${new_value} = 'Best Case' THEN 3
          WHEN ${new_value} = 'Pipeline' THEN 4
          WHEN ${new_value} = 'Omitted' THEN 5
        ELSE 6 END ;;
    label: "New FC Sort"
    hidden: yes
  }

  dimension: old_fc_value {
    type: string
    sql: CASE WHEN ${field} = 'ForecastCategoryName' THEN ${old_value} ELSE '' END;;
    order_by_field: old_fc_sort
    label: "Old FC"
    group_label: "Forecast Category"
  }

  dimension: old_fc_sort {
    type: number
    sql: CASE
          WHEN ${old_value} = 'Closed' THEN 1
          WHEN ${old_value} = 'Commit' THEN 2
          WHEN ${old_value} = 'Best Case' THEN 3
          WHEN ${old_value} = 'Pipeline' THEN 4
          WHEN ${old_value} = 'Omitted' THEN 5
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
