view: server_fact {
sql_table_name: mattermost.server_fact ;;
  view_label: "Server Fact"

  dimension: active_users_alltime {
    description: "The server has had >= 1 Active User during it's telemetry lifetime."
    label: ">= 1 Active Users During Lifetime"
    type: yesno
    sql: CASE WHEN ${server_fact.max_active_user_count} > 0 THEN TRUE ELSE FALSE END ;;
  }

  # Dimensions
  dimension: server_id {
    label: "  Server ID"
    description: "The unique server ID for each server."
    type: string
    sql: ${TABLE}.server_id ;;
  }

  dimension: server_version {
    group_label: " Server Versions"
    label: "  Server Version (Current)"
    description: "The current server version, or if current telemetry is not available, the last recorded server version recorded for the server."
    type: string
    sql: CASE WHEN regexp_substr(regexp_substr(${TABLE}.version,'[0-9]{0,}[.]{1}[0-9[{0,}[.]{1}[0-9]{0,}[.]{1}[0-9]{0,}[.]{1}[0-9]{0,}[.]{1}[0-9]{0,}[.]{1}[0-9]{0,}'), '[0-9]{0,}[.]{1}[0-9[{0,}[.]{1}[0-9]{0,}[.]{1}[0-9]{0,}$') IS NULL THEN
    regexp_substr(${TABLE}.version,'^[0-9]{0,}[.]{1}[0-9[{0,}[.]{1}[0-9]{0,}[.]{1}[0-9]{0,}')
    ELSE regexp_substr(regexp_substr(${TABLE}.version,'[0-9]{0,}[.]{1}[0-9[{0,}[.]{1}[0-9]{0,}[.]{1}[0-9]{0,}[.]{1}[0-9]{0,}[.]{1}[0-9]{0,}[.]{1}[0-9]{0,}'), '[0-9]{0,}[.]{1}[0-9[{0,}[.]{1}[0-9]{0,}[.]{1}[0-9]{0,}$') END;;
    order_by_field: server_version_major_sort
  }

  dimension: server_version_major {
    group_label: " Server Versions"
    label: "  Server Version: Major (Current)"
    description: "The current server version - excluding the trailing '.' release, or if current telemetry is not available, the last recorded server version recorded for the server."
    type: string
    sql: split_part(${server_version}, '.', 1) || '.' || split_part(${server_version}, '.', 2)  ;;
    order_by_field: server_version_major_sort
  }

  dimension: server_version_major_sort {
    group_label: " Server Versions"
    label: "  Server Version: Major (Current)"
    description: "The current server version - excluding the trailing '.' release, or if current telemetry is not available, the last recorded server version recorded for the server."
    type: number
    sql: (split_part(${server_version}, '.', 1) ||
    CASE WHEN split_part(${server_version}, '.', 2) = '10' THEN '99'
      ELSE split_part(${server_version}, '.', 2) || '0' END)::int ;;
    hidden: yes
  }

  dimension: first_server_version {
    group_label: " Server Versions"
    label: "First Server Version"
    description: "The first server version, i.e. the version logged on the server's first telemetry date, recorded for the server."
    type: string
    sql: CASE WHEN regexp_substr(regexp_substr(${TABLE}.first_server_version,'[0-9]{0,}[.]{1}[0-9[{0,}[.]{1}[0-9]{0,}[.]{1}[0-9]{0,}[.]{1}[0-9]{0,}[.]{1}[0-9]{0,}[.]{1}[0-9]{0,}'), '[0-9]{0,}[.]{1}[0-9[{0,}[.]{1}[0-9]{0,}[.]{1}[0-9]{0,}$') IS NULL THEN
    regexp_substr(${TABLE}.first_server_version,'^[0-9]{0,}[.]{1}[0-9[{0,}[.]{1}[0-9]{0,}[.]{1}[0-9]{0,}')
    ELSE regexp_substr(regexp_substr(${TABLE}.first_server_version,'[0-9]{0,}[.]{1}[0-9[{0,}[.]{1}[0-9]{0,}[.]{1}[0-9]{0,}[.]{1}[0-9]{0,}[.]{1}[0-9]{0,}[.]{1}[0-9]{0,}'), '[0-9]{0,}[.]{1}[0-9[{0,}[.]{1}[0-9]{0,}[.]{1}[0-9]{0,}$') END;;
    order_by_field: first_server_version_sort
  }

  dimension: first_server_version_sort {
    group_label: " Server Versions"
    label: "  Server Version: Major (Current)"
    description: "The current server version, or if current telemetry is not available, the last recorded server version recorded for the server."
    type: number
    sql: (split_part(${first_server_version}, '.', 1) ||
          CASE WHEN split_part(${first_server_version}, '.', 2) = '10' THEN '99'
            ELSE split_part(${first_server_version}, '.', 2) || '0' END)::int ;;
    hidden: yes
  }

  dimension: first_server_version_major {
    group_label: " Server Versions"
    label: "First Server Version: Major"
    description: "The first server version - excluding the '.' release, i.e. the version logged on the server's first telemetry date, recorded for the server."
    type: string
    sql: split_part(${first_server_version}, '.', 1) || '.' || split_part(${first_server_version}, '.', 2)  ;;
    order_by_field: first_server_version_major_sort
  }

  dimension: first_server_version_major_sort {
  group_label: " Server Versions"
  label: "  First Server Version: Major"
  description: "The first server version - excluding the '.' release, i.e. the version logged on the server's first telemetry date, recorded for the server."
  type: number
  sql: (split_part(${first_server_version}, '.', 1) ||
    CASE WHEN split_part(${first_server_version}, '.', 2) = '10' THEN '99'
      ELSE split_part(${first_server_version}, '.', 2) || '0' END)::int ;;
  hidden: yes
}

  dimension: first_server_edition {
    group_label: " Server Editions"
    label: "First Server Edition"
    description: "The first server version, i.e. the version logged on the server's first telemetry date, recorded for the server ."
    type: string
    sql: CASE WHEN ${TABLE}.first_server_edition = 'true' THEN 'E0' WHEN ${TABLE}.first_server_edition = 'false' THEN 'TE' ELSE NULL END;;
  }

  dimension: server_edition {
    group_label: " Server Editions"
    label: " Server Edition (Current)"
    description: "The first server version, i.e. the version logged on the server's first telemetry date, recorded for the server ."
    type: string
    sql: CASE WHEN ${TABLE}.server_edition = 'true' THEN 'E0' WHEN ${TABLE}.server_edition = 'false' THEN 'TE' ELSE NULL END;;
  }

  dimension: version_upgrades {
    group_label: "Upgrade Dimensions"
    description: "The total number of server version upgrades performed by the server i.e. number of times the server has been upgraded to a later version."
    type: number
    sql: ${TABLE}.version_upgrade_count ;;
  }

  dimension: edition_upgrades {
    group_label: "Upgrade Dimensions"
    description: "The total number of edition upgrades performed by the server i.e. number of times the server has been upgraded from TE to E0."
    type: number
    sql: ${TABLE}.edition_upgrade_count ;;
  }

  dimension: gitlab_install {
    label: " Gitlab Install"
    description: "Boolean indicating the server's OAuth enable gitlab flag = True on the date of server activation (first logged diagnostics activity date)."
    type: yesno
    sql: ${TABLE}.gitlab_install ;;
  }

  dimension: account_sfid {
    label: "Account SFID"
    description: "The Salesforce Account ID of the Mattermost customer associated with the server (null if no Salesforce Account found)."
    type: string
    sql: ${TABLE}.account_sfid ;;
    link: {
      label: "Salesforce Account Record"
      url: "https://mattermost.lightning.force.com/lightning/r/{{ account_sfid._value }}/view"
      icon_url: "https://mattermost.my.salesforce.com/favicon.ico"
    }
  }

  dimension: account_name {
    label: "Account Name"
    description: "The Salesforce Account Name of the Mattermost customer associated with the server (null if no Salesforce Account found)."
    type: string
    sql: ${TABLE}.account_name ;;
    link: {
      label: "Salesforce Account Record"
      url: "https://mattermost.lightning.force.com/lightning/r/{{ account_sfid._value }}/view"
      icon_url: "https://mattermost.my.salesforce.com/favicon.ico"
    }
  }

  dimension: company_name {
    label: "Customer Name"
    description: "The coalesce Mattermost Customer Name using the Salesforce Account Name, or if not available, the license company name, of the Mattermost customer associated with the server (null if no Salesforce Account found)."
    type: string
    sql: COALESCE(${TABLE}.account_name, ${TABLE}.company);;
  }

  dimension: active_paying_customer {
    label: "Current Customer"
    description: "Identifies whether the server is tied to a current customer based on the paid license expiration date."
    type: yesno
    sql: CASE WHEN ${TABLE}.paid_license_expire_date::date >= CURRENT_DATE THEN TRUE ELSE FALSE END ;;
  }

  dimension: active_trial {
    label: "Active Trial"
    description: "Identifies whether the server is tied to a currently active trial license based on the trial license expiration date."
    type: yesno
    sql: CASE WHEN ${TABLE}.trial_license_expire_date::date >= CURRENT_DATE THEN TRUE ELSE FALSE END ;;
  }

  dimension: license_id {
    label: "License ID (Current)"
    description: "The latest Mattermost Customer License ID associated with the server i.e. on the current date or last license associated prior to churn and/or disabling telemetry (null if no license found)."
    type: string
    sql: ${TABLE}.last_license_id1 ;;
  }

  dimension_group: first_active {
    label: " First Active Telemetry"
    description: "The date the server was first active (first recorded instance of server appearing server logging data: mattermost2.server - diagnostics.go or events.security - security_update_check.go)."
    type: time
    timeframes: [date, week, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.first_active_date ;;
  }

  dimension_group: last_active {
    label: " Last Active Telemetry"
    description: "The date the server was last active (last recorded instance of server appearing server logging data: mattermost2.server - diagnostics.go or events.security - security_update_check.go)."
    type: time
    timeframes: [date, week, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.last_active_date ;;
  }

  dimension_group: first_telemetry_active {
    label: " First Security Telemetry"
    description: "The date the server first recorded security telemetry data in the security diagnostics data (logged via security_update_check.go)."
    type: time
    timeframes: [date, week, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.first_telemetry_active_date ;;
  }

  dimension_group: last_telemetry_active {
    label: " Last Security Telemetry"
    description: "The date the server last recorded security telemetry data in the security diagnostics data."
    type: time
    timeframes: [date, week, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.last_telemetry_active_date ;;
  }

  dimension_group: last_mm2_telemetry {
    label: " Last Diagnostics Telemetry"
    description: "The date the server last recorded diagnostics telemetry (logged via diagnostics.go)."
    type: time
    timeframes: [date, week, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.last_mm2_telemetry_date ;;
  }

  dimension_group: first_mm2_telemetry {
    label: " First Diagnostics Telemetry"
    description: "The date the server first recorded diagnostics telemetry (logged via diagnostics.go)."
    type: time
    timeframes: [date, week, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.first_mm2_telemetry_date ;;
  }

  dimension: max_active_user_count {
    group_label: "Active User Dimensions"
    description: "The all-time maximum number of active users logged on the server."
    type: number
    sql: ${TABLE}.max_active_user_count;;
  }

  dimension: signup_events_alltime {
    group_label: "Event Dimensions (All-Time)"
    description: "The all-time count of signup events performed by users on the server (from user event telemetry)."
    type: number
    sql: ${TABLE}.signup_events_alltime;;
  }

  dimension: post_events_alltime {
    group_label: "Event Dimensions (All-Time)"
    description: "The all-time count of posts created by users on the server (from user event telemetry)."
    type: number
    sql: ${TABLE}.posts_events_alltime;;
  }

  dimension: invite_members_alltime {
    group_label: "Event Dimensions (All-Time)"
    description: "The all-time count of 'Invite Members' events performed by users on the server (from user event telemetry)."
    type: number
    sql: ${TABLE}.invite_members_alltime;;
  }

  dimension: signup_email_events_alltime {
    group_label: "Event Dimensions (All-Time)"
    description: "The all-time count of signup email events performed by users on the server (from user event telemetry)."
    type: number
    sql: ${TABLE}.signup_email_events_alltime;;
  }

  dimension: tutorial_events_alltime {
    group_label: "Event Dimensions (All-Time)"
    description: "The all-time count of tutorial events performed by users on the server (from user event telemetry)."
    type: number
    sql: ${TABLE}.tutorial_events_alltime;;
  }

  dimension: admin_events_alltime {
    group_label: "Event Dimensions (All-Time)"
    description: "The all-time count of tutorial events performed by users on the server (from user event telemetry)."
    type: number
    sql: ${TABLE}.admin_events_alltime;;
  }

  dimension_group: last_active_user {
    description: "The date the server was first active (first recorded telemetry enabled date)."
    type: time
    timeframes: [date, week, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.last_active_user_date ;;
  }

  dimension_group: first_paid_license {
    label: " First Paid License"
    description: "The date the server first sent telemetry data that associated it with a paid license."
    type: time
    timeframes: [date, week, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.first_paid_license_date ;;
  }

  dimension_group: first_trial_license {
    label: " First Trial License"
    description: "The date the server first sent telemetry data that associated it with a trial license."
    type: time
    timeframes: [date, week, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.first_trial_license_date ;;
  }

  dimension_group: first_100reg_users {
    label: "   First 100 Reg. Users"
    description: "The date the server first reached 100 registered users."
    type: time
    timeframes: [date, week, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.first_100reg_users_date ;;
    hidden: yes
  }

  dimension: days_to_100reg_users {
    group_label: "Days to Reg. User Thresholds"
    label: "Days to 100 Reg. Users"
    type: number
    sql: DATEDIFF(DAY, ${first_active_date}, ${first_100reg_users_date}) ;;
  }

  dimension_group: first_500reg_users {
    label: "   First 500 Reg. Users"
    description: "The date the server first reached 500 registered users."
    type: time
    timeframes: [date, week, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.first_500reg_users_date ;;
    hidden: yes
  }

  dimension: days_to_500reg_users {
    group_label: "Days to Reg. User Thresholds"
    label: "Days to 500 Reg. Users"
    type: number
    sql: DATEDIFF(DAY, ${first_active_date}, ${first_500reg_users_date}) ;;
  }

  dimension_group: first_1kreg_users {
    label: "  First 1k Reg. Users"
    description: "The date the server first reached 1k registered users."
    type: time
    timeframes: [date, week, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.first_1kreg_users_date ;;
    hidden: yes
  }

  dimension: days_to_1kreg_users {
    group_label: "Days to Reg. User Thresholds"
    label: "Days to 1k Reg. Users"
    type: number
    sql: DATEDIFF(DAY, ${first_active_date}, ${first_1kreg_users_date}) ;;
  }

  dimension_group: first_2500reg_users {
    label: "  First 2.5k Reg. Users"
    description: "The date the server first reached 2.5k registered users."
    type: time
    timeframes: [date, week, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.first_2500reg_users_date ;;
    hidden: yes
  }

  dimension: days_to_2500kreg_users {
    group_label: "Days to Reg. User Thresholds"
    label: "Days to 2.5k Reg. Users"
    type: number
    sql: DATEDIFF(DAY, ${first_active_date}, ${first_2500reg_users_date}) ;;
  }

  dimension_group: first_5kreg_users {
    label: " First 5k Reg. Users"
    description: "The date the server first reached 5k registered users."
    type: time
    timeframes: [date, week, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.first_5kreg_users_date ;;
    hidden: yes
  }

  dimension: days_to_5kreg_users {
    group_label: "Days to Reg. User Thresholds"
    label: "Days to 5k Reg. Users"
    type: number
    sql: DATEDIFF(DAY, ${first_active_date}, ${first_5kreg_users_date}) ;;
  }

  dimension_group: first_10kreg_users {
    label: " First 10k Reg. Users"
    description: "The date the server first reached 10k registered users."
    type: time
    timeframes: [date, week, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.first_10kreg_users_date ;;
    hidden: yes
  }

  dimension: days_to_10kreg_users {
    group_label: "Days to Reg. User Thresholds"
    label: "Days to 10k Reg. Users"
    type: number
    sql: DATEDIFF(DAY, ${first_active_date}, ${first_10kreg_users_date}) ;;
  }

  dimension_group: paid_license_expire {
    label: "Paid License Expire"
    type: time
    timeframes: [date, week, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.paid_license_expire_date ;;
  }

  dimension: dau {
    group_label: "Active User Dimensions"
    label: "   Total DAU"
    description: "The current Daily Active User count based on all users that performed events on the last complete day (on the last date the server logged user-level events.)."
    type: number
    sql: ${TABLE}.dau_total;;
  }

  dimension: mobile_dau {
    group_label: "Active User Dimensions"
    label: "  Mobile DAU"
    description: "The current Mobile Daily Active User count based on all users that performed events on the last complete day (on the last date the server logged user-level events.)."
    type: number
    sql: ${TABLE}.mobile_dau;;
  }

  dimension: mau {
    group_label: "Active User Dimensions"
    label: "   Total MAU"
    description: "The current Monthly Active User count based on all users that performed events in the last 30 days from the last complete day (on the last date the server logged user-level events.)."
    type: number
    sql: ${TABLE}.mau_total;;
  }

  dimension: first_time_mau {
    group_label: "Active User Dimensions"
    label: " First-Time MAU"
    description: "The current First Time Monthly Active User count based on all users that performed events for the first time on the last complete day (on the last date the server logged user-level events.)."
    type: number
    sql: ${TABLE}.first_time_mau;;
  }

  dimension: reengaged_mau {
    group_label: "Active User Dimensions"
    label: " Reengaged MAU"
    description: "The current Reengaged Monthly Active User count based on all users that performed an event for the first time in 30 days on the last complete day (on the last date the server logged user-level events.)."
    type: number
    sql: ${TABLE}.reengaged_mau;;
  }

  dimension: current_mau {
    group_label: "Active User Dimensions"
    label: " Current MAU"
    description: "The current Monthly Active User count based on all users that performed an event in the last 30 days that do not fall into the first-time or reengaged MAU categories ( on the last date the server logged user-level events.)."
    type: number
    sql: ${TABLE}.current_mau;;
  }

  dimension: total_events {
    group_label: "Event Dimensions"
    label: "   Total Events"
    description: "The total number of events performed by all users associated with the server on the last date the server logged user-level events.."
    type: number
    sql: ${TABLE}.total_events;;
  }

  dimension: web_app_events {
    group_label: "Event Dimensions"
    label: "Web App Events"
    description: "The total number of Web App client events performed by all users associated with the server on the last date the server logged user-level events.."
    type: number
    sql: ${TABLE}.web_app_events;;
  }

  dimension: desktop_events {
    group_label: "Event Dimensions"
    label: "Desktop Events"
    description: "The total number of Desktop client events performed by all users associated with the server on the last date the server logged user-level events.."
    type: number
    sql: ${TABLE}.desktop_events;;
  }

  dimension: mobile_events {
    group_label: "Event Dimensions"
    label: "Mobile Events"
    description: "The total number of Mobile client events performed by all users associated with the server on the last date the server logged user-level events.."
    type: number
    sql: ${TABLE}.mobile_events;;
  }

  dimension: events_alltime {
    group_label: "Event Dimensions"
    label: "  Total Events (All Time)"
    description: "The total number of events performed by all users associated with the server since the servers install date to the last current day ( on the last date the server logged user-level events.)."
    type: number
    sql: ${TABLE}.events_alltime;;
  }

  dimension: mobile_events_alltime {
    group_label: "Event Dimensions"
    label: " Mobile Events (All Time)"
    description: "The total number of mobile events performed by all users associated with the server since the servers install date to the last current day (on the last date the server logged user-level events.)."
    type: number
    sql: ${TABLE}.mobile_events_alltime;;
  }

  dimension: promoters {
    label: "  Promoters"
    group_label: "NPS Dimensions"
    description: "The count of NPS users associated with the server that are promoters (score > 8)."
    type: number
    sql: ${TABLE}.promoters ;;
    hidden: no
  }

  dimension: detractors {
    label: " Detractors"
    group_label: "NPS Dimensions"
    description: "The count of NPS users associated with the server that are detractors (score < 7)."
    type: number
    sql: ${TABLE}.detractors ;;
    hidden: no
  }

  dimension: passives {
    label: "Passives"
    group_label: "NPS Dimensions"
    description: "The count of NPS users associated with the server that are passives (score >= 7 & <= 8)."
    type: number
    sql: ${TABLE}.passives ;;
    hidden: no
  }

  dimension: nps_users {
    label: "   NPS Users"
    group_label: "NPS Dimensions"
    description: "The count of all NPS users associated with the server (users that have submitted an NPS survey response)."
    type: number
    sql: ${TABLE}.nps_users ;;
    hidden: no
  }


  # Measures
  measure: server_count {
    label: " Server Count"
    description: "Use this for counting distinct Server ID's across many servers, days, or dates."
    type: count_distinct
    sql: ${server_id} ;;
    drill_fields: [server_id, server_version, first_server_version, server_edition, first_server_edition, first_telemetry_active_date, first_mm2_telemetry_date, dau, mau, max_active_user_count, nps_users, nps_score_all]
  }

  measure: server_w_active_users {
    label: " Servers w/ Active Users"
    description: "The count of distinct servers w/ > 0 active user during the server's lifetime."
    type: count_distinct
    sql: CASE WHEN ${max_active_user_count} > 0 THEN ${server_id} ELSE NULL END ;;
  }

  measure: servers_w_post_events {
    label: " Servers w/ Post Events"
    description: "The count of distinct servers w/ > 0 Posts created during the server's lifetime."
    type: count_distinct
    sql: case when ${post_events_alltime} > 0 THEN ${server_id} ELSE NULL END ;;
  }

  measure: servers_w_signup_events {
    label: " Servers w/ Signup Events"
    description: "The count of distinct servers w/ > 0 Signup Events during the server's lifetime."
    type: count_distinct
    sql: case when ${signup_events_alltime} > 0 THEN ${server_id} ELSE NULL END ;;
  }

  measure: servers_w_signup_email_events {
    label: " Servers w/ Signup Email Events"
    description: "The count of distinct servers w/ > 0 Signup Email Events during the server's lifetime."
    type: count_distinct
    sql: case when ${signup_email_events_alltime} > 0 THEN ${server_id} ELSE NULL END ;;
  }

  measure: servers_w_tutorial_events {
    label: " Servers w/ Tutorial Events"
    description: "The count of distinct servers w/ > 0 Tutorial Events during the server's lifetime."
    type: count_distinct
    sql: case when ${tutorial_events_alltime} > 0 THEN ${server_id} ELSE NULL END ;;
  }

  measure: servers_w_admin_events {
    label: " Servers w/ Admin Events"
    description: "The count of distinct servers w/ > 0 Admin Events during the server's lifetime."
    type: count_distinct
    sql: case when ${admin_events_alltime} > 0 THEN ${server_id} ELSE NULL END ;;
  }

  measure: servers_w_invite_member_events {
    label: " Servers w/ Invite Member Events"
    description: "The count of distinct servers w/ > 0 Invite Member Events during the server's lifetime."
    type: count_distinct
    sql: case when ${invite_members_alltime} > 0 THEN ${server_id} ELSE NULL END ;;
  }

  measure: nps_users_sum {
    label: "   NPS Users (Sum)"
    group_label: "NPS Measures"
    description: "The sum of Nps Users that have submitted NPS responses across all servers per grouping."
    type: sum
    value_format_name: decimal_0
    sql: ${nps_users} ;;
  }

  measure: detractors_sum {
    label: " Detractors (Sum)"
    group_label: "NPS Measures"
    description: "The sum of the count of all NPS Detractor responses across all servers per grouping."
    type: sum
    value_format_name: decimal_0
    sql: ${detractors} ;;
    hidden: no
  }

  measure: promoters_sum {
    label: "  Promoters (Sum)"
    group_label: "NPS Measures"
    description: "The sum of the count of all NPS Promoter responses across all servers per grouping."
    type: sum
    value_format_name: decimal_0
    sql: ${promoters} ;;
    hidden: no
  }

  measure: passives_sum {
    label: "Passives (Sum)"
    group_label: "NPS Measures"
    description: "The sum of the count of all NPS Passive responses across all servers per grouping."
    type: sum
    value_format_name: decimal_0
    sql: ${passives} ;;
    hidden: no
  }

  measure: nps_score_all {
    label: "   NPS Score"
    group_label: "NPS Measures"
    description: "The aggregate NPS Score across all servers per grouping based on the NPS calculation: NPS Score = 100 * (% Promoters - % Detractors). "
    type: number
    sql: 100.0 * ((${promoters_sum}/nullif(${nps_users_sum},0))-(${detractors_sum}/nullif(${nps_users_sum},0))) ;;
    value_format_name: decimal_1
  }

  measure: dau_sum {
    group_label: "Active User Measures"
    label: "   Total DAU"
    description: "The current Daily Active User count based on all users that performed events on the last complete day (on the last date the server logged user-level events.)."
    type: sum
    sql: ${TABLE}.dau_total;;
  }

  measure: mobile_dau_sum {
    group_label: "Active User Measures"
    label: "  Mobile DAU"
    description: "The current Mobile Daily Active User count based on all users that performed events on the last complete day (on the last date the server logged user-level events.)."
    type: sum
    sql: ${TABLE}.mobile_dau;;
  }

  measure: mau_sum {
    group_label: "Active User Measures"
    label: "  Total MAU"
    description: "The current Monthly Active User count based on all users that performed events in the last 30 days from the last complete day (on the last date the server logged user-level events.)."
    type: sum
    sql: ${TABLE}.mau_total;;
  }

  measure: first_time_mau_sum {
    group_label: "Active User Measures"
    label: "First-Time MAU"
    description: "The current First Time Monthly Active User count based on all users that performed events for the first time on the last complete day (on the last date the server logged user-level events.)."
    type: sum
    sql: ${TABLE}.first_time_mau;;
  }

  measure: reengaged_mau_sum {
    group_label: "Active User Measures"
    label: "Reengaged MAU"
    description: "The current Reengaged Monthly Active User count based on all users that performed an event for the first time in 30 days on the last complete day (on the last date the server logged user-level events.)."
    type: sum
    sql: ${TABLE}.reengaged_mau;;
  }

  measure: current_mau_sum {
    group_label: "Active User Measures"
    label: " Current MAU"
    description: "The current Monthly Active User count based on all users that performed an event in the last 30 days that do not fall into the first-time or reengaged MAU categories (on the last date the server logged user-level events.)."
    type: sum
    sql: ${TABLE}.current_mau;;
  }

  measure: total_events_sum {
    group_label: "Event Measures"
    label: "  Total Events"
    description: "The total number of events performed by all users associated with the server on the last date the server logged user-level events.."
    type: sum
    sql: ${TABLE}.total_events;;
  }

  measure: web_app_events_sum {
    group_label: "Event Measures"
    label: "Web App Events"
    description: "The total number of Web App client events performed by all users associated with the server on the last date the server logged user-level events.."
    type: sum
    sql: ${TABLE}.web_app_events;;
  }

  measure: desktop_events_sum {
    group_label: "Event Measures"
    label: "Desktop Events"
    description: "The total number of Desktop client events performed by all users associated with the server on the last date the server logged user-level events.."
    type: sum
    sql: ${TABLE}.desktop_events;;
  }

  measure: mobile_events_sum {
    group_label: "Event Measures"
    label: "Mobile Events"
    description: "The total number of Mobile client events performed by all users associated with the server on the last date the server logged user-level events.."
    type: sum
    sql: ${TABLE}.mobile_events;;
  }

  measure: events_alltime_sum {
    group_label: "Event Measures"
    label: "  Total Events (All Time)"
    description: "The total number of events performed by all users associated with the server since the servers install date to the last current day (on the last date the server logged user-level events.)."
    type: sum
    sql: ${TABLE}.events_alltime;;
  }

  measure: mobile_events_alltime_sum {
    group_label: "Event Measures"
    label: " Mobile Events (All Time)"
    description: "The total number of mobile events performed by all users associated with the server since the servers install date to the last current day (on the last date the server logged user-level events.)."
    type: sum
    sql: ${TABLE}.mobile_events_alltime;;
  }

  measure: version_upgrade_sum {
    label: "Version Upgrades (Sum)"
    group_label: "Upgrade Measures"
    description: "The total number of server version upgrades performed across all servers i.e. number of times servers have been upgraded to a later version per grouping."
    type: sum
    sql: ${TABLE}.version_upgrade_count ;;
  }

  measure: edition_upgrade_sum {
    label: "Edition Upgrades (Sum)"
    group_label: "Upgrade Measures"
    description: "The total number of edition upgrades performed across all servers i.e. number of times servers have been upgraded from TE to E0 per grouping."
    type: sum
    sql: ${TABLE}.edition_upgrade_count ;;
  }

  measure: edition_upgrade_avg{
    label: "Avg. Edition Upgrades"
    group_label: "Upgrade Measures"
    description: "The average number of edition upgrades performed across all servers i.e. number of times servers have been upgraded from TE to E0 per grouping."
    type: average
    sql: ${TABLE}.edition_upgrade_count ;;
  }

  measure: version_upgrade_avg {
    label: "Avg. Version Upgrades"
    group_label: "Upgrade Measures"
    description: "The average number of server version upgrades performed across all servers i.e. number of times servers have been upgraded to a later version per grouping."
    type: average
    sql: ${TABLE}.version_upgrade_count ;;
  }

  measure: customer_count {
    type: number
    sql: COUNT(DISTINCT CASE WHEN ${active_paying_customer} THEN ${company_name} ELSE NULL END) ;;
  }
}
