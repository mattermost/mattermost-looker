view: server_fact {
sql_table_name: mattermost.server_fact ;;
  view_label: "Server Fact"

  # Dimensions
  dimension: server_id {
    label: "  Server ID"
    description: "The unique server ID for each server."
    type: string
    sql: ${TABLE}.server_id ;;
  }

  dimension: server_version {
    label: "  Server Version"
    description: "The current server version, or if current telemetry is not available, the last recorded server version recorded for the server."
    type: string
    sql: ${TABLE}.version ;;
  }

  dimension: first_server_version {
    label: " First Server Version"
    description: "The first server version, i.e. the version logged on the server's first telemetry date, recorded for the server ."
    type: string
    sql: ${TABLE}.first_server_version ;;
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

  dimension: account_sfid {
    label: "Account SFID"
    description: "The Salesforce Account ID of the Mattermost customer associated with the server (null if no Salesforce Account found)."
    type: string
    sql: ${TABLE}.last_account_sfid ;;
  }

  dimension: license_id {
    label: "License ID"
    description: "The Mattermost Customer License ID associated with the server (null if no license found)."
    type: string
    sql: ${TABLE}.last_license_id1 ;;
  }

  dimension_group: first_active {
    description: "The date the server was first active (first recorded instance of server appearing server logging data)."
    type: time
    timeframes: [date, month, year]
    sql: ${TABLE}.first_active_date ;;
  }

  dimension_group: last_active {
    description: "The date the server was last active (last recorded instance of server appearing server logging data)."
    type: time
    timeframes: [date, month, year]
    sql: ${TABLE}.last_active_date ;;
  }

  dimension_group: first_telemetry_active {
    description: "The date the server was first active (first recorded telemetry enabled date)."
    type: time
    timeframes: [date, month, year]
    sql: ${TABLE}.first_telemetry_active_date ;;
  }

  dimension_group: last_telemetry_active {
    description: "The date the server was last active (last recorded telemetry enabled date)."
    type: time
    timeframes: [date, month, year]
    sql: ${TABLE}.last_telemetry_active_date ;;
  }

  dimension: max_active_user_count {
    group_label: "Active User Dimensions"
    description: "The all-time maximum number of active users logged on the server."
    type: number
    sql: ${TABLE}.max_active_user_count;;
  }

  dimension_group: last_active_user {
    description: "The date the server was first active (first recorded telemetry enabled date)."
    type: time
    timeframes: [date, month, year]
    sql: ${TABLE}.last_active_user_date ;;
  }

  dimension: dau {
    group_label: "Active User Dimensions"
    label: "   Total DAU"
    description: "The current Daily Active User count based on all users that performed events on the last complete day (current date - 1 day)."
    type: number
    sql: ${TABLE}.dau_total;;
  }

  dimension: mobile_dau {
    group_label: "Active User Dimensions"
    label: "  Mobile DAU"
    description: "The current Mobile Daily Active User count based on all users that performed events on the last complete day (current date - 1 day)."
    type: number
    sql: ${TABLE}.mobile_dau;;
  }

  dimension: mau {
    group_label: "Active User Dimensions"
    label: "   Total MAU"
    description: "The current Monthly Active User count based on all users that performed events in the last 30 days from the last complete day (current date - 1 day)."
    type: number
    sql: ${TABLE}.mau_total;;
  }

  dimension: first_time_mau {
    group_label: "Active User Dimensions"
    label: " First-Time MAU"
    description: "The current First Time Monthly Active User count based on all users that performed events for the first time on the last complete day (current date - 1 day)."
    type: number
    sql: ${TABLE}.first_time_mau;;
  }

  dimension: reengaged_mau {
    group_label: "Active User Dimensions"
    label: " Reengaged MAU"
    description: "The current Reengaged Monthly Active User count based on all users that performed an event for the first time in 30 days on the last complete day (current date - 1 day)."
    type: number
    sql: ${TABLE}.reengaged_mau;;
  }

  dimension: current_mau {
    group_label: "Active User Dimensions"
    label: " Current MAU"
    description: "The current Monthly Active User count based on all users that performed an event in the last 30 days that do not fall into the first-time or reengaged MAU categories (current date - 1 day)."
    type: number
    sql: ${TABLE}.current_mau;;
  }

  dimension: total_events {
    group_label: "Event Dimensions"
    label: "   Total Events"
    description: "The total number of events performed by all users associated with the server in the last complete day (current date - 1 day)."
    type: number
    sql: ${TABLE}.total_events;;
  }

  dimension: web_app_events {
    group_label: "Event Dimensions"
    label: "Web App Events"
    description: "The total number of Web App client events performed by all users associated with the server in the last complete day (current date - 1 day)."
    type: number
    sql: ${TABLE}.web_app_events;;
  }

  dimension: desktop_events {
    group_label: "Event Dimensions"
    label: "Desktop Events"
    description: "The total number of Desktop client events performed by all users associated with the server in the last complete day (current date - 1 day)."
    type: number
    sql: ${TABLE}.desktop_events;;
  }

  dimension: mobile_events {
    group_label: "Event Dimensions"
    label: "Mobile Events"
    description: "The total number of Mobile client events performed by all users associated with the server in the last complete day (current date - 1 day)."
    type: number
    sql: ${TABLE}.mobile_events;;
  }

  dimension: events_alltime {
    group_label: "Event Dimensions"
    label: "  Total Events (All Time)"
    description: "The total number of events performed by all users associated with the server since the servers install date to the last current day (current date - 1 day)."
    type: number
    sql: ${TABLE}.events_alltime;;
  }

  dimension: mobile_events_alltime {
    group_label: "Event Dimensions"
    label: " Mobile Events (All Time)"
    description: "The total number of mobile events performed by all users associated with the server since the servers install date to the last current day (current date - 1 day)."
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
    description: "The current Daily Active User count based on all users that performed events on the last complete day (current date - 1 day)."
    type: sum
    sql: ${TABLE}.dau_total;;
  }

  measure: mobile_dau_sum {
    group_label: "Active User Measures"
    label: "  Mobile DAU"
    description: "The current Mobile Daily Active User count based on all users that performed events on the last complete day (current date - 1 day)."
    type: sum
    sql: ${TABLE}.mobile_dau;;
  }

  measure: mau_sum {
    group_label: "Active User Measures"
    label: "  Total MAU"
    description: "The current Monthly Active User count based on all users that performed events in the last 30 days from the last complete day (current date - 1 day)."
    type: sum
    sql: ${TABLE}.mau_total;;
  }

  measure: first_time_mau_sum {
    group_label: "Active User Measures"
    label: "First-Time MAU"
    description: "The current First Time Monthly Active User count based on all users that performed events for the first time on the last complete day (current date - 1 day)."
    type: sum
    sql: ${TABLE}.first_time_mau;;
  }

  measure: reengaged_mau_sum {
    group_label: "Active User Measures"
    label: "Reengaged MAU"
    description: "The current Reengaged Monthly Active User count based on all users that performed an event for the first time in 30 days on the last complete day (current date - 1 day)."
    type: sum
    sql: ${TABLE}.reengaged_mau;;
  }

  measure: current_mau_sum {
    group_label: "Active User Measures"
    label: " Current MAU"
    description: "The current Monthly Active User count based on all users that performed an event in the last 30 days that do not fall into the first-time or reengaged MAU categories (current date - 1 day)."
    type: sum
    sql: ${TABLE}.current_mau;;
  }

  measure: total_events_sum {
    group_label: "Event Measures"
    label: "  Total Events"
    description: "The total number of events performed by all users associated with the server in the last complete day (current date - 1 day)."
    type: sum
    sql: ${TABLE}.total_events;;
  }

  measure: web_app_events_sum {
    group_label: "Event Measures"
    label: "Web App Events"
    description: "The total number of Web App client events performed by all users associated with the server in the last complete day (current date - 1 day)."
    type: sum
    sql: ${TABLE}.web_app_events;;
  }

  measure: desktop_events_sum {
    group_label: "Event Measures"
    label: "Desktop Events"
    description: "The total number of Desktop client events performed by all users associated with the server in the last complete day (current date - 1 day)."
    type: sum
    sql: ${TABLE}.desktop_events;;
  }

  measure: mobile_events_sum {
    group_label: "Event Measures"
    label: "Mobile Events"
    description: "The total number of Mobile client events performed by all users associated with the server in the last complete day (current date - 1 day)."
    type: sum
    sql: ${TABLE}.mobile_events;;
  }

  measure: events_alltime_sum {
    group_label: "Event Measures"
    label: "  Total Events (All Time)"
    description: "The total number of events performed by all users associated with the server since the servers install date to the last current day (current date - 1 day)."
    type: sum
    sql: ${TABLE}.events_alltime;;
  }

  measure: mobile_events_alltime_sum {
    group_label: "Event Measures"
    label: " Mobile Events (All Time)"
    description: "The total number of mobile events performed by all users associated with the server since the servers install date to the last current day (current date - 1 day)."
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
}
