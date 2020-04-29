view: orgm_lead_data_check {
  sql_table_name: staging.orgm_lead_data_check ;;

  dimension: converted_time {
    type: date_time
    sql: ${TABLE}."converteddate" ;;
  }

  dimension: created_time {
    type: date_time
    sql: ${TABLE}."createddate" ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}."email" ;;
  }

  dimension: ownerid {
    type: string
    sql: ${TABLE}."ownerid" ;;
  }

  dimension: processed_time {
    type: date_time
    sql: ${TABLE}."processed_at" ;;
  }

  dimension: sfid {
    type: string
    sql: ${TABLE}."sfid" ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}."status" ;;
  }

  dimension: systemmodstamp_time {
    type: date_time
    sql: ${TABLE}."systemmodstamp" ;;
  }

  measure: count {
    type: count
  }
}
