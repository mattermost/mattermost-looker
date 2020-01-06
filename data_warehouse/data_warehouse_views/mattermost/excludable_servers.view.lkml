view: excludable_servers {
  sql_table_name: MATTERMOST.EXCLUDABLE_SERVERS ;;

  dimension: reason {
    type: string
    sql: ${TABLE}."REASON" ;;
  }

  dimension: server_id {
    type: string
    sql: ${TABLE}."SERVER_ID" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
