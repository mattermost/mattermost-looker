connection: "snowflake"

include: "/views/marts/product/*.view.lkml"

explore: fct_active_users {
  label: "Telemetry Active Users"
  group_label: "[New] Active Users"

  join: dim_daily_server_info {
    relationship: one_to_one
    type: left_outer # Telemetry might not have been submitted from server at a given time
    sql_on: ${fct_active_users.daily_server_id} = ${dim_daily_server_info.daily_server_id} ;;
  }
}
