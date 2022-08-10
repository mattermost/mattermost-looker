view: version_release_dt {

  sql_table_name: "MATTERMOST"."VERSION_RELEASE_DT"
    ;;


  dimension: lifecycle_end_date {
    type: string
    sql: ${TABLE}."END_DATE" ;;
  }

  dimension: release_type {
    type: string
    sql: ${TABLE}."FEATURE" ;;
  }

  dimension: lifecycle_start_date {
    type: string
    sql: ${TABLE}."START_DATE" ;;
  }

  dimension: version {
    type: string
    sql: ${TABLE}."VERSION" ;;
  }

}
