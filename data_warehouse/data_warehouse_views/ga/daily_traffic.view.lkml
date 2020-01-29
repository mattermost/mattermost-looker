view: daily_traffic {
  sql_table_name: GA.DAILY_TRAFFIC ;;

  dimension: channelgrouping {
    label: "Channel Grouping"
    sql: ${TABLE}."CHANNELGROUPING" ;;
    type: string
  }

  dimension_group: end {
    type: time
    timeframes: [
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."END_DATE" ;;
  }

  dimension: site {
    type: string
    sql: ${TABLE}."SITE" ;;
  }

  dimension: source {
    type: string
    sql: ${TABLE}."SOURCE" ;;
  }

  dimension_group: start {
    type: time
    timeframes: [
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."START_DATE" ;;
  }

  measure: count_users {
    type: sum
    sql: ${TABLE}.users ;;
  }
}
