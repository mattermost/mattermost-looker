view: server_daily_details {
  sql_table_name: mattermost.server_daily_details ;;
  view_label: "Server Daily Details"
  # Filters
  filter: last_day_of_month {
    type: yesno
    description: "Filters so the logging date is equal to the last Thursday of each month. Useful when grouping by month to report on server states in the given month."
    sql: CASE WHEN ${logging_date} =
                                      CASE WHEN DATE_TRUNC('month', ${logging_date}::date) = DATE_TRUNC('month', CURRENT_DATE) THEN
                                        CASE WHEN DAYOFMONTH((SELECT MAX(date) FROM mattermost.server_daily_details)) = 1
                                            THEN (SELECT MAX(date) FROM mattermost.server_daily_details)
                                          WHEN DAYOFWEEK((SELECT MAX(date) FROM mattermost.server_daily_details)) < 6
                                            AND DAYOFWEEK((SELECT MAX(date) FROM mattermost.server_daily_details)) > 0
                                            THEN (SELECT MAX(date) FROM mattermost.server_daily_details)
                                          WHEN DAYOFWEEK((SELECT MAX(date - INTERVAL '1 DAY') FROM mattermost.server_daily_details)) < 6
                                            AND DAYOFWEEK((SELECT MAX(date - INTERVAL '1 DAY') FROM mattermost.server_daily_details)) > 0
                                            AND  DATE_TRUNC('MONTH',(SELECT MAX(date - INTERVAL '1 DAY') FROM mattermost.server_daily_details)) = DATE_TRUNC('MONTH', CURRENT_DATE)
                                            THEN (SELECT MAX(date - INTERVAL '1 DAY') FROM mattermost.server_daily_details)
                                          WHEN DAYOFWEEK((SELECT MAX(date - INTERVAL '2 DAY') FROM mattermost.server_daily_details)) < 6
                                            AND DAYOFWEEK((SELECT MAX(date - INTERVAL '2 DAY') FROM mattermost.server_daily_details)) > 0
                                            AND  DATE_TRUNC('MONTH',(SELECT MAX(date - INTERVAL '2 DAY') FROM mattermost.server_daily_details)) = DATE_TRUNC('MONTH', CURRENT_DATE)
                                            THEN (SELECT MAX(date - INTERVAL '2 DAY') FROM mattermost.server_daily_details)
                                          WHEN DAYOFWEEK((SELECT MAX(date - INTERVAL '3 DAY') FROM mattermost.server_daily_details)) < 6
                                            AND DAYOFWEEK((SELECT MAX(date - INTERVAL '3 DAY') FROM mattermost.server_daily_details)) > 0
                                            AND DATE_TRUNC('MONTH',(SELECT MAX(date - INTERVAL '3 DAY') FROM mattermost.server_daily_details)) = DATE_TRUNC('MONTH', CURRENT_DATE)
                                            THEN (SELECT MAX(date - INTERVAL '3 DAY') FROM mattermost.server_daily_details)
                                          ELSE (SELECT MAX(date) FROM mattermost.server_daily_details) END
                                      ELSE
                                        CASE WHEN DAYOFWEEK(DATEADD(MONTH, 1, DATE_TRUNC('month',${logging_date}::date)) - INTERVAL '1 DAY') = 4
                                            THEN DATEADD(MONTH, 1, DATE_TRUNC('month',${logging_date}::date)) - INTERVAL '1 DAY'
                                          WHEN DAYOFWEEK(DATEADD(MONTH, 1, DATE_TRUNC('month',${logging_date}::date)) - INTERVAL '2 DAY') = 4
                                            THEN DATEADD(MONTH, 1, DATE_TRUNC('month',${logging_date}::date)) - INTERVAL '2 DAY'
                                          WHEN DAYOFWEEK(DATEADD(MONTH, 1, DATE_TRUNC('month',${logging_date}::date)) - INTERVAL '3 DAY') = 4
                                            THEN DATEADD(MONTH, 1, DATE_TRUNC('month',${logging_date}::date)) - INTERVAL '3 DAY'
                                          WHEN DAYOFWEEK(DATEADD(MONTH, 1, DATE_TRUNC('month',${logging_date}::date)) - INTERVAL '4 DAY') = 4
                                            THEN DATEADD(MONTH, 1, DATE_TRUNC('month',${logging_date}::date)) - INTERVAL '4 DAY'
                                          WHEN DAYOFWEEK(DATEADD(MONTH, 1, DATE_TRUNC('month',${logging_date}::date)) - INTERVAL '5 DAY') = 4
                                            THEN DATEADD(MONTH, 1, DATE_TRUNC('month',${logging_date}::date)) - INTERVAL '5 DAY'
                                          WHEN DAYOFWEEK(DATEADD(MONTH, 1, DATE_TRUNC('month',${logging_date}::date)) - INTERVAL '6 DAY') = 4
                                            THEN DATEADD(MONTH, 1, DATE_TRUNC('month',${logging_date}::date)) - INTERVAL '6 DAY'
                                          WHEN DAYOFWEEK(DATEADD(MONTH, 1, DATE_TRUNC('month',${logging_date}::date)) - INTERVAL '7 DAY') = 4
                                            THEN DATEADD(MONTH, 1, DATE_TRUNC('month',${logging_date}::date)) - INTERVAL '7 DAY'
                                          ELSE DATEADD(MONTH, 1, DATE_TRUNC('month',${logging_date}::date)) - INTERVAL '8 DAY' END
                                      END
            THEN TRUE ELSE FALSE END ;;
  }

  filter: last_day_of_week {
    type: yesno
    description: "Filters so the logging date is equal to the last Thursday of each week. Useful when grouping by month to report on server states in the given week."
    sql: CASE WHEN ${logging_date} =
                                      CASE WHEN DATE_TRUNC('week', ${logging_date}::date) = DATE_TRUNC('week', CURRENT_DATE) THEN (SELECT MAX(date) FROM mattermost.server_daily_details)
                                        ELSE DATEADD(WEEK, 1, DATE_TRUNC('week',${logging_date}::date)) - INTERVAL '4 DAY' END
          THEN TRUE ELSE FALSE END ;;
  }

  filter: in_mm2_server {
    description: "Boolean indicating the server is in mattermost2.server table data on the given logging date."
    label: "In Activity/Server Diagnostics"
    type: yesno
    sql: ${TABLE}.in_mm2_server ;;
  }

  filter: latest_telemetry_record {
    label: "  Latest Security Telemetry Record"
    description: "Indicates whether the record captures the last (most recent) date that Security (security_update_check.go) diagnostics telemetry was logged for the server."
    type: yesno
    sql: CASE WHEN ${logging_date} = ${server_fact.last_telemetry_active_date} THEN TRUE ELSE FALSE END ;;
    hidden: no
  }

  filter: latest_segment_telemetry_record {
    label: "  Latest Diagnostics Telemetry Record"
    description: "Boolean indicating the record is the last (most recent) date that Diagnostics (diagnostics.go) telemetry data was logged for the server."
    type: yesno
    sql: CASE WHEN ${logging_date} = ${server_fact.last_mm2_telemetry_date} THEN TRUE ELSE FALSE END ;;
    hidden: no
  }

  filter: before_last_segment_telemetry_date {
    label: "  <= Last Activity Date"
    description: "Indicates whether the record's logging date is before the server's last (most recent) date that Diagnostics (diagnostics.go) telemetry data was logged for the server."
    type: yesno
    sql: CASE WHEN ${logging_date} <= ${server_fact.last_mm2_telemetry_date} THEN TRUE ELSE FALSE END ;;
    hidden: no
  }

  filter: is_telemetry_enabled {
    label: "In Security Diagnostics"
    description: "Boolean indicating the server appears in the events.security table data (security_update_check.go) on the given date."
    type: yesno
    sql: ${TABLE}.in_security ;;
  }

  filter: is_tracking_enabled {
    label: "In Security or Activity/Server Diagnostics"
    description: "Boolean indicating the server appears in the events.security (security_update_check.go) or mattermost2.server (diagnostics.go) table data on the given date."
    type: yesno
    sql: CASE WHEN ${TABLE}.in_security OR ${in_mm2_server} THEN TRUE ELSE FALSE END ;;
  }

  filter: in_mattermost2_server {
    description: "Boolean indicating the server is in mattermost2.server (diagnostics.go) table data on the given logging date."
    label: "In Activity/Server Diagnostics"
    type: yesno
    sql: ${TABLE}.in_mm2_server ;;
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
    timeframes: [date, week, month, year, fiscal_quarter, fiscal_year]
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

  dimension: edition {
    label: " Server Edition (Current)"
    group_label: " Server Editions"
    description: "The server edition. Either E0 or TE."
    type: string
    sql: CASE WHEN ${TABLE}.edition = 'true' THEN 'E0' WHEN  ${TABLE}.edition = 'false' THEN 'TE' ELSE NULL END ;;
  }

  dimension: first_server_edition {
    label: "First Server Edition"
    group_label: " Server Editions"
    description: "The first server edition logged via telemetry for the server. Either E0 or TE."
    type: string
    sql: ${server_fact.first_server_edition} ;;
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
    group_label: " Server Versions"
    label: " Server Version"
    description: "The version of Mattermost the server was using on the given logging date (example: 5.9.0.5.9.8)"
    type: string
    sql: regexp_substr(${TABLE}.version,'^[0-9]{0,}[.]{1}[0-9[{0,}[.]{1}[0-9]{0,}[.]{1}[0-9]{0,}') ;;
    order_by_field: server_version_major_sort
  }

  dimension: server_version_major {
    group_label: " Server Versions"
    label: "  Server Version: Major (Current)"
    description: "The server version associated with the Mattermost server on the given logging date - omitting the trailing dot release."
    type: string
    sql: split_part(regexp_substr(${TABLE}.version,'^[0-9]{0,}[.]{1}[0-9[{0,}[.]{1}[0-9]{0,}[.]{1}[0-9]{0,}'), '.', 1) || '.' || split_part(regexp_substr(${TABLE}.version,'^[0-9]{0,}[.]{1}[0-9[{0,}[.]{1}[0-9]{0,}[.]{1}[0-9]{0,}'), '.', 2)  ;;
    order_by_field: server_version_major_sort
  }

  dimension: server_version_major_sort {
    group_label: " Server Versions"
    label: "  Server Version: Major (Current)"
    description: "The current server version, or if current telemetry is not available, the last recorded server version recorded for the server."
    type: number
    sql: (split_part(regexp_substr(${TABLE}.version,'^[0-9]{0,}[.]{1}[0-9[{0,}[.]{1}[0-9]{0,}[.]{1}[0-9]{0,}'), '.', 1) ||
          CASE WHEN split_part(regexp_substr(${TABLE}.version,'^[0-9]{0,}[.]{1}[0-9[{0,}[.]{1}[0-9]{0,}[.]{1}[0-9]{0,}'), '.', 2) = '10' THEN '99'
            ELSE split_part(regexp_substr(${TABLE}.version,'^[0-9]{0,}[.]{1}[0-9[{0,}[.]{1}[0-9]{0,}[.]{1}[0-9]{0,}'), '.', 2) || '0' END)::int ;;
    hidden: yes
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
    sql: case when ${active_user_count} > 0 and datediff(day, ${server_fact.first_active_date}, ${logging_date})  >= 7 then '>= 7 Days Old w/ Active Users'
              when datediff(day, ${server_fact.first_telemetry_active_date}, ${logging_date})  >= 7 then '>= 7 Days Old w/out Active Users'
              when ${active_user_count} > 0 then  '< 7 Days Old w/ Active Users'
              else '< 7 Days Old w/out Active Users' end ;;
  }

  dimension: server_status_sort {
    label: "Server Status"
    description: "Indicates whether the server is >= 7 days old w/ active user, >= 7 days old, w/ active users, or no active users."
    type: number
    sql: case when ${active_user_count} > 0 and datediff(day, ${server_fact.first_active_date}, ${logging_date})  >= 7 then 1
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
    label: "Days Since First Telemetry Enabled"
    description: "Displays the age in days of the server. Age is calculated as days between the first active date (first date telemetry enabled) and logging date of the record."
    type: number
    sql: datediff(day, COALESCE(${server_fact.first_telemetry_active_date}, ${nps_server_daily_score.server_install_date}), ${logging_date}) ;;
  }

  dimension: days_since_first_telemetry_enabled_band {
    label: "Days Since First Telemetry Band"
    description: "Displays the age in days of the server bucketed into groupings. Age is calculated as days between the first active date (first date telemetry enabled) and logging date of the record."
    type: tier
    style: integer
    tiers: [1,7,31,61,91,181,366,731]
    sql: ${days_since_first_telemetry_enabled} ;;
  }

  dimension_group: first_telemetry_enabled {
    label: "First Security Telemetry"
    description: "The date the server first recorded security telemetry data in the security diagnostics data (logged via security_update_check.go)."
    type: time
    timeframes: [date, week, month, year]
    sql: ${server_fact.first_telemetry_active_date}::date ;;
  }

  dimension_group: last_telemetry_enabled {
    label: "Last Security Telemetry"
    description: "The date the server last recorded security telemetry data in the security diagnostics data."
    type: time
    timeframes: [date, week, month, year]
    sql: ${server_fact.last_telemetry_active_date}::date ;;
  }

  dimension_group: last_mm2_telemetry {
    label: "Last Diagnostics Telemetry"
    description: "The date the server last recorded diagnostics telemetry (logged via diagnostics.go)."
    type: time
    timeframes: [date, week, month, year]
    sql: ${server_fact.last_mm2_telemetry_date} ;;
  }

  dimension_group: first_mm2_telemetry {
    label: "First Diagnostics Telemetry"
    description: "The date the server first recorded diagnostics telemetry (logged via diagnostics.go)."
    type: time
    timeframes: [date, week, month, year]
    sql: ${server_fact.first_mm2_telemetry_date} ;;
  }

  dimension: days_from_first_telemetry_to_paid_license {
    label: "Days to Paid License"
    description: "The number of days between the servers first telemetry date and it's first date recording an association with a paid license key."
    type: number
    sql: datediff(day, COALESCE(${server_fact.first_active_date}, ${nps_server_daily_score.server_install_date}), ${server_fact.first_paid_license_date}) ;;
  }

  dimension: days_from_first_telemetry_to_paid_license_band {
    label: "Days to Paid License Band"
    description: "The number of days between the servers first telemetry date and it's first date recording an association with a paid license key."
    type: tier
    style: integer
    tiers: [1,7,31,61,91,181,366,731]
    sql: ${days_from_first_telemetry_to_paid_license} ;;
  }

  dimension: server_age {
    label: "Server Age Band (Days)"
    description: "Displays the age in days of the server bucketed into groupings. Age is calculated from first active date (first date telemetry enabled) to logging date."
    type: tier
    style: integer
    tiers: [0,31,61,91,181,366,731]
    sql: datediff(day, COALESCE(${server_fact.first_active_date}, ${nps_server_daily_score.server_install_date}), ${logging_date}) ;;
    hidden: yes
  }

  dimension: system_admins {
    description: "The number of system admins associated with the Mattermost server."
    type: number
    sql: ${TABLE}.system_admins ;;
  }

  dimension: company {
    group_label: "License Info."
    description: "The company derived from the license associated with the server."
    type: string
    sql: ${licenses.company} ;;
  }

  dimension: events {
    group_label: "Server Events"
    label: "Total Events"
    description: "The total number of events by active users associated with the server on the given logging."
    type: number
    value_format_name: decimal_0
    sql: ${server_events_by_date.post_events} ;;
  }

  dimension: posts {
    group_label: "Server Events"
    label: "Posts"
    description: "The number of post events by active users associated with the server on the given logging."
    type: number
    value_format_name: decimal_0
    sql: ${server_events_by_date.post_events} ;;
  }

  dimension: posts_per_user_per_day {
    group_label: "Server Events"
    label: "Posts Per User"
    description: "The number of posts per active user for the server on the given logging."
    type: number
    value_format_name: decimal_1
    sql: ${server_events_by_date.post_events}::FLOAT/NULLIF(${server_events_by_date.users}::float,0) ;;
  }


  # Measures
  measure: server_count {
    label: "   Server Count"
    group_label: " Server Counts"
    description: "Use this for counting all distinct Server ID's across dimensions. This measure is a composite of TEDAS servers and additional data sources that logged the server on the given logging date."
    type: count_distinct
    sql: ${server_id} ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, days_since_first_telemetry_enabled, user_count, active_user_count, system_admins, first_telemetry_enabled_date, server_fact.last_telemetry_active_date]
  }

  measure: tedas_server_count {
    group_label: " Server Counts"
    label: "   TEDAS Count"
    description: "Use to trend the count of distinct TEDAS Servers across grouped dimensions. This measure is prefiltered to only count TEDAS. Use to track TEDAS (Telemetry-Enabled Daily Active Servers) when grouped by logging dates."
    type: count_distinct
    sql: CASE WHEN ${in_security} THEN ${server_id} ELSE NULL END ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, days_since_first_telemetry_enabled, user_count, active_user_count, system_admins, first_telemetry_enabled_date, server_fact.last_telemetry_active_date]
  }

  measure: new_tedas_server_count {
    group_label: " Server Counts"
    label: "  New TEDAS Count"
    description: "Use this to trend the count of new, distinct TEDAS Servers by logging date."
    type: count_distinct
    sql: CASE WHEN ${in_security} AND ${logging_date} = ${first_telemetry_enabled_date} THEN ${server_id} ELSE NULL END ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, days_since_first_telemetry_enabled, user_count, active_user_count, system_admins, first_telemetry_enabled_date, server_fact.last_telemetry_active_date]
  }

  measure: server_7days_count {
    group_label: " Server Counts >= 7 Days Old"
    label: "  Server >= 7 Days Old"
    description: "Use this for counting distinct Server ID's for servers that are >= 7 days old across dimensions."
    type: count_distinct
    sql: CASE WHEN ${days_since_first_telemetry_enabled}  >= 7 then ${server_id} else null end;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, days_since_first_telemetry_enabled, user_count, active_user_count, system_admins, first_telemetry_enabled_date, server_fact.last_telemetry_active_date]
  }

  measure: server_7days_converted_to_paid_count {
    group_label: " Server Counts >= 7 Days Old"
    label: "Server >= 7 Days Old & Converted to Paid < 7 Days"
    description: "Use this for counting distinct Server ID's for servers that are >= 7 days old and converted to paid, licensed customers across dimensions."
    type: count_distinct
    sql: CASE WHEN ${days_since_first_telemetry_enabled}  >= 7 AND ${days_from_first_telemetry_to_paid_license} < 7 then ${server_id} else null end;;
    drill_fields: [server_id, account_sfid, account.name, server_fact.server_version,  days_from_first_telemetry_to_paid_license, server_fact.first_paid_license_date, first_telemetry_enabled_date, server_fact.last_telemetry_active_date]
  }

  measure: server_7days_converted_count {
    group_label: " Server Counts >= 7 Days Old"
    label: "Server >= 7 Days Old & Converted to Paid >= 7 Days"
    description: "Use this for counting distinct Server ID's for servers that are >= 7 days old and that converted to a paid SKU in >= 7 days since their first telemetry date across dimensions."
    type: count_distinct
    sql: CASE WHEN ${days_since_first_telemetry_enabled}  >= 7 AND ${days_from_first_telemetry_to_paid_license} >= 7 then ${server_id} else null end;;
    drill_fields: [server_id, account_sfid, account.name, server_fact.server_version, days_from_first_telemetry_to_paid_license, server_fact.first_paid_license_date, first_telemetry_enabled_date, server_fact.last_telemetry_active_date]
  }

  measure: server_7days_did_not_convert_count {
    group_label: " Server Counts >= 7 Days Old"
    label: "Server >= 7 Days Old & Not Converted to Paid"
    description: "Use this for counting distinct Server ID's for servers that are >= 7 days old and that either: converted to a paid SKU in >= 7 days since their first telemetry date or did not converted to paid across dimensions."
    type: count_distinct
    sql: CASE WHEN ${days_since_first_telemetry_enabled}  >= 7 AND (${days_from_first_telemetry_to_paid_license} IS NULL) then ${server_id} else null end;;
    drill_fields: [server_id, account_sfid, account.name, server_fact.server_version, days_from_first_telemetry_to_paid_license, server_fact.first_paid_license_date, first_telemetry_enabled_date, server_fact.last_telemetry_active_date]
  }

  measure: server_1days_count {
    group_label: " Server Counts"
    label: "Server >=1 Day Old"
    description: "Use this for counting distinct Server ID's for servers that are >= 1 days old across dimensions."
    type: count_distinct
    sql: CASE WHEN datediff(day, ${server_fact.first_active_date}, ${logging_date})  >= 1 then ${server_id} else null end;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, days_since_first_telemetry_enabled, user_count, active_user_count, system_admins, first_telemetry_enabled_date, server_fact.last_telemetry_active_date]
  }

  measure: server_7days_w_active_users_count {
    group_label: " Server Counts >= 7 Days Old"
    label: "  Server >=7 Days Old w/ Active Users"
    description: "Use this for counting distinct Server ID's for servers that are >= 7 days old and have active users > 0 across dimensions."
    type: count_distinct
    sql: CASE WHEN datediff(day, ${server_fact.first_telemetry_active_date}, ${logging_date})  >= 7 AND ${active_user_count} > 0 THEN ${server_id} ELSE NULL END;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, days_since_first_telemetry_enabled, user_count, active_user_count, system_admins, first_telemetry_enabled_date, server_fact.last_telemetry_active_date]
  }

  measure: server_1days_w_active_users_count {
    group_label: " Server Counts"
    label: "Server >=1 Day Old w/ Active Users"
    description: "Use this for counting distinct Server ID's for servers that are >= 1 days old and have active users > 0 across dimensions."
    type: count_distinct
    sql: CASE WHEN datediff(day, ${server_fact.first_telemetry_active_date}, ${logging_date})  >= 1 AND ${active_user_count} > 0 THEN ${server_id} ELSE NULL END;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, days_since_first_telemetry_enabled, user_count, active_user_count, system_admins, first_telemetry_enabled_date, server_fact.last_telemetry_active_date]
  }

  measure: server_w_active_users_count {
    group_label: " Server Counts"
    label: " Server w/ Active Users"
    description: "Use this to count distinct TEDAS Server ID's with > 0 active users across dimensions. Servers w/ active users are automatically idenfitiable as Telemetry Enabled because the active user count is provided via telemetry."
    type: count_distinct
    sql: CASE WHEN ${active_user_count} > 0 THEN ${server_id} ELSE NULL END ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, days_since_first_telemetry_enabled, user_count, active_user_count, system_admins, first_telemetry_enabled_date, server_fact.last_telemetry_active_date]
  }

  measure: total_active_user_count {
    group_label: "User Counts"
    label: "Active Users"
    description: "Use this for summing active user counts across diemensions. This measure is used to calculate TEDAU (Telemetry-Enabled Daily Active Users) when aggregated at the daily level. It is the active user count logged via diagnostics.go."
    type: sum
    sql: ${active_user_count} ;;
  }

  measure: total_user_count {
    group_label: "User Counts"
    label: "Registered Users"
    description: "Use this for summing user counts across dimensions."
    type: sum
    sql: ${user_count} ;;
  }

  measure: servers_w_nps_count {
    group_label: " Server w/ NPS Data Counts"
    label: "Servers w/ NPS Submissions"
    description: "The count of the number of servers w/ NPS Score submissions from users associated with the server."
    type: count_distinct
    sql: CASE WHEN COALESCE(${nps_server_daily_score.nps_users},0) > 0 THEN ${server_id} ELSE NULL END ;;
    drill_fields: [logging_month, server_id, account_sfid, account.name, version, nps_server_daily_score.nps_score, nps_server_daily_score.nps_users, days_since_first_telemetry_enabled, user_count, active_user_count, system_admins, first_telemetry_enabled_date, server_fact.last_telemetry_active_date]
  }

  measure: servers_w_positive_nps_count {
    group_label: " Server w/ NPS Data Counts"
    label: "Servers w/ Positive NPS Scores"
    description: "The count of the number of servers w/ NPS Score submissions from users associated with the server."
    type: count_distinct
    sql: CASE WHEN COALESCE(${nps_server_daily_score.nps_users},0) > 0 AND COALESCE(${nps_server_daily_score.nps_score},0) > 0 THEN ${server_id} ELSE NULL END ;;
    drill_fields: [logging_month, server_id, account_sfid, account.name, version, nps_server_daily_score.nps_score, nps_server_daily_score.nps_users, days_since_first_telemetry_enabled, user_count, active_user_count, system_admins, first_telemetry_enabled_date, server_fact.last_telemetry_active_date]
  }

  measure: servers_w_positive_nps_active_users_count {
    group_label: " Server w/ NPS Data Counts"
    label: "Servers w/ Active Users & Positive NPS Scores"
    description: "The count of the number of servers w/ NPS Score submissions from users associated with the server and have active users on the given logging date."
    type: count_distinct
    sql: CASE WHEN COALESCE(${nps_server_daily_score.nps_users},0) > 0 AND COALESCE(${nps_server_daily_score.nps_score},0) > 0 AND ${active_user_count} > 0 THEN ${server_id} ELSE NULL END ;;
    drill_fields: [logging_month, server_id, account_sfid, account.name, version, nps_server_daily_score.nps_score, nps_server_daily_score.nps_users, days_since_first_telemetry_enabled, user_count, active_user_count, system_admins, first_telemetry_enabled_date, server_fact.last_telemetry_active_date]
  }

  measure: avg_posts_per_user_per_day {
    group_label: "Server Events"
    label: "Avg. Posts Per User"
    type: average
    sql: ${posts_per_user_per_day} ;;
    value_format_name: decimal_1
  }

  measure: posts_sum {
    group_label: "Server Events"
    label: "Posts"
    description: "The sum of all posts performed by all active user across all servers within the given grouping."
    type: sum
    sql: ${posts} ;;
    value_format_name: decimal_0
  }

  measure: events_sum {
    group_label: "Server Events"
    label: "Total Events"
    description: "The sum of all events performed by all active user across all servers within the given grouping."
    type: sum
    sql: ${events} ;;
    value_format_name: decimal_0
  }
}
