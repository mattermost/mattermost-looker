connection: "snowflake"

# Limit include only to the ones really needed by this explore
include: "/views/marts/product/*.view.lkml"

explore: fct_active_users {
  label: "Telemetry Active Users"
  group_label: "[New] Active Users"

  join: dim_daily_server_info {
    relationship: one_to_one
    type: left_outer # Telemetry might not have been submitted from server at a given time
    sql_on: ${fct_active_users.daily_server_id} = ${dim_daily_server_info.daily_server_id} ;;
  }

  join: dim_server_info {
    relationship: many_to_one
    type: full_outer
    sql_on: ${fct_active_users.server_id} = ${dim_server_info.server_id} ;;
  }

  join: dim_version {
    relationship:  many_to_one
    type: full_outer
    sql_on: ${fct_active_users.version_id} = ${dim_version.version_id} ;;
  }
}

explore: fct_active_servers {
  label: "Telemetry Active Servers"
  group_label: "[New] Active Servers"

  join: dim_version {
    relationship:  many_to_one
    type: full_outer
    sql_on: ${fct_active_servers.version_id} = ${dim_version.version_id} ;;
  }

  join: dim_server_info {
    relationship: many_to_one
    type: full_outer
    sql_on: ${fct_active_servers.server_id} = ${dim_server_info.server_id} ;;
  }

  join: dim_excludable_servers {
    relationship: one_to_one
    type: left_outer
    sql_on: ${fct_active_servers.server_id} = ${dim_excludable_servers.server_id} ;;
  }
}
