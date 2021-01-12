view: blog_paths {
  sql_table_name: "GA"."BLOG_PATHS";;

  dimension: category {
    type: string
    sql: ${TABLE}."CATEGORY" ;;
  }

  dimension: page_path {
    type: string
    sql: ${TABLE}."PAGE_PATH" ;;
  }
}
