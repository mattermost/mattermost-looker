# This is the view file for the analytics.qa.events_web_desktop_telemetry table.
view: events_web_desktop_telemetry {
  sql_table_name: qa.events_web_desktop_telemetry ;;
  view_label: "Events Web Desktop Telemetry"

  # FILTERS

  # DIMENSIONS
  dimension: _dbt_source_relation {
    description: ""
    type: string
    sql: CASE WHEN regexp_substr(${TABLE}._dbt_source_relation, '_(RC|QA)') = '_RC' THEN 'Release Candidate'
    ELSE 'Quality Assurance (QA)' END ;;
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
  dimension_group: received_at {
    label:  " Received At"
    description: "The Received At date time field."
    type: time
    timeframes: [date, week, month, year, fiscal_year, fiscal_quarter]
    sql: ${TABLE}.received_at ;;
    hidden: no
  }

  dimension_group: uuid_ts {
    label:  " Uuid Ts"
    description: "The Uuid Ts date time field."
    type: time
    timeframes: [date, week, month, year, fiscal_year, fiscal_quarter]
    sql: ${TABLE}.uuid_ts ;;
    hidden: no
  }

  dimension_group: original_timestamp {
    label:  " Original Timestamp"
    description: "The Original Timestamp date time field."
    type: time
    timeframes: [date, week, month, year, fiscal_year, fiscal_quarter]
    sql: ${TABLE}.original_timestamp ;;
    hidden: no
  }

  dimension_group: timestamp {
    label:  " Timestamp"
    description: "The Timestamp date time field."
    type: time
    timeframes: [second, time, date, week, month, year, fiscal_year, fiscal_quarter]
    sql: ${TABLE}.timestamp ;;
    hidden: no
  }

  dimension_group: sent_at {
    label:  " Sent At"
    description: "The Sent At date time field."
    type: time
    timeframes: [second, date, week, month, year, fiscal_year, fiscal_quarter]
    sql: ${TABLE}.sent_at ;;
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

  measure: count_measure {
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

  measure: context_page_referrer_count {
    label: "Context Page Referrer Count (Distinct)"
    description: "The distinct count of context page referrer's per grouping."
    type: count_distinct
    sql: ${context_page_referrer} ;;
  }

  measure: context_page_referrer_count_all {
    label: "Context Page Referrer Count"
    description: "The count of all non-null context page referrer occurrences per grouping."
    type: number
    sql: COUNT(case when ${context_page_referrer} IS NOT NULL then ${context_page_referrer} else null end) ;;
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

  measure: context_page_path_count {
    label: "Context Page Path Count (Distinct)"
    description: "The distinct count of context page path's per grouping."
    type: count_distinct
    sql: ${context_page_path} ;;
  }

  measure: context_page_path_count_all {
    label: "Context Page Path Count"
    description: "The count of all non-null context page path occurrences per grouping."
    type: number
    sql: COUNT(case when ${context_page_path} IS NOT NULL then ${context_page_path} else null end) ;;
  }

  measure: team_id_count {
    label: "Team Id Count (Distinct)"
    description: "The distinct count of team id's per grouping."
    type: count_distinct
    sql: ${team_id} ;;
  }

  measure: team_id_count_all {
    label: "Team Id Count"
    description: "The count of all non-null team id occurrences per grouping."
    type: number
    sql: COUNT(case when ${team_id} IS NOT NULL then ${team_id} else null end) ;;
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

  measure: context_page_url_count {
    label: "Context Page Url Count (Distinct)"
    description: "The distinct count of context page url's per grouping."
    type: count_distinct
    sql: ${context_page_url} ;;
  }

  measure: context_page_url_count_all {
    label: "Context Page Url Count"
    description: "The count of all non-null context page url occurrences per grouping."
    type: number
    sql: COUNT(case when ${context_page_url} IS NOT NULL then ${context_page_url} else null end) ;;
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

  measure: context_page_search_count {
    label: "Context Page Search Count (Distinct)"
    description: "The distinct count of context page search's per grouping."
    type: count_distinct
    sql: ${context_page_search} ;;
  }

  measure: context_page_search_count_all {
    label: "Context Page Search Count"
    description: "The count of all non-null context page search occurrences per grouping."
    type: number
    sql: COUNT(case when ${context_page_search} IS NOT NULL then ${context_page_search} else null end) ;;
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

  measure: context_page_title_count {
    label: "Context Page Title Count (Distinct)"
    description: "The distinct count of context page title's per grouping."
    type: count_distinct
    sql: ${context_page_title} ;;
  }

  measure: context_page_title_count_all {
    label: "Context Page Title Count"
    description: "The count of all non-null context page title occurrences per grouping."
    type: number
    sql: COUNT(case when ${context_page_title} IS NOT NULL then ${context_page_title} else null end) ;;
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

  measure: group_constrained_count {
    label: "Group Constrained Count (Distinct)"
    description: "The distinct count of group constrained's per grouping."
    type: count_distinct
    sql: ${group_constrained} ;;
  }

  measure: group_constrained_count_all {
    label: "Group Constrained Count"
    description: "The count of all non-null group constrained occurrences per grouping."
    type: number
    sql: COUNT(case when ${group_constrained} IS NOT NULL then ${group_constrained} else null end) ;;
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

  measure: duration_count {
    label: "Duration Count (Distinct)"
    description: "The distinct count of duration's per grouping."
    type: count_distinct
    sql: ${duration} ;;
  }

  measure: duration_count_all {
    label: "Duration Count"
    description: "The count of all non-null duration occurrences per grouping."
    type: number
    sql: COUNT(case when ${duration} IS NOT NULL then ${duration} else null end) ;;
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

  measure: post_id_count {
    label: "Post Id Count (Distinct)"
    description: "The distinct count of post id's per grouping."
    type: count_distinct
    sql: ${post_id} ;;
  }

  measure: post_id_count_all {
    label: "Post Id Count"
    description: "The count of all non-null post id occurrences per grouping."
    type: number
    sql: COUNT(case when ${post_id} IS NOT NULL then ${post_id} else null end) ;;
  }

  measure: root_id_count {
    label: "Root Id Count (Distinct)"
    description: "The distinct count of root id's per grouping."
    type: count_distinct
    sql: ${root_id} ;;
  }

  measure: root_id_count_all {
    label: "Root Id Count"
    description: "The count of all non-null root id occurrences per grouping."
    type: number
    sql: COUNT(case when ${root_id} IS NOT NULL then ${root_id} else null end) ;;
  }

  measure: userid_count {
    label: "Userid Count (Distinct)"
    description: "The distinct count of userid's per grouping."
    type: count_distinct
    sql: ${userid} ;;
  }

  measure: userid_count_all {
    label: "Userid Count"
    description: "The count of all non-null userid occurrences per grouping."
    type: number
    sql: COUNT(case when ${userid} IS NOT NULL then ${userid} else null end) ;;
  }

  measure: field_count {
    label: "Field Count (Distinct)"
    description: "The distinct count of field's per grouping."
    type: count_distinct
    sql: ${field} ;;
  }

  measure: field_count_all {
    label: "Field Count"
    description: "The count of all non-null field occurrences per grouping."
    type: number
    sql: COUNT(case when ${field} IS NOT NULL then ${field} else null end) ;;
  }

  measure: scheme_id_count {
    label: "Scheme Id Count (Distinct)"
    description: "The distinct count of scheme id's per grouping."
    type: count_distinct
    sql: ${scheme_id} ;;
  }

  measure: scheme_id_count_all {
    label: "Scheme Id Count"
    description: "The count of all non-null scheme id occurrences per grouping."
    type: number
    sql: COUNT(case when ${scheme_id} IS NOT NULL then ${scheme_id} else null end) ;;
  }

  measure: channelsids_0_count {
    label: "Channelsids 0 Count (Distinct)"
    description: "The distinct count of channelsids 0's per grouping."
    type: count_distinct
    sql: ${channelsids_0} ;;
  }

  measure: channelsids_0_count_all {
    label: "Channelsids 0 Count"
    description: "The count of all non-null channelsids 0 occurrences per grouping."
    type: number
    sql: COUNT(case when ${channelsids_0} IS NOT NULL then ${channelsids_0} else null end) ;;
  }

  measure: sort_count {
    label: "Sort Count (Distinct)"
    description: "The distinct count of sort's per grouping."
    type: count_distinct
    sql: ${sort} ;;
  }

  measure: sort_count_all {
    label: "Sort Count"
    description: "The count of all non-null sort occurrences per grouping."
    type: number
    sql: COUNT(case when ${sort} IS NOT NULL then ${sort} else null end) ;;
  }

  measure: count_count {
    label: "Count Count (Distinct)"
    description: "The distinct count of count's per grouping."
    type: count_distinct
    sql: ${count} ;;
  }

  measure: count_count_all {
    label: "Count Count"
    description: "The count of all non-null count occurrences per grouping."
    type: number
    sql: COUNT(case when ${count} IS NOT NULL then ${count} else null end) ;;
  }

  measure: include_deleted_count {
    label: "Include Deleted Count (Distinct)"
    description: "The distinct count of include deleted's per grouping."
    type: count_distinct
    sql: ${include_deleted} ;;
  }

  measure: include_deleted_count_all {
    label: "Include Deleted Count"
    description: "The count of all non-null include deleted occurrences per grouping."
    type: number
    sql: COUNT(case when ${include_deleted} IS NOT NULL then ${include_deleted} else null end) ;;
  }

  measure: value_count {
    label: "Value Count (Distinct)"
    description: "The distinct count of value's per grouping."
    type: count_distinct
    sql: ${value} ;;
  }

  measure: value_count_all {
    label: "Value Count"
    description: "The count of all non-null value occurrences per grouping."
    type: number
    sql: COUNT(case when ${value} IS NOT NULL then ${value} else null end) ;;
  }

  measure: channel_ids_0_count {
    label: "Channel Ids 0 Count (Distinct)"
    description: "The distinct count of channel ids 0's per grouping."
    type: count_distinct
    sql: ${channel_ids_0} ;;
  }

  measure: channel_ids_0_count_all {
    label: "Channel Ids 0 Count"
    description: "The count of all non-null channel ids 0 occurrences per grouping."
    type: number
    sql: COUNT(case when ${channel_ids_0} IS NOT NULL then ${channel_ids_0} else null end) ;;
  }

  measure: plugin_id_count {
    label: "Plugin Id Count (Distinct)"
    description: "The distinct count of plugin id's per grouping."
    type: count_distinct
    sql: ${plugin_id} ;;
  }

  measure: plugin_id_count_all {
    label: "Plugin Id Count"
    description: "The count of all non-null plugin id occurrences per grouping."
    type: number
    sql: COUNT(case when ${plugin_id} IS NOT NULL then ${plugin_id} else null end) ;;
  }

  measure: version_count {
    label: "Version Count (Distinct)"
    description: "The distinct count of version's per grouping."
    type: count_distinct
    sql: ${version} ;;
  }

  measure: version_count_all {
    label: "Version Count"
    description: "The count of all non-null version occurrences per grouping."
    type: number
    sql: COUNT(case when ${version} IS NOT NULL then ${version} else null end) ;;
  }

  measure: installed_version_count {
    label: "Installed Version Count (Distinct)"
    description: "The distinct count of installed version's per grouping."
    type: count_distinct
    sql: ${installed_version} ;;
  }

  measure: installed_version_count_all {
    label: "Installed Version Count"
    description: "The count of all non-null installed version occurrences per grouping."
    type: number
    sql: COUNT(case when ${installed_version} IS NOT NULL then ${installed_version} else null end) ;;
  }
  }
