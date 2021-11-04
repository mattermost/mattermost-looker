
# This is the view file for the analytics.events.performance_events table.
view: performance_events {
sql_table_name: events.performance_events ;;
view_label: " Performance Events"



### SETS



### DIMENSIONS



  dimension: _dbt_source_relation {
    label: " Dbt Source Relation"
    description: "The  Dbt Source Relation of the user performing the event."
    type: string
    sql: ${TABLE}._dbt_source_relation ;;
    hidden: yes
  }


  dimension: context_page_referrer {
    label: "Context Page Referrer"
    group_label: "Context/User Agent Details"
    description: "The Context Page Referrer of the user performing the event."
    type: string
    sql: ${TABLE}.context_page_referrer ;;
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


  dimension: context_page_url {
    label: "Context Page Url"
    group_label: "Context/User Agent Details"
    description: "The Context Page Url of the user performing the event."
    type: string
    sql: ${TABLE}.context_page_url ;;
  }


  dimension: context_os_name {
    label: "Context Os Name"
    group_label: "Context/User Agent Details"
    description: "The Context Os Name of the user performing the event."
    type: string
    sql: ${TABLE}.context_os_name ;;
  }


  dimension: context_page_title {
    label: "Context Page Title"
    group_label: "Context/User Agent Details"
    description: "The Context Page Title of the user performing the event."
    type: string
    sql: ${TABLE}.context_page_title ;;
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


  dimension: context_page_search {
    label: "Context Page Search"
    group_label: "Context/User Agent Details"
    description: "The Context Page Search of the user performing the event."
    type: string
    sql: ${TABLE}.context_page_search ;;
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


  dimension: context_useragent {
    label: "Context Useragent"
    group_label: "Context/User Agent Details"
    description: "The Context Useragent of the user performing the event."
    type: string
    sql: ${TABLE}.context_useragent ;;
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



  dimension: context_page_path {
    label: "Context Page Path"
    group_label: "Context/User Agent Details"
    description: "The Context Page Path of the user performing the event."
    type: string
    sql: ${TABLE}.context_page_path ;;
  }


  dimension: context_os_version {
    label: "Context Os Version"
    group_label: "Context/User Agent Details"
    description: "The Context Os Version of the user performing the event."
    type: string
    sql: ${TABLE}.context_os_version ;;
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



  dimension: user_id {
    label: " Instance Id"
    description: "The User Id (Instance ID) of the user performing the event."
    type: string
    sql: COALESCE(${TABLE}.user_id, ${TABLE}.userid) ;;
  }


  dimension: root_id {
    label: "Root Id"
    description: "The Root Id of the user performing the event."
    type: string
    sql: ${TABLE}.root_id ;;
  }


  dimension: post_id {
    label: "Post Id"
    description: "The Post Id of the user performing the event."
    type: string
    sql: ${TABLE}.post_id ;;
  }


  dimension: sort {
    label: "Sort"
    description: "The Sort of the user performing the event."
    type: string
    sql: ${TABLE}.sort ;;
  }


  dimension: team_id {
    label: "Team Id"
    description: "The Team Id of the user performing the event."
    type: string
    sql: ${TABLE}.team_id ;;
  }

  dimension: version {
    label: "Version"
    description: "The Version of the user performing the event."
    type: string
    sql: ${TABLE}.version ;;
  }


  dimension: keyword {
    label: "Keyword"
    description: "The Keyword of the user performing the event."
    type: string
    sql: ${TABLE}.keyword ;;
  }


  dimension: count {
    label: "Count"
    description: "The Count of the instance."
    type: string
    sql: ${TABLE}.count ;;
  }



  dimension: gfyid {
    label: "Gfyid"
    description: "The Gfyid of the user performing the event."
    type: string
    sql: ${TABLE}.gfyid ;;
  }


  dimension: field {
    label: "Field"
    description: "The Field of the user performing the event."
    type: string
    sql: ${TABLE}.field ;;
  }


  dimension: plugin_id {
    label: "Plugin Id"
    description: "The Plugin Id of the user performing the event."
    type: string
    sql: ${TABLE}.plugin_id ;;
  }


  dimension: installed_version {
    label: "Installed Version"
    description: "The Installed Version of the user performing the event."
    type: string
    sql: ${TABLE}.installed_version ;;
  }


  dimension: group_constrained {
    label: "Group Constrained"
    description: "Indicates Group Constrained is marked true/enabled."
    type: yesno
    sql: ${TABLE}.group_constrained ;;
  }


  dimension: value {
    label: "Value"
    description: "The Value of the user performing the event."
    type: string
    sql: ${TABLE}.value ;;
  }


  dimension: include_deleted {
    label: "Include Deleted"
    description: "Indicates Include Deleted is marked true/enabled."
    type: yesno
    sql: ${TABLE}.include_deleted ;;
  }



  dimension: role {
    label: "Role"
    description: "The Role of the user performing the event."
    type: string
    sql: ${TABLE}.role ;;
  }


  dimension: privacy {
    label: "Privacy"
    description: "The Privacy of the user performing the event."
    type: string
    sql: ${TABLE}.privacy ;;
  }


  dimension: scheme_id {
    label: "Scheme Id"
    description: "The Scheme Id of the user performing the event."
    type: string
    sql: ${TABLE}.scheme_id ;;
  }


  dimension: warnmetricid {
    label: "Warnmetricid"
    description: "The Warnmetricid attribute of the triggered event."
    type: string
    sql: ${TABLE}.warnmetricid ;;
  }


  dimension: metric {
    label: "Metric"
    description: "The Metric attribute of the triggered event."
    type: string
    sql: ${TABLE}.metric ;;
  }


  dimension: error {
    label: "Error"
    description: "The Error attribute of the triggered event."
    type: string
    sql: ${TABLE}.error ;;
  }


  dimension: num_invitations_sent {
    label: "Num Invitations Sent"
    description: "The Num Invitations Sent attribute of the invite members event."
    type: string
    sql: ${TABLE}.num_invitations_sent ;;
  }


  dimension: num_invitations {
    label: "Num Invitations"
    description: "The Num Invitations attribute of the invite members event."
    sql: ${TABLE}.num_invitations ;;
  }



  dimension: channel_sidebar {
    label: "Channel Sidebar"
    description: "Indicates Channel Sidebar is marked true/enabled."
    type: yesno
    sql: ${TABLE}.channel_sidebar ;;
  }



  dimension: app {
    label: "App"
    description: "The App associated with the triggered event."
    type: string
    sql: ${TABLE}.app ;;
  }


  dimension: method {
    label: "Method"
    description: "The Method associated with the triggered event."
    type: string
    sql: ${TABLE}.method ;;
  }


  dimension: remaining {
    label: "Remaining"
    description: "The Remaining attribute associated with the triggered event."
    type: string
    sql: ${TABLE}.remaining ;;
  }



  dimension: screen {
    label: "Screen"
    description: "The Screen attribute associated with the triggered event."
    type: string
    sql: ${TABLE}.screen ;;
  }


  dimension: filter {
    label: "Filter"
    description: "The Filter attribute associated with the triggered event."
    type: string
    sql: ${TABLE}.filter ;;
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



  dimension_group: uuid_ts {
    label: "Uuid Ts"
    type: time
    timeframes: [time, hour_of_day, hour6, date, week, month, year, fiscal_quarter, fiscal_year, day_of_week, fiscal_month_num,
    week_of_year, day_of_year, day_of_week_index, month_name, day_of_month, fiscal_quarter_of_year]
    sql: ${TABLE}.uuid_ts::date ;;

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



  measure: user_actual_id_count {
    label: " User Count"
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



  measure: user_id_count {
    label: " Instance Count"
    description: "The distinct count of User Id's (Instance ID's) within the grouping."
    type: count_distinct
    sql: ${user_id} ;;
  }


  measure: plugin_id_count {
    group_label: "Plugin Counts"
    label: "Plugin Id Count"
    description: "The distinct count of Plugin Id's within the grouping."
    type: count_distinct
    sql: ${plugin_id} ;;
  }


  measure: num_invitations_sum {
    group_label: "Num Invitations Measures"
    label: "Num Invitations (Sum)"
    description: "The sum of Num Invitations across all instances within the grouping."
    type: sum
    sql: ${num_invitations} ;;
  }

  measure: num_invitations_avg {
    group_label: "Num Invitations Measures"
    label: "Num Invitations (Avg)"
    description: "The average Num Invitations across all instances within the grouping."
    type: average
    sql: ${num_invitations} ;;
  }

  measure: num_invitations_median {
    group_label: "Num Invitations Measures"
    label: "Num Invitations (Med)"
    description: "The median Num Invitations across all instances within the grouping."
    type: median
    sql: ${num_invitations} ;;
  }


  measure: remaining_sum {
    group_label: "Remaining Measures"
    label: "Remaining (Sum)"
    description: "The sum of Remaining across all instances within the grouping."
    type: sum
    sql: ${remaining} ;;
  }

  measure: remaining_avg {
    group_label: "Remaining Measures"
    label: "Remaining (Avg)"
    description: "The average Remaining across all instances within the grouping."
    type: average
    sql: ${remaining} ;;
  }

  measure: remaining_median {
    group_label: "Remaining Measures"
    label: "Remaining (Med)"
    description: "The median Remaining across all instances within the grouping."
    type: median
    sql: ${remaining} ;;
  }



    }
