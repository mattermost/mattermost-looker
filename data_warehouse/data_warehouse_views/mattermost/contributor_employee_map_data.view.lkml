view: contributor_employee_map_data {
  sql_table_name: MATTERMOST.CONTRIBUTOR_EMPLOYEE_MAP_DATA ;;

  dimension: latitude {
    type: number
    sql: ROUND(${TABLE}.lat,4);;
  }

  dimension: longitude {
    type: number
    sql: ROUND(${TABLE}.lng,4);;
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
    sql: ${TABLE}.email ;;
  }

  measure: count {
    type: sum
    sql: ${TABLE}.count ;;
  }
}
