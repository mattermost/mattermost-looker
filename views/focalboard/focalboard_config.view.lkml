# This is the view file for the analytics.focalboard.focalboard_config table.
view: focalboard_config {
  sql_table_name: focalboard.focalboard_config ;;
  view_label: "Focalboard Config"

  # FILTERS
  set: focalboard_drill {
    fields: [timestamp_date, focalboard_server.server_id, user_id,  license_server_fact.customer_name, focalboard_workspaces.workspaces_sum,
      focalboard_blocks.board_sum, focalboard_blocks.view_sum, focalboard_blocks.card_sum, focalboard_blocks.divider_sum, focalboard_blocks.text_sum,
      focalboard_blocks.image_sum, focalboard_blocks.comment_sum, focalboard_blocks.divider_sum, focalboard_blocks.checkbox_sum,
      focalboard_activity.registered_users, focalboard_activity.daily_active_users, license_server_fact.edition, focalboard_fact.first_active_date, focalboard_fact.last_active_date,
              focalboard_fact.days_active, server_fact.first_active_date, server_fact.last_active_date ]
  }
  # DIMENSIONS
  dimension: context_request_ip {
    description: ""
    type: string
    sql: ${TABLE}.context_request_ip ;;
    hidden: yes
  }

  dimension: anonymous_id {
    description: ""
    type: string
    sql: ${TABLE}.anonymous_id ;;
    hidden: yes
  }

  dimension: port {
    description: ""
    type: yesno
    sql: ${TABLE}.port ;;
    hidden: no
  }

  dimension: user_id {
    description: ""
    type: string
    sql: ${TABLE}.user_id ;;
    hidden: no
  }

  dimension: usessl {
    label: "Use SSL"
    description: ""
    type: yesno
    sql: ${TABLE}.usessl ;;
    hidden: no
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

  dimension: dbtype {
    label: "Database Type"
    description: ""
    type: string
    sql: ${TABLE}.dbtype ;;
    hidden: no
  }

  dimension: serverroot {
    label: "Server Root"
    description: ""
    type: yesno
    sql: ${TABLE}.serverroot ;;
    hidden: no
  }

  dimension: context_ip {
    description: ""
    type: string
    sql: ${TABLE}.context_ip ;;
    hidden: yes
  }

  dimension: single_user {
    description: ""
    type: yesno
    sql: ${TABLE}.single_user ;;
    hidden: no
  }

  dimension: event {
    description: ""
    type: string
    sql: ${TABLE}.event ;;
    hidden: yes
  }

  dimension: event_text {
    description: ""
    type: string
    sql: ${TABLE}.event_text ;;
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

  dimension_group: timestamp {
  description: ""
  type: time
  timeframes: [time, week, date, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.timestamp ;;
    hidden: yes
  }

  dimension_group: sent_at {
  description: ""
  type: time
  timeframes: [time, week, date, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.sent_at ;;
    hidden: yes
  }

  dimension_group: received_at {
  description: ""
  type: time
  timeframes: [time, week, date, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.received_at ;;
    hidden: yes
  }

  dimension_group: original_timestamp {
  description: ""
  type: time
  timeframes: [time, week, date, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.original_timestamp ;;
    hidden: no
  }

  dimension_group: uuid_ts {
  description: ""
  type: time
  timeframes: [time, week, date, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.uuid_ts ;;
    hidden: yes
  }


  # MEASURES
  measure: count {
    description: "Count of rows/occurrences."
    type: count
    hidden: yes
  }

  measure: anonymous_count {
    label: " Anonymous Count"
    description: "The distinct count of Focalboard Config Anonymouss within each grouping."
    type: count_distinct
    sql: ${anonymous_id} ;;
    hidden: yes
  }

  measure: port_count {
    label: "Port Count"
    description: "The distinct count of Focalboard instances with Port marked true."
    type: count_distinct
    sql: case when ${port} then ${id} else null end ;;
  }

  measure: user_count {
    label: " User Count"
    description: "The distinct count of Focalboard Config Users within each grouping."
    type: count_distinct
    sql: ${user_id} ;;
    hidden: yes
  }

  measure: usessl_count {
    label: "Use SSL Count"
    description: "The distinct count of Focalboard instances with Use SSL marked true."
    type: count_distinct
    sql: case when ${usessl} then ${id} else null end ;;
  }

  measure: id_count {
    label: " Id Count"
    description: "The distinct count of Focalboard Config Id within each grouping."
    type: count_distinct
    sql: ${id} ;;
    hidden: yes
  }

  measure: serverroot_count {
    label: "Server Root Count"
    description: "The distinct count of Focalboard instances with Serverroot marked true."
    type: count_distinct
    sql: case when ${serverroot} then ${id} else null end ;;
  }

  measure: single_user_count {
    label: "Single User Count"
    description: "The distinct count of Focalboard instances with Single User marked true."
    type: count_distinct
    sql: case when ${single_user} then ${id} else null end ;;
  }


}
