view: rpt_tedau_at_day_28 {
  sql_table_name: "MART_PRODUCT"."RPT_TEDAU_AT_DAY_28" ;;
  label: "   * Server: TEDAU at 28th day"


  dimension: server_id {
    type: string
    sql: ${TABLE}."SERVER_ID" ;;
    primary_key: yes
    label: "Server ID"
    description: "The server's ID"
  }

  dimension_group: active_since {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."ACTIVE_SINCE_DATE" ;;
    label: "Active Since"
    description: "Date that the server was first reported active"
  }


  dimension: is_active_at_day_28 {
    type: yesno
    sql: ${TABLE}."IS_ACTIVE_AT_DAY_28" ;;
    label: "Is active at day 28"
    description: "Whether the server is still active on day 28."
  }


  dimension: daily_active_users {
    type: number
    sql: ${TABLE}."DAILY_ACTIVE_USERS" ;;
    label: "DAU (Client) at day 28"
    description: "The number of unique active users for the given server on day 28 of the server's lifecycle. If there is no information about the specific date (i.e. server inactive or server hasn't reported telemetry), then it's 0."
  }

  dimension: server_daily_active_users {
    type: number
    sql: ${TABLE}."SERVER_DAILY_ACTIVE_USERS" ;;
    label: "DAU (Server) at day 28"
    description: "Total number of active users for the past 24 hours prior to the timestamp of the event. Bots and deleted users are excluded. Reported by mattermost server. If there is no information about the specific date (i.e. server inactive or server hasn't reported telemetry), then it's 0."
  }

  measure: total_daily_active_users {
    type: sum
    sql: ${daily_active_users} ;;
    label: "Total DAU (Client) at day 28"
  }

  measure: total_server_daily_active_users {
    type: sum
    sql: ${server_daily_active_users} ;;
    label: "Total DAU (Server) at day 28"
  }



  measure: count_distinct_servers {
    type: count_distinct
    sql: ${server_id} ;;
    label: "Total Unique Servers"
    view_label: " * Metrics: Server"
  }
}
