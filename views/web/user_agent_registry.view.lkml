# This is the view file for the analytics.mattermost.user_agent_registry table.
view: user_agent_registry {
  sql_table_name: web.user_agent_registry ;;
  view_label: "User Agent Registry"

  # FILTERS
  dimension: bot {
    description: "Boolean indicating if the user agent is associated with a bot and/or spider."
    type: yesno
    sql: CASE WHEN CASE WHEN ${TABLE}.device_type IS NULL THEN 'Other' ELSE ${TABLE}.device_type END = 'Spider' THEN TRUE ELSE FALSE END ;;
  }

  # DIMENSIONS
  dimension: context_useragent {
    description: ""
    type: string
    sql: ${TABLE}.context_useragent ;;
    hidden: no
  }

  dimension: browser {
    description: "The browser used to access & browse the mattermost web property."
    group_label: "User Agent Attributes"
    type: string
    sql: CASE WHEN ${TABLE}.browser IS NULL THEN 'Other' ELSE ${TABLE}.browser END ;;
    hidden: no
  }

  dimension: browser_version {
    description: "The browser version used to access & browse the mattermost web property."
    group_label: "User Agent Attributes"
    type: string
    sql: CASE WHEN ${TABLE}.browser_version IS NULL THEN 'Other' ELSE ${TABLE}.browser_version END ;;
    hidden: no
  }

  dimension: browser_version_major {
    description: "The browser version used to access & browse the mattermost web property."
    group_label: "User Agent Attributes"
    type: number
    sql: SPLIT_PART(${TABLE}.browser_version, '.', 1) ;;
    hidden: no
  }

  dimension: browser_w_version {
    label: "Browser + Version"
    description: "The browser & browser version used to access & browse the mattermost web property."
    group_label: "User Agent Attributes"
    type: string
    sql:  CASE WHEN ${TABLE}.browser || ' ' || ${TABLE}.browser_version IS NULL THEN 'Other' ELSE ${browser} || ' ' || ${browser_version} END ;;
  }

  dimension: operating_system {
    label: "Operating System (OS)"
    description: "The operating system of the device used to access & browse the mattermost web property."
    group_label: "User Agent Attributes"
    type: string
    sql:  CASE WHEN ${TABLE}.operating_system IS NULL THEN 'Other' ELSE ${TABLE}.operating_system END ;;
    hidden: no
  }

  dimension: os_version {
    label: "OS Version"
    description: "The operating system version of the device used to access & browse the mattermost web property."
    group_label: "User Agent Attributes"
    type: string
    sql:  CASE WHEN NULLIF(${TABLE}.os_version, '') IS NULL THEN 'Other' ELSE ${TABLE}.os_version END;;
    hidden: no
  }

  dimension: os_w_version {
    label: "OS + OS Version"
    description: "The operating system and OS version of the device used to access & browse the mattermost web property."
    group_label: "User Agent Attributes"
    type: string
    sql:  CASE WHEN ${TABLE}.operating_system || ' ' || ${TABLE}.os_version IS NULL THEN 'Other' ELSE ${TABLE}.operating_system || ' ' || ${TABLE}.os_version END ;;
    hidden: no
  }

  dimension: device_type {
    description: "The device type used to access & browse the mattermost web property."
    group_label: "User Agent Attributes"
    type: string
    sql:  CASE WHEN ${TABLE}.device_type IS NULL THEN 'Other' ELSE ${TABLE}.device_type END;;
    hidden: no
  }

  dimension: device_brand {
    description: "The device brand of the device used to access & browse the mattermost web property."
    group_label: "User Agent Attributes"
    type: string
    sql:  CASE WHEN ${TABLE}.device_brand IS NULL THEN 'Other' ELSE ${TABLE}.device_brand END ;;
    hidden: no
  }

  dimension: device_model {
    description: "The device model of the device used to access & browse the mattermost web property."
    group_label: "User Agent Attributes"
    type: string
    sql:  CASE WHEN ${TABLE}.device_model IS NULL THEN 'Other' ELSE ${TABLE}.device_model END ;;
    hidden: no
  }


  # DIMENSION GROUPS/DATES

  # MEASURES
  measure: count {
    description: "Count of rows/occurrences."
    type: count
  }


}
