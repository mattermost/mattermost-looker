view: downloads {
  sql_table_name: MATTERMOST.DOWNLOADS ;;

  dimension: cip {
    description: "The IP address of the user"
    label: "Client IP"
    type: string
    sql: ${TABLE}."CIP" ;;
  }

  dimension_group: log {
    type: time
    timeframes: [
      date,
      month,
      fiscal_quarter,
      year,
      fiscal_year
    ]
    sql: ${TABLE}."LOGDATE" ;;
  }

  dimension: download_type {
    description: "eg. Desktop, EE, TE"
    type: string
    sql: ${TABLE}."TYPE" ;;
  }

  dimension: useragent {
    description: "Text identifying the browser and operating system of the user"
    label: "User Agent"
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
