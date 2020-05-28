view: opportunity_snapshot {
  sql_table_name: "ORGM"."OPPORTUNITY_SNAPSHOT"
    ;;

  set: stand_drill_fields {
    fields: [name, stagename, forecastcategoryname, ownerid, ownername, close_date, total_amount, sales_segment, sales_segment_current]
  }

  drill_fields: [stand_drill_fields*]

  dimension: __sdc_primary_key {
    type: string
    sql: ${TABLE}."__SDC_PRIMARY_KEY" ;;
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
    sql: CAST(${TABLE}."_SDC_BATCHED_AT" AS TIMESTAMP_NTZ) ;;
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
    sql: CAST(${TABLE}."_SDC_EXTRACTED_AT" AS TIMESTAMP_NTZ) ;;
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
    sql: CAST(${TABLE}."_SDC_RECEIVED_AT" AS TIMESTAMP_NTZ) ;;
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

  dimension: amount {
    type: number
    sql: ${TABLE}."AMOUNT" ;;
  }

  dimension: amount_net_new {
    type: number
    sql: ${TABLE}."NET_NEW_AMOUNT" ;;
  }

  dimension: amount_renewal {
    type: number
    sql: ${TABLE}."RENEWAL_AMOUNT" ;;
  }


  dimension: arr_contributed {
    type: number
    sql: ${TABLE}."ARR_CONTRIBUTED__C" ;;
  }

  dimension_group: close {
    type: time
    timeframes: [
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: CAST(${TABLE}."CLOSEDATE" AS TIMESTAMP_NTZ) ;;
  }

  dimension: expectedrevenue {
    type: number
    sql: ${TABLE}."EXPECTEDREVENUE" ;;
  }

  dimension: forecastcategoryname {
    type: string
    sql: ${TABLE}."FORECASTCATEGORYNAME" ;;
    order_by_field: forecastcategoryname_sort
    label: "FC"
  }

dimension: forecastcategoryname_sort {
  type: number
  sql: CASE
          WHEN ${forecastcategoryname} = 'Closed' THEN 1
          WHEN ${forecastcategoryname} = 'Commit' THEN 2
          WHEN ${forecastcategoryname} = 'Best Case' THEN 3
          WHEN ${forecastcategoryname} = 'Pipeline' THEN 4
          WHEN ${forecastcategoryname} = 'Omitted' THEN 5
        ELSE 6 END ;;
  group_label: "Forecasting"
  label: "Forecast Category Name"
  hidden: yes
}


  dimension: isclosed {
    type: yesno
    sql: ${TABLE}."ISCLOSED" ;;
    label: "Closed?"
  }

  dimension: iswon {
    type: yesno
    sql: ${TABLE}."ISWON" ;;
    label: "Won?"
  }

  dimension: name {
    type: string
    sql: ${TABLE}."NAME" ;;
  }

  dimension: ownerid {
    type: string
    sql: ${TABLE}."OWNERID" ;;
  }

  dimension: ownername {
    type: string
    sql: ${opportunity_owner.name} ;;
    label: "Owner"
  }

  dimension: probability {
    type: number
    sql: ${TABLE}."PROBABILITY" ;;
    label: "Prob"
  }

  dimension: opportunityid {
    type: string
    sql: ${TABLE}."SFID" ;;
  }

  dimension_group: snapshot {
    type: time
    timeframes: [
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: CAST(${TABLE}."SNAPSHOT_DATE" AS TIMESTAMP_NTZ) ;;
  }

  dimension: stagename {
    type: string
    sql: ${TABLE}."STAGENAME" ;;
  }

  dimension: status_wlo {
    type: string
    sql: ${TABLE}."STATUS_WLO__C" ;;

  }

  dimension: sales_segment {
    type: string
    sql: ${TABLE}."TERRITORY_SEGMENT__C" ;;
    label: "Sales Segment"
  }

  dimension: sales_segment_current {
    type: string
    sql: ${opportunity.territory_sales_segment} ;;
    label: "Sales Segment (Current)"
    }

  dimension: type {
    type: string
    sql: ${TABLE}."TYPE" ;;
  }

#measures

  measure: count {
    type: count
  }

  measure: total_amount {
    type: sum
    sql: ${amount} ;;
    label: "Total"
    value_format_name: usd_0
  }

  measure: total_amount_net_new {
    type: sum
    sql: ${amount_net_new} ;;
    label: "Net New"
    value_format_name: usd_0
  }

  measure: total_amount_renewal {
    type: sum
    sql: ${amount_renewal} ;;
    label: "Renewal"
    value_format_name: usd_0
  }
}
