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
    description: "The browser used to access & browse the mattermost web property."
    group_label: "User Agent Info."
    type: string
    sql: ${TABLE}.browser ;;
    hidden: no
  }

  dimension: browser_version {
    description: "The browser version used to access & browse the mattermost web property."
    type: string
    sql: ${TABLE}.browser_version ;;
    hidden: no
  }

  dimension: browser_w_version {
    label: "Browser + Version"
    description: "The browser & browser version used to access & browse the mattermost web property."
    type: string
    sql: ${browser} || ' ' || ${browser_version} ;;
  }

  dimension: operating_system {
    label: "Operating System (OS)"
    description: "The operating system of the device used to access & browse the mattermost web property."
    type: string
    sql: ${TABLE}.operating_system ;;
    hidden: no
  }

  dimension: os_version {
    label: "OS Version"
    description: "The operating system version of the device used to access & browse the mattermost web property."
    type: string
    sql: ${TABLE}.os_version ;;
    hidden: no
  }

  dimension: os_w_version {
    label: "OS + OS Version"
    description: "The operating system and OS version of the device used to access & browse the mattermost web property."
    type: string
    sql: ${TABLE}.os_version ;;
    hidden: no
  }

  dimension: device_type {
    description: "The device type used to access & browse the mattermost web property."
    type: string
    sql: ${TABLE}.device_type ;;
    hidden: no
  }

  dimension: device_brand {
    description: "The device brand of the device used to access & browse the mattermost web property."
    type: string
    sql: ${TABLE}.device_brand ;;
    hidden: no
  }

  dimension: device_model {
    description: "The device model of the device used to access & browse the mattermost web property."
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
