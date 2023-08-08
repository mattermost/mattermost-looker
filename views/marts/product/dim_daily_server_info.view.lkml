view: dim_daily_server_info {
  sql_table_name: "MART_PRODUCT"."DIM_DAILY_SERVER_INFO" ;;
  label: "Daily Server Info"

  ##
  ## ID
  ##

  dimension: daily_server_id {
    type: string
    sql: ${TABLE}."DAILY_SERVER_ID" ;;
    primary_key: yes
    hidden: yes
  }

  dimension: server_id {
    type: string
    sql: ${TABLE}."SERVER_ID" ;;
    label: "Server ID"
    description: "The Server's ID"
  }

  dimension_group: activity {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."ACTIVITY_DATE" ;;
    label: "Server Telemetry Activity"  # Remember that `Date` is automatically appended by looker
    description: "The date current data were captured at"
  }

  ##
  ## Dimensions
  ##


  dimension: database_type {
    type: string
    sql: ${TABLE}."DATABASE_TYPE" ;;
    label: "Database Type"
    description: "The type of the database"
    view_label: "- Server Metadata"
  }

  dimension: database_version {
    type: string
    sql: ${TABLE}."DATABASE_VERSION" ;;
    label: "Database Version"
    description: "The version of the database"
    view_label: "- Server Metadata"
  }

  dimension: installation_id {
    type: string
    sql: ${TABLE}."INSTALLATION_ID" ;;
    label: "Installation ID"
    description: "The server's installation ID (if any)"
    view_label: "- Server Metadata"
  }

  dimension: installation_type {
    type: string
    sql: ${TABLE}."INSTALLATION_TYPE" ;;
    label: "Installation type"
    description: "The server's installation type (if any)"
    view_label: "- Server Metadata"
  }

  dimension: is_cloud {
    type: yesno
    sql: ${TABLE}."IS_CLOUD" ;;
    label: "Is Cloud?"
    description: "Whether this is a cloud server"
    view_label: "- Server Metadata"
  }

  dimension: is_enterprise_ready {
    type: string
    sql: ${TABLE}."IS_ENTERPRISE_READY" ;;
    label: "Is Enterprise Ready?"
    description: "Whether this is an enterprise ready server"
    view_label: "- Server Metadata"
  }

  dimension: operating_system {
    type: string
    sql: ${TABLE}."OPERATING_SYSTEM" ;;
    label: "Operating System"
    description: "The OS the server is installed on"
    view_label: "- Server Metadata"
  }

  dimension: server_ip {
    type: string
    sql: ${TABLE}."SERVER_IP" ;;
    label: "IP Address"
    description: "The server's IP address"
    view_label: "- Server Metadata"
  }

  ###
  ### Version Information
  ###

  dimension: version_full {
    type: string
    sql: ${TABLE}."VERSION_FULL" ;;
    label: "Server Version"
    view_label: "- Server Version"
  }

  dimension: version_major {
    type: string
    sql: ${TABLE}."VERSION_MAJOR" ;;
    label: "Major Version"
    view_label: "- Server Version"
  }

  dimension: version_minor {
    type: string
    sql: ${TABLE}."VERSION_MINOR" ;;
    label: "Minor Version"
    view_label: "- Server Version"
  }

  dimension: version_patch {
    type: string
    sql: ${TABLE}."VERSION_PATCH" ;;
    label: "Patch Version"
    view_label: "- Server Version"
  }

  dimension: count_reported_versions {
    type: number
    sql: ${TABLE}."COUNT_REPORTED_VERSIONS" ;;
    label: "Number of reported versions"
    view_label: "- Server Version"
  }

  ###
  ### Data Source info
  ###

  dimension: has_diagnostics_data {
    type: yesno
    sql: ${TABLE}."HAS_DIAGNOSTICS_DATA" ;;
    label: "Has diagnostics data?"
    description: " Whether the server queried the security update endpoint at the current date"
    view_label: "- Data Source Info"
  }

  dimension: has_legacy_telemetry_data {
    type: yesno
    sql: ${TABLE}."HAS_LEGACY_TELEMETRY_DATA" ;;
    label: "Has legacy telemetry"
    description: "Whether telemetry data were reported from legacy telemetry pipeline (Segment) at the current date"
    view_label: "- Data Source Info"
  }

  dimension: has_telemetry_data {
    type: yesno
    sql: ${TABLE}."HAS_TELEMETRY_DATA" ;;
    label: "Has telemetry?"
    description: "Whether telemetry data were reported from telemetry pipeline (Rudderstack) at the current date/"
    view_label: "- Data Source Info"
  }

  measure: number_of_servers {
    type: count
    label: "Count"
  }
}
