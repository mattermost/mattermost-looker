
# This is the view file for the analytics.events.performance_events table.
view: performance_events {
sql_table_name: mart_web_app.grp_performance_events ;;
view_label: " Performance Events"



### SETS

### FILTERS

  dimension: cloud_server {
    type: yesno
    description: "Boolean indicating the event was from a Mattermost Cloud workspace (vs. a server using Mattermost's on-prem offering)."
    sql: CASE WHEN ${server_daily_details.installation_id} is not null THEN TRUE
            WHEN ${license_server_fact.cloud_customer} THEN TRUE
            WHEN ${server_fact.installation_id} is not null THEN TRUE
            WHEN (${user_id} = '93mykbogbjfrbbdqphx3zhze5c' AND ${timestamp_date}::date >= '2020-10-09'::date) THEN TRUE
            ELSE FALSE END ;;
  }


### DIMENSIONS



  dimension: _dbt_source_relation {
    label: " Dbt Source Relation"
    description: "The  Dbt Source Relation of the user performing the event."
    type: string
    sql: ${TABLE}._dbt_source_relation ;;
    hidden: yes
  }

  dimension: channel {
    label: "Channel"
    description: "The Channel of the user performing the event."
    type: string
    sql: ${TABLE}.channel ;;
    hidden: yes
  }


  dimension: context_app_namespace {
    label: "Context App Namespace"
    group_label: "Context/User Agent Details"
    description: "The Context App Namespace of the user performing the event."
    type: string
    sql: ${TABLE}.context_app_namespace ;;
  }


  dimension: id {
    label: "Id"
    description: "The Id of the user performing the event."
    type: string
    sql: ${TABLE}.id ;;
    hidden: yes
  }


  dimension: user_actual_id {
    label: " User Id"
    description: "The User Id associated with the user that performed the event."
    type: string
    sql: ${TABLE}.user_actual_id ;;
  }

  dimension: context_library_name {
    label: "Context Library Name"
    group_label: "Context/User Agent Details"
    description: "The Context Library Name of the user performing the event."
    type: string
    sql: ${TABLE}.context_library_name ;;
  }


  dimension: type {
    label: " Event Name (Type)"
    description: "The name of the event performed."
    type: string
    sql: ${TABLE}.type ;;
  }


  dimension: context_app_version {
    label: "Context App Version"
    group_label: "Context/User Agent Details"
    description: "The Context App Version of the user performing the event."
    type: string
    sql: ${TABLE}.context_app_version ;;
  }


  dimension: user_actual_role {
    label: " User Actual Role"
    description: "The User Actual Role of the user performing the event."
    type: string
    sql: ${TABLE}.user_actual_role ;;
  }

  dimension: anonymous_id {
    label: "Anonymous Id"
    description: "The Anonymous Id of the user performing the event."
    type: string
    sql: ${TABLE}.anonymous_id ;;
    hidden: yes
  }


  dimension: context_app_build {
    label: "Context App Build"
    group_label: "Context/User Agent Details"
    description: "The Context App Build of the user performing the event."
    type: string
    sql: ${TABLE}.context_app_build ;;
  }

  dimension: context_library_version {
    label: "Context Library Version"
    group_label: "Context/User Agent Details"
    description: "The Context Library Version of the user performing the event."
    type: string
    sql: ${TABLE}.context_library_version ;;
  }


  dimension: context_ip {
    label: "Context Ip"
    group_label: "Context/User Agent Details"
    description: "The Context Ip of the user performing the event."
    type: string
    sql: ${TABLE}.context_ip ;;
  }


  dimension: context_user_agent {
    label: "Context User Agent"
    group_label: "Context/User Agent Details"
    description: "The Context User Agent of the user performing the event."
    type: string
    sql: ${TABLE}.context_user_agent ;;
  }


  dimension: context_app_name {
    label: "Context App Name"
    group_label: "Context/User Agent Details"
    description: "The Context App Name of the user performing the event."
    type: string
    sql: ${TABLE}.context_app_name ;;
  }


  dimension: context_locale {
    label: "Context Locale"
    group_label: "Context/User Agent Details"
    description: "The Context Locale of the user performing the event."
    type: string
    sql: ${TABLE}.context_locale ;;
  }


  dimension: context_screen_density {
    label: "Context Screen Density"
    group_label: "Context/User Agent Details"
    description: "The Context Screen Density of the instance."
    type: string
    sql: ${TABLE}.context_screen_density ;;
  }

  dimension: category {
    label: " Event Category"
    description: "The category of the event performed."
    type: string
    sql: ${TABLE}.category ;;
  }


  dimension: duration {
    label: "Duration"
    description: "The Duration of the time taken for the performance event to load in milliseconds."
    type: number
    sql: ${TABLE}.duration ;;
  }

  dimension: numOfRequest {
    label: "Number of API requests"
    description: "The number of api requests made by the client for an event."
    type: number
    sql: COALESCE(${TABLE}.num_of_request, ${TABLE}.request_count) ;;
  }

  dimension: maxAPIResourceSize {
    label: "Max API Resource Size"
    description: "Highest size of the api resource in bytes (encoded body size) requested during an event."
    type: number
    sql: ${TABLE}.max_api_resource_size ;;
  }

  dimension: longestAPIResourceDuration {
    label: "Longest API resource duration"
    description: "Duration of the api in milliseconds(ms) which took longest to download during an event."
    type: number
    sql: ${TABLE}.longest_api_resource_duration ;;
  }

  dimension: fresh {
    label: "Fresh"
    description: "Whether or not a performance represents the first time something happened. Available for channel_switch and team_switch events."
    type: string
    sql: ${TABLE}.fresh ;;
  }

  dimension: user_id {
    label: " Instance Id"
    description: "The User Id (Instance ID) of the user performing the event."
    type: string
    sql: ${TABLE}.user_id ;;
  }

  dimension: count {
    label: "Count"
    description: "The Count of the instance."
    type: string
    sql: ${TABLE}.count ;;
  }

  dimension: server_version {
    description: "The Mattermost server version associated with the user's server at the point in time that they submitted the performance event."
    type: string
    sql: CASE WHEN ${cloud_server} THEN 'Cloud' ELSE ${TABLE}.version END ;;
    hidden: no
    order_by_field: server_version_major_sort
  }

  dimension: server_version_major {
    description: "The Mattermost server version (major) associated with the user's server at the point in time that they submitted the performance event."
    type: string
    sql: CASE WHEN ${cloud_server} THEN 'Cloud'
          ELSE SPLIT_PART(regexp_substr(${TABLE}.version,'^[0-9]{0,}[.]{1}[0-9[{0,}[.]{1}[0-9]{0,}[.]{1}[0-9]{0,}'), '.', 1) ||
          '.' || split_part(regexp_substr(${TABLE}.version,'^[0-9]{0,}[.]{1}[0-9[{0,}[.]{1}[0-9]{0,}[.]{1}[0-9]{0,}'), '.', 2) END ;;
    hidden: no
    order_by_field: server_version_major_sort
  }

  dimension: server_version_major_sort {
    group_label: " Server Versions"
    label: "  Server Version: Major (Current)"
    description: "Sorting of major server version."
    type: number
    sql: CASE WHEN ${cloud_server} THEN '1000000'::int
          ELSE (split_part(regexp_substr(${TABLE}.version,'^[0-9]{0,}[.]{1}[0-9[{0,}[.]{1}[0-9]{0,}[.]{1}[0-9]{0,}'), '.', 1) ||
          CASE WHEN split_part(regexp_substr(${TABLE}.version,'^[0-9]{0,}[.]{1}[0-9[{0,}[.]{1}[0-9]{0,}[.]{1}[0-9]{0,}'), '.', 2)::int < 10 THEN
              ('0' || split_part(regexp_substr(${TABLE}.version,'^[0-9]{0,}[.]{1}[0-9[{0,}[.]{1}[0-9]{0,}[.]{1}[0-9]{0,}'), '.', 2))
            WHEN split_part(regexp_substr(${TABLE}.version,'^[0-9]{0,}[.]{1}[0-9[{0,}[.]{1}[0-9]{0,}[.]{1}[0-9]{0,}'), '.', 2) = '10' THEN '99'
            ELSE split_part(regexp_substr(${TABLE}.version,'^[0-9]{0,}[.]{1}[0-9[{0,}[.]{1}[0-9]{0,}[.]{1}[0-9]{0,}'), '.', 2) || '0' END)::int
            END;;
    hidden: yes
  }


### DATES & TIMESTAMPS



  dimension_group: original_timestamp {
    label: "Original Timestamp"
    type: time
    timeframes: [time, hour_of_day, hour6, date, week, month, year, fiscal_quarter, fiscal_year, day_of_week, fiscal_month_num,
    week_of_year, day_of_year, day_of_week_index, month_name, day_of_month, fiscal_quarter_of_year]
    sql: ${TABLE}.original_timestamp::date ;;

    hidden: yes
  }



  dimension_group: sent_at {
    label: "Sent At"
    type: time
    timeframes: [time, hour_of_day, hour6, date, week, month, year, fiscal_quarter, fiscal_year, day_of_week, fiscal_month_num,
    week_of_year, day_of_year, day_of_week_index, month_name, day_of_month, fiscal_quarter_of_year]
    sql: ${TABLE}.sent_at::date ;;

    hidden: yes
  }


  dimension_group: timestamp {
    label: " Logging"
    type: time
    timeframes: [time, hour_of_day, hour6, date, week, month, year, fiscal_quarter, fiscal_year, day_of_week, fiscal_month_num,
    week_of_year, day_of_year, day_of_week_index, month_name, day_of_month, fiscal_quarter_of_year]
    sql: ${TABLE}.received_at ;;
  }



### MEASURES

  measure: event_count {
    label: "Event Count"
    description: "The distinct count of event Id's within the grouping."
    type: count_distinct
    sql: ${id} ;;
  }

  measure: user_actual_id_count {
    label: "User Count"
    description: "The distinct count of User Actual Id's within the grouping."
    type: count_distinct
    sql: ${user_actual_id} ;;
  }

  measure: context_screen_density_sum {
    group_label: "Screen Density Measures"
    label: "Screen Density (Sum)"
    description: "The sum of Context Screen Density across all instances within the grouping."
    type: sum
    sql: ${context_screen_density} ;;
  }

  measure: context_screen_density_avg {
    group_label: "Screen Density Measures"
    label: "Screen Density (Avg)"
    description: "The average Context Screen Density across all instances within the grouping."
    type: average
    sql: ${context_screen_density} ;;
  }

  measure: context_screen_density_median {
    group_label: "Screen Density Measures"
    label: "Screen Density (Med)"
    description: "The median Context Screen Density across all instances within the grouping."
    type: median
    sql: ${context_screen_density} ;;
  }


  measure: duration_sum {
    group_label: "Duration Measures"
    label: "Duration (Sum)"
    description: "The sum of Duration across all instances within the grouping."
    type: sum
    value_format_name: decimal_0
    sql: ${duration} ;;
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

  measure: duration_p99 {
    group_label: "Duration Measures"
    label: "Duration (p99)"
    description: "The 99th percentile Duration across all instances within the grouping."
    type: percentile
    percentile: 99
    sql: ${duration} ;;
    value_format_name: decimal_2
  }

  measure: numOfRequest_avg {
    group_label: "Number of API requests"
    label: "Number of API requests (Avg)"
    description: "The average num of api request across all instances within the grouping."
    type: average
    sql: ${numOfRequest} ;;
    value_format_name: decimal_0
  }

  measure: numOfRequest_median {
    group_label: "Number of API requests"
    label: "Number of API requests (Med)"
    description: "The median num of api request across all instances within the grouping."
    type: median
    sql: ${numOfRequest} ;;
    value_format_name: decimal_0
  }

  measure: maxAPIResourceSize_avg {
    group_label: "Max API Resource Size"
    label: "Max API Resource Size (Avg)"
    description: "The average max api resource size (KB) of api request across all instances within the grouping."
    type: average
    sql: ${maxAPIResourceSize} * 0.0009765625;;
    value_format_name: decimal_1
  }

  measure: maxAPIResourceSize_median {
    group_label: "Max API Resource Size"
    label: "Max API Resource Size (Med)"
    description: "The median max api resource size (KB) of api request across all instances within the grouping."
    type: median
    sql: ${maxAPIResourceSize} * 0.0009765625;;
    value_format_name: decimal_1
  }

  measure: longestAPIResourceDuration_avg {
    group_label: "Longest API resource duration"
    label: "Longest API resource duration (Avg)"
    description: "The average of api resource which took longest to download across all instances within the grouping."
    type: average
    sql: ${longestAPIResourceDuration} ;;
    value_format_name: decimal_1
  }

  measure: longestAPIResourceDuration_median {
    group_label: "Longest API resource duration"
    label: "Longest API resource duration (Med)"
    description: "The median of api resource which took longest to download across all instances within the grouping."
    type: median
    sql: ${longestAPIResourceDuration} ;;
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

  measure: duration_p95 {
    group_label: "Duration Measures"
    label: "Duration (p95)"
    description: "The 95th percentile Duration across all instances within the grouping."
    type: percentile
    percentile: 95
    sql: ${duration} ;;
    value_format_name: decimal_2
  }

  measure: user_id_count {
    label: " Instance Count"
    description: "The distinct count of User Id's (Instance ID's) within the grouping."
    type: count_distinct
    sql: ${user_id} ;;
  }

    }
