view: security {
  sql_table_name: EVENTS.SECURITY ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}."ID" ;;
  }

  dimension_group: date {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."DATE" ;;
  }

  dimension: db_type {
    type: string
    sql: ${TABLE}."DB_TYPE" ;;
  }

  dimension: dev_build {
    type: yesno
    sql: ${TABLE}."DEV_BUILD" ;;
  }

  dimension: grouping {
    type: string
    sql: ${TABLE}."GROUPING" ;;
  }

  dimension: hour {
    type: number
    sql: ${TABLE}."HOUR" ;;
  }

  dimension: ip_address {
    type: string
    sql: ${TABLE}."IP_ADDRESS" ;;
  }

  dimension: location {
    type: string
    sql: ${TABLE}."LOCATION" ;;
  }

  dimension: os_type {
    type: string
    sql: ${TABLE}."OS_TYPE" ;;
  }

  dimension: ran_tests {
    type: yesno
    sql: ${TABLE}."RAN_TESTS" ;;
  }

  dimension: user_count {
    type: number
    sql: ${TABLE}."USER_COUNT" ;;
  }

  dimension: version {
    type: string
    sql: ${TABLE}."VERSION" ;;
  }

  measure: active_user_count {
    type: sum
    sql: ${TABLE}."ACTIVE_USER_COUNT" ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
