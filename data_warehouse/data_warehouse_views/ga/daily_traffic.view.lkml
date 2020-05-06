view: daily_traffic {
  sql_table_name: GA.DAILY_TRAFFIC ;;

  dimension: channelgrouping {
    label: "Channel Grouping"
    description: "Channel Grouping is a rule-based grouping of the most common sources of traffic, like Paid Search and Direct"
    sql: ${TABLE}."CHANNELGROUPING" ;;
    type: string
  }

  dimension_group: date {
    label: "Logging"
    description: "The date the web traffic was recorded."
    type: time
    timeframes: [date, week, month, year]
    sql: ${TABLE}."START_DATE" ;;
  }

  dimension: site {
    type: string
    sql: ${TABLE}."SITE" ;;
  }

  dimension: source {
    description: "Source is the origin of traffic, such as a search engine (google.com) or a domain (example.com)"
    type: string
    sql: ${TABLE}."SOURCE" ;;
  }

  measure: count_users {
    label: "# of Users"
    type: sum
    sql: ${TABLE}.users ;;
  }
}
