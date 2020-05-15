view: campaignmember_ext {
  sql_table_name: "ORGM"."CAMPAIGNMEMBER_EXT"
    ;;

  dimension: cm_sfid {
    type: string
    sql: ${TABLE}."CAMPAIGNMEMBER_SFID" ;;
  }

  dimension_group: contact_us_request {
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
    sql: CAST(${TABLE}."CONTACT_US_REQUEST_DATE" AS TIMESTAMP_NTZ) ;;
  }

  dimension_group: trial_request {
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
    sql: CAST(${TABLE}."TRIAL_REQUEST_DATE" AS TIMESTAMP_NTZ) ;;
  }


}
