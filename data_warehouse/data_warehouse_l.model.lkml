connection: "snowflake_l"
fiscal_month_offset: -11


#
# Persistence
#

datagroup: mm_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

datagroup: mm_salesforce_data_group {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "5 minutes"
}

persist_with: mm_default_datagroup


#
# Access grants
#

access_grant: debugging_fields {
  user_attribute: field_visibility
  allowed_values: [ "all", "developer", "admin" ]
}

access_grant: sales_mgmt_data_access {
  user_attribute: data_permissions
  allowed_values: ["'mlt,finance,finance_only,sales_mgmt,all'", "'mlt,finance,sales_mgmt,all'", "'sales_mgmt'"]
}

access_grant: admin_access {
  user_attribute: data_permissions
  allowed_values: ["'mlt,finance,finance_only,sales_mgmt,all'"]
}

#
# Formats
#

# BP: Define your own global named value formats to make changing defaults easy
named_value_format: mm_usd_short {
  value_format: "$###,##0"
}

named_value_format: mm_integer_percent {
  value_format: "0\%"
}


week_start_day: sunday

#
# Views
#

include: "/data_warehouse/data_warehouse_views/blp/*.view.lkml"
include: "/data_warehouse/data_warehouse_views/cs/*.view.lkml"
include: "/data_warehouse/data_warehouse_views/employee/*.view.lkml"
include: "/data_warehouse/data_warehouse_views/events/*.view.lkml"
include: "/data_warehouse/data_warehouse_views/finance/*.view.lkml"
include: "/data_warehouse/data_warehouse_views/ga/*.view.lkml"
include: "/data_warehouse/data_warehouse_views/mattermost/*.view.lkml"
include: "/data_warehouse/data_warehouse_views/orgm/*.view.lkml"
include: "/data_warehouse/data_warehouse_views/sales/*.view.lkml"
include: "/data_warehouse/data_warehouse_views/tva/*.view.lkml"
include: "/data_warehouse/data_warehouse_views/util/*.view.lkml"
include: "/data_warehouse/data_warehouse_views/bizops/*.view.lkml"
include: "/data_warehouse/data_warehouse_views/blapi/*.view.lkml"
include: "/data_warehouse/data_warehouse_views/web/*.view.lkml"
include: "/data_warehouse/data_warehouse_views/mattermost_jira/*.view.lkml"
include: "/data_warehouse/data_warehouse_views/qa/*.view.lkml"
include: "/data_warehouse/data_warehouse_views/social_mentions/*.view.lkml"
include: "/data_warehouse/data_warehouse_views/stripe/*.view.lkml"

explore: user_events_telemetry {
  label: "User Events Telemetry"
  sql_always_where: ${user_events_telemetry.type} NOT IN ('api_profiles_get_by_ids', 'api_profiles_get_by_usernames');;
  group_label: "Product"
  description: "Contains all user-level usage events telemetry on the Mattermost platform across all clients and all customer data routing and processing platforms (segment & rudderstack) since 02/01/2019."

  join: server_daily_details {
    view_label: "User Events Telemetry"
    sql_on: ${user_events_telemetry.user_id} = ${server_daily_details.server_id} AND ${user_events_telemetry.event_date} = ${server_daily_details.logging_date} ;;
    relationship: many_to_one
    type: left_outer
    fields: [server_daily_details.database_version, server_daily_details.database_version_major, server_daily_details.database_version_major_release, server_daily_details.server_version_major, server_daily_details.version, server_daily_details.edition]
  }

  join: server_fact {
    view_label: "User Events Telemetry"
    sql_on: ${user_events_telemetry.user_id} = ${server_fact.server_id} ;;
    relationship: many_to_one
    fields: [server_fact.installation_id, server_fact.first_server_version, server_fact.first_server_version_major, server_fact.first_server_edition]
  }

  join: excludable_servers {
    view_label: "User Events Telemetry"
    sql_on: ${user_events_telemetry.user_id} = ${excludable_servers.server_id} ;;
    relationship: many_to_one
    fields: [excludable_servers.reason]
  }

  join: user_agent_registry {
    view_label: "User Agent Details"
    relationship: many_to_one
    sql_on: ${user_events_telemetry.context_user_agent} = ${user_agent_registry.context_useragent} ;;
    fields: [user_agent_registry.browser_version_major, user_agent_registry.bot, user_agent_registry.browser, user_agent_registry.browser_version, user_agent_registry.browser_w_version, user_agent_registry.operating_system, user_agent_registry.os_version, user_agent_registry.os_w_version, user_agent_registry.device_brand, user_agent_registry.device_type, user_agent_registry.device_model]
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
    sql_on: (${user_events_telemetry.user_id} = ${license_server_fact.server_id} OR ${user_events_telemetry.context_traits_portal_customer_id} = ${license_server_fact.customer_id})
    and ${user_events_telemetry.event_date} between ${license_server_fact.start_date} AND ${license_server_fact.license_retired_date} ;;
  }

  join: cloud_onboarding_flows {
    relationship: many_to_one
    sql_on: ${user_events_telemetry.type} = ${cloud_onboarding_flows.type} AND ${user_events_telemetry.category} = ${cloud_onboarding_flows.category} ;;
  }
}
