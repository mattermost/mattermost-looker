view: grp_copilot_tracks {

  sql_table_name: "MART_PRODUCT".grp_copilot_tracks ;;


  # Event information

  dimension: event_id {
    type: string
    sql: ${TABLE}.event_id ;;
    primary_key: yes
  }


  dimension: event_name {
    type: string
    sql: ${TABLE}.event_name ;;
    description: "The name of the event."
  }

  dimension: event_table {
    type: string
    sql: ${TABLE}.event_table ;;
    # Hide as always teh same as event name
    hidden: yes
  }

  dimension_group: event {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.event_date ;;
    description: "The date that the event was recorded at."
  }


  dimension_group: timestamp {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: CAST(${TABLE}.timestamp AS TIMESTAMP_NTZ) ;;
    description: "The timestamp that the event was fired at."
  }

  # User and server information

  dimension: user_id {
    type: string
    sql: ${TABLE}.user_id ;;
    description: "The ID of the user that triggered the event."
  }


  dimension: server_id {
    type: string
    sql: ${TABLE}.server_id ;;
    description: "The ID of the server the event was fired from."
  }

  dimension: server_version {
    type: string
    sql: ${TABLE}.server_version ;;
    description: "The version of the server the plugin is installed to."
  }


  # Event-secific data

  dimension: bot_service_type {
    type: string
    sql: ${TABLE}.bot_service_type ;;
    description: "The service type of the bot."
  }


  dimension: bot_id {
    type: string
    sql: ${TABLE}.bot_id ;;
    description: "The ID of the bot."
  }

  # Feature information
  dimension: feature_name {
    type: string
    sql: ${TABLE}.feature_name ;;
    description: "The name of the feature. Should always be 'Copilot'."
  }

  dimension: feature_skus {
    type: string
    sql: ${TABLE}.feature_skus ;;
    description: "The list of SKUs that allow triggering of this event."
  }

  # Metadata about Copilot plugin,

  dimension: plugin_build {
    type: string
    sql: ${TABLE}.plugin_build ;;
    description: "The plugin build number."
  }

  dimension: plugin_version {
    type: string
    sql: ${TABLE}.plugin_version ;;
    description: "The version of the plugin."
  }


  # Measures


  measure: count_events {
    type: count
    drill_fields: [event_id, event_name]
    label: "Event Count"
    description: "Count of events."
  }

  measure: count_distinct_users {
    type: count_distinct
    sql: ${user_id};;
    label: "Unique User Count"
  }


  measure: count_distinct_servers {
    type: count_distinct
    sql: ${server_id};;
    label: "Unique Server Count"
  }
}
