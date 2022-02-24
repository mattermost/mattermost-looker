view: day1_retention_rate {
  derived_table: {
    sql: -- This query pulls Instance counts for all Cloud servers, by first active date, along with a flag set if the instance had any activity after 1 day of being active
      --We're trying to determine Day 1 retention rate for all new Cloud Servers created
     SELECT first_active_date as "first_active_date"
      , first_server_edition as "first_server_edition"
      , server_id as "server_id"
      , retention_1day_flag as "retention_1day_flag"
      , installation_id as "installation_id"
      FROM (
      SELECT DISTINCT server_fact.server_id
      , (CASE WHEN COALESCE(server_fact.retention_1day_flag, false)  THEN 'Yes' ELSE 'No' END) AS retention_1day_flag
      ,server_fact.first_active_date::DATE AS first_active_date
      , CASE WHEN server_fact.first_server_edition = 'true' THEN 'E0' WHEN server_fact.first_server_edition = 'false' THEN 'TE' ELSE NULL END first_server_edition
      , server_fact.installation_id
            FROM mattermost.server_fact AS server_fact
      LEFT JOIN mattermost.excludable_servers AS excludable_servers ON server_fact.server_id = excludable_servers.server_id
      WHERE (server_fact.first_active_date) >= (TO_TIMESTAMP('2020-02-02'))
      AND excludable_servers.reason IS NULL
      ) ORDER BY first_active_date
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

# DIMENSIONS

  dimension: first_active_date {
    label: "First Active Date"
    type: date
    sql: ${TABLE}."first_active_date" ;;
  }

  dimension: first_server_edition {
    label: "First Server Edition (E0/TE)"
    type: string
    sql: ${TABLE}."first_server_edition" ;;
  }

  dimension: server_id {
    label: "Server ID"
    type: string
    sql: ${TABLE}."server_id" ;;
  }

  dimension: retention_1day_flag {
    label: "Boolean indicating the instance was retained after 1 day(s) since their first active date."
    type: number
    sql: ${TABLE}."retention_1day_flag" ;;
  }

  dimension: installation_id {
    label: "Installation ID"
    description: "The unique ID provided to cloud servers."
    type: string
    sql: ${TABLE}."installation_id" ;;
  }

  dimension: cloud_server {
    label: "Cloud Workspace"
    description: "Indicates whether the server is using Mattermost's cloud product."
    type: yesno
    sql: CASE WHEN ${installation_id} IS NOT NULL THEN TRUE ELSE FALSE END ;;
  }

  measure: instance_count {
    label: "Instance Count"
    group_label: " Instance Counts"
    type: count_distinct
    sql: ${server_id} ;;
  }

  measure: active_instances_day1 {
    label: "Day 1 Active Instances"
    group_label: " Instance Counts"
    type: count_distinct
    sql: CASE WHEN ${retention_1day_flag} = 'Yes' THEN ${server_id} ELSE NULL END;;
  }

  measure: inactive_instances_day1 {
    label: "Day 1 Inactive Instances"
    group_label: " Instance Counts"
    type: count_distinct
    sql: CASE WHEN ${retention_1day_flag} = 'No' THEN ${server_id} ELSE NULL END;;
  }

  set: detail {
    fields: [first_active_date, first_server_edition, server_id, retention_1day_flag, installation_id, cloud_server, instance_count,
      active_instances_day1, inactive_instances_day1]
  }
}
