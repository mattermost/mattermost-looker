view: fct_nps_score {
  label: "NPS Score"
  view_label: "NPS Score"
  sql_table_name: MART_PRODUCT.FCT_NPS_SCORE ;;
  drill_fields: [id, server_id, server_version]

  dimension: id {
    primary_key: yes
    label: "ID"
    view_label: "NPS Score"
    type: string
    sql: ${TABLE}."ID" ;;
  }

  dimension_group: activity_date {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    label: "Activity date"
    view_label: "NPS Score"
    datatype: date
    sql: ${TABLE}."ACTIVITY_DATE" ;;
  }

  dimension: count_user_nps_users_daily {
    type: number
    label: "Count User NPS Users Daily"
    view_label: "NPS Score"
    sql: ${TABLE}."COUNT_USER_NPS_USERS_DAILY" ;;
    hidden: yes
  }

  dimension: count_user_passives_daily {
    type: number
    label: "Count User Passives Daily"
    view_label: "NPS Score"
    sql: ${TABLE}."COUNT_USER_PASSIVES_DAILY" ;;
    hidden: yes
  }

  dimension: count_user_promoters_daily {
    type: number
    label: "Count User Promoters Daily"
    view_label: "NPS Score"
    sql: ${TABLE}."COUNT_USER_PROMOTERS_DAILY" ;;
    hidden: yes
  }

  dimension: count_user_detractors_daily {
    type: number
    label: "Count User Detractors Daily"
    view_label: "NPS Score"
    sql: ${TABLE}."COUNT_USER_DETRACTORS_DAILY" ;;
    hidden: yes
  }

  dimension: count_user_promoters_last90d {
    type: number
    label: "Count User Promoters Last 90 Days"
    view_label: "NPS Score"
    sql: ${TABLE}."COUNT_USER_PROMOTERS_LAST90D" ;;
    hidden: yes
  }

  dimension: count_user_passives_last90d {
    type: number
    label: "Count User Passives Last 90 Days"
    view_label: "NPS Score"
    sql: ${TABLE}."COUNT_USER_PASSIVES_LAST90D" ;;
    hidden: yes
  }

  dimension: count_user_detractors_last90d {
    type: number
    label: "Count User Detractors Last 90 Days"
    view_label: "NPS Score"
    sql: ${TABLE}."COUNT_USER_DETRACTORS_LAST90D" ;;
    hidden: yes
  }

  dimension: count_user_nps_users_last90d {
    type: number
    label: "Count User NPS Users Last 90 Days"
    view_label: "NPS Score"
    sql: ${TABLE}."COUNT_USER_NPS_USERS_LAST90D" ;;
    hidden: yes
  }

  dimension: count_team_admin_nps_users_daily {
    type: number
    label: "Count Team Admin NPS Users Daily"
    view_label: "NPS Score"
    sql: ${TABLE}."COUNT_TEAM_ADMIN_NPS_USERS" ;;
    hidden: yes
  }

  dimension: count_team_admin_passives_daily {
    type: number
    label: "Count Team Admin Passives Daily"
    view_label: "NPS Score"
    sql: ${TABLE}."COUNT_TEAM_ADMIN_PASSIVES" ;;
    hidden: yes
  }

  dimension: count_team_admin_promoters_daily {
    type: number
    label: "Count Team Admin Promoters Daily"
    view_label: "NPS Score"
    sql: ${TABLE}."COUNT_TEAM_ADMIN_PROMOTERS_DAILY" ;;
    hidden: yes
  }

  dimension: count_team_admin_detractors_daily {
    type: number
    label: "Count Team Admin Detractors Daily"
    view_label: "NPS Score"
    sql: ${TABLE}."COUNT_TEAM_ADMIN_DETRACTORS_DAILY" ;;
    hidden: yes
  }

  dimension: count_team_admin_promoters_last90d {
    type: number
    label: "Count Team Admin Promoters Last 90 Days"
    view_label: "NPS Score"
    sql: ${TABLE}."COUNT_TEAM_ADMIN_PROMOTERS_LAST90D" ;;
    hidden: yes
  }

  dimension: count_team_admin_passives_last90d {
    type: number
    label: "Count Team Admin Passives Last 90 Days"
    view_label: "NPS Score"
    sql: ${TABLE}."COUNT_TEAM_ADMIN_PASSIVES_LAST90D" ;;
    hidden: yes
  }

  dimension: count_team_admin_detractors_last90d {
    type: number
    label: "Count Team Admin Detractors Last 90 Days"
    view_label: "NPS Score"
    sql: ${TABLE}."COUNT_TEAM_ADMIN_DETRACTORS_LAST90D" ;;
    hidden: yes
  }

  dimension: count_team_admin_nps_users_last90d {
    type: number
    label: "Count Team Admin NPS Users Last 90 Days"
    view_label: "NPS Score"
    sql: ${TABLE}."COUNT_TEAM_ADMIN_NPS_USERS_LAST90D" ;;
    hidden: yes
  }

  dimension: count_system_admin_nps_users_daily {
    type: number
    label: "Count System Admin NPS Users Daily"
    view_label: "NPS Score"
    sql: ${TABLE}."COUNT_SYSTEM_ADMIN_NPS_USERS" ;;
    hidden: yes
  }

  dimension: count_system_admin_passives_daily {
    type: number
    label: "Count System Admin Passives Daily"
    view_label: "NPS Score"
    sql: ${TABLE}."COUNT_SYSTEM_ADMIN_PASSIVES_DAILY" ;;
    hidden: yes
  }

  dimension: count_system_admin_promoters_daily {
    type: number
    label: "Count System Admin Promoters Daily"
    view_label: "NPS Score"
    sql: ${TABLE}."COUNT_SYSTEM_ADMIN_PROMOTERS_DAILY" ;;
    hidden: yes
  }

  dimension: count_system_admin_detractors_daily {
    type: number
    label: "Count System Admin Detractors Daily"
    view_label: "NPS Score"
    sql: ${TABLE}."COUNT_SYSTEM_ADMIN_DETRACTORS_DAILY" ;;
    hidden: yes
  }

  dimension: count_system_admin_promoters_last90d {
    type: number
    label: "Count System Admin Promoters Last 90 Days"
    view_label: "NPS Score"
    sql: ${TABLE}."COUNT_SYSTEM_ADMIN_PROMOTERS_LAST90D" ;;
    hidden: yes
  }

  dimension: count_system_admin_passives_last90d {
    type: number
    label: "Count System Admin Passives Last 90 Days"
    view_label: "NPS Score"
    sql: ${TABLE}."COUNT_SYSTEM_ADMIN_PASSIVES_LAST90D" ;;
    hidden: yes
  }

  dimension: count_system_admin_detractors_last90d {
    type: number
    label: "Count System Admin Detractors Last 90 Days"
    view_label: "NPS Score"
    sql: ${TABLE}."COUNT_SYSTEM_ADMIN_DETRACTORS_LAST90D" ;;
    hidden: yes
  }

  dimension: count_system_admin_nps_users_last90d {
    type: number
    label: "Count System Admin NPS Users Last 90 Days"
    view_label: "NPS Score"
    sql: ${TABLE}."COUNT_SYSTEM_ADMIN_NPS_USERS_LAST90D" ;;
    hidden: yes
  }

  dimension: count_promoters_last90d {
    type: number
    label: "Count Promoters Last 90 Days"
    view_label: "NPS Score"
    sql: ${TABLE}."COUNT_PROMOTERS_LAST90D" ;;
    hidden: yes
  }

  dimension: count_passives_last90d {
    type: number
    label: "Count Passives Last 90 Days"
    view_label: "NPS Score"
    sql: ${TABLE}."COUNT_PASSIVES_LAST90D" ;;
    hidden: yes
  }

  dimension: count_detractors_last90d {
    type: number
    label: "Count Detractors Last 90 Days"
    view_label: "NPS Score"
    sql: ${TABLE}."COUNT_DETRACTORS_LAST90D" ;;
    hidden: yes
  }

  dimension: count_nps_users_last90d {
    type: number
    label: "Count NPS Users Last 90 Days"
    view_label: "NPS Score"
    sql: ${TABLE}."COUNT_NPS_USERS_LAST90D" ;;
    hidden: yes
  }

  dimension: count_promoters_daily {
    type: number
    label: "Count Promoters Daily"
    view_label: "NPS Score"
    sql: ${TABLE}."COUNT_PROMOTERS_DAILY" ;;
    hidden: yes
  }

  dimension: count_passives_daily {
    type: number
    label: "Count Passives Daily"
    view_label: "NPS Score"
    sql: ${TABLE}."COUNT_PASSIVES_DAILY" ;;
    hidden: yes
  }

  dimension: count_detractors_daily {
    type: number
    label: "Count Detractors Daily"
    view_label: "NPS Score"
    sql: ${TABLE}."COUNT_DETRACTORS_DAILY" ;;
    hidden: yes
  }

  dimension: count_nps_users_daily {
    type: number
    label: "Count NPS Users Daily"
    view_label: "NPS Score"
    sql: ${TABLE}."COUNT_NPS_USERS_DAILY" ;;
    hidden: yes
  }

  dimension: server_id {
    type: string
    label: "Server ID"
    view_label: "NPS Score"
    sql: ${TABLE}."SERVER_ID" ;;
  }

  dimension: version_id {
    type: string
    sql: ${TABLE}.version_id ;;
    hidden: yes
  }
  
  measure: count {
    type: count
    label: "Count"
    view_label: "NPS Score"
    drill_fields: [id]
  }

  measure: daily_nps_score {
    type: number
    label: "Daily NPS Score"
    view_label: "NPS Score"
    sql: round(100 * ((${total_promoters}/NULLIF(${total_nps_users},0)) - (${total_detractors}/NULLIF(${total_nps_users},0))),2) ;;
    drill_fields: [id]
  }

  measure: user_score {
    type: number
    label: "Daily User NPS Score"
    view_label: "NPS Score"
    sql: round(100 * ((${total_user_promoters}/NULLIF(${total_user_nps_users},0)) - (${total_user_detractors}/NULLIF(${total_user_nps_users},0))),2) ;;
    drill_fields: [id]
  }

  measure: team_admin_score {
    type: number
    label: "Daily Team Admin NPS Score"
    view_label: "NPS Score"
    sql: round(100 * ((${total_team_admin_promoters}/NULLIF(${total_team_admin_nps_users},0))
    - (${total_team_admin_detractors}/NULLIF(${total_team_admin_nps_users},0))),2) ;;

    drill_fields: [id]
  }

  measure: system_admin_score {
    type: number
    label: "Daily System Admin NPS Score"
    view_label: "NPS Score"
    sql: round(100 * ((${total_system_admin_promoters}/NULLIF(${total_system_admin_nps_users},0))
    - (${total_system_admin_detractors}/NULLIF(${total_system_admin_nps_users},0))),2) ;;

    drill_fields: [id]
  }

  measure: total_nps_users {
    type: sum
    label: "Total NPS Users"
    view_label: "NPS Score"
    sql: ${count_nps_users_daily} ;;
  }

  measure: total_passives {
    type: sum
    label: "Total Passives"
    view_label: "NPS Score"
    sql: ${count_passives_daily} ;;
  }

  measure: total_promoters {
    type: sum
    label: "Total Promoters"
    view_label: "NPS Score"
    sql: ${count_promoters_daily} ;;
  }

  measure: total_detractors {
    type: sum
    label: "Total Detractors"
    view_label: "NPS Score"
    sql: ${count_detractors_daily} ;;
  }

  measure: quarterly_trailing_score {
    type: number
    label: "Quarterly Trailing NPS Score"
    view_label: "NPS Score"
    sql: round(100 * ((${total_quarterly_promoters}/NULLIF(${total_quarterly_nps_users},0))
      -(${total_quarterly_detractors}/NULLIF(${total_quarterly_nps_users},0))),2) ;;
    drill_fields: [id]
  }

  measure: quarterly_trailing_user_score {
    type: number
    label: "Quarterly Trailing User NPS Score"
    view_label: "NPS Score"
    sql: round(100 * ((${total_user_quarterly_promoters}/NULLIF(${total_user_quarterly_nps_users},0))
    -(${total_user_quarterly_detractors}/NULLIF(${total_user_quarterly_nps_users},0))),2) ;;
    drill_fields: [id]
  }

  measure: quarterly_trailing_team_admin_score {
    type: number
    label: "Quarterly Trailing Team Admin NPS Score"
    view_label: "NPS Score"
    sql: round(100 * ((${total_team_admin_quarterly_promoters}/NULLIF(${total_team_admin_quarterly_nps_users},0))
    -(${total_team_admin_quarterly_detractors}/NULLIF(${total_team_admin_quarterly_nps_users},0))),2) ;;
    drill_fields: [id]
  }

  measure: quarterly_trailing_system_admin_score {
    type: number
    label: "Quarterly Trailing System Admin NPS Score"
    view_label: "NPS Score"
    sql: round(100 * ((${total_system_admin_quarterly_promoters}/NULLIF(${total_system_admin_quarterly_nps_users}, 0) )
    -(${total_system_admin_quarterly_detractors}/NULLIF(${total_system_admin_quarterly_nps_users},0))),2) ;;
    drill_fields: [id]
  }

  measure: total_quarterly_promoters {
    type: sum
    label: "Total Quarterly Promoters"
    view_label: "NPS Score"
    sql: ${count_promoters_last90d} ;;
  }

  measure: total_quarterly_passives {
    type: sum
    label: "Total Quarterly Passives"
    view_label: "NPS Score"
    sql: ${count_passives_last90d} ;;
  }

  measure: total_quarterly_detractors {
    type: sum
    label: "Total Quarterly Detractors"
    view_label: "NPS Score"
    sql: ${count_detractors_last90d} ;;
  }

  measure: total_quarterly_nps_users {
    type: sum
    label: "Total Quarterly NPS Users"
    view_label: "NPS Score"
    sql: ${count_nps_users_last90d} ;;
  }

  measure: total_user_nps_users {
    type: sum
    label: "Total User NPS Users"
    view_label: "NPS Score"
    sql: ${count_user_nps_users_daily} ;;
  }

  measure: total_user_passives {
    type: sum
    label: "Total User Passives"
    view_label: "NPS Score"
    sql: ${count_user_passives_daily} ;;
  }

  measure: total_user_promoters {
    type: sum
    label: "Total User Promoters"
    view_label: "NPS Score"
    sql: ${count_user_promoters_daily} ;;
  }

  measure: total_user_detractors {
    type: sum
    label: "Total User Detractors"
    view_label: "NPS Score"
    sql: ${count_user_detractors_daily} ;;
  }

  measure: total_user_quarterly_promoters {
    type: sum
    label: "Total User Quarterly Promoters"
    view_label: "NPS Score"
    sql: ${count_user_promoters_last90d} ;;
  }

  measure: total_user_quarterly_passives {
    type: sum
    label: "Total User Quarterly Passives"
    view_label: "NPS Score"
    sql: ${count_user_passives_last90d} ;;
  }

  measure: total_user_quarterly_detractors {
    type: sum
    label: "Total User Quarterly Detractors"
    view_label: "NPS Score"
    sql: ${count_user_detractors_last90d} ;;
  }

  measure: total_user_quarterly_nps_users {
    type: sum
    label: "Total User Quarterly NPS Users"
    view_label: "NPS Score"
    sql: ${count_user_nps_users_last90d} ;;
  }

  measure: total_team_admin_nps_users {
    type: sum
    label: "Total Team Admin NPS Users"
    view_label: "NPS Score"
    sql: ${count_team_admin_nps_users_daily} ;;
  }

  measure: total_team_admin_passives {
    type: sum
    label: "Total Team Admin Passives"
    view_label: "NPS Score"
    sql: ${count_team_admin_passives_daily} ;;
  }

  measure: total_team_admin_promoters {
    type: sum
    label: "Total Team Admin Promoters"
    view_label: "NPS Score"
    sql: ${count_team_admin_promoters_daily} ;;
  }

  measure: total_team_admin_detractors {
    type: sum
    label: "Total Team Admin Detractors"
    view_label: "NPS Score"
    sql: ${count_team_admin_detractors_daily} ;;
  }

  measure: total_team_admin_quarterly_promoters {
    type: sum
    label: "Total Team Admin Quarterly Promoters"
    view_label: "NPS Score"
    sql: ${count_team_admin_promoters_last90d} ;;
  }

  measure: total_team_admin_quarterly_passives {
    type: sum
    label: "Total Team Admin Quarterly Passives"
    view_label: "NPS Score"
    sql: ${count_team_admin_passives_last90d} ;;
  }

  measure: total_team_admin_quarterly_detractors {
    type: sum
    label: "Total Team Admin Quarterly Detractors"
    view_label: "NPS Score"
    sql: ${count_team_admin_detractors_last90d} ;;
  }

  measure: total_team_admin_quarterly_nps_users {
    type: sum
    label: "Total Team Admin Quarterly NPS Users"
    view_label: "NPS Score"
    sql: ${count_team_admin_nps_users_last90d} ;;
  }

  measure: total_system_admin_nps_users {
    type: sum
    label: "Total System Admin NPS Users"
    view_label: "NPS Score"
    sql: ${count_system_admin_nps_users_daily} ;;
  }

  measure: total_system_admin_passives {
    type: sum
    label: "Total System Admin Passives"
    view_label: "NPS Score"
    sql: ${count_system_admin_passives_daily} ;;
  }

  measure: total_system_admin_promoters {
    type: sum
    label: "Total System Admin Promoters"
    view_label: "NPS Score"
    sql: ${count_system_admin_promoters_daily} ;;
  }

  measure: total_system_admin_detractors {
    type: sum
    label: "Total System Admin Detractors"
    view_label: "NPS Score"
    sql: ${count_system_admin_detractors_daily} ;;
  }

  measure: total_system_admin_quarterly_promoters {
    type: sum
    label: "Total System Admin Quarterly Promoters"
    view_label: "NPS Score"
    sql: ${count_system_admin_promoters_last90d} ;;
  }

  measure: total_system_admin_quarterly_passives {
    type: sum
    label: "Total System Admin Quarterly Passives"
    view_label: "NPS Score"
    sql: ${count_system_admin_passives_last90d} ;;
  }

  measure: total_system_admin_quarterly_detractors {
    type: sum
    label: "Total System Admin Quarterly Detractors"
    view_label: "NPS Score"
    sql: ${count_system_admin_detractors_last90d} ;;
  }

  measure: total_system_admin_quarterly_nps_users {
    type: sum
    label: "Total System Admin Quarterly NPS Users"
    view_label: "NPS Score"
    sql: ${count_system_admin_nps_users_last90d} ;;
  }
}
