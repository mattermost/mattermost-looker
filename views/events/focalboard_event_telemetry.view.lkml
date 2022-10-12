
# This is the view file for the analytics.events.focalboard_event_telemetry table.
view: focalboard_event_telemetry {
sql_table_name: events.focalboard_event_telemetry ;;
view_label: "User Events Telemetry (Boards)"



### SETS



### DIMENSIONS



  dimension: _dbt_source_relation {
    label: " Dbt Source Relation"
    description: "The  Dbt Source Relation of the user performing the event."
    type: string
    sql: ${TABLE}._dbt_source_relation ;;
  }


  dimension: category {
    label: "Category"
    description: "The Category of the user performing the event."
    type: string
    sql: ${TABLE}.category ;;
  }


  dimension: context_app_name {
    label: "Context App Name"
    description: "The Context App Name of the user performing the event."
    type: string
    sql: ${TABLE}.context_app_name ;;
  }


  dimension: context_app_namespace {
    label: "Context App Namespace"
    description: "The Context App Namespace of the user performing the event."
    type: string
    sql: ${TABLE}.context_app_namespace ;;
  }


  dimension: context_app_build {
    label: "Context App Build"
    description: "The Context App Build of the user performing the event."
    type: string
    sql: ${TABLE}.context_app_build ;;
  }


  dimension: anonymous_id {
    label: "Anonymous Id"
    description: "The Anonymous Id of the user performing the event."
    type: string
    sql: ${TABLE}.anonymous_id ;;
  }


  dimension: context_locale {
    label: "Context Locale"
    description: "The Context Locale of the user performing the event."
    type: string
    sql: ${TABLE}.context_locale ;;
  }


  dimension: user_actual_id {
    label: "User Id"
    description: "The distinct User Id of the user performing the event."
    type: string
    sql: ${TABLE}.user_actual_id ;;
  }


  dimension: context_request_ip {
    label: "Context Request Ip"
    description: "The Context Request Ip of the user performing the event."
    type: string
    sql: ${TABLE}.context_request_ip ;;
  }


  dimension: event {
    label: "Event"
    description: "The Event of the user performing the event."
    type: string
    sql: ${TABLE}.event ;;
  }


  dimension: context_ip {
    label: "Context Ip"
    description: "The Context Ip of the user performing the event."
    type: string
    sql: ${TABLE}.context_ip ;;
  }


  dimension: context_library_name {
    label: "Context Library Name"
    description: "The Context Library Name of the user performing the event."
    type: string
    sql: ${TABLE}.context_library_name ;;
  }


  dimension: context_library_version {
    label: "Context Library Version"
    description: "The Context Library Version of the user performing the event."
    type: string
    sql: ${TABLE}.context_library_version ;;
  }


  dimension: context_screen_density {
    label: "Context Screen Density"
    description: "The Context Screen Density of the instance."
    type: string
    sql: ${TABLE}.context_screen_density ;;
  }



  dimension: view_type {
    label: "View Type"
    description: "The View Type of the user performing the event."
    type: string
    sql: ${TABLE}.view_type ;;
  }


  dimension: workspace_id {
    label: "Workspace Id"
    group_label: "Block Id"
    description: "ID of the workspace."
    type: string
    sql: ${TABLE}.workspace_id ;;
  }


  dimension: board_id {
    label: "Board Id"
    group_label: "Block Id"
    description: "ID of the coard."
    type: string
    sql: ${TABLE}.board ;;
  }


  dimension: view_id {
    label: "View Id"
    group_label: "Block Id"
    description: "ID of the view."
    type: string
    sql: ${TABLE}._view ;;
  }


  dimension: card_id {
    label: "Card Id"
    group_label: "Block Id"
    description: "ID of the card."
    type: string
    sql: ${TABLE}.card ;;
  }


  dimension: board_template_id {
    label: "Board template Id"
    group_label: "Block Id"
    description: "ID of the board template."
    type: string
    sql: ${TABLE}.board_template_id ;;
  }


  dimension: card_template_id {
    label: "Card template Id"
    group_label: "Block Id"
    description: "ID of the card template."
    type: string
    sql: ${TABLE}.card_template_id ;;
  }


  dimension: share_board_enabled {
    label: "Share board enabled"
    description: "Is share board enabled."
    type: string
    sql: ${TABLE}.share_board_enabled ;;
  }


  dimension: context_passed_ip {
    label: "Context Passed Ip"
    description: "The Context Passed Ip of the user performing the event."
    type: string
    sql: ${TABLE}.context_passed_ip ;;
  }


  dimension: event_text {
    label: "Event Text"
    description: "The Event Text of the user performing the event."
    type: string
    sql: ${TABLE}.event_text ;;
  }


  dimension: channel {
    label: "Channel"
    description: "The Channel of the user performing the event."
    type: string
    sql: ${TABLE}.channel ;;
  }


  dimension: user_id {
    label: "Instance Id"
    description: "The User Id (Instance ID) of the user performing the event."
    type: string
    sql: ${TABLE}.user_id ;;
  }


  dimension: id {
    label: "Id"
    description: "The Id of the user performing the event."
    type: string
    sql: ${TABLE}.id ;;
  }


  dimension: type {
    label: "Type"
    description: "The Type of the user performing the event."
    type: string
    sql: ${TABLE}.type ;;
  }


  dimension: context_user_agent {
    label: "Context User Agent"
    description: "The Context User Agent of the user performing the event."
    type: string
    sql: ${TABLE}.context_user_agent ;;
  }


  dimension: context_app_version {
    label: "Context App Version"
    description: "The Context App Version of the user performing the event."
    type: string
    sql: ${TABLE}.context_app_version ;;
  }


### DATES & TIMESTAMPS



  dimension_group: timestamp {
    label: "Event"
    type: time
    timeframes: [time, hour_of_day, hour6, date, week, month, year, fiscal_quarter, fiscal_year, day_of_week, fiscal_month_num,
    week_of_year, day_of_year, day_of_week_index, month_name, day_of_month, fiscal_quarter_of_year]
    sql: ${TABLE}.timestamp ;;
  }

  dimension_group: active_user_date {
    label: "Active User"
    description: "Use with Active User/Instance Dimensions to enable Daily, Weekly & Monthly active user/instance functionality with this explore."
    type: time
    timeframes: [date, week, month, year, fiscal_quarter, fiscal_year, day_of_week, fiscal_month_num,
      week_of_year, day_of_year, day_of_week_index, month_name, day_of_month, fiscal_quarter_of_year,raw]
    convert_tz: no
    sql: ${dates.date_raw} ;;

  }



  dimension_group: received_at {
    label: "Received At"
    type: time
    timeframes: [time, hour_of_day, hour6, date, week, month, year, fiscal_quarter, fiscal_year, day_of_week, fiscal_month_num,
    week_of_year, day_of_year, day_of_week_index, month_name, day_of_month, fiscal_quarter_of_year]
    sql: ${TABLE}.received_at::date ;;

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



  dimension_group: sent_at {
    label: "Sent At"
    type: time
    timeframes: [time, hour_of_day, hour6, date, week, month, year, fiscal_quarter, fiscal_year, day_of_week, fiscal_month_num,
    week_of_year, day_of_year, day_of_week_index, month_name, day_of_month, fiscal_quarter_of_year]
    sql: ${TABLE}.sent_at::date ;;

    hidden: yes
  }



  dimension_group: original_timestamp {
    label: "Original Timestamp"
    type: time
    timeframes: [time, hour_of_day, hour6, date, week, month, year, fiscal_quarter, fiscal_year, day_of_week, fiscal_month_num,
    week_of_year, day_of_year, day_of_week_index, month_name, day_of_month, fiscal_quarter_of_year]
    sql: ${TABLE}.original_timestamp::date ;;

    hidden: yes
  }



### MEASURES



  measure: user_actual_id_count {
    group_label: "User Counts"
    label: "User Count"
    description: "The distinct count of User Actual Id's (User ID's) within the grouping."
    type: count_distinct
    sql: ${user_actual_id} ;;
  }

  measure: daily_active_users {
    group_label: "Active User Measures (DAU, WAU, MAU)"
    label: "Daily Active Users"
    description: "The count of daily active users on the given active user date."
    type: count_distinct
    sql: CASE WHEN ${active_user_date_raw} = ${timestamp_date} THEN ${user_actual_id} ELSE NULL END ;;
  }

  measure: weekly_active_users {
    group_label: "Active User Measures (DAU, WAU, MAU)"
    label: "Weekly Active Users"
    description: "The count of Weekly active users on the given active user date."
    type: count_distinct
    sql: CASE WHEN ${timestamp_date} <= ${active_user_date_raw} and ${timestamp_date} >= ${active_user_date_raw} - 7 THEN ${user_actual_id} ELSE NULL END ;;
  }

  measure: monthly_active_users {
    group_label: "Active User Measures (DAU, WAU, MAU)"
    label: "Monthly Active Users"
    description: "The count of monthly active users on the given active user date."
    type: count_distinct
    sql: CASE WHEN ${active_user_date_raw} IS NOT NULL THEN ${user_actual_id} ELSE NULL END ;;
  }

  measure: daily_active_instances {
    group_label: "Active Instance Measures (DAI, WAI, MAI)"
    label: "Daily Active Instances"
    description: "The count of daily active instances on the given active user date."
    type: count_distinct
    sql: CASE WHEN ${active_user_date_raw} = ${timestamp_date} THEN ${user_id} ELSE NULL END ;;
  }

  measure: weekly_active_instances {
    group_label: "Active Instance Measures (DAI, WAI, MAI)"
    label: "Weekly Active Instances"
    description: "The count of Weekly active instances on the given active user date."
    type: count_distinct
    sql: CASE WHEN ${timestamp_date} <= ${active_user_date_raw} and ${timestamp_date} >= ${active_user_date_raw} - 7 THEN ${user_id} ELSE NULL END ;;
  }

  measure: monthly_active_instances {
    group_label: "Active Instance Measures (DAI, WAI, MAI)"
    label: "Monthly Active Instances"
    description: "The count of monthly active instances on the given active user date."
    type: count_distinct
    sql: CASE WHEN ${active_user_date_raw} IS NOT NULL THEN ${user_id} ELSE NULL END ;;
  }

  measure: context_screen_density_sum {
    group_label: "Context Screen Density Measures"
    label: "Context Screen Density (Sum)"
    description: "The sum of Context Screen Density across all instances within the grouping."
    type: sum
    sql: ${context_screen_density} ;;
  }

  measure: context_screen_density_avg {
    group_label: "Context Screen Density Measures"
    label: "Context Screen Density (Avg)"
    description: "The average Context Screen Density across all instances within the grouping."
    type: average
    sql: ${context_screen_density} ;;
  }

  measure: context_screen_density_median {
    group_label: "Context Screen Density Measures"
    label: "Context Screen Density (Med)"
    description: "The median Context Screen Density across all instances within the grouping."
    type: median
    sql: ${context_screen_density} ;;
  }

  measure: count {
    type: count
    label: "Event Count"
  }



  measure: user_id_count {
    group_label: "Instance Counts"
    label: "Instance Count"
    description: "The distinct count of User Id's (Instance ID's) within the grouping."
    type: count_distinct
    sql: ${user_id} ;;
  }




    }
