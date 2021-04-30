view: blog_paths {
  sql_table_name: "GA"."BLOG_PATHS";;

  dimension: category {
    type: string
    sql: ${TABLE}."CATEGORY" ;;
  }

  dimension: page_path {
    type: string
    sql: ${TABLE}."PAGE_PATH" ;;
    hidden: yes
  }

  dimension: page_path_pt_2 {
    type: string
    sql: SPLIT_PART(SPLIT_PART(${TABLE}.page_path,'/',3),'/',1) ;;
    hidden: yes
  }
}
