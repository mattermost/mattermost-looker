# This is the view file for the analytics.mattermost.user_agent_registry table.
view: user_agent_registry {
  sql_table_name: mattermost.user_agent_registry ;;
  view_label: "User Agent Registry"

  # FILTERS

  # DIMENSIONS
  dimension: context_useragent {
    description: "" 
    type: string
    sql: ${TABLE}.context_useragent ;;
    hidden: no
  }

  dimension: browser {
    description: "" 
    type: string
    sql: ${TABLE}.browser ;;
    hidden: no
  }

  dimension: browser_version {
    description: "" 
    type: string
    sql: ${TABLE}.browser_version ;;
    hidden: no
  }

  dimension: operating_system {
    description: "" 
    type: string
    sql: ${TABLE}.operating_system ;;
    hidden: no
  }

  dimension: os_version {
    description: "" 
    type: string
    sql: ${TABLE}.os_version ;;
    hidden: no
  }

  dimension: device_type {
    description: "" 
    type: string
    sql: ${TABLE}.device_type ;;
    hidden: no
  }

  dimension: device_brand {
    description: "" 
    type: string
    sql: ${TABLE}.device_brand ;;
    hidden: no
  }

  dimension: device_model {
    description: "" 
    type: string
    sql: ${TABLE}.device_model ;;
    hidden: no
  }

  
  # DIMENSION GROUPS/DATES
  
  # MEASURES
  measure: count {
    description: "Count of rows/occurrences."
    type: count
  }


}