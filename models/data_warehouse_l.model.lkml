connection: "snowflake_l"
include: "/**/**/*.view.lkml"
fiscal_month_offset: -11
week_start_day: sunday

explore: user_events_telemetry {
  label: "User Events Telemetry (Messaging)"
  view_label: " User Events Telemetry (Messaging)"
  sql_always_where: ${user_events_telemetry.type} NOT IN ('api_profiles_get_by_ids', 'api_profiles_get_by_usernames');;
  group_label: " Product: Messaging"
  description: "Contains all user-level usage events telemetry on the Mattermost platform across all clients and all customer data routing and processing platforms (segment & rudderstack) since 02/01/2019."

  join: server_daily_details {
    view_label: " User Events Telemetry (Messaging)"
    sql_on: ${user_events_telemetry.user_id} = ${server_daily_details.server_id} AND ${user_events_telemetry.event_date} = ${server_daily_details.logging_date} ;;
    relationship: many_to_one
    type: left_outer
    fields: [server_daily_details.database_version, server_daily_details.database_version_major, server_daily_details.database_version_major_release, server_daily_details.server_version_major, server_daily_details.version, server_daily_details.edition]
  }

  join: server_fact {
    view_label: "Server Fact"
    sql_on: ${user_events_telemetry.user_id} = ${server_fact.server_id} ;;
    relationship: many_to_one
    fields: [server_fact.installation_id, server_fact.first_server_version, server_fact.first_server_version_major, server_fact.first_server_edition, server_fact.cloud_server, server_fact.registered_users_max, server_fact.max_registered_deactivated_users]
  }

  join: excludable_servers {
    view_label: " User Events Telemetry (Messaging)"
    sql_on: ${user_events_telemetry.user_id} = ${excludable_servers.server_id} ;;
    relationship: many_to_one
    fields: [excludable_servers.reason]
  }

  join: user_agent_registry {
    view_label: " User Events Telemetry (Messaging)"
    relationship: many_to_one
    sql_on: ${user_events_telemetry.context_user_agent} = ${user_agent_registry.context_useragent} ;;
    fields: [user_agent_registry.browser_version_major, user_agent_registry.bot, user_agent_registry.browser, user_agent_registry.browser_version, user_agent_registry.browser_w_version_major, user_agent_registry.browser_w_version, user_agent_registry.os_w_version, user_agent_registry.os_w_version_major]
  }

  join: subscriptions {
    view_label: "Stripe"
    relationship: one_to_one
    sql_on: ${subscriptions.cws_installation} = ${server_fact.installation_id} ;;
    fields: []
  }

  join: customers {
    view_label: "Stripe"
    relationship: one_to_one
    sql_on: ${subscriptions.customer} = ${customers.id} ;;
    fields: []
  }

  join: portal_customers {
    from: customers
    relationship: many_to_one
    sql_on: ${portal_customers.cws_customer} = ${user_events_telemetry.context_traits_portal_customer_id} ;;
    fields: []
  }

  join: portal_subscriptions {
    from: subscriptions
    relationship: one_to_many
    sql_on: ${portal_customers.id} = ${portal_subscriptions.customer} ;;
    fields: []
  }

  join: license_server_fact {
    relationship: many_to_one
    sql_on: --CASE WHEN ${user_events_telemetry._dbt_source_relation2} IN ('"ANALYTICS".EVENTS.CLOUD_PORTAL_PAGEVIEW_EVENTS', '"ANALYTICS".EVENTS.PORTAL_EVENTS') THEN ${user_events_telemetry.context_traits_portal_customer_id} = ${license_server_fact.customer_id}
          --ELSE
          ${user_events_telemetry.user_id} = ${license_server_fact.server_id}
          --END
          and ${user_events_telemetry.event_date} between ${license_server_fact.start_date} AND ${license_server_fact.license_retired_date} ;;
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
    sql_on: ${user_events_telemetry.event_date}::date <= ${dates.date_date}::date AND ${user_events_telemetry.event_date}::date >= ${dates.date_date}::date - INTERVAL '30 DAYS' AND ${dates.date_date} <= CURRENT_DATE ;;
    relationship: many_to_many
    view_label: "Monthly Active Dates"
    type: inner
  }
}
