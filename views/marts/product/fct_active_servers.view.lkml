view: fct_active_servers {
  sql_table_name: "MART_PRODUCT"."FCT_ACTIVE_SERVERS" ;;
  label: "   * Server: Telemetry Active Servers"

  ###
  ### IDs and dates
  ###


  dimension: daily_server_id {
    type: string
    sql: ${TABLE}.daily_server_id ;;
    primary_key: yes
    hidden: yes
  }

  dimension: server_id {
    type: string
    sql: ${TABLE}.server_id ;;
  }

  dimension_group: activity {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.activity_date ;;
    label: "Server Telemetry Activity" # Remember that `Date` is automatically appended by looker
    description: "The date current data were captured at"
  }

  dimension: version_id {
    type: string
    sql: ${TABLE}.version_id ;;
    hidden: yes
  }


  dimension: installation_id {
    type: string
    sql: ${TABLE}.installation_id ;;
    label: "Installation ID"
    description: "The id of the installation. Exists only for cloud installations."
  }


  ###
  ### Other dimensions (degenerate etc)
  ###

  dimension: installation_type {
    type: string
    sql: ${TABLE}.installation_type ;;
    label: "Installation type"
    description: "The method used for installing the Mattermost server (docker, deb package, ...)."
  }


  ###
  ### Facts
  ###

  dimension: count_reported_versions {
    type: number
    sql: ${TABLE}.count_reported_versions ;;
    label: "Number of distinct versions"
    description: "Number of distinct versions reported by the server for the given date. Uses information from multiple telemetry sources. Values > 1 indicate an upgrade/downgrade."
  }

  dimension: is_enterprise_ready {
    type: yesno
    sql: ${TABLE}.is_enterprise_ready ;;
    label: "Is enterprise ready?"
    description: "Whether this server uses an enterprise ready build."
  }

  dimension: registered_user_bin {
    type: string
    sql: ${TABLE}.registered_user_bin ;;
    label: "Registered User Bucket"
    description: "Splits server into \"buckets\" depending on the number of active registered users."
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


  dimension: is_missing_activity_data {
    type: yesno
    sql: ${TABLE}."IS_MISSING_ACTIVITY_DATA" ;;
    label: "Missing activity data?"
    description: "Whether activity data were reported from telemetry pipeline (Rudderstack or Segment) at the current date."
    view_label: "Metadata: Data Source Info"
  }

  measure: count {
    type: count_distinct
    sql: ${server_id} ;;
    label: "Count Unique Servers"
    description: "Count of distinct servers"
    view_label: " * Metrics: Active Servers"
    drill_fields: [server_id]
  }
}
