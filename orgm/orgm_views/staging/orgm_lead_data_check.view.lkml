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
    sql: CASE
           WHEN ${TABLE}.STATUS = 'Not a Lead' THEN 'Junk'
           WHEN ${TABLE}.STATUS = 'MEL' THEN 'MCL'
           ELSE ${TABLE}.STATUS
         END ;;
    type: string
  }

  dimension: systemmodstamp_time {
    type: date_time
    sql: ${TABLE}."systemmodstamp" ;;
  }

  measure: count {
    sql: ${sfid} ;;
    drill_fields: [sfid,email,status,ownerid,created_time,systemmodstamp_time,processed_time,converted_time]
    label: "# Leads"
    type: count_distinct
  }
}
