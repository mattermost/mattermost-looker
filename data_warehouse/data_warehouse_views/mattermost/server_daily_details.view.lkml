view: server_daily_details {
  sql_table_name: mattermost.server_daily_details ;;
  view_label: " Server Daily Details"

  # Filters
  dimension: latest_telemetry_record_2 {
    label: "  Latest Telemetry Record"
    description: "Indicates whether the record captures the last (most recent) date that Security (security_update_check.go) or diagnostics (diagnostics.go) telemetry was logged for the server."
    type: yesno
    sql: CASE WHEN ${logging_date} = ${server_fact.last_active_date} THEN TRUE ELSE FALSE END ;;
    group_label: "  Telemetry Flags"
    hidden: no

  }

  dimension: id {
    description: ""
    type: string
    sql: ${TABLE}.id ;;
    hidden: no
    primary_key: yes
  }

  dimension: last_day_of_month {
    type: yesno
    description: "Filters so the logging date is equal to the last Thursday of each month. Useful when grouping by month to report on server states in the given month."
    sql: CASE WHEN ${logging_date} =
                                      CASE WHEN DATE_TRUNC('month', ${logging_date}::date + interval '1 day') = DATE_TRUNC('month', CURRENT_DATE) THEN
                                        CASE WHEN DAYOFMONTH((SELECT MAX(date - INTERVAL '1 DAY') FROM mattermost.server_daily_details)) = 1
                                            THEN (SELECT MAX(date - INTERVAL '1 DAY') FROM mattermost.server_daily_details)
                                          WHEN DAYOFWEEK((SELECT MAX(date - INTERVAL '1 DAY') FROM mattermost.server_daily_details)) < 6
                                            AND DAYOFWEEK((SELECT MAX(date - INTERVAL '1 DAY') FROM mattermost.server_daily_details)) > 0
                                            THEN (SELECT MAX(date - INTERVAL '1 DAY') FROM mattermost.server_daily_details)
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

  dimension: mobile_client_usage {
    description: "Boolean value indicating >= 1 user associated with the server performed an event using the mobile client."
    type: yesno
    sql: CASE WHEN ${mobile_dau} > 0 THEN true ELSE false END ;;
    group_label: "Server Events"
  }

  dimension: last_day_of_week {
    type: yesno
    description: "Filters so the logging date is equal to the last Thursday of each week. Useful when grouping by month to report on server states in the given week."
    sql: CASE WHEN ${logging_date} =
          CASE WHEN DATE_TRUNC('week', ${logging_date}::date+interval '1 day') = DATE_TRUNC('week', CURRENT_DATE) THEN (SELECT MAX(date - INTERVAL '1 DAY') FROM mattermost.server_daily_details)
          ELSE DATEADD(WEEK, 1, DATE_TRUNC('week',${logging_date}::date)) - INTERVAL '4 DAY' END
          THEN TRUE ELSE FALSE END ;;
   group_label: "Last Day of Filters"
  }

  dimension: latest_telemetry_record {
    label: "  Latest Security Telemetry Record"
    description: "Boolean indicating the record captures the last (most recent) date that Security (security_update_check.go) telemetry was logged for the server."
    type: yesno
    sql: CASE WHEN ${logging_date} = ${server_fact.last_telemetry_active_date} THEN TRUE ELSE FALSE END ;;
    hidden: no
    group_label: "  Telemetry Flags"
  }

  dimension: first_telemetry_record {
    label: "  First Telemetry Record"
    description: "Boolean indicating the record is the first date that the server sent Diagnostics (diagnostics.go) or Security (security_update_chech.go) telemetry data."
    type: yesno
    sql: CASE WHEN ${logging_date} = ${server_fact.first_active_date} THEN TRUE ELSE FALSE END ;;
    hidden: no
    group_label: "  Telemetry Flags"
  }

  dimension: first_security_telemetry_record {
    label: "  First Security Telemetry Record"
    description: "Boolean indicating the record is the first date that the server sent Security (security_update_chech.go) telemetry data."
    type: yesno
    sql: CASE WHEN ${logging_date} = ${server_fact.first_telemetry_active_date} THEN TRUE ELSE FALSE END ;;
    hidden: no
    group_label: "  Telemetry Flags"
  }

  dimension: latest_segment_telemetry_record {
    label: "  Latest Diagnostics Telemetry Record"
    description: "Boolean indicating the record is the last (most recent) date that the server sent Diagnostics (diagnostics.go) telemetry data."
    type: yesno
    sql: CASE WHEN ${logging_date} = ${server_fact.last_mm2_telemetry_date} THEN TRUE ELSE FALSE END ;;
    hidden: no
    group_label: "  Telemetry Flags"
  }

  dimension: before_last_segment_telemetry_date {
    label: "  <= Last Diagnostics Telemetry Date"
    description: "Boleane indicating the record's logging date is on or before the last - most recent - date that the server sent Diagnostics (diagnostics.go) telemetry data."
    type: yesno
    sql: CASE WHEN ${logging_date} <= ${server_fact.last_mm2_telemetry_date} THEN TRUE ELSE FALSE END ;;
    hidden: no
    group_label: "  Telemetry Flags"
  }

  dimension: in_mattermost2_server {
    description: "Boolean indicating the server is in mattermost2.server (diagnostics.go) table data on the given logging date."
    label: "In Diagnostics Telemetry"
    group_label: "  Telemetry Flags"
    type: yesno
    sql: ${TABLE}.in_mm2_server ;;
  }

  dimension: is_telemetry_enabled {
    description: ""
    label: "In Security Telemetry"
    group_label: "  Telemetry Flags"
    hidden: yes
    sql: ${TABLE}.in_security ;;
    type: yesno
  }

  dimension: is_tracking_enabled {
    description: ""
    label: "Tracking Enabled"
    group_label: "  Telemetry Flags"
    hidden: yes
    sql: ${TABLE}.in_security OR ${TABLE}.in_mm2_server ;;
    type: yesno
  }

  dimension: trailing_3_releases {
    description: "Boolean indicating the server version is on the trailing 3 releases as it relates to the logging date."
    type: yesno
    sql: CASE WHEN ${version_release_dates.release_date}::DATE >= ${logging_date}::DATE - INTERVAL '119 days'
    AND ${version_release_dates.release_date}::DATE <= ${logging_date}::DATE THEN TRUE ELSE FALSE END ;;
    group_label: " Server Versions"
  }

  # Dimensions
  dimension: server_id {
    description: "The unique server ID for each telemetry-enabled active server."
    type: string
    sql: ${TABLE}.server_id ;;
  }

  dimension_group: logging {
    label: "   Logging"
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

  dimension: currently_licensed {
    group_label: " Status & Activity Filters"
    type: yesno
    description: "Indicates the server is currently associated with a paid license that is not expired."
    sql: CASE WHEN ${server_fact.paid_license_expire_date} >= CURRENT_DATE THEN TRUE ELSE FALSE END ;;
  }

  dimension: active_users_alltime {
    description: "The server has had >= 1 Active User during it's telemetry lifetime."
    group_label: " Status & Activity Filters"
    label: ">= 1 Active Users During Lifetime"
    type: yesno
    sql: CASE WHEN ${server_fact.max_active_user_count} > 0 THEN TRUE ELSE FALSE END ;;
  }

  dimension: active_users2_alltime {
    description: "The server has had >= 2 Active User during it's telemetry lifetime."
    group_label: " Status & Activity Filters"
    label: ">= 2 Active Users During Lifetime"
    type: yesno
    sql: CASE WHEN ${server_fact.max_active_user_count} > 1 THEN TRUE ELSE FALSE END ;;
  }

  dimension: in_security {
    label: "   In Security Telemetry"
    group_label: "  Telemetry Flags"
    description: "Boolean indicating the server appears in the events.security table data (security_update_check.go) on the given date."
    type: yesno
    sql: ${TABLE}.in_security ;;
  }
#
#   dimension: in_mattermost2_server {
#     label: "  In Diagnostics Telemetry"
#     description: "Is contained in the mattermost2.server table data on the given logging date."
#     group_label: "  Telemetry Flags"
#     type: yesno
#     sql: ${TABLE}.in_mm2_server ;;
#   }

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
    sql: ${TABLE}.has_multi_ips ;;
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
    group_label: " Security User Counts"
    description: "The count of active users that have visited the Mattermost site/application in the last 24 hours on the server."
    type: number
    sql: CASE WHEN COALESCE(${server_daily_details_ext.active_users_daily},0) >= COALESCE(${TABLE}.active_user_count,0) THEN COALESCE(${server_daily_details_ext.active_users_daily},0) ELSE COALESCE(${TABLE}.active_user_count,0) END ;;
  }

  dimension: active_user_count_band {
    label: "Active Users Band"
    group_label: " Security User Counts"
    description: "The count of active users that have visited the Mattermost site/application in the last 24 hours on the server."
    type: tier
    style: integer
    tiers: [1, 2, 4, 7, 11, 16, 21, 31, 41, 51, 76, 101, 151, 301, 501, 1001]
    sql: ${active_user_count} ;;
  }

  dimension: user_count {
    label: "Registered Users"
    group_label: " Security User Counts"
    description: "The count of all users registered/associated with the server."
    type: number
    sql: COALESCE(${TABLE}.user_count, ${server_daily_details_ext.registered_users}) ;;
  }

  dimension: user_count_band {
    label: "Registered Users Band"
    group_label: " Security User Counts"
    description: "The count of all users registered/associated with the server tiered into distinct ranges."
    type: tier
    style: integer
    tiers: [1, 2, 4, 7, 11, 16, 21, 31, 41, 51, 76, 101, 151, 301, 501, 1001]#[2, 5, 11, 16, 21, 31, 41, 51, 76, 101, 151, 301, 501, 1001]
    sql: ${user_count} ;;
  }

  dimension: latest_record {
    label: "  Latest Security Telemetry Record"
    group_label: "  Telemetry Flags"
    description: "Indicates whether the record captures the last (most recent) date that telemetry was logged for the server."
    type: yesno
    sql: CASE WHEN ${logging_date} = ${server_fact.last_telemetry_active_date} THEN TRUE ELSE FALSE END ;;
    hidden: no
  }

  dimension: tracking_disabled {
    label: " Telemetry Disabled"
    group_label: "  Telemetry Flags"
    description: "Boolean indicating the Server does not appear in Diagnostics or Server telemetry on the given logging date..True if server disabled telemetry, was deleted, or there was error/anomaly in the data collection pipeline."
    type: yesno
    sql: ${TABLE}.tracking_disabled ;;
    hidden: no
  }

  dimension: currently_sending_telemetry{
    label: "  Telemetry Currently Enabled"
    group_label: "  Telemetry Flags"
    description: "True when server has recently sent telemetry (w/in 5 days) and/or has a paid license w/ an expire date >= Current Date (this is an assumption that they're actively using the product, but are protected behind a firewall or airgap network). "
    type: yesno
    sql: CASE WHEN datediff(DAY, ${server_fact.first_active_date}, ${server_fact.last_active_date}) >= 7 AND ${server_fact.last_active_date} >= (SELECT MAX(last_active_date - interval '5 day') FROM mattermost.server_fact) THEN TRUE
              WHEN datediff(DAY, ${server_fact.first_active_date}, ${server_fact.last_active_date}) < 7 AND ${server_fact.last_active_date} = (SELECT MAX(last_active_date) FROM mattermost.server_fact) THEN TRUE
              WHEN ${server_fact.paid_license_expire_date} >= CURRENT_DATE THEN TRUE
              ELSE FALSE END ;;
    hidden: no
  }

  dimension: version {
    group_label: " Server Versions"
    label: "  Server Version (Current)"
    description: "The version of Mattermost the server was using on the given logging date (example: 5.9.0.5.9.8)"
    type: string
    sql: CASE WHEN regexp_substr(regexp_substr(${TABLE}.version,'[0-9]{0,}[.]{1}[0-9[{0,}[.]{1}[0-9]{0,}[.]{1}[0-9]{0,}[.]{1}[0-9]{0,}[.]{1}[0-9]{0,}[.]{1}[0-9]{0,}'), '[0-9]{0,}[.]{1}[0-9[{0,}[.]{1}[0-9]{0,}[.]{1}[0-9]{0,}$') IS NULL THEN
          regexp_substr(${TABLE}.version,'^[0-9]{0,}[.]{1}[0-9[{0,}[.]{1}[0-9]{0,}[.]{1}[0-9]{0,}')
          ELSE regexp_substr(regexp_substr(${TABLE}.version,'[0-9]{0,}[.]{1}[0-9[{0,}[.]{1}[0-9]{0,}[.]{1}[0-9]{0,}[.]{1}[0-9]{0,}[.]{1}[0-9]{0,}[.]{1}[0-9]{0,}'), '[0-9]{0,}[.]{1}[0-9[{0,}[.]{1}[0-9]{0,}[.]{1}[0-9]{0,}$') END;;
    order_by_field: server_version_major_sort
  }

  dimension: database_version {
    label: " Database Version"
    group_label: " Database Info."
    description: "The database version of Mattermost the server was using on the given logging date (example: 5.9.0.5.9.8)"
    type: string
    sql: regexp_replace(${TABLE}.database_version, '[a-zA-Z\+\:\~\'\\s\)\(\"\-]', '') ;;
    order_by_field: database_version_major_sort
  }

  dimension: database_version_major_sort {
    label: "  Database Version Sort"
    group_label: " Database Info."
    description: "The current database version, or if current telemetry is not available, the last recorded server version recorded for the server."
    type: number
    sql: (split_part(${database_version}, '.', 1) ||
          CASE WHEN length(split_part(${database_version}, '.', 2)) > 1 THEN
            CASE WHEN left(split_part(${database_version}, '.', 2), 2)::int >= 10 AND left(split_part(${database_version}, '.', 2), 2)::int < 20 THEN '99'
                WHEN left(split_part(${database_version}, '.', 2), 2)::int >= 20 THEN left(split_part(${database_version}, '.', 2), 1) || '1'
                WHEN left(split_part(${database_version}, '.', 2), 1)::int = 0 THEN left(split_part(${database_version}, '.', 2), 1) || '0'
                ELSE NULL END
              WHEN length(split_part(${database_version}, '.', 2))::int = 1 THEN trim(left(split_part(${database_version}, '.', 2), 2)) || '0' END)::int ;;
    hidden: yes
  }

  dimension: database_version_major {
    label: " Database Version (Major)"
    group_label: " Database Info."
    description: "The database version the server uses to host Mattermost w/ the dot release removed."
    type: string
    sql: split_part(${database_version}, '.', 1) || '.' || left(split_part(${database_version}, '.', 2), 2) ;;
    order_by_field: database_version_major_sort
  }

  dimension: database_version_major_release {
    label: " Database Version (Major Release)"
    group_label: " Database Info."
    description: "The core database version the server uses to host Mattermost w/out any trailing releases."
    type: number
    sql: split_part(${database_version}, '.', 1)::int ;;
  }

  dimension: server_version_major {
    group_label: " Server Versions"
    label: "  Server Version: Major (Current)"
    description: "The server version associated with the Mattermost server on the given logging date - omitting the trailing dot release."
    type: string
    sql: split_part(${version}, '.', 1) || '.' || split_part(${version}, '.', 2)  ;;
    order_by_field: server_version_major_sort
  }

  dimension: server_version_major_int {
    group_label: " Server Versions"
    label: "  Server Version: Major (Current - Integer)"
    description: "The server version associated with the Mattermost server on the given logging date - omitting the trailing dot release."
    type: number
    sql: (split_part(${version}, '.', 1) || '.' || split_part(${version}, '.', 2))::float  ;;
    order_by_field: server_version_major_sort
  }

  dimension: server_version_major_sort {
    group_label: " Server Versions"
    label: "  Server Version: Major (Current)"
    description: "The current server version, or if current telemetry is not available, the last recorded server version recorded for the server."
    type: number
    sql: (split_part(${version}, '.', 1) ||
          CASE WHEN split_part(${version}, '.', 2) = '10' THEN '99'
            ELSE split_part(${version}, '.', 2) || '0' END)::int ;;
    hidden: yes
  }

  dimension: db_type {
    label: "Database Type"
    group_label: " Database Info."
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

  dimension: gitlab_install {
    label: "  Gitlab Install"
    description: "Boolean indicating the server's OAuth enable gitlab flag = True on the date of server activation (first logged diagnostics activity date)."
    type: yesno
    sql: ${server_fact.gitlab_install} ;;
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
    sql: ${server_fact.account_sfid} ;;
  }

  dimension: license_id {
    label: "License ID"
    description: "The Mattermost Customer License ID associated with the server (null if no license found)."
    group_label: "License Info."
    type: string
    sql: ${license_server_fact.license_id} ;;
    hidden: no
  }

  dimension: license_id2 {
    label: "License ID"
    description: "The Mattermost Customer License ID associated with the server (null if no license found)."
    group_label: "License Info."
    type: string
    sql: ${server_fact.license_id} ;;
    hidden: yes
  }

  dimension: license_email {
    label: "License Email"
    description: "The email associated with the license provisioned to the Mattermost server."
    group_label: "License Info."
    type: string
    sql: ${license_server_fact.license_email} ;;
    hidden: yes
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
    sql: ${license_server_fact.contact_sfid} ;;
    hidden: yes
  }

  dimension: license_status {
    label: "Licensed Server"
    description: "Indicates whether the server is registered/paired with a licensed customer (If yes then licensed, else unlicensed)."
    group_label: "License Info."
    type: yesno
    sql: case when ${license_id} is not null and ${license_at_logging} then true else false end ;;
  }

  dimension: edition2 {
    label: " Edition (w/ License SKU)"
    description: "Indicates whether the server is registered/paired with a licensed customer (If yes then licensed, else unlicensed)."
    group_label: "License Info."
    type: string
    sql: COALESCE(${license_current.edition}, ${edition}) ;;
  }

  dimension: license_at_logging {
    label: "License At Logging"
    description: "Indicates the license was the current & actively associated with the server during the logging date period in question."
    view_label: "License Fact"
    type: yesno
    sql: case when ${logging_date}::date between ${license_server_fact.start_date} AND ${license_server_fact.license_retired_date}::date THEN TRUE ELSE FALSE END;;
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
    label: "Days First to Last Telemetry Enabled"
    description: "Displays the age in days of the server. Age is calculated as days between the first active date (first date telemetry enabled) and logging date of the record."
    type: number
    sql: datediff(day, COALESCE(${server_fact.first_active_date},${server_fact.first_telemetry_active_date}, ${nps_server_daily_score.server_install_date}), ${logging_date}) ;;
  }

  dimension: days_since_first_telemetry_enabled_band {
    label: "Days First-to-Last Telemetry Band"
    description: "Displays the age in days of the server bucketed into groupings. Age is calculated as days between the first active date (first date telemetry enabled) and logging date of the record."
    type: tier
    style: integer
    tiers: [1,7,31,61,91,181,366,731]
    sql: ${days_since_first_telemetry_enabled} ;;
  }

  dimension: days_since_first_telemetry_to_now {
    label: "Days Since First Telemetry Enabled"
    description: "Displays the age in days of the server. Age is calculated as days between the first active date (first date telemetry enabled) and the current date - 1 day."
    type: number
    sql: datediff(day, COALESCE(${server_fact.first_active_date},${server_fact.first_telemetry_active_date}, ${nps_server_daily_score.server_install_date})::DATE, CURRENT_DATE - INTERVAL '1 DAY') ;;
  }

  dimension: days_since_first_telemetry_to_now_band {
    label: "Days Since First Telemetry Band"
    description: "Displays the age in days of the server bucketed into groupings. Age is calculated as days between the first active date (first date telemetry enabled) and logging date of the record."
    type: tier
    style: integer
    tiers: [1,7,31,61,91,181,366,731]
    sql: ${days_since_first_telemetry_to_now} ;;
  }

  dimension_group: first_security_telemetry {
    label: " First Security Telemetry"
    description: "The date the server first recorded security telemetry data in the security diagnostics data (logged via security_update_check.go)."
    type: time
    timeframes: [date, week, month, year, fiscal_quarter, fiscal_year]
    sql: ${server_fact.first_telemetry_active_date}::date ;;
  }

  dimension_group: last_security_telemetry {
    label: "Last Security Telemetry"
    description: "The date the server last recorded security telemetry data in the security diagnostics data."
    type: time
    timeframes: [date, week, month, year, fiscal_quarter, fiscal_year]
    sql: ${server_fact.last_telemetry_active_date}::date ;;
  }

  dimension_group: last_mm2_telemetry {
    label: "Last Diagnostics Telemetry"
    description: "The date the server last recorded diagnostics telemetry (logged via diagnostics.go)."
    type: time
    timeframes: [date, week, month, year, fiscal_quarter, fiscal_year]
    sql: ${server_fact.last_mm2_telemetry_date} ;;
  }

  dimension_group: first_mm2_telemetry {
    label: " First Diagnostics Telemetry"
    description: "The date the server first recorded diagnostics telemetry (logged via diagnostics.go)."
    type: time
    timeframes: [date, week, month, year, fiscal_quarter, fiscal_year]
    sql: ${server_fact.first_mm2_telemetry_date} ;;
  }

  dimension: days_from_first_telemetry_to_paid_license {
    label: "Days to Paid License"
    description: "The number of days between the servers first telemetry date and it's first paid license issue date."
    type: number
    sql: --CASE WHEN datediff(day, COALESCE(${server_fact.first_active_date}, ${nps_server_daily_score.server_install_date}), ${server_fact.first_paid_license_date}) < 0 THEN 0 ELSE
    datediff(day, COALESCE(${server_fact.first_active_date}, ${nps_server_daily_score.server_install_date}), ${server_fact.first_paid_license_date})
    --END
    ;;
  }

  dimension: customer_days_to_paid_license {
    label: "Days to Paid License (Customer)"
    description: "The number of days between the customer associated with the server's first server's telemetry and the customer's first paid license issue date."
    type: number
    sql: --CASE WHEN datediff(day, COALESCE(${server_fact.first_active_date}, ${nps_server_daily_score.server_install_date}), ${server_fact.first_paid_license_date}) < 0 THEN 0 ELSE
          datediff(day, COALESCE(${server_fact.customer_first_active_date}::date, ${nps_server_daily_score.server_install_date}::date), ${server_fact.customer_first_paid_license_date}::date)
          --END
          ;;
  }

  dimension_group: customer_first_paid_license_issued {
    label: "Customer First Paid License Issued"
    description: "The number of days between the customer associated with the server's first server's telemetry and the customer's first paid license issue date."
    type: time
    timeframes: [date, week, month, year, fiscal_quarter, fiscal_year]
    sql: ${server_fact.customer_first_paid_license_date}::date ;;
  }

  measure: median_days_active_to_paid {
    type: number
    sql: median(CASE WHEN ${server_fact.first_paid_license_date} >= ${server_fact.first_active_date} then ${days_from_first_telemetry_to_paid_license} else null end) ;;
  }

  measure: avg_days_active_to_paid {
    type: number
    sql: avg(CASE WHEN ${server_fact.first_paid_license_date} >= ${server_fact.first_active_date} then ${days_from_first_telemetry_to_paid_license} else null end) ;;
  }

  measure: min_days_active_to_paid {
    type: number
    sql: min(${days_from_first_telemetry_to_paid_license}) ;;
  }

  dimension: days_trial_to_paid {
    label: "Days From Trial to Paid License"
    type: number
    sql: CASE WHEN DATEDIFF(DAY, ${server_fact.first_trial_license_date}, ${server_fact.first_paid_license_date}) <0 THEN 0 ELSE DATEDIFF(DAY, ${server_fact.first_trial_license_date}, ${server_fact.first_paid_license_date}) END ;;
  }

  measure: median_days_trial_to_paid {
    type: number
    sql: median(${days_trial_to_paid}) ;;
  }

  dimension: days_from_first_telemetry_to_paid_license_band {
    label: "Days to Paid License Band"
    description: "The number of days between the servers first telemetry date and it's first date recording an association with a paid license key."
    type: tier
    style: integer
    tiers: [0,7,31,61,91,181,366,731]
    sql: ${days_from_first_telemetry_to_paid_license} ;;
  }

  dimension: customer_days_from_first_telemetry_to_paid_license_band {
    label: "Days to Paid License Band (Customer)"
    description: "The number of days between the servers first telemetry date and it's first date recording an association with a paid license key."
    type: tier
    style: integer
    tiers: [0,7,31,61,91,181,366,731]
    sql: ${customer_days_to_paid_license} ;;
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
    sql: ${server_fact.company_name} ;;
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

  dimension: posts2 {
    group_label: "Server-Level User Events"
    label: "Posts"
    description: "The number of post events by active users associated with the server on the given logging."
    type: number
    value_format_name: decimal_0
    sql: ${server_events_by_date.post_events} ;;
  }

  dimension: posts_per_user_per_day {
    group_label: "Server-Level User Events"
    label: "Posts Per User"
    description: "The number of posts per active user for the server on the given logging."
    type: number
    value_format_name: decimal_1
    sql: ${server_events_by_date.post_events}::FLOAT/NULLIF(${server_events_by_date.users}::float,0) ;;
  }

  dimension: posts_per_user_per_day_band {
    group_label: "Server-Level User Events"
    label: "Posts Per User Band"
    description: "The number of posts per active user for the server on the given logging."
    type: tier
    style: integer
    tiers: [3, 6, 11, 16, 21, 31, 51, 101]
    sql: ${posts_per_user_per_day} ;;
  }

  dimension: mau {
    group_label: "Server-Level User Events"
    label: "Monthly Active Users"
    description: "The number of monthly active users associated with the server on the given logging date (derived from mattermost2.events - User Events)."
    type: number
    sql: ${server_events_by_date.mau_total} ;;
  }

  dimension: dau {
    group_label: "Server-Level User Events"
    label: "Daily Active Users"
    description: "The number of daily active users associated with the server on the given logging date (derived from mattermost2.events - User Events)."
    type: number
    sql: ${server_events_by_date.dau_total} ;;
  }

  dimension: mobile_dau {
    group_label: "Server-Level User Events"
    label: "Mobile DAU"
    description: "The number of mobile daily active users associated with the server on the given logging date (derived from mattermost2.events - User Events)."
    type: number
    sql: ${server_events_by_date.mobile_dau} ;;
  }


  # Measures
  measure: server_count {
    label: "   Server Count"
    group_label: " Server Counts"
    description: "Use this for counting all distinct Server ID's across dimensions. This measure is a composite of TEDAS servers and additional data sources that logged the server on the given logging date."
    type: count_distinct
    sql: ${server_id} ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, days_since_first_telemetry_enabled, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date, first_security_telemetry_date, last_security_telemetry_date]
  }

  measure: customer_count {
    label: "Customer Count"
    type: count_distinct
    sql: coalesce(${account_sfid}, lower(${server_fact.company_name})) ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, server_fact.first_paid_license_date, customer_first_paid_license_issued_date, server_fact.first_active_date, server_fact.customer_first_active_date, server_fact.paid_license_expire_date]
  }

  measure: servers_w_mobile_usage {
    label: "  Server Count (>= 1 Mobile User)"
    type:  count_distinct
    sql: case when ${mobile_dau} > 0 then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, days_since_first_telemetry_enabled, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date, first_security_telemetry_date, last_security_telemetry_date]
  }

  measure: server_count_ttr {
    label: "   Server Count (Trailing 3 Releases)"
    group_label: " Server Counts"
    description: "Use this for counting all distinct Server ID's on the latest 3 version releases across dimensions. This measure is a composite of TEDAS servers and additional data sources that logged the server on the given logging date."
    type: count_distinct
    sql: CASE WHEN ${version_release_dates.release_date}::DATE >= ${logging_date}::DATE - INTERVAL '119 days'
    AND ${version_release_dates.release_date}::DATE <= ${logging_date}::DATE THEN ${server_id} ELSE NULL END ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, days_since_first_telemetry_enabled, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date, first_security_telemetry_date, last_security_telemetry_date]
  }

  measure: license_count {
    label: "   License Count"
    type: count_distinct
    sql: ${license_id} ;;
  }

  measure: servers_w_trials {
    label: "   Trial Licensed Servers"
    group_label: " Server Counts"
    description: "Use this for counting all distinct Trial Server ID's across dimensions. This provides a count of all currently trial licensed servers on the given logging date."
    type: count_distinct
    sql: CASE WHEN ${license_server_fact.trial} THEN ${server_id} ELSE NULL END ;;
    drill_fields: [server_id, account_sfid, account.name, account.arr_current, server_fact.first_active_telemetry_date, server_fact.first_trial_license_date, server_fact.first_paid_license_date]
  }

  measure: trial_paid_conversion_server_count {
    label: "   Servers Converted from Trial to Paid"
    group_label: " Server Counts"
    description: "Use this for counting all distinct Server ID's that converted from a trial license to a paid license across dimensions. This provides a count of all trial licensed servers on the given logging date that have since converted to paid licensed servers."
    type: count_distinct
    sql: CASE WHEN ${license_current.trial} and ${server_fact.first_trial_license_date} <= ${server_fact.first_paid_license_date} THEN ${server_id} ELSE NULL END ;;
    drill_fields: [server_id, account_sfid, account.name, account.arr_current, server_fact.first_active_telemetry_date, server_fact.first_trial_license_date, server_fact.first_paid_license_date]
  }

  measure: tedas_server_count {
    group_label: " Server Counts"
    label: "   TEDAS Count"
    description: "Use to trend the count of distinct TEDAS Servers across grouped dimensions. This measure is prefiltered to only count TEDAS. Use to track TEDAS (Telemetry-Enabled Daily Active Servers) when grouped by logging dates."
    type: count_distinct
    sql: CASE WHEN ${in_security} THEN ${server_id} ELSE NULL END ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, days_since_first_telemetry_enabled, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date, first_security_telemetry_date, last_security_telemetry_date]
  }

  measure: new_tedas_server_count {
    group_label: " Server Counts"
    label: "  New TEDAS Count"
    description: "Use this to trend the count of new, distinct TEDAS Servers by logging date."
    type: count_distinct
    sql: CASE WHEN ${in_security} AND ${logging_date} = ${first_security_telemetry_date} THEN ${server_id} ELSE NULL END ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, days_since_first_telemetry_enabled, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date, first_security_telemetry_date, last_security_telemetry_date]
  }

  measure: server_7days_count {
    group_label: " Server Counts"
    label: "  Servers >= 7 Days Old"
    description: "Use this for counting distinct Server ID's for servers that are >= 7 days old across dimensions."
    type: count_distinct
    sql: CASE WHEN ${days_since_first_telemetry_enabled}  >= 7 then ${server_id} else null end;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, days_since_first_telemetry_enabled, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date, first_security_telemetry_date, last_security_telemetry_date]
  }

  measure: server_7days_converted_to_paid_count {
    group_label: " Server Paid Conversion Counts"
    label: "Servers >= 7 Days Old & Converted to Paid < 7 Days"
    description: "Use this for counting distinct Server ID's for servers that are >= 7 days old and converted to paid, licensed customers across dimensions."
    type: count_distinct
    sql: CASE WHEN ${days_since_first_telemetry_enabled}  >= 7 AND ${days_from_first_telemetry_to_paid_license} between 0 and 6 /*and ${active_user_count}>0*/ then ${server_id} else null end;;
    drill_fields: [server_id, account_sfid, account.name, server_fact.server_version,  days_from_first_telemetry_to_paid_license, server_fact.first_paid_license_date, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: server_7days_converted_count {
    group_label: " Server Paid Conversion Counts"
    label: "Servers >= 7 Days Old & Converted to Paid >= 7 Days"
    description: "Use this for counting distinct Server ID's for servers that are >= 7 days old and that converted to a paid SKU in >= 7 days since their first telemetry date across dimensions."
    type: count_distinct
    sql: CASE WHEN ${days_since_first_telemetry_enabled}  >= 7 AND ${days_from_first_telemetry_to_paid_license} >= 7  /*and ${active_user_count}>0*/ then ${server_id} else null end;;
    drill_fields: [server_id, account_sfid, account.name, server_fact.server_version, days_from_first_telemetry_to_paid_license, server_fact.first_paid_license_date, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: server_7days_did_not_convert_count {
    group_label: " Server Paid Conversion Counts"
    label: "Servers >= 7 Days Old & Not Converted to Paid"
    description: "Use this for counting distinct Server ID's for servers that are >= 7 days old and that either: converted to a paid SKU in >= 7 days since their first telemetry date or did not converted to paid across dimensions."
    type: count_distinct
    sql: CASE WHEN ${days_since_first_telemetry_enabled}  >= 7 AND (${days_from_first_telemetry_to_paid_license} IS NULL)  /*and ${active_user_count}>0*/ then ${server_id} else null end;;
    drill_fields: [server_id, account_sfid, account.name, server_fact.server_version, days_from_first_telemetry_to_paid_license, server_fact.first_paid_license_date, server_fact.first_active_date, server_fact.last_active_date]
  }

  measure: server_1days_count {
    group_label: " Server Counts"
    label: "Servers >=1 Day Old"
    description: "Use this for counting distinct Server ID's for servers that are >= 1 days old across dimensions."
    type: count_distinct
    sql: CASE WHEN ${days_since_first_telemetry_enabled}  >= 1 then ${server_id} else null end;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, days_since_first_telemetry_enabled, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date, first_security_telemetry_date, last_security_telemetry_date]
  }

  measure: server_7days_w_active_users_count {
    group_label: " Server Counts"
    label: "  Servers >=7 Days Old w/ Active Users"
    description: "Use this for counting distinct Server ID's for servers that are >= 7 days old and have active users > 0 across dimensions."
    type: count_distinct
    sql: CASE WHEN ${days_since_first_telemetry_enabled}  >= 7 AND
          CASE WHEN COALESCE(${server_daily_details_ext.active_users_daily},0) >= COALESCE(${active_user_count},0) THEN COALESCE(${server_daily_details_ext.active_users_daily},0) ELSE COALESCE(${active_user_count},0) END > 0
          THEN ${server_id} ELSE NULL END;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, days_since_first_telemetry_enabled, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date, first_security_telemetry_date, last_security_telemetry_date]
  }

  measure: server_30days_w_active_users_count {
    group_label: " Server Counts"
    label: "  Servers >=4 Weeks Old w/ Active Users"
    description: "Use this for counting distinct Server ID's for servers that are >= 30 days old and have active users > 0 across dimensions."
    type: count_distinct
    sql: CASE WHEN ${days_since_first_telemetry_enabled}  >= 30 AND ${active_user_count} > 0 THEN ${server_id} ELSE NULL END;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, days_since_first_telemetry_enabled, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date, first_security_telemetry_date, last_security_telemetry_date]
  }

  measure: server_30days_count {
    group_label: " Server Counts"
    label: "  Servers >=4 Weeks Old"
    description: "Use this for counting distinct Server ID's for servers that are >= 60 days old across dimensions."
    type: count_distinct
    sql: CASE WHEN ${days_since_first_telemetry_enabled}  >= 30 THEN ${server_id} ELSE NULL END;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, days_since_first_telemetry_enabled, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date, first_security_telemetry_date, last_security_telemetry_date]
  }

  measure: server_60days_w_active_users_count {
    group_label: " Server Counts"
    label: "  Servers >=8 Weeks Old w/ Active Users"
    description: "Use this for counting distinct Server ID's for servers that are >= 60 days old and have active users > 0 across dimensions."
    type: count_distinct
    sql: CASE WHEN ${days_since_first_telemetry_enabled}  >= 60 AND
          CASE WHEN COALESCE(${server_daily_details_ext.active_users_daily},0) >= COALESCE(${active_user_count},0) THEN COALESCE(${server_daily_details_ext.active_users_daily},0) ELSE COALESCE(${active_user_count},0) END > 0
          THEN ${server_id} ELSE NULL END;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, days_since_first_telemetry_enabled, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date, first_security_telemetry_date, last_security_telemetry_date]
  }

  measure: server_60days_count {
    group_label: " Server Counts"
    label: "  Servers >=8 Weeks Old"
    description: "Use this for counting distinct Server ID's for servers that are >= 60 days old across dimensions."
    type: count_distinct
    sql: CASE WHEN ${days_since_first_telemetry_enabled}  >= 60 THEN ${server_id} ELSE NULL END;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, days_since_first_telemetry_enabled, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date, first_security_telemetry_date, last_security_telemetry_date]
  }

  measure: server_1days_w_active_users_count {
    group_label: " Server Counts"
    label: "Servers >=1 Day Old w/ Active Users"
    description: "Use this for counting distinct Server ID's for servers that are >= 1 days old and have active users > 0 across dimensions."
    type: count_distinct
    sql: CASE WHEN ${days_since_first_telemetry_enabled}  >= 1 AND
          CASE WHEN COALESCE(${server_daily_details_ext.active_users_daily},0) >= COALESCE(${active_user_count},0) THEN COALESCE(${server_daily_details_ext.active_users_daily},0) ELSE COALESCE(${active_user_count},0) END > 0
          THEN ${server_id} ELSE NULL END;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, days_since_first_telemetry_enabled, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date, first_security_telemetry_date, last_security_telemetry_date]
  }

  measure: server_w_active_users_count {
    group_label: " Server Counts"
    label: " Servers w/ Active Users"
    description: "Use this to count distinct TEDAS Server ID's with > 0 active users across dimensions. Servers w/ active users are automatically idenfitiable as Telemetry Enabled because the active user count is provided via telemetry."
    type: count_distinct
    sql: CASE WHEN
          CASE WHEN COALESCE(${server_daily_details_ext.active_users_daily},0) >= COALESCE(${active_user_count},0) THEN COALESCE(${server_daily_details_ext.active_users_daily},0) ELSE COALESCE(${active_user_count},0) END > 0
          THEN ${server_id} ELSE NULL END;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, days_since_first_telemetry_enabled, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date, first_security_telemetry_date, last_security_telemetry_date]
  }

  measure: total_active_user_count {
    group_label: "User Counts"
    label: "Active Users"
    description: "Use this for summing active user counts across diemensions. This measure is used to calculate TEDAU (Telemetry-Enabled Daily Active Users) when aggregated at the daily level and filtered for servers in security telemetry. It is the active user count logged via security_update_check.go."
    type: sum
    sql: ${active_user_count} ;;
  }

  measure: max_active_user_count {
    group_label: "User Counts"
    label: "Max. Active Users"
    description: "Use this to display the maximum active user counts across selected (grouped) diemensions."
    type: max
    sql: ${active_user_count} ;;
  }

  measure: total_user_count {
    group_label: "User Counts"
    label: "Registered Users"
    description: "Use this for summing user counts across dimensions."
    type: sum
    sql: ${user_count} ;;
  }

  measure: max_user_count {
    group_label: "User Counts"
    label: "Max. Registered Users"
    description: "Use this to display the max registered user counts for all servers across the selected (grouping) dimensions."
    type: max
    sql: ${user_count} ;;
  }

  measure: servers_w_nps_count {
    group_label: " Server w/ NPS Data Counts"
    label: "Servers w/ NPS Submissions"
    description: "The count of the number of servers w/ NPS Score submissions from users associated with the server."
    type: count_distinct
    sql: CASE WHEN COALESCE(${nps_server_daily_score.nps_users},0) > 0 THEN ${server_id} ELSE NULL END ;;
    drill_fields: [logging_month, server_id, account_sfid, account.name, version, nps_server_daily_score.nps_score, nps_server_daily_score.nps_users, days_since_first_telemetry_enabled, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date, first_security_telemetry_date, last_security_telemetry_date]
  }

  measure: servers_w_positive_nps_count {
    group_label: " Server w/ NPS Data Counts"
    label: "Servers w/ Positive NPS Scores"
    description: "The count of the number of servers w/ NPS Score submissions from users associated with the server."
    type: count_distinct
    sql: CASE WHEN COALESCE(${nps_server_daily_score.nps_users},0) > 0 AND COALESCE(${nps_server_daily_score.nps_score},0) > 0 THEN ${server_id} ELSE NULL END ;;
    drill_fields: [logging_month, server_id, account_sfid, account.name, version, nps_server_daily_score.nps_score, nps_server_daily_score.nps_users, days_since_first_telemetry_enabled, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date, first_security_telemetry_date, last_security_telemetry_date]
  }

  measure: servers_w_positive_nps_active_users_count {
    group_label: " Server w/ NPS Data Counts"
    label: "Servers w/ Active Users & Positive NPS Scores"
    description: "The count of the number of servers w/ NPS Score submissions from users associated with the server and have active users on the given logging date."
    type: count_distinct
    sql: CASE WHEN COALESCE(${nps_server_daily_score.nps_users},0) > 0 AND COALESCE(${nps_server_daily_score.nps_score},0) > 0 AND
          CASE WHEN COALESCE(${server_daily_details_ext.active_users_daily},0) >= COALESCE(${active_user_count},0) THEN COALESCE(${server_daily_details_ext.active_users_daily},0) ELSE COALESCE(${active_user_count},0) END > 0
          THEN ${server_id} ELSE NULL END;;
    drill_fields: [logging_month, server_id, account_sfid, account.name, version, nps_server_daily_score.nps_score, nps_server_daily_score.nps_users, days_since_first_telemetry_enabled, user_count, active_user_count, system_admins, server_fact.first_active_date, server_fact.last_active_date, first_security_telemetry_date, last_security_telemetry_date]
  }

  measure: avg_posts_per_user_per_day {
    group_label: "Server Events"
    label: "Avg. Posts Per User"
    type: average
    sql: ${posts_per_user_per_day} ;;
    value_format_name: decimal_1
  }

  measure: median_posts_per_user_per_day {
    group_label: "Server Events"
    label: "Median Posts Per User"
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
