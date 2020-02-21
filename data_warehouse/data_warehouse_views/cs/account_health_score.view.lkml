view: account_health_score {
  sql_table_name: "CS"."ACCOUNT_HEALTH_SCORE"
    ;;

  dimension: account_sfid {
    type: string
    sql: ${TABLE}."ACCOUNT_SFID" ;;
  }

  dimension: count_tickets_prev_90 {
    type: number
    sql: ${TABLE}."COUNT_TICKETS_PREV_90" ;;
  }

  dimension: cs_attrition_likelihood {
    type: number
    sql: ${TABLE}."CS_ATTRITION_LIKELIHOOD" ;;
  }

  dimension: days_since_last_task {
    type: number
    sql: ${TABLE}."DAYS_SINCE_LAST_TASK" ;;
  }

  dimension: health_score_no_override {
    type: number
    sql: ${TABLE}."HEALTH_SCORE_NO_OVERRIDE" ;;
  }

  dimension: health_score_w_override {
    type: number
    sql: ${TABLE}."HEALTH_SCORE_W_OVERRIDE" ;;
  }

  dimension_group: license_end {
    type: time
    timeframes: [
      date,
      month,
      fiscal_quarter,
      fiscal_quarter_of_year,
      year,
      fiscal_year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."LICENSE_END_DATE" ;;
  }

  dimension: license_end_date_health_score {
    type: number
    sql: ${TABLE}."LICENSE_END_DATE_HEALTH_SCORE" ;;
  }

  dimension: task_health_score {
    type: number
    sql: ${TABLE}."TASK_HEALTH_SCORE" ;;
  }

  dimension: tenure_health_score {
    type: number
    sql: ${TABLE}."TENURE_HEALTH_SCORE" ;;
  }

  dimension: tenure_in_yrs {
    type: number
    sql: ${TABLE}."TENURE_IN_YRS" ;;
  }

  dimension: ticket_health_score {
    type: number
    sql: ${TABLE}."TICKET_HEALTH_SCORE" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
