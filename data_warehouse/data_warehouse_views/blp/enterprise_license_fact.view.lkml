view: enterprise_license_fact {
  sql_table_name: "BLP"."ENTERPRISE_LICENSE_FACT"
    ;;

  dimension: account_sfid {
    type: string
    sql: ${TABLE}."ACCOUNT_SFID" ;;
  }

  dimension: current_avg_servers {
    type: number
    sql: ${TABLE}."CURRENT_AVG_SERVERS" ;;
  }

  dimension: current_max_license_server_dau {
    type: number
    sql: ${TABLE}."CURRENT_MAX_LICENSE_SERVER_DAU" ;;
  }

  dimension: current_max_license_server_mau {
    type: number
    sql: ${TABLE}."CURRENT_MAX_LICENSE_SERVER_MAU" ;;
  }

  dimension: current_max_licensed_users {
    type: number
    sql: ${TABLE}."CURRENT_MAX_LICENSED_USERS" ;;
  }

  dimension: current_max_servers {
    type: number
    sql: ${TABLE}."CURRENT_MAX_SERVERS" ;;
  }

  dimension: current_rolling_7_day_avg_dau {
    type: number
    sql: ${TABLE}."CURRENT_ROLLING_7DAY_AVG_DAU" ;;
  }

  dimension: current_rolling_7_day_avg_mau {
    type: number
    sql: ${TABLE}."CURRENT_ROLLING_7DAY_AVG_MAU" ;;
  }

  dimension_group: expiresat {
    type: time
    timeframes: [
      date,
      month,
      fiscal_quarter,
      fiscal_year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."EXPIRESAT" ;;
  }

  dimension_group: last_license_telemetry {
    type: time
    timeframes: [
      date,
      month,
      fiscal_quarter,
      fiscal_year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."LAST_LICENSE_TELEMETRY_DATE" ;;
  }

  dimension: last_license_telemetry_previous_7 {
    label: "Telemetry in Prev. 7 Days"
    sql: ${last_license_telemetry_date} >= current_date - interval '7 days' ;;
    type: yesno
  }

  dimension: licenseid {
    type: string
    sql: ${TABLE}."LICENSEID" ;;
  }

  dimension: month_ago_avg_servers {
    type: number
    sql: ${TABLE}."MONTH_AGO_AVG_SERVERS" ;;
  }

  dimension: month_ago_max_license_server_dau {
    type: number
    sql: ${TABLE}."MONTH_AGO_MAX_LICENSE_SERVER_DAU" ;;
  }

  dimension: month_ago_max_license_server_mau {
    type: number
    sql: ${TABLE}."MONTH_AGO_MAX_LICENSE_SERVER_MAU" ;;
  }

  dimension: month_ago_max_licensed_users {
    type: number
    sql: ${TABLE}."MONTH_AGO_MAX_LICENSED_USERS" ;;
  }

  dimension: month_ago_max_servers {
    type: number
    sql: ${TABLE}."MONTH_AGO_MAX_SERVERS" ;;
  }

  dimension: month_ago_rolling_7_day_avg_dau {
    type: number
    sql: ${TABLE}."MONTH_AGO_ROLLING_7DAY_AVG_DAU" ;;
  }

  dimension: month_ago_rolling_7_day_avg_mau {
    type: number
    sql: ${TABLE}."MONTH_AGO_ROLLING_7DAY_AVG_MAU" ;;
  }

  dimension_group: start {
    type: time
    timeframes: [
      date,
      month,
      fiscal_quarter,
      fiscal_year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."START_DATE" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure: max_telemetry_date {
    label: "Last Telemetry Date"
    type: date
    sql: MAX(${last_license_telemetry_date}) ;;
  }
}
