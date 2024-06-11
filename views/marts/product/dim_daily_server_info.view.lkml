view: dim_daily_server_info {
  sql_table_name: "MART_PRODUCT"."DIM_DAILY_SERVER_INFO" ;;
  label: "Daily Server Info"

  ##
  ## ID
  ##

  dimension: daily_server_id {
    type: string
    sql: ${TABLE}.daily_server_id ;;
    primary_key: yes
    hidden: yes
  }

  dimension: server_id {
    type: string
    sql: ${TABLE}.server_id ;;
    label: "Server ID"
    description: "The Server's ID"
    hidden: yes # Already available in fact table
  }

  dimension_group: activity {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.activity_date ;;
    label: "Server Telemetry Activity"  # Remember that `Date` is automatically appended by looker
    description: "The date current data were captured at"
    hidden: yes # Already available in fact table
  }

  ##
  ## Dimensions
  ##


  dimension: database_type {
    type: string
    sql: ${TABLE}.database_type ;;
    label: "Database Type"
    description: "The type of the database"
    view_label: "Server: Daily Info Snapshot"
  }

  dimension: database_version {
    type: string
    sql: ${TABLE}.database_version ;;
    label: "Database Version"
    description: "The version of the database"
    view_label: "Server: Daily Info Snapshot"
  }

  dimension: installation_id {
    type: string
    sql: ${TABLE}.installation_id ;;
    label: "Installation ID"
    description: "The server's installation ID (if any)"
    view_label: "Server: Daily Info Snapshot"
  }

  dimension: installation_type {
    type: string
    sql: ${TABLE}.installation_type ;;
    label: "Installation type"
    description: "The server's installation type (if any)"
    view_label: "Server: Daily Info Snapshot"
  }


  dimension: is_enterprise_ready {
    type: string
    sql: ${TABLE}.is_enterprise_ready ;;
    label: "Is Enterprise Ready?"
    description: "Whether this is an enterprise ready server"
    view_label: "Server: Daily Info Snapshot"
  }

  dimension: binary_edition {
    type: string
    sql: ${TABLE}.binary_edition ;;
    label: "Edition"
    description: "Whether the server is running a Team Edition (TE) or Enterprise Edition (E0) version of the binary."
    view_label: "Server: Daily Info Snapshot"
  }

  dimension: operating_system {
    type: string
    sql: ${TABLE}.operating_system ;;
    label: "Operating System"
    description: "The OS the server is installed on"
    view_label: "Server: Daily Info Snapshot"
  }

  dimension: server_ip {
    type: string
    sql: ${TABLE}.server_ip ;;
    label: "IP Address"
    description: "The server's IP address"
    view_label: "Server: Daily Info Snapshot"
  }

  dimension: count_reported_versions {
    type: number
    sql: ${TABLE}.count_reported_versions ;;
    label: "Number of reported versions"
    view_label: "Server: Daily Info Snapshot"
  }


  dimension: age_in_days {
    type: number
    sql: ${TABLE}.age_in_days ;;
    label: "Age (Days)"
    description: "Number of days since the first telemetry received by this server."
    view_label: "Server: Daily Info Snapshot"
  }

  dimension: server_age {
    type: tier
    style: integer
    tiers: [0,31,61,91,181,366,731]
    sql: ${age_in_days} ;;
    label: "Age Band (Days)"
    description: "Displays the age in days of the server bucketed into groupings. Age is calculated from first active date (first date telemetry enabled) to logging date."
    view_label: "Server: Daily Info Snapshot"
  }

  ###
  ### Data Source info
  ###

  dimension: has_diagnostics_data {
    type: yesno
    sql: ${TABLE}.has_diagnostics_data ;;
    label: "Has diagnostics data?"
    description: " Whether the server queried the security update endpoint at the current date"
    view_label: "Metadata: Data Source Info"
  }

  dimension: has_legacy_telemetry_data {
    type: yesno
    sql: ${TABLE}.has_legacy_telemetry_data ;;
    label: "Has legacy telemetry?"
    description: "Whether telemetry data were reported from legacy telemetry pipeline (Segment) at the current date"
    view_label: "Metadata: Data Source Info"
  }

  dimension: has_telemetry_data {
    type: yesno
    sql: ${TABLE}.has_telemetry_data ;;
    label: "Has telemetry?"
    description: "Whether telemetry data were reported from telemetry pipeline (Rudderstack) at the current date."
    view_label: "Metadata: Data Source Info"
  }
}
