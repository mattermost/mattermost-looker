view: fct_nps_feedback {

  label: "NPS Feedback"
  sql_table_name: "MART_PRODUCT"."FCT_NPS_FEEDBACK" ;;

  dimension: feedback {
    type: string
    sql: ${TABLE}."FEEDBACK" ;;
    label: "NPS Feedback"
    view_label: "NPS Feedback"
  }

  dimension_group: feedback {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."FEEDBACK_DATE" ;;
    label: "Feedback Date"
    view_label: "NPS Feedback"
  }

  dimension: license_id {
    type: string
    sql: ${TABLE}."LICENSE_ID" ;;
    label: "License ID"
    view_label: "NPS Feedback: Metadata"
  }

  dimension: score {
    type: number
    sql: ${TABLE}."SCORE" ;;
    label: "NPS Score"
    view_label: "NPS Feedback"
  }

  dimension_group: score {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."SCORE_DATE" ;;
    label: "Score Date"
    view_label: "NPS Feedback"
  }

  dimension: server_id {
    type: string
    sql: ${TABLE}."SERVER_ID" ;;
    label: "Server ID"
    view_label: "NPS Feedback: Metadata"
  }

  dimension: server_version {
    type: string
    sql: ${TABLE}."SERVER_VERSION" ;;
  }

  dimension: user_email {
    type: string
    sql: ${TABLE}."USER_EMAIL" ;;
    label: "User Email"
    view_label: "NPS Feedback"
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}."USER_ID" ;;
    label: "User ID"
    view_label: "NPS Feedback: Metadata"
  }

  dimension: user_role {
    type: string
    sql: ${TABLE}."USER_ROLE" ;;
    label: "User Role"
    view_label: "NPS Feedback"
  }
}
