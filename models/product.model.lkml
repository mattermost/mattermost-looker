connection: "snowflake"

# Limit include only to the ones really needed by this explore
include: "/views/marts/product/*.view.lkml"
include: "/views/marts/sales/*.view.lkml"
include: "/views/reports/product/*.view.lkml"

explore: fct_nps_score {
  label: "NPS Score"
  group_label: "[New] NPS Score"

  join: dim_cloud_customers {
    relationship: many_to_one
    type: left_outer # We might not have customer telemetry for the NPS Score server
    sql_on: ${fct_nps_score.server_id} = ${dim_cloud_customers.server_id} ;;
  }

  join: dim_self_hosted_customers {
    relationship: many_to_one
    type: left_outer # We might not have customer telemetry for the NPS Score server
    sql_on: ${fct_nps_score.server_id} = ${dim_self_hosted_customers.server_id} ;;
  }

  join: dim_excludable_servers {
    relationship: many_to_one
    type: left_outer
    sql_on: ${fct_nps_score.server_id} = ${dim_excludable_servers.server_id} ;;
  }
}

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

  join: dim_excludable_servers {
    relationship: many_to_one
    type: left_outer
    sql_on: ${fct_nps_feedback.server_id} = ${dim_excludable_servers.server_id} ;;
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

  join: dim_excludable_servers {
    relationship: many_to_one
    type: left_outer
    sql_on: ${fct_active_users.server_id} = ${dim_excludable_servers.server_id} ;;
  }

  join: dim_daily_server_config {
    relationship: one_to_one
    type: left_outer
    sql_on:  ${fct_active_users.daily_server_id} = ${dim_daily_server_config.daily_server_id} ;;
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
    relationship: many_to_one
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
    relationship: many_to_one
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

explore: rpt_tedau_at_day_28 {
  label: "TEDAU on day 28"
  group_label: "[New] Active Users"

  join: dim_server_info {
    relationship: many_to_one
    type: full_outer
    sql_on: ${rpt_tedau_at_day_28.server_id} = ${dim_server_info.server_id} ;;
  }

  join: dim_excludable_servers {
    relationship: many_to_one
    type: left_outer
    sql_on: ${rpt_tedau_at_day_28.server_id} = ${dim_excludable_servers.server_id} ;;
  }
}

explore: fct_notification_stats {
  label: "Notification Stats"
  group_label: "[New] Notifications"
}


explore: fct_feature_daily_snapshot {
  label: "Paid feature usage"
  group_label: "[New] Feature usage"


  join: dim_excludable_servers {
    relationship: many_to_one
    type: left_outer
    sql_on: ${fct_feature_daily_snapshot.server_id} = ${dim_excludable_servers.server_id} ;;
  }


  join: dim_cloud_customers {
    relationship: many_to_one
    type: left_outer
    sql_on: ${fct_feature_daily_snapshot.server_id} = ${dim_cloud_customers.server_id} ;;
  }

  join: dim_self_hosted_customers {
    relationship: many_to_one
    type: left_outer
    sql_on: ${fct_feature_daily_snapshot.server_id} = ${dim_self_hosted_customers.server_id} ;;
  }
}

explore: fct_in_product_trial_requests {
  label: "In-app Trial Requests"
  group_label: "[New] Trial Requests"
}

explore: rpt_active_user_base {
  label: "Active User Base"
  group_label: "[New] Active Users"
}

explore: fct_subscription_history {
  label: "Cloud Subscription History (360)"
  group_label: "[New] Cloud 360"

  join: dim_self_serve_customers {
    relationship: many_to_one
    type:  left_outer
    sql_on:  ${fct_subscription_history.customer_id} = ${dim_self_serve_customers.customer_id} ;;
  }

  join: dim_server_info {
    relationship: many_to_many
    type: full_outer
    sql_on:  ${fct_subscription_history.cws_installation} = ${dim_server_info.installation_id} ;;
  }
}
