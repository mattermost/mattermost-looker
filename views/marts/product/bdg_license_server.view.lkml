###
### Bridge view to map between servers and licenses. To be used for many-to-many relationships.
###

view: bdg_license_server {

  sql_table_name: "MART_PRODUCT".bdg_license_server ;;
  view_label: "License-Server: Summary"
  drill_fields: [bdg_license_server_id]


  dimension: bdg_license_server_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.bdg_license_server_id ;;
    hidden: yes
  }

  ###
  ### IDs
  ###

  dimension: license_id {
    type: string
    sql: ${TABLE}.license_id ;;
    label: "License ID"
    hidden: yes
  }

  dimension: server_id {
    type: string
    sql: ${TABLE}.server_id ;;
    label: "Server ID"
    hidden: yes

  }

  dimension: installation_id {
    type: string
    sql: ${TABLE}.installation_id ;;
    label: "Installation ID"
    hidden: yes
  }

  ###
  ### Dates
  ###

  dimension_group: first_telemetry {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.first_telemetry_date ;;
    label: "First Telemetry"
    description: "The first date when telemetry reported the current license/server combination."
  }


  dimension_group: last_telemetry {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.last_telemetry_date ;;
    label: "Last Telemetry"
    description: "The last date when telemetry reported the current license/server combination."
  }

  ###
  ### Metrics
  ###

  measure: count_unique_servers {
    type: count_distinct
    sql: ${server_id} ;;
    label: "Count Unique Servers"
    description: "Count of distinct servers"
    view_label: "Metrics: Servers"
    drill_fields: [server_id]
  }

  measure: count_unique_licenses {
    type: count_distinct
    sql: ${license_id} ;;
    label: "Count Unique Licenses"
    description: "Count of distinct licenses"
    view_label: "Metrics: Licenses"
    drill_fields: [license_id]
  }
}
