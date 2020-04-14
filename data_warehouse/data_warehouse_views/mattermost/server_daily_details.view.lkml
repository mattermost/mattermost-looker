view: server_daily_details {
  sql_table_name: mattermost.server_daily_details ;;
  view_label: "Server Daily Details"
  # Filters
  filter: last_day_of_month {
    type: yesno
    description: "Filters so the logging date is equal to the last day of the month. Useful when grouping by month to report on server states in the given month."
    sql: CASE WHEN ${logging_date} =
                                      CASE WHEN DATE_TRUNC('month', ${logging_date}::date) = DATE_TRUNC('month', CURRENT_DATE) THEN (SELECT MAX(date) FROM mattermost.server_daily_details)
                                        ELSE DATEADD(MONTH, 1, DATE_TRUNC('month',${logging_date}::date)) - INTERVAL '1 DAY' END
          THEN TRUE ELSE FALSE END ;;
  }

  filter: last_day_of_week {
    type: yesno
    description: "Filters so the logging date is equal to the last day of the week. Useful when grouping by month to report on server states in the given week."
    sql: CASE WHEN ${logging_date} =
                                      CASE WHEN DATE_TRUNC('week', ${logging_date}::date) = DATE_TRUNC('week', CURRENT_DATE) THEN (SELECT MAX(date) FROM mattermost.server_daily_details)
                                        ELSE DATEADD(WEEK, 1, DATE_TRUNC('week',${logging_date}::date)) - INTERVAL '1 DAY' END
          THEN TRUE ELSE FALSE END ;;
  }

  # Dimensions
  dimension: server_id {
    description: "The unique server ID for each telemetry-enabled active server."
    type: string
    sql: ${TABLE}.server_id ;;
  }

  dimension_group: logging {
    description: "The date the server details were logged."
    type: time
    timeframes: [date, month, year]
    sql: ${TABLE}.date ;;
  }

  dimension: hour {
    description: "The hour in the day the server details were logged."
    type: number
    sql: ${TABLE}.hour ;;
  }

  dimension: in_security {
    label: "  Telemetry Enabled"
    description: "Is contained in the events.security table data on the given logging date."
    type: yesno
    sql: ${TABLE}.in_security ;;
  }

  dimension: in_mattermos2_server {
    description: "Is contained in the mattermost2.server table data on the given logging date."
    group_label: " Data Quality"
    type: yesno
    sql: ${TABLE}.in_mm2_server ;;
  }

  dimension: has_dupes {
    label: "Has Duplicates"
    group_label: " Data Quality"
    description: "Indicates whether the server is noted as having duplicate records in raw security and server tables."
    type: yesno
    sql: ${TABLE}.has_dupes ;;
  }

  dimension: has_multi_ips {
    label: "Has Multiple IP's"
    group_label: " Data Quality"
    description: "Indicates whether the server is noted as having multiple IP addresses logged in the raw security table."
    type: yesno
    sql: ${TABLE}.has_multii_ips ;;
  }

  dimension: ip_address {
    label: "IP Address"
    description: "The server's IP Address."
    type: string
    sql: ${TABLE}.ip_address ;;
  }

  dimension: grouping {
    description: "The grouping representing the time of day that the server details were logged (A=AM, B=PM)."
    type: string
    sql: ${TABLE}.grouping ;;
  }

  dimension: location {
    description: "The 3 digit ISO code of the city or area that server resides in."
    type: string
    sql: ${TABLE}.location ;;
  }

  dimension: active_user_count {
    label: "Active Users"
    group_label: " Telemetry User Counts"
    description: "The count of registered users that have visited the Mattermost site/application in the last 24 hours on the server."
    type: number
    sql: ${TABLE}.active_user_count ;;
  }

  dimension: active_user_count_band {
    label: "Active Users Band"
    group_label: " Telemetry User Counts"
    description: "The count of registered users that have visited the Mattermost site/application in the last 24 hours on the server."
    type: tier
    style: integer
    tiers: [1, 2, 4, 7, 11, 16, 21, 31, 41, 51, 76, 101, 151, 301, 501, 1001]
    sql: ${active_user_count} ;;
  }

  dimension: user_count {
    label: "Registered Users"
    group_label: " Telemetry User Counts"
    description: "The count of all users registered/associated with the server."
    type: number
    sql: ${TABLE}.user_count ;;
  }

  dimension: user_count_band {
    label: "Registered Users Band"
    group_label: " Telemetry User Counts"
    description: "The count of all users registered/associated with the server tiered into distinct ranges."
    type: tier
    style: integer
    tiers: [1, 2, 4, 7, 11, 16, 21, 31, 41, 51, 76, 101, 151, 301, 501, 1001]#[2, 5, 11, 16, 21, 31, 41, 51, 76, 101, 151, 301, 501, 1001]
    sql: ${user_count} ;;
  }

  dimension: latest_record {
    label: "  Latest Record"
    description: "Indicates whether the record captures the last (most recent) date that telemetry was logged for the server."
    type: yesno
    sql: CASE WHEN ${logging_date} = ${server_fact.last_telemetry_active_date} THEN TRUE ELSE FALSE END ;;
    hidden: no
  }

  dimension: tracking_disabled {
    label: " Tracking Disabled"
    group_label: " Data Quality"
    description: "True or false indicating whether the server sent telemetry data to Mattermost on the record date. True if server disabled telemetry, was deleted, or there was error/anomaly in the data collection pipeline."
    type: yesno
    sql: ${TABLE}.tracking_disabled ;;
    hidden: no
  }

  dimension: currently_sending_telemetry{
    label: "  Telemetry Currently Enabled"
    description: "Indicates the server sent telemetry data on the most recent logging date (current date - 1 day)."
    type: yesno
    sql: CASE WHEN ${logging_date} = (SELECT MAX(date) FROM mattermost.server_daily_details) AND NOT ${tracking_disabled} THEN TRUE ELSE FALSE END ;;
    hidden: no
  }

  dimension: version {
    description: "The version of Mattermost the server is currently using (example: 5.9.0.5.9.8)"
    type: string
    sql: ${TABLE}.version ;;
  }

  dimension: db_type {
    label: "Database Type"
    description: "The type of database the server is currently using (postgres vs. mysql)"
    type: string
    sql: ${TABLE}.database_type ;;
  }

  dimension: os_type {
    label: "Operating System"
    description: "The operating system the server is currently using (linux, darwin, windows, etc.)"
    type: string
    sql: ${TABLE}.os_type ;;
  }

  dimension: account_sfid {
    label: "Account SFID"
    description: "The Salesforce Account ID of the Mattermost customer associated with the server (null if no Salesforce Account found)."
    link: {
      label: "Salesforce Account Record"
      url: "https://mattermost.lightning.force.com/lightning/r/{{ value }}/view"
      icon_url: "https://mattermost.my.salesforce.com/favicon.ico"
    }
    type: string
    sql: ${TABLE}.account_sfid ;;
  }

  dimension: license_id {
    label: "License ID"
    description: "The Mattermost Customer License ID associated with the server (null if no license found)."
    group_label: "License Info."
    type: string
    sql: ${TABLE}.license_id1 ;;
  }

  dimension: license_email {
    label: "License Email"
    description: "The email associated with the license provisioned to the Mattermost server."
    group_label: "License Info."
    type: string
    sql: ${TABLE}.license_email ;;
  }

  dimension: license_contact_sfid {
    label: "License Contact SFID"
    description: "The Contact SFID of the License Email associated with the license provisioned to the Mattermost server."
    group_label: "License Info."
    link: {
      label: "Salesforce Contact Record"
      url: "https://mattermost.lightning.force.com/lightning/r/{{ value }}/view"
      icon_url: "https://mattermost.my.salesforce.com/favicon.ico"
    }
    type: string
    sql: ${TABLE}.license_contact_sfid ;;
  }

  dimension: license_status {
    label: "Licensed Server"
    description: "Indicates whether the server is registered/paired with a licensed customer (If yes then licensed, else unlicensed)."
    group_label: "License Info."
    type: yesno
    sql: case when ${license_id} is not null then true else false end ;;
  }

  dimension: server_status {
    label: "Server Status"
    description: "Indicates whether the server is >= 7 days old w/ active user, >= 7 days old, w/ active users, or no active users."
    type: string
    order_by_field: server_status_sort
    sql: case when ${active_user_count} > 0 and datediff(day, ${server_fact.first_telemetry_active_date}, ${logging_date})  >= 7 then '>= 7 Days Old w/ Active Users'
              when datediff(day, ${server_fact.first_telemetry_active_date}, ${logging_date})  >= 7 then '>= 7 Days Old w/out Active Users'
              when ${active_user_count} > 0 then  '< 7 Days Old w/ Active Users'
              else '< 7 Days Old w/out Active Users' end ;;
  }

  dimension: server_status_sort {
    label: "Server Status"
    description: "Indicates whether the server is >= 7 days old w/ active user, >= 7 days old, w/ active users, or no active users."
    type: number
    sql: case when ${active_user_count} > 0 and datediff(day, ${server_fact.first_telemetry_active_date}, ${logging_date})  >= 7 then 1
              when datediff(day, ${server_fact.first_telemetry_active_date}, ${logging_date})  >= 7 then 2
              when ${active_user_count} > 0 then  3
              else 4 end ;;
    hidden: yes
  }

  dimension: 7days_old {
    label: "Server > 7 Days Status "
    description: "Indicates whether the server is >= 7 days or < 7 days old."
    type: string
    sql: case when datediff(day, ${server_fact.first_active_date}, ${logging_date})  >= 7 then '>= 7 Days Old'
              when datediff(day, ${server_fact.first_active_date}, ${logging_date})  < 7 then '< 7 Days Old'
              else null end ;;
  }

  dimension: days_since_first_telemetry_enabled {
    label: "Server Age (Days)"
    description: "Displays the age in days of the server. Age is calculated as days between the first active date (first date telemetry enabled) and logging date of the record."
    type: number
    sql: datediff(day, COALESCE(${server_fact.first_telemetry_active_date}, ${nps_server_monthly_score.server_install_date}), ${logging_date}) ;;
  }

  dimension: days_since_first_telemetry_enabled_band {
    label: "Server Age Band (Days)"
    description: "Displays the age in days of the server bucketed into groupings. Age is calculated as days between the first active date (first date telemetry enabled) and logging date of the record."
    type: tier
    style: integer
    tiers: [1,8,31,61,91,181,366,731]
    sql: ${days_since_first_telemetry_enabled} ;;
  }

  dimension_group: first_telemetry_enabled {
    type: time
    timeframes: [date, month, year]
    sql: ${server_fact.first_telemetry_active_date}::date ;;
  }

  dimension: server_age {
    label: "Server Age Band (Days)"
    description: "Displays the age in days of the server bucketed into groupings. Age is calculated from first active date (first date telemetry enabled) to logging date."
    type: tier
    style: integer
    tiers: [0,31,61,91,181,366,731]
    sql: datediff(day, COALESCE(${server_fact.first_telemetry_active_date}, ${nps_server_monthly_score.server_install_date}), ${logging_date}) ;;
    hidden: yes
  }

  filter: is_telemetry_enabled {
    description: "Boolean indicating server is in the events.security table data on the given date."
    type: yesno
    sql: ${TABLE}.in_security ;;
  }

  filter: is_tracking_enabled {
    description: "Boolean indicating server is in the events.security or mattermost2.server table data on the given date."
    type: yesno
    sql: CASE WHEN ${TABLE}.in_security OR ${in_mattermos2_server} THEN TRUE ELSE FALSE END ;;
  }

  dimension: system_admins {
    description: "The number of system admins associated with the Mattermost server."
    type: number
    sql: ${TABLE}.system_admins ;;
  }


  # Measures
  measure: server_count {
    description: "Use this for counting distinct Server ID's across dimensions. This measure is used to calculate TEDAS (Telemetry-Enabled Daily Active Servers) when aggregated at the daily level."
    type: count_distinct
    sql: ${server_id} ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, days_since_first_telemetry_enabled, user_count, active_user_count, system_admins, first_telemetry_enabled_date, server_fact.last_telemetry_active_date]
  }

  measure: server_7days_count {
    label: "Server >= 7 Days Old Count"
    description: "Use this for counting distinct Server ID's for servers that are >= 7 days old across dimensions."
    type: count_distinct
    sql: CASE WHEN datediff(day, ${server_fact.first_telemetry_active_date}, ${logging_date})  >= 7 then ${server_id} else null end;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, days_since_first_telemetry_enabled, user_count, active_user_count, system_admins, first_telemetry_enabled_date, server_fact.last_telemetry_active_date]
  }

  measure: server_1days_count {
    label: "Server >=1 Day Old Count"
    description: "Use this for counting distinct Server ID's for servers that are >= 1 days old across dimensions."
    type: count_distinct
    sql: CASE WHEN datediff(day, ${server_fact.first_active_date}, ${logging_date})  >= 1 then ${server_id} else null end;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, days_since_first_telemetry_enabled, user_count, active_user_count, system_admins, first_telemetry_enabled_date, server_fact.last_telemetry_active_date]
  }

  measure: server_7days_w_active_users_count {
    label: "Server >=7 Days Old w/ Active Users Count"
    description: "Use this for counting distinct Server ID's for servers that are >= 7 days old and have active users > 0 across dimensions."
    type: count_distinct
    sql: CASE WHEN datediff(day, ${server_fact.first_telemetry_active_date}, ${logging_date})  >= 7 AND ${active_user_count} > 0 THEN ${server_id} ELSE NULL END;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, days_since_first_telemetry_enabled, user_count, active_user_count, system_admins, first_telemetry_enabled_date, server_fact.last_telemetry_active_date]
  }

  measure: server_1days_w_active_users_count {
    label: "Server >=1 Day Old w/ Active Users Count"
    description: "Use this for counting distinct Server ID's for servers that are >= 1 days old and have active users > 0 across dimensions."
    type: count_distinct
    sql: CASE WHEN datediff(day, ${server_fact.first_telemetry_active_date}, ${logging_date})  >= 1 AND ${active_user_count} > 0 THEN ${server_id} ELSE NULL END;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, days_since_first_telemetry_enabled, user_count, active_user_count, system_admins, first_telemetry_enabled_date, server_fact.last_telemetry_active_date]
  }

  measure: server_w_active_users_count {
    label: "Server w/ Active Users Count"
    description: "Use this to count distinct Server ID's with > 0 active users across dimensions."
    type: count_distinct
    sql: CASE WHEN ${active_user_count} > 0 THEN ${server_id} ELSE NULL END ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, days_since_first_telemetry_enabled, user_count, active_user_count, system_admins, first_telemetry_enabled_date, server_fact.last_telemetry_active_date]
  }

  measure: total_active_user_count {
    description: "Use this for summing active user counts across diemensions. This measure is used to calculate TEDAU (Telemetry-Enabled Daily Active Users) when aggregated at the daily level."
    type: sum
    sql: ${active_user_count} ;;
  }

  measure: total_user_count {
    description: "Use this for summing user counts across dimensions."
    type: sum
    sql: ${user_count} ;;
  }

  measure: servers_w_nps_count {
    label: "Servers w/ NPS Score Count"
    description: "The count of the number of servers w/ NPS Score submissions from users associated with the server."
    type: count_distinct
    sql: CASE WHEN COALESCE(${nps_server_monthly_score.nps_users},0) > 0 THEN ${server_id} ELSE NULL END ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, nps_server_monthly_score.nps_score, nps_server_monthly_score.nps_users, days_since_first_telemetry_enabled, user_count, active_user_count, system_admins, first_telemetry_enabled_date, server_fact.last_telemetry_active_date]
  }

  measure: servers_w_positive_nps_count {
    label: "Servers w/ Positive NPS Count"
    description: "The count of the number of servers w/ NPS Score submissions from users associated with the server."
    type: count_distinct
    sql: CASE WHEN COALESCE(${nps_server_monthly_score.nps_users},0) > 0 AND COALESCE(${nps_server_monthly_score.nps_score},0) > 0 THEN ${server_id} ELSE NULL END ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, nps_server_monthly_score.nps_score, nps_server_monthly_score.nps_users, days_since_first_telemetry_enabled, user_count, active_user_count, system_admins, first_telemetry_enabled_date, server_fact.last_telemetry_active_date]
  }

  measure: servers_w_positive_nps_active_users_count {
    label: "Servers w/ Positive NPS & Active Users Count"
    description: "The count of the number of servers w/ NPS Score submissions from users associated with the server and have active users on the given logging date."
    type: count_distinct
    sql: CASE WHEN COALESCE(${nps_server_monthly_score.nps_users},0) > 0 AND COALESCE(${nps_server_monthly_score.nps_score},0) > 0 AND ${active_user_count} > 0 THEN ${server_id} ELSE NULL END ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, nps_server_monthly_score.nps_score, nps_server_monthly_score.nps_users, days_since_first_telemetry_enabled, user_count, active_user_count, system_admins, first_telemetry_enabled_date, server_fact.last_telemetry_active_date]
  }
}
