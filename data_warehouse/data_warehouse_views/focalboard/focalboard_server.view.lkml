# This is the view file for the analytics.focalboard.focalboard_server table.
view: focalboard_server {
  sql_table_name: focalboard.focalboard_server ;;
  view_label: "Focalboard Server"

  # FILTERS

  # DIMENSIONS
  dimension: version {
    description: ""
    type: string
    sql: ${TABLE}.version ;;
    hidden: no
  }

  dimension: context_ip {
    description: ""
    type: string
    sql: ${TABLE}.context_ip ;;
    hidden: no
  }

  dimension: event {
    description: ""
    type: string
    sql: ${TABLE}.event ;;
    hidden: yes
  }

  dimension: build_number {
    description: ""
    type: string
    sql: ${TABLE}.build_number ;;
    hidden: no
  }

  dimension: build_hash {
    description: ""
    type: string
    sql: ${TABLE}.build_hash ;;
    hidden: no
  }

  dimension: context_library_version {
    description: ""
    type: string
    sql: ${TABLE}.context_library_version ;;
    hidden: no
  }

  dimension: edition {
    description: ""
    type: string
    sql: ${TABLE}.edition ;;
    hidden: no
  }

  dimension: event_text {
    description: ""
    type: string
    sql: ${TABLE}.event_text ;;
    hidden: yes
  }

  dimension: anonymous_id {
    description: ""
    type: string
    sql: ${TABLE}.anonymous_id ;;
    hidden: yes
  }

  dimension: context_request_ip {
    description: ""
    type: string
    sql: ${TABLE}.context_request_ip ;;
    hidden: no
  }

  dimension: user_id {
    label: " Server ID"
    description: ""
    type: string
    sql: ${TABLE}.user_id ;;
    hidden: no
  }

  dimension: operating_system {
    description: ""
    type: string
    sql: ${TABLE}.operating_system ;;
    hidden: no
  }

  dimension: id {
    description: ""
    type: string
    sql: ${TABLE}.id ;;
    hidden: yes
  }

  dimension: context_library_name {
    description: ""
    type: string
    sql: ${TABLE}.context_library_name ;;
    hidden: no
  }

  # DIMENSION GROUPS/DATES
  dimension_group: logging {
    label: " Logging"
    description: ""
    type: time
    timeframes: [week, date, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.logging_date ;;
    hidden: no
  }

  dimension_group: timestamp {
  description: ""
  type: time
  timeframes: [time, week, date, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.timestamp ;;
    hidden: no
  }

  dimension_group: original_timestamp {
  description: ""
  type: time
  timeframes: [time, week, date, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.original_timestamp ;;
    hidden: yes
  }

  dimension_group: sent_at {
  description: ""
  type: time
  timeframes: [time, week, date, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.sent_at ;;
    hidden: yes
  }

  dimension_group: uuid_ts {
  description: ""
  type: time
  timeframes: [time, week, date, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.uuid_ts ;;
    hidden: yes
  }

  dimension_group: received_at {
  description: ""
  type: time
  timeframes: [time, week, date, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.received_at ;;
    hidden: yes
  }


  # MEASURES
  measure: count {
    description: "Count of rows/occurrences."
    type: count
  }

  measure: anonymous_count {
    label: " Anonymous Count"
    description: "The distinct count of Focalboard Server Anonymouss within each grouping."
    type: count_distinct
    sql: ${anonymous_id} ;;
    hidden: yes
  }

  measure: user_count {
    label: " Server Count"
    description: "The distinct count of Focalboard instances within each grouping."
    type: count_distinct
    sql: ${user_id} ;;
  }

  measure: id_count {
    label: " Id Count"
    description: "The distinct count of Focalboard Server Id within each grouping."
    type: count_distinct
    sql: ${id} ;;
    hidden: yes
  }


}
