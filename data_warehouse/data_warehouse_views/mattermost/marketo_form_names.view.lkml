view: marketo_form_names {
  sql_table_name: "MARKETO"."MARKETO_FORM_NAMES";;

  dimension: form_id {
    type: number
    sql: ${TABLE}."FORM_ID" ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}."NAME" ;;
  }
}
