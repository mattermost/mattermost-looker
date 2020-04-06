# This is the view file for the analytics.mattermost.server_upgrades table.
view: server_upgrades {
  sql_table_name: mattermost.server_upgrades ;;
  view_label: "Server Upgrades"

  # FILTERS

  # DIMENSIONS
  dimension: server_id {
    description: "" 
    type: string
    sql: ${TABLE}.server_id ;;
    hidden: no
  }

  dimension: account_sfid {
    description: "" 
    type: string
    sql: ${TABLE}.account_sfid ;;
    hidden: no
  }

  dimension: license_id {
    description: "" 
    type: string
    sql: ${TABLE}.license_id ;;
    hidden: no
  }

  dimension: prev_version {
    description: "" 
    type: string
    sql: ${TABLE}.prev_version ;;
    hidden: no
  }

  dimension: current_version {
    description: "" 
    type: string
    sql: ${TABLE}.current_version ;;
    hidden: no
  }

  dimension: prev_edition {
    description: "" 
    type: string
    sql: ${TABLE}.prev_edition ;;
    hidden: no
  }

  dimension: current_edition {
    description: "" 
    type: string
    sql: ${TABLE}.current_edition ;;
    hidden: no
  }

  
  # DIMENSION GROUPS/DATES
  dimension_group: logging {
    description: "" 
    type: time
    timeframes: [date, month, year]
    sql: ${TABLE}.date ;;
    hidden: no
  }

  
  # MEASURES
  measure: count {
    description: "Count of rows/occurrences."
    type: count
  }

  measure: server_count {
    label: " Server Count"
    description: "The distinct count of Servers per grouping."
    type: count_distinct
    sql: ${server_id} ;;
  }

  measure: license_count {
    label: " License Count"
    description: "The distinct count of Licenses per grouping."
    type: count_distinct
    sql: ${license_id} ;;
  }


}