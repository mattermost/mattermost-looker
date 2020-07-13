# This is the view file for the analytics.qa.events_mobile_telemetry table.
view: events_mobile_telemetry {
  sql_table_name: qa.events_mobile_telemetry ;;
  view_label: "Events Mobile Telemetry"

  # FILTERS

  # DIMENSIONS
  dimension: _dbt_source_relation {
    description: ""
    type: string
    sql: ${TABLE}._dbt_source_relation ;;
    hidden: no
  }

  dimension: context_network_carrier {
    description: ""
    type: string
    sql: ${TABLE}.context_network_carrier ;;
    hidden: no
  }

  dimension: context_device_id {
    description: ""
    type: string
    sql: ${TABLE}.context_device_id ;;
    hidden: no
  }

  dimension: context_traits_device_dimensions_height {
    description: ""
    type: number
    sql: ${TABLE}.context_traits_device_dimensions_height ;;
    hidden: no
  }

  dimension: context_screen_height {
    description: ""
    type: number
    sql: ${TABLE}.context_screen_height ;;
    hidden: no
  }

  dimension: context_locale {
    description: ""
    type: string
    sql: ${TABLE}.context_locale ;;
    hidden: no
  }

  dimension: context_traits_device_dimensions_width {
    description: ""
    type: number
    sql: ${TABLE}.context_traits_device_dimensions_width ;;
    hidden: no
  }

  dimension: type {
    description: ""
    type: string
    sql: ${TABLE}.type ;;
    hidden: no
  }

  dimension: user_id {
    description: ""
    type: string
    sql: ${TABLE}.user_id ;;
    hidden: no
  }

  dimension: context_device_type {
    description: ""
    type: string
    sql: ${TABLE}.context_device_type ;;
    hidden: no
  }

  dimension: context_app_name {
    description: ""
    type: string
    sql: ${TABLE}.context_app_name ;;
    hidden: no
  }

  dimension: context_device_model {
    description: ""
    type: string
    sql: ${TABLE}.context_device_model ;;
    hidden: no
  }

  dimension: context_library_name {
    description: ""
    type: string
    sql: ${TABLE}.context_library_name ;;
    hidden: no
  }

  dimension: context_network_cellular {
    description: ""
    type: yesno
    sql: ${TABLE}.context_network_cellular ;;
    hidden: no
  }

  dimension: context_network_bluetooth {
    description: ""
    type: yesno
    sql: ${TABLE}.context_network_bluetooth ;;
    hidden: no
  }

  dimension: context_traits_app_version {
    description: ""
    type: string
    sql: ${TABLE}.context_traits_app_version ;;
    hidden: no
  }

  dimension: context_app_build {
    description: ""
    type: string
    sql: ${TABLE}.context_app_build ;;
    hidden: no
  }

  dimension: context_network_wifi {
    description: ""
    type: yesno
    sql: ${TABLE}.context_network_wifi ;;
    hidden: no
  }

  dimension: channel_id {
    description: ""
    type: string
    sql: ${TABLE}.channel_id ;;
    hidden: no
  }

  dimension: context_screen_width {
    description: ""
    type: number
    sql: ${TABLE}.context_screen_width ;;
    hidden: no
  }

  dimension: category {
    description: ""
    type: string
    sql: ${TABLE}.category ;;
    hidden: no
  }

  dimension: anonymous_id {
    description: ""
    type: string
    sql: ${TABLE}.anonymous_id ;;
    hidden: no
  }

  dimension: context_traits_server {
    description: ""
    type: string
    sql: ${TABLE}.context_traits_server ;;
    hidden: no
  }

  dimension: context_app_namespace {
    description: ""
    type: string
    sql: ${TABLE}.context_app_namespace ;;
    hidden: no
  }

  dimension: context_traits_userid {
    description: ""
    type: string
    sql: ${TABLE}.context_traits_userid ;;
    hidden: no
  }

  dimension: event {
    description: ""
    type: string
    sql: ${TABLE}.event ;;
    hidden: no
  }

  dimension: id {
    description: ""
    type: string
    sql: ${TABLE}.id ;;
    hidden: no
  }

  dimension: context_traits_app_build {
    description: ""
    type: number
    sql: ${TABLE}.context_traits_app_build ;;
    hidden: no
  }

  dimension: channel {
    description: ""
    type: string
    sql: ${TABLE}.channel ;;
    hidden: no
  }

  dimension: context_traits_id {
    description: ""
    type: string
    sql: ${TABLE}.context_traits_id ;;
    hidden: no
  }

  dimension: context_os_version {
    description: ""
    type: string
    sql: ${TABLE}.context_os_version ;;
    hidden: no
  }

  dimension: context_app_version {
    description: ""
    type: string
    sql: ${TABLE}.context_app_version ;;
    hidden: no
  }

  dimension: context_traits_ip {
    description: ""
    type: string
    sql: ${TABLE}.context_traits_ip ;;
    hidden: no
  }

  dimension: event_text {
    description: ""
    type: string
    sql: ${TABLE}.event_text ;;
    hidden: no
  }

  dimension: context_library_version {
    description: ""
    type: string
    sql: ${TABLE}.context_library_version ;;
    hidden: no
  }

  dimension: context_ip {
    description: ""
    type: string
    sql: ${TABLE}.context_ip ;;
    hidden: no
  }

  dimension: context_os_name {
    description: ""
    type: string
    sql: ${TABLE}.context_os_name ;;
    hidden: no
  }

  dimension: user_actual_id {
    description: ""
    type: string
    sql: ${TABLE}.user_actual_id ;;
    hidden: no
  }

  dimension: user_actual_role {
    description: ""
    type: string
    sql: ${TABLE}.user_actual_role ;;
    hidden: no
  }

  dimension: context_screen_density {
    description: ""
    type: number
    sql: ${TABLE}.context_screen_density ;;
    hidden: no
  }

  dimension: context_timezone {
    description: ""
    type: string
    sql: ${TABLE}.context_timezone ;;
    hidden: no
  }

  dimension: context_traits_anonymousid {
    description: ""
    type: string
    sql: ${TABLE}.context_traits_anonymousid ;;
    hidden: no
  }

  dimension: context_device_manufacturer {
    description: ""
    type: string
    sql: ${TABLE}.context_device_manufacturer ;;
    hidden: no
  }

  dimension: context_traits_device_istablet {
    description: ""
    type: yesno
    sql: ${TABLE}.context_traits_device_istablet ;;
    hidden: no
  }

  dimension: context_useragent {
    description: ""
    type: string
    sql: ${TABLE}.context_useragent ;;
    hidden: no
  }

  dimension: context_device_name {
    description: ""
    type: string
    sql: ${TABLE}.context_device_name ;;
    hidden: no
  }

  dimension: context_traits_device_os {
    description: ""
    type: string
    sql: ${TABLE}.context_traits_device_os ;;
    hidden: no
  }

  dimension: from_background {
    description: ""
    type: yesno
    sql: ${TABLE}.from_background ;;
    hidden: no
  }

  dimension: properties {
    sql: OBJECT_CONSTRUCT(*) ;;
  }


  # DIMENSION GROUPS/DATES
  dimension_group: sent_at {
  description: ""
  type: time
  timeframes: [date, month, year]
    sql: ${TABLE}.sent_at ;;
    hidden: no
  }

  dimension_group: original_timestamp {
  description: ""
  type: time
  timeframes: [date, month, year]
    sql: ${TABLE}.original_timestamp ;;
    hidden: no
  }

  dimension_group: received_at {
  description: ""
  type: time
  timeframes: [date, month, year]
    sql: ${TABLE}.received_at ;;
    hidden: no
  }

  dimension_group: uuid_ts {
  description: ""
  type: time
  timeframes: [date, month, year]
    sql: ${TABLE}.uuid_ts ;;
    hidden: no
  }

  dimension_group: timestamp {
  description: ""
  type: time
  timeframes: [date, month, year]
    sql: ${TABLE}.timestamp ;;
    hidden: no
  }


  # MEASURES
  measure: count {
    description: "Count of rows/occurrences."
    type: count
  }

  measure: context_device_count {
    label: " Context_Device Count"
    description: "The distinct count of Context_Devices per grouping."
    type: count_distinct
    sql: ${context_device_id} ;;
  }

  measure: user_count {
    label: " User Count"
    description: "The distinct count of Users per grouping."
    type: count_distinct
    sql: ${user_id} ;;
  }

  measure: channel_count {
    label: " Channel Count"
    description: "The distinct count of Channels per grouping."
    type: count_distinct
    sql: ${channel_id} ;;
  }

  measure: anonymous_count {
    label: " Anonymous Count"
    description: "The distinct count of Anonymouss per grouping."
    type: count_distinct
    sql: ${anonymous_id} ;;
  }

  measure: context_traits_count {
    label: " Context_Traits Count"
    description: "The distinct count of Context_Traitss per grouping."
    type: count_distinct
    sql: ${context_traits_id} ;;
  }

  measure: user_actual_count {
    label: " User_Actual Count"
    description: "The distinct count of User_Actuals per grouping."
    type: count_distinct
    sql: ${user_actual_id} ;;
  }


}
