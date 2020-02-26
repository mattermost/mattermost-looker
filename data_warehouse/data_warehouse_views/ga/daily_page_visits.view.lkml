view: daily_page_visits {
  sql_table_name: "GA"."DAILY_PAGE_VISITS"
    ;;

  dimension: avg_time_on_page {
    type: number
    sql: ${TABLE}."AVGTIMEONPAGE" ;;
  }

  dimension_group: visit {
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

  dimension: page_path {
    type: string
    sql: ${TABLE}."PAGEPATH" ;;
  }

  dimension: page_title {
    type: string
    sql: ${TABLE}."PAGETITLE" ;;
  }

  dimension: page_views {
    type: number
    sql: ${TABLE}."PAGEVIEWS" ;;
  }

  dimension: site {
    type: string
    sql: ${TABLE}."SITE" ;;
  }

  measure: unique_page_views {
    type: sum
    sql: ${TABLE}."UNIQUEPAGEVIEWS" ;;
  }
}
