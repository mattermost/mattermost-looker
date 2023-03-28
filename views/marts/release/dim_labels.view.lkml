view: dim_labels {
  label: "Labels"
  sql_table_name: "MART_RELEASE"."DIM_LABELS"
    ;;

  dimension: issue_id {
    type: string
    hidden:  yes
    sql: ${TABLE}."ISSUE_ID" ;;
  }

  dimension: label {
    description: "The label's text"
    type: string
    sql: ${TABLE}."LABEL" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
