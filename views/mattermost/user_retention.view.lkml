view: user_retention {

  sql_table_name: "MATTERMOST"."USER_RETENTION";;
  drill_fields: [id]


  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}."ID" ;;
  }

  dimension_group: first_active_timestamp {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."FIRST_ACTIVE_TIMESTAMP" ;;
  }

  dimension: first_server_edition {
    type: string
    sql: ${TABLE}."FIRST_SERVER_EDITION" ;;
  }

  dimension: installation_id {
    label: "Installation ID"
    description: "The Installation ID of the user."
    type: string
    sql: ${TABLE}."INSTALLATION_ID" ;;
  }

  dimension: retention_14_day_flag {
    type: yesno
    sql: ${TABLE}."RETENTION_14DAY_FLAG" ;;
  }

  dimension: retention_1_day_flag {
    type: yesno
    sql: ${TABLE}."RETENTION_1DAY_FLAG" ;;
  }

  dimension: retention_28_day_flag {
    type: yesno
    sql: ${TABLE}."RETENTION_28DAY_FLAG" ;;
  }

  dimension: retention_7_day_flag {
    type: yesno
    sql: ${TABLE}."RETENTION_7DAY_FLAG" ;;
  }

  dimension: server_id {
    label: "Instance Id"
    description: "The Instance Id of the user."
    type: string
    sql: ${TABLE}."SERVER_ID" ;;
  }

  dimension: user_id {
    label: "User ID"
    description: "The User Id of the user."
    type: string
    sql: ${TABLE}."USER_ID" ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }

  measure: server_count {
    group_label: "Instance Counts"
    label: "Total Instances"
    description: "The distinct count of Instances."
    type: count_distinct
    sql:  ${server_id} ;;
    drill_fields: [id]
  }

  measure: user_count {
    group_label: "User Counts"
    label: "Total Users"
    description: "The distinct count of Users."
    type: count_distinct
    sql:  ${user_id} ;;
    drill_fields: [id]
  }

  measure: retention_1_day_users {
    group_label: "User Counts"
    label: "Retained Day 1 Users"
    description: "The distinct count of servers/workspaces with Retained Day 1 Users marked true."
    type: count_distinct
    sql: CASE WHEN ${retention_1_day_flag} THEN ${user_id} ELSE NULL END;;
    drill_fields: [id]
  }

  measure: retention_7_day_users {
    group_label: "User Counts"
    label: "Retained Day 7 Users"
    description: "The distinct count of servers/workspaces with Retained Day 7 Users marked true."
    type: count_distinct
    sql: CASE WHEN ${retention_7_day_flag} THEN ${user_id} ELSE NULL END;;
    drill_fields: [id]
  }

  measure: retention_14_day_users {
    group_label: "User Counts"
    label: "Retained Day 14 Users"
    description: "The distinct count of servers/workspaces with Retained Day 14 Users marked true."
    type: count_distinct
    sql: CASE WHEN ${retention_14_day_flag} THEN ${user_id} ELSE NULL END;;
    drill_fields: [id]
  }

  measure: retention_28_day_users {
    group_label: "User Counts"
    label: "Retained 28 Day Users"
    description: "The distinct count of servers/workspaces with Retained Day 28 Users marked true."
    type: count_distinct
    sql: CASE WHEN ${retention_28_day_flag} THEN ${user_id} ELSE NULL END;;
    drill_fields: [id]
  }

}
