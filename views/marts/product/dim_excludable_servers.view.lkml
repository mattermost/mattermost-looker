# The name of this view in Looker is "Dim Excludable Servers"
view: dim_excludable_servers {
  sql_table_name: "MART_PRODUCT"."DIM_EXCLUDABLE_SERVERS" ;;

  label: "Excludable Servers"

  dimension: server_id {
    type: string
    sql: ${TABLE}.server_id ;;
    primary_key: yes
    label: "Server ID"
    description: " The server's ID"
    hidden: yes
  }

  dimension: reasons {
    type: string
    sql: ${TABLE}.reasons ;;
    label: "Reasons"
    description: "List of reasons this server is considered for exclusion."
  }

}
