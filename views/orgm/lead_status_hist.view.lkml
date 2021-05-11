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
      fiscal_quarter_of_year,
      fiscal_year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."DATE" ;;
  }

  dimension: date_fiscal_quarter_string {
    type:  string
    sql:${date_fiscal_year} || '-' || ${date_fiscal_quarter_of_year};;
    label: "Date Fiscal Quarter"
    group_item_label: "Date Fiscal Quarter (String)"
    group_label: "Date"
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
    sql: CASE WHEN ${lead.ownerid} != '00G1R000003KGjFUAW' AND ${lead.ownerid} NOT LIKE '00G360000026ZoQ%' AND ${lead.ownerid} NOT  LIKE '00G3p000005V9UP%' THEN ${lead.owner_name} ELSE ${user.name} END ;;
  }

  dimension: owner_segment {
    type: string
    sql: CASE WHEN ${lead.ownerid} != '00G1R000003KGjFUAW' AND ${lead.ownerid} NOT LIKE '00G360000026ZoQ%' AND ${lead.ownerid} NOT  LIKE '00G3p000005V9UP%' THEN ${lead.owner_segment} ELSE ${user.sales_segment} END ;;
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

  dimension: mql_sla_breached {
    label: "Contact Us MQL SLA Breached"
    type: yesno
    sql: CASE WHEN ${lead.status} = 'MQL' AND ${additional_details} like 'Contact%' AND ${date_date} < current_date - interval '1 days' AND ${lead.most_recent_mql_date} < current_date THEN true else false end ;;
  }

  measure: count_leads {
    type: count_distinct
    sql: ${lead_sfid} ;;
    drill_fields: [owner_name, lead.email, additional_details, lead_sfid, current_lead_status, date_date, lead.most_recent_scl_date]
  }

  measure: count_mql_leads {
    type: count_distinct
    sql: ${lead_sfid} ;;
    filters: [status: "MQL"]
    drill_fields: [owner_name, lead.email, additional_details, lead_sfid, current_lead_status, date_date]
  }

  measure: count_scl_leads {
    type: count_distinct
    sql: ${lead_sfid} ;;
    filters: [status: "SCL"]
    drill_fields: [owner_name, lead.email, additional_details, lead_sfid, current_lead_status, date_date]
  }

  measure: count_qso_leads {
    type: count_distinct
    sql: ${lead_sfid} ;;
    filters: [status: "QSO"]
    drill_fields: [owner_name, lead.email, additional_details, lead_sfid, current_lead_status, date_date]
  }

  measure: count_qsc_leads {
    type: count_distinct
    sql: ${lead_sfid} ;;
    filters: [status: "QSC"]
    drill_fields: [owner_name, lead.email, additional_details, lead_sfid, current_lead_status, date_date]
  }
}
