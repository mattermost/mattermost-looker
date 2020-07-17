# This is the view file for the analytics.qa.plugins_telemetry table.
view: plugins_telemetry {
  sql_table_name: qa.plugins_telemetry ;;
  view_label: "Plugins Telemetry"

  # FILTERS

  # DIMENSIONS
  dimension: _dbt_source_relation {
    description: ""
    type: string
    sql: ${TABLE}._dbt_source_relation ;;
    hidden: no
  }

  dimension: channel {
    description: ""
    type: string
    sql: ${TABLE}.channel ;;
    hidden: no
  }

  dimension: user_id {
    description: ""
    type: string
    sql: ${TABLE}.user_id ;;
    hidden: no
  }

  dimension: value {
    description: ""
    type: yesno
    sql: ${TABLE}.value ;;
    hidden: no
  }

  dimension: pluginid {
    description: ""
    type: string
    sql: ${TABLE}.pluginid ;;
    hidden: no
  }

  dimension: event_text {
    description: ""
    type: string
    sql: ${TABLE}.event_text ;;
    hidden: no
  }

  dimension: context_ip {
    description: ""
    type: string
    sql: ${TABLE}.context_ip ;;
    hidden: no
  }

  dimension: pluginversion {
    description: ""
    type: string
    sql: ${TABLE}.pluginversion ;;
    hidden: no
  }

  dimension: context_library_name {
    description: ""
    type: string
    sql: ${TABLE}.context_library_name ;;
    hidden: no
  }

  dimension: anonymous_id {
    description: ""
    type: string
    sql: ${TABLE}.anonymous_id ;;
    hidden: no
  }

  dimension: id {
    description: ""
    type: string
    sql: ${TABLE}.id ;;
    hidden: no
  }

  dimension: event {
    description: ""
    type: string
    sql: ${TABLE}.event ;;
    hidden: no
  }

  dimension: userid {
    description: ""
    type: string
    sql: ${TABLE}.userid ;;
    hidden: no
  }

  dimension: serverversion {
    description: ""
    type: string
    sql: ${TABLE}.serverversion ;;
    hidden: no
  }

  dimension: context_library_version {
    description: ""
    type: string
    sql: ${TABLE}.context_library_version ;;
    hidden: no
  }

  dimension: location {
    description: ""
    type: string
    sql: ${TABLE}.location ;;
    hidden: no
  }

  dimension: useractualid {
    description: ""
    type: string
    sql: ${TABLE}.useractualid ;;
    hidden: no
  }

  dimension: properties {
    sql: OBJECT_CONSTRUCT(*) ;;
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

  dimension_group: received_at {
    label:  " Received At"
    description: "The Received At date time field."
    type: time
    timeframes: [second, date, week, month, year, fiscal_year, fiscal_quarter]
    sql: ${TABLE}.received_at ;;
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

  dimension_group: timestamp {
    label:  " Timestamp"
    description: "The Timestamp date time field."
    type: time
    timeframes: [second, date, week, month, year, fiscal_year, fiscal_quarter]
    sql: ${TABLE}.timestamp ;;
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


  # MEASURES
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

  measure: sent_at_date_count {
    label: "Sent At Date Count (Distinct)"
    description: "The distinct count of sent at date's per grouping."
    type: count_distinct
    sql: ${sent_at_date} ;;
  }

  measure: sent_at_date_count_all {
    label: "Sent At Date Count"
    description: "The count of all non-null sent at date occurrences per grouping."
    type: number
    sql: COUNT(case when ${sent_at_date} IS NOT NULL then ${sent_at_date} else null end) ;;
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

  measure: pluginid_count {
    label: "Pluginid Count (Distinct)"
    description: "The distinct count of pluginid's per grouping."
    type: count_distinct
    sql: ${pluginid} ;;
  }

  measure: pluginid_count_all {
    label: "Pluginid Count"
    description: "The count of all non-null pluginid occurrences per grouping."
    type: number
    sql: COUNT(case when ${pluginid} IS NOT NULL then ${pluginid} else null end) ;;
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

  measure: pluginversion_count {
    label: "Pluginversion Count (Distinct)"
    description: "The distinct count of pluginversion's per grouping."
    type: count_distinct
    sql: ${pluginversion} ;;
  }

  measure: pluginversion_count_all {
    label: "Pluginversion Count"
    description: "The count of all non-null pluginversion occurrences per grouping."
    type: number
    sql: COUNT(case when ${pluginversion} IS NOT NULL then ${pluginversion} else null end) ;;
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

  measure: received_at_date_count {
    label: "Received At Date Count (Distinct)"
    description: "The distinct count of received at date's per grouping."
    type: count_distinct
    sql: ${received_at_date} ;;
  }

  measure: received_at_date_count_all {
    label: "Received At Date Count"
    description: "The count of all non-null received at date occurrences per grouping."
    type: number
    sql: COUNT(case when ${received_at_date} IS NOT NULL then ${received_at_date} else null end) ;;
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

  measure: original_timestamp_date_count {
    label: "Original Timestamp Date Count (Distinct)"
    description: "The distinct count of original timestamp date's per grouping."
    type: count_distinct
    sql: ${original_timestamp_date} ;;
  }

  measure: original_timestamp_date_count_all {
    label: "Original Timestamp Date Count"
    description: "The count of all non-null original timestamp date occurrences per grouping."
    type: number
    sql: COUNT(case when ${original_timestamp_date} IS NOT NULL then ${original_timestamp_date} else null end) ;;
  }

  measure: serverversion_count {
    label: "Serverversion Count (Distinct)"
    description: "The distinct count of serverversion's per grouping."
    type: count_distinct
    sql: ${serverversion} ;;
  }

  measure: serverversion_count_all {
    label: "Serverversion Count"
    description: "The count of all non-null serverversion occurrences per grouping."
    type: number
    sql: COUNT(case when ${serverversion} IS NOT NULL then ${serverversion} else null end) ;;
  }

  measure: timestamp_date_count {
    label: "Timestamp Date Count (Distinct)"
    description: "The distinct count of timestamp date's per grouping."
    type: count_distinct
    sql: ${timestamp_date} ;;
  }

  measure: timestamp_date_count_all {
    label: "Timestamp Date Count"
    description: "The count of all non-null timestamp date occurrences per grouping."
    type: number
    sql: COUNT(case when ${timestamp_date} IS NOT NULL then ${timestamp_date} else null end) ;;
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

  measure: location_count {
    label: "Location Count (Distinct)"
    description: "The distinct count of location's per grouping."
    type: count_distinct
    sql: ${location} ;;
  }

  measure: location_count_all {
    label: "Location Count"
    description: "The count of all non-null location occurrences per grouping."
    type: number
    sql: COUNT(case when ${location} IS NOT NULL then ${location} else null end) ;;
  }

  measure: uuid_ts_date_count {
    label: "Uuid Ts Date Count (Distinct)"
    description: "The distinct count of uuid ts date's per grouping."
    type: count_distinct
    sql: ${uuid_ts_date} ;;
  }

  measure: uuid_ts_date_count_all {
    label: "Uuid Ts Date Count"
    description: "The count of all non-null uuid ts date occurrences per grouping."
    type: number
    sql: COUNT(case when ${uuid_ts_date} IS NOT NULL then ${uuid_ts_date} else null end) ;;
  }

  measure: useractualid_count {
    label: "Useractualid Count (Distinct)"
    description: "The distinct count of useractualid's per grouping."
    type: count_distinct
    sql: ${useractualid} ;;
  }

  measure: useractualid_count_all {
    label: "Useractualid Count"
    description: "The count of all non-null useractualid occurrences per grouping."
    type: number
    sql: COUNT(case when ${useractualid} IS NOT NULL then ${useractualid} else null end) ;;
  }


}
