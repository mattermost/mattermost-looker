
view: user_events_by_date {
  sql_table_name: events.user_events_by_date ;;
  view_label: "User Events By Date"

  # FILTERS
  filter: is_system_admin {
    description: "" 
    type: yesno
    sql: ${TABLE}.{system_admin} ;;
    hidden: no
  }

  filter: is_system_user {
    description: "" 
    type: yesno
    sql: ${TABLE}.{system_user} ;;
    hidden: no
  }


  # DIMENSIONS
  dimension: server_id {
    description: "" 
    type: string
    sql: ${TABLE}.{server_id} ;;
    hidden: no
  }

  dimension: user_id {
    description: "" 
    type: string
    sql: ${TABLE}.{user_id} ;;
    hidden: no
  }

  dimension: user_role {
    description: "" 
    type: string
    sql: ${TABLE}.{user_role} ;;
    hidden: no
  }

  dimension: system_admin {
    description: "" 
    type: yesno
    sql: ${TABLE}.{system_admin} ;;
    hidden: yes
  }

  dimension: system_user {
    description: "" 
    type: yesno
    sql: ${TABLE}.{system_user} ;;
    hidden: yes
  }

  dimension: uuid {
    description: "" 
    type: string
    sql: ${TABLE}.{uuid} ;;
    hidden: no
  }

  dimension: event_name {
    description: "" 
    type: string
    sql: ${TABLE}.{event_name} ;;
    hidden: no
  }

  dimension: num_events {
    description: "" 
    type: number
    sql: ${TABLE}.{num_events} ;;
    hidden: no
  }

  
  # DIMENSION GROUPS/DATES
  dimension_group: logging {
    description: "" 
    type: time
    timeframes: [date, month, year]
    sql: ${TABLE}.{date} ;;
    hidden: no
  }

  
  # MEASURES
  measure: count {
    description: "Count of rows/occurrences."
    type: count
  }

  measure: server_id_count {
    description: "The distinct count of Server Id's per grouping."
    type: count_distinct
    sql: ${server_id} ;;
  }

  measure: user_id_count {
    description: "The distinct count of User Id's per grouping."
    type: count_distinct
    sql: ${user_id} ;;
  }

  measure: num_events_sum {
    description: "The sum of Num Events per grouping."
    type: sum
    sql: ${num_events} ;;
  }


}