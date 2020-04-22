view: contributor_map_data {
  sql_table_name: MATTERMOST.CONTRIBUTOR_MAP_DATA ;;

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

  dimension: location_label {
    sql: ${TABLE}.location ;;
  }

  dimension: reason {
    type: string
    sql: ${TABLE}.REASON ;;
  }

  measure: count {
    label: "# of People"
    type: sum
    sql: ${TABLE}.count ;;
  }

}
