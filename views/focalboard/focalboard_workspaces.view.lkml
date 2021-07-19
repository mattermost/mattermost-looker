
# This is the view file for the analytics.focalboard.focalboard_workspaces table.
view: focalboard_workspaces {
sql_table_name: focalboard.focalboard_workspaces ;;
view_label: "Focalboard Workspaces"



### SETS



### DIMENSIONS



  dimension: workspaces {
    label: "Workspaces"
    description: "The Workspaces of the instance."
    type: string
    sql: ${TABLE}.workspaces ;;
  }



  dimension: context_request_ip {
    label: "Context Request Ip"
    description: "The Context Request Ip of the instance."
    type: string
    sql: ${TABLE}.context_request_ip ;;
  }


  dimension: context_library_version {
    label: "Context Library Version"
    description: "The Context Library Version of the instance."
    type: string
    sql: ${TABLE}.context_library_version ;;
  }


  dimension: event {
    label: "Event"
    description: "The Event of the instance."
    type: string
    sql: ${TABLE}.event ;;
  }


  dimension: context_ip {
    label: "Context Ip"
    description: "The Context Ip of the instance."
    type: string
    sql: ${TABLE}.context_ip ;;
  }


  dimension: context_library_name {
    label: "Context Library Name"
    description: "The Context Library Name of the instance."
    type: string
    sql: ${TABLE}.context_library_name ;;
  }


  dimension: event_text {
    label: "Event Text"
    description: "The Event Text of the instance."
    type: string
    sql: ${TABLE}.event_text ;;
  }


  dimension: anonymous_id {
    label: "Anonymous Id"
    description: "The Anonymous Id of the instance."
    type: string
    sql: ${TABLE}.anonymous_id ;;
  }


  dimension: user_id {
    label: "User Id"
    description: "The User Id of the instance."
    type: string
    sql: ${TABLE}.user_id ;;
  }


  dimension: id {
    label: "Id"
    description: "The Id of the instance."
    type: string
    sql: ${TABLE}.id ;;
  }


### DATES & TIMESTAMPS



  dimension_group: logging  {
    label: "Logging "
    type: time
    timeframes: [, date, week, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.logging_date ;;
  }

  dimension: logging_date_dayname {
    group_label: "Logging "
    label: "Logging Date Day Name"
    description: "The name of the day of the week that the Logging Date occurred on (i.e. Monday ,Tuesday, Wednesday)."
    type: string
    sql: dayname(${logging_date}::date) ;;
  }

  dimension: logging_date_dayofweek {
    group_label: "Logging "
    label: "Logging Date Day of Week"
    description: "The day number within the week that the Logging Date occurred on (i.e. 1-7)."
    type: number
    sql: extract(dayofweek from ${logging_date}::date) ;;
  }

  dimension: logging_date_dayofyear {
    group_label: "Logging "
    label: "Logging Date Day of Year"
    description: "The week number within the year that the Logging Date occurred on (i.e. 1-52)."
    type: number
    sql: extract(weekofyear from ${logging_date}::date) ;;
  }



  dimension_group: original_timestamp {
    label: "Original Timestamp"
    type: time
    timeframes: [time, date, week, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.original_timestamp ;;
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



  dimension_group: uuid_ts {
    label: "Uuid Ts"
    type: time
    timeframes: [time, date, week, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.uuid_ts ;;
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



  dimension_group: received_at {
    label: "Received At"
    type: time
    timeframes: [time, date, week, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.received_at ;;
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



  dimension_group: timestamp {
    label: "Timestamp"
    type: time
    timeframes: [time, date, week, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.timestamp ;;
  }

  dimension: timestamp_dayname {
    group_label: "Timestamp Date"
    label: "Timestamp Day Name"
    description: "The name of the day of the week that the Timestamp occurred on (i.e. Monday ,Tuesday, Wednesday)."
    type: string
    sql: dayname(${timestamp_date}::date) ;;
  }

  dimension: timestamp_dayofweek {
    group_label: "Timestamp Date"
    label: "Timestamp Day of Week"
    description: "The day number within the week that the Timestamp occurred on (i.e. 1-7)."
    type: number
    sql: extract(dayofweek from ${timestamp_date}::date) ;;
  }

  dimension: timestamp_dayofyear {
    group_label: "Timestamp Date"
    label: "Timestamp Day of Year"
    description: "The week number within the year that the Timestamp occurred on (i.e. 1-52)."
    type: number
    sql: extract(weekofyear from ${timestamp_date}::date) ;;
  }



  dimension_group: sent_at {
    label: "Sent At"
    type: time
    timeframes: [time, date, week, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.sent_at ;;
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
    sql: extract(weekofyear from ${sent at_date}::date) ;;
            hidden: yes
  }



### MEASURES



  measure: workspaces_sum {
    group_label: "Workspaces Measures"
    label: "Workspaces (Sum)"
    description: "The sum of Workspaces across all instances within the grouping."
    type: sum
    sql: ${workspaces} ;;
  }

  measure: workspaces_avg {
    group_label: "Workspaces Measures"
    label: "Workspaces (Avg)"
    description: "The average Workspaces across all instances within the grouping."
    type: average
    sql: ${workspaces} ;;
    value_format_name: decimal_2
  }

  measure: workspaces_median {
    group_label: "Workspaces Measures"
    label: "Workspaces (Median)"
    description: "The median Workspaces across all instances within the grouping."
    type: median
    sql: ${workspaces} ;;
  }



  measure: user_id_count {
    group_label: "Instance Counts"
    label: "User Id"
    description: "The distinct count of user id's within the grouping."
    type: count_distinct
    sql: ${user_id} ;;
  }
  }
