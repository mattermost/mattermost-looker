view: daily_page_visits {
  sql_table_name: "GA"."DAILY_PAGE_VISITS";;

  dimension_group: visit {
    type: time
    timeframes: [
      date,
      month,
      fiscal_quarter,
      fiscal_year
    ]
    sql: ${TABLE}."START_DATE" ;;
  }

  dimension: page_path {
    group_label: "Page Paths"
    group_item_label: " Raw"
    label: "Page Path (Raw)"
    type: string
    sql: ${TABLE}."PAGEPATH" ;;
  }

  dimension: page_path_cleaned {
    group_label: "Page Paths"
    group_item_label: " Clean"
    label: "Page Path (Clean)"
    type: string
    sql: case when ${page_path} not like '/translate%' and ${page_path} not like '/search%' and ${page_path} not like '/web%' then ${page_path} else split_part(${page_path}, 'mattermost.com',2) end ;;
  }

  dimension: page_path_1 {
    group_label: "Page Paths"
    group_item_label: "Level 1"
    label: "Page Path (Level 1)"
    type: string
    sql: case when split_part(${page_path_cleaned},'/',2) != '' then '/' || split_part(${page_path_cleaned},'/',2) || '/' ELSE '/' END;;
    link: {
      label: "Link to Page"
      url: "https://{{site}}{{page_path_1}}"
    }
  }

  dimension: page_path_2 {
    group_label: "Page Paths"
    group_item_label: "Level 2"
    label: "Page Path (Level 2)"
    type: string
    sql: case when split_part(${page_path_cleaned},'/',3) != '' THEN ${page_path_1} || split_part(${page_path_cleaned},'/',3) || '/' ELSE '/' END;;
    link: {
      label: "Link to Page"
      url: "https://{{site}}{{page_path_2}}"
    }
  }

  dimension: page_title {
    label: "Page Title"
    type: string
    sql: ${TABLE}."PAGETITLE" ;;
  }

  dimension: site {
    type: string
    sql: ${TABLE}."SITE" ;;
  }

  measure: page_views {
    label: "Total Page Views"
    type: sum
    sql: ${TABLE}."PAGEVIEWS" ;;
    description: "A pageview is reported when a page has been viewed by a user on the website"
  }

  measure: unique_page_views {
    label: "Total Unique Page Views"
    type: sum
    sql: ${TABLE}."UNIQUEPAGEVIEWS" ;;
    description: "Counts a page once even if it was viewed multiple times within a single session."
  }
}
