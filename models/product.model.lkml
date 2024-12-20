connection: "snowflake"

# Limit include only to the ones really needed by this explore
include: "/views/marts/common/*.view.lkml"
include: "/views/marts/mlt/*.view.lkml"
include: "/views/marts/product/*.view.lkml"
include: "/views/marts/sales/*.view.lkml"
include: "/views/reports/**/*.view.lkml"


explore: fct_nps_score {
  label: "NPS Score"
  group_label: "[New] NPS Score"

  join: dim_excludable_servers {
    relationship: many_to_one
    type: left_outer
    sql_on: ${fct_nps_score.server_id} = ${dim_excludable_servers.server_id} ;;
  }

  join: dim_version {
    relationship:  many_to_one
    type: full_outer
    sql_on: ${fct_nps_score.version_id} = ${dim_version.version_id} ;;
  }

  join: dim_daily_license {
    relationship: one_to_one
    type: left_outer
    sql_on: ${fct_nps_score.daily_server_id} = ${dim_daily_license.daily_server_id} ;;
  }
}

explore: fct_nps_feedback {
  label: "NPS Feedback"
  group_label: "[New] NPS"

  join: dim_excludable_servers {
    relationship: many_to_one
    type: left_outer
    sql_on: ${fct_nps_feedback.server_id} = ${dim_excludable_servers.server_id} ;;
  }

  join: dim_version {
    relationship:  many_to_one
    type: full_outer
    sql_on: ${fct_nps_feedback.version_id} = ${dim_version.version_id} ;;
  }

  join: dim_daily_license {
    relationship: many_to_one
    type: left_outer
    sql_on: ${fct_nps_feedback.daily_server_id} = ${dim_daily_license.daily_server_id} ;;
  }
}

explore: fct_active_users {
  label: "Telemetry Active Users"
  group_label: "[New] Active Users"

  join: dim_date {
    relationship: one_to_one
    type: left_outer
    sql_on: ${fct_active_users.activity_raw} = ${dim_date.date_day_raw} ;;
    view_label: "Activity Date: Details"
  }

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

  join: dim_daily_license {
    relationship: one_to_one
    type: left_outer
    sql_on: ${fct_active_users.daily_server_id} = ${dim_daily_license.daily_server_id} ;;
  }
}

explore: fct_active_servers {
  label: "Telemetry Active Servers"
  group_label: "[New] Active Servers"

  join: dim_daily_server_info {
    relationship: one_to_one
    type: left_outer # Telemetry might not have been submitted from server at a given time
    sql_on: ${fct_active_servers.daily_server_id} = ${dim_daily_server_info.daily_server_id} ;;
  }

  join: dim_date {
    relationship: one_to_one
    type: left_outer
    sql_on: ${fct_active_servers.activity_raw} = ${dim_date.date_day_raw} ;;
    view_label: "Activity Date: Details"
  }

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

  join: dim_daily_license {
    relationship: one_to_one
    type: left_outer
    sql_on: ${fct_active_servers.daily_server_id} = ${dim_daily_license.daily_server_id} ;;
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

explore: fct_calls_activity {
  label: "Telemetry Active Calls Servers"
  group_label: "[New] Active Servers"


  join: dim_server_info {
    relationship: many_to_one
    type: full_outer
    sql_on: ${fct_calls_activity.server_id} = ${dim_server_info.server_id} ;;
  }

  join: dim_excludable_servers {
    relationship: many_to_one
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

  join: dim_daily_license {
    relationship: one_to_one
    type: left_outer
    sql_on: ${fct_feature_daily_snapshot.daily_server_id} = ${dim_daily_license.daily_server_id} ;;
  }
}

explore: fct_in_product_trial_requests {
  label: "Latest In-app Trial Requests"
  group_label: "[New] Trial Requests"
}

explore: rpt_active_user_base {
  label: "Active User Base"
  group_label: "[New] Active Users"
}

explore: fct_onprem_trial_requests_history  {
  label: "On-prem Trial Request History"
  group_label: "[New] Trial Requests"
}

explore: fct_trial_requests_history  {
  label: "Trial Request History"
  group_label: "[New] Trial Requests"

  join: dim_excludable_servers {
    relationship: many_to_one
    type: left_outer
    sql_on: ${fct_trial_requests_history.server_id} = ${dim_excludable_servers.server_id} ;;
  }
}

explore: fct_subscription_history {
  label: "Cloud Subscription History (360)"
  group_label: "[New] Cloud 360"

  join: dim_self_serve_customers {
    relationship: many_to_one
    type:  left_outer
    sql_on:  ${fct_subscription_history.customer_id} = ${dim_self_serve_customers.customer_id} ;;
  }

  join: dim_installation_summary {
    relationship: many_to_one
    type:  left_outer
    sql_on:  ${fct_subscription_history.cws_installation} = ${dim_installation_summary.installation_id} ;;
  }
}

explore: fct_downloads {
  label: "Successful Downloads"
  group_label: "[New] Downloads"

  join: dim_ip_daily_summary{
    relationship: many_to_one
    type:  left_outer
    sql_on:  ${fct_downloads.daily_ip_id} = ${dim_ip_daily_summary.daily_ip_id} ;;

  }
}

explore: grp_copilot_tracks {
  label: "Copilot events"
  group_label: "[New] Active Users"
}

explore: fct_licenses {
  label: "Known Licenses"
  group_label: "[New] Active Servers"

  join: bdg_license_server{
    relationship: one_to_many
    type: left_outer
    sql_on:  ${fct_licenses.license_id} = ${bdg_license_server.license_id} ;;
  }

  join: dim_server_info {
    relationship: many_to_one
    type: left_outer
    sql_on: ${bdg_license_server.server_id} = ${dim_server_info.server_id} ;;
  }
}


explore: rpt_won_opportunities {
  label: "[New] Closed Won Opportunities"
  group_label: "[New] Salesforce reports"
}

explore: rpt_docs_feedback {
  label: "[New] Feedback"
  group_label: "[New] Mattermost Documentation"
}

explore: grp_performance_events {
  label: "[New] Performance events"
  group_label: "[New] Active Servers"

  join: dim_user_agent {
    relationship: many_to_one
    type: left_outer
    sql_on: ${grp_performance_events.context_user_agent} = ${dim_user_agent.raw_user_agent} ;;
  }

  join: dim_server_info {
    relationship: many_to_one
    type: full_outer
    sql_on: ${grp_performance_events.user_id} = ${dim_server_info.server_id} ;;
  }


}
