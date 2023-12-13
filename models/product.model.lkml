connection: "snowflake"

# Limit include only to the ones really needed by this explore
include: "/views/marts/product/*.view.lkml"

explore: fct_nps_feedback {
  label: "NPS Feedback"
  group_label: "[New] NPS"

  join: dim_cloud_customers {
    relationship: many_to_one
    type: left_outer # We might not have customer telemetry for the NPS feedback server
    sql_on: ${fct_nps_feedback.server_id} = ${dim_cloud_customers.server_id} ;;
  }

  join: dim_self_hosted_customers {
    relationship: many_to_one
    type: left_outer # We might not have customer telemetry for the NPS feedback server
    sql_on: ${fct_nps_feedback.server_id} = ${dim_self_hosted_customers.server_id} ;;
  }
}

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

  join: dim_daily_server_config {
    relationship: one_to_one
    type: left_outer
    sql_on:  ${fct_active_servers.daily_server_id} = ${dim_daily_server_config.daily_server_id} ;;
  }
}

explore:fct_board_activity {
  label: "Telemetry Active Boards Servers"
  group_label: "[New] Active Servers"


  join: dim_server_info {
    relationship: many_to_one
    type: full_outer
    sql_on: ${fct_board_activity.server_id} = ${dim_server_info.server_id} ;;
  }

  join: dim_excludable_servers {
    relationship: one_to_one
    type: left_outer
    sql_on: ${fct_board_activity.server_id} = ${dim_excludable_servers.server_id} ;;
  }

  join: dim_board_customers {
    relationship: many_to_one
    type: full_outer
    sql_on: ${fct_board_activity.server_id} = ${dim_board_customers.server_id} ;;
  }
}

explore:fct_calls_activity {
  label: "Telemetry Active Calls Servers"
  group_label: "[New] Active Servers"


  join: dim_server_info {
    relationship: many_to_one
    type: full_outer
    sql_on: ${fct_calls_activity.server_id} = ${dim_server_info.server_id} ;;
  }

  join: dim_excludable_servers {
    relationship: one_to_one
    type: left_outer
    sql_on: ${fct_calls_activity.server_id} = ${dim_excludable_servers.server_id} ;;
  }
}
