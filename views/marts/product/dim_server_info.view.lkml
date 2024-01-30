# The name of this view in Looker is "Dim Server Info"
view: dim_server_info {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "MART_PRODUCT"."DIM_SERVER_INFO" ;;
  label: "Dimension: Deployment Information"

  dimension: server_id {
    type: string
    sql: ${TABLE}."SERVER_ID" ;;
    primary_key: yes
    hidden: yes
  }

  dimension: hosting_type {
    type: string
    sql: ${TABLE}."HOSTING_TYPE" ;;
    label: "Hosting type"
    description: "Whether the server is an onprem or cloud installation."
    view_label: "Server: Installation information"

  }

  dimension: installation_id {
    type: string
    sql: ${TABLE}."INSTALLATION_ID" ;;
    label: "Installation ID"
    description: "The ID of the server's installation. Exists only if server is a cloud server."
    view_label: "Server: Installation information"
  }


  dimension_group: first_activity_date {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.first_activity_date ;;
    label: "First Activity" # Remember that `Date` is automatically appended by looker
    description: "The first date that activity was recorded for the current server"
    view_label: "Server: Lifecycle"
  }

  dimension_group: last_activity_date {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.last_activity_date ;;
    label: "Last Activity" # Remember that `Date` is automatically appended by looker
    description: "The first date that activity was recorded for the current server"
    view_label: "Server: Lifecycle"
  }

  dimension: first_binary_edition {
    type: string
    sql: ${TABLE}.first_binary_edition ;;
    label: "First Edition"
    description: "The first reported binary edition - can be Team Edition (TE), Enterprise Edition (E0) version of the binary or Unknown."
    view_label: "Server: Lifecycle"
  }

  dimension: last_binary_edition {
    type: string
    sql: ${TABLE}.last_binary_edition ;;
    label: "Last Edition"
    description: "The last reported binary edition - can be Team Edition (TE), Enterprise Edition (E0) version of the binary or Unknown."
    view_label: "Server: Lifecycle"
  }

  dimension: first_count_registered_active_users {
    type: number
    sql: ${TABLE}.first_count_registered_active_users ;;
    label: "Active registered users on first day"
    description: "Number of active (not deleted) registered users, as reported on the first day that telemetry was received from the server."
    view_label: "Server: Lifecycle"
  }

  dimension: last_count_registered_active_users {
    type: number
    sql: ${TABLE}.last_count_registered_active_users ;;
    label: "Active registered users on last day"
    description: "Number of active (not deleted) registered users, as reported on the last day that telemetry was received from the server."
    view_label: "Server: Lifecycle"
  }

  dimension: last_daily_active_users {
    type: number
    sql: ${TABLE}.last_daily_active_users ;;
    label: "Latest server DAU"
    description: "Number of DAU, as reported by Mattermost server on the last day that telemetry was received from the server."
    view_label: "Server: Lifecycle"
  }

  dimension: last_monthly_active_users {
    type: number
    sql: ${TABLE}.last_monthly_active_users ;;
    label: "Latest server MAU"
    description: "Number of MAU, as reported by Mattermost server on the last day that telemetry was received from the server."
    view_label: "Server: Lifecycle"
  }
}
