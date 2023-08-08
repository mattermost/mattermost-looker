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
  }

  dimension_group: activity {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.activity_date ;;
    label: "Server Telemetry Activity"  # Remember that `Date` is automatically appended by looker
    description: "The date current data were captured at"
  }

  ##
  ## Dimensions
  ##


  dimension: database_type {
    type: string
    sql: ${TABLE}.database_type ;;
    label: "Database Type"
    description: "The type of the database"
    view_label: "- Server Metadata"
  }

  dimension: database_version {
    type: string
    sql: ${TABLE}.database_version ;;
    label: "Database Version"
    description: "The version of the database"
    view_label: "- Server Metadata"
  }

  dimension: installation_id {
    type: string
    sql: ${TABLE}.installation_id ;;
    label: "Installation ID"
    description: "The server's installation ID (if any)"
    view_label: "- Server Metadata"
  }

  dimension: installation_type {
    type: string
    sql: ${TABLE}.installation_type ;;
    label: "Installation type"
    description: "The server's installation type (if any)"
    view_label: "- Server Metadata"
  }

  dimension: is_cloud {
    type: yesno
    sql: ${TABLE}.is_cloud ;;
    label: "Is Cloud?"
    description: "Whether this is a cloud server"
    view_label: "- Server Metadata"
  }

  dimension: is_enterprise_ready {
    type: string
    sql: ${TABLE}.is_enterprise_ready ;;
    label: "Is Enterprise Ready?"
    description: "Whether this is an enterprise ready server"
    view_label: "- Server Metadata"
  }

  dimension: operating_system {
    type: string
    sql: ${TABLE}.operating_system ;;
    label: "Operating System"
    description: "The OS the server is installed on"
    view_label: "- Server Metadata"
  }

  dimension: server_ip {
    type: string
    sql: ${TABLE}.server_ip ;;
    label: "IP Address"
    description: "The server's IP address"
    view_label: "- Server Metadata"
  }

  ###
  ### Version Information
  ###

  dimension: version_full {
    type: string
    sql: ${TABLE}.version_full ;;
    label: "Server Version"
    view_label: "- Server Version"
  }

  dimension: version_major {
    type: string
    sql: ${TABLE}.version_major ;;
    label: "Major Version"
    view_label: "- Server Version"
  }

  dimension: version_minor {
    type: string
    sql: ${TABLE}.version_minor ;;
    label: "Minor Version"
    view_label: "- Server Version"
  }

  dimension: version_patch {
    type: string
    sql: ${TABLE}.version_patch ;;
    label: "Patch Version"
    view_label: "- Server Version"
  }

  dimension: count_reported_versions {
    type: number
    sql: ${TABLE}.count_reported_versions ;;
    label: "Number of reported versions"
    view_label: "- Server Version"
  }

  ###
  ### Data Source info
  ###

  dimension: has_diagnostics_data {
    type: yesno
    sql: ${TABLE}.has_diagnostics_data ;;
    label: "Has diagnostics data?"
    description: " Whether the server queried the security update endpoint at the current date"
    view_label: "- Data Source Info"
  }

  dimension: has_legacy_telemetry_data {
    type: yesno
    sql: ${TABLE}.has_legacy_telemetry_data ;;
    label: "Has legacy telemetry"
    description: "Whether telemetry data were reported from legacy telemetry pipeline (Segment) at the current date"
    view_label: "- Data Source Info"
  }

  dimension: has_telemetry_data {
    type: yesno
    sql: ${TABLE}.has_telemetry_data ;;
    label: "Has telemetry?"
    description: "Whether telemetry data were reported from telemetry pipeline (Rudderstack) at the current date/"
    view_label: "- Data Source Info"
  }

  measure: number_of_servers {
    type: count
    label: "Count"
  }
}
