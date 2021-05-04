view: account_industry_mapping {
  sql_table_name: "UTIL"."ACCOUNT_INDUSTRY_MAPPING"
    ;;

  dimension: industry {
    type: string
    sql: ${TABLE}."INDUSTRY" ;;
  }

  dimension: industry_category {
    type: string
    sql: ${TABLE}."INDUSTRY_CATEGORY" ;;
  }
}
