# The name of this view in Looker is "Dim Excludable Servers"
view: dim_excludable_servers {
  sql_table_name: "mart_product"."dim_excludable_servers" ;;

  label: "Excludable Servers"

  dimension: server_id {
    type: string
    sql: ${TABLE}."server_id" ;;
    primary_key: yes
    label: " The server's ID"
  }

  dimension: reasons {
    type: string
    sql: ${TABLE}."reasons" ;;
    label: "List of reasons this server is considered for exclusion."
  }

}
