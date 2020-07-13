# This is the view file for the analytics.qa.events_web_desktop_telemetry table.
view: events_web_desktop_telemetry {
  sql_table_name: qa.events_web_desktop_telemetry ;;
  view_label: "Events Web Desktop Telemetry"

  # FILTERS

  # DIMENSIONS
  dimension: _dbt_source_relation {
    description: ""
    type: string
    sql: ${TABLE}._dbt_source_relation ;;
    hidden: no
  }

  dimension: category {
    description: ""
    type: string
    sql: ${TABLE}.category ;;
    hidden: no
  }

  dimension: user_actual_id {
    description: ""
    type: string
    sql: ${TABLE}.user_actual_id ;;
    hidden: no
  }

  dimension: context_page_referrer {
    description: ""
    type: string
    sql: ${TABLE}.context_page_referrer ;;
    hidden: no
  }

  dimension: context_ip {
    description: ""
    type: string
    sql: ${TABLE}.context_ip ;;
    hidden: no
  }

  dimension: event {
    description: ""
    type: string
    sql: ${TABLE}.event ;;
    hidden: no
  }

  dimension: context_library_name {
    description: ""
    type: string
    sql: ${TABLE}.context_library_name ;;
    hidden: no
  }

  dimension: id {
    description: ""
    type: string
    sql: ${TABLE}.id ;;
    hidden: no
  }

  dimension: context_page_path {
    description: ""
    type: string
    sql: ${TABLE}.context_page_path ;;
    hidden: no
  }

  dimension: team_id {
    description: ""
    type: string
    sql: ${TABLE}.team_id ;;
    hidden: no
  }

  dimension: context_app_version {
    description: ""
    type: string
    sql: ${TABLE}.context_app_version ;;
    hidden: no
  }

  dimension: context_app_name {
    description: ""
    type: string
    sql: ${TABLE}.context_app_name ;;
    hidden: no
  }

  dimension: context_page_url {
    description: ""
    type: string
    sql: ${TABLE}.context_page_url ;;
    hidden: no
  }

  dimension: user_id {
    description: ""
    type: string
    sql: ${TABLE}.user_id ;;
    hidden: no
  }

  dimension: context_page_search {
    description: ""
    type: string
    sql: ${TABLE}.context_page_search ;;
    hidden: no
  }

  dimension: event_text {
    description: ""
    type: string
    sql: ${TABLE}.event_text ;;
    hidden: no
  }

  dimension: channel_id {
    description: ""
    type: string
    sql: ${TABLE}.channel_id ;;
    hidden: no
  }

  dimension: type {
    description: ""
    type: string
    sql: ${TABLE}.type ;;
    hidden: no
  }

  dimension: user_actual_role {
    description: ""
    type: string
    sql: ${TABLE}.user_actual_role ;;
    hidden: no
  }

  dimension: context_os_version {
    description: ""
    type: string
    sql: ${TABLE}.context_os_version ;;
    hidden: no
  }

  dimension: context_page_title {
    description: ""
    type: string
    sql: ${TABLE}.context_page_title ;;
    hidden: no
  }

  dimension: context_app_build {
    description: ""
    type: string
    sql: ${TABLE}.context_app_build ;;
    hidden: no
  }

  dimension: context_screen_density {
    description: ""
    type: number
    sql: ${TABLE}.context_screen_density ;;
    hidden: no
  }

  dimension: group_constrained {
    description: ""
    type: yesno
    sql: ${TABLE}.group_constrained ;;
    hidden: no
  }

  dimension: context_os_name {
    description: ""
    type: string
    sql: ${TABLE}.context_os_name ;;
    hidden: no
  }

  dimension: anonymous_id {
    description: ""
    type: string
    sql: ${TABLE}.anonymous_id ;;
    hidden: no
  }

  dimension: context_app_namespace {
    description: ""
    type: string
    sql: ${TABLE}.context_app_namespace ;;
    hidden: no
  }

  dimension: duration {
    description: ""
    type: number
    sql: ${TABLE}.duration ;;
    hidden: no
  }

  dimension: context_locale {
    description: ""
    type: string
    sql: ${TABLE}.context_locale ;;
    hidden: no
  }

  dimension: context_useragent {
    description: ""
    type: string
    sql: ${TABLE}.context_useragent ;;
    hidden: no
  }

  dimension: context_library_version {
    description: ""
    type: string
    sql: ${TABLE}.context_library_version ;;
    hidden: no
  }

  dimension: channel {
    description: ""
    type: string
    sql: ${TABLE}.channel ;;
    hidden: no
  }

  dimension: post_id {
    description: ""
    type: string
    sql: ${TABLE}.post_id ;;
    hidden: no
  }

  dimension: root_id {
    description: ""
    type: string
    sql: ${TABLE}.root_id ;;
    hidden: no
  }

  dimension: userid {
    description: ""
    type: string
    sql: ${TABLE}.userid ;;
    hidden: no
  }

  dimension: field {
    description: ""
    type: string
    sql: ${TABLE}.field ;;
    hidden: no
  }

  dimension: scheme_id {
    description: ""
    type: string
    sql: ${TABLE}.scheme_id ;;
    hidden: no
  }

  dimension: channelsids_0 {
    description: ""
    type: string
    sql: ${TABLE}.channelsids_0 ;;
    hidden: no
  }

  dimension: sort {
    description: ""
    type: string
    sql: ${TABLE}.sort ;;
    hidden: no
  }

  dimension: count {
    description: ""
    type: number
    sql: ${TABLE}.count ;;
    hidden: no
  }

  dimension: include_deleted {
    description: ""
    type: yesno
    sql: ${TABLE}.include_deleted ;;
    hidden: no
  }

  dimension: value {
    description: ""
    type: string
    sql: ${TABLE}.value ;;
    hidden: no
  }

  dimension: channel_ids_0 {
    description: ""
    type: string
    sql: ${TABLE}.channel_ids_0 ;;
    hidden: no
  }

  dimension: plugin_id {
    description: ""
    type: string
    sql: ${TABLE}.plugin_id ;;
    hidden: no
  }

  dimension: version {
    description: ""
    type: string
    sql: ${TABLE}.version ;;
    hidden: no
  }

  dimension: installed_version {
    description: ""
    type: string
    sql: ${TABLE}.installed_version ;;
    hidden: no
  }


  # DIMENSION GROUPS/DATES
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

  dimension_group: original_timestamp {
  description: ""
  type: time
  timeframes: [date, month, year]
    sql: ${TABLE}.original_timestamp ;;
    hidden: no
  }

  dimension_group: timestamp {
  description: ""
  type: time
  timeframes: [date, month, year]
    sql: ${TABLE}.timestamp ;;
    hidden: no
  }

  dimension_group: sent_at {
  description: ""
  type: time
  timeframes: [date, month, year]
    sql: ${TABLE}.sent_at ;;
    hidden: no
  }


  # MEASURES
  measure: count_sum {
    label: "Count"
    description: "Count of rows/occurrences."
    type: count
  }

  measure: user_actual_count {
    label: " User_Actual Count"
    description: "The distinct count of User_Actuals per grouping."
    type: count_distinct
    sql: ${user_actual_id} ;;
  }

  measure: team_count {
    label: " Team Count"
    description: "The distinct count of Teams per grouping."
    type: count_distinct
    sql: ${team_id} ;;
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

  measure: post_count {
    label: " Post Count"
    description: "The distinct count of Posts per grouping."
    type: count_distinct
    sql: ${post_id} ;;
  }

  measure: root_count {
    label: " Root Count"
    description: "The distinct count of Roots per grouping."
    type: count_distinct
    sql: ${root_id} ;;
  }

  measure: scheme_count {
    label: " Scheme Count"
    description: "The distinct count of Schemes per grouping."
    type: count_distinct
    sql: ${scheme_id} ;;
  }

  measure: channels_0_count {
    label: " Channels_0 Count"
    description: "The distinct count of Channelss_0 per grouping."
    type: count_distinct
    sql: ${channel_ids_0} ;;
  }

  measure: plugin_count {
    label: " Plugin Count"
    description: "The distinct count of Plugins per grouping."
    type: count_distinct
    sql: ${plugin_id} ;;
  }


}
