view: 1day_retention_rate {
  derived_table: {
    sql: SELECT * FROM (
      SELECT *, DENSE_RANK() OVER (ORDER BY z___min_rank) as z___pivot_row_rank, RANK() OVER (PARTITION BY z__pivot_col_rank ORDER BY z___min_rank) as z__pivot_col_ordering, CASE WHEN z___min_rank = z___rank THEN 1 ELSE 0 END AS z__is_highest_ranked_cell FROM (
      SELECT *, MIN(z___rank) OVER (PARTITION BY "server_fact.first_active_date") as z___min_rank FROM (
      SELECT *, RANK() OVER (ORDER BY "server_fact.first_active_date" DESC, z__pivot_col_rank) AS z___rank FROM (
      SELECT *, DENSE_RANK() OVER (ORDER BY CASE WHEN "server_fact.retention_1day_flag" IS NULL THEN 1 ELSE 0 END, "server_fact.retention_1day_flag") AS z__pivot_col_rank FROM (
      SELECT
          (CASE WHEN COALESCE(server_fact.retention_1day_flag, false)  THEN 'Yes' ELSE 'No' END) AS "server_fact.retention_1day_flag",
              server_fact.FIRST_ACTIVE_DATE::DATE AS "server_fact.first_active_date",
          COUNT(DISTINCT server_fact.SERVER_ID) AS "server_fact.server_count"
      FROM
          MATTERMOST.SERVER_FACT AS server_fact
          LEFT JOIN MATTERMOST.EXCLUDABLE_SERVERS AS excludable_servers ON server_fact.SERVER_ID = excludable_servers.SERVER_ID
      WHERE (NOT (CASE WHEN server_fact.installation_id IS NOT NULL THEN TRUE ELSE FALSE END ) OR (CASE WHEN server_fact.installation_id IS NOT NULL THEN TRUE ELSE FALSE END ) IS NULL) AND (CASE WHEN server_fact.first_server_edition = 'true' THEN 'E0' WHEN server_fact.first_server_edition = 'false' THEN 'TE' ELSE NULL END) = 'E0' AND (server_fact.FIRST_ACTIVE_DATE) >= (TO_TIMESTAMP('2020-02-02')) AND (server_fact.FIRST_ACTIVE_DATE) > ((DATEADD('month', 0, DATE_TRUNC('month', CURRENT_DATE())))) AND excludable_servers.REASON IS NULL
      GROUP BY
      server_fact.FIRST_ACTIVE_DATE,
          1) ww
      ) bb WHERE z__pivot_col_rank <= 16384
      ) aa
      ) xx
      ) zz
       WHERE (z__pivot_col_rank <= 50 OR z__is_highest_ranked_cell = 1) AND (z___pivot_row_rank <= 500 OR z__pivot_col_ordering = 1) ORDER BY z___pivot_row_rank
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: server_fact_retention_1day_flag {
    type: string
    sql: ${TABLE}."server_fact.retention_1day_flag" ;;
  }

  dimension: server_fact_first_active_date {
    type: date
    sql: ${TABLE}."server_fact.first_active_date" ;;
  }

  dimension: server_fact_server_count {
    type: number
    sql: ${TABLE}."server_fact.server_count" ;;
  }

  dimension: z__pivot_col_rank {
    type: number
    sql: ${TABLE}."Z__PIVOT_COL_RANK" ;;
  }

  dimension: z___rank {
    type: number
    sql: ${TABLE}."Z___RANK" ;;
  }

  dimension: z___min_rank {
    type: number
    sql: ${TABLE}."Z___MIN_RANK" ;;
  }

  dimension: z___pivot_row_rank {
    type: number
    sql: ${TABLE}."Z___PIVOT_ROW_RANK" ;;
  }

  dimension: z__pivot_col_ordering {
    type: number
    sql: ${TABLE}."Z__PIVOT_COL_ORDERING" ;;
  }

  dimension: z__is_highest_ranked_cell {
    type: number
    sql: ${TABLE}."Z__IS_HIGHEST_RANKED_CELL" ;;
  }

  set: detail {
    fields: [
      server_fact_retention_1day_flag,
      server_fact_first_active_date,
      server_fact_server_count,
      z__pivot_col_rank,
      z___rank,
      z___min_rank,
      z___pivot_row_rank,
      z__pivot_col_ordering,
      z__is_highest_ranked_cell
    ]
  }
}
