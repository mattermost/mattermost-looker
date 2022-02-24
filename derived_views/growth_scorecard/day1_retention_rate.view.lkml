view: day1_retention_rate {
  derived_table: {
    sql: -- This query pulls Instance counts for all Cloud servers, by first active date, along with a flag set if the instance had any activity after 1 day of being active
      --We're trying to determine Day 1 retention rate for all new Cloud Servers created
     SELECT first_active_date
      , first_server_edition
      , COUNT(DISTINCT server_id) instance_count
      , COUNT(DISTINCT CASE WHEN retention_1day_flag = 'No' THEN server_id END) instance_count_retention_flag_no
      , COUNT(DISTINCT CASE WHEN retention_1day_flag = 'Yes' THEN server_id END) instance_count_retention_flag_yes
      FROM (
      SELECT DISTINCT server_fact.server_id
      , (CASE WHEN COALESCE(server_fact.retention_1day_flag, false)  THEN 'Yes' ELSE 'No' END) AS retention_1day_flag
      ,server_fact.first_active_date::DATE AS first_active_date
      , CASE WHEN server_fact.first_server_edition = 'true' THEN 'E0' WHEN server_fact.first_server_edition = 'false' THEN 'TE' ELSE NULL END first_server_edition
            FROM mattermost.server_fact AS server_fact
      LEFT JOIN mattermost.excludable_servers AS excludable_servers ON server_fact.server_id = excludable_servers.server_id
      WHERE (NOT (CASE WHEN server_fact.installation_id IS NOT NULL THEN TRUE ELSE FALSE END )
      OR (CASE WHEN server_fact.installation_id IS NOT NULL THEN TRUE ELSE FALSE END ) IS NULL)
      AND (server_fact.first_active_date) >= (TO_TIMESTAMP('2020-02-02'))
      AND excludable_servers.reason IS NULL
      ) GROUP BY first_active_date
      , first_server_edition
      ORDER BY first_active_date
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
    sql: ${TABLE}."FIRST_ACTIVE_DATE" ;;
  }

  dimension: instance_count_retention_flag_no {
    label: "Instance Counts with no Day 1 retention"
    type: number
    sql: ${TABLE}."instance_count_retention_flag_no" ;;
  }

  dimension: instance_count_retention_flag_yes {
    label: "Instance Counts with Day 1 retention"
    type: number
    sql: ${TABLE}."instance_count_retention_flag_yes" ;;
  }

  dimension: first_server_edition {
    label: "First Server Edition (E0/TE)"
    type: string
    sql: ${TABLE}."FIRST_SERVER_EDITION" ;;
  }

  dimension: instance_count {
    label: "Instance Count"
    type: number
    sql: ${TABLE}."INSTANCE_COUNT" ;;
  }

  measure: m_instance_count {
    label: "Instance Count"
    type: number
    sql: ${TABLE}."INSTANCE_COUNT" ;;
  }

  measure: m_instance_count_retention_flag_no {
    label: "Instance Counts with no Day 1 retention"
    type: number
    sql: ${TABLE}."instance_count_retention_flag_no" ;;
  }

  measure: m_instance_count_retention_flag_yes {
    label: "Instance Counts with Day 1 retention"
    type: number
    sql: ${TABLE}."instance_count_retention_flag_yes" ;;
  }

  set: detail {
    fields: [first_active_date, first_server_edition, instance_count, instance_count_retention_flag_no, instance_count_retention_flag_yes,
      m_instance_count, m_instance_count_retention_flag_no, m_instance_count_retention_flag_yes]
  }
}
