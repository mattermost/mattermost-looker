view: commit_segment {
  sql_table_name: "SALES"."COMMIT_SEGMENT"
    ;;

  dimension: commit_netnew {
    type: number
    sql: ${TABLE}."COMMIT_NETNEW" ;;
  }

  dimension: commit_renewal {
    type: number
    sql: ${TABLE}."COMMIT_RENEWAL" ;;
  }

  dimension: qtr {
    type: string
    sql: ${TABLE}."QTR" ;;
  }

  dimension: segment {
    type: string
    sql: ${TABLE}."SEGMENT" ;;
  }

  dimension: upside_netnew {
    type: number
    sql: ${TABLE}."UPSIDE_NETNEW" ;;
  }

  dimension: upside_renewal {
    type: number
    sql: ${TABLE}."UPSIDE_RENEWAL" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
