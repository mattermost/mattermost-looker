view: contributor_employee_map_data {
  sql_table_name: MATTERMOST.CONTRIBUTOR_EMPLOYEE_MAP_DATA ;;

  dimension: latitude {
    hidden: yes
    type: number
    sql: ROUND(${TABLE}.lat,4);;
  }

  dimension: longitude {
    hidden: yes
    type: number
    sql: ROUND(${TABLE}.lng,4);;
  }

  dimension: location {
    type: location
    sql_latitude:${latitude} ;;
    sql_longitude:${longitude} ;;
  }

  dimension: reason {
    description: "Reason the person is considered a contributor or an employee"
    type: string
    sql: ${TABLE}.REASON ;;
  }

  dimension: email {
    description: "Email of the person, if available"
    type: string
    sql: ${TABLE}.email ;;
  }

  measure: count {
    label: "# of People"
    type: sum
    sql: ${TABLE}.count ;;
  }
}
