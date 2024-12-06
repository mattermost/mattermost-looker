view: dim_user_agent {
  sql_table_name: "MART_COMMON".dim_user_agent ;;
  label: "User Agent"


  dimension: user_agent_id {
    type: string
    sql: ${TABLE}.user_agent_id ;;
    primary_key: yes
    hidden: yes
  }

  dimension: raw_user_agent {
    type: string
    sql: ${TABLE}.raw_user_agent ;;
    label: "User Agent (Full)"
    description: "The original user-agent string, as it was in the event."
  }


  dimension: browser_family {
    type: string
    sql: ${TABLE}.browser_family ;;
    description: "The family of the browser."
  }

  dimension: browser_version_major {
    type: number
    sql: ${TABLE}.browser_version_major ;;
    description: "The major version of the browser."
  }

  dimension: browser_version_minor {
    type: number
    sql: ${TABLE}.browser_version_minor ;;
    description: "The minor version of the browser."
  }

  dimension: browser_version_patch {
    type: string
    sql: ${TABLE}.browser_version_patch ;;
    description: "The patch version of the browser."
  }

  dimension: device_brand {
    type: string
    sql: ${TABLE}.device_brand ;;
    description: "The brand of the device running the browser/app."
  }

  dimension: device_family {
    type: string
    sql: ${TABLE}.device_family ;;
    description: "The family of the device running the browser/app."
  }

  dimension: device_model {
    type: string
    sql: ${TABLE}.device_model ;;
    description: "The model of the device running the browser/app."
  }

  dimension: os_family {
    type: string
    sql: ${TABLE}.os_family ;;
    description: "The family of the Operating System running the browser/app."
  }

  dimension: os_version_major {
    type: string
    description: "The major version of the Operating System running the browser/app. Can be string (i.e. for Windows NT)."
  }

  dimension: os_version_minor {
    type: string
    sql: ${TABLE}.os_version_minor ;;
    description: "The minor version of the Operating System running the browser/app."
  }

  dimension: os_version_patch {
    type: string
    sql: ${TABLE}.os_version_patch ;;
    description: "The patch version of the Operating System running the browser/app."

  }

  dimension: os_version_patch_minor {
    type: string
    sql: ${TABLE}.os_version_patch_minor ;;
    description: "The mionor patch version of the Operating System running the browser/app."
  }

}
