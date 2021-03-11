# This is the view file for the analytics.events.daily_server_user_agent_events table.
view: daily_server_user_agent_events {
  sql_table_name: events.daily_server_user_agent_events ;;
  view_label: "Daily Server User Agent Events"

  # FILTERS

  # DIMENSIONS
  dimension: server_id {
    description: ""
    type: string
    sql: ${TABLE}.server_id ;;
    hidden: no
  }

  dimension: event_source {
    description: "The Mattermost client being used at the time the event was performed i.e. Desktop, WebApp, or Mobile."
    type: string
    sql: ${TABLE}.event_source ;;
    hidden: no
  }

  dimension: context_useragent {
    description: ""
    type: string
    sql: ${TABLE}.context_useragent ;;
    hidden: no
  }

  dimension: browser {
    group_label: "Browser Details"
    description: ""
    type: string
    sql: ${TABLE}.browser ;;
    hidden: no
  }

  dimension: browser_version {
    group_label: "Browser Details"
    description: ""
    type: string
    sql: ${TABLE}.browser_version ;;
    hidden: no
  }

  dimension: browser_version_major {
    group_label: "Browser Details"
    description: ""
    type: string
    sql:
    --CASE WHEN ${browser} = 'Chrome' THEN left(SPLIT_PART(${browser_version}, '.', 1), 4)
      --    ELSE SPLIT_PART(${browser_version}, '.', 1) || '.' || SPLIT_PART(${browser_version},'.',2) END
          SPLIT_PART(${browser_version}, '.', 1) || '.' || SPLIT_PART(${browser_version},'.',2);;
  }

  dimension: browser_w_version {
    group_label: "Browser Details"
    description: ""
    type: string
    sql: ${browser} || ' ' || ${browser_version} ;;
    hidden: no
  }

  dimension: browser_w_version_major {
    group_label: "Browser Details"
    description: ""
    type: string
    sql: ${browser} || ' ' || ${browser_version_major} ;;
    hidden: no
  }

  dimension: operating_system {
    group_label: "Operating System Details"
    description: ""
    type: string
    sql: ${TABLE}.operating_system ;;
    hidden: no
  }

  dimension: os_version {
    group_label: "Operating System Details"
    label: "Operating System Version"
    description: ""
    type: string
    sql: ${TABLE}.os_version ;;
    hidden: no
  }

  dimension: os_version_major {
    group_label: "Operating System Details"
    label: "Operating System Version (Major)"
    description: ""
    type: string
    sql: CASE WHEN ${browser} = 'Chrome' THEN SPLIT_PART(${os_version}, '.',1)
          ELSE
              CASE WHEN SPLIT_PART(${os_version}, '.',2) IS NOT NULL THEN SPLIT_PART(${os_version}, '.',1) || '.' || SPLIT_PART(${os_version}, '.',2)
                ELSE ${os_version} END
        END;;
    hidden: no
  }

  dimension: os_w_version {
    group_label: "Operating System Details"
    label: "Operating System + Version"
    description: ""
    type: string
    sql: ${operating_system} || ' ' || ${os_version} ;;
    hidden: no
  }

  dimension: os_w_version_major {
    group_label: "Operating System Details"
    label: "Operating System + Version (Major)"
    description: ""
    type: string
    sql: ${operating_system} || ' ' || ${os_version_major} ;;
    hidden: no
  }


  dimension: device_type {
    group_label: "Device Details"
    description: ""
    type: string
    sql: ${TABLE}.device_type ;;
    hidden: no
  }

  dimension: device_brand {
    group_label: "Device Details"
    description: ""
    type: string
    sql: ${TABLE}.device_brand ;;
    hidden: no
  }

  dimension: device_model {
    group_label: "Device Details"
    description: ""
    type: string
    sql: ${TABLE}.device_model ;;
    hidden: no
  }

  dimension: id {
    description: ""
    type: string
    sql: ${TABLE}.id ;;
    hidden: no
  }

  dimension: user_count {
    description: ""
    type: number
    sql: ${TABLE}.user_count ;;
    hidden: no
  }

  dimension: events {
    description: ""
    type: number
    sql: ${TABLE}.events ;;
    hidden: no
  }


  # DIMENSION GROUPS/DATES
  dimension_group: logging {
    description: ""
    type: time
    timeframes: [week, date, month, year, fiscal_quarter, fiscal_year]
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
    description: "The distinct count of Daily Server User Agent Events Servers within each grouping."
    type: count_distinct
    sql: ${server_id} ;;
  }

  measure: id_count {
    label: " Id Count"
    description: "The distinct count of Daily Server User Agent Events Id within each grouping."
    type: count_distinct
    sql: ${id} ;;
    hidden: yes
  }

  measure: user_count_sum {
    description: "The sum of User Counts within each grouping."
    type: sum
    group_label: "User Count Measures"
    sql: ${user_count} ;;
  }

  measure: user_count_max {
    description: "The max User Counts within each grouping."
    type: max
    group_label: "User Count Measures"
    sql: ${user_count} ;;
  }

  measure: user_count_min {
    description: "The min User Counts within each grouping."
    type: min
    group_label: "User Count Measures"
    sql: ${user_count} ;;
  }

  measure: user_count_avg {
    description: "The average User Counts within each grouping."
    type: average
    group_label: "User Count Measures"
    sql: ${user_count} ;;
  }

  measure: user_count_median {
    description: "The median  User Counts within each grouping."
    type: median
    group_label: "User Count Measures"
    sql: ${user_count} ;;
  }

  measure: events_max {
    description: "The max Events within each grouping."
    type: max
    group_label: "Events Measures"
    sql: ${events} ;;
  }

  measure: events_min {
    description: "The min Events within each grouping."
    type: min
    group_label: "Events Measures"
    sql: ${events} ;;
  }

  measure: events_avg {
    description: "The average Events within each grouping."
    type: average
    group_label: "Events Measures"
    sql: ${events} ;;
  }

  measure: events_median {
    description: "The median  Events within each grouping."
    type: median
    group_label: "Events Measures"
    sql: ${events} ;;
  }


}
