view: downloads {
  sql_table_name: MATTERMOST.DOWNLOADS ;;

  dimension: cip {
    type: string
    sql: ${TABLE}."CIP" ;;
  }

  dimension: logdate {
    type: string
    sql: ${TABLE}."LOGDATE" ;;
  }

  dimension: download_type {
    type: string
    sql: ${TABLE}."TYPE" ;;
  }

  dimension: useragent {
    type: string
    sql: ${TABLE}."USERAGENT" ;;
  }

  dimension: version {
    type: string
    sql: ${TABLE}."VERSION" ;;
  }

  measure: download_count {
    type: sum
    sql: ${TABLE}."COUNT" ;;
  }

}
