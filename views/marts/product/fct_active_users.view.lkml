view: fct_active_users {

  sql_table_name: "MART_PRODUCT"."FCT_ACTIVE_USERS" ;;
  label: "   * Users: Telemetry Active Users"


  ###
  ### IDs and dates
  ###

  dimension: daily_server_id {
    type: string
    sql: ${TABLE}.daily_server_id ;;
    primary_key: yes
    hidden: yes
  }

  dimension: server_id {
    type: string
    sql: ${TABLE}.server_id ;;
    label: "Server ID"
    description: "The server's ID"
  }

  dimension_group: activity {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.activity_date ;;
    label: "Server Telemetry Activity" # Remember that `Date` is automatically appended by looker
    description: "The date current data were captured at"
  }


  dimension: version_id {
    type: string
    sql: ${TABLE}.version_id ;;
    label: "Version ID"
    description: "The server's version for the specific date"
    hidden: yes
  }

  ###
  ### DAU
  ###

  dimension: daily_active_users {
    type: number
    sql: ${TABLE}.daily_active_users ;;
    label: "DAU (Client & Legacy)"
    description: "Number of unique users for current date, reported by client telemetry. Equals to the number of unique users that performed an action in the given calendar date."
  }

  measure: total_daily_active_users {
    type: sum
    sql: ${daily_active_users} ;;
    label: "Total DAU (Client & Legacy)"
    view_label: "  * Metrics. DAU"
  }

  dimension: server_daily_active_users {
    type: number
    sql: ${TABLE}.server_daily_active_users ;;
    label: "DAU (Server)"
    description: "DAU reported by MM server activity. Defined as the number of unique users that performed an action in the 24 hours previous to sending the telemetry data."
  }

  measure: total_server_daily_active_users {
    type: sum
    sql: ${server_daily_active_users} ;;
    label: "Total DAU (Server)"
    view_label: "  * Metrics. DAU"
  }

  dimension: daily_desktop_active_users {
    type: number
    sql: ${TABLE}.daily_desktop_active_users ;;
    label: "Desktop DAU (Client & Legacy)"
    description: "Desktop DAU reported by Rudderstack & Segment telemetry."
  }

  measure: total_daily_desktop_active_users {
    type: sum
    sql: ${daily_desktop_active_users} ;;
    label: "Total Desktop DAU (Client & Legacy)"
    view_label: "  * Metrics. DAU"
  }

  dimension: daily_webapp_active_users {
    type: number
    sql: ${TABLE}.daily_webapp_active_users ;;
    label: "Webapp DAU (Client & Legacy)"
    description: "Webapp DAU reported by Rudderstack & Segment telemetry."
  }

  measure: total_daily_webapp_active_users {
    type: sum
    sql: ${daily_webapp_active_users} ;;
    label: "Total Webapp DAU (Client & Legacy)"
    view_label: "  * Metrics. DAU"
  }

  dimension: daily_client_desktop_active_users {
    type: number
    sql: ${TABLE}.daily_client_desktop_active_users ;;
    label: "Client Desktop DAU"
    description: "Client Desktop DAU reported by Rudderstack telemetry."
  }

  measure: total_daily_client_desktop_active_users {
    type: sum
    sql: ${daily_client_desktop_active_users} ;;
    label: "Total Client Desktop DAU"
    view_label: "  * Metrics. DAU"
  }

  dimension: daily_legacy_desktop_active_users {
    type: number
    sql: ${TABLE}.daily_legacy_desktop_active_users ;;
    label: "Legacy Desktop DAU"
    description: "Legacy Desktop DAU reported by Segment telemetry."
  }

  measure: total_daily_legacy_desktop_active_users {
    type: sum
    sql: ${daily_legacy_desktop_active_users} ;;
    label: "Total Legacy Desktop DAU"
    view_label: "  * Metrics. DAU"
  }

  dimension: daily_client_webapp_active_users {
    type: number
    sql: ${TABLE}.daily_client_webapp_active_users ;;
    label: "Client Webapp DAU"
    description: "Client Webapp DAU reported by Rudderstack telemetry."
  }

  measure: total_daily_client_webapp_active_users {
    type: sum
    sql: ${daily_client_webapp_active_users} ;;
    label: "Total Client Webapp DAU"
    view_label: "  * Metrics. DAU"
  }

  dimension: daily_legacy_webapp_active_users {
    type: number
    sql: ${TABLE}.daily_legacy_webapp_active_users ;;
    label: "Legacy Webapp DAU"
    description: "DAU reported by Segment telemetry."
  }

  measure: total_daily_legacy_webapp_active_users {
    type: sum
    sql: ${daily_legacy_webapp_active_users} ;;
    label: "Total Legacy Webapp DAU"
    view_label: "  * Metrics. DAU"
  }

  ###
  ### WAU
  ###

  dimension: weekly_active_users {
    type: number
    sql: ${TABLE}.weekly_active_users ;;
    label: "WAU (Client & Legacy)"
    description: "Number of unique user ids reported for the past 7 days"
  }

  measure: total_weekly_active_users {
    type: sum
    sql: ${weekly_active_users} ;;
    label: "Total WAU (Client & Legacy)"
    view_label: "  * Metrics. WAU"
  }

  dimension: weekly_desktop_active_users {
    type: number
    sql: ${TABLE}.weekly_desktop_active_users ;;
    label: "Desktop WAU (Client & Legacy)"
    description: "Desktop WAU reported by Rudderstack & Segment telemetry."
  }

  measure: total_weekly_desktop_active_users {
    type: sum
    sql: ${weekly_desktop_active_users} ;;
    label: "Total Desktop WAU (Client & Legacy)"
    view_label: "  * Metrics. WAU"
  }

  dimension: weekly_webapp_active_users {
    type: number
    sql: ${TABLE}.weekly_webapp_active_users ;;
    label: "Webapp WAU (Client & Legacy)"
    description: "Webapp WAU reported by Rudderstack & Segment telemetry."
  }

  measure: total_weekly_webapp_active_users {
    type: sum
    sql: ${weekly_webapp_active_users} ;;
    label: "Total Webapp WAU (Client & Legacy)"
    view_label: "  * Metrics. WAU"
  }

  dimension: weekly_client_desktop_active_users {
    type: number
    sql: ${TABLE}.weekly_client_desktop_active_users ;;
    label: "Client Desktop WAU"
    description: "Client Desktop WAU reported by Rudderstack telemetry."
  }

  measure: total_weekly_client_desktop_active_users {
    type: sum
    sql: ${weekly_client_desktop_active_users} ;;
    label: "Total Client Desktop WAU"
    view_label: "  * Metrics. WAU"
  }

  dimension: weekly_legacy_desktop_active_users {
    type: number
    sql: ${TABLE}.weekly_legacy_desktop_active_users ;;
    label: "Legacy Desktop WAU"
    description: "Legacy Desktop WAU reported by Segment telemetry."
  }

  measure: total_weekly_legacy_desktop_active_users {
    type: sum
    sql: ${weekly_legacy_desktop_active_users} ;;
    label: "Total Legacy Desktop WAU"
    view_label: "  * Metrics. WAU"
  }

  dimension: weekly_client_webapp_active_users {
    type: number
    sql: ${TABLE}.weekly_client_webapp_active_users ;;
    label: "Client Webapp WAU"
    description: "Client Webapp WAU reported by Rudderstack telemetry."
  }

  measure: total_weekly_client_webapp_active_users {
    type: sum
    sql: ${weekly_client_webapp_active_users} ;;
    label: "Total Client Webapp WAU"
    view_label: "  * Metrics. WAU"
  }

  dimension: weekly_legacy_webapp_active_users {
    type: number
    sql: ${TABLE}.weekly_legacy_webapp_active_users ;;
    label: "Legacy Webapp WAU"
    description: "Legacy WAU reported by Segment telemetry."
  }

  measure: total_weekly_legacy_webapp_active_users {
    type: sum
    sql: ${weekly_legacy_webapp_active_users} ;;
    label: "Total Legacy Webapp WAU"
    view_label: "  * Metrics. WAU"
  }

  ###
  ### MAU
  ###

  dimension: monthly_active_users {
    type: number
    sql: ${TABLE}.monthly_active_users ;;
    label: "MAU (Client & Legacy)"
    description: "Number of unique users for the past 30 days, reported by client telemetry. Equals to the number of unique users that performed an action in the given date and previous 29 days."
  }

  measure: total_monthly_active_users {
    type: sum
    sql: ${monthly_active_users} ;;
    label: "Total MAU (Client & Legacy)"
    view_label: "  * Metrics. MAU"
  }

  dimension: server_monthly_active_users {
    type: number
    sql: ${TABLE}.server_monthly_active_users ;;
    label: "MAU (Server)"
    description: "MAU reported by MM server activity. Defined as the number of unique users that performed an action in the 31 days previous to sending the telemetry data."
  }

  measure: total_server_monthly_active_users {
    type: sum
    sql: ${server_monthly_active_users} ;;
    label: "Total MAU (Server)"
    view_label: "  * Metrics. MAU"
  }

  dimension: monthly_desktop_active_users {
    type: number
    sql: ${TABLE}.monthly_desktop_active_users ;;
    label: "Desktop MAU (Client & Legacy)"
    description: "Desktop MAU reported by Rudderstack & Segment telemetry."
  }

  measure: total_monthly_desktop_active_users {
    type: sum
    sql: ${monthly_desktop_active_users} ;;
    label: "Total Desktop MAU (Client & Legacy)"
    view_label: "  * Metrics. MAU"
  }

  dimension: monthly_webapp_active_users {
    type: number
    sql: ${TABLE}.monthly_webapp_active_users ;;
    label: "Webapp MAU (Client & Legacy)"
    description: "Webapp MAU reported by Rudderstack & Segment telemetry."
  }

  measure: total_monthly_webapp_active_users {
    type: sum
    sql: ${monthly_webapp_active_users} ;;
    label: "Total Webapp MAU"
    view_label: "  * Metrics. MAU"
  }

  dimension: monthly_client_desktop_active_users {
      type: number
      sql: ${TABLE}.monthly_client_desktop_active_users ;;
      label: "Client Desktop MAU"
      description: "Client Desktop MAU reported by Rudderstack telemetry."
    }

  measure: total_monthly_client_desktop_active_users {
      type: sum
      sql: ${monthly_client_desktop_active_users} ;;
      label: "Total Client Desktop MAU"
      view_label: "  * Metrics. MAU"
    }

  dimension: monthly_legacy_desktop_active_users {
    type: number
    sql: ${TABLE}.monthly_legacy_desktop_active_users ;;
    label: "Legacy Desktop MAU"
    description: "Legacy Desktop MAU reported by Segment telemetry."
    }

  measure: total_monthly_legacy_desktop_active_users {
    type: sum
    sql: ${monthly_legacy_desktop_active_users} ;;
    label: "Total Legacy Desktop MAU"
    view_label: "  * Metrics. MAU"
    }

  dimension: monthly_client_webapp_active_users {
    type: number
    sql: ${TABLE}.monthly_client_webapp_active_users ;;
    label: "Client Webapp MAU"
    description: "Client Webapp MAU reported by Rudderstack telemetry."
    }

  measure: total_monthly_client_webapp_active_users {
    type: sum
    sql: ${monthly_client_webapp_active_users} ;;
    label: "Total Client Webapp MAU"
    view_label: "  * Metrics. MAU"
    }

  dimension: monthly_legacy_webapp_active_users {
    type: number
    sql: ${TABLE}.monthly_legacy_webapp_active_users ;;
    label: "Legacy Webapp MAU"
    description: "Legacy Webapp MAU reported by Segment telemetry."
    }

  measure: total_monthly_legacy_webapp_active_users {
    type: sum
    sql: ${monthly_legacy_webapp_active_users} ;;
    label: "Total Legacy Webapp MAU"
    view_label: "  * Metrics. MAU"
    }

  ###
  ### Other server metrics
  ###

  dimension: count_registered_users {
    type: number
    sql: ${TABLE}.count_registered_users ;;
    label: "Registered users"
    description: "Total number of registered users. Includes deleted users."
  }

  measure: total_count_registered_users {
    type: sum
    sql: ${count_registered_users} ;;
    label: "Total Registered Users"
    view_label: " * Metrics. Registered Users"
  }

  dimension: count_registered_deactivated_users {
    type: number
    sql: ${TABLE}.count_registered_deactivated_users ;;
    label: "Deactivated Users"
    description: "Total number of inactive (deleted) users."
  }

  measure: total_count_registered_deactivated_users {
    type: sum
    sql: ${count_registered_deactivated_users} ;;
    label: "Total Deactivated Users"
    view_label: " * Metrics. Registered Users"
  }

  dimension: count_registered_active_users {
    type: number
    sql: ${TABLE}.count_registered_users - ${TABLE}.count_registered_deactivated_users;;
    label: "Active Registered Users"
    description: "Total number of active registered users. Does not include deleted users."
  }

  measure: total_count_registered_active_users {
    type: sum
    sql: ${count_registered_active_users} ;;
    label: "Total Active Registered Users"
    view_label: " * Metrics. Registered Users"
  }
  
  dimension: count_public_channels {
    type: number
    sql: ${TABLE}.count_public_channels;;
    label: "Number of Public Channels"
    description: "Total number of Public Channels."
  }

  measure: total_count_public_channels {
    type: sum
    sql: ${count_public_channels} ;;
    label: "Total Public Channels"
    view_label: " * Metrics. Users Output"
  }
 
  dimension: count_private_channels {
    type: number
    sql: ${TABLE}.count_private_channels;;
    label: "Number of Private Channels"
    description: "Total number of Private Channels."
  }

  measure: total_count_private_channels {
    type: sum
    sql: ${count_private_channels} ;;
    label: "Total Private Channels"
    view_label: " * Metrics. Users Output"
  }

  dimension: count_teams {
    type: number
    sql: ${TABLE}.count_teams;;
    label: "Number of Teams"
    description: "Total number of Teams."
  }

  measure: total_count_teams {
    type: sum
    sql: ${count_teams} ;;
    label: "Total Teams"
    view_label: " * Metrics. Users Output"
  }  

  dimension: count_slash_commands {
    type: number
    sql: ${TABLE}.count_slash_commands;;
    label: "Number of Slash Comamnds"
    description: "Total number of Slash Comamnds."
  }

  measure: total_count_slash_commands {
    type: sum
    sql: ${count_slash_commands} ;;
    label: "Total Slash Commands"
    view_label: " * Metrics. Users Output"
  }

  dimension: count_direct_message_channels {
    type: number
    sql: ${TABLE}.count_direct_message_channels;;
    label: "Number of DMs"
    description: "Total number of DMs."
  }

  measure: total_count_direct_message_channels {
    type: sum
    sql: ${count_direct_message_channels} ;;
    label: "Total DMs"
    view_label: " * Metrics. Users Output"
  }  
  
  dimension: count_posts {
    type: number
    sql: ${TABLE}.count_posts;;
    label: "Number of posts"
    description: "Total number of posts."
  }

  measure: total_count_posts {
    type: sum
    sql: ${count_posts} ;;
    label: "Total Posts"
    view_label: " * Metrics. Users Output"
  }
  
  measure: count_distinct_servers {
    type: count_distinct
    sql: ${server_id} ;;
    label: "Total Unique Servers"
    view_label: " * Metrics: Server"
    drill_fields: [server_id]
  }
}
