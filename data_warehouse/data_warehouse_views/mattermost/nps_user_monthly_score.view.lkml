# This is the view file for the analytics.mattermost.nps_user_monthly_score table.
view: nps_user_monthly_score {
  sql_table_name: mattermost.nps_user_monthly_score ;;
  view_label: "Nps User Monthly Score"

  # FILTERS

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
    description: "The raw score provided by the user in the NPS survey (Scale of 0-10 how likely are you to recommend Mattermost to a colleague/firend)."
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
    timeframes: [date, month, year]
    sql: ${TABLE}.month ;;
    hidden: no
  }

  dimension_group: last_score {
    description: "The last time the user provided an NPS response."
    type: time
    timeframes: [date, month, year]
    sql: ${TABLE}.last_score_date ;;
    hidden: no
  }

  dimension_group: user_created_at {
    description: "The date the NPS user was first created."
    type: time
    timeframes: [date, month, year]
    sql: ${TABLE}.user_created_at ;;
    hidden: no
  }

  dimension_group: server_install {
    description: "The date the user's (responding to the NPS survey) server was installed."
    type: time
    timeframes: [date, month, year]
    sql: ${TABLE}.server_install_date ;;
    hidden: no
  }

  dimension_group: last_feedback {
    description: "The last time the user provided an NPS Feedback response."
    type: time
    timeframes: [date, month, year]
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
    sql: case when ${month_date}::date =  date_trunc('month', ${last_score_date}::date) then ${user_id} else null end ;;
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
    sql: ${count_promoters}::float/${count_users}::float ;;
  }

  measure: pct_detractor_score {
    group_label: "Percents"
    description: "The % of total users classified as Detractors."
    type: number
    value_format_name: percent_1
    sql: ${count_detractors}::float/${count_users}::float ;;
  }

  measure: pct_passive_score {
    group_label: "Percents"
    description: "The % of total users classified as Passive."
    type: number
    value_format_name: percent_1
    sql: ${count_passive}::float/${count_users}::float ;;
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
