view: zendesk_ticket_details {
  sql_table_name: "CS"."ZENDESK_TICKET_DETAILS"
    ;;

  dimension: account_sfid {
    type: string
    sql: ${TABLE}."ACCOUNT_SFID" ;;
  }

  dimension: agent_wait_time_in_minutes_bus {
    type: number
    sql: ${TABLE}."AGENT_WAIT_TIME_IN_MINUTES_BUS" ;;
  }

  dimension: agent_wait_time_in_minutes_cal {
    type: number
    sql: ${TABLE}."AGENT_WAIT_TIME_IN_MINUTES_CAL" ;;
  }

  dimension: assignee_name {
    type: string
    sql: ${TABLE}."ASSIGNEE_NAME" ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      date,
      week,
      month,
      fiscal_quarter,
      fiscal_year
    ]
    sql: ${TABLE}."CREATED_AT" ;;
  }

  dimension: customer_type {
    type: string
    sql: ${TABLE}."CUSTOMER_TYPE" ;;
  }

  dimension: enterprise_edition_version {
    type: string
    sql: ${TABLE}."ENTERPRISE_EDITION_VERSION" ;;
  }

  dimension: e20_customer_level_tier {
    type: string
    sql: ${TABLE}."E20_CUSTOMER_LEVEL_TIER" ;;
  }

  dimension: tags {
    type: string
    sql: ${TABLE}."TAGS" ;;
  }

  dimension: first_resolution_time_in_minutes_bus {
    type: number
    sql: ${TABLE}."FIRST_RESOLUTION_TIME_IN_MINUTES_BUS" ;;
  }

  dimension: first_resolution_time_in_minutes_cal {
    type: number
    sql: ${TABLE}."FIRST_RESOLUTION_TIME_IN_MINUTES_CAL" ;;
  }

  dimension: full_resolution_time_in_minutes_bus {
    type: number
    sql: ${TABLE}."FULL_RESOLUTION_TIME_IN_MINUTES_BUS" ;;
  }

  dimension: full_resolution_time_in_minutes_cal {
    type: number
    sql: ${TABLE}."FULL_RESOLUTION_TIME_IN_MINUTES_CAL" ;;
  }

  dimension: on_hold_time_in_minutes_bus {
    type: number
    sql: ${TABLE}."ON_HOLD_TIME_IN_MINUTES_BUS" ;;
  }

  dimension: on_hold_time_in_minutes_cal {
    type: number
    sql: ${TABLE}."ON_HOLD_TIME_IN_MINUTES_CAL" ;;
  }

  dimension: organization_name {
    type: string
    sql: ${TABLE}."ORGANIZATION_NAME" ;;
  }

  dimension: premium_support {
    type: string
    sql: ${TABLE}."PREMIUM_SUPPORT" ;;
  }

  dimension: reply_time_in_minutes_bus {
    type: number
    sql: ${TABLE}."REPLY_TIME_IN_MINUTES_BUS" ;;
  }

  dimension: reply_time_in_minutes_cal {
    type: number
    sql: ${TABLE}."REPLY_TIME_IN_MINUTES_CAL" ;;
  }

  dimension: requester_wait_time_in_minutes_bus {
    type: number
    sql: ${TABLE}."REQUESTER_WAIT_TIME_IN_MINUTES_BUS" ;;
  }

  dimension: requester_wait_time_in_minutes_cal {
    type: number
    sql: ${TABLE}."REQUESTER_WAIT_TIME_IN_MINUTES_CAL" ;;
  }

  dimension: satisfaction_rating_reason {
    type: string
    sql: ${TABLE}."SATISFACTION_RATING_REASON" ;;
  }

  dimension: satisfaction_rating_score {
    type: string
    sql: ${TABLE}."SATISFACTION_RATING_SCORE" ;;
  }

  dimension: ticket_id {
    type: number
    sql: ${TABLE}."TICKET_ID" ;;
    primary_key: yes
  }

  measure: count_tickets {
    type: count_distinct
    sql: ${ticket_id} ;;
    drill_fields: [organization_name, assignee_name]
  }

  # measure: avg_agent_wait_time_in_minutes_bus {
  #   type: average
  #   sql: ${agent_wait_time_in_minutes_bus} ;;
  # }

  # measure: avg_agent_wait_time_in_minutes_cal {
  #   type: average
  #   sql: ${agent_wait_time_in_minutes_cal} ;;
  # }

  # measure: avg_first_resolution_time_in_minutes_bus {
  #   type: average
  #   sql: ${first_resolution_time_in_minutes_bus} ;;
  # }

  # measure: avg_first_resolution_time_in_minutes_cal {
  #   type: average
  #   sql: ${first_resolution_time_in_minutes_cal} ;;
  # }

  measure: avg_full_resolution_time_in_minutes_bus {
    type: average
    sql: ${full_resolution_time_in_minutes_bus} ;;
  }

  measure: avg_full_resolution_time_in_minutes_cal {
    type: average
    sql: ${full_resolution_time_in_minutes_cal} ;;
  }

  measure: avg_on_hold_time_in_minutes_bus {
    type: average
    sql: ${on_hold_time_in_minutes_bus} ;;
  }

  measure: avg_on_hold_time_in_minutes_cal {
    type: average
    sql: ${on_hold_time_in_minutes_cal} ;;
  }

  measure: avg_reply_time_in_minutes_bus {
    type: average
    sql: ${reply_time_in_minutes_bus} ;;
  }

  measure: avg_reply_time_in_minutes_cal {
    type: average
    sql: ${reply_time_in_minutes_bus} ;;
  }

  measure: avg_requester_wait_time_in_minutes_bus {
    type: average
    sql: ${reply_time_in_minutes_bus} ;;
  }

  measure: avg_requester_wait_time_in_minutes_cal {
    type: average
    sql: ${reply_time_in_minutes_bus} ;;
  }

  measure: avg_satisfaction_rating_score {
    type: average
    sql: ${satisfaction_rating_score} ;;
  }

}
