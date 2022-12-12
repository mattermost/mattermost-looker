
# This is the view file for the analytics.mattermost.user_28day_retention table.
view: user_28day_retention {
sql_table_name: mattermost.user_28day_retention ;;
view_label: " User 28-Day Retention"



### SETS



### DIMENSIONS



  dimension: server_id {
    label: "Instance Id"
    description: "The Instance Id of the user."
    type: string
    sql: ${TABLE}.server_id ;;
  }


  dimension: user_id {
    label: "User ID"
    description: "The User Id of the user."
    type: string
    sql: ${TABLE}.user_id ;;
  }


  dimension: retained_28day_users {
    label: "Retained 28 Days"
    description: "Boolean: Indicates Retained 28 Day Users is marked true i.e. the user performed an event between the 672nd and 696th hour since their first active timestamp."
    type: yesno
    sql: ${TABLE}.retained_28day_users ;;
  }



  dimension: id {
    label: "Id"
    description: "The unique ID of the user and the user respective instance."
    type: string
    sql: ${TABLE}.id ;;
  }


### DATES & TIMESTAMPS



  dimension_group: first_active_timestamp {
    label: "First Active"
    type: time
    timeframes: [raw, time, date, week, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.first_active_timestamp ;;

  }

  dimension: first_active_timestamp_dayname {
    group_label: "First Active Date"
    label: "First Active Day Name"
    description: "The name of the day of the week that the First Active Timestamp occurred on (i.e. Monday ,Tuesday, Wednesday)."
    type: string
    sql: dayname(${first_active_timestamp_raw}) ;;

  }

  dimension: first_active_timestamp_dayofweek {
    group_label: "First Active Date"
    label: "First Active Day of Week"
    description: "The day number within the week that the First Active Timestamp occurred on (i.e. 1-7)."
    type: number
    sql: extract(dayofweek from ${first_active_timestamp_raw}) ;;

  }

  dimension: first_active_timestamp_dayofyear {
    group_label: "First Active Date"
    label: "First Active Week of Year"
    description: "The week number within the year that the First Active Timestamp occurred on (i.e. 1-52)."
    type: number
    sql: extract(weekofyear from ${first_active_timestamp_raw}) ;;

  }

  dimension_group: retained_28day_timestamp {
    label: "Retained 28-Day"
    description: "The date/time the last event was performed within the 672nd - 696th hour from first active data/time retention timeframe."
    type: time
    timeframes: [raw, time, date, week, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.retained_28day_timestamp ;;

  }

  dimension: retained_28day_timestamp_dayname {
    group_label: "Retained 28-Day Date"
    label: "Retained Day Name"
    description: "The name of the day of the week that the last event was performed within the 672nd - 696th hour from first active data/time retention timeframe occured on (i.e. Monday ,Tuesday, Wednesday)."
    type: string
    sql: dayname(${retained_28day_timestamp_raw}) ;;

  }

  dimension: retained_28day_timestamp_dayofweek {
    group_label: "Retained 28-Day Date"
    label: "Retained Day of Week"
    description: "The day number within the week that the last event was performed within the 672nd - 696th hour from first active data/time retention timeframe occured on (i.e. 1-7)."
    type: number
    sql: extract(dayofweek from ${retained_28day_timestamp_raw}) ;;

  }

  dimension: retained_28day_timestamp_dayofyear {
    group_label: "Retained 28-Day Date"
    label: "RetainedWeek of Year"
    description: "The week number within the year that the last event was performed within the 672nd - 696th hour from first active data/time retention timeframe occured on (i.e. 1-52)."
    type: number
    sql: extract(weekofyear from ${retained_28day_timestamp_raw}) ;;
  }



### MEASURES



  measure: server_id_count {
    group_label: "Instance Counts"
    label: "Instance Count"
    description: "The distinct count of server id's within the grouping."
    type: count_distinct
    sql: ${server_id} ;;
  }



  measure: user_id_count {
    group_label: "User Counts"
    label: "User Count"
    description: "The distinct count of user id's within the grouping."
    type: count_distinct
    sql: ${user_id} ;;
  }



  measure: retained_28day_users_count {
    group_label: "User Counts"
    label: "Retained 28 Day Users"
    description: "The distinct count of servers/workspaces with Retained 28Day Users marked true."
    type: count_distinct
    sql: CASE WHEN ${retained_28day_users} THEN ${user_id} ELSE NULL END;;
  }

  measure: not_retained_28day_users_count {
    group_label: "User Counts"
    label: "Not Retained 28 Day Users"
    description: "The distinct count of servers/workspaces with Retained 28Day Users marked false."
    type: count_distinct
    sql: CASE WHEN not ${retained_28day_users} THEN ${user_id} ELSE NULL END;;
  }

  measure: retention_rate {
    label: "28-Day User Retention Rate"
    description: "The percentage of total Mattermost Messaging users (within the grouped dimension or as a whole) that performed an event on the 28th day (672-696 hours) from their first activity."
    type: number
    sql: ${retained_28day_users_count}::FLOAT/${user_id_count}::FLOAT ;;
    value_format_name: percent_2
  }

  measure: churn_rate {
    label: "28-Day User Churn Rate"
    description: "The percentage of total Mattermost Messaging users (within the grouped dimension or as a whole) that did not perform an event on the 28th day (672-696 hours) from their first activity."
    type: number
    sql: ${not_retained_28day_users_count}::FLOAT/${user_id_count}::FLOAT ;;
    value_format_name: percent_2
  }




    }
