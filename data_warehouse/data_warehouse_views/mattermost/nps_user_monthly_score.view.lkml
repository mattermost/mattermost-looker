# This is the view file for the analytics.mattermost.nps_user_monthly_score table.
view: nps_user_monthly_score {
  sql_table_name: mattermost.nps_user_daily_score ;;
  view_label: "Nps User Daily Score"

  # FILTERS
  filter: last_day_of_month {
    type: yesno
    description: "Filters so the logging date is equal to the last day of the month. Useful when grouping by month to report on server states in the given month."
    sql: CASE WHEN ${month_date} =
                                      CASE WHEN DATE_TRUNC('month', ${month_date}::date) = DATE_TRUNC('month', CURRENT_DATE) THEN (SELECT MAX(date) FROM mattermost.server_daily_details)
                                        ELSE DATEADD(MONTH, 1, DATE_TRUNC('month',${month_date}::date)) - INTERVAL '1 DAY' END
          THEN TRUE ELSE FALSE END ;;
  }

  filter: score_submission_date {
    type: yesno
    description: "Filters so the only rows that appear are days where a new NPS submission was received. Useful when displaying raw data to prevent fanning out by logging date."
    sql: CASE WHEN ${month_date}::date = ${last_score_date}::date THEN TRUE ELSE FALSE END ;;
  }

  filter: feeedback_submission_date {
    type: yesno
    description: "Filters so the only rows that appear are days where a new NPS Feedback submission was received. Useful when displaying raw data to prevent fanning out by logging date."
    sql: CASE WHEN ${month_date}::date = ${last_feedback_date}::date THEN TRUE ELSE FALSE END ;;
  }

  # DIMENSIONS
  dimension: server_id {
    description: "The server id associated with the user that submitted the NPS response."
    type: string
    sql: ${TABLE}.server_id ;;
    hidden: no
  }

  dimension: user_id {
    description: "The user id of the user that submitted the NPS response."
    type: string
    sql: ${TABLE}.user_id ;;
    hidden: no
  }

  dimension: user_role {
    description: "The role of the user as it pertains to Mattermost access (user, system_admin, and team_admin)."
    type: string
    sql: ${TABLE}.user_role ;;
    hidden: no
  }

  dimension: server_version {
    description: "The Mattermost server version associated with the user's server at the point in time that they submitted the NPS response."
    type: string
    sql: ${TABLE}.server_version ;;
    hidden: no
  }

  dimension: score {
    description: "The raw score provided by the user in the NPS survey (Scale of 0-10 how likely are you to recommend Mattermost to a colleague/friend)."
    type: number
    sql: ${TABLE}.score ;;
    hidden: no
  }

  dimension: license_id {
    description: "The Mattermost enterprise license id associated with the user's server that submitted the NPS response."
    type: string
    sql: ${TABLE}.license_id ;;
    hidden: no
  }

  dimension: license_sku {
    description: "The Mattermost License SKU associated with the user's mattermost license (E10 & E20)."
    type: string
    sql: ${TABLE}.license_sku ;;
    hidden: no
  }

  dimension: promoter_type {
    description: "The NPS Promoter Type classified by the user's score (Detractor: < 7; Passive: >= 7 & <= 8; Promoter > 8)."
    type: string
    sql: ${TABLE}.promoter_type ;;
    hidden: no
  }

  dimension: feedback {
    description: "Qualitative, raw feedback submitted by the user about ways to improve the product."
    type: string
    sql: ${TABLE}.feedback ;;
    hidden: no
  }

  dimension: id {
    description: "Unique identifier generated for each NPS User per month."
    type: string
    sql: ${TABLE}.id ;;
    hidden: no
  }


  # DIMENSION GROUPS/DATES
  dimension_group: month {
    label: "NPS Logging"
    description: "The month and year the current row of NPS data represents. It projects forward for all users that have ever submitted an NPS score so that their most recent scores are represented in all future months when calculating NPS."
    type: time
    timeframes: [date, week, month, year]
    sql: ${TABLE}.date ;;
    hidden: no
  }

  dimension_group: last_score {
    description: "The last time the user provided an NPS response."
    type: time
    timeframes: [date, week, month, year]
    sql: ${TABLE}.last_score_date ;;
    hidden: no
  }

  dimension_group: user_created_at {
    description: "The date the NPS user was first created."
    type: time
    timeframes: [date, week, month, year]
    sql: ${TABLE}.user_created_at ;;
    hidden: no
  }

  dimension: user_age {
    description: "The user's age at the time of NPS Score submission."
    label: "User Age (Days)"
    type: number
    value_format_name: decimal_0
    sql: datediff(day, ${user_created_at_date}::date, ${last_score_date}::date) ;;
  }

  dimension: user_age_band {
    description: "The user's age at the time of NPS Score submission stratified into bands (30-60-90-180-365-730 Days)."
    label: "User Age Band (Days)"
    type: tier
    style: integer
    tiers: [31, 61, 91, 181, 366, 731]
    value_format_name: decimal_0
    sql: ${user_age}  ;;
  }

  dimension_group: server_install {
    description: "The date the user's (responding to the NPS survey) server was installed."
    type: time
    timeframes: [date, week, month, year]
    sql: ${TABLE}.server_install_date ;;
    hidden: no
  }

  dimension: server_age {
    label: "Server Age (Days)"
    description: "The server's age at the time of NPS Score submission."
    type: number
    value_format_name: decimal_0
    sql: datediff(day, ${server_install_date}::date, ${last_score_date}::date) ;;
    hidden: no
  }

  dimension: server_age_band {
    description: "The server's age at the time of NPS Score submission stratified into bands (30-60-90-180-365-730 Days)."
    label: "Server Age Band (Days)"
    type: tier
    style: integer
    tiers: [31, 61, 91, 181, 366, 731]
    value_format_name: decimal_0
    sql: ${server_age}  ;;
  }

  dimension_group: last_feedback {
    description: "The last time the user provided an NPS Feedback response."
    type: time
    timeframes: [date, week, month, year]
    sql: ${TABLE}.last_feedback_date ;;
    hidden: no
  }

  dimension: responses {
    description: "NPS responses sent by the user in the record month. Users can submit multiple score responses in a given month."
    type: string
    sql: ${TABLE}.responses ;;
  }

  dimension: responses_alltime {
    label: "Responses (All Time)"
    description: "The sum of all the user's NPS responses sent on or before the record month. Users can submit 1-to-many NPS responses throughout their lifetime."
    type: string
    sql: ${TABLE}.responses_alltime ;;
  }

  dimension: licensed {
    label: "Licensed Server"
    description: "Boolean indicating the server associated with the User NPS Response Submission was licensed at the time the response was recorded."
    type: yesno
    sql: CASE WHEN ${license_id} IS NOT NULL THEN TRUE ELSE FALSE END ;;
    hidden: no
  }


  # MEASURES
  measure: count {
    description: "Count of rows/occurrences."
    type: count
  }

  measure: count_servers {
    group_label: "Servers"
    description: "The distinct count of Server Id's per grouping."
    type: count_distinct
    sql: ${server_id} ;;
  }

  measure: count_users {
    group_label: "Users"
    label: "Count Users (All Time)"
    description: "The distinct count of Users that have ever responded to an NPS Survey."
    type: count_distinct
    sql: ${user_id} ;;
  }

  measure: count_users_current {
    group_label: "Users"
    label: "Count Users"
    description: "The distinct count of Users that responded to an NPS survey in the record month."
    type: count_distinct
    sql: case when ${month_date}::date =  date_trunc('day', ${last_score_date}::date) then ${user_id} else null end ;;
  }

  measure: count_promoters {
    group_label: "Users"
    filters: {
      field: promoter_type
      value: "Promoter"
    }
    type: count_distinct
    sql: ${user_id} ;;
  }

  measure: count_detractors {
    group_label: "Users"
    filters: {
      field: promoter_type
      value: "Detractor"
    }
    type: count_distinct
    sql: ${user_id} ;;
  }

  measure: count_passive {
    group_label: "Users"
    filters: {
      field: promoter_type
      value: "Passive"
    }
    type: count_distinct
    sql: ${user_id} ;;
  }

  measure: pct_promoter_score {
    group_label: "Percents"
    description: "The % of total users classified as Promoters."
    type: number
    value_format_name: percent_1
    sql: ${count_promoters}::float/NULLIF(${count_users}::float, 0) ;;
  }

  measure: pct_detractor_score {
    group_label: "Percents"
    description: "The % of total users classified as Detractors."
    type: number
    value_format_name: percent_1
    sql: ${count_detractors}::float/NULLIF(${count_users}::float, 0) ;;
  }

  measure: pct_passive_score {
    group_label: "Percents"
    description: "The % of total users classified as Passive."
    type: number
    value_format_name: percent_1
    sql: ${count_passive}::float/NULLIF(${count_users}::float, 0) ;;
  }

  measure: nps_score {
    label: "NPS Score"
    description: "The NPS score calculated as: NPS Score = 100 * (% Promoters - % Detractors)."
    value_format: "@{decimal}"
    type: number
    sql: 100*(${pct_promoter_score} - ${pct_detractor_score}) ;;
  }

  measure: avg_score {
    group_label: "Averages"
    description: "The average score provided by all users answering 'On a scale of 0-10, how likely are you to recommend Mattermost to a friend of colleague?'"
    value_format: "@{decimal}"
    type: average
    sql: ${score} ;;
  }

  measure: avg_promoter_score {
    group_label: "Averages"
    description: "The average score provided by Promoters (Score >= 9) answering 'On a scale of 0-10, how likely are you to recommend Mattermost to a friend of colleague?'"
    value_format: "@{decimal}"
    filters: {
      field: promoter_type
      value: "Promoter"
    }
    type: average
    sql: ${score} ;;
  }

  measure: avg_detractor_score {
    group_label: "Averages"
    description: "The average score provided by Detractors (Score <= 6) answering 'On a scale of 0-10, how likely are you to recommend Mattermost to a friend of colleague?'"
    value_format: "@{decimal}"
    filters: {
      field: promoter_type
      value: "Detractor"
    }
    type: average
    sql: ${score} ;;
  }

  measure: avg_passive_score {
    group_label: "Averages"
    description: "The average score provided by Passive users (Score >= 7 & <= 8) answering 'On a scale of 0-10, how likely are you to recommend Mattermost to a friend of colleague?'"
    value_format: "@{decimal}"
    filters: {
      field: promoter_type
      value: "Passive"
    }
    type: average
    sql: ${score} ;;
  }

  measure: sum_responses {
    group_label: "Responses"
    label: "Responses"
    description: "Sum of total responses received by NPS users in the record month."
    value_format_name: decimal_0
    type: sum
    sql: ${responses} ;;
  }

  measure: sum_responses_all_time {
    group_label: "Responses"
    label: "Responses (All Time)"
    description: "Sum of responses received by NPS Users throughout their lifetime (during or before the current record month)."
    value_format_name: decimal_0
    type: sum
    sql: ${responses_alltime} ;;
  }

}
