# This is the view file for the analytics.mattermost.nps_user_monthly_score table.
view: nps_user_monthly_score {
  sql_table_name: mattermost.nps_user_daily_score ;;
  view_label: "NPS User Daily Score"

  set: nps_drill {
    fields: [last_score_date, server_id, user_id, server_version, license_sku, promoter_type,  score, feedback, last_feedback_date, user_age, server_age]
  }

  # FILTERS
  dimension: last_day_of_month {
    type: yesno
    description: "Filters so the logging date is equal to the last day of the month. Useful when grouping by month to report on NPS at the end of each given month."
    sql: CASE WHEN ${month_date} =
                                      CASE WHEN DATE_TRUNC('month', ${month_date}::date) = DATE_TRUNC('month', CURRENT_DATE) THEN (SELECT MAX(date) FROM mattermost.nps_user_daily_score)
                                        ELSE DATEADD(MONTH, 1, DATE_TRUNC('month',${month_date}::date)) - INTERVAL '1 DAY' END
          THEN TRUE ELSE FALSE END ;;
  }

  dimension: last_day_of_week {
    type: yesno
    description: "Filters so the logging date is equal to the last day of the week. Useful when grouping by week to report on NPS at the end of each given week."
    sql: CASE WHEN ${month_date} =
                                      CASE WHEN DATE_TRUNC('week', ${month_date}::date) = DATE_TRUNC('week', CURRENT_DATE) THEN (SELECT MAX(date) FROM mattermost.nps_user_daily_score)
                                        ELSE DATEADD(WEEK, 1, DATE_TRUNC('week',${month_date}::date)) - INTERVAL '1 DAY' END
          THEN TRUE ELSE FALSE END ;;
  }

  dimension: cloud_server {
    type: yesno
    description: "Boolean indicating the NPS response was from a Mattermost Cloud workspace (vs. a server using Mattermost's on-prem offering)."
    sql: CASE WHEN (${server_daily_details.installation_id} is not null or ${license_server_fact.cloud_customer} OR (${server_id} = '93mykbogbjfrbbdqphx3zhze5c' AND ${month_date} >= '2020-10-09')) THEN TRUE ELSE FALSE END ;;
  }

  dimension: score_submission_date {
    type: yesno
    description: "Filters so the only rows that appear are days where a new NPS submission was received. Useful when displaying raw data to prevent fanning out by logging date."
    sql: CASE WHEN ${month_date}::date = ${last_score_date}::date THEN TRUE ELSE FALSE END ;;
  }

  dimension: feeedback_submission_date {
    type: yesno
    description: "Filters so the only rows that appear are days where a new NPS Feedback submission was received. Useful when displaying raw data to prevent fanning out by logging date."
    sql: CASE WHEN ${month_date}::date = ${last_feedback_date}::date THEN TRUE ELSE FALSE END ;;
  }

  dimension: 21days_since_release {
    label: "Response >= 21 Days Since Release"
    type: yesno
    description: "Boolean indicating the response for the server version associated with the NPS submissions was >= 21 since the release date."
    sql: CASE WHEN ${cloud_server} or ${last_score_date}::DATE >= ${version_release_dates.release_date}::DATE + interval '21 days' THEN true ELSE false END ;;
  }

  dimension: trailing_3_months_nps {
    label: "Trailing 3-Month NPS Score"
    type: yesno
    description: "Boolean indicating the score reflected on the given logging date only incorporates trailing 3 month NPS score submissions."
    sql: CASE WHEN ${TABLE}.last_score_date >= ${TABLE}.date - INTERVAL '90 DAYS' THEN TRUE ELSE FALSE END ;;
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
    sql: CASE WHEN ${cloud_server} THEN 'Cloud' ELSE ${TABLE}.server_version END ;;
    hidden: no
    order_by_field: server_version_major_sort
  }

  dimension: server_version_major {
    description: "The Mattermost server version (major) associated with the user's server at the point in time that they submitted the NPS response."
    type: string
    sql: CASE WHEN ${cloud_server} THEN 'Cloud'
          ELSE SPLIT_PART(regexp_substr(${TABLE}.server_version,'^[0-9]{0,}[.]{1}[0-9[{0,}[.]{1}[0-9]{0,}[.]{1}[0-9]{0,}'), '.', 1) ||
          split_part(regexp_substr(${TABLE}.server_version,'^[0-9]{0,}[.]{1}[0-9[{0,}[.]{1}[0-9]{0,}[.]{1}[0-9]{0,}'), '.', 2) END ;;
    hidden: no
    order_by_field: server_version_major_sort
  }

  dimension: server_version_major_sort {
    group_label: " Server Versions"
    label: "  Server Version: Major (Current)"
    description: "The current server version, or if current telemetry is not available, the last recorded server version recorded for the server."
    type: number
    sql: CASE WHEN ${cloud_server} THEN '1000000'::int
          ELSE (split_part(regexp_substr(${TABLE}.server_version,'^[0-9]{0,}[.]{1}[0-9[{0,}[.]{1}[0-9]{0,}[.]{1}[0-9]{0,}'), '.', 1) ||
          CASE WHEN split_part(regexp_substr(${TABLE}.server_version,'^[0-9]{0,}[.]{1}[0-9[{0,}[.]{1}[0-9]{0,}[.]{1}[0-9]{0,}'), '.', 2)::int < 10 THEN
              ('0' || split_part(regexp_substr(${TABLE}.server_version,'^[0-9]{0,}[.]{1}[0-9[{0,}[.]{1}[0-9]{0,}[.]{1}[0-9]{0,}'), '.', 2))
            WHEN split_part(regexp_substr(${TABLE}.server_version,'^[0-9]{0,}[.]{1}[0-9[{0,}[.]{1}[0-9]{0,}[.]{1}[0-9]{0,}'), '.', 2) = '10' THEN '99'
            ELSE split_part(regexp_substr(${TABLE}.server_version,'^[0-9]{0,}[.]{1}[0-9[{0,}[.]{1}[0-9]{0,}[.]{1}[0-9]{0,}'), '.', 2) || '0' END)::int
            END;;
    hidden: yes
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
    sql: COALESCE(${server_fact.license_id}, ${TABLE}.license_id) ;;
    hidden: no
  }

  dimension: license_sku {
    description: "The Mattermost License SKU associated with the user's mattermost license coalesced with the edition associated with server if unlicensed (E10 E20)."
    type: string
    sql: COALESCE(${TABLE}.license_sku, ${license_server_fact.edition}, ${server_fact.server_edition}) ;;
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
    sql: NULLIF(${TABLE}.feedback, '') ;;
    hidden: no
  }

  dimension: id {
    description: "Unique identifier generated for each NPS User per month."
    type: string
    sql: ${TABLE}.id ;;
    hidden: no
    primary_key: yes
  }

  # FEEDBACK CATEGORY/DATA ACTIONS
  dimension: category {
    label: "Feedback Category"
    group_label: "Feedback Categorization"
    description: "The Category of the feedback provided by the NPS user."
    type: string
    sql: ${nps_feedback_classification.category} ;;
    hidden: no
  }

  dimension: subcategory2 {
    label: "Feedback Subcategory"
    group_label: "Feedback Categorization"
    description: "The Subcategory of the feedback provided by the NPS user."
    type: string
    sql: ${nps_feedback_classification.subcategory} ;;

  }

  dimension: subcategory {
    label: "Feedback Subcategory (Data Action)"
    group_label: "Feedback Categorization"
    description: "A duplicate of the Feedback Subcategory used to perform data actions on the Subcategory to update or insert a new Subcategory."
    type: string
    sql: COALESCE(${nps_feedback_classification.subcategory}, 'Uncategorized') ;;
    hidden: no
    action: {
      label: "Update Subcategory"
      url: "https://hooks.zapier.com/hooks/catch/6573053/osne36z/"
      icon_url: "https://1amiydhcmj36tz3733v94f15-wpengine.netdna-ssl.com/wp-content/themes/snowflake/img/favicons/favicon-32x32.png"
      form_param: {
        name: "new_value"
        label: "Select The Feedback Subcategory From The Dropdown:"
        default: "{{ value }}"
        type: select
        required: yes
        option: { name: "Account Authorization" label: "Account Authorization" }
        option: { name: "Audio/Video Calling" label: "Audio/Video Calling" }
        option: { name: "Away Status" label: "Away Status" }
        option: { name: "Be Slack" label: "Be Slack" }
        option: { name: "Block User" label: "Block User" }
        option: { name: "Channel Sidebar" label: "Channel Sidebar" }
        option: { name: "Corporate Slack Import" label: "Corporate Slack Import" }
        option: { name: "Custom Statuses" label: "Custom Statuses" }
        option: { name: "Desktop Stability" label: "Desktop Stability" }
        option: { name: "Desktop UX" label: "Desktop UX" }
        option: { name: "Documentation" label: "Documentation" }
        option: { name: "Emoji/GIF Options" label: "Emoji/GIF Options" }
        option: { name: "Files/Attachments" label: "Files/Attachments" }
        option: { name: "Group Mentions" label: "Group Mentions" }
        option: { name: "Group Message UX" label: "Group Message UX" }
        option: { name: "Integrations" label: "Integrations" }
        option: { name: "Logout Issues" label: "Logout Issues" }
        option: { name: "Mark as Unread" label: "Mark as Unread" }
        option: { name: "Message and Network Reliability" label: "Message and Network Reliability" }
        option: { name: "Message Tagging" label: "Message Tagging" }
        option: { name: "Messaging UX" label: "Messaging UX" }
        option: { name: "Miscellaneous" label: "Miscellaneous" }
        option: { name: "Miscellaneous Bugs" label: "Miscellaneous Bugs" }
        option: { name: "Miscellaneous Features" label: "Miscellaneous Features" }
        option: { name: "Miscellaneous UX" label: "Miscellaneous UX" }
        option: { name: "Mobile Stability" label: "Mobile Stability" }
        option: { name: "Mobile UX" label: "Mobile UX" }
        option: { name: "Notifications Reliability" label: "Notifications Reliability" }
        option: { name: "Notifications UX" label: "Notifications UX" }
        option: { name: "Onboarding" label: "Onboarding" }
        option: { name: "Performance" label: "Performance" }
        option: { name: "Praise" label: "Praise" }
        option: { name: "Read Receipts" label: "Read Receipts" }
        option: { name: "Reminderbot" label: "Reminderbot" }
        option: { name: "RN Multi-Server" label: "RN Multi-Server" }
        option: { name: "Search UX" label: "Search UX" }
        option: { name: "Share Message" label: "Share Message" }
        option: { name: "Snippets" label: "Snippets" }
        option: { name: "System Administration" label: "System Administration" }
        option: { name: "Team Management" label: "Team Management" }
        option: { name: "Text Editor" label: "Text Editor" }
        option: { name: "Themes" label: "Themes" }
        option: { name: "Threading" label: "Threading" }
        option: { name: "Translations" label: "Translations" }
        option: { name: "UI/UX Polish" label: "UI/UX Polish" }
        option: { name: "Update UX" label: "Update UX" }
        option: { name: "Voice Messages" label: "Voice Messages" }
      }
      param: {
        name: "field_name"
        value: "subcategory"
      }
      param: {
        name: "old_value"
        value: "{{ value }}"
      }
      param: {
        name: "table"
        value: "nps_feedback_classification"
      }
      param: {
        name: "other_params"
        value: "\"{\"server_id\": \"{{ server_id }}\", \"user_id\": \"{{ user_id }}\", \"last_feedback_date\": \"{{ last_feedback_date }}\"}\""
      }
      user_attribute_param: {
        user_attribute: email
        name: "action_performed_by"
      }
    }
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
    drill_fields: [nps_drill*]
  }

  measure: count_servers {
    group_label: "Servers"
    description: "The distinct count of Server Id's per grouping."
    type: count_distinct
    sql: ${server_id} ;;
    drill_fields: [nps_drill*]
  }

  measure: count_users {
    group_label: "Users"
    label: "Count Users (All Time)"
    description: "The distinct count of Users that have ever responded to an NPS Survey."
    type: count_distinct
    sql: ${user_id} ;;
    drill_fields: [nps_drill*]
  }

  measure: count_users_current {
    group_label: "Users"
    label: "Count Users"
    description: "The distinct count of Users that responded to an NPS survey in the record month."
    type: count_distinct
    sql: case when DATE_TRUNC('DAY', ${month_date}::date) =  date_trunc('day', ${last_score_date}::date) then ${user_id} else null end ;;
    drill_fields: [nps_drill*]
  }

  measure: count_promoters {
    group_label: "Users"
    filters: {
      field: promoter_type
      value: "Promoter"
    }
    type: count_distinct
    sql: ${user_id} ;;
    drill_fields: [nps_drill*]
  }

  measure: count_detractors {
    group_label: "Users"
    filters: {
      field: promoter_type
      value: "Detractor"
    }
    type: count_distinct
    sql: ${user_id} ;;
    drill_fields: [nps_drill*]
  }

  measure: count_passive {
    group_label: "Users"
    filters: {
      field: promoter_type
      value: "Passive"
    }
    type: count_distinct
    sql: ${user_id} ;;
    drill_fields: [nps_drill*]
  }

  measure: pct_promoter_score {
    group_label: "Percents"
    description: "The % of total users classified as Promoters."
    type: number
    value_format_name: percent_1
    sql: ${count_promoters}::float/NULLIF(${count_users}::float, 0) ;;
    drill_fields: [nps_drill*]
  }

  measure: pct_detractor_score {
    group_label: "Percents"
    description: "The % of total users classified as Detractors."
    type: number
    value_format_name: percent_1
    sql: ${count_detractors}::float/NULLIF(${count_users}::float, 0) ;;
    drill_fields: [nps_drill*]
  }


  measure: pct_passive_score {
    group_label: "Percents"
    description: "The % of total users classified as Passive."
    type: number
    value_format_name: percent_1
    sql: ${count_passive}::float/NULLIF(${count_users}::float, 0) ;;
    drill_fields: [nps_drill*]
  }

  measure: nps_score {
    label: "NPS Score"
    description: "The NPS score calculated as: NPS Score = 100 * (% Promoters - % Detractors)."
    value_format_name: decimal_1
    type: number
    sql: 100*(${pct_promoter_score} - ${pct_detractor_score}) ;;
    drill_fields: [nps_drill*]
  }

  measure: avg_score {
    group_label: "Averages"
    description: "The average score provided by all users answering 'On a scale of 0-10, how likely are you to recommend Mattermost to a friend of colleague?'"
    value_format: "@{decimal}"
    type: average
    sql: ${score} ;;
    drill_fields: [nps_drill*]
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
    drill_fields: [nps_drill*]
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
    drill_fields: [nps_drill*]
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
    drill_fields: [nps_drill*]
  }

  measure: sum_responses {
    group_label: "Responses"
    label: "Responses"
    description: "Sum of total responses received by NPS users in the record month."
    value_format_name: decimal_0
    type: sum
    sql: ${responses} ;;
    drill_fields: [nps_drill*]
  }

  measure: sum_responses_all_time {
    group_label: "Responses"
    label: "Responses (All Time)"
    description: "Sum of responses received by NPS Users throughout their lifetime (during or before the current record month)."
    value_format_name: decimal_0
    type: sum
    sql: ${responses_alltime} ;;
    drill_fields: [nps_drill*]
  }

  measure: last_score_date_max {
    label: "Last Score Date"
    description: "The latest date an NPS submission was received within the grouping."
    type: date
    sql: MAX(${last_score_date}) ;;
  }

  measure: last_nps_server_version {
    label: "Latest NPS Server Version"
    description: "The server version associated with the latest NPS response received within the grouping."
    type: string
    sql: MAX(${server_version}) ;;
  }

}
