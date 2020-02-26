view: daily_page_visits {
  sql_table_name: "GA"."DAILY_PAGE_VISITS";;

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

  dimension: site {
    type: string
    sql: ${TABLE}."SITE" ;;
  }

  measure: page_views {
    type: sum
    sql: ${TABLE}."PAGEVIEWS" ;;
    description: "A pageview is reported when a page has been viewed by a user on the website"
  }

  measure: unique_page_views {
    type: sum
    sql: ${TABLE}."UNIQUEPAGEVIEWS" ;;
    description: "Counts a page once even if it was viewed multiple times within a single session."
  }
}
