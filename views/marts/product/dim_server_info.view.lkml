# The name of this view in Looker is "Dim Server Info"
view: dim_server_info {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "MART_PRODUCT"."DIM_SERVER_INFO" ;;
  label: "Dimension: Deployment Information"

  dimension: server_id {
    type: string
    sql: ${TABLE}."SERVER_ID" ;;
    primary_key: yes
    hidden: yes
  }

  dimension: hosting_type {
    type: string
    sql: ${TABLE}."HOSTING_TYPE" ;;
    label: "Hosting type"
    description: "Whether the server is an onprem or cloud installation."
    view_label: "Server: Installation information"

  }

  dimension: installation_id {
    type: string
    sql: ${TABLE}."INSTALLATION_ID" ;;
    label: "Installation ID"
    description: "The ID of the server's installation. Exists only if server is a cloud server."
    view_label: "Server: Installation information"
  }
}
