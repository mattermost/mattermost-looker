view: account_health_score {
  sql_table_name: "CS"."ACCOUNT_HEALTH_SCORE"
    ;;

  dimension: account_sfid {
    primary_key: yes
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

  dimension: last_task_under_30 {
    label: "Last Task <= 30 Days Ago"
    type: yesno
    sql: ${days_since_last_task} <= 30;;
  }

  dimension: last_task_over_30 {
    label: "Last Task > 30 Days Ago"
    type: yesno
    sql: ${days_since_last_task} > 30;;
  }

  dimension: last_task_over_90 {
    label: "Last Task > 90 Days Ago"
    type: yesno
    sql: ${days_since_last_task} > 90;;
  }

  dimension: health_score_no_override {
    type: number
    sql: ${TABLE}."HEALTH_SCORE_NO_OVERRIDE" ;;
  }

  dimension: health_score_tier {
    type: tier
    style: integer
    tiers: [10, 20, 30, 40, 50, 60, 70, 80, 90]
    sql: ${health_score_no_override} ;;
  }

  dimension: tenure_health_score_tier {
    type: tier
    style: integer
    tiers: [5, 10, 15, 20, 25]
    sql: ${tenure_health_score} ;;
  }

  dimension: license_end_date_health_score_tier {
    type: tier
    style: integer
    tiers: [5, 10, 15, 20, 25]
    sql: ${license_end_date_health_score} ;;
  }

  dimension: task_health_score_tier {
    type: tier
    style: integer
    tiers: [5, 10, 15, 20, 25]
    sql: ${task_health_score} ;;
  }

  dimension: ticket_health_score_tier {
    type: tier
    style: integer
    tiers: [5, 10, 15, 20, 25]
    sql: ${ticket_health_score} ;;
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

  measure: count_accounts {
    type: count_distinct
    sql: ${account_sfid} ;;
    drill_fields: [account.name,account_csm.name,health_score_no_override,tenure_in_yrs,tenure_health_score,license_end_date,license_end_date_health_score,
                   count_tickets_prev_90,ticket_health_score,days_since_last_task,task_health_score]
  }

  measure: count_last_task_under_30 {
    type: count_distinct
    sql: ${account_sfid} ;;
    filters: {
      field: last_task_under_30
      value: "yes"
    }
  }

  measure: count_last_task_over_30 {
    type: count_distinct
    sql: ${account_sfid} ;;
    filters: {
      field: last_task_over_30
      value: "yes"
    }
  }

  measure: count_last_task_over_90 {
    type: count_distinct
    sql: ${account_sfid} ;;
    filters: {
      field: last_task_over_90
      value: "yes"
    }
  }


  measure: avg_health_score {
    type: average_distinct
    value_format: "0"
    sql: ${health_score_no_override} ;;
  }
}
