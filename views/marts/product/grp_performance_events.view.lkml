view: grp_performance_events {
  sql_table_name: "MART_WEB_APP".grp_performance_events ;;
  label: "[New] Performance Events"
  drill_fields: [id]


  # Primary key
  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
    hidden: yes
  }


  ###
  ### Other items used to join
  ###


  dimension: context_user_agent {
    type: string
    sql: ${TABLE}.context_user_agent ;;
    hidden: yes
    description: "User agent of the browser/app emitting the event."
  }

  ###
  ### Event details
  ###

  dimension: event {
    type: string
    sql: ${TABLE}.event ;;
    # Hidden as it's always `event`
    hidden: yes
  }

  dimension: event_text {
    type: string
    sql: ${TABLE}.event_text ;;
    # Hidden as it's always `event`
    hidden: yes
  }


  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
    description: "The event's category (if any)"
    group_label: "Event Details"
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
    description: "The event's type"
    group_label: "Event Details"
  }

  dimension_group: timestamp {
    type: time
    timeframes: [time, hour_of_day, hour6, date, week, month, year, day_of_week, week_of_year, day_of_year, day_of_week_index, month_name, day_of_month]
    sql: ${TABLE}.timestamp ;;
    label: "Logging"
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}.user_id ;;
    label: "Server Id"
    description: "The ID of the server where the event was triggered."
    group_label: "Event Details"
  }

  dimension: user_actual_id {
    type: string
    sql: ${TABLE}.user_actual_id ;;
    label: "User Id"
    description: "The User Id associated with the user that performed the event."
    group_label: "Event Details"
  }


  dimension: user_actual_role {
    type: string
    sql: ${TABLE}.user_actual_role ;;
    label: " User Actual Role"
    description: "The Actual Role of the user performing the event."
    group_label: "Event Details"
  }


  # Event Context

  dimension: context_app_name {
    type: string
    sql: ${TABLE}.context_app_name ;;
    label: "Application Name"
    description: "The Name of the application the event was triggered from."
    group_label: "Application Info"
  }

  dimension: context_app_namespace {
    type: string
    sql: ${TABLE}.context_app_namespace ;;
    label: "Application Namespace"
    description: "The Namespace of the application the event was triggered from."
    group_label: "Application Info"
  }

  dimension: context_app_version {
    type: string
    sql: ${TABLE}.context_app_version ;;
    label: "Application Version"
    description: "The version of the application the event was triggered from."
    group_label: "Application Info"
  }

  dimension: context_app_build {
    type: string
    sql: ${TABLE}.context_app_build ;;
    label: "Application Build"
    description: "The build of the application the event was triggered from."
    group_label: "Application Info"

  }

  dimension: context_library_name {
    type: string
    sql: ${TABLE}.context_library_name ;;
    label: "Library Name"
    description: "SDK used for emitting the event."
    group_label: "Metadata"
  }

  dimension: context_library_version {
    type: string
    sql: ${TABLE}.context_library_version ;;
    label: "Library version"
    description: "SDK version used for emitting the event."
    group_label: "Metadata"
  }


  dimension: context_ip {
    type: string
    sql: ${TABLE}.context_ip ;;
    label: "IP"
    description: "IP address"
    group_label: "Client Info"
  }

  dimension: context_locale {
    type: string
    sql: ${TABLE}.context_locale ;;
    label: "Locale"
    description: "Client's Locale"
    group_label: "Client Info"
  }


  dimension: context_screen_density {
    type: number
    sql: ${TABLE}.context_screen_density ;;
    label: "Screen Density"
    description: "Density of the device’s screen."
    group_label: "Client Info"
  }


  # Properties

  dimension: channel {
    type: string
    sql: ${TABLE}.channel ;;
    label: "Channel"
    description: "The Channel where the user triggered the event."
    group_label: "Event Properties"
  }

  dimension: count {
    type: number
    sql: ${TABLE}.count ;;
    group_label: "Event Properties"
  }

  dimension: duration {
    type: number
    sql: ${TABLE}.duration ;;
    label: "Duration"
    description: "The Duration of the time taken for the performance event to load in milliseconds."
    group_label: "Event Properties"
  }

  dimension: total_duration {
    type: number
    sql: ${TABLE}.total_duration;;
    group_label: "Event Properties"
  }

  dimension: total_size {
    type: number
    sql: ${TABLE}.total_size ;;
    group_label: "Event Properties"
  }


  dimension: fresh {
    type: yesno
    sql: ${TABLE}.fresh
    label: "Fresh"
    description: "Whether or not a performance represents the first time something happened. Available for channel_switch and team_switch events."
    group_label: "Event Properties"
  }

  dimension: is_first_preload {
    type: yesno
    sql: ${TABLE}.is_first_preload ;;
    group_label: "Event Properties"
  }

  dimension: longest_api_resource {
    type: string
    sql: ${TABLE}.longest_api_resource ;;
    group_label: "Event Properties"
  }

  dimension: longest_api_resource_duration {
    type: number
    sql: ${TABLE}.longest_api_resource_duration ;;
    label: "Longest API resource duration"
    description: "Duration of the api in milliseconds(ms) which took longest to download during an event."
    group_label: "Event Properties"
  }

  dimension: max_api_resource_size {
    type: number
    sql: ${TABLE}.max_api_resource_size ;;
    label: "Max API Resource Size"
    description: "Highest size of the api resource in bytes (encoded body size) requested during an event."
    group_label: "Event Properties"
  }

  dimension: num_high {
    type: number
    sql: ${TABLE}.num_high ;;
    group_label: "Event Properties"
  }

  dimension: num_low {
    type: number
    sql: ${TABLE}.num_low ;;
    group_label: "Event Properties"
  }

  dimension: num_medium {
    type: number
    sql: ${TABLE}.num_medium ;;
    group_label: "Event Properties"
  }

  dimension: num_of_request {
    type: number
    sql: ${TABLE}.num_of_request ;;
    label: "Number of API requests"
    description: "The number of api requests made by the client for an event."
    group_label: "Event Properties"
  }

  dimension: num_total {
    type: number
    sql: ${TABLE}.num_total ;;
    group_label: "Event Properties"
  }

  dimension: request_count {
    type: number
    sql: ${TABLE}.request_count ;;
    group_label: "Event Properties"
  }

  dimension: first {
    type: string
    sql: ${TABLE}.first ;;
    group_label: "Event Properties"
  }

  dimension: first_effectiveness {
    type: number
    sql: ${TABLE}.first_effectiveness ;;
    group_label: "Event Properties"
  }

  dimension: first_recomputations {
    type: number
    sql: ${TABLE}.first_recomputations ;;
    group_label: "Event Properties"
  }

  dimension: second {
    type: string
    sql: ${TABLE}.second ;;
    group_label: "Event Properties"
  }

  dimension: second_effectiveness {
    type: number
    sql: ${TABLE}.second_effectiveness ;;
    group_label: "Event Properties"
  }

  dimension: second_recomputations {
    type: number
    sql: ${TABLE}.second_recomputations ;;
    group_label: "Event Properties"
  }

  dimension: third {
    type: string
    sql: ${TABLE}.third ;;
    group_label: "Event Properties"
  }

  dimension: third_effectiveness {
    type: number
    sql: ${TABLE}.third_effectiveness ;;
    group_label: "Event Properties"
  }

  dimension: third_recomputations {
    type: number
    sql: ${TABLE}.third_recomputations ;;
    group_label: "Event Properties"
  }


  ###
  ### Metrics
  ###


  measure: event_count {
    type: count_distinct
    sql: ${id} ;;
    label: "Event Count"
    description: "The distinct count of event Id's within the grouping."
    group_label: "Event Details"
  }

  measure: user_actual_id_count {
    type: count_distinct
    sql: ${user_actual_id} ;;
    label: "User Count"
    description: "The distinct count of User Id's within the grouping."
    group_label: "Event Details"
  }

  measure: user_id_count {
    type: count_distinct
    sql: ${user_id} ;;
    label: " Instance Count"
    description: "The distinct count of Server Id's within the grouping."
    group_label: "Event Details"
  }

  # Common percentile measures


  measure: duration_min {
    group_label: "Duration Measures"
    label: "Duration (Min)"
    description: "The minimum Duration across all instances within the grouping."
    type: min
    sql: ${duration} ;;
    value_format_name: decimal_2
  }

  measure: duration_max {
    group_label: "Duration Measures"
    label: "Duration (Max)"
    description: "The minimum Duration across all instances within the grouping."
    type: max
    sql: ${duration} ;;
    value_format_name: decimal_2
  }

  measure: duration_avg {
    group_label: "Duration Measures"
    label: "Duration (Avg)"
    description: "The average Duration across all instances within the grouping."
    type: average
    sql: ${duration} ;;
    value_format_name: decimal_2
  }

  measure: duration_median {
    group_label: "Duration Measures"
    label: "Duration (Med)"
    description: "The median Duration across all instances within the grouping."
    type: median
    sql: ${duration} ;;
    value_format_name: decimal_1
  }

  measure: duration_p5 {
    group_label: "Duration Measures"
    label: "Duration (p5)"
    description: "The 5th percentile Duration across all instances within the grouping."
    type: percentile
    percentile: 5
    sql: ${duration} ;;
    value_format_name: decimal_2
  }

  measure: duration_p25 {
    group_label: "Duration Measures"
    label: "Duration (p25)"
    description: "The 25th percentile Duration across all instances within the grouping."
    type: percentile
    percentile: 25
    sql: ${duration} ;;
    value_format_name: decimal_2
  }

  measure: duration_p75 {
    group_label: "Duration Measures"
    label: "Duration (p75)"
    description: "The 75th percentile Duration across all instances within the grouping."
    type: percentile
    percentile: 75
    sql: ${duration} ;;
    value_format_name: decimal_2
  }

  measure: duration_p95 {
    group_label: "Duration Measures"
    label: "Duration (p95)"
    description: "The 95th percentile Duration across all instances within the grouping."
    type: percentile
    percentile: 95
    sql: ${duration} ;;
    value_format_name: decimal_2
  }

  measure: duration_p99 {
    group_label: "Duration Measures"
    label: "Duration (p99)"
    description: "The 95th percentile Duration across all instances within the grouping."
    type: percentile
    percentile: 95
    sql: ${duration} ;;
    value_format_name: decimal_2
  }

}
