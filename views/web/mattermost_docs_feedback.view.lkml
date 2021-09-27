
# This is the view file for the analytics.web.mattermost_docs_feedback table.
view: mattermost_docs_feedback {
sql_table_name: web.mattermost_docs_feedback ;;
view_label: "Mattermost Docs Feedback"



### SETS



### DIMENSIONS



  dimension: _dbt_source_relation {
    label: " Dbt Source Relation"
    description: "The  Dbt Source Relation of the Mattermost Docs user feedback record."
    type: string
    sql: ${TABLE}._dbt_source_relation ;;
    hidden: yes
  }


  dimension: context_app_version {
    label: "Context App Version"
    description: "The Context App Version of the Mattermost Docs user feedback record."
    type: string
    sql: ${TABLE}.context_app_version ;;
  }


  dimension: context_screen_width {
    label: "Context Screen Width"
    description: "The Context Screen Width of the Mattermost Docs user feedback record."
    type: string
    sql: ${TABLE}.context_screen_width ;;
  }



  dimension: context_page_path {
    label: "Context Page Path"
    description: "The Context Page Path of the Mattermost Docs user feedback record."
    type: string
    sql: ${TABLE}.context_page_path ;;
  }


  dimension: context_page_initial_referrer {
    label: "Context Page Initial Referrer"
    description: "The Context Page Initial Referrer of the Mattermost Docs user feedback record."
    type: string
    sql: ${TABLE}.context_page_initial_referrer ;;
  }


  dimension: context_page_initial_referring_domain {
    label: "Context Page Initial Referring Domain"
    description: "The Context Page Initial Referring Domain of the Mattermost Docs user feedback record."
    type: string
    sql: ${TABLE}.context_page_initial_referring_domain ;;
  }


  dimension: anonymous_id {
    label: "Anonymous Id"
    description: "The Anonymous Id of the Mattermost Docs user feedback record."
    type: string
    sql: ${TABLE}.anonymous_id ;;
  }


  dimension: context_locale {
    label: "Context Locale"
    description: "The Context Locale of the Mattermost Docs user feedback record."
    type: string
    sql: ${TABLE}.context_locale ;;
  }


  dimension: id {
    label: "Id"
    description: "The Id of the specific Mattermost Docs user feedback record."
    type: string
    sql: ${TABLE}.id ;;
  }


  dimension: context_user_agent {
    label: "Context User Agent"
    description: "The Context User Agent of the Mattermost Docs user feedback record."
    type: string
    sql: ${TABLE}.context_user_agent ;;
  }


  dimension: context_page_referring_domain {
    label: "Context Page Referring Domain"
    description: "The Context Page Referring Domain of the Mattermost Docs user feedback record."
    type: string
    sql: ${TABLE}.context_page_referring_domain ;;
  }


  dimension: context_page_url {
    label: "Context Page Url"
    description: "The Context Page Url of the Mattermost Docs user feedback record."
    type: string
    sql: ${TABLE}.context_page_url ;;
  }


  dimension: event {
    label: "Event"
    description: "The Event of the Mattermost Docs user feedback record."
    type: string
    sql: ${TABLE}.event ;;
    hidden: yes
  }


  dimension: event_text {
    label: "Event Text"
    description: "The Event Text of the Mattermost Docs user feedback record."
    type: string
    sql: ${TABLE}.event_text ;;
    hidden: yes
  }


  dimension: context_screen_height {
    label: "Context Screen Height"
    description: "The Context Screen Height of the Mattermost Docs user feedback record."
    type: string
    sql: ${TABLE}.context_screen_height ;;
  }



  dimension: context_screen_inner_height {
    label: "Context Screen Inner Height"
    description: "The Context Screen Inner Height of the Mattermost Docs user feedback record."
    type: string
    sql: ${TABLE}.context_screen_inner_height ;;
  }



  dimension: context_page_tab_url {
    label: "Context Page Tab Url"
    description: "The Context Page Tab Url of the Mattermost Docs user feedback record."
    type: string
    sql: ${TABLE}.context_page_tab_url ;;
  }


  dimension: context_screen_inner_width {
    label: "Context Screen Inner Width"
    description: "The Context Screen Inner Width of the Mattermost Docs user feedback record."
    type: string
    sql: ${TABLE}.context_screen_inner_width ;;
  }



  dimension: context_page_referrer {
    label: "Context Page Referrer"
    description: "The Context Page Referrer of the Mattermost Docs user feedback record."
    type: string
    sql: ${TABLE}.context_page_referrer ;;
  }


  dimension: channel {
    label: "Channel"
    description: "The Channel of the Mattermost Docs user feedback record."
    type: string
    sql: ${TABLE}.channel ;;
  }


  dimension: context_library_version {
    label: "Context Library Version"
    description: "The Context Library Version of the Mattermost Docs user feedback record."
    type: string
    sql: ${TABLE}.context_library_version ;;
  }


  dimension: context_app_build {
    label: "Context App Build"
    description: "The Context App Build of the Mattermost Docs user feedback record."
    type: string
    sql: ${TABLE}.context_app_build ;;
  }


  dimension: context_app_namespace {
    label: "Context App Namespace"
    description: "The Context App Namespace of the Mattermost Docs user feedback record."
    type: string
    sql: ${TABLE}.context_app_namespace ;;
  }


  dimension: user_id {
    label: "User Id"
    description: "The User Id of the Mattermost Docs user feedback record."
    type: string
    sql: ${TABLE}.user_id ;;
  }


  dimension: context_page_title {
    label: "Context Page Title"
    description: "The Context Page Title of the Mattermost Docs user feedback record."
    type: string
    sql: ${TABLE}.context_page_title ;;
  }


  dimension: label {
    label: "Label"
    description: "The Label of the Mattermost Docs user feedback record."
    type: string
    sql: ${TABLE}.label ;;
  }


  dimension: context_request_ip {
    label: "Context Request Ip"
    description: "The Context Request Ip of the Mattermost Docs user feedback record."
    type: string
    sql: ${TABLE}.context_request_ip ;;
  }


  dimension: context_library_name {
    label: "Context Library Name"
    description: "The Context Library Name of the Mattermost Docs user feedback record."
    type: string
    sql: ${TABLE}.context_library_name ;;
  }


  dimension: context_app_name {
    label: "Context App Name"
    description: "The Context App Name of the Mattermost Docs user feedback record."
    type: string
    sql: ${TABLE}.context_app_name ;;
  }


  dimension: context_screen_density {
    label: "Context Screen Density"
    description: "The Context Screen Density of the Mattermost Docs user feedback record."
    type: string
    sql: ${TABLE}.context_screen_density ;;
  }



  dimension: rating {
    label: "Rating"
    description: "The Rating of the Mattermost Docs user feedback record."
    type: string
    sql: ${TABLE}.rating ;;
  }



  dimension: context_ip {
    label: "Context Ip"
    description: "The Context Ip of the Mattermost Docs user feedback record."
    type: string
    sql: ${TABLE}.context_ip ;;
  }


  dimension: feedback {
    label: "Feedback"
    description: "The Feedback of the Mattermost Docs user feedback record."
    type: string
    sql: ${TABLE}.feedback ;;
  }


  dimension: context_traits_portal_customer_id {
    label: "Context Traits Portal Customer Id"
    description: "The Context Traits Portal Customer Id of the Mattermost Docs user feedback record."
    type: string
    sql: ${TABLE}.context_traits_portal_customer_id ;;
  }


  dimension: context_page_search {
    label: "Context Page Search"
    description: "The Context Page Search of the Mattermost Docs user feedback record."
    type: string
    sql: ${TABLE}.context_page_search ;;
  }


### DATES & TIMESTAMPS



  dimension_group: uuid_ts {
    label: "Uuid Ts"
    type: time
    timeframes: [time, date, week, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.uuid_ts::date ;;

    hidden: yes
  }

  dimension: uuid_ts_dayname {
    group_label: "Uuid Ts"
    label: "Uuid Ts Day Name"
    description: "The name of the day of the week that the Uuid Ts occurred on (i.e. Monday ,Tuesday, Wednesday)."
    type: string
    sql: dayname(${uuid_ts_date}::date) ;;

    hidden: yes
  }

  dimension: uuid_ts_dayofweek {
    group_label: "Uuid Ts"
    label: "Uuid Ts Day of Week"
    description: "The day number within the week that the Uuid Ts occurred on (i.e. 1-7)."
    type: number
    sql: extract(dayofweek from ${uuid_ts_date}::date) ;;

    hidden: yes
  }

  dimension: uuid_ts_dayofyear {
    group_label: "Uuid Ts"
    label: "Uuid Ts Day of Year"
    description: "The week number within the year that the Uuid Ts occurred on (i.e. 1-52)."
    type: number
    sql: extract(weekofyear from ${uuid_ts_date}::date) ;;

    hidden: yes
  }



  dimension_group: sent_at {
    label: "Sent At"
    type: time
    timeframes: [time, date, week, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.sent_at::date ;;

    hidden: yes
  }

  dimension: sent_at_dayname {
    group_label: "Sent At"
    label: "Sent At Day Name"
    description: "The name of the day of the week that the Sent At occurred on (i.e. Monday ,Tuesday, Wednesday)."
    type: string
    sql: dayname(${sent_at_date}::date) ;;

    hidden: yes
  }

  dimension: sent_at_dayofweek {
    group_label: "Sent At"
    label: "Sent At Day of Week"
    description: "The day number within the week that the Sent At occurred on (i.e. 1-7)."
    type: number
    sql: extract(dayofweek from ${sent_at_date}::date) ;;

    hidden: yes
  }

  dimension: sent_at_dayofyear {
    group_label: "Sent At"
    label: "Sent At Day of Year"
    description: "The week number within the year that the Sent At occurred on (i.e. 1-52)."
    type: number
    sql: extract(weekofyear from ${sent_at_date}::date) ;;

    hidden: yes
  }



  dimension_group: timestamp {
    label: "Timestamp"
    type: time
    timeframes: [time, date, week, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.timestamp::date ;;

  }

  dimension: timestamp_dayname {
    group_label: "Timestamp"
    label: "Timestamp Day Name"
    description: "The name of the day of the week that the Timestamp occurred on (i.e. Monday ,Tuesday, Wednesday)."
    type: string
    sql: dayname(${timestamp_date}::date) ;;

  }

  dimension: timestamp_dayofweek {
    group_label: "Timestamp"
    label: "Timestamp Day of Week"
    description: "The day number within the week that the Timestamp occurred on (i.e. 1-7)."
    type: number
    sql: extract(dayofweek from ${timestamp_date}::date) ;;

  }

  dimension: timestamp_dayofyear {
    group_label: "Timestamp"
    label: "Timestamp Day of Year"
    description: "The week number within the year that the Timestamp occurred on (i.e. 1-52)."
    type: number
    sql: extract(weekofyear from ${timestamp_date}::date) ;;

  }



  dimension_group: received_at {
    label: "Received At"
    type: time
    timeframes: [time, date, week, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.received_at::date ;;

    hidden: yes
  }

  dimension: received_at_dayname {
    group_label: "Received At"
    label: "Received At Day Name"
    description: "The name of the day of the week that the Received At occurred on (i.e. Monday ,Tuesday, Wednesday)."
    type: string
    sql: dayname(${received_at_date}::date) ;;

    hidden: yes
  }

  dimension: received_at_dayofweek {
    group_label: "Received At"
    label: "Received At Day of Week"
    description: "The day number within the week that the Received At occurred on (i.e. 1-7)."
    type: number
    sql: extract(dayofweek from ${received_at_date}::date) ;;

    hidden: yes
  }

  dimension: received_at_dayofyear {
    group_label: "Received At"
    label: "Received At Day of Year"
    description: "The week number within the year that the Received At occurred on (i.e. 1-52)."
    type: number
    sql: extract(weekofyear from ${received_at_date}::date) ;;

    hidden: yes
  }



  dimension_group: original_timestamp {
    label: "Original Timestamp"
    type: time
    timeframes: [time, date, week, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.original_timestamp::date ;;

    hidden: yes
  }

  dimension: original_timestamp_dayname {
    group_label: "Original Timestamp"
    label: "Original Timestamp Day Name"
    description: "The name of the day of the week that the Original Timestamp occurred on (i.e. Monday ,Tuesday, Wednesday)."
    type: string
    sql: dayname(${original_timestamp_date}::date) ;;

    hidden: yes
  }

  dimension: original_timestamp_dayofweek {
    group_label: "Original Timestamp"
    label: "Original Timestamp Day of Week"
    description: "The day number within the week that the Original Timestamp occurred on (i.e. 1-7)."
    type: number
    sql: extract(dayofweek from ${original_timestamp_date}::date) ;;

    hidden: yes
  }

  dimension: original_timestamp_dayofyear {
    group_label: "Original Timestamp"
    label: "Original Timestamp Day of Year"
    description: "The week number within the year that the Original Timestamp occurred on (i.e. 1-52)."
    type: number
    sql: extract(weekofyear from ${original_timestamp_date}::date) ;;

    hidden: yes
  }



### MEASURES



  measure: context_screen_width_sum {
    group_label: "Context Screen Width Measures"
    label: "Context Screen Width (Sum)"
    description: "The sum of Context Screen Width across all instances within the grouping."
    type: sum
    sql: ${context_screen_width} ;;
    hidden: yes
  }

  measure: context_screen_width_avg {
    group_label: "Context Screen Width Measures"
    label: "Context Screen Width (Avg)"
    description: "The average Context Screen Width across all instances within the grouping."
    type: average
    sql: ${context_screen_width} ;;
    hidden: yes
  }

  measure: context_screen_width_median {
    group_label: "Context Screen Width Measures"
    label: "Context Screen Width (Avg)"
    description: "The median Context Screen Width across all instances within the grouping."
    type: median
    sql: ${context_screen_width} ;;
    hidden: yes
  }



  measure: context_screen_height_sum {
    group_label: "Context Screen Height Measures"
    label: "Context Screen Height (Sum)"
    description: "The sum of Context Screen Height across all instances within the grouping."
    type: sum
    sql: ${context_screen_height} ;;
    hidden: yes
  }

  measure: context_screen_height_avg {
    group_label: "Context Screen Height Measures"
    label: "Context Screen Height (Avg)"
    description: "The average Context Screen Height across all instances within the grouping."
    type: average
    sql: ${context_screen_height} ;;
    hidden: yes
  }

  measure: context_screen_height_median {
    group_label: "Context Screen Height Measures"
    label: "Context Screen Height (Avg)"
    description: "The median Context Screen Height across all instances within the grouping."
    type: median
    sql: ${context_screen_height} ;;
    hidden: yes
  }



  measure: context_screen_inner_height_sum {
    group_label: "Context Screen Inner Height Measures"
    label: "Context Screen Inner Height (Sum)"
    description: "The sum of Context Screen Inner Height across all instances within the grouping."
    type: sum
    sql: ${context_screen_inner_height} ;;
    hidden: yes
  }

  measure: context_screen_inner_height_avg {
    group_label: "Context Screen Inner Height Measures"
    label: "Context Screen Inner Height (Avg)"
    description: "The average Context Screen Inner Height across all instances within the grouping."
    type: average
    sql: ${context_screen_inner_height} ;;
    hidden: yes
  }

  measure: context_screen_inner_height_median {
    group_label: "Context Screen Inner Height Measures"
    label: "Context Screen Inner Height (Avg)"
    description: "The median Context Screen Inner Height across all instances within the grouping."
    type: median
    sql: ${context_screen_inner_height} ;;
    hidden: yes
  }



  measure: context_screen_inner_width_sum {
    group_label: "Context Screen Inner Width Measures"
    label: "Context Screen Inner Width (Sum)"
    description: "The sum of Context Screen Inner Width across all instances within the grouping."
    type: sum
    sql: ${context_screen_inner_width} ;;
    hidden: yes
  }

  measure: context_screen_inner_width_avg {
    group_label: "Context Screen Inner Width Measures"
    label: "Context Screen Inner Width (Avg)"
    description: "The average Context Screen Inner Width across all instances within the grouping."
    type: average
    sql: ${context_screen_inner_width} ;;
    hidden: yes
  }

  measure: context_screen_inner_width_median {
    group_label: "Context Screen Inner Width Measures"
    label: "Context Screen Inner Width (Avg)"
    description: "The median Context Screen Inner Width across all instances within the grouping."
    type: median
    sql: ${context_screen_inner_width} ;;
    hidden: yes
  }



  measure: user_id_count {
    group_label: "Instance Counts"
    label: "User Id"
    description: "The distinct count of user id's within the grouping."
    type: count_distinct
    sql: ${user_id} ;;
  }



  measure: context_screen_density_sum {
    group_label: "Context Screen Density Measures"
    label: "Context Screen Density (Sum)"
    description: "The sum of Context Screen Density across all instances within the grouping."
    type: sum
    sql: ${context_screen_density} ;;
    hidden: yes
  }

  measure: context_screen_density_avg {
    group_label: "Context Screen Density Measures"
    label: "Context Screen Density (Avg)"
    description: "The average Context Screen Density across all instances within the grouping."
    type: average
    sql: ${context_screen_density} ;;
    hidden: yes
  }

  measure: context_screen_density_median {
    group_label: "Context Screen Density Measures"
    label: "Context Screen Density (Avg)"
    description: "The median Context Screen Density across all instances within the grouping."
    type: median
    sql: ${context_screen_density} ;;
    hidden: yes
  }



  measure: rating_sum {
    group_label: "Rating Measures"
    label: "Rating (Sum)"
    description: "The sum of Rating across all instances within the grouping."
    type: sum
    sql: ${rating} ;;
  }

  measure: rating_avg {
    group_label: "Rating Measures"
    label: "Rating (Avg)"
    description: "The average Rating across all instances within the grouping."
    type: average
    sql: ${rating} ;;
  }

  measure: rating_median {
    group_label: "Rating Measures"
    label: "Rating (Avg)"
    description: "The median Rating across all instances within the grouping."
    type: median
    sql: ${rating} ;;
  }



  measure: context_traits_portal_customer_id_count {
    group_label: "Context_Traits_Portal_Customer Counts"
    label: "Context Traits Portal Customer Id"
    description: "The distinct count of context traits portal customer id's within the grouping."
    type: count_distinct
    sql: ${context_traits_portal_customer_id} ;;
    hidden: yes
  }




    }
