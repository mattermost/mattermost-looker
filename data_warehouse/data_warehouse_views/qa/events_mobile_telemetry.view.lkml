# This is the view file for the analytics.qa.events_mobile_telemetry table.
view: events_mobile_telemetry {
  sql_table_name: qa.events_mobile_telemetry ;;
  view_label: "Events Mobile Telemetry"

  # FILTERS

  # DIMENSIONS
  dimension: _dbt_source_relation {
    description: ""
    type: string
    sql: CASE WHEN regexp_substr(${TABLE}._dbt_source_relation, '_(BETA|TEST)') = '_BETA' THEN 'Release Candidate'
      ELSE 'Quality Assurance (QA)' END ;;
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
    sql: CASE WHEN ${TABLE}.type is null then ${event} else ${TABLE}.type end ;;
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
    html:
    {% assign words = {{value}} | replace: '}', '' | replace: '{', '' | replace: ', ', '; ' | split: ',' %}
    <ul>
    {% for word in words %}
    <li>{{ word }}</li>
    {% endfor %} ;;
  }


  # DIMENSION GROUPS/DATES
  dimension_group: sent_at {
    label:  " Sent At"
    description: "The Sent At date time field."
    type: time
    timeframes: [second, date, week, month, year, fiscal_year, fiscal_quarter]
    sql: ${TABLE}.sent_at ;;
    hidden: no
  }

  dimension_group: original_timestamp {
    label:  " Original Timestamp"
    description: "The Original Timestamp date time field."
    type: time
    timeframes: [second, date, week, month, year, fiscal_year, fiscal_quarter]
    sql: ${TABLE}.original_timestamp ;;
    hidden: no
  }

  dimension_group: received_at {
    label:  " Received At"
    description: "The Received At date time field."
    type: time
    timeframes: [second, date, week, month, year, fiscal_year, fiscal_quarter]
    sql: ${TABLE}.received_at ;;
    hidden: no
  }

  dimension_group: uuid_ts {
    label:  " Uuid Ts"
    description: "The Uuid Ts date time field."
    type: time
    timeframes: [second, date, week, month, year, fiscal_year, fiscal_quarter]
    sql: ${TABLE}.uuid_ts ;;
    hidden: no
  }

  dimension_group: timestamp {
    label:  " Timestamp"
    description: "The Timestamp date time field."
    type: time
    timeframes: [second, date, week, month, year, fiscal_year, fiscal_quarter]
    sql: ${TABLE}.timestamp ;;
    hidden: no
  }



  # MEASURES
  measure: first_triggered {
    label: "First Triggered"
    description: "The date & time the event was first triggered."
    type: date_time
    sql: MIN(${TABLE}.timestamp) ;;
  }

  measure: last_triggered {
    label: "Last Triggered"
    description: "The date & time the event was last triggered."
    type: date_time
    sql: MAX(${TABLE}.timestamp) ;;
  }

  measure: count {
    label: " Count"
    description: "Count of rows/occurrences."
    type: count
  }

  measure: _dbt_source_relation_count {
    label: " Dbt Source Relation Count (Distinct)"
    description: "The distinct count of  dbt source relation's per grouping."
    type: count_distinct
    sql: ${_dbt_source_relation} ;;
  }

  measure: _dbt_source_relation_count_all {
    label: " Dbt Source Relation Count"
    description: "The count of all non-null  dbt source relation occurrences per grouping."
    type: number
    sql: COUNT(case when ${_dbt_source_relation} IS NOT NULL then ${_dbt_source_relation} else null end) ;;
  }

  measure: context_network_carrier_count {
    label: "Context Network Carrier Count (Distinct)"
    description: "The distinct count of context network carrier's per grouping."
    type: count_distinct
    sql: ${context_network_carrier} ;;
  }

  measure: context_network_carrier_count_all {
    label: "Context Network Carrier Count"
    description: "The count of all non-null context network carrier occurrences per grouping."
    type: number
    sql: COUNT(case when ${context_network_carrier} IS NOT NULL then ${context_network_carrier} else null end) ;;
  }

  measure: context_device_id_count {
    label: "Context Device Id Count (Distinct)"
    description: "The distinct count of context device id's per grouping."
    type: count_distinct
    sql: ${context_device_id} ;;
  }

  measure: context_device_id_count_all {
    label: "Context Device Id Count"
    description: "The count of all non-null context device id occurrences per grouping."
    type: number
    sql: COUNT(case when ${context_device_id} IS NOT NULL then ${context_device_id} else null end) ;;
  }

  measure: context_traits_device_dimensions_height_count {
    label: "Context Traits Device Dimensions Height Count (Distinct)"
    description: "The distinct count of context traits device dimensions height's per grouping."
    type: count_distinct
    sql: ${context_traits_device_dimensions_height} ;;
  }

  measure: context_traits_device_dimensions_height_count_all {
    label: "Context Traits Device Dimensions Height Count"
    description: "The count of all non-null context traits device dimensions height occurrences per grouping."
    type: number
    sql: COUNT(case when ${context_traits_device_dimensions_height} IS NOT NULL then ${context_traits_device_dimensions_height} else null end) ;;
  }

  measure: sent_at_count {
    label: "Sent At Count (Distinct)"
    description: "The distinct count of sent at's per grouping."
    type: count_distinct
    sql: ${sent_at_date} ;;
  }

  measure: sent_at_count_all {
    label: "Sent At Count"
    description: "The count of all non-null sent at occurrences per grouping."
    type: number
    sql: COUNT(case when ${sent_at_date} IS NOT NULL then ${sent_at_date} else null end) ;;
  }

  measure: context_screen_height_count {
    label: "Context Screen Height Count (Distinct)"
    description: "The distinct count of context screen height's per grouping."
    type: count_distinct
    sql: ${context_screen_height} ;;
  }

  measure: context_screen_height_count_all {
    label: "Context Screen Height Count"
    description: "The count of all non-null context screen height occurrences per grouping."
    type: number
    sql: COUNT(case when ${context_screen_height} IS NOT NULL then ${context_screen_height} else null end) ;;
  }

  measure: context_locale_count {
    label: "Context Locale Count (Distinct)"
    description: "The distinct count of context locale's per grouping."
    type: count_distinct
    sql: ${context_locale} ;;
  }

  measure: context_locale_count_all {
    label: "Context Locale Count"
    description: "The count of all non-null context locale occurrences per grouping."
    type: number
    sql: COUNT(case when ${context_locale} IS NOT NULL then ${context_locale} else null end) ;;
  }

  measure: context_traits_device_dimensions_width_count {
    label: "Context Traits Device Dimensions Width Count (Distinct)"
    description: "The distinct count of context traits device dimensions width's per grouping."
    type: count_distinct
    sql: ${context_traits_device_dimensions_width} ;;
  }

  measure: context_traits_device_dimensions_width_count_all {
    label: "Context Traits Device Dimensions Width Count"
    description: "The count of all non-null context traits device dimensions width occurrences per grouping."
    type: number
    sql: COUNT(case when ${context_traits_device_dimensions_width} IS NOT NULL then ${context_traits_device_dimensions_width} else null end) ;;
  }

  measure: type_count {
    label: "Type Count (Distinct)"
    description: "The distinct count of type's per grouping."
    type: count_distinct
    sql: ${type} ;;
  }

  measure: type_count_all {
    label: "Type Count"
    description: "The count of all non-null type occurrences per grouping."
    type: number
    sql: COUNT(case when ${type} IS NOT NULL then ${type} else null end) ;;
  }

  measure: user_id_count {
    label: "User Id Count (Distinct)"
    description: "The distinct count of user id's per grouping."
    type: count_distinct
    sql: ${user_id} ;;
  }

  measure: user_id_count_all {
    label: "User Id Count"
    description: "The count of all non-null user id occurrences per grouping."
    type: number
    sql: COUNT(case when ${user_id} IS NOT NULL then ${user_id} else null end) ;;
  }

  measure: context_device_type_count {
    label: "Context Device Type Count (Distinct)"
    description: "The distinct count of context device type's per grouping."
    type: count_distinct
    sql: ${context_device_type} ;;
  }

  measure: context_device_type_count_all {
    label: "Context Device Type Count"
    description: "The count of all non-null context device type occurrences per grouping."
    type: number
    sql: COUNT(case when ${context_device_type} IS NOT NULL then ${context_device_type} else null end) ;;
  }

  measure: context_app_name_count {
    label: "Context App Name Count (Distinct)"
    description: "The distinct count of context app name's per grouping."
    type: count_distinct
    sql: ${context_app_name} ;;
  }

  measure: context_app_name_count_all {
    label: "Context App Name Count"
    description: "The count of all non-null context app name occurrences per grouping."
    type: number
    sql: COUNT(case when ${context_app_name} IS NOT NULL then ${context_app_name} else null end) ;;
  }

  measure: context_device_model_count {
    label: "Context Device Model Count (Distinct)"
    description: "The distinct count of context device model's per grouping."
    type: count_distinct
    sql: ${context_device_model} ;;
  }

  measure: context_device_model_count_all {
    label: "Context Device Model Count"
    description: "The count of all non-null context device model occurrences per grouping."
    type: number
    sql: COUNT(case when ${context_device_model} IS NOT NULL then ${context_device_model} else null end) ;;
  }

  measure: context_library_name_count {
    label: "Context Library Name Count (Distinct)"
    description: "The distinct count of context library name's per grouping."
    type: count_distinct
    sql: ${context_library_name} ;;
  }

  measure: context_library_name_count_all {
    label: "Context Library Name Count"
    description: "The count of all non-null context library name occurrences per grouping."
    type: number
    sql: COUNT(case when ${context_library_name} IS NOT NULL then ${context_library_name} else null end) ;;
  }

  measure: context_network_cellular_count {
    label: "Context Network Cellular Count (Distinct)"
    description: "The distinct count of context network cellular's per grouping."
    type: count_distinct
    sql: ${context_network_cellular} ;;
  }

  measure: context_network_cellular_count_all {
    label: "Context Network Cellular Count"
    description: "The count of all non-null context network cellular occurrences per grouping."
    type: number
    sql: COUNT(case when ${context_network_cellular} IS NOT NULL then ${context_network_cellular} else null end) ;;
  }

  measure: context_network_bluetooth_count {
    label: "Context Network Bluetooth Count (Distinct)"
    description: "The distinct count of context network bluetooth's per grouping."
    type: count_distinct
    sql: ${context_network_bluetooth} ;;
  }

  measure: context_network_bluetooth_count_all {
    label: "Context Network Bluetooth Count"
    description: "The count of all non-null context network bluetooth occurrences per grouping."
    type: number
    sql: COUNT(case when ${context_network_bluetooth} IS NOT NULL then ${context_network_bluetooth} else null end) ;;
  }

  measure: original_timestamp_count {
    label: "Original Timestamp Count (Distinct)"
    description: "The distinct count of original timestamp's per grouping."
    type: count_distinct
    sql: ${original_timestamp_date} ;;
  }

  measure: original_timestamp_count_all {
    label: "Original Timestamp Count"
    description: "The count of all non-null original timestamp occurrences per grouping."
    type: number
    sql: COUNT(case when ${original_timestamp_date} IS NOT NULL then ${original_timestamp_date} else null end) ;;
  }

  measure: context_traits_app_version_count {
    label: "Context Traits App Version Count (Distinct)"
    description: "The distinct count of context traits app version's per grouping."
    type: count_distinct
    sql: ${context_traits_app_version} ;;
  }

  measure: context_traits_app_version_count_all {
    label: "Context Traits App Version Count"
    description: "The count of all non-null context traits app version occurrences per grouping."
    type: number
    sql: COUNT(case when ${context_traits_app_version} IS NOT NULL then ${context_traits_app_version} else null end) ;;
  }

  measure: context_app_build_count {
    label: "Context App Build Count (Distinct)"
    description: "The distinct count of context app build's per grouping."
    type: count_distinct
    sql: ${context_app_build} ;;
  }

  measure: context_app_build_count_all {
    label: "Context App Build Count"
    description: "The count of all non-null context app build occurrences per grouping."
    type: number
    sql: COUNT(case when ${context_app_build} IS NOT NULL then ${context_app_build} else null end) ;;
  }

  measure: context_network_wifi_count {
    label: "Context Network Wifi Count (Distinct)"
    description: "The distinct count of context network wifi's per grouping."
    type: count_distinct
    sql: ${context_network_wifi} ;;
  }

  measure: context_network_wifi_count_all {
    label: "Context Network Wifi Count"
    description: "The count of all non-null context network wifi occurrences per grouping."
    type: number
    sql: COUNT(case when ${context_network_wifi} IS NOT NULL then ${context_network_wifi} else null end) ;;
  }

  measure: channel_id_count {
    label: "Channel Id Count (Distinct)"
    description: "The distinct count of channel id's per grouping."
    type: count_distinct
    sql: ${channel_id} ;;
  }

  measure: channel_id_count_all {
    label: "Channel Id Count"
    description: "The count of all non-null channel id occurrences per grouping."
    type: number
    sql: COUNT(case when ${channel_id} IS NOT NULL then ${channel_id} else null end) ;;
  }

  measure: received_at_count {
    label: "Received At Count (Distinct)"
    description: "The distinct count of received at's per grouping."
    type: count_distinct
    sql: ${received_at_date} ;;
  }

  measure: received_at_count_all {
    label: "Received At Count"
    description: "The count of all non-null received at occurrences per grouping."
    type: number
    sql: COUNT(case when ${received_at_date} IS NOT NULL then ${received_at_date} else null end) ;;
  }

  measure: context_screen_width_count {
    label: "Context Screen Width Count (Distinct)"
    description: "The distinct count of context screen width's per grouping."
    type: count_distinct
    sql: ${context_screen_width} ;;
  }

  measure: context_screen_width_count_all {
    label: "Context Screen Width Count"
    description: "The count of all non-null context screen width occurrences per grouping."
    type: number
    sql: COUNT(case when ${context_screen_width} IS NOT NULL then ${context_screen_width} else null end) ;;
  }

  measure: uuid_ts_count {
    label: "Uuid Ts Count (Distinct)"
    description: "The distinct count of uuid ts's per grouping."
    type: count_distinct
    sql: ${uuid_ts_date} ;;
  }

  measure: uuid_ts_count_all {
    label: "Uuid Ts Count"
    description: "The count of all non-null uuid ts occurrences per grouping."
    type: number
    sql: COUNT(case when ${uuid_ts_date} IS NOT NULL then ${uuid_ts_date} else null end) ;;
  }

  measure: category_count {
    label: "Category Count (Distinct)"
    description: "The distinct count of category's per grouping."
    type: count_distinct
    sql: ${category} ;;
  }

  measure: category_count_all {
    label: "Category Count"
    description: "The count of all non-null category occurrences per grouping."
    type: number
    sql: COUNT(case when ${category} IS NOT NULL then ${category} else null end) ;;
  }

  measure: anonymous_id_count {
    label: "Anonymous Id Count (Distinct)"
    description: "The distinct count of anonymous id's per grouping."
    type: count_distinct
    sql: ${anonymous_id} ;;
  }

  measure: anonymous_id_count_all {
    label: "Anonymous Id Count"
    description: "The count of all non-null anonymous id occurrences per grouping."
    type: number
    sql: COUNT(case when ${anonymous_id} IS NOT NULL then ${anonymous_id} else null end) ;;
  }

  measure: context_traits_server_count {
    label: "Context Traits Server Count (Distinct)"
    description: "The distinct count of context traits server's per grouping."
    type: count_distinct
    sql: ${context_traits_server} ;;
  }

  measure: context_traits_server_count_all {
    label: "Context Traits Server Count"
    description: "The count of all non-null context traits server occurrences per grouping."
    type: number
    sql: COUNT(case when ${context_traits_server} IS NOT NULL then ${context_traits_server} else null end) ;;
  }

  measure: context_app_namespace_count {
    label: "Context App Namespace Count (Distinct)"
    description: "The distinct count of context app namespace's per grouping."
    type: count_distinct
    sql: ${context_app_namespace} ;;
  }

  measure: context_app_namespace_count_all {
    label: "Context App Namespace Count"
    description: "The count of all non-null context app namespace occurrences per grouping."
    type: number
    sql: COUNT(case when ${context_app_namespace} IS NOT NULL then ${context_app_namespace} else null end) ;;
  }

  measure: context_traits_userid_count {
    label: "Context Traits Userid Count (Distinct)"
    description: "The distinct count of context traits userid's per grouping."
    type: count_distinct
    sql: ${context_traits_userid} ;;
  }

  measure: context_traits_userid_count_all {
    label: "Context Traits Userid Count"
    description: "The count of all non-null context traits userid occurrences per grouping."
    type: number
    sql: COUNT(case when ${context_traits_userid} IS NOT NULL then ${context_traits_userid} else null end) ;;
  }

  measure: event_count {
    label: "Event Count (Distinct)"
    description: "The distinct count of event's per grouping."
    type: count_distinct
    sql: ${event} ;;
  }

  measure: event_count_all {
    label: "Event Count"
    description: "The count of all non-null event occurrences per grouping."
    type: number
    sql: COUNT(case when ${event} IS NOT NULL then ${event} else null end) ;;
  }

  measure: id_count {
    label: "Id Count (Distinct)"
    description: "The distinct count of id's per grouping."
    type: count_distinct
    sql: ${id} ;;
  }

  measure: id_count_all {
    label: "Id Count"
    description: "The count of all non-null id occurrences per grouping."
    type: number
    sql: COUNT(case when ${id} IS NOT NULL then ${id} else null end) ;;
  }

  measure: timestamp_count {
    label: "Timestamp Count (Distinct)"
    description: "The distinct count of timestamp's per grouping."
    type: count_distinct
    sql: ${timestamp_date} ;;
  }

  measure: timestamp_count_all {
    label: "Timestamp Count"
    description: "The count of all non-null timestamp occurrences per grouping."
    type: number
    sql: COUNT(case when ${timestamp_date} IS NOT NULL then ${timestamp_date} else null end) ;;
  }

  measure: context_traits_app_build_count {
    label: "Context Traits App Build Count (Distinct)"
    description: "The distinct count of context traits app build's per grouping."
    type: count_distinct
    sql: ${context_traits_app_build} ;;
  }

  measure: context_traits_app_build_count_all {
    label: "Context Traits App Build Count"
    description: "The count of all non-null context traits app build occurrences per grouping."
    type: number
    sql: COUNT(case when ${context_traits_app_build} IS NOT NULL then ${context_traits_app_build} else null end) ;;
  }

  measure: channel_count {
    label: "Channel Count (Distinct)"
    description: "The distinct count of channel's per grouping."
    type: count_distinct
    sql: ${channel} ;;
  }

  measure: channel_count_all {
    label: "Channel Count"
    description: "The count of all non-null channel occurrences per grouping."
    type: number
    sql: COUNT(case when ${channel} IS NOT NULL then ${channel} else null end) ;;
  }

  measure: context_traits_id_count {
    label: "Context Traits Id Count (Distinct)"
    description: "The distinct count of context traits id's per grouping."
    type: count_distinct
    sql: ${context_traits_id} ;;
  }

  measure: context_traits_id_count_all {
    label: "Context Traits Id Count"
    description: "The count of all non-null context traits id occurrences per grouping."
    type: number
    sql: COUNT(case when ${context_traits_id} IS NOT NULL then ${context_traits_id} else null end) ;;
  }

  measure: context_os_version_count {
    label: "Context Os Version Count (Distinct)"
    description: "The distinct count of context os version's per grouping."
    type: count_distinct
    sql: ${context_os_version} ;;
  }

  measure: context_os_version_count_all {
    label: "Context Os Version Count"
    description: "The count of all non-null context os version occurrences per grouping."
    type: number
    sql: COUNT(case when ${context_os_version} IS NOT NULL then ${context_os_version} else null end) ;;
  }

  measure: context_app_version_count {
    label: "Context App Version Count (Distinct)"
    description: "The distinct count of context app version's per grouping."
    type: count_distinct
    sql: ${context_app_version} ;;
  }

  measure: context_app_version_count_all {
    label: "Context App Version Count"
    description: "The count of all non-null context app version occurrences per grouping."
    type: number
    sql: COUNT(case when ${context_app_version} IS NOT NULL then ${context_app_version} else null end) ;;
  }

  measure: context_traits_ip_count {
    label: "Context Traits Ip Count (Distinct)"
    description: "The distinct count of context traits ip's per grouping."
    type: count_distinct
    sql: ${context_traits_ip} ;;
  }

  measure: context_traits_ip_count_all {
    label: "Context Traits Ip Count"
    description: "The count of all non-null context traits ip occurrences per grouping."
    type: number
    sql: COUNT(case when ${context_traits_ip} IS NOT NULL then ${context_traits_ip} else null end) ;;
  }

  measure: event_text_count {
    label: "Event Text Count (Distinct)"
    description: "The distinct count of event text's per grouping."
    type: count_distinct
    sql: ${event_text} ;;
  }

  measure: event_text_count_all {
    label: "Event Text Count"
    description: "The count of all non-null event text occurrences per grouping."
    type: number
    sql: COUNT(case when ${event_text} IS NOT NULL then ${event_text} else null end) ;;
  }

  measure: context_library_version_count {
    label: "Context Library Version Count (Distinct)"
    description: "The distinct count of context library version's per grouping."
    type: count_distinct
    sql: ${context_library_version} ;;
  }

  measure: context_library_version_count_all {
    label: "Context Library Version Count"
    description: "The count of all non-null context library version occurrences per grouping."
    type: number
    sql: COUNT(case when ${context_library_version} IS NOT NULL then ${context_library_version} else null end) ;;
  }

  measure: context_ip_count {
    label: "Context Ip Count (Distinct)"
    description: "The distinct count of context ip's per grouping."
    type: count_distinct
    sql: ${context_ip} ;;
  }

  measure: context_ip_count_all {
    label: "Context Ip Count"
    description: "The count of all non-null context ip occurrences per grouping."
    type: number
    sql: COUNT(case when ${context_ip} IS NOT NULL then ${context_ip} else null end) ;;
  }

  measure: context_os_name_count {
    label: "Context Os Name Count (Distinct)"
    description: "The distinct count of context os name's per grouping."
    type: count_distinct
    sql: ${context_os_name} ;;
  }

  measure: context_os_name_count_all {
    label: "Context Os Name Count"
    description: "The count of all non-null context os name occurrences per grouping."
    type: number
    sql: COUNT(case when ${context_os_name} IS NOT NULL then ${context_os_name} else null end) ;;
  }

  measure: user_actual_id_count {
    label: "User Actual Id Count (Distinct)"
    description: "The distinct count of user actual id's per grouping."
    type: count_distinct
    sql: ${user_actual_id} ;;
  }

  measure: user_actual_id_count_all {
    label: "User Actual Id Count"
    description: "The count of all non-null user actual id occurrences per grouping."
    type: number
    sql: COUNT(case when ${user_actual_id} IS NOT NULL then ${user_actual_id} else null end) ;;
  }

  measure: user_actual_role_count {
    label: "User Actual Role Count (Distinct)"
    description: "The distinct count of user actual role's per grouping."
    type: count_distinct
    sql: ${user_actual_role} ;;
  }

  measure: user_actual_role_count_all {
    label: "User Actual Role Count"
    description: "The count of all non-null user actual role occurrences per grouping."
    type: number
    sql: COUNT(case when ${user_actual_role} IS NOT NULL then ${user_actual_role} else null end) ;;
  }

  measure: context_screen_density_count {
    label: "Context Screen Density Count (Distinct)"
    description: "The distinct count of context screen density's per grouping."
    type: count_distinct
    sql: ${context_screen_density} ;;
  }

  measure: context_screen_density_count_all {
    label: "Context Screen Density Count"
    description: "The count of all non-null context screen density occurrences per grouping."
    type: number
    sql: COUNT(case when ${context_screen_density} IS NOT NULL then ${context_screen_density} else null end) ;;
  }

  measure: context_timezone_count {
    label: "Context Timezone Count (Distinct)"
    description: "The distinct count of context timezone's per grouping."
    type: count_distinct
    sql: ${context_timezone} ;;
  }

  measure: context_timezone_count_all {
    label: "Context Timezone Count"
    description: "The count of all non-null context timezone occurrences per grouping."
    type: number
    sql: COUNT(case when ${context_timezone} IS NOT NULL then ${context_timezone} else null end) ;;
  }

  measure: context_traits_anonymousid_count {
    label: "Context Traits Anonymousid Count (Distinct)"
    description: "The distinct count of context traits anonymousid's per grouping."
    type: count_distinct
    sql: ${context_traits_anonymousid} ;;
  }

  measure: context_traits_anonymousid_count_all {
    label: "Context Traits Anonymousid Count"
    description: "The count of all non-null context traits anonymousid occurrences per grouping."
    type: number
    sql: COUNT(case when ${context_traits_anonymousid} IS NOT NULL then ${context_traits_anonymousid} else null end) ;;
  }

  measure: context_device_manufacturer_count {
    label: "Context Device Manufacturer Count (Distinct)"
    description: "The distinct count of context device manufacturer's per grouping."
    type: count_distinct
    sql: ${context_device_manufacturer} ;;
  }

  measure: context_device_manufacturer_count_all {
    label: "Context Device Manufacturer Count"
    description: "The count of all non-null context device manufacturer occurrences per grouping."
    type: number
    sql: COUNT(case when ${context_device_manufacturer} IS NOT NULL then ${context_device_manufacturer} else null end) ;;
  }

  measure: context_traits_device_istablet_count {
    label: "Context Traits Device Istablet Count (Distinct)"
    description: "The distinct count of context traits device istablet's per grouping."
    type: count_distinct
    sql: ${context_traits_device_istablet} ;;
  }

  measure: context_traits_device_istablet_count_all {
    label: "Context Traits Device Istablet Count"
    description: "The count of all non-null context traits device istablet occurrences per grouping."
    type: number
    sql: COUNT(case when ${context_traits_device_istablet} IS NOT NULL then ${context_traits_device_istablet} else null end) ;;
  }

  measure: context_useragent_count {
    label: "Context Useragent Count (Distinct)"
    description: "The distinct count of context useragent's per grouping."
    type: count_distinct
    sql: ${context_useragent} ;;
  }

  measure: context_useragent_count_all {
    label: "Context Useragent Count"
    description: "The count of all non-null context useragent occurrences per grouping."
    type: number
    sql: COUNT(case when ${context_useragent} IS NOT NULL then ${context_useragent} else null end) ;;
  }

  measure: context_device_name_count {
    label: "Context Device Name Count (Distinct)"
    description: "The distinct count of context device name's per grouping."
    type: count_distinct
    sql: ${context_device_name} ;;
  }

  measure: context_device_name_count_all {
    label: "Context Device Name Count"
    description: "The count of all non-null context device name occurrences per grouping."
    type: number
    sql: COUNT(case when ${context_device_name} IS NOT NULL then ${context_device_name} else null end) ;;
  }

  measure: context_traits_device_os_count {
    label: "Context Traits Device Os Count (Distinct)"
    description: "The distinct count of context traits device os's per grouping."
    type: count_distinct
    sql: ${context_traits_device_os} ;;
  }

  measure: context_traits_device_os_count_all {
    label: "Context Traits Device Os Count"
    description: "The count of all non-null context traits device os occurrences per grouping."
    type: number
    sql: COUNT(case when ${context_traits_device_os} IS NOT NULL then ${context_traits_device_os} else null end) ;;
  }

  measure: from_background_count {
    label: "From Background Count (Distinct)"
    description: "The distinct count of from background's per grouping."
    type: count_distinct
    sql: ${from_background} ;;
  }

  measure: from_background_count_all {
    label: "From Background Count"
    description: "The count of all non-null from background occurrences per grouping."
    type: number
    sql: COUNT(case when ${from_background} IS NOT NULL then ${from_background} else null end) ;;
  }


}
