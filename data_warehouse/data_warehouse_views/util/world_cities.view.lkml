view: world_cities {
  sql_table_name: UTIL.WORLD_CITIES ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.ID ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.CITY ;;
  }

  dimension: city_ascii {
    type: string
    sql: ${TABLE}.CITY_ASCII ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.COUNTRY ;;
  }

  dimension: iso2 {
    type: string
    sql: ${TABLE}.ISO2 ;;
  }

  dimension: iso3 {
    type: string
    sql: ${TABLE}.ISO3 ;;
  }

  dimension: lat {
    type: number
    sql: ${TABLE}.LAT ;;
  }

  dimension: lng {
    type: number
    sql: ${TABLE}.LNG ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
