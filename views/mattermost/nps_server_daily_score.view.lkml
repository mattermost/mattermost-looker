# This is the view file for the analytics.mattermost.nps_server_monthly_score table.
view: nps_server_daily_score {
  sql_table_name: mattermost.nps_server_daily_score ;;
  view_label: "Nps Server Daily Score"
  # SETS
  set: nps_server_core {
    fields: [promoters, detractors, passives, nps_users, avg_score, avg_nps_score, nps_score, responses, responses_alltime, feedback, feedback_responses,
      server_install_date, server_install_month, server_install_year, avg_nps_score, nps_users_sum, responses_sum, server_count, promoters_sum, detractors_sum, passives_sum,
      nps_score_all]
  }


  # FILTERS
  filter: current_record {
    description: "Boolean indicating the data provided shows the state of each server's NPS in the current month."
    type: yesno
    sql: CASE WHEN ${date_date} = DATE_TRUNC('day', CURRENT_DATE) THEN True ELSE False END ;;
  }

  # DIMENSIONS
  dimension: server_id {
    description: "The telemetry id associated with each distinct Mattermost Instance (Server/Cloud Workspace) and the NPS User response submissions."
    type: string
    sql: ${TABLE}.server_id ;;
    hidden: no
  }

  dimension: id {
    description: "The unique id associated with the server responses in a given month."
    type: string
    sql: ${TABLE}.id ;;
    hidden: yes
  }

  dimension: server_version {
    description: "The server version associated with the server in the given month."
    type: string
    sql: ${TABLE}.server_verion ;;
    hidden: no
  }

  dimension: promoters {
    description: "The count of NPS users associated with the server that are promoters (score > 8)."
    type: number
    sql: ${TABLE}.promoters ;;
    hidden: no
  }

  dimension: detractors {
    description: "The count of NPS users associated with the server that are detractors (score < 7)."
    type: number
    sql: ${TABLE}.detractors ;;
    hidden: no
  }

  dimension: passives {
    description: "The count of NPS users associated with the server that are passives (score >= 7 & <= 8)."
    type: number
    sql: ${TABLE}.passives ;;
    hidden: no
  }

  dimension: nps_users {
    description: "The count of all NPS users associated with the server (users that have submitted an NPS survey response)."
    type: number
    sql: ${TABLE}.nps_users ;;
    hidden: no
  }

  dimension: avg_score {
    description: "The average raw score provided by all NPS users associated with the server. This score is used to classify users as promoters (score > 8), detractors (score < 7), and passives (score >= 7 & <= 8)."
    type: number
    sql: ${TABLE}.avg_score ;;
    value_format_name: decimal_1
    hidden: no
  }

  dimension: nps_score {
    description: "The NPS score calculated as: NPS Score = 100 * (% Promoters - % Detractors)."
    type: number
    sql: ${TABLE}.nps_score ;;
    value_format_name: decimal_1
    hidden: no
  }

  dimension: responses {
    label: "Responses (Monthly)"
    description: "The sum of NPS user responses associated with the server in the given month."
    type: number
    sql: ${TABLE}.responses ;;
    hidden: no
  }

  dimension: responses_alltime {
    label: "Responses (All Time)"
    description: "The sum of NPS user responses associated with the server since their first NPS submission up until the given month."
    type: number
    sql: ${TABLE}.responses_alltime ;;
    hidden: no
  }

  dimension: feedback {
    description: ""
    type: string
    sql: ${TABLE}.feedback ;;
    hidden: no
  }

  dimension: feedback_responses {
    description: "The sum of NPS user feedback responses associated with the server in the given month."
    type: number
    sql: ${TABLE}.feedback_responses ;;
    hidden: no
  }

  dimension: feedback_responses_alltime {
    label: "Feedback Responses (All Time)"
    description: "The sum of NPS user feedback responses associated with the server since their first NPS feedback submission up until the given month."
    type: number
    sql: ${TABLE}.feedback_responses_alltime ;;
    hidden: no
  }


  # DIMENSION GROUPS/DATES
  dimension_group: date {
    label: "Logging"
    description: "The month and year the current row of NPS data represents. It projects forward for all servers that have ever had a user submit an NPS score, which allows us to track the servers scores regardless of whether an NPS submissions took place in the given month."
    type: time
    timeframes: [date, week, month, year]
    sql: ${TABLE}.date ;;
    hidden: no
  }

  dimension_group: server_install {
    description: "The date the server was installed."
    type: time
    timeframes: [date, week, month, year]
    sql: ${TABLE}.server_install_date ;;
    hidden: no
  }


  # MEASURES
  measure: count {
    description: "Count of rows/occurrences."
    type: count
    value_format_name: decimal_0
  }

  measure: server_count {
    label: " Server Count"
    description: "The distinct count of Servers per grouping."
    type: count_distinct
    value_format_name: decimal_0
    sql: ${server_id} ;;
  }

  measure: nps_users_sum {
    label: "NPS Users (Sum)"
    description: "The sum of Nps Users that have submitted NPS responses across all servers per grouping."
    type: sum
    value_format_name: decimal_0
    sql: ${nps_users} ;;
  }

  measure: avg_nps_score {
    label: "Avg. NPS Score"
    description: "The average NPS score across all servers per grouping."
    type: average
    value_format_name: decimal_1
    sql: ${nps_score} ;;
  }

  measure: responses_sum {
    label: "Sum of Responses"
    description: "The sum of the count of all NPS user Responses across all servers per grouping."
    type: sum
    value_format_name: decimal_0
    sql: ${responses} ;;
  }

  measure: responses_alltime_sum {
    label: "Sum of Responses (All Time)"
    description: "The sum of the count of all NPS Responses (All Time) across all servers per grouping."
    type: sum
    value_format_name: decimal_0
    sql: ${responses_alltime} ;;
    hidden: yes
  }

  measure: detractors_sum {
    label: "Detractors (Sum)"
    description: "The sum of the count of all NPS Detractor responses across all servers per grouping."
    type: sum
    value_format_name: decimal_0
    sql: ${detractors} ;;
    hidden: no
  }

  measure: promoters_sum {
    label: "Promoters (Sum)"
    description: "The sum of the count of all NPS Promoter responses across all servers per grouping."
    type: sum
    value_format_name: decimal_0
    sql: ${promoters} ;;
    hidden: no
  }

  measure: passives_sum {
    label: "Passives (Sum)"
    description: "The sum of the count of all NPS Passive responses across all servers per grouping."
    type: sum
    value_format_name: decimal_0
    sql: ${passives} ;;
    hidden: no
  }

  measure: nps_score_all {
    label: "NPS Score (Agg.)"
    description: "The aggregate NPS Score across all servers per grouping based on the NPS calculation: NPS Score = 100 * (% Promoters - % Detractors). "
    type: number
    sql: 100.0 * ((${promoters_sum}/nullif(${nps_users_sum},0))-(${detractors_sum}/nullif(${nps_users_sum},0))) ;;
    value_format_name: decimal_1
  }


}
