view: fct_notification_stats {
  sql_table_name: "MART_PRODUCT".fct_notification_stats ;;
  label: " * Notification: Stats"

  dimension_group: date_hour {
    type: time
    timeframes: [raw, hour, date, week, month, quarter, year]
    sql: ${TABLE}.date_hour ;;
    label: "Request"
    description: "Timestamp of the request, rounded (floor) to hour"
  }

  ## Counts for EU server

  dimension: count_eu_send_push {
    type: number
    sql: ${TABLE}.count_eu_send_push ;;
    label: "EU Push Notifications"
    description: "Number of requests to send notifications for EU server for the current hour"
  }

  measure: total_count_eu_send_push {
    type: sum
    sql: ${count_eu_send_push} ;;
    label: "Total EU Push Notifications"
    description: "Total number of requests to send notifications for EU server in the current group"
  }

  dimension: count_eu_send_ack {
    type: number
    sql: ${TABLE}.count_eu_send_ack ;;
    label: "EU Acks"
    description: "Number of requests to acknowledge notifications for EU server for the current hour"
  }

  measure: total_count_eu_send_ack {
    type: sum
    sql: ${count_eu_send_ack} ;;
    label: "Total EU Acks"
    description: "Total number of requests to acknowledge notifications for EU server in the current group"
  }

  ## Counts for Test server

  dimension: count_test_send_push {
    type: number
    sql: ${TABLE}.count_test_send_push ;;
    label: "Test Push Notifications"
    description: "Number of requests to send notifications for test server for the current hour"
  }

  measure: total_count_test_send_push {
    type: sum
    sql: ${count_test_send_push} ;;
    label: "Total Test Push Notifications"
    description: "Total number of requests to send notifications for test server in the current group"
  }

  dimension: count_test_send_ack {
    type: number
    sql: ${TABLE}.count_test_send_ack ;;
    label: "Test Acks"
    description: "Number of requests to acknowledge notifications for test server for the current hour"
  }

  measure: total_count_test_send_ack {
    type: sum
    sql: ${count_test_send_ack} ;;
    label: "Total Test Acks"
    description: "Total number of requests to acknowledge notifications for test server in the current group"
  }

  ## Counts for US server

  dimension: count_us_send_push {
    type: number
    sql: ${TABLE}.count_us_send_push ;;
    label: "US Push Notifications"
    description: "Number of requests to send notifications for US server for the current hour"
  }

  measure: total_count_us_send_push {
    type: sum
    sql: ${count_us_send_push} ;;
    label: "Total US Push Notifications"
    description: "Total number of requests to send notifications for US server in the current group"
  }

  dimension: count_us_send_ack {
    type: number
    sql: ${TABLE}.count_us_send_ack ;;
    label: "US Acks"
    description: "Number of requests to acknowledge notifications for US server for the current hour"
  }

  measure: total_count_us_send_ack {
    type: sum
    sql: ${count_us_send_ack} ;;
    label: "Total US Acks"
    description: "Total number of requests to acknowledge notifications for US server in the current group"
  }

}
