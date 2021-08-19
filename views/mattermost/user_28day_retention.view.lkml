
# This is the view file for the analytics.mattermost.user_28day_retention table.
view: user_28day_retention {
sql_table_name: mattermost.user_28day_retention ;;
view_label: "User 28Day Retention"



### SETS


    
### DIMENSIONS



  dimension: server_id {
    label: "Server Id"
    description: "The Server Id of the instance."
    type: string
    sql: ${TABLE}.server_id ;;
  }


  dimension: user_id {
    label: "User Id"
    description: "The User Id of the instance."
    type: string
    sql: ${TABLE}.user_id ;;
  }


  dimension: retained_28day_users {
    label: "Retained 28Day Users"
    description: "Indicates Retained 28Day Users is marked true/enabled."
    type: yesno
    sql: ${TABLE}.retained_28day_users ;;
  }



  dimension: id {
    label: "Id"
    description: "The Id of the instance."
    type: string
    sql: ${TABLE}.id ;;
  }


### DATES & TIMESTAMPS



  dimension_group: first_active_timestamp {
    label: "First Active Timestamp"
    type: time
    timeframes: [time, date, week, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.first_active_timestamp::date ;;
    
  }

  dimension: first_active_timestamp_dayname {
    group_label: "First Active Timestamp"
    label: "First Active Timestamp Day Name"
    description: "The name of the day of the week that the First Active Timestamp occurred on (i.e. Monday ,Tuesday, Wednesday)."
    type: string
    sql: dayname(${first_active_timestamp_date}::date) ;;
    
  } 

  dimension: first_active_timestamp_dayofweek {
    group_label: "First Active Timestamp"
    label: "First Active Timestamp Day of Week"
    description: "The day number within the week that the First Active Timestamp occurred on (i.e. 1-7)."
    type: number
    sql: extract(dayofweek from ${first_active_timestamp_date}::date) ;;
    
  }

  dimension: first_active_timestamp_dayofyear {
    group_label: "First Active Timestamp"
    label: "First Active Timestamp Day of Year"
    description: "The week number within the year that the First Active Timestamp occurred on (i.e. 1-52)."
    type: number
    sql: extract(weekofyear from ${first_active_timestamp_date}::date) ;;
    
  }  



### MEASURES



  measure: server_id_count {
    group_label: "Server Counts"
    label: "Server Id"
    description: "The distinct count of server id's within the grouping."
    type: count_distinct
    sql: ${server_id} ;;
  }



  measure: user_id_count {
    group_label: "Instance Counts"
    label: "User Id"
    description: "The distinct count of user id's within the grouping."
    type: count_distinct
    sql: ${user_id} ;;
  }



  measure: retained_28day_users_count {
    group_label: "Instance Counts"
    label: "Retained 28Day Users"
    description: "The distinct count of servers/workspaces with Retained 28Day Users marked true/enabled."
    type: count_distinct
    sql: CASE WHEN ${retained_28day_users} THEN {} ELSE NULL END;;
  }



    
    }
    