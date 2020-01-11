view: opportunity_snapshot {
  sql_table_name: staging.opportunity_snapshot ;;

  dimension: amount {
    type: number
    sql: ${TABLE}."amount" ;;
    hidden:  yes
  }

  dimension: expectedrevenue {
    type: number
    sql: ${TABLE}."expectedrevenue" ;;
    hidden:  yes
  }

  dimension: arr__c {
    type: number
    sql: ${TABLE}."arr__c" ;;
    hidden:  yes
  }


  dimension_group: closedate {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."closedate" ;;

  }

  dimension: name {
    type: string
    sql: ${TABLE}."name" ;;
  }

  dimension: ownerid {
    type: string
    sql: ${TABLE}."ownerid" ;;
    label: "Owner ID"
  }

  dimension: sfid {
    type: string
    sql: ${TABLE}."sfid" ;;
    label: "Oppt ID"
  }

  dimension: snapshot_date {
    type: string
    sql: ${TABLE}."snapshot_date" ;;
    label: "Snapshot Date"
  }

  dimension: stagename {
    type: string
    sql: ${TABLE}."stagename" ;;
    label: "Stage"
  }

  dimension: forecastcategoryname {
    type: string
    sql: ${TABLE}."forecastcategoryname" ;;
    label: "Forecast"
  }

  dimension: type {
    type: string
    sql: ${TABLE}."type" ;;
    label: "Type"
  }



# Measures
  measure: count {
    type: count
    drill_fields: [sfid, name, stagename]
  }

  measure: total_arr {
    sql: ${arr__c} ;;
    type: sum
    drill_fields: [sfid, name, stagename]
    label: "Total ARR"
    value_format_name: usd_0
  }
  measure: total_expected_revenue {
    sql: ${expectedrevenue} ;;
    type: sum
    drill_fields: [sfid, name, stagename]
    label: "Total Wtd Amount"
    value_format_name: usd_0
  }

  measure: total_amount {
    sql: ${amount} ;;
    type: sum
    drill_fields: [sfid, name, stagename]
    label: "Total Amount"
    value_format_name: usd_0
  }

}
