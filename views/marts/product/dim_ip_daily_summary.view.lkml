# The name of this view in Looker is "Dim IP Daily Summary"
view: dim_ip_daily_summary {
  sql_table_name: "MART_PRODUCT".dim_ip_daily_summary ;;
  label: " Downloads: Daily IP Address summary"

  dimension: daily_ip_id {
    type: string
    sql: ${TABLE}.daily_ip_id ;;
    primary_key: yes
    description: "A unique id for each IP and date."
    hidden: yes
  }

  dimension: client_ip {
    type: string
    sql: ${TABLE}.client_ip ;;
    description: "The client's IP address"
  }


  dimension_group: log {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.log_date ;;
    description: "The data that the summary for the given IP is summarized."
  }

  dimension_group: first_download_timestamp {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.first_download_timestamp ;;
    description: "The timestamp of the first download in the day."
  }

}
