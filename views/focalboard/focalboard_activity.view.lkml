# This is the view file for the analytics.focalboard.focalboard_activity table.
view: focalboard_activity {
  sql_table_name: focalboard.focalboard_activity ;;
  view_label: "Focalboard Activity"

  # SETS
    set: focalboard_drill {
      fields: [timestamp_date, focalboard_server.server_id, user_id,  license_server_fact.customer_name, focalboard_workspaces.workspaces_sum,
        focalboard_blocks.board_sum, focalboard_blocks.view_sum, focalboard_blocks.card_sum, focalboard_blocks.divider_sum, focalboard_blocks.text_sum,
        focalboard_blocks.image_sum, focalboard_blocks.comment_sum, focalboard_blocks.divider_sum, focalboard_blocks.checkbox_sum,
        focalboard_activity.registered_users, focalboard_activity.daily_active_users, license_server_fact.edition, focalboard_fact.first_active_date, focalboard_fact.last_active_date,
        focalboard_fact.days_active, server_fact.first_active_date, server_fact.last_active_date ]
  }

  # DIMENSIONS
  dimension: weekly_active_users {
    description: ""
    type: number
    sql: ${TABLE}.weekly_active_users ;;
    hidden: no
  }

  dimension: monthly_active_users {
    description: ""
    type: number
    sql: ${TABLE}.monthly_active_users ;;
    hidden: no
  }

  dimension: anonymous_id {
    description: ""
    type: string
    sql: ${TABLE}.anonymous_id ;;
    hidden: yes
  }

  dimension: event {
    description: ""
    type: string
    sql: ${TABLE}.event ;;
    hidden: yes
  }

  dimension: user_id {
    description: ""
    type: string
    sql: ${TABLE}.user_id ;;
    hidden: yes
  }

  dimension: registered_users {
    description: ""
    type: number
    sql: ${TABLE}.registered_users ;;
    hidden: no
  }

  dimension: context_request_ip {
    description: ""
    type: string
    sql: ${TABLE}.context_request_ip ;;
    hidden: yes
  }

  dimension: daily_active_users {
    description: ""
    type: number
    sql: ${TABLE}.daily_active_users ;;
    hidden: no
  }

  dimension: event_text {
    description: ""
    type: string
    sql: ${TABLE}.event_text ;;
    hidden: yes
  }

  dimension: context_library_name {
    description: ""
    type: string
    sql: ${TABLE}.context_library_name ;;
    hidden: yes
  }

  dimension: id {
    description: ""
    type: string
    sql: ${TABLE}.id ;;
    hidden: yes
  }

  dimension: context_library_version {
    description: ""
    type: string
    sql: ${TABLE}.context_library_version ;;
    hidden: yes
  }

  dimension: context_ip {
    description: ""
    type: string
    sql: ${TABLE}.context_ip ;;
    hidden: yes
  }


  # DIMENSION GROUPS/DATES
  dimension_group: logging {
    description: ""
    type: time
    timeframes: [week, date, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.logging_date ;;
    hidden: yes
  }

  dimension_group: received_at {
  description: ""
  type: time
  timeframes: [time, week, date, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.received_at ;;
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

  dimension_group: original_timestamp {
  description: ""
  type: time
  timeframes: [time, week, date, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.original_timestamp ;;
    hidden: yes
  }

  dimension_group: timestamp {
  description: ""
  type: time
  timeframes: [time, week, date, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.timestamp ;;
    hidden: yes
  }


  # MEASURES
  measure: count {
    description: "Count of rows/occurrences."
    type: count
    hidden: yes
  }

  measure: weekly_active_users_sum {
    description: "The sum of Weekly Active Users within each grouping."
    type: sum
    group_label: "Weekly Active Users Measures"
    sql: ${weekly_active_users} ;;
    drill_fields: [focalboard_drill*]
  }

  measure: weekly_active_users_max {
    description: "The max Weekly Active Users within each grouping."
    type: max
    group_label: "Weekly Active Users Measures"
    sql: ${weekly_active_users} ;;
    drill_fields: [focalboard_drill*]
  }

  measure: weekly_active_users_min {
    description: "The min Weekly Active Users within each grouping."
    type: min
    group_label: "Weekly Active Users Measures"
    sql: ${weekly_active_users} ;;
    drill_fields: [focalboard_drill*]
  }

  measure: weekly_active_users_avg {
    description: "The average Weekly Active Users within each grouping."
    type: average
    group_label: "Weekly Active Users Measures"
    sql: ${weekly_active_users} ;;
    drill_fields: [focalboard_drill*]
  }

  measure: weekly_active_users_median {
    description: "The median  Weekly Active Users within each grouping."
    type: median
    group_label: "Weekly Active Users Measures"
    sql: ${weekly_active_users} ;;
    drill_fields: [focalboard_drill*]
  }

  measure: monthly_active_users_sum {
    description: "The sum of Monthly Active Users within each grouping."
    type: sum
    group_label: "Monthly Active Users Measures"
    sql: ${monthly_active_users} ;;
    drill_fields: [focalboard_drill*]
  }

  measure: monthly_active_users_max {
    description: "The max Monthly Active Users within each grouping."
    type: max
    group_label: "Monthly Active Users Measures"
    sql: ${monthly_active_users} ;;
    drill_fields: [focalboard_drill*]
  }

  measure: monthly_active_users_min {
    description: "The min Monthly Active Users within each grouping."
    type: min
    group_label: "Monthly Active Users Measures"
    sql: ${monthly_active_users} ;;
    drill_fields: [focalboard_drill*]
  }

  measure: monthly_active_users_avg {
    description: "The average Monthly Active Users within each grouping."
    type: average
    group_label: "Monthly Active Users Measures"
    sql: ${monthly_active_users} ;;
    drill_fields: [focalboard_drill*]
  }

  measure: monthly_active_users_median {
    description: "The median  Monthly Active Users within each grouping."
    type: median
    group_label: "Monthly Active Users Measures"
    sql: ${monthly_active_users} ;;
    drill_fields: [focalboard_drill*]
  }

  measure: anonymous_count {
    label: " Anonymous Count"
    description: "The distinct count of Focalboard Activity Anonymouss within each grouping."
    type: count_distinct
    sql: ${anonymous_id} ;;
    hidden: yes
  }

  measure: user_count {
    label: " User Count"
    description: "The distinct count of Focalboard Activity Users within each grouping."
    type: count_distinct
    sql: ${user_id} ;;
    hidden: yes
  }

  measure: registered_users_sum {
    description: "The sum of Registered Users within each grouping."
    type: sum
    group_label: "Registered Users Measures"
    sql: ${registered_users} ;;
    drill_fields: [focalboard_drill*]
  }

  measure: registered_users_max {
    description: "The max Registered Users within each grouping."
    type: max
    group_label: "Registered Users Measures"
    sql: ${registered_users} ;;
    drill_fields: [focalboard_drill*]
  }

  measure: registered_users_min {
    description: "The min Registered Users within each grouping."
    type: min
    group_label: "Registered Users Measures"
    sql: ${registered_users} ;;
    drill_fields: [focalboard_drill*]
  }

  measure: registered_users_avg {
    description: "The average Registered Users within each grouping."
    type: average
    group_label: "Registered Users Measures"
    sql: ${registered_users} ;;
    drill_fields: [focalboard_drill*]
  }

  measure: registered_users_median {
    description: "The median  Registered Users within each grouping."
    type: median
    group_label: "Registered Users Measures"
    sql: ${registered_users} ;;
    drill_fields: [focalboard_drill*]
  }

  measure: daily_active_users_sum {
    description: "The sum of Daily Active Users within each grouping."
    type: sum
    group_label: "Daily Active Users Measures"
    sql: ${daily_active_users} ;;
    drill_fields: [focalboard_drill*]
  }

  measure: daily_active_users_max {
    description: "The max Daily Active Users within each grouping."
    type: max
    group_label: "Daily Active Users Measures"
    sql: ${daily_active_users} ;;
    drill_fields: [focalboard_drill*]
  }

  measure: daily_active_users_min {
    description: "The min Daily Active Users within each grouping."
    type: min
    group_label: "Daily Active Users Measures"
    sql: ${daily_active_users} ;;
    drill_fields: [focalboard_drill*]
  }

  measure: daily_active_users_avg {
    description: "The average Daily Active Users within each grouping."
    type: average
    group_label: "Daily Active Users Measures"
    sql: ${daily_active_users} ;;
    drill_fields: [focalboard_drill*]
  }

  measure: daily_active_users_median {
    description: "The median  Daily Active Users within each grouping."
    type: median
    group_label: "Daily Active Users Measures"
    sql: ${daily_active_users} ;;
    drill_fields: [focalboard_drill*]
  }

  measure: id_count {
    label: " Id Count"
    description: "The distinct count of Focalboard Activity Id within each grouping."
    type: count_distinct
    sql: ${id} ;;
    hidden: yes
  }

}
