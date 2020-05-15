view: campaignmember_ext {
  sql_table_name: "ORGM"."CAMPAIGNMEMBER_EXT"
    ;;

  dimension: cm_sfid {
    type: string
    sql: ${TABLE}."CAMPAIGNMEMBER_SFID" ;;
  }

  dimension: contact_us_request {
    type: date_time
    sql: ${TABLE}."CONTACT_US_REQUEST_DATE";;
  }

  dimension: trial_request {
    type: date_time
    sql: ${TABLE}."TRIAL_REQUEST_DATE";;
  }


}
