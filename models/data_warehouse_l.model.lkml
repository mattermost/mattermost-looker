connection: "snowflake_l"
include: "/**/**/*.view.lkml"
fiscal_month_offset: -11
week_start_day: sunday

datagroup: user_events_telemetry_default_datagroup {
  sql_trigger: SELECT MAX(event_date) FROM analytics.events.user_events_telemetry;;
  max_cache_age: "24 hour"
}



explore: user_events_telemetry {
  persist_with: user_events_telemetry_default_datagroup
  label: "User Events Telemetry (Messaging)"
  view_label: " User Events Telemetry (Messaging)"
  group_label: " Product: Messaging"
  description: "Contains all user-level usage events telemetry on the Mattermost platform across all clients and all customer data routing and processing platforms (segment & rudderstack) since 02/01/2019."

  join: server_daily_details {
    view_label: "Server Daily Details"
    sql_on: ${user_events_telemetry.user_id} = ${server_daily_details.server_id} AND ${user_events_telemetry.event_date} = ${server_daily_details.logging_date} ;;
    relationship: many_to_one
    type: left_outer
    fields: [server_daily_details.database_version, server_daily_details.database_version_major, server_daily_details.database_version_major_release, server_daily_details.server_version_major, server_daily_details.version, server_daily_details.edition]
  }

  join: server_fact {
    view_label: "Server Fact"
    sql_on: COALESCE(${license_server_fact.server_id},${license_server_fact2.server_id}) = ${server_fact.server_id} ;;
    relationship: many_to_one
    fields: [server_fact.retention_0day_flag, server_fact.retention_1day_flag, server_fact.retention_7day_flag,
      server_fact.retention_14day_flag, server_fact.retention_28day_flag, server_fact.retention_1week_flag, server_fact.retention_2week_flag, server_fact.retention_3week_flag,
      server_fact.retention_4week_flag, server_fact.installation_id, server_fact.first_server_version,
      server_fact.first_server_version_major, server_fact.first_server_edition, server_fact.cloud_server,
      server_fact.registered_users_max, server_fact.max_registered_deactivated_users, server_fact.server_count]
  }

  join: excludable_servers {
    view_label: "Excludable Servers"
    sql_on: ${user_events_telemetry.user_id} = ${excludable_servers.server_id} ;;
    relationship: many_to_one
    fields: [excludable_servers.reason]
  }

  join: user_agent_registry {
    view_label: "User Agent Registry"
    relationship: many_to_one
    sql_on: ${user_events_telemetry.context_user_agent} = ${user_agent_registry.context_useragent} ;;
    fields: [user_agent_registry.browser_version_major, user_agent_registry.bot, user_agent_registry.browser, user_agent_registry.browser_version, user_agent_registry.browser_w_version_major, user_agent_registry.browser_w_version, user_agent_registry.os_w_version, user_agent_registry.os_w_version_major]
  }

  join: subscriptions {
    view_label: "Stripe Subscriptions"
    relationship: one_to_one
    sql_on: ${subscriptions.cws_installation} = ${server_fact.installation_id} ;;
  }

  join: customers {
    view_label: "Stripe Subscription <> Customers"
    relationship: one_to_one
    sql_on: ${subscriptions.customer} = ${customers.id} ;;
  }

  join: portal_customers {
    view_label: "Stripe Customers <> Portal"
    from: customers
    relationship: many_to_one
    sql_on: ${portal_customers.cws_customer} = ${user_events_telemetry.context_traits_portal_customer_id} ;;
  }

  join: portal_subscriptions {
    from: subscriptions
    relationship: one_to_many
    sql_on: ${portal_customers.id} = ${portal_subscriptions.customer} ;;
    fields: []
  }

  join: license_server_fact {
    from: license_server_fact
    view_label: "License Server Fact"
    relationship: many_to_one
    sql_on: ${user_events_telemetry.user_id} = ${license_server_fact.server_id} ;;
  }

  join: license_server_fact2 {
    from: license_server_fact
    relationship: many_to_one
    sql_on: COALESCE(${user_events_telemetry.portal_customer_id},${user_events_telemetry.context_traits_portal_customer_id})
      = ${license_server_fact2.customer_id} ;;
    fields: []
  }

  join: trial_requests {
    sql_on: ${trial_requests.license_id} = ${license_server_fact.license_id} ;;
    relationship: many_to_one
    type: left_outer
    fields: []
  }

  join: cloud_onboarding_flows {
    relationship: many_to_one
    sql_on: CASE WHEN ${user_events_telemetry.type} = 'pageview_getting_started_cloud' THEN  'pageview_getting_started' ELSE ${user_events_telemetry.type} END = ${cloud_onboarding_flows.type} AND ${user_events_telemetry.category} = ${cloud_onboarding_flows.category} ;;
  }

  join: dates {
    sql_on: ${user_events_telemetry.event_date} <= ${dates.date_raw}
      AND ${user_events_telemetry.event_date} >= ${dates.date_raw} - 30 AND ${dates.date_raw} <= CURRENT_DATE ;;
    relationship: many_to_one
    view_label: "Monthly Active Dates"
    type: inner
    fields: []
  }
}

explore: focalboard_event_telemetry {
  label: "User Events Telemetry (Boards)"
  view_label: "User Events Telemetry (Boards)"
  group_label: " Product: Boards"
  hidden: no

  join: dates {
    sql_on: ${focalboard_event_telemetry.timestamp_date} <= ${dates.date_raw}
          and ${focalboard_event_telemetry.timestamp_date} >= ${dates.date_raw} - 30
          AND ${dates.date_raw} <= CURRENT_DATE ;;
    type: left_outer
    relationship: many_to_one
    fields: []
  }

  join: license_server_fact {
    view_label: "User Events Telemetry (Boards)"
    sql_on: ${license_server_fact.server_id} = ${server_daily_details.server_id};;
    relationship: one_to_many
    fields: [license_server_fact.customer_name_unlinked]
  }

  join: server_daily_details {
    view_label: "User Events Telemetry (Boards)"
    sql_on: ${focalboard_event_telemetry.user_id} = ${server_daily_details.server_id}
      AND ${focalboard_event_telemetry.timestamp_date} = ${server_daily_details.logging_date};;
    relationship: many_to_one
    fields: [server_daily_details.server_version_major, server_daily_details.version, server_daily_details.edition2]
  }

  join: server_fact {
    view_label: "User Events Telemetry (Boards)"
    sql_on: TRIM(${focalboard_event_telemetry.user_id}) = TRIM(${server_fact.server_id}) ;;
    relationship: many_to_one
    fields: [server_fact.installation_id, server_fact.first_server_version,
      server_fact.first_server_version_major, server_fact.first_server_edition,
      server_fact.server_edition, server_fact.cloud_server, server_fact.max_registered_users]
  }

  join: account {
    view_label: "Salesforce Account"
    sql_on: ${license_server_fact.account_sfid} = ${account.sfid}
          AND ${license_server_fact.server_id} = ${server_daily_details.server_id}
          AND ${focalboard_event_telemetry.user_id} = ${server_daily_details.server_id};;
    relationship: many_to_one
    fields: [account.name, account.sfid, account.total_current_arr]
  }
}
