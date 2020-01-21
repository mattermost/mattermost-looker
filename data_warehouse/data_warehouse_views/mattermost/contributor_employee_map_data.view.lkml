view: contributor_employee_map_data {
  sql_table_name: MATTERMOST.CONTRIBUTOR_EMPLOYEE_MAP_DATA ;;

  dimension: latitude {
    type: number
    sql: ${TABLE}.latitude;;
  }

  dimension: longitude {
    type: number
    sql: ${TABLE}.longitude;;
  }

  dimension: location {
    type: location
    sql_latitude:${latitude} ;;
    sql_longitude:${longitude} ;;
  }

  dimension: reason {
    type: string
    sql: ${TABLE}.REASON ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.unique_identifier ;;
  }

  measure: count {
    type: sum
    sql: ${TABLE}.count ;;
  }
}
