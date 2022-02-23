view: 1day_retention_rate {
  derived_table: {
    sql: SELECT first_active_date
      , retention_1day_flag
      , first_server_edition
      , COUNT(DISTINCT server_id) instance_count FROM (
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
      , retention_1day_flag
      , first_server_edition
      ORDER BY first_active_date
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: first_active_date {
    label: "First Active Date"
    type: date
    sql: ${TABLE}."FIRST_ACTIVE_DATE" ;;
  }

  dimension: retention_1_day_flag {
    label: "1 Day Retention Flag (Yes/No)"
    type: string
    sql: ${TABLE}."RETENTION_1DAY_FLAG" ;;
  }

  dimension: first_server_edition {
    label: "First Server Edition (E0/TE)"
    type: string
    sql: ${TABLE}."FIRST_SERVER_EDITION" ;;
  }

  measure: instance_count {
    label: "Instance Count"
    type: number
    sql: ${TABLE}."INSTANCE_COUNT" ;;
  }

  set: detail {
    fields: [first_active_date, retention_1_day_flag, first_server_edition, instance_count]
  }
}
