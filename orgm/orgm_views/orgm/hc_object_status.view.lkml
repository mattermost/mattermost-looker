view: hc_object_status {
  view_label: ""
  derived_table: {
    sql: SELECT 'account' as object, _hc_lastop as lastop, count(*) as num_rows
      FROM "account"
      GROUP BY 1,2
      UNION
      SELECT 'campaign',_hc_lastop, count(*)
      FROM "campaign"
      GROUP BY 1,2
      UNION
      SELECT 'cm',_hc_lastop, count(*)
      FROM "campaignmember"
      GROUP BY 1,2
      UNION
      SELECT 'contact',_hc_lastop, count(*)
      FROM "contact"
      GROUP BY 1,2
      UNION
      SELECT 'lead',_hc_lastop, count(*)
      FROM "lead"
      GROUP BY 1,2
      UNION
      SELECT 'opportunity',_hc_lastop, count(*)
      FROM "opportunity"
      GROUP BY 1,2
      UNION
      SELECT 'oppt_li',_hc_lastop, count(*)
      FROM "opportunitylineitem"
      GROUP BY 1,2
      UNION
      SELECT 'user',_hc_lastop, count(*)
      FROM "user"
      GROUP BY 1,2
       ;;
  }


  measure: num_rows_total {
    type: sum
    sql: ${num_rows} ;;
    label: "# Rows"
    drill_fields: [detail*]
  }

  dimension: object {
    type: string
    sql: ${TABLE}."object" ;;
    label: "Object"
  }

  dimension: lastop {
    type: string
    sql: COALESCE(${TABLE}."lastop",'NONE') ;;
    label: "LastOp"
  }

  dimension: num_rows {
    type: number
    sql: ${TABLE}."num_rows" ;;
  }

  set: detail {
    fields: [object, lastop, num_rows]
  }
}
