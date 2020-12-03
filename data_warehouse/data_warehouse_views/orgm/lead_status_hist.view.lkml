view: lead_status_hist {
  sql_table_name: "ORGM"."LEAD_STATUS_HIST"
    ;;

  dimension_group: date {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      fiscal_quarter,
      fiscal_year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."DATE" ;;
  }

  dimension: lead_sfid {
    type: string
    sql: ${TABLE}."LEAD_SFID" ;;
  }

  dimension: micro_status {
    type: string
    sql: ${TABLE}."MICRO_STATUS" ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}."STATUS" ;;
  }

  dimension: owner {
    type: string
    sql: ${TABLE}."OWNER" ;;
    hidden: yes
  }

  dimension: owner_name {
    type: string
    sql: ${user.name} ;;
  }

  dimension: additional_details {
    type: string
    sql: ${TABLE}."ADDITIONAL_DETAILS" ;;
  }

  dimension: current_lead_status {
    label: "Current Status"
    type: string
    sql: ${lead.status} ;;
  }

  measure: count_leads {
    type: count_distinct
    sql: ${lead_sfid} ;;
    drill_fields: [owner_name, lead.email, additional_details, lead_sfid, current_lead_status, date_date, lead.most_recent_scl_date]
  }
}
