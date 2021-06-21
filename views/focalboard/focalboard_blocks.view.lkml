
# This is the view file for the analytics.focalboard.focalboard_blocks table.
view: focalboard_blocks {
sql_table_name: focalboard.focalboard_blocks ;;
view_label: "Focalboard Blocks"



### SETS



### DIMENSIONS



  dimension: context_request_ip {
    label: "Context Request Ip"
    description: "The Context Request Ip of the instance."
    type: string
    sql: ${TABLE}.context_request_ip ;;
  }


  dimension: comment {
    label: "Comment"
    description: "The Comment of the instance."
    type: string
    sql: ${TABLE}.comment ;;
  }



  dimension: divider {
    label: "Divider"
    description: "The Divider of the instance."
    type: string
    sql: ${TABLE}.divider ;;
  }



  dimension: anonymous_id {
    label: "Anonymous Id"
    description: "The Anonymous Id of the instance."
    type: string
    sql: ${TABLE}.anonymous_id ;;
  }


  dimension: text {
    label: "Text"
    description: "The Text of the instance."
    type: string
    sql: ${TABLE}.text ;;
  }



  dimension: context_library_version {
    label: "Context Library Version"
    description: "The Context Library Version of the instance."
    type: string
    sql: ${TABLE}.context_library_version ;;
  }


  dimension: context_ip {
    label: "Context Ip"
    description: "The Context Ip of the instance."
    type: string
    sql: ${TABLE}.context_ip ;;
  }


  dimension: board {
    label: "Board"
    description: "The Board of the instance."
    type: string
    sql: ${TABLE}.board ;;
  }



  dimension: view {
    label: "View"
    description: "The  View of the instance."
    type: string
    sql: ${TABLE}."view" ;;
  }



  dimension: event {
    label: "Event"
    description: "The Event of the instance."
    type: string
    sql: ${TABLE}.event ;;
  }


  dimension: image {
    label: "Image"
    description: "The Image of the instance."
    type: string
    sql: ${TABLE}.image ;;
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


  dimension: card {
    label: "Card"
    description: "The Card of the instance."
    type: string
    sql: ${TABLE}.card ;;
  }



  dimension: user_id {
    label: "User Id"
    description: "The User Id of the instance."
    type: string
    sql: ${TABLE}.user_id ;;
  }


  dimension: checkbox {
    label: "Checkbox"
    description: "The Checkbox of the instance."
    type: string
    sql: ${TABLE}.checkbox ;;
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
    timeframes: [date, week, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.logging_date ;;
  }

  dimension: logging_date_dayname {
    group_label: "Logging "
    label: "Logging Date Day Name"
    description: "The name of the day of the week that the Logging Date occurred on (i.e. Monday ,Tuesday, Wednesday)."
    type: string
    sql: dayname(${logging _date}::date) ;;
  }

  dimension: logging_date_dayofweek {
    group_label: "Logging "
    label: "Logging Date Day of Week"
    description: "The day number within the week that the Logging Date occurred on (i.e. 1-7)."
    type: number
    sql: extract(dayofweek from ${logging _date}::date) ;;
  }

  dimension: logging_date_dayofyear {
    group_label: "Logging "
    label: "Logging Date Day of Year"
    description: "The week number within the year that the Logging Date occurred on (i.e. 1-52)."
    type: number
    sql: extract(weekofyear from ${logging _date}::date) ;;
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
    sql: extract(weekofyear from ${sent_at_date}::date) ;;
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



  dimension_group: timestamp {
    label: "Timestamp"
    type: time
    timeframes: [time, date, week, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.timestamp ;;
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



### MEASURES



  measure: comment_sum {
    group_label: "Comment Measures"
    label: "Comment (Sum)"
    description: "The sum of Comment across all instances within the grouping."
    type: sum
    sql: ${comment} ;;
  }

  measure: comment_avg {
    group_label: "Comment Measures"
    label: "Comment (Avg)"
    description: "The average Comment across all instances within the grouping."
    type: average
    sql: ${comment} ;;
  }

  measure: comment_median {
    group_label: "Comment Measures"
    label: "Comment (Avg)"
    description: "The median Comment across all instances within the grouping."
    type: median
    sql: ${comment} ;;
  }



  measure: divider_sum {
    group_label: "Divider Measures"
    label: "Divider (Sum)"
    description: "The sum of Divider across all instances within the grouping."
    type: sum
    sql: ${divider} ;;
  }

  measure: divider_avg {
    group_label: "Divider Measures"
    label: "Divider (Avg)"
    description: "The average Divider across all instances within the grouping."
    type: average
    sql: ${divider} ;;
  }

  measure: divider_median {
    group_label: "Divider Measures"
    label: "Divider (Avg)"
    description: "The median Divider across all instances within the grouping."
    type: median
    sql: ${divider} ;;
  }



  measure: text_sum {
    group_label: "Text Measures"
    label: "Text (Sum)"
    description: "The sum of Text across all instances within the grouping."
    type: sum
    sql: ${text} ;;
  }

  measure: text_avg {
    group_label: "Text Measures"
    label: "Text (Avg)"
    description: "The average Text across all instances within the grouping."
    type: average
    sql: ${text} ;;
  }

  measure: text_median {
    group_label: "Text Measures"
    label: "Text (Avg)"
    description: "The median Text across all instances within the grouping."
    type: median
    sql: ${text} ;;
  }



  measure: board_sum {
    group_label: "Board Measures"
    label: "Board (Sum)"
    description: "The sum of Board across all instances within the grouping."
    type: sum
    sql: ${board} ;;
  }

  measure: board_avg {
    group_label: "Board Measures"
    label: "Board (Avg)"
    description: "The average Board across all instances within the grouping."
    type: average
    sql: ${board} ;;
  }

  measure: board_median {
    group_label: "Board Measures"
    label: "Board (Avg)"
    description: "The median Board across all instances within the grouping."
    type: median
    sql: ${board} ;;
  }



  measure: view_sum {
    group_label: " View Measures"
    label: " View (Sum)"
    description: "The sum of  View across all instances within the grouping."
    type: sum
    sql: ${view} ;;
  }

  measure: view_avg {
    group_label: " View Measures"
    label: " View (Avg)"
    description: "The average  View across all instances within the grouping."
    type: average
    sql: ${view} ;;
  }

  measure: view_median {
    group_label: " View Measures"
    label: " View (Avg)"
    description: "The median  View across all instances within the grouping."
    type: median
    sql: ${view} ;;
  }



  measure: image_sum {
    group_label: "Image Measures"
    label: "Image (Sum)"
    description: "The sum of Image across all instances within the grouping."
    type: sum
    sql: ${image} ;;
  }

  measure: image_avg {
    group_label: "Image Measures"
    label: "Image (Avg)"
    description: "The average Image across all instances within the grouping."
    type: average
    sql: ${image} ;;
  }

  measure: image_median {
    group_label: "Image Measures"
    label: "Image (Avg)"
    description: "The median Image across all instances within the grouping."
    type: median
    sql: ${image} ;;
  }



  measure: card_sum {
    group_label: "Card Measures"
    label: "Card (Sum)"
    description: "The sum of Card across all instances within the grouping."
    type: sum
    sql: ${card} ;;
  }

  measure: card_avg {
    group_label: "Card Measures"
    label: "Card (Avg)"
    description: "The average Card across all instances within the grouping."
    type: average
    sql: ${card} ;;
  }

  measure: card_median {
    group_label: "Card Measures"
    label: "Card (Avg)"
    description: "The median Card across all instances within the grouping."
    type: median
    sql: ${card} ;;
  }



  measure: user_id_count {
    group_label: "Instance Counts"
    label: "User Id"
    description: "The distinct count of user id's within the grouping."
    type: count_distinct
    sql: ${user_id} ;;
  }



  measure: checkbox_sum {
    group_label: "Checkbox Measures"
    label: "Checkbox (Sum)"
    description: "The sum of Checkbox across all instances within the grouping."
    type: sum
    sql: ${checkbox} ;;
  }

  measure: checkbox_avg {
    group_label: "Checkbox Measures"
    label: "Checkbox (Avg)"
    description: "The average Checkbox across all instances within the grouping."
    type: average
    sql: ${checkbox} ;;
  }

  measure: checkbox_median {
    group_label: "Checkbox Measures"
    label: "Checkbox (Avg)"
    description: "The median Checkbox across all instances within the grouping."
    type: median
    sql: ${checkbox} ;;
  }
}
