# This is the view file for the analytics.events.user_events_telemetry table.
view: user_events_telemetry {
  sql_table_name: events.user_events_telemetry ;;
  view_label: "User Events Telemetry"

  # FILTERS

  # DIMENSIONS
  dimension: _dbt_source_relation2 {
    description: "" 
    type: string
    sql: ${TABLE}._dbt_source_relation2 ;;
    hidden: no
  }

  dimension: _dbt_source_relation {
    description: "" 
    type: string
    sql: ${TABLE}._dbt_source_relation ;;
    hidden: no
  }

  dimension: context_library_version {
    description: "" 
    type: string
    sql: ${TABLE}.context_library_version ;;
    hidden: no
  }

  dimension: context_device_model {
    description: "" 
    type: string
    sql: ${TABLE}.context_device_model ;;
    hidden: no
  }

  dimension: context_network_cellular {
    description: "" 
    type: yesno
    sql: ${TABLE}.context_network_cellular ;;
    hidden: no
  }

  dimension: context_traits_device_dimensions_width {
    description: "" 
    type: number
    sql: ${TABLE}.context_traits_device_dimensions_width ;;
    hidden: no
  }

  dimension: context_os_name {
    description: "" 
    type: string
    sql: ${TABLE}.context_os_name ;;
    hidden: no
  }

  dimension: context_device_type {
    description: "" 
    type: string
    sql: ${TABLE}.context_device_type ;;
    hidden: no
  }

  dimension: context_traits_anonymousid {
    description: "" 
    type: string
    sql: ${TABLE}.context_traits_anonymousid ;;
    hidden: no
  }

  dimension: category {
    description: "" 
    type: string
    sql: ${TABLE}.category ;;
    hidden: no
  }

  dimension: context_screen_density {
    description: "" 
    type: number
    sql: ${TABLE}.context_screen_density ;;
    hidden: no
  }

  dimension: context_traits_ip {
    description: "" 
    type: string
    sql: ${TABLE}.context_traits_ip ;;
    hidden: no
  }

  dimension: context_app_name {
    description: "" 
    type: string
    sql: ${TABLE}.context_app_name ;;
    hidden: no
  }

  dimension: context_useragent {
    description: "" 
    type: string
    sql: ${TABLE}.context_useragent ;;
    hidden: no
  }

  dimension: context_screen_height {
    description: "" 
    type: number
    sql: ${TABLE}.context_screen_height ;;
    hidden: no
  }

  dimension: event {
    description: "" 
    type: string
    sql: ${TABLE}.event ;;
    hidden: no
  }

  dimension: user_actual_role {
    description: "" 
    type: string
    sql: ${TABLE}.user_actual_role ;;
    hidden: no
  }

  dimension: anonymous_id {
    description: "" 
    type: string
    sql: ${TABLE}.anonymous_id ;;
    hidden: no
  }

  dimension: context_timezone {
    description: "" 
    type: string
    sql: ${TABLE}.context_timezone ;;
    hidden: no
  }

  dimension: context_device_id {
    description: "" 
    type: string
    sql: ${TABLE}.context_device_id ;;
    hidden: no
  }

  dimension: context_library_name {
    description: "" 
    type: string
    sql: ${TABLE}.context_library_name ;;
    hidden: no
  }

  dimension: context_screen_width {
    description: "" 
    type: number
    sql: ${TABLE}.context_screen_width ;;
    hidden: no
  }

  dimension: context_network_wifi {
    description: "" 
    type: yesno
    sql: ${TABLE}.context_network_wifi ;;
    hidden: no
  }

  dimension: user_actual_id {
    description: "" 
    type: string
    sql: ${TABLE}.user_actual_id ;;
    hidden: no
  }

  dimension: context_device_name {
    description: "" 
    type: string
    sql: ${TABLE}.context_device_name ;;
    hidden: no
  }

  dimension: user_id {
    description: "" 
    type: string
    sql: ${TABLE}.user_id ;;
    hidden: no
  }

  dimension: context_os_version {
    description: "" 
    type: string
    sql: ${TABLE}.context_os_version ;;
    hidden: no
  }

  dimension: context_app_build {
    description: "" 
    type: string
    sql: ${TABLE}.context_app_build ;;
    hidden: no
  }

  dimension: type {
    description: "" 
    type: string
    sql: ${TABLE}.type ;;
    hidden: no
  }

  dimension: context_traits_server {
    description: "" 
    type: string
    sql: ${TABLE}.context_traits_server ;;
    hidden: no
  }

  dimension: context_traits_device_istablet {
    description: "" 
    type: yesno
    sql: ${TABLE}.context_traits_device_istablet ;;
    hidden: no
  }

  dimension: context_traits_app_build {
    description: "" 
    type: string
    sql: ${TABLE}.context_traits_app_build ;;
    hidden: no
  }

  dimension: context_traits_device_os {
    description: "" 
    type: string
    sql: ${TABLE}.context_traits_device_os ;;
    hidden: no
  }

  dimension: context_app_namespace {
    description: "" 
    type: string
    sql: ${TABLE}.context_app_namespace ;;
    hidden: no
  }

  dimension: context_device_manufacturer {
    description: "" 
    type: string
    sql: ${TABLE}.context_device_manufacturer ;;
    hidden: no
  }

  dimension: context_network_bluetooth {
    description: "" 
    type: yesno
    sql: ${TABLE}.context_network_bluetooth ;;
    hidden: no
  }

  dimension: context_locale {
    description: "" 
    type: string
    sql: ${TABLE}.context_locale ;;
    hidden: no
  }

  dimension: context_traits_id {
    description: "" 
    type: string
    sql: ${TABLE}.context_traits_id ;;
    hidden: no
  }

  dimension: context_traits_userid {
    description: "" 
    type: string
    sql: ${TABLE}.context_traits_userid ;;
    hidden: no
  }

  dimension: context_network_carrier {
    description: "" 
    type: string
    sql: ${TABLE}.context_network_carrier ;;
    hidden: no
  }

  dimension: id {
    description: "" 
    type: string
    sql: ${TABLE}.id ;;
    hidden: no
  }

  dimension: event_text {
    description: "" 
    type: string
    sql: ${TABLE}.event_text ;;
    hidden: no
  }

  dimension: context_app_version {
    description: "" 
    type: string
    sql: ${TABLE}.context_app_version ;;
    hidden: no
  }

  dimension: context_ip {
    description: "" 
    type: string
    sql: ${TABLE}.context_ip ;;
    hidden: no
  }

  dimension: channel {
    description: "" 
    type: string
    sql: ${TABLE}.channel ;;
    hidden: no
  }

  dimension: context_traits_app_version {
    description: "" 
    type: string
    sql: ${TABLE}.context_traits_app_version ;;
    hidden: no
  }

  dimension: context_traits_device_dimensions_height {
    description: "" 
    type: number
    sql: ${TABLE}.context_traits_device_dimensions_height ;;
    hidden: no
  }

  dimension: from_background {
    description: "" 
    type: yesno
    sql: ${TABLE}.from_background ;;
    hidden: no
  }

  dimension: channel_id {
    description: "" 
    type: string
    sql: ${TABLE}.channel_id ;;
    hidden: no
  }

  dimension: context_page_url {
    description: "" 
    type: string
    sql: ${TABLE}.context_page_url ;;
    hidden: no
  }

  dimension: context_page_referrer {
    description: "" 
    type: string
    sql: ${TABLE}.context_page_referrer ;;
    hidden: no
  }

  dimension: page {
    description: "" 
    type: string
    sql: ${TABLE}.page ;;
    hidden: no
  }

  dimension: context_page_title {
    description: "" 
    type: string
    sql: ${TABLE}.context_page_title ;;
    hidden: no
  }

  dimension: context_page_search {
    description: "" 
    type: string
    sql: ${TABLE}.context_page_search ;;
    hidden: no
  }

  dimension: context_page_path {
    description: "" 
    type: string
    sql: ${TABLE}.context_page_path ;;
    hidden: no
  }

  dimension: subscription_id {
    description: "" 
    type: string
    sql: ${TABLE}.subscription_id ;;
    hidden: no
  }

  dimension: context_traits_portal_customer_id {
    description: "" 
    type: string
    sql: ${TABLE}.context_traits_portal_customer_id ;;
    hidden: no
  }

  dimension: stripe_error {
    description: "" 
    type: string
    sql: ${TABLE}.stripe_error ;;
    hidden: no
  }

  dimension: workspace_name {
    description: "" 
    type: string
    sql: ${TABLE}.workspace_name ;;
    hidden: no
  }

  dimension: suggestion {
    description: "" 
    type: string
    sql: ${TABLE}.suggestion ;;
    hidden: no
  }

  dimension: duration {
    description: "" 
    type: number
    sql: ${TABLE}.duration ;;
    hidden: no
  }

  dimension: root_id {
    description: "" 
    type: string
    sql: ${TABLE}.root_id ;;
    hidden: no
  }

  dimension: post_id {
    description: "" 
    type: string
    sql: ${TABLE}.post_id ;;
    hidden: no
  }

  dimension: sort {
    description: "" 
    type: string
    sql: ${TABLE}.sort ;;
    hidden: no
  }

  dimension: team_id {
    description: "" 
    type: string
    sql: ${TABLE}.team_id ;;
    hidden: no
  }

  dimension: userid {
    description: "" 
    type: string
    sql: ${TABLE}.userid ;;
    hidden: no
  }

  dimension: channelsids_1 {
    description: "" 
    type: string
    sql: ${TABLE}.channelsids_1 ;;
    hidden: no
  }

  dimension: channelsids_0 {
    description: "" 
    type: string
    sql: ${TABLE}.channelsids_0 ;;
    hidden: no
  }

  dimension: version {
    description: "" 
    type: string
    sql: ${TABLE}.version ;;
    hidden: no
  }

  dimension: keyword {
    description: "" 
    type: string
    sql: ${TABLE}.keyword ;;
    hidden: no
  }

  dimension: count {
    description: "" 
    type: number
    sql: ${TABLE}.count ;;
    hidden: no
  }

  dimension: gfyid {
    description: "" 
    type: string
    sql: ${TABLE}.gfyid ;;
    hidden: no
  }

  dimension: context {
    description: "" 
    type: string
    sql: ${TABLE}.context ;;
    hidden: no
  }

  dimension: field {
    description: "" 
    type: string
    sql: ${TABLE}.field ;;
    hidden: no
  }

  dimension: plugin_id {
    description: "" 
    type: string
    sql: ${TABLE}.plugin_id ;;
    hidden: no
  }

  dimension: installed_version {
    description: "" 
    type: string
    sql: ${TABLE}.installed_version ;;
    hidden: no
  }

  dimension: group_constrained {
    description: "" 
    type: yesno
    sql: ${TABLE}.group_constrained ;;
    hidden: no
  }

  dimension: channelsids_32 {
    description: "" 
    type: string
    sql: ${TABLE}.channelsids_32 ;;
    hidden: no
  }

  dimension: channelsids_7 {
    description: "" 
    type: string
    sql: ${TABLE}.channelsids_7 ;;
    hidden: no
  }

  dimension: channelsids_45 {
    description: "" 
    type: string
    sql: ${TABLE}.channelsids_45 ;;
    hidden: no
  }

  dimension: channelsids_44 {
    description: "" 
    type: string
    sql: ${TABLE}.channelsids_44 ;;
    hidden: no
  }

  dimension: channelsids_14 {
    description: "" 
    type: string
    sql: ${TABLE}.channelsids_14 ;;
    hidden: no
  }

  dimension: channelsids_16 {
    description: "" 
    type: string
    sql: ${TABLE}.channelsids_16 ;;
    hidden: no
  }

  dimension: channelsids_13 {
    description: "" 
    type: string
    sql: ${TABLE}.channelsids_13 ;;
    hidden: no
  }

  dimension: channelsids_29 {
    description: "" 
    type: string
    sql: ${TABLE}.channelsids_29 ;;
    hidden: no
  }

  dimension: channelsids_46 {
    description: "" 
    type: string
    sql: ${TABLE}.channelsids_46 ;;
    hidden: no
  }

  dimension: channelsids_2 {
    description: "" 
    type: string
    sql: ${TABLE}.channelsids_2 ;;
    hidden: no
  }

  dimension: channelsids_21 {
    description: "" 
    type: string
    sql: ${TABLE}.channelsids_21 ;;
    hidden: no
  }

  dimension: channelsids_3 {
    description: "" 
    type: string
    sql: ${TABLE}.channelsids_3 ;;
    hidden: no
  }

  dimension: channelsids_10 {
    description: "" 
    type: string
    sql: ${TABLE}.channelsids_10 ;;
    hidden: no
  }

  dimension: channelsids_6 {
    description: "" 
    type: string
    sql: ${TABLE}.channelsids_6 ;;
    hidden: no
  }

  dimension: channelsids_27 {
    description: "" 
    type: string
    sql: ${TABLE}.channelsids_27 ;;
    hidden: no
  }

  dimension: channelsids_39 {
    description: "" 
    type: string
    sql: ${TABLE}.channelsids_39 ;;
    hidden: no
  }

  dimension: channelsids_34 {
    description: "" 
    type: string
    sql: ${TABLE}.channelsids_34 ;;
    hidden: no
  }

  dimension: channelsids_31 {
    description: "" 
    type: string
    sql: ${TABLE}.channelsids_31 ;;
    hidden: no
  }

  dimension: channelsids_36 {
    description: "" 
    type: string
    sql: ${TABLE}.channelsids_36 ;;
    hidden: no
  }

  dimension: channelsids_28 {
    description: "" 
    type: string
    sql: ${TABLE}.channelsids_28 ;;
    hidden: no
  }

  dimension: channelsids_4 {
    description: "" 
    type: string
    sql: ${TABLE}.channelsids_4 ;;
    hidden: no
  }

  dimension: channelsids_30 {
    description: "" 
    type: string
    sql: ${TABLE}.channelsids_30 ;;
    hidden: no
  }

  dimension: channelsids_11 {
    description: "" 
    type: string
    sql: ${TABLE}.channelsids_11 ;;
    hidden: no
  }

  dimension: channelsids_23 {
    description: "" 
    type: string
    sql: ${TABLE}.channelsids_23 ;;
    hidden: no
  }

  dimension: channelsids_41 {
    description: "" 
    type: string
    sql: ${TABLE}.channelsids_41 ;;
    hidden: no
  }

  dimension: channelsids_37 {
    description: "" 
    type: string
    sql: ${TABLE}.channelsids_37 ;;
    hidden: no
  }

  dimension: channelsids_19 {
    description: "" 
    type: string
    sql: ${TABLE}.channelsids_19 ;;
    hidden: no
  }

  dimension: channelsids_9 {
    description: "" 
    type: string
    sql: ${TABLE}.channelsids_9 ;;
    hidden: no
  }

  dimension: channelsids_47 {
    description: "" 
    type: string
    sql: ${TABLE}.channelsids_47 ;;
    hidden: no
  }

  dimension: channelsids_12 {
    description: "" 
    type: string
    sql: ${TABLE}.channelsids_12 ;;
    hidden: no
  }

  dimension: channelsids_15 {
    description: "" 
    type: string
    sql: ${TABLE}.channelsids_15 ;;
    hidden: no
  }

  dimension: channelsids_20 {
    description: "" 
    type: string
    sql: ${TABLE}.channelsids_20 ;;
    hidden: no
  }

  dimension: channelsids_35 {
    description: "" 
    type: string
    sql: ${TABLE}.channelsids_35 ;;
    hidden: no
  }

  dimension: channelsids_24 {
    description: "" 
    type: string
    sql: ${TABLE}.channelsids_24 ;;
    hidden: no
  }

  dimension: channelsids_40 {
    description: "" 
    type: string
    sql: ${TABLE}.channelsids_40 ;;
    hidden: no
  }

  dimension: channelsids_5 {
    description: "" 
    type: string
    sql: ${TABLE}.channelsids_5 ;;
    hidden: no
  }

  dimension: channelsids_22 {
    description: "" 
    type: string
    sql: ${TABLE}.channelsids_22 ;;
    hidden: no
  }

  dimension: channelsids_8 {
    description: "" 
    type: string
    sql: ${TABLE}.channelsids_8 ;;
    hidden: no
  }

  dimension: channelsids_33 {
    description: "" 
    type: string
    sql: ${TABLE}.channelsids_33 ;;
    hidden: no
  }

  dimension: channelsids_42 {
    description: "" 
    type: string
    sql: ${TABLE}.channelsids_42 ;;
    hidden: no
  }

  dimension: channelsids_43 {
    description: "" 
    type: string
    sql: ${TABLE}.channelsids_43 ;;
    hidden: no
  }

  dimension: channelsids_25 {
    description: "" 
    type: string
    sql: ${TABLE}.channelsids_25 ;;
    hidden: no
  }

  dimension: channelsids_26 {
    description: "" 
    type: string
    sql: ${TABLE}.channelsids_26 ;;
    hidden: no
  }

  dimension: channelsids_38 {
    description: "" 
    type: string
    sql: ${TABLE}.channelsids_38 ;;
    hidden: no
  }

  dimension: channelsids_18 {
    description: "" 
    type: string
    sql: ${TABLE}.channelsids_18 ;;
    hidden: no
  }

  dimension: channelsids_17 {
    description: "" 
    type: string
    sql: ${TABLE}.channelsids_17 ;;
    hidden: no
  }

  dimension: value {
    description: "" 
    type: string
    sql: ${TABLE}.value ;;
    hidden: no
  }

  dimension: include_deleted {
    description: "" 
    type: yesno
    sql: ${TABLE}.include_deleted ;;
    hidden: no
  }

  dimension: role {
    description: "" 
    type: string
    sql: ${TABLE}.role ;;
    hidden: no
  }

  dimension: channelsids_49 {
    description: "" 
    type: string
    sql: ${TABLE}.channelsids_49 ;;
    hidden: no
  }

  dimension: channelsids_48 {
    description: "" 
    type: string
    sql: ${TABLE}.channelsids_48 ;;
    hidden: no
  }

  dimension: channel_ids_0 {
    description: "" 
    type: string
    sql: ${TABLE}.channel_ids_0 ;;
    hidden: no
  }

  dimension: channel_ids_1 {
    description: "" 
    type: string
    sql: ${TABLE}.channel_ids_1 ;;
    hidden: no
  }

  dimension: privacy {
    description: "" 
    type: string
    sql: ${TABLE}.privacy ;;
    hidden: no
  }

  dimension: scheme_id {
    description: "" 
    type: string
    sql: ${TABLE}.scheme_id ;;
    hidden: no
  }

  dimension: channel_ids_2 {
    description: "" 
    type: string
    sql: ${TABLE}.channel_ids_2 ;;
    hidden: no
  }

  dimension: channelsids {
    description: "" 
    type: string
    sql: ${TABLE}.channelsids ;;
    hidden: no
  }

  dimension: channel_ids {
    description: "" 
    type: string
    sql: ${TABLE}.channel_ids ;;
    hidden: no
  }

  dimension: from_page {
    description: "" 
    type: string
    sql: ${TABLE}.from_page ;;
    hidden: no
  }

  dimension: context_compiled {
    description: "" 
    type: yesno
    sql: ${TABLE}.context_compiled ;;
    hidden: no
  }

  dimension: context_terminators_lastindex {
    description: "" 
    type: number
    sql: ${TABLE}.context_terminators_lastindex ;;
    hidden: no
  }

  dimension: context_contains {
    description: "" 
    type: string
    sql: ${TABLE}.context_contains ;;
    hidden: no
  }

  dimension: context_relevance {
    description: "" 
    type: number
    sql: ${TABLE}.context_relevance ;;
    hidden: no
  }

  dimension: context_traits_41 {
    description: "" 
    type: string
    sql: ${TABLE}.context_traits_41 ;;
    hidden: no
  }

  dimension: context_traits_2 {
    description: "" 
    type: string
    sql: ${TABLE}.context_traits_2 ;;
    hidden: no
  }

  dimension: context_traits_9 {
    description: "" 
    type: string
    sql: ${TABLE}.context_traits_9 ;;
    hidden: no
  }

  dimension: context_traits_28 {
    description: "" 
    type: string
    sql: ${TABLE}.context_traits_28 ;;
    hidden: no
  }

  dimension: context_traits_53 {
    description: "" 
    type: string
    sql: ${TABLE}.context_traits_53 ;;
    hidden: no
  }

  dimension: context_traits_20 {
    description: "" 
    type: string
    sql: ${TABLE}.context_traits_20 ;;
    hidden: no
  }

  dimension: context_traits_40 {
    description: "" 
    type: string
    sql: ${TABLE}.context_traits_40 ;;
    hidden: no
  }

  dimension: context_traits_3 {
    description: "" 
    type: string
    sql: ${TABLE}.context_traits_3 ;;
    hidden: no
  }

  dimension: context_traits_1 {
    description: "" 
    type: string
    sql: ${TABLE}.context_traits_1 ;;
    hidden: no
  }

  dimension: context_traits_44 {
    description: "" 
    type: string
    sql: ${TABLE}.context_traits_44 ;;
    hidden: no
  }

  dimension: context_traits_10 {
    description: "" 
    type: string
    sql: ${TABLE}.context_traits_10 ;;
    hidden: no
  }

  dimension: context_traits_17 {
    description: "" 
    type: string
    sql: ${TABLE}.context_traits_17 ;;
    hidden: no
  }

  dimension: context_traits_34 {
    description: "" 
    type: string
    sql: ${TABLE}.context_traits_34 ;;
    hidden: no
  }

  dimension: context_traits_54 {
    description: "" 
    type: string
    sql: ${TABLE}.context_traits_54 ;;
    hidden: no
  }

  dimension: context_traits_15 {
    description: "" 
    type: string
    sql: ${TABLE}.context_traits_15 ;;
    hidden: no
  }

  dimension: context_traits_14 {
    description: "" 
    type: string
    sql: ${TABLE}.context_traits_14 ;;
    hidden: no
  }

  dimension: context_traits_31 {
    description: "" 
    type: string
    sql: ${TABLE}.context_traits_31 ;;
    hidden: no
  }

  dimension: context_traits_32 {
    description: "" 
    type: string
    sql: ${TABLE}.context_traits_32 ;;
    hidden: no
  }

  dimension: context_traits_38 {
    description: "" 
    type: string
    sql: ${TABLE}.context_traits_38 ;;
    hidden: no
  }

  dimension: context_traits_16 {
    description: "" 
    type: string
    sql: ${TABLE}.context_traits_16 ;;
    hidden: no
  }

  dimension: context_traits_56 {
    description: "" 
    type: string
    sql: ${TABLE}.context_traits_56 ;;
    hidden: no
  }

  dimension: context_traits_13 {
    description: "" 
    type: string
    sql: ${TABLE}.context_traits_13 ;;
    hidden: no
  }

  dimension: context_traits_23 {
    description: "" 
    type: string
    sql: ${TABLE}.context_traits_23 ;;
    hidden: no
  }

  dimension: context_traits_30 {
    description: "" 
    type: string
    sql: ${TABLE}.context_traits_30 ;;
    hidden: no
  }

  dimension: context_traits_39 {
    description: "" 
    type: string
    sql: ${TABLE}.context_traits_39 ;;
    hidden: no
  }

  dimension: context_traits_51 {
    description: "" 
    type: string
    sql: ${TABLE}.context_traits_51 ;;
    hidden: no
  }

  dimension: context_traits_45 {
    description: "" 
    type: string
    sql: ${TABLE}.context_traits_45 ;;
    hidden: no
  }

  dimension: context_traits_24 {
    description: "" 
    type: string
    sql: ${TABLE}.context_traits_24 ;;
    hidden: no
  }

  dimension: context_traits_47 {
    description: "" 
    type: string
    sql: ${TABLE}.context_traits_47 ;;
    hidden: no
  }

  dimension: context_traits_29 {
    description: "" 
    type: string
    sql: ${TABLE}.context_traits_29 ;;
    hidden: no
  }

  dimension: context_traits_19 {
    description: "" 
    type: string
    sql: ${TABLE}.context_traits_19 ;;
    hidden: no
  }

  dimension: context_traits_33 {
    description: "" 
    type: string
    sql: ${TABLE}.context_traits_33 ;;
    hidden: no
  }

  dimension: context_traits_55 {
    description: "" 
    type: string
    sql: ${TABLE}.context_traits_55 ;;
    hidden: no
  }

  dimension: context_traits_22 {
    description: "" 
    type: string
    sql: ${TABLE}.context_traits_22 ;;
    hidden: no
  }

  dimension: context_traits_11 {
    description: "" 
    type: string
    sql: ${TABLE}.context_traits_11 ;;
    hidden: no
  }

  dimension: context_traits_4 {
    description: "" 
    type: string
    sql: ${TABLE}.context_traits_4 ;;
    hidden: no
  }

  dimension: context_traits_27 {
    description: "" 
    type: string
    sql: ${TABLE}.context_traits_27 ;;
    hidden: no
  }

  dimension: context_traits_50 {
    description: "" 
    type: string
    sql: ${TABLE}.context_traits_50 ;;
    hidden: no
  }

  dimension: context_traits_12 {
    description: "" 
    type: string
    sql: ${TABLE}.context_traits_12 ;;
    hidden: no
  }

  dimension: context_traits_35 {
    description: "" 
    type: string
    sql: ${TABLE}.context_traits_35 ;;
    hidden: no
  }

  dimension: context_traits_37 {
    description: "" 
    type: string
    sql: ${TABLE}.context_traits_37 ;;
    hidden: no
  }

  dimension: context_traits_5 {
    description: "" 
    type: string
    sql: ${TABLE}.context_traits_5 ;;
    hidden: no
  }

  dimension: context_traits_21 {
    description: "" 
    type: string
    sql: ${TABLE}.context_traits_21 ;;
    hidden: no
  }

  dimension: context_traits_26 {
    description: "" 
    type: string
    sql: ${TABLE}.context_traits_26 ;;
    hidden: no
  }

  dimension: context_traits_6 {
    description: "" 
    type: string
    sql: ${TABLE}.context_traits_6 ;;
    hidden: no
  }

  dimension: context_traits_36 {
    description: "" 
    type: string
    sql: ${TABLE}.context_traits_36 ;;
    hidden: no
  }

  dimension: context_traits_57 {
    description: "" 
    type: string
    sql: ${TABLE}.context_traits_57 ;;
    hidden: no
  }

  dimension: context_traits_0 {
    description: "" 
    type: string
    sql: ${TABLE}.context_traits_0 ;;
    hidden: no
  }

  dimension: context_traits_42 {
    description: "" 
    type: string
    sql: ${TABLE}.context_traits_42 ;;
    hidden: no
  }

  dimension: context_traits_46 {
    description: "" 
    type: string
    sql: ${TABLE}.context_traits_46 ;;
    hidden: no
  }

  dimension: context_traits_52 {
    description: "" 
    type: string
    sql: ${TABLE}.context_traits_52 ;;
    hidden: no
  }

  dimension: context_traits_25 {
    description: "" 
    type: string
    sql: ${TABLE}.context_traits_25 ;;
    hidden: no
  }

  dimension: context_traits_43 {
    description: "" 
    type: string
    sql: ${TABLE}.context_traits_43 ;;
    hidden: no
  }

  dimension: context_traits_48 {
    description: "" 
    type: string
    sql: ${TABLE}.context_traits_48 ;;
    hidden: no
  }

  dimension: context_traits_7 {
    description: "" 
    type: string
    sql: ${TABLE}.context_traits_7 ;;
    hidden: no
  }

  dimension: context_traits_18 {
    description: "" 
    type: string
    sql: ${TABLE}.context_traits_18 ;;
    hidden: no
  }

  dimension: context_traits_8 {
    description: "" 
    type: string
    sql: ${TABLE}.context_traits_8 ;;
    hidden: no
  }

  dimension: context_traits_49 {
    description: "" 
    type: string
    sql: ${TABLE}.context_traits_49 ;;
    hidden: no
  }

  dimension: warnmetricid {
    description: "" 
    type: string
    sql: ${TABLE}.warnmetricid ;;
    hidden: no
  }

  dimension: metric {
    description: "" 
    type: string
    sql: ${TABLE}.metric ;;
    hidden: no
  }

  dimension: context_traits_cross_domain_id {
    description: "" 
    type: string
    sql: ${TABLE}.context_traits_cross_domain_id ;;
    hidden: no
  }

  dimension: context_amp_id {
    description: "" 
    type: string
    sql: ${TABLE}.context_amp_id ;;
    hidden: no
  }

  dimension: channel_name {
    description: "" 
    type: string
    sql: ${TABLE}.channel_name ;;
    hidden: no
  }

  dimension: context_campaign_medium {
    description: "" 
    type: string
    sql: ${TABLE}.context_campaign_medium ;;
    hidden: no
  }

  dimension: context_campaign_source {
    description: "" 
    type: string
    sql: ${TABLE}.context_campaign_source ;;
    hidden: no
  }

  dimension: team_name {
    description: "" 
    type: string
    sql: ${TABLE}.team_name ;;
    hidden: no
  }

  dimension: channel_id_tid {
    description: "" 
    type: string
    sql: ${TABLE}.channel_id_tid ;;
    hidden: no
  }

  dimension: context_campaign_name {
    description: "" 
    type: string
    sql: ${TABLE}.context_campaign_name ;;
    hidden: no
  }

  dimension: channel_id_value {
    description: "" 
    type: string
    sql: ${TABLE}.channel_id_value ;;
    hidden: no
  }

  dimension: context_campaign_content {
    description: "" 
    type: string
    sql: ${TABLE}.context_campaign_content ;;
    hidden: no
  }

  dimension: context_campaign_term {
    description: "" 
    type: string
    sql: ${TABLE}.context_campaign_term ;;
    hidden: no
  }

  dimension: segment_dedupe_id {
    description: "" 
    type: string
    sql: ${TABLE}.segment_dedupe_id ;;
    hidden: no
  }

  dimension: context_user_agent {
    description: "" 
    type: string
    sql: ${TABLE}.context_user_agent ;;
    hidden: no
  }

  dimension: context_server {
    description: "" 
    type: string
    sql: ${TABLE}.context_server ;;
    hidden: no
  }

  dimension: context_device_os {
    description: "" 
    type: string
    sql: ${TABLE}.context_device_os ;;
    hidden: no
  }

  dimension: context_device_is_tablet {
    description: "" 
    type: yesno
    sql: ${TABLE}.context_device_is_tablet ;;
    hidden: no
  }

  dimension: context_device_dimensions_height {
    description: "" 
    type: number
    sql: ${TABLE}.context_device_dimensions_height ;;
    hidden: no
  }

  dimension: context_device_dimensions_width {
    description: "" 
    type: number
    sql: ${TABLE}.context_device_dimensions_width ;;
    hidden: no
  }

  
  # DIMENSION GROUPS/DATES
  dimension_group: original_timestamp {
	description: "" 
	type: time
	timeframes: [date, month, year]
    sql: ${TABLE}.original_timestamp ;;
    hidden: no
  }

  dimension_group: sent_at {
	description: "" 
	type: time
	timeframes: [date, month, year]
    sql: ${TABLE}.sent_at ;;
    hidden: no
  }

  dimension_group: timestamp {
	description: "" 
	type: time
	timeframes: [date, month, year]
    sql: ${TABLE}.timestamp ;;
    hidden: no
  }

  dimension_group: uuid_ts {
	description: "" 
	type: time
	timeframes: [date, month, year]
    sql: ${TABLE}.uuid_ts ;;
    hidden: no
  }

  dimension_group: received_at {
	description: "" 
	type: time
	timeframes: [date, month, year]
    sql: ${TABLE}.received_at ;;
    hidden: no
  }

  dimension_group: channel_id_timestamp {
	description: "" 
	type: time
	timeframes: [date, month, year]
    sql: ${TABLE}.channel_id_timestamp ;;
    hidden: no
  }

  
  # MEASURES
  measure: count {
    description: "Count of rows/occurrences."
    type: count
  }

  measure: anonymous_count {
    label: " Anonymous Count"
    description: "The distinct count of Anonymouss within each grouping."
    type: count_distinct
    sql: ${anonymous_id} ;;
  }

  measure: context_device_count {
    label: " Context Device Count"
    description: "The distinct count of Context Devices within each grouping."
    type: count_distinct
    sql: ${context_device_id} ;;
  }

  measure: user_actual_count {
    label: " User Actual Count"
    description: "The distinct count of User Actuals within each grouping."
    type: count_distinct
    sql: ${user_actual_id} ;;
  }

  measure: user_count {
    label: " User Count"
    description: "The distinct count of Users within each grouping."
    type: count_distinct
    sql: ${user_id} ;;
  }

  measure: context_traits_count {
    label: " Context Traits Count"
    description: "The distinct count of Context Traitss within each grouping."
    type: count_distinct
    sql: ${context_traits_id} ;;
  }

  measure: channel_count {
    label: " Channel Count"
    description: "The distinct count of Channels within each grouping."
    type: count_distinct
    sql: ${channel_id} ;;
  }

  measure: subscription_count {
    label: " Subscription Count"
    description: "The distinct count of Subscriptions within each grouping."
    type: count_distinct
    sql: ${subscription_id} ;;
  }

  measure: context_traits_portal_customer_count {
    label: " Context Traits Portal Customer Count"
    description: "The distinct count of Context Traits Portal Customers within each grouping."
    type: count_distinct
    sql: ${context_traits_portal_customer_id} ;;
  }

  measure: root_count {
    label: " Root Count"
    description: "The distinct count of Roots within each grouping."
    type: count_distinct
    sql: ${root_id} ;;
  }

  measure: post_count {
    label: " Post Count"
    description: "The distinct count of Posts within each grouping."
    type: count_distinct
    sql: ${post_id} ;;
  }

  measure: team_count {
    label: " Team Count"
    description: "The distinct count of Teams within each grouping."
    type: count_distinct
    sql: ${team_id} ;;
  }

  measure: count_sum {
    description: "The sum of Count within each grouping."
    type: sum
    group_label: "Count Measures"
    sql: ${count} ;;
  }

  measure: count_max {
    description: "The max of Count within each grouping."
    type: max
    group_label: "Count Measures"
    sql: ${count} ;;
  }

  measure: count_min {
    description: "The min of Count within each grouping."
    type: min
    group_label: "Count Measures"
    sql: ${count} ;;
  }

  measure: count_avg {
    description: "The average of Count within each grouping."
    type: average
    group_label: "Count Measures"
    sql: ${count} ;;
  }

  measure: count_median {
    description: "The median of Count within each grouping."
    type: median
    group_label: "Count Measures"
    sql: ${count} ;;
  }

  measure: plugin_count {
    label: " Plugin Count"
    description: "The distinct count of Plugins within each grouping."
    type: count_distinct
    sql: ${plugin_id} ;;
  }

  measure: channels_0_count {
    label: " Channels 0 Count"
    description: "The distinct count of Channelss 0 within each grouping."
    type: count_distinct
    sql: ${channel_ids_0} ;;
  }

  measure: channels_1_count {
    label: " Channels 1 Count"
    description: "The distinct count of Channelss 1 within each grouping."
    type: count_distinct
    sql: ${channel_ids_1} ;;
  }

  measure: scheme_count {
    label: " Scheme Count"
    description: "The distinct count of Schemes within each grouping."
    type: count_distinct
    sql: ${scheme_id} ;;
  }

  measure: channels_2_count {
    label: " Channels 2 Count"
    description: "The distinct count of Channelss 2 within each grouping."
    type: count_distinct
    sql: ${channel_ids_2} ;;
  }

  measure: channels_count {
    label: " Channels Count"
    description: "The distinct count of Channelss within each grouping."
    type: count_distinct
    sql: ${channel_ids} ;;
  }

  measure: context_traits_cross_domain_count {
    label: " Context Traits Cross Domain Count"
    description: "The distinct count of Context Traits Cross Domains within each grouping."
    type: count_distinct
    sql: ${context_traits_cross_domain_id} ;;
  }

  measure: context_amp_count {
    label: " Context Amp Count"
    description: "The distinct count of Context Amps within each grouping."
    type: count_distinct
    sql: ${context_amp_id} ;;
  }

  measure: channel_tid_count {
    label: " Channel Tid Count"
    description: "The distinct count of Channels Tid within each grouping."
    type: count_distinct
    sql: ${channel_id_tid} ;;
  }

  measure: channel_value_count {
    label: " Channel Value Count"
    description: "The distinct count of Channels Value within each grouping."
    type: count_distinct
    sql: ${channel_id_value} ;;
  }

  measure: segment_dedupe_count {
    label: " Segment Dedupe Count"
    description: "The distinct count of Segment Dedupes within each grouping."
    type: count_distinct
    sql: ${segment_dedupe_id} ;;
  }


}