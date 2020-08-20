# This is the view file for the analytics.mattermost.server_daily_details_ext table.
view: server_daily_details_ext {
  sql_table_name: mattermost.server_daily_details_ext ;;
  view_label: " Server Daily Details Ext"

  # Drill Field Sets
  set: server_fact {
    fields: [server_id, server_fact.server_version_major, server_fact.first_active_date, server_fact.last_active_date, account_sfid, account_name, company_name, paid_license_expire_date, max_active_user_count]
  }

  dimension: max_active_user_count {
    type: number
    sql: ${server_fact.max_active_user_count}  ;;
    hidden: yes
  }

  dimension: paid_license_expire_date {
    type: date
    sql: ${server_fact.paid_license_expire_date}  ;;
    hidden: yes
  }

  # FILTERS
dimension: last_day_of_month {
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

  dimension: last_day_of_week {
    type: yesno
    description: "Filters so the logging date is equal to the last Thursday of each week. Useful when grouping by month to report on server states in the given week."
    sql: CASE WHEN ${logging_date} =
    CASE WHEN DATE_TRUNC('week', ${logging_date}::date+interval '1 day') = DATE_TRUNC('week', CURRENT_DATE) THEN (SELECT MAX(date) FROM mattermost.server_daily_details)
    ELSE DATEADD(WEEK, 1, DATE_TRUNC('week',${logging_date}::date)) - INTERVAL '4 DAY' END
    THEN TRUE ELSE FALSE END ;;
  }

  dimension: latest_telemetry_record {
    label: "  Latest Security Telemetry Record"
    group_label: "  Telemetry Flags"
    description: "Indicates whether the record captures the last (most recent) date that Security (security_update_check.go) diagnostics telemetry was logged for the server."
    type: yesno
    sql: CASE WHEN ${logging_date} = ${server_fact.last_telemetry_active_date} THEN TRUE ELSE FALSE END ;;
    hidden: no
  }

  dimension: latest_telemetry_record_2 {
    label: "  Latest Telemetry Record"
    group_label: "  Telemetry Flags"
    description: "Boolean indicating the record is the last (most recent) date that the server sent Diagnostics (diagnostics.go) or Security (security_update_chech.go) telemetry data."
    type: yesno
    sql: CASE WHEN ${logging_date} = ${server_fact.last_active_date} THEN TRUE ELSE FALSE END ;;
    hidden: yes
  }

  dimension: latest_segment_telemetry_record {
    label: "  Latest Diagnostics Telemetry Record"
    group_label: "  Telemetry Flags"
    description: "Boolean indicating the record is the last (most recent) date that Diagnostics (diagnostics.go) telemetry data was logged for the server."
    type: yesno
    sql: CASE WHEN ${logging_date} = ${server_fact.last_mm2_telemetry_date} THEN TRUE ELSE FALSE END ;;
    hidden: no
  }

  dimension: before_last_segment_telemetry_date {
    label: "  <= Last Activity Date"
    group_label: "  Telemetry Flags"
    description: "Indicates whether the record's logging date is before the server's last (most recent) date that Diagnostics (diagnostics.go) telemetry data was logged for the server."
    type: yesno
    sql: CASE WHEN ${logging_date} <= ${server_fact.last_mm2_telemetry_date} THEN TRUE ELSE FALSE END ;;
    hidden: no
  }

  dimension: is_telemetry_enabled {
    label: "In Security Diagnostics"
    group_label: "  Telemetry Flags"
    description: "Boolean indicating the server appears in the events.security table data (security_update_check.go) on the given date."
    type: yesno
    sql: ${TABLE}.in_security ;;
    hidden: yes
  }

  dimension: is_tracking_enabled {
    label: "In Security or Diagnostics Telemetry"
    group_label: "  Telemetry Flags"
    description: "Boolean indicating the server appears (is sending us telemetry) in the events.security (security_update_check.go) or mattermost2.server (diagnostics.go) table data on the given date."
    type: yesno
    sql: CASE WHEN ${TABLE}.in_security OR ${in_mm2_server} THEN TRUE ELSE FALSE END ;;
    hidden: yes
  }

  dimension: in_mattermost2_server {
    description: "Boolean indicating the server is in mattermost2.server (diagnostics.go) table data on the given logging date."
    label: "In Diagnostics Telemetry"
    group_label: "  Telemetry Flags"
    type: yesno
    sql: ${TABLE}.in_mm2_server ;;
    hidden: yes
  }

  dimension: first_telemetry_record {
    label: "  First Telemetry Record"
    group_label: "  Telemetry Flags"
    description: "Boolean indicating the record is the first date that the server sent Diagnostics (diagnostics.go) or Security (security_update_chech.go) telemetry data."
    type: yesno
    sql: CASE WHEN ${logging_date} = ${server_fact.first_active_date} THEN TRUE ELSE FALSE END ;;
    hidden: no
  }

  dimension: first_security_telemetry_record {
    label: "  First Security Telemetry Record"
    group_label: "  Telemetry Flags"
    description: "Boolean indicating the record is the first date that the server sent Security (security_update_chech.go) telemetry data."
    type: yesno
    sql: CASE WHEN ${logging_date} = ${server_fact.first_telemetry_active_date} THEN TRUE ELSE FALSE END ;;
    hidden: no
  }

  dimension: first_diagnostics_telemetry_record {
    label: "  First Diagnostics Telemetry Record"
    group_label: "  Telemetry Flags"
    description: "Boolean indicating the record is the first date that the server sent Diagnostics (diagnostics.go) telemetry data."
    type: yesno
    sql: CASE WHEN ${logging_date} = ${server_fact.first_mm2_telemetry_date}::date THEN TRUE ELSE FALSE END ;;
    hidden: no
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

  # DIMENSIONS
  dimension: server_id {
    label: " Server Id"
    description: ""
    type: string
    sql: ${TABLE}.server_id ;;
    hidden: no
  }

  dimension: ip_address {
    label: " Ip Address"
    description: "Ths IP Address associated with the Mattermost Server on the given date."
    type: string
    sql: ${TABLE}.ip_address ;;
    hidden: no
  }

  dimension: location {
    label: " Location"
    description: ""
    type: string
    sql: ${TABLE}.location ;;
    hidden: no
  }

  dimension: version {
    group_label: " Server Versions"
    label: " Server Version (Current)"
    description: "The version of the Mattermost server."
    type: string
    sql: CASE WHEN regexp_substr(regexp_substr(${TABLE}.version,'[0-9]{0,}[.]{1}[0-9[{0,}[.]{1}[0-9]{0,}[.]{1}[0-9]{0,}[.]{1}[0-9]{0,}[.]{1}[0-9]{0,}[.]{1}[0-9]{0,}'), '[0-9]{0,}[.]{1}[0-9[{0,}[.]{1}[0-9]{0,}[.]{1}[0-9]{0,}$') IS NULL THEN
    regexp_substr(${TABLE}.version,'^[0-9]{0,}[.]{1}[0-9[{0,}[.]{1}[0-9]{0,}[.]{1}[0-9]{0,}')
    ELSE regexp_substr(regexp_substr(${TABLE}.version,'[0-9]{0,}[.]{1}[0-9[{0,}[.]{1}[0-9]{0,}[.]{1}[0-9]{0,}[.]{1}[0-9]{0,}[.]{1}[0-9]{0,}[.]{1}[0-9]{0,}'), '[0-9]{0,}[.]{1}[0-9[{0,}[.]{1}[0-9]{0,}[.]{1}[0-9]{0,}$') END;;
    hidden: no
    order_by_field: server_version_major_sort
  }

  dimension: server_version_major {
    group_label: " Server Versions"
    label: "  Server Version: Major (Current)"
    description: "The version of the Mattermost server omitting the dot releases."
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

  dimension: context_library_version {
    label: " Context Library Version"
    description: ""
    type: string
    sql: ${TABLE}.context_library_version ;;
    hidden: yes
  }

  dimension: edition {
    label: " Server Edition (Current)"
    group_label: " Server Editions"
    description: "The server edition. Either E0 or TE."
    type: string
    sql: CASE WHEN ${TABLE}.edition = 'true' THEN 'E0' WHEN ${TABLE}.edition = 'false' THEN 'TE' ELSE NULL END ;;
  }

  dimension: first_server_edition {
    label: "First Server Edition"
    group_label: " Server Editions"
    description: "The first server edition logged via telemetry for the server. Either E0 or TE."
    type: string
    sql: ${server_fact.first_server_edition} ;;
  }


  dimension: active_user_count {
    label: "Active Users"
    group_label: " Security User Counts"
    description: "The count of registered users that have logged in to the Mattermost site/application in the last 24 hours on the server (logged via security_update_check.go)."
    type: number
    sql: CASE WHEN ${active_users_daily} >= COALESCE(${TABLE}.active_user_count,0) THEN ${active_users_daily} ELSE ${TABLE}.active_user_count END ;;
  }

  dimension: active_user_count_band {
    label: "Active Users Band"
    group_label: " Security User Counts"
    description: "The count of registered users that have visited the Mattermost site/application in the last 24 hours on the server (logged via security_update_check.go)."
    type: tier
    style: integer
    tiers: [1, 2, 5, 11, 21, 31, 51, 76, 101, 151, 201, 401, 601, 1001, 3001]
    sql: ${active_user_count} ;;
  }

  dimension: user_count {
    label: "Registered Users"
    group_label: " Security User Counts"
    description: "The count of all users registered/associated with the server (logged via security_update_check.go)."
    type: number
    sql: coalesce(${registered_users}, ${TABLE}.user_count) ;;
  }

  dimension: user_count_band {
    label: "Registered Users Band"
    group_label: " Security User Counts"
    description: "The count of all users registered/associated with the server tiered into distinct ranges (logged via security_update_check.go)."
    type: tier
    style: integer
    tiers: [1, 2, 5, 11, 21, 31, 51, 76, 101, 151, 201, 401, 601, 1001, 3001]#[2, 5, 11, 16, 21, 31, 41, 51, 76, 101, 151, 301, 501, 1001]

    sql: ${user_count} ;;
  }

  dimension: system_admins {
    label: " System Admins"
    group_label: " Diagnostics User Counts"
    description: "The number of system admins associated with a server on a given logging date (mattermost2.server logged via diagnostics.go)."
    type: number
    sql: ${TABLE}.system_admins ;;
    hidden: no
  }

  dimension: operating_system {
    label: " Operating System"
    description: "The operating system the server is currently hosted on (Linux)."
    type: string
    sql: ${TABLE}.operating_system ;;
    hidden: yes
  }

  dimension: database_type {
    label: " Database Type"
    group_label: " Database Info."
    description: "The database type the server is currently hosted on (MySQL or Postgres)."
    type: string
    sql: ${TABLE}.database_type ;;
    hidden: no
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

  dimension: gitlab_install {
    label: "  Gitlab Install"
    description: "Boolean indicating the server's OAuth enable gitlab flag = True on the date of server activation (first logged diagnostics activity date)."
    type: yesno
    sql: ${server_fact.gitlab_install} ;;
  }

  dimension: account_sfid {
    label: " Account Sfid"
    description: "The Salesforce Account ID associated with the server."
    link: {
      label: "Salesforce Account Record"
      url: "https://mattermost.lightning.force.com/lightning/r/{{ value }}/view"
      icon_url: "https://mattermost.my.salesforce.com/favicon.ico"
    }
    type: string
    sql: ${server_fact.account_sfid} ;;
    hidden: no
  }

  dimension: account_name {
    label: " Account Name"
    description: "The Salesforce Account Name associated with the server."
    link: {
      label: "Salesforce Account Record"
      url: "https://mattermost.lightning.force.com/lightning/r/{{ account_sfid._value }}/view"
      icon_url: "https://mattermost.my.salesforce.com/favicon.ico"
    }
    type: string
    sql: ${server_fact.account_name} ;;
    hidden: no
  }

  dimension: company_name {
    label: " Company Name"
    description: "The License Company Name associated with the server."
    link: {
      label: "Salesforce Account Record"
      url: "https://mattermost.lightning.force.com/lightning/r/{{ account_sfid._value }}/view"
      icon_url: "https://mattermost.my.salesforce.com/favicon.ico"
    }
    type: string
    sql: ${server_fact.company_name} ;;
    hidden: no
  }

  dimension: license_id1 {
    label: " License Id"
    description: "The Mattermost License ID associated with the server."
    type: string
    sql: COALESCE(${TABLE}.license_id1, ${license_id2}, ${license_id3}, ${license_id}) ;;
    hidden: no
  }

  dimension: license_id2 {
    label: " License Id2"
    description: ""
    type: string
    sql: ${TABLE}.license_id2 ;;
    hidden: yes
  }

  dimension: license_id3 {
    label: " License Id"
    description: "The Mattermost License ID associated with the server."
    type: string
    sql: ${server_fact.license_id} ;;
    hidden: yes
  }

  dimension: in_security {
    label: "   In Security Telemetry"
    group_label: "  Telemetry Flags"
    description: "Boolean indicating the server appears in the events.security table data (security_update_check.go) on the given date."
    type: yesno
    sql: ${TABLE}.in_security ;;
    hidden: no
  }

  dimension: in_mm2_server {
    label: "  In Diagnostics Telemetry"
    group_label: "  Telemetry Flags"
    description: "Boolean indicating the server is in mattermost2.server (diagnostics.go) table data on the given logging date."
    type: yesno
    sql: ${TABLE}.in_mm2_server ;;
    hidden: no
  }

  dimension: tracking_disabled {
    label: " Telemetry Disabled"
    group_label: "  Telemetry Flags"
    description: "Boolean indicating the Server does not appear in Diagnostics or Server telemetry on the given logging date. True if server disabled telemetry, was deleted, or there was error/anomaly in the data collection pipeline."
    type: yesno
    sql: ${TABLE}.tracking_disabled ;;
    hidden: no
  }

  dimension: has_dupes {
    label: " Dupes"
    group_label: " Data Quality"
    description: "True or false indicating whether the server id appears more than once in the raw data on the record date. Can occur for many reasons: server restart, upgrade, cluster, or error."
    type: yesno
    sql: ${TABLE}.has_dupes ;;
    hidden: no
  }

  dimension: has_multi_ips {
    label: " Multiple IP's"
    group_label: " Data Quality"
    description: "True or false indicating whether the server id appears more than once in the raw data, and that the server id was associated with multiple ip addresses. Typically occurs as a result of clustering i.e. hosting a signle server across databases."
    type: yesno
    sql: ${TABLE}.has_multi_ips ;;
    hidden: no
  }

  dimension: latest_record {
    label: "  Latest Telemetry Record"
    group_label: "  Telemetry Flags"
    description: "Boolean indicating the record captures the last (most recent) date that telemetry was logged for the server (via security_update_check.go or diagnostics.go)."
    type: yesno
    sql: CASE WHEN ${logging_date} = ${server_fact.last_active_date} THEN TRUE ELSE FALSE END ;;
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

  dimension: events {
    group_label: "Server-Level User Events"
    label: "Total Events"
    description: "The total number of events by active users associated with the server on the given logging."
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

  dimension: active_users {
    description: "The number of active users logged by the Server's activity diagnostics telemetry data on the given logging date."
    type: number
    group_label: " Activity Diagnostics User Counts"
    sql: COALESCE(${TABLE}.active_users, 0) ;;
    hidden: yes
  }

  dimension: active_users_daily {
    label: "Active Users (Daily)"
    description: "The number of daily active users logged by the Server's activity diagnostics telemetry data on the given logging date (coalesced active_users and active_users_daily)."
    type: number
    group_label: " Activity Diagnostics User Counts"
    sql: COALESCE(${TABLE}.active_users_daily, ${active_users}, 0)  ;;
    hidden: no
  }

  dimension: active_users_daily_band {
    description: "The number of daily active users logged by the Server's activity diagnostics telemetry data on the given logging date (coalesced active_users and active_users_daily)."
    type: tier
    style: integer
    tiers: [1, 2, 5, 11, 21, 31, 51, 76, 101, 151, 201, 401, 601, 1001, 3001]
    group_label: " Activity Diagnostics User Counts"
    sql: ${active_users_daily}  ;;
    hidden: no
  }

  dimension: active_users_monthly {
    description: "The number of distinct active users that logged in the last 30 days by the Server's activity diagnostic telemetry data on the given logging date."
    type: number
    group_label: " Activity Diagnostics User Counts"
    sql: ${TABLE}.active_users_monthly ;;
    hidden: no
  }

  dimension: bot_accounts {
    description: "The number of bot accounts logged by the Server's activity diagnostics telemetry data on the given logging date."
    type: number
    group_label: "Activity Diagnostics"
    sql: ${TABLE}.bot_accounts ;;
    hidden: no
  }

  dimension: bot_posts_previous_day {
    description: "The number of bot posts logged by the Server's activity diagnostics telemetry data the previous day before the given logging date."
    type: number
    group_label: "Activity Diagnostics"
    sql: ${TABLE}.bot_posts_previous_day ;;
    hidden: no
  }

  dimension: direct_message_channels {
    description: "The number of direct message channels logged by the Server's activity diagnostics telemetry data on the given logging date."
    type: number
    group_label: "Activity Diagnostics"
    sql: ${TABLE}.direct_message_channels ;;
    hidden: no
  }

  dimension: incoming_webhooks {
    description: "The number of incoming webhooks logged by the Server's activity diagnostics telemetry data on the given logging date."
    type: number
    group_label: "Activity Diagnostics"
    sql: ${TABLE}.incoming_webhooks ;;
    hidden: no
  }

  dimension: outgoing_webhooks {
    description: "The number of outgoing webhooks logged by the Server's activity diagnostics telemetry data on the given logging date."
    type: number
    group_label: "Activity Diagnostics"
    sql: ${TABLE}.outgoing_webhooks ;;
    hidden: no
  }

  dimension: posts {
    description: "The number of posts logged by the Server's activity diagnostics telemetry data on the given logging date."
    type: number
    group_label: "Activity Diagnostics"
    sql: ${TABLE}.posts ;;
    hidden: no
  }

  dimension: posts_per_user_per_day2 {
    label: "Posts Per User"
    description: "The number of posts per active user logged by the Server's activity diagnostics telemetry data on the given logging date."
    type: number
    group_label: "Activity Diagnostics"
    value_format_name: decimal_1
    sql: (/*${posts}::float-*/${posts_previous_day}::float)/NULLIF(${active_users_daily},0)::FLOAT ;;
    hidden: no
  }

  dimension: posts_per_user_per_day_band2 {
    label: "Posts Per User Band"
    description: "The number of posts per active user logged by the Server's activity diagnostics telemetry data on the given logging date."
    type: tier
    style: integer
    tiers: [3, 6, 11, 16, 21, 31, 51, 101]
    group_label: "Activity Diagnostics"
    sql: ${posts_per_user_per_day2} ;;
    hidden: no
  }

  dimension: posts_previous_day {
    description: "The number of posts logged by the Server's activity diagnostics telemetry data the previous day before on the given logging date."
    type: number
    group_label: "Activity Diagnostics"
    sql: ${TABLE}.posts_previous_day ;;
    hidden: no
  }

  dimension: private_channels {
    description: "The number of private channels logged by the Server's activity diagnostics telemetry data on the given logging date."
    type: number
    group_label: "Activity Diagnostics"
    sql: ${TABLE}.private_channels ;;
    hidden: no
  }

  dimension: private_channels_deleted {
    description: "The number of deleted private channels logged by the Server's activity diagnostics telemetry data on the given logging date."
    type: number
    group_label: "Activity Diagnostics"
    sql: ${TABLE}.private_channels_deleted ;;
    hidden: no
  }

  dimension: public_channels {
    description: "The number of public channels logged by the Server's activity diagnostics telemetry data on the given logging date."
    type: number
    group_label: "Activity Diagnostics"
    sql: ${TABLE}.public_channels ;;
    hidden: no
  }

  dimension: public_channels_deleted {
    description: "The number of deleted public channels logged by the Server's activity diagnostics telemetry data on the given logging date."
    type: number
    group_label: "Activity Diagnostics"
    sql: ${TABLE}.public_channels_deleted ;;
    hidden: no
  }

  dimension: registered_deactivated_users {
    description: "The number of registered deactivated users logged by the Server's activity diagnostics telemetry data on the given logging date."
    type: number
    group_label: " Activity Diagnostics User Counts"
    sql: ${TABLE}.registered_deactivated_users ;;
    hidden: no
  }

  dimension: registered_inactive_users {
    description: "The number of registered inactive users logged by the Server's activity diagnostics telemetry data on the given logging date."
    type: number
    group_label: " Activity Diagnostics User Counts"
    sql: ${TABLE}.registered_inactive_users ;;
    hidden: no
  }

  dimension: registered_users {
    description: "The number of registered users logged by the Server's activity diagnostics telemetry data on the given logging date (registered_users - registered_deactivated_users)."
    type: number
    group_label: " Activity Diagnostics User Counts"
    sql: NULLIF(COALESCE(${TABLE}.registered_users, 0) - COALESCE(${TABLE}.registered_deactivated_users, 0),0) ;;
    hidden: no
  }

  dimension: registered_users_band {
    description: "The number of registered users logged by the Server's activity diagnostics telemetry data on the given logging date (registered_users - registered_deactivated_users)."
    type: tier
    style: integer
    tiers: [1, 6, 11, 26, 51, 101, 501, 1001, 2501, 5001, 10001]
    group_label: " Activity Diagnostics User Counts"
    sql: ${registered_users} ;;
    hidden: no
  }

  dimension: slash_commands {
    description: "The number of slash commands logged by the Server's activity diagnostics telemetry data on the given logging date."
    type: number
    group_label: "Activity Diagnostics"
    sql: ${TABLE}.slash_commands ;;
    hidden: no
  }

  dimension: teams {
    description: "The number of teams logged by the Server's activity diagnostics telemetry data on the given logging date."
    type: number
    group_label: "Activity Diagnostics"
    sql: ${TABLE}.teams ;;
    hidden: no
  }

  dimension: used_apiv3 {
  label: "Used APIv3"
    description: "Boolean indicating whether APIv3 was used by the server on the given logging date (Activity Diagnostics)."
    type: yesno
    group_label: "Activity Diagnostics"
    sql: ${TABLE}.used_apiv3 ;;
    hidden: no
  }

  dimension: isdefault_max_users_for_statistics {
  label: "Isdefault Max Users For Statistics"
    description: ""
    type: yesno
    group_label: "Analytics Configuration"
    sql: ${TABLE}.isdefault_max_users_for_statistics ;;
    hidden: no
  }

  dimension: allow_banner_dismissal {
  label: "Allow Banner Dismissal"
    description: ""
    type: yesno
    group_label: "Annoucement Configuration"
    sql: ${TABLE}.allow_banner_dismissal ;;
    hidden: no
  }

  dimension: enable_banner {
  label: "Enable Banner"
    description: ""
    type: yesno
    group_label: "Annoucement Configuration"
    sql: ${TABLE}.enable_banner ;;
    hidden: no
  }

  dimension: isdefault_banner_color {
  label: "Isdefault Banner Color"
    description: ""
    type: yesno
    group_label: "Annoucement Configuration"
    sql: ${TABLE}.isdefault_banner_color ;;
    hidden: no
  }

  dimension: isdefault_banner_text_color {
  label: "Isdefault Banner Text Color"
    description: ""
    type: yesno
    group_label: "Annoucement Configuration"
    sql: ${TABLE}.isdefault_banner_text_color ;;
    hidden: no
  }

  dimension: allow_edit_post_client {
    description: ""
    type: string
    group_label: "Client Requirements Configuration"
    sql: ${TABLE}.allow_edit_post_client ;;
    hidden: no
  }

  dimension: android_latest_version {
    description: ""
    type: string
    group_label: "Client Requirements Configuration"
    sql: ${TABLE}.android_latest_version ;;
    hidden: no
  }

  dimension: android_min_version {
    description: ""
    type: string
    group_label: "Client Requirements Configuration"
    sql: ${TABLE}.android_min_version ;;
    hidden: no
  }

  dimension: desktop_latest_version {
    description: ""
    type: string
    group_label: "Client Requirements Configuration"
    sql: ${TABLE}.desktop_latest_version ;;
    hidden: no
  }

  dimension: desktop_min_version {
    description: ""
    type: string
    group_label: "Client Requirements Configuration"
    sql: ${TABLE}.desktop_min_version ;;
    hidden: no
  }

  dimension: enable_apiv3_client {
  label: "Enable Apiv3 Client"
    description: ""
    type: yesno
    group_label: "Client Requirements Configuration"
    sql: ${TABLE}.enable_apiv3_client ;;
    hidden: no
  }

  dimension: enable_channel_viewed_messages_client {
  label: "Enable Channel Viewed Messages Client"
    description: ""
    type: yesno
    group_label: "Client Requirements Configuration"
    sql: ${TABLE}.enable_channel_viewed_messages_client ;;
    hidden: no
  }

  dimension: enable_commands_client {
  label: "Enable Commands Client"
    description: ""
    type: yesno
    group_label: "Client Requirements Configuration"
    sql: ${TABLE}.enable_commands_client ;;
    hidden: no
  }

  dimension: enable_custom_emoji_client {
  label: "Enable Custom Emoji Client"
    description: ""
    type: yesno
    group_label: "Client Requirements Configuration"
    sql: ${TABLE}.enable_custom_emoji_client ;;
    hidden: no
  }

  dimension: enable_developer_client {
  label: "Enable Developer Client"
    description: ""
    type: yesno
    group_label: "Client Requirements Configuration"
    sql: ${TABLE}.enable_developer_client ;;
    hidden: no
  }

  dimension: enable_emoji_picker_client {
  label: "Enable Emoji Picker Client"
    description: ""
    type: yesno
    group_label: "Client Requirements Configuration"
    sql: ${TABLE}.enable_emoji_picker_client ;;
    hidden: no
  }

  dimension: enable_incoming_webhooks_client {
  label: "Enable Incoming Webhooks Client"
    description: ""
    type: yesno
    group_label: "Client Requirements Configuration"
    sql: ${TABLE}.enable_incoming_webhooks_client ;;
    hidden: no
  }

  dimension: enable_insecure_outgoing_connections_client {
  label: "Enable Insecure Outgoing Connections Client"
    description: ""
    type: yesno
    group_label: "Client Requirements Configuration"
    sql: ${TABLE}.enable_insecure_outgoing_connections_client ;;
    hidden: no
  }

  dimension: enable_multifactor_authentication_client {
  label: "Enable Multifactor Authentication Client"
    description: ""
    type: yesno
    group_label: "Client Requirements Configuration"
    sql: ${TABLE}.enable_multifactor_authentication_client ;;
    hidden: no
  }

  dimension: enable_oauth_service_provider_client {
  label: "Enable Oauth Service Provider Client"
    description: ""
    type: yesno
    group_label: "Client Requirements Configuration"
    sql: ${TABLE}.enable_oauth_service_provider_client ;;
    hidden: no
  }

  dimension: enable_only_admin_integrations_client {
  label: "Enable Only Admin Integrations Client"
    description: ""
    type: yesno
    group_label: "Client Requirements Configuration"
    sql: ${TABLE}.enable_only_admin_integrations_client ;;
    hidden: no
  }

  dimension: ios_latest_version {
    description: ""
    type: string
    group_label: "Client Requirements Configuration"
    sql: ${TABLE}.ios_latest_version ;;
    hidden: no
  }

  dimension: ios_min_version {
    description: ""
    type: string
    group_label: "Client Requirements Configuration"
    sql: ${TABLE}.ios_min_version ;;
    hidden: no
  }

  dimension: advertise_address {
  label: "Advertise Address"
    description: ""
    type: yesno
    group_label: "Cluster Configuration"
    sql: ${TABLE}.advertise_address ;;
    hidden: no
  }

  dimension: bind_address {
  label: "Bind Address"
    description: ""
    type: yesno
    group_label: "Cluster Configuration"
    sql: ${TABLE}.bind_address ;;
    hidden: no
  }

  dimension: enable_cluster {
  label: "Enable Cluster"
    description: ""
    type: yesno
    group_label: "Cluster Configuration"
    sql: ${TABLE}.enable_cluster ;;
    hidden: no
  }

  dimension: network_interface {
  label: "Network Interface"
    description: ""
    type: yesno
    group_label: "Cluster Configuration"
    sql: ${TABLE}.network_interface ;;
    hidden: no
  }

  dimension: read_only_config {
  label: "Read Only Config"
    description: ""
    type: yesno
    group_label: "Cluster Configuration"
    sql: ${TABLE}.read_only_config ;;
    hidden: no
  }

  dimension: use_experimental_gossip {
  label: "Use Experimental Gossip"
    description: ""
    type: yesno
    group_label: "Cluster Configuration"
    sql: ${TABLE}.use_experimental_gossip ;;
    hidden: no
  }

  dimension: use_ip_address {
  label: "Use Ip Address"
    description: ""
    type: yesno
    group_label: "Cluster Configuration"
    sql: ${TABLE}.use_ip_address ;;
    hidden: no
  }

  dimension: enable_compliance {
  label: "Enable Compliance"
    description: ""
    type: yesno
    group_label: "Compliance Configuration"
    sql: ${TABLE}.enable_compliance ;;
    hidden: no
  }

  dimension: enable_compliance_daily {
  label: "Enable Compliance Daily"
    description: ""
    type: yesno
    group_label: "Compliance Configuration"
    sql: ${TABLE}.enable_compliance_daily ;;
    hidden: no
  }

  dimension: message_retention_days {
    description: ""
    type: number
    group_label: "Data Retention Configuration"
    sql: ${TABLE}.message_retention_days ;;
    hidden: no
  }

  dimension: file_retention_days {
    description: ""
    type: number
    group_label: "Data Retention Configuration"
    sql: ${TABLE}.file_retention_days ;;
    hidden: no
  }

  dimension: enable_message_deletion {
  label: "Enable Message Deletion"
    description: ""
    type: yesno
    group_label: "Data Retention Configuration"
    sql: ${TABLE}.enable_message_deletion ;;
    hidden: no
  }

  dimension: enable_file_deletion {
  label: "Enable File Deletion"
    description: ""
    type: yesno
    group_label: "Data Retention Configuration"
    sql: ${TABLE}.enable_file_deletion ;;
    hidden: no
  }

  dimension: experimental_timezone {
  label: "Experimental Timezone"
    description: ""
    type: yesno
    group_label: "Display Configuration"
    sql: ${TABLE}.experimental_timezone ;;
    hidden: no
  }

  dimension: isdefault_custom_url_schemes {
  label: "Isdefault Custom Url Schemes"
    description: ""
    type: yesno
    group_label: "Display Configuration"
    sql: ${TABLE}.isdefault_custom_url_schemes ;;
    hidden: no
  }

  dimension: enable_autocomplete {
  label: "Enable Autocomplete"
    description: ""
    type: yesno
    group_label: "ElasticSearch Configuration"
    sql: ${TABLE}.enable_autocomplete ;;
    hidden: no
  }

  dimension: enable_indexing {
  label: "Enable Indexing"
    description: ""
    type: yesno
    group_label: "ElasticSearch Configuration"
    sql: ${TABLE}.enable_indexing ;;
    hidden: no
  }

  dimension: enable_searching {
  label: "Enable Searching"
    description: ""
    type: yesno
    group_label: "ElasticSearch Configuration"
    sql: ${TABLE}.enable_searching ;;
    hidden: no
  }

  dimension: isdefault_connection_url {
  label: "Isdefault Connection Url"
    description: ""
    type: yesno
    group_label: "ElasticSearch Configuration"
    sql: ${TABLE}.isdefault_connection_url ;;
    hidden: no
  }

  dimension: isdefault_index_prefix {
  label: "Isdefault Index Prefix"
    description: ""
    type: yesno
    group_label: "ElasticSearch Configuration"
    sql: ${TABLE}.isdefault_index_prefix ;;
    hidden: no
  }

  dimension: isdefault_password {
  label: "Isdefault Password"
    description: ""
    type: yesno
    group_label: "ElasticSearch Configuration"
    sql: ${TABLE}.isdefault_password ;;
    hidden: no
  }

  dimension: isdefault_username {
  label: "Isdefault Username"
    description: ""
    type: yesno
    group_label: "ElasticSearch Configuration"
    sql: ${TABLE}.isdefault_username ;;
    hidden: no
  }

  dimension: live_indexing_batch_size {
    description: ""
    type: number
    group_label: "ElasticSearch Configuration"
    sql: ${TABLE}.live_indexing_batch_size ;;
    hidden: no
  }

  dimension: skip_tls_verification {
  label: "Skip Tls Verification"
    description: ""
    type: yesno
    group_label: "ElasticSearch Configuration"
    sql: ${TABLE}.skip_tls_verification ;;
    hidden: no
  }

  dimension: sniff {
  label: "Sniff"
    description: ""
    type: yesno
    group_label: "ElasticSearch Configuration"
    sql: ${TABLE}.sniff ;;
    hidden: no
  }

  dimension: trace_elasticsearch {
    description: ""
    type: string
    group_label: "ElasticSearch Configuration"
    sql: ${TABLE}.trace_elasticsearch ;;
    hidden: no
  }

  dimension: connection_security_email {
    description: ""
    type: string
    group_label: "Email Configuration"
    sql: ${TABLE}.connection_security_email ;;
    hidden: no
  }

  dimension: email_batching_buffer_size {
    description: ""
    type: number
    group_label: "Email Configuration"
    sql: ${TABLE}.email_batching_buffer_size ;;
    hidden: no
  }

  dimension: email_notification_contents_type {
    description: ""
    type: string
    group_label: "Email Configuration"
    sql: ${TABLE}.email_notification_contents_type ;;
    hidden: no
  }

  dimension: enable_email_batching {
  label: "Enable Email Batching"
    description: ""
    type: yesno
    group_label: "Email Configuration"
    sql: ${TABLE}.enable_email_batching ;;
    hidden: no
  }

  dimension: enable_preview_mode_banner {
  label: "Enable Preview Mode Banner"
    description: ""
    type: yesno
    group_label: "Email Configuration"
    sql: ${TABLE}.enable_preview_mode_banner ;;
    hidden: no
  }

  dimension: enable_sign_in_with_email {
  label: "Enable Sign In With Email"
    description: ""
    type: yesno
    group_label: "Email Configuration"
    sql: ${TABLE}.enable_sign_in_with_email ;;
    hidden: no
  }

  dimension: enable_sign_in_with_username {
  label: "Enable Sign In With Username"
    description: ""
    type: yesno
    group_label: "Email Configuration"
    sql: ${TABLE}.enable_sign_in_with_username ;;
    hidden: no
  }

  dimension: enable_sign_up_with_email {
  label: "Enable Sign Up With Email"
    description: ""
    type: yesno
    group_label: "Email Configuration"
    sql: ${TABLE}.enable_sign_up_with_email ;;
    hidden: no
  }

  dimension: enable_smtp_auth {
  label: "Enable Smtp Auth"
    description: ""
    type: yesno
    group_label: "Email Configuration"
    sql: ${TABLE}.enable_smtp_auth ;;
    hidden: no
  }

  dimension: isdefault_feedback_email {
  label: "Isdefault Feedback Email"
    description: ""
    type: yesno
    group_label: "Email Configuration"
    sql: ${TABLE}.isdefault_feedback_email ;;
    hidden: no
  }

  dimension: isdefault_feedback_name {
  label: "Isdefault Feedback Name"
    description: ""
    type: yesno
    group_label: "Email Configuration"
    sql: ${TABLE}.isdefault_feedback_name ;;
    hidden: no
  }

  dimension: isdefault_feedback_organization {
  label: "Isdefault Feedback Organization"
    description: ""
    type: yesno
    group_label: "Email Configuration"
    sql: ${TABLE}.isdefault_feedback_organization ;;
    hidden: no
  }

  dimension: isdefault_login_button_border_color_email {
  label: "Isdefault Login Button Border Color Email"
    description: ""
    type: yesno
    group_label: "Email Configuration"
    sql: ${TABLE}.isdefault_login_button_border_color_email ;;
    hidden: no
  }

  dimension: isdefault_login_button_color_email {
  label: "Isdefault Login Button Color Email"
    description: ""
    type: yesno
    group_label: "Email Configuration"
    sql: ${TABLE}.isdefault_login_button_color_email ;;
    hidden: no
  }

  dimension: isdefault_login_button_text_color_email {
  label: "Isdefault Login Button Text Color Email"
    description: ""
    type: yesno
    group_label: "Email Configuration"
    sql: ${TABLE}.isdefault_login_button_text_color_email ;;
    hidden: no
  }

  dimension: isdefault_reply_to_address {
  label: "Isdefault Reply To Address"
    description: ""
    type: yesno
    group_label: "Email Configuration"
    sql: ${TABLE}.isdefault_reply_to_address ;;
    hidden: no
  }

  dimension: push_notification_contents {
    description: ""
    type: string
    group_label: "Email Configuration"
    sql: ${TABLE}.push_notification_contents ;;
    hidden: no
  }

  dimension: require_email_verification {
  label: "Require Email Verification"
    description: ""
    type: yesno
    group_label: "Email Configuration"
    sql: ${TABLE}.require_email_verification ;;
    hidden: no
  }

  dimension: send_email_notifications {
  label: "Send Email Notifications"
    description: ""
    type: yesno
    group_label: "Email Configuration"
    sql: ${TABLE}.send_email_notifications ;;
    hidden: no
  }

  dimension: send_push_notifications {
  label: "Send Push Notifications"
    description: ""
    type: yesno
    group_label: "Email Configuration"
    sql: ${TABLE}.send_push_notifications ;;
    hidden: no
  }

  dimension: skip_server_certificate_verification {
  label: "Skip Server Certificate Verification"
    description: ""
    type: yesno
    group_label: "Email Configuration"
    sql: ${TABLE}.skip_server_certificate_verification ;;
    hidden: no
  }

  dimension: use_channel_in_email_notifications {
  label: "Use Channel In Email Notifications"
    description: ""
    type: yesno
    group_label: "Email Configuration"
    sql: ${TABLE}.use_channel_in_email_notifications ;;
    hidden: no
  }

  dimension: client_side_cert_enable {
  label: "Client Side Cert Enable"
    description: ""
    type: yesno
    group_label: "Experimental Configuration"
    sql: ${TABLE}.client_side_cert_enable ;;
    hidden: no
  }

  dimension: enable_click_to_reply {
  label: "Enable Click To Reply"
    description: ""
    type: yesno
    group_label: "Experimental Configuration"
    sql: ${TABLE}.enable_click_to_reply ;;
    hidden: no
  }

  dimension: enable_post_metadata {
  label: "Enable Post Metadata"
    description: ""
    type: yesno
    group_label: "Experimental Configuration"
    sql: ${TABLE}.enable_post_metadata ;;
    hidden: no
  }

  dimension: isdefault_client_side_cert_check {
  label: "Isdefault Client Side Cert Check"
    description: ""
    type: yesno
    group_label: "Experimental Configuration"
    sql: ${TABLE}.isdefault_client_side_cert_check ;;
    hidden: no
  }

  dimension: restrict_system_admin {
  label: "Restrict System Admin"
    description: ""
    type: yesno
    group_label: "Experimental Configuration"
    sql: ${TABLE}.restrict_system_admin ;;
    hidden: no
  }

  dimension: use_new_saml_library {
  label: "Use New Saml Library"
    description: ""
    type: yesno
    group_label: "Experimental Configuration"
    sql: ${TABLE}.use_new_saml_library ;;
    hidden: no
  }

  dimension: enable_experimental_extensions {
  label: "Enable Experimental Extensions"
    description: ""
    type: yesno
    group_label: "Extension Configuration"
    sql: ${TABLE}.enable_experimental_extensions ;;
    hidden: no
  }

  dimension: amazon_s3_signv2 {
  label: "Amazon S3 Signv2"
    description: ""
    type: yesno
    group_label: "File Configuration"
    sql: ${TABLE}.amazon_s3_signv2 ;;
    hidden: no
  }

  dimension: amazon_s3_sse {
  label: "Amazon S3 Sse"
    description: ""
    type: yesno
    group_label: "File Configuration"
    sql: ${TABLE}.amazon_s3_sse ;;
    hidden: no
  }

  dimension: amazon_s3_ssl {
  label: "Amazon S3 Ssl"
    description: ""
    type: yesno
    group_label: "File Configuration"
    sql: ${TABLE}.amazon_s3_ssl ;;
    hidden: no
  }

  dimension: amazon_s3_trace {
  label: "Amazon S3 Trace"
    description: ""
    type: yesno
    group_label: "File Configuration"
    sql: ${TABLE}.amazon_s3_trace ;;
    hidden: no
  }

  dimension: driver_name_file {
    description: ""
    type: string
    group_label: "File Configuration"
    sql: ${TABLE}.driver_name_file ;;
    hidden: no
  }

  dimension: enable_file_attachments {
  label: "Enable File Attachments"
    description: ""
    type: yesno
    group_label: "File Configuration"
    sql: ${TABLE}.enable_file_attachments ;;
    hidden: no
  }

  dimension: enable_mobile_download {
  label: "Enable Mobile Download"
    description: ""
    type: yesno
    group_label: "File Configuration"
    sql: ${TABLE}.enable_mobile_download ;;
    hidden: no
  }

  dimension: enable_mobile_upload {
  label: "Enable Mobile Upload"
    description: ""
    type: yesno
    group_label: "File Configuration"
    sql: ${TABLE}.enable_mobile_upload ;;
    hidden: no
  }

  dimension: enable_public_links {
  label: "Enable Public Links"
    description: ""
    type: yesno
    group_label: "File Configuration"
    sql: ${TABLE}.enable_public_links ;;
    hidden: no
  }

  dimension: isabsolute_directory {
  label: "Isabsolute Directory"
    description: ""
    type: yesno
    group_label: "File Configuration"
    sql: ${TABLE}.isabsolute_directory ;;
    hidden: no
  }

  dimension: isdefault_directory {
  label: "Isdefault Directory"
    description: ""
    type: yesno
    group_label: "File Configuration"
    sql: ${TABLE}.isdefault_directory ;;
    hidden: no
  }

  dimension: max_file_size {
    description: ""
    type: number
    group_label: "File Configuration"
    sql: ${TABLE}.max_file_size ;;
    hidden: no
  }

  dimension: preview_height {
    description: ""
    type: number
    group_label: "File Configuration"
    sql: ${TABLE}.preview_height ;;
    hidden: no
  }

  dimension: preview_width {
    description: ""
    type: number
    group_label: "File Configuration"
    sql: ${TABLE}.preview_width ;;
    hidden: no
  }

  dimension: profile_height {
    description: ""
    type: number
    group_label: "File Configuration"
    sql: ${TABLE}.profile_height ;;
    hidden: no
  }

  dimension: profile_width {
    description: ""
    type: number
    group_label: "File Configuration"
    sql: ${TABLE}.profile_width ;;
    hidden: no
  }

  dimension: thumbnail_height {
    description: ""
    type: number
    group_label: "File Configuration"
    sql: ${TABLE}.thumbnail_height ;;
    hidden: no
  }

  dimension: thumbnail_width {
    description: ""
    type: number
    group_label: "File Configuration"
    sql: ${TABLE}.thumbnail_width ;;
    hidden: no
  }

  dimension: allow_email_accounts {
  label: "Allow Email Accounts"
    description: ""
    type: yesno
    group_label: "Guest Account Configuration"
    sql: ${TABLE}.allow_email_accounts ;;
    hidden: no
  }

  dimension: enable_guest_accounts {
  label: "Enable Guest Accounts"
    description: ""
    type: yesno
    group_label: "Guest Account Configuration"
    sql: ${TABLE}.enable_guest_accounts ;;
    hidden: no
  }

  dimension: enforce_multifactor_authentication_guest {
  label: "Enforce Multifactor Authentication Guest"
    description: ""
    type: yesno
    group_label: "Guest Account Configuration"
    sql: ${TABLE}.enforce_multifactor_authentication_guest ;;
    hidden: no
  }

  dimension: isdefault_restrict_creation_to_domains {
  label: "Isdefault Restrict Creation To Domains"
    description: ""
    type: yesno
    group_label: "Guest Account Configuration"
    sql: ${TABLE}.isdefault_restrict_creation_to_domains ;;
    hidden: no
  }

  dimension: enable_image_proxy {
  label: "Enable Image Proxy"
    description: ""
    type: yesno
    group_label: "Image Proxy Configuration"
    sql: ${TABLE}.enable_image_proxy ;;
    hidden: no
  }

  dimension: image_proxy_type {
    description: ""
    type: string
    group_label: "Image Proxy Configuration"
    sql: ${TABLE}.image_proxy_type ;;
    hidden: no
  }

  dimension: isdefault_remote_image_proxy_options {
  label: "Isdefault Remote Image Proxy Options"
    description: ""
    type: yesno
    group_label: "Image Proxy Configuration"
    sql: ${TABLE}.isdefault_remote_image_proxy_options ;;
    hidden: no
  }

  dimension: isdefault_remote_image_proxy_url {
  label: "Isdefault Remote Image Proxy Url"
    description: ""
    type: yesno
    group_label: "Image Proxy Configuration"
    sql: ${TABLE}.isdefault_remote_image_proxy_url ;;
    hidden: no
  }

  dimension: connection_security_ldap {
    description: ""
    type: string
    group_label: "Ldap Configuration"
    sql: ${TABLE}.connection_security_ldap ;;
    hidden: no
  }

  dimension: enable_ldap {
  label: "Enable Ldap"
    description: ""
    type: yesno
    group_label: "Ldap Configuration"
    sql: ${TABLE}.enable_ldap ;;
    hidden: no
  }

  dimension: enable_admin_filter {
  label: "Enable Admin Filter"
    description: ""
    type: yesno
    group_label: "Ldap Configuration"
    sql: ${TABLE}.enable_admin_filter ;;
    hidden: no
  }

  dimension: enable_sync {
  label: "Enable Sync"
    description: ""
    type: yesno
    group_label: "Ldap Configuration"
    sql: ${TABLE}.enable_sync ;;
    hidden: no
  }

  dimension: isdefault_email_attribute_ldap {
  label: "Isdefault Email Attribute Ldap"
    description: ""
    type: yesno
    group_label: "Ldap Configuration"
    sql: ${TABLE}.isdefault_email_attribute_ldap ;;
    hidden: no
  }

  dimension: isdefault_first_name_attribute_ldap {
  label: "Isdefault First Name Attribute Ldap"
    description: ""
    type: yesno
    group_label: "Ldap Configuration"
    sql: ${TABLE}.isdefault_first_name_attribute_ldap ;;
    hidden: no
  }

  dimension: isdefault_group_display_name_attribute {
  label: "Isdefault Group Display Name Attribute"
    description: ""
    type: yesno
    group_label: "Ldap Configuration"
    sql: ${TABLE}.isdefault_group_display_name_attribute ;;
    hidden: no
  }

  dimension: isdefault_group_id_attribute {
  label: "Isdefault Group Id Attribute"
    description: ""
    type: yesno
    group_label: "Ldap Configuration"
    sql: ${TABLE}.isdefault_group_id_attribute ;;
    hidden: no
  }

  dimension: isdefault_id_attribute_ldap {
  label: "Isdefault Id Attribute Ldap"
    description: ""
    type: yesno
    group_label: "Ldap Configuration"
    sql: ${TABLE}.isdefault_id_attribute_ldap ;;
    hidden: no
  }

  dimension: isdefault_last_name_attribute_ldap {
  label: "Isdefault Last Name Attribute Ldap"
    description: ""
    type: yesno
    group_label: "Ldap Configuration"
    sql: ${TABLE}.isdefault_last_name_attribute_ldap ;;
    hidden: no
  }

  dimension: isdefault_login_button_border_color_ldap {
  label: "Isdefault Login Button Border Color Ldap"
    description: ""
    type: yesno
    group_label: "Ldap Configuration"
    sql: ${TABLE}.isdefault_login_button_border_color_ldap ;;
    hidden: no
  }

  dimension: isdefault_login_button_color_ldap {
  label: "Isdefault Login Button Color Ldap"
    description: ""
    type: yesno
    group_label: "Ldap Configuration"
    sql: ${TABLE}.isdefault_login_button_color_ldap ;;
    hidden: no
  }

  dimension: isdefault_login_button_text_color_ldap {
  label: "Isdefault Login Button Text Color Ldap"
    description: ""
    type: yesno
    group_label: "Ldap Configuration"
    sql: ${TABLE}.isdefault_login_button_text_color_ldap ;;
    hidden: no
  }

  dimension: isdefault_login_field_name {
  label: "Isdefault Login Field Name"
    description: ""
    type: yesno
    group_label: "Ldap Configuration"
    sql: ${TABLE}.isdefault_login_field_name ;;
    hidden: no
  }

  dimension: isdefault_login_id_attribute {
  label: "Isdefault Login Id Attribute"
    description: ""
    type: yesno
    group_label: "Ldap Configuration"
    sql: ${TABLE}.isdefault_login_id_attribute ;;
    hidden: no
  }

  dimension: isdefault_nickname_attribute_ldap {
  label: "Isdefault Nickname Attribute Ldap"
    description: ""
    type: yesno
    group_label: "Ldap Configuration"
    sql: ${TABLE}.isdefault_nickname_attribute_ldap ;;
    hidden: no
  }

  dimension: isdefault_position_attribute_ldap {
  label: "Isdefault Position Attribute Ldap"
    description: ""
    type: yesno
    group_label: "Ldap Configuration"
    sql: ${TABLE}.isdefault_position_attribute_ldap ;;
    hidden: no
  }

  dimension: isdefault_username_attribute_ldap {
  label: "Isdefault Username Attribute Ldap"
    description: ""
    type: yesno
    group_label: "Ldap Configuration"
    sql: ${TABLE}.isdefault_username_attribute_ldap ;;
    hidden: no
  }

  dimension: isempty_admin_filter {
  label: "Isempty Admin Filter"
    description: ""
    type: yesno
    group_label: "Ldap Configuration"
    sql: ${TABLE}.isempty_admin_filter ;;
    hidden: no
  }

  dimension: isempty_group_filter {
  label: "Isempty Group Filter"
    description: ""
    type: yesno
    group_label: "Ldap Configuration"
    sql: ${TABLE}.isempty_group_filter ;;
    hidden: no
  }

  dimension: isempty_guest_filter {
  label: "Isempty Guest Filter"
    description: ""
    type: yesno
    group_label: "Ldap Configuration"
    sql: ${TABLE}.isempty_guest_filter ;;
    hidden: no
  }

  dimension: max_page_size {
    description: ""
    type: number
    group_label: "Ldap Configuration"
    sql: ${TABLE}.max_page_size ;;
    hidden: no
  }

  dimension: query_timeout_ldap {
    description: ""
    type: number
    group_label: "Ldap Configuration"
    sql: ${TABLE}.query_timeout_ldap ;;
    hidden: no
  }

  dimension: segment_dedupe_id_ldap {
    description: ""
    type: string
    group_label: "Ldap Configuration"
    sql: ${TABLE}.segment_dedupe_id_ldap ;;
    hidden: no
  }

  dimension: skip_certificate_verification {
  label: "Skip Certificate Verification"
    description: ""
    type: yesno
    group_label: "Ldap Configuration"
    sql: ${TABLE}.skip_certificate_verification ;;
    hidden: no
  }

  dimension: sync_interval_minutes {
    description: ""
    type: number
    group_label: "Ldap Configuration"
    sql: ${TABLE}.sync_interval_minutes ;;
    hidden: no
  }

  dimension: license_id {
    description: ""
    type: string
    group_label: "License Configuration"
    sql: ${TABLE}.license_id ;;
    hidden: no
  }

  dimension_group: start {
    description: "The start date of the license associated with Mattermost server."
    type: time
    timeframes: [date, week, month, year, fiscal_quarter, fiscal_year]
    group_label: "License Configuration"
    sql: ${TABLE}.start_date ;;
    hidden: no
  }

  dimension: license_edition {
    description: "The Mattermost edition currently associated with the Mattermost server."
    type: string
    group_label: "License Configuration"
    sql: ${TABLE}.license_edition ;;
    hidden: no
  }

  dimension_group: expire {
    description: "The expiration date of the license associated with the Mattermost server."
    type: time
    timeframes: [date, week, month, year, fiscal_quarter, fiscal_year]
    group_label: "License Configuration"
    sql: ${TABLE}.expire_date ;;
    hidden: no
  }

  dimension: feature_cluster {
  label: "Feature Cluster"
    description: "Indicates whether the Cluster feature is enabled on the provisioned license."
    type: yesno
    group_label: "License Configuration"
    sql: ${TABLE}.feature_cluster ;;
    hidden: no
  }

  dimension: feature_compliance {
  label: "Feature Compliance"
    description: "Indicates whether the Compliance feature is enabled on the provisioned license."
    type: yesno
    group_label: "License Configuration"
    sql: ${TABLE}.feature_compliance ;;
    hidden: no
  }

  dimension: feature_custom_brand {
  label: "Feature Custom Brand"
    description: "Indicates whether the Custom Brand feature is enabled on the provisioned license."
    type: yesno
    group_label: "License Configuration"
    sql: ${TABLE}.feature_custom_brand ;;
    hidden: no
  }

  dimension: feature_custom_permissions_schemes {
  label: "Feature Custom Permissions Schemes"
    description: "Indicates whether the Custom Permissions Schemes feature is enabled on the provisioned license."
    type: yesno
    group_label: "License Configuration"
    sql: ${TABLE}.feature_custom_permissions_schemes ;;
    hidden: no
  }

  dimension: feature_data_retention {
  label: "Feature Data Retention"
    description: "Indicates whether the Data Retention feature is enabled on the provisioned license."
    type: yesno
    group_label: "License Configuration"
    sql: ${TABLE}.feature_data_retention ;;
    hidden: no
  }

  dimension: feature_elastic_search {
  label: "Feature Elastic Search"
    description: "Indicates whether the Elastic Search feature is enabled on the provisioned license."
    type: yesno
    group_label: "License Configuration"
    sql: ${TABLE}.feature_elastic_search ;;
    hidden: no
  }

  dimension: feature_email_notification_contents {
  label: "Feature Email Notification Contents"
    description: "Indicates whether the Email Notifications Contents feature is enabled on the provisioned license."
    type: yesno
    group_label: "License Configuration"
    sql: ${TABLE}.feature_email_notification_contents ;;
    hidden: no
  }

  dimension: feature_future {
  label: "Feature Future"
    description: "Indicates whether the Future feature is enabled on the provisioned license."
    type: yesno
    group_label: "License Configuration"
    sql: ${TABLE}.feature_future ;;
    hidden: no
  }

  dimension: feature_google {
  label: "Feature Google"
    description: "Indicates whether the Google feature is enabled on the provisioned license."
    type: yesno
    group_label: "License Configuration"
    sql: ${TABLE}.feature_google ;;
    hidden: no
  }

  dimension: feature_guest_accounts {
  label: "Feature Guest Accounts"
    description: "Indicates whether the Guest Accounts feature is enabled on the provisioned license."
    type: yesno
    group_label: "License Configuration"
    sql: ${TABLE}.feature_guest_accounts ;;
    hidden: no
  }

  dimension: feature_guest_accounts_permissions {
  label: "Feature Guest Accounts Permissions"
    description: "Indicates whether the Guest Accounts Permissions feature is enabled on the provisioned license."
    type: yesno
    group_label: "License Configuration"
    sql: ${TABLE}.feature_guest_accounts_permissions ;;
    hidden: no
  }

  dimension: feature_id_loaded {
  label: "Feature ID Loaded"
    description: "Indicates whether the ID Loaded feature is enabled on the provisioned license."
    type: yesno
    group_label: "License Configuration"
    sql: ${TABLE}.feature_id_loaded ;;
    hidden: no
  }

  dimension: feature_ldap {
  label: "Feature LDAP"
    description: "Indicates whether the LDAP feature is enabled on the provisioned license."
    type: yesno
    group_label: "License Configuration"
    sql: ${TABLE}.feature_ldap ;;
    hidden: no
  }

  dimension: feature_ldap_groups {
  label: "Feature LDAP Groups"
    description: "Indicates whether the LDAP Groups feature is enabled on the provisioned license."
    type: yesno
    group_label: "License Configuration"
    sql: ${TABLE}.feature_ldap_groups ;;
    hidden: no
  }

  dimension: feature_lock_teammate_name_display {
  label: "Feature Lock Teammate Name Display"
    description: "Indicates whether the Lock Teammate Name Display feature is enabled on the provisioned license."
    type: yesno
    group_label: "License Configuration"
    sql: ${TABLE}.feature_lock_teammate_name_display ;;
    hidden: no
  }

  dimension: feature_message_export {
  label: "Feature Message Export"
    description: "Indicates whether the Data Retention feature is enabled on the provisioned license."
    type: yesno
    group_label: "License Configuration"
    sql: ${TABLE}.feature_message_export ;;
    hidden: no
  }

  dimension: feature_metrics {
  label: "Feature Metrics"
    description: "Indicates whether the Metrics feature is enabled on the provisioned license."
    type: yesno
    group_label: "License Configuration"
    sql: ${TABLE}.feature_metrics ;;
    hidden: no
  }

  dimension: feature_mfa {
  label: "Feature MFA"
    description: "Indicates whether the Multi-factor Authentication feature is enabled on the provisioned license."
    type: yesno
    group_label: "License Configuration"
    sql: ${TABLE}.feature_mfa ;;
    hidden: no
  }

  dimension: feature_mhpns {
  label: "Feature MHPNS"
    description: "Indicates whether the MHPNS feature is enabled on the provisioned license."
    type: yesno
    group_label: "License Configuration"
    sql: ${TABLE}.feature_mhpns ;;
    hidden: no
  }

  dimension: feature_office365 {
  label: "Feature Office365"
    description: "Indicates whether the Office365 feature is enabled on the provisioned license."
    type: yesno
    group_label: "License Configuration"
    sql: ${TABLE}.feature_office365 ;;
    hidden: no
  }

  dimension: feature_password {
  label: "Feature Password"
    description: "Indicates whether the Password feature is enabled on the provisioned license."
    type: yesno
    group_label: "License Configuration"
    sql: ${TABLE}.feature_password ;;
    hidden: no
  }

  dimension: feature_saml {
  label: "Feature SAML"
    description: "Indicates whether the SAML feature is enabled on the provisioned license."
    type: yesno
    group_label: "License Configuration"
    sql: ${TABLE}.feature_saml ;;
    hidden: no
  }

  dimension_group: issued {
    description: "The issued date of the license assoicated with the Mattermost server."
    type: time
    timeframes: [date, week, month, year, fiscal_quarter, fiscal_year]
    group_label: "License Configuration"
    sql: ${TABLE}.issued ;;
    hidden: no
  }

  dimension: users {
    description: "The number of User Seats provisioned to the license associated with the Mattermost server."
    type: number
    group_label: "License Configuration"
    sql: ${TABLE}.users ;;
    hidden: no
  }

  dimension: available_locales {
    description: ""
    type: string
    group_label: "Localization Configuration"
    sql: ${TABLE}.available_locales ;;
    hidden: no
  }

  dimension: default_client_locale {
    description: ""
    type: string
    group_label: "Localization Configuration"
    sql: ${TABLE}.default_client_locale ;;
    hidden: no
  }

  dimension: default_server_locale {
    description: ""
    type: string
    group_label: "Localization Configuration"
    sql: ${TABLE}.default_server_locale ;;
    hidden: no
  }

  dimension: console_json_log {
  label: "Console Json Log"
    description: ""
    type: yesno
    group_label: "Log Configuration"
    sql: ${TABLE}.console_json_log ;;
    hidden: no
  }

  dimension: console_level_log {
    description: ""
    type: string
    group_label: "Log Configuration"
    sql: ${TABLE}.console_level_log ;;
    hidden: no
  }

  dimension: enable_console_log {
  label: "Enable Console Log"
    description: ""
    type: yesno
    group_label: "Log Configuration"
    sql: ${TABLE}.enable_console_log ;;
    hidden: no
  }

  dimension: enable_file_log {
  label: "Enable File Log"
    description: ""
    type: yesno
    group_label: "Log Configuration"
    sql: ${TABLE}.enable_file_log ;;
    hidden: no
  }

  dimension: enable_webhook_debugging {
  label: "Enable Webhook Debugging"
    description: ""
    type: yesno
    group_label: "Log Configuration"
    sql: ${TABLE}.enable_webhook_debugging ;;
    hidden: no
  }

  dimension: file_json_log {
  label: "File Json Log"
    description: ""
    type: yesno
    group_label: "Log Configuration"
    sql: ${TABLE}.file_json_log ;;
    hidden: no
  }

  dimension: file_level_log {
    description: ""
    type: string
    group_label: "Log Configuration"
    sql: ${TABLE}.file_level_log ;;
    hidden: no
  }

  dimension: isdefault_file_format {
  label: "Isdefault File Format"
    description: ""
    type: yesno
    group_label: "Log Configuration"
    sql: ${TABLE}.isdefault_file_format ;;
    hidden: no
  }

  dimension: isdefault_file_location_log {
  label: "Isdefault File Location Log"
    description: ""
    type: yesno
    group_label: "Log Configuration"
    sql: ${TABLE}.isdefault_file_location_log ;;
    hidden: no
  }

  dimension: batch_size {
    description: ""
    type: number
    group_label: "Message Export Configuration"
    sql: ${TABLE}.batch_size ;;
    hidden: no
  }

  dimension: daily_run_time {
    description: ""
    type: string
    group_label: "Message Export Configuration"
    sql: ${TABLE}.daily_run_time ;;
    hidden: no
  }

  dimension: enable_message_export {
  label: "Enable Message Export"
    description: ""
    type: yesno
    group_label: "Message Export Configuration"
    sql: ${TABLE}.enable_message_export ;;
    hidden: no
  }

  dimension: export_format {
    description: ""
    type: string
    group_label: "Message Export Configuration"
    sql: ${TABLE}.export_format ;;
    hidden: no
  }

  dimension: global_relay_customer_type {
    description: ""
    type: string
    group_label: "Message Export Configuration"
    sql: ${TABLE}.global_relay_customer_type ;;
    hidden: no
  }

  dimension: is_default_global_relay_email_address {
  label: "Is Default Global Relay Email Address"
    description: ""
    type: yesno
    group_label: "Message Export Configuration"
    sql: ${TABLE}.is_default_global_relay_email_address ;;
    hidden: no
  }

  dimension: is_default_global_relay_smtp_password {
  label: "Is Default Global Relay Smtp Password"
    description: ""
    type: yesno
    group_label: "Message Export Configuration"
    sql: ${TABLE}.is_default_global_relay_smtp_password ;;
    hidden: no
  }

  dimension: is_default_global_relay_smtp_username {
  label: "Is Default Global Relay Smtp Username"
    description: ""
    type: yesno
    group_label: "Message Export Configuration"
    sql: ${TABLE}.is_default_global_relay_smtp_username ;;
    hidden: no
  }

  dimension: block_profile_rate {
    description: ""
    type: number
    group_label: "Metric Configuration"
    sql: ${TABLE}.block_profile_rate ;;
    hidden: no
  }

  dimension: enable_metrics {
  label: "Enable Metrics"
    description: ""
    type: yesno
    group_label: "Metric Configuration"
    sql: ${TABLE}.enable_metrics ;;
    hidden: no
  }

  dimension: isdefault_android_app_download_link {
  label: "Isdefault Android App Download Link"
    description: ""
    type: yesno
    group_label: "Nativeapp Configuration"
    sql: ${TABLE}.isdefault_android_app_download_link ;;
    hidden: no
  }

  dimension: isdefault_app_download_link {
  label: "Isdefault App Download Link"
    description: ""
    type: yesno
    group_label: "Nativeapp Configuration"
    sql: ${TABLE}.isdefault_app_download_link ;;
    hidden: no
  }

  dimension: isdefault_iosapp_download_link {
  label: "Isdefault Iosapp Download Link"
    description: ""
    type: yesno
    group_label: "Nativeapp Configuration"
    sql: ${TABLE}.isdefault_iosapp_download_link ;;
    hidden: no
  }

  dimension: console_json_notifications {
  label: "Console Json Notifications"
    description: ""
    type: yesno
    group_label: "Notifications Log Configuration"
    sql: ${TABLE}.console_json_notifications ;;
    hidden: no
  }

  dimension: console_level_notifications {
    description: ""
    type: string
    group_label: "Notifications Log Configuration"
    sql: ${TABLE}.console_level_notifications ;;
    hidden: no
  }

  dimension: enable_console_notifications {
  label: "Enable Console Notifications"
    description: ""
    type: yesno
    group_label: "Notifications Log Configuration"
    sql: ${TABLE}.enable_console_notifications ;;
    hidden: no
  }

  dimension: enable_file_notifications {
  label: "Enable File Notifications"
    description: ""
    type: yesno
    group_label: "Notifications Log Configuration"
    sql: ${TABLE}.enable_file_notifications ;;
    hidden: no
  }

  dimension: file_json_notifications {
  label: "File Json Notifications"
    description: ""
    type: yesno
    group_label: "Notifications Log Configuration"
    sql: ${TABLE}.file_json_notifications ;;
    hidden: no
  }

  dimension: file_level_notifications {
    description: ""
    type: string
    group_label: "Notifications Log Configuration"
    sql: ${TABLE}.file_level_notifications ;;
    hidden: no
  }

  dimension: isdefault_file_location_notifications {
  label: "Isdefault File Location Notifications"
    description: ""
    type: yesno
    group_label: "Notifications Log Configuration"
    sql: ${TABLE}.isdefault_file_location_notifications ;;
    hidden: no
  }

  dimension: enable_office365_oauth {
  label: "Enable Office365 Oauth"
    description: ""
    type: yesno
    group_label: "Oauth Configuration"
    sql: ${TABLE}.enable_office365_oauth ;;
    hidden: no
  }

  dimension: enable_google_oauth {
  label: "Enable Google Oauth"
    description: ""
    type: yesno
    group_label: "Oauth Configuration"
    sql: ${TABLE}.enable_google_oauth ;;
    hidden: no
  }

  dimension: enable_gitlab_oauth {
  label: "Enable Gitlab Oauth"
    description: ""
    type: yesno
    group_label: "Oauth Configuration"
    sql: ${TABLE}.enable_gitlab_oauth ;;
    hidden: no
  }

  dimension: enable_lowercase {
  label: "Enable Lowercase"
    description: ""
    type: yesno
    group_label: "Password Configuration"
    sql: ${TABLE}.enable_lowercase ;;
    hidden: no
  }

  dimension: enable_uppercase {
  label: "Enable Uppercase"
    description: ""
    type: yesno
    group_label: "Password Configuration"
    sql: ${TABLE}.enable_uppercase ;;
    hidden: no
  }

  dimension: enable_symbol {
  label: "Enable Symbol"
    description: ""
    type: yesno
    group_label: "Password Configuration"
    sql: ${TABLE}.enable_symbol ;;
    hidden: no
  }

  dimension: enable_number {
  label: "Enable Number"
    description: ""
    type: yesno
    group_label: "Password Configuration"
    sql: ${TABLE}.enable_number ;;
    hidden: no
  }

  dimension: password_minimum_length {
    description: ""
    type: number
    group_label: "Password Configuration"
    sql: ${TABLE}.password_minimum_length ;;
    hidden: no
  }

  dimension: phase_1_migration_complete {
  label: "Phase 1 Migration Complete"
    description: ""
    type: yesno
    group_label: "Permissions General Configuration"
    sql: ${TABLE}.phase_1_migration_complete ;;
    hidden: no
  }

  dimension: phase_2_migration_complete {
  label: "Phase 2 Migration Complete"
    description: ""
    type: yesno
    group_label: "Permissions General Configuration"
    sql: ${TABLE}.phase_2_migration_complete ;;
    hidden: no
  }

  dimension: channel_admin_permissions {
    description: ""
    type: string
    group_label: "Permissions System Configuration"
    sql: ${TABLE}.channel_admin_permissions ;;
    hidden: no
  }

  dimension: channel_guest_permissions {
    description: ""
    type: string
    group_label: "Permissions System Configuration"
    sql: ${TABLE}.channel_guest_permissions ;;
    hidden: no
  }

  dimension: channel_user_permissions {
    description: ""
    type: string
    group_label: "Permissions System Configuration"
    sql: ${TABLE}.channel_user_permissions ;;
    hidden: no
  }

  dimension: system_admin_permissions {
    description: ""
    type: string
    group_label: "Permissions System Configuration"
    sql: ${TABLE}.system_admin_permissions ;;
    hidden: no
  }

  dimension: system_user_permissions {
    description: ""
    type: string
    group_label: "Permissions System Configuration"
    sql: ${TABLE}.system_user_permissions ;;
    hidden: no
  }

  dimension: team_admin_permissions {
    description: ""
    type: string
    group_label: "Permissions System Configuration"
    sql: ${TABLE}.team_admin_permissions ;;
    hidden: no
  }

  dimension: team_guest_permissions {
    description: ""
    type: string
    group_label: "Permissions System Configuration"
    sql: ${TABLE}.team_guest_permissions ;;
    hidden: no
  }

  dimension: team_user_permissions {
    description: ""
    type: string
    group_label: "Permissions System Configuration"
    sql: ${TABLE}.team_user_permissions ;;
    hidden: no
  }

  dimension: allow_insecure_download_url {
  label: "Allow Insecure Download Url"
    description: ""
    type: yesno
    group_label: "Plugin Configuration"
    sql: ${TABLE}.allow_insecure_download_url ;;
    hidden: no
  }

  dimension: automatic_prepackaged_plugins {
  label: "Automatic Prepackaged Plugins"
    description: ""
    type: yesno
    group_label: "Plugin Configuration"
    sql: ${TABLE}.automatic_prepackaged_plugins ;;
    hidden: no
  }

  dimension: enable_plugins {
  label: "Enable Plugins"
    description: ""
    type: yesno
    group_label: "Plugin Configuration"
    sql: ${TABLE}.enable_plugins ;;
    hidden: no
  }

  dimension: enable_antivirus {
  label: "Enable Antivirus"
    description: ""
    type: yesno
    group_label: "Plugin Configuration"
    sql: ${TABLE}.enable_antivirus ;;
    hidden: no
  }

  dimension: enable_autolink {
  label: "Enable Autolink"
    description: ""
    type: yesno
    group_label: "Plugin Configuration"
    sql: ${TABLE}.enable_autolink ;;
    hidden: no
  }

  dimension: enable_aws_sns {
  label: "Enable Aws Sns"
    description: ""
    type: yesno
    group_label: "Plugin Configuration"
    sql: ${TABLE}.enable_aws_sns ;;
    hidden: no
  }

  dimension: enable_confluence {
    label: "Enable Confluence"
    description: ""
    type: yesno
    group_label: "Plugin Configuration"
    sql: ${TABLE}.enable_confluence ;;
    hidden: no
  }

  dimension: enable_custom_user_attributes {
  label: "Enable Custom User Attributes"
    description: ""
    type: yesno
    group_label: "Plugin Configuration"
    sql: ${TABLE}.enable_custom_user_attributes ;;
    hidden: no
  }

  dimension: enable_github {
  label: "Enable Github"
    description: ""
    type: yesno
    group_label: "Plugin Configuration"
    sql: ${TABLE}.enable_github ;;
    hidden: no
  }

  dimension: enable_gitlab {
  label: "Enable Gitlab"
    description: ""
    type: yesno
    group_label: "Plugin Configuration"
    sql: ${TABLE}.enable_gitlab ;;
    hidden: no
  }

  dimension: enable_health_check {
  label: "Enable Health Check"
    description: ""
    type: yesno
    group_label: "Plugin Configuration"
    sql: ${TABLE}.enable_health_check ;;
    hidden: no
  }

  dimension: enable_jenkins {
  label: "Enable Jenkins"
    description: ""
    type: yesno
    group_label: "Plugin Configuration"
    sql: ${TABLE}.enable_jenkins ;;
    hidden: no
  }

  dimension: enable_jira {
  label: "Enable Jira"
    description: ""
    type: yesno
    group_label: "Plugin Configuration"
    sql: ${TABLE}.enable_jira ;;
    hidden: no
  }

  dimension: enable_jitsi {
    label: "Enable Jitsi"
    description: ""
    type: yesno
    group_label: "Plugin Configuration"
    sql: ${TABLE}.enable_jitsi ;;
    hidden: no
  }

  dimension: enable_marketplace {
  label: "Enable Marketplace"
    description: ""
    type: yesno
    group_label: "Plugin Configuration"
    sql: ${TABLE}.enable_marketplace ;;
    hidden: no
  }

  dimension: enable_mscalendar {
    label: "Enable MS Calendar"
    description: ""
    type: yesno
    group_label: "Plugin Configuration"
    sql: ${TABLE}.enable_mscalendar ;;
    hidden: no
  }

  dimension: enable_nps {
  label: "Enable Nps"
    description: ""
    type: yesno
    group_label: "Plugin Configuration"
    sql: ${TABLE}.enable_nps ;;
    hidden: no
  }

  dimension: enable_nps_survey {
  label: "Enable Nps Survey"
    description: ""
    type: yesno
    group_label: "Plugin Configuration"
    sql: ${TABLE}.enable_nps_survey ;;
    hidden: no
  }

  dimension: enable_remote_marketplace {
  label: "Enable Remote Marketplace"
    description: ""
    type: yesno
    group_label: "Plugin Configuration"
    sql: ${TABLE}.enable_remote_marketplace ;;
    hidden: no
  }

  dimension: enable_skype4business {
    label: "Enable Skype4Business"
    description: ""
    type: yesno
    group_label: "Plugin Configuration"
    sql: ${TABLE}.enable_skype4business ;;
    hidden: no
  }

  dimension: enable_todo {
    label: "Enable ToDo"
    description: ""
    type: yesno
    group_label: "Plugin Configuration"
    sql: ${TABLE}.enable_todo ;;
    hidden: no
  }

  dimension: enable_uploads {
  label: "Enable Uploads"
    description: ""
    type: yesno
    group_label: "Plugin Configuration"
    sql: ${TABLE}.enable_uploads ;;
    hidden: no
  }

  dimension: enable_webex {
  label: "Enable Webex"
    description: ""
    type: yesno
    group_label: "Plugin Configuration"
    sql: ${TABLE}.enable_webex ;;
    hidden: no
  }

  dimension: enable_welcome_bot {
  label: "Enable Welcome Bot"
    description: ""
    type: yesno
    group_label: "Plugin Configuration"
    sql: ${TABLE}.enable_welcome_bot ;;
    hidden: no
  }
  dimension: enable_zoom {
    label: "Enable Zoom"
    description: ""
    type: yesno
    group_label: "Plugin Configuration"
    sql: ${TABLE}.enable_zoom ;;
    hidden: no
  }
  dimension: enable_giphy {
    label: "Enable Giphy"
    description: ""
    type: yesno
    group_label: "Plugin Configuration"
    sql: ${TABLE}.enable_giphy ;;
    hidden: no
  }
  dimension: enable_digital_ocean {
    label: "Enable Digital Ocean"
    description: ""
    type: yesno
    group_label: "Plugin Configuration"
    sql: ${TABLE}.enable_digital_ocean ;;
    hidden: no
  }
  dimension: enable_incident_response {
    label: "Enable Incident Response"
    description: ""
    type: yesno
    group_label: "Plugin Configuration"
    sql: ${TABLE}.enable_incident_response ;;
    hidden: no
  }
  dimension: enable_memes {
    label: "Enable Memes"
    description: ""
    type: yesno
    group_label: "Plugin Configuration"
    sql: ${TABLE}.enable_memes ;;
    hidden: no
  }

  dimension: is_default_marketplace_url {
  label: "Is Default Marketplace Url"
    description: ""
    type: yesno
    group_label: "Plugin Configuration"
    sql: ${TABLE}.is_default_marketplace_url ;;
    hidden: no
  }

  dimension: require_plugin_signature {
  label: "Require Plugin Signature"
    description: ""
    type: yesno
    group_label: "Plugin Configuration"
    sql: ${TABLE}.require_plugin_signature ;;
    hidden: no
  }

  dimension: signature_public_key_files {
    description: ""
    type: number
    group_label: "Plugin Configuration"
    sql: ${TABLE}.signature_public_key_files ;;
    hidden: no
  }

  dimension: version_antivirus {
    description: ""
    type: string
    group_label: "Plugin Configuration"
    sql: ${TABLE}.version_antivirus ;;
    hidden: no
  }

  dimension: version_autolink {
    description: ""
    type: string
    group_label: "Plugin Configuration"
    sql: ${TABLE}.version_autolink ;;
    hidden: no
  }

  dimension: version_aws_sns {
    description: ""
    type: string
    group_label: "Plugin Configuration"
    sql: ${TABLE}.version_aws_sns ;;
    hidden: no
  }

  dimension: version_custom_user_attributes {
    description: ""
    type: string
    group_label: "Plugin Configuration"
    sql: ${TABLE}.version_custom_user_attributes ;;
    hidden: no
  }

  dimension: version_github {
    description: ""
    type: string
    group_label: "Plugin Configuration"
    sql: ${TABLE}.version_github ;;
    hidden: no
  }

  dimension: version_gitlab {
    description: ""
    type: string
    group_label: "Plugin Configuration"
    sql: ${TABLE}.version_gitlab ;;
    hidden: no
  }

  dimension: version_jenkins {
    description: ""
    type: string
    group_label: "Plugin Configuration"
    sql: ${TABLE}.version_jenkins ;;
    hidden: no
  }

  dimension: version_jira {
    description: ""
    type: string
    group_label: "Plugin Configuration"
    sql: ${TABLE}.version_jira ;;
    hidden: no
  }

  dimension: version_nps {
    description: ""
    type: string
    group_label: "Plugin Configuration"
    sql: ${TABLE}.version_nps ;;
    hidden: no
  }

  dimension: version_webex {
    description: ""
    type: string
    group_label: "Plugin Configuration"
    sql: ${TABLE}.version_webex ;;
    hidden: no
  }

  dimension: version_welcome_bot {
    description: ""
    type: string
    group_label: "Plugin Configuration"
    sql: ${TABLE}.version_welcome_bot ;;
    hidden: no
  }

  dimension: version_zoom {
    description: ""
    type: string
    group_label: "Plugin Configuration"
    sql: ${TABLE}.version_zoom ;;
    hidden: no
  }

  dimension: version_giphy {
    description: ""
    type: string
    group_label: "Plugin Configuration"
    sql: ${TABLE}.version_giphy ;;
    hidden: no
  }

  dimension: version_digital_ocean {
    description: ""
    type: string
    group_label: "Plugin Configuration"
    sql: ${TABLE}.version_digital_ocean ;;
    hidden: no
  }

  dimension: version_confluence {
    description: ""
    type: string
    group_label: "Plugin Configuration"
    sql: ${TABLE}.version_confluence ;;
    hidden: no
  }

  dimension: version_mscalendar {
    description: ""
    type: string
    group_label: "Plugin Configuration"
    sql: ${TABLE}.version_mscalendar ;;
    hidden: no
  }

  dimension: version_incident_response {
    description: ""
    type: string
    group_label: "Plugin Configuration"
    sql: ${TABLE}.version_incident_response ;;
    hidden: no
  }

  dimension: version_todo {
    description: ""
    type: string
    group_label: "Plugin Configuration"
    sql: ${TABLE}.version_todo ;;
    hidden: no
  }

  dimension: version_memes {
    description: ""
    type: string
    group_label: "Plugin Configuration"
    sql: ${TABLE}.version_memes ;;
    hidden: no
  }

  dimension: active_backend_plugins {
    description: ""
    type: number
    group_label: "Plugin Configuration"
    sql: ${TABLE}.active_backend_plugins ;;
    hidden: no
  }

  dimension: active_plugins {
    description: ""
    type: number
    group_label: "Plugin Configuration"
    sql: ${TABLE}.active_plugins ;;
    hidden: no
  }

  dimension: active_webapp_plugins {
    description: ""
    type: number
    group_label: "Plugin Configuration"
    sql: ${TABLE}.active_webapp_plugins ;;
    hidden: no
  }

  dimension: disabled_backend_plugins {
    description: ""
    type: number
    group_label: "Plugin Configuration"
    sql: ${TABLE}.disabled_backend_plugins ;;
    hidden: no
  }

  dimension: disabled_plugins {
    description: ""
    type: number
    group_label: "Plugin Configuration"
    sql: ${TABLE}.disabled_plugins ;;
    hidden: no
  }

  dimension: disabled_webapp_plugins {
    description: ""
    type: number
    group_label: "Plugin Configuration"
    sql: ${TABLE}.disabled_webapp_plugins ;;
    hidden: no
  }

  dimension: enabled_backend_plugins {
    description: ""
    type: number
    group_label: "Plugin Configuration"
    sql: ${TABLE}.enabled_backend_plugins ;;
    hidden: no
  }

  dimension: enabled_plugins {
    description: ""
    type: number
    group_label: "Plugin Configuration"
    sql: ${TABLE}.enabled_plugins ;;
    hidden: no
  }

  dimension: enabled_webapp_plugins {
    description: ""
    type: number
    group_label: "Plugin Configuration"
    sql: ${TABLE}.enabled_webapp_plugins ;;
    hidden: no
  }

  dimension: inactive_backend_plugins {
    description: ""
    type: number
    group_label: "Plugin Configuration"
    sql: ${TABLE}.inactive_backend_plugins ;;
    hidden: no
  }

  dimension: inactive_plugins {
    description: ""
    type: number
    group_label: "Plugin Configuration"
    sql: ${TABLE}.inactive_plugins ;;
    hidden: no
  }

  dimension: inactive_webapp_plugins {
    description: ""
    type: number
    group_label: "Plugin Configuration"
    sql: ${TABLE}.inactive_webapp_plugins ;;
    hidden: no
  }

  dimension: plugins_with_broken_manifests {
    description: ""
    type: number
    group_label: "Plugin Configuration"
    sql: ${TABLE}.plugins_with_broken_manifests ;;
    hidden: no
  }

  dimension: plugins_with_settings {
    description: ""
    type: number
    group_label: "Plugin Configuration"
    sql: ${TABLE}.plugins_with_settings ;;
    hidden: no
  }

  dimension: show_email_address {
  label: "Show Email Address"
    description: ""
    type: yesno
    group_label: "Privacy Configuration"
    sql: ${TABLE}.show_email_address ;;
    hidden: no
  }

  dimension: show_full_name {
  label: "Show Full Name"
    description: ""
    type: yesno
    group_label: "Privacy Configuration"
    sql: ${TABLE}.show_full_name ;;
    hidden: no
  }

  dimension: enable_rate_limiter {
  label: "Enable Rate Limiter"
    description: ""
    type: yesno
    group_label: "Rate Configuration"
    sql: ${TABLE}.enable_rate_limiter ;;
    hidden: no
  }

  dimension: isdefault_vary_by_header {
  label: "Isdefault Vary By Header"
    description: ""
    type: yesno
    group_label: "Rate Configuration"
    sql: ${TABLE}.isdefault_vary_by_header ;;
    hidden: no
  }

  dimension: max_burst {
    description: ""
    type: number
    group_label: "Rate Configuration"
    sql: ${TABLE}.max_burst ;;
    hidden: no
  }

  dimension: memory_store_size {
    description: ""
    type: number
    group_label: "Rate Configuration"
    sql: ${TABLE}.memory_store_size ;;
    hidden: no
  }

  dimension: per_sec {
    description: ""
    type: number
    group_label: "Rate Configuration"
    sql: ${TABLE}.per_sec ;;
    hidden: no
  }

  dimension: vary_by_remote_address {
  label: "Vary By Remote Address"
    description: ""
    type: yesno
    group_label: "Rate Configuration"
    sql: ${TABLE}.vary_by_remote_address ;;
    hidden: no
  }

  dimension: vary_by_user {
  label: "Vary By User"
    description: ""
    type: yesno
    group_label: "Rate Configuration"
    sql: ${TABLE}.vary_by_user ;;
    hidden: no
  }

  dimension: enable_saml {
  label: "Enable Saml"
    description: ""
    type: yesno
    group_label: "Saml Configuration"
    sql: ${TABLE}.enable_saml ;;
    hidden: no
  }

  dimension: enable_admin_attribute {
  label: "Enable Admin Attribute"
    description: ""
    type: yesno
    group_label: "Saml Configuration"
    sql: ${TABLE}.enable_admin_attribute ;;
    hidden: no
  }

  dimension: enable_sync_with_ldap {
  label: "Enable Sync With Ldap"
    description: ""
    type: yesno
    group_label: "Saml Configuration"
    sql: ${TABLE}.enable_sync_with_ldap ;;
    hidden: no
  }

  dimension: enable_sync_with_ldap_include_auth {
  label: "Enable Sync With Ldap Include Auth"
    description: ""
    type: yesno
    group_label: "Saml Configuration"
    sql: ${TABLE}.enable_sync_with_ldap_include_auth ;;
    hidden: no
  }

  dimension: encrypt_saml {
  label: "Encrypt Saml"
    description: ""
    type: yesno
    group_label: "Saml Configuration"
    sql: ${TABLE}.encrypt_saml ;;
    hidden: no
  }

  dimension: isdefault_admin_attribute {
  label: "Isdefault Admin Attribute"
    description: ""
    type: yesno
    group_label: "Saml Configuration"
    sql: ${TABLE}.isdefault_admin_attribute ;;
    hidden: no
  }

  dimension: isdefault_canonical_algorithm {
  label: "Isdefault Canonical Algorithm"
    description: ""
    type: yesno
    group_label: "Saml Configuration"
    sql: ${TABLE}.isdefault_canonical_algorithm ;;
    hidden: no
  }

  dimension: isdefault_email_attribute_saml {
  label: "Isdefault Email Attribute Saml"
    description: ""
    type: yesno
    group_label: "Saml Configuration"
    sql: ${TABLE}.isdefault_email_attribute_saml ;;
    hidden: no
  }

  dimension: isdefault_first_name_attribute_saml {
  label: "Isdefault First Name Attribute Saml"
    description: ""
    type: yesno
    group_label: "Saml Configuration"
    sql: ${TABLE}.isdefault_first_name_attribute_saml ;;
    hidden: no
  }

  dimension: isdefault_guest_attribute {
  label: "Isdefault Guest Attribute"
    description: ""
    type: yesno
    group_label: "Saml Configuration"
    sql: ${TABLE}.isdefault_guest_attribute ;;
    hidden: no
  }

  dimension: isdefault_id_attribute_saml {
  label: "Isdefault Id Attribute Saml"
    description: ""
    type: yesno
    group_label: "Saml Configuration"
    sql: ${TABLE}.isdefault_id_attribute_saml ;;
    hidden: no
  }

  dimension: isdefault_last_name_attribute_saml {
  label: "Isdefault Last Name Attribute Saml"
    description: ""
    type: yesno
    group_label: "Saml Configuration"
    sql: ${TABLE}.isdefault_last_name_attribute_saml ;;
    hidden: no
  }

  dimension: isdefault_locale_attribute {
  label: "Isdefault Locale Attribute"
    description: ""
    type: yesno
    group_label: "Saml Configuration"
    sql: ${TABLE}.isdefault_locale_attribute ;;
    hidden: no
  }

  dimension: isdefault_login_button_border_color_saml {
  label: "Isdefault Login Button Border Color Saml"
    description: ""
    type: yesno
    group_label: "Saml Configuration"
    sql: ${TABLE}.isdefault_login_button_border_color_saml ;;
    hidden: no
  }

  dimension: isdefault_login_button_color_saml {
  label: "Isdefault Login Button Color Saml"
    description: ""
    type: yesno
    group_label: "Saml Configuration"
    sql: ${TABLE}.isdefault_login_button_color_saml ;;
    hidden: no
  }

  dimension: isdefault_login_button_text {
  label: "Isdefault Login Button Text"
    description: ""
    type: yesno
    group_label: "Saml Configuration"
    sql: ${TABLE}.isdefault_login_button_text ;;
    hidden: no
  }

  dimension: isdefault_login_button_text_color_saml {
  label: "Isdefault Login Button Text Color Saml"
    description: ""
    type: yesno
    group_label: "Saml Configuration"
    sql: ${TABLE}.isdefault_login_button_text_color_saml ;;
    hidden: no
  }

  dimension: isdefault_nickname_attribute_saml {
  label: "Isdefault Nickname Attribute Saml"
    description: ""
    type: yesno
    group_label: "Saml Configuration"
    sql: ${TABLE}.isdefault_nickname_attribute_saml ;;
    hidden: no
  }

  dimension: isdefault_position_attribute_saml {
  label: "Isdefault Position Attribute Saml"
    description: ""
    type: yesno
    group_label: "Saml Configuration"
    sql: ${TABLE}.isdefault_position_attribute_saml ;;
    hidden: no
  }

  dimension: isdefault_scoping_idp_name {
  label: "Isdefault Scoping Idp Name"
    description: ""
    type: yesno
    group_label: "Saml Configuration"
    sql: ${TABLE}.isdefault_scoping_idp_name ;;
    hidden: no
  }

  dimension: isdefault_scoping_idp_provider_id {
  label: "Isdefault Scoping Idp Provider Id"
    description: ""
    type: yesno
    group_label: "Saml Configuration"
    sql: ${TABLE}.isdefault_scoping_idp_provider_id ;;
    hidden: no
  }

  dimension: isdefault_signature_algorithm {
  label: "Isdefault Signature Algorithm"
    description: ""
    type: yesno
    group_label: "Saml Configuration"
    sql: ${TABLE}.isdefault_signature_algorithm ;;
    hidden: no
  }

  dimension: isdefault_username_attribute_saml {
  label: "Isdefault Username Attribute Saml"
    description: ""
    type: yesno
    group_label: "Saml Configuration"
    sql: ${TABLE}.isdefault_username_attribute_saml ;;
    hidden: no
  }

  dimension: sign_request {
  label: "Sign Request"
    description: ""
    type: yesno
    group_label: "Saml Configuration"
    sql: ${TABLE}.sign_request ;;
    hidden: no
  }

  dimension: verify_saml {
  label: "Verify Saml"
    description: ""
    type: yesno
    group_label: "Saml Configuration"
    sql: ${TABLE}.verify_saml ;;
    hidden: no
  }

  dimension: allow_cookies_for_subdomains {
  label: "Allow Cookies For Subdomains"
    description: ""
    type: yesno
    group_label: "Service Configuration"
    sql: ${TABLE}.allow_cookies_for_subdomains ;;
    hidden: no
  }

  dimension: allow_edit_post_service {
    description: ""
    type: string
    group_label: "Service Configuration"
    sql: ${TABLE}.allow_edit_post_service ;;
    hidden: no
  }

  dimension: close_unused_direct_messages {
  label: "Close Unused Direct Messages"
    description: ""
    type: yesno
    group_label: "Service Configuration"
    sql: ${TABLE}.close_unused_direct_messages ;;
    hidden: no
  }

  dimension: connection_security_service {
    description: ""
    type: string
    group_label: "Service Configuration"
    sql: ${TABLE}.connection_security_service ;;
    hidden: no
  }

  dimension: cors_allow_credentials {
  label: "Cors Allow Credentials"
    description: ""
    type: yesno
    group_label: "Service Configuration"
    sql: ${TABLE}.cors_allow_credentials ;;
    hidden: no
  }

  dimension: cors_debug {
  label: "Cors Debug"
    description: ""
    type: yesno
    group_label: "Service Configuration"
    sql: ${TABLE}.cors_debug ;;
    hidden: no
  }

  dimension: custom_service_terms_enabled_service {
  label: "Custom Service Terms Enabled Service"
    description: ""
    type: yesno
    group_label: "Service Configuration"
    sql: ${TABLE}.custom_service_terms_enabled_service ;;
    hidden: no
  }

  dimension: disable_bots_when_owner_is_deactivated {
  label: "Disable Bots When Owner Is Deactivated"
    description: ""
    type: yesno
    group_label: "Service Configuration"
    sql: ${TABLE}.disable_bots_when_owner_is_deactivated ;;
    hidden: no
  }

  dimension: disable_legacy_mfa {
  label: "Disable Legacy Mfa"
    description: ""
    type: yesno
    group_label: "Service Configuration"
    sql: ${TABLE}.disable_legacy_mfa ;;
    hidden: no
  }

  dimension: enable_apiv3_service {
  label: "Enable Apiv3 Service"
    description: ""
    type: yesno
    group_label: "Service Configuration"
    sql: ${TABLE}.enable_apiv3_service ;;
    hidden: no
  }

  dimension: enable_api_team_deletion {
  label: "Enable Api Team Deletion"
    description: ""
    type: yesno
    group_label: "Service Configuration"
    sql: ${TABLE}.enable_api_team_deletion ;;
    hidden: no
  }

  dimension: enable_bot_account_creation {
  label: "Enable Bot Account Creation"
    description: ""
    type: yesno
    group_label: "Service Configuration"
    sql: ${TABLE}.enable_bot_account_creation ;;
    hidden: no
  }

  dimension: enable_channel_viewed_messages_service {
  label: "Enable Channel Viewed Messages Service"
    description: ""
    type: yesno
    group_label: "Service Configuration"
    sql: ${TABLE}.enable_channel_viewed_messages_service ;;
    hidden: no
  }

  dimension: enable_commands_service {
  label: "Enable Commands Service"
    description: ""
    type: yesno
    group_label: "Service Configuration"
    sql: ${TABLE}.enable_commands_service ;;
    hidden: no
  }

  dimension: enable_custom_emoji_service {
  label: "Enable Custom Emoji Service"
    description: ""
    type: yesno
    group_label: "Service Configuration"
    sql: ${TABLE}.enable_custom_emoji_service ;;
    hidden: no
  }

  dimension: enable_developer_service {
  label: "Enable Developer Service"
    description: ""
    type: yesno
    group_label: "Service Configuration"
    sql: ${TABLE}.enable_developer_service ;;
    hidden: no
  }

  dimension: enable_email_invitations {
  label: "Enable Email Invitations"
    description: ""
    type: yesno
    group_label: "Service Configuration"
    sql: ${TABLE}.enable_email_invitations ;;
    hidden: no
  }

  dimension: enable_emoji_picker_service {
  label: "Enable Emoji Picker Service"
    description: ""
    type: yesno
    group_label: "Service Configuration"
    sql: ${TABLE}.enable_emoji_picker_service ;;
    hidden: no
  }

  dimension: enable_gif_picker {
  label: "Enable Gif Picker"
    description: ""
    type: yesno
    group_label: "Service Configuration"
    sql: ${TABLE}.enable_gif_picker ;;
    hidden: no
  }

  dimension: enable_incoming_webhooks_service {
  label: "Enable Incoming Webhooks Service"
    description: ""
    type: yesno
    group_label: "Service Configuration"
    sql: ${TABLE}.enable_incoming_webhooks_service ;;
    hidden: no
  }

  dimension: enable_insecure_outgoing_connections_service {
  label: "Enable Insecure Outgoing Connections Service"
    description: ""
    type: yesno
    group_label: "Service Configuration"
    sql: ${TABLE}.enable_insecure_outgoing_connections_service ;;
    hidden: no
  }

  dimension: enable_latex {
  label: "Enable Latex"
    description: ""
    type: yesno
    group_label: "Service Configuration"
    sql: ${TABLE}.enable_latex ;;
    hidden: no
  }

  dimension: enable_multifactor_authentication_service {
  label: "Enable Multifactor Authentication Service"
    description: ""
    type: yesno
    group_label: "Service Configuration"
    sql: ${TABLE}.enable_multifactor_authentication_service ;;
    hidden: no
  }

  dimension: enable_oauth_service_provider_service {
  label: "Enable Oauth Service Provider Service"
    description: ""
    type: yesno
    group_label: "Service Configuration"
    sql: ${TABLE}.enable_oauth_service_provider_service ;;
    hidden: no
  }

  dimension: enable_only_admin_integrations_service {
  label: "Enable Only Admin Integrations Service"
    description: ""
    type: yesno
    group_label: "Service Configuration"
    sql: ${TABLE}.enable_only_admin_integrations_service ;;
    hidden: no
  }

  dimension: enable_outgoing_webhooks {
  label: "Enable Outgoing Webhooks"
    description: ""
    type: yesno
    group_label: "Service Configuration"
    sql: ${TABLE}.enable_outgoing_webhooks ;;
    hidden: no
  }

  dimension: enable_post_icon_override {
  label: "Enable Post Icon Override"
    description: ""
    type: yesno
    group_label: "Service Configuration"
    sql: ${TABLE}.enable_post_icon_override ;;
    hidden: no
  }

  dimension: enable_post_search {
  label: "Enable Post Search"
    description: ""
    type: yesno
    group_label: "Service Configuration"
    sql: ${TABLE}.enable_post_search ;;
    hidden: no
  }

  dimension: enable_post_username_override {
  label: "Enable Post Username Override"
    description: ""
    type: yesno
    group_label: "Service Configuration"
    sql: ${TABLE}.enable_post_username_override ;;
    hidden: no
  }

  dimension: enable_preview_features {
  label: "Enable Preview Features"
    description: ""
    type: yesno
    group_label: "Service Configuration"
    sql: ${TABLE}.enable_preview_features ;;
    hidden: no
  }

  dimension: enable_security_fix_alert {
  label: "Enable Security Fix Alert"
    description: ""
    type: yesno
    group_label: "Service Configuration"
    sql: ${TABLE}.enable_security_fix_alert ;;
    hidden: no
  }

  dimension: enable_svgs {
  label: "Enable Svgs"
    description: ""
    type: yesno
    group_label: "Service Configuration"
    sql: ${TABLE}.enable_svgs ;;
    hidden: no
  }

  dimension: enable_testing {
  label: "Enable Testing"
    description: ""
    type: yesno
    group_label: "Service Configuration"
    sql: ${TABLE}.enable_testing ;;
    hidden: no
  }

  dimension: enable_tutorial {
  label: "Enable Tutorial"
    description: ""
    type: yesno
    group_label: "Service Configuration"
    sql: ${TABLE}.enable_tutorial ;;
    hidden: no
  }

  dimension: enable_user_access_tokens {
  label: "Enable User Access Tokens"
    description: ""
    type: yesno
    group_label: "Service Configuration"
    sql: ${TABLE}.enable_user_access_tokens ;;
    hidden: no
  }

  dimension: enable_user_statuses {
  label: "Enable User Statuses"
    description: ""
    type: yesno
    group_label: "Service Configuration"
    sql: ${TABLE}.enable_user_statuses ;;
    hidden: no
  }

  dimension: enable_user_typing_messages {
  label: "Enable User Typing Messages"
    description: ""
    type: yesno
    group_label: "Service Configuration"
    sql: ${TABLE}.enable_user_typing_messages ;;
    hidden: no
  }

  dimension: enforce_multifactor_authentication_service {
  label: "Enforce Multifactor Authentication Service"
    description: ""
    type: yesno
    group_label: "Service Configuration"
    sql: ${TABLE}.enforce_multifactor_authentication_service ;;
    hidden: no
  }

  dimension: experimental_channel_organization {
  label: "Experimental Channel Organization"
    description: ""
    type: yesno
    group_label: "Service Configuration"
    sql: ${TABLE}.experimental_channel_organization ;;
    hidden: no
  }

  dimension: experimental_enable_authentication_transfer {
  label: "Experimental Enable Authentication Transfer"
    description: ""
    type: yesno
    group_label: "Service Configuration"
    sql: ${TABLE}.experimental_enable_authentication_transfer ;;
    hidden: no
  }

  dimension: experimental_enable_default_channel_leave_join_messages {
  label: "Experimental Enable Default Channel Leave Join Messages"
    description: ""
    type: yesno
    group_label: "Service Configuration"
    sql: ${TABLE}.experimental_enable_default_channel_leave_join_messages ;;
    hidden: no
  }

  dimension: experimental_enable_hardened_mode {
  label: "Experimental Enable Hardened Mode"
    description: ""
    type: yesno
    group_label: "Service Configuration"
    sql: ${TABLE}.experimental_enable_hardened_mode ;;
    hidden: no
  }

  dimension: experimental_group_unread_channels {
    description: ""
    type: string
    group_label: "Service Configuration"
    sql: ${TABLE}.experimental_group_unread_channels ;;
    hidden: no
  }

  dimension: experimental_ldap_group_sync {
  label: "Experimental Ldap Group Sync"
    description: ""
    type: yesno
    group_label: "Service Configuration"
    sql: ${TABLE}.experimental_ldap_group_sync ;;
    hidden: no
  }

  dimension: experimental_limit_client_config {
  label: "Experimental Limit Client Config"
    description: ""
    type: yesno
    group_label: "Service Configuration"
    sql: ${TABLE}.experimental_limit_client_config ;;
    hidden: no
  }

  dimension: experimental_strict_csrf_enforcement {
  label: "Experimental Strict Csrf Enforcement"
    description: ""
    type: yesno
    group_label: "Service Configuration"
    sql: ${TABLE}.experimental_strict_csrf_enforcement ;;
    hidden: no
  }

  dimension: forward_80_to_443 {
  label: "Forward 80 To 443"
    description: ""
    type: yesno
    group_label: "Service Configuration"
    sql: ${TABLE}.forward_80_to_443 ;;
    hidden: no
  }

  dimension: gfycat_api_key {
  label: "Gfycat Api Key"
    description: ""
    type: yesno
    group_label: "Service Configuration"
    sql: ${TABLE}.gfycat_api_key ;;
    hidden: no
  }

  dimension: gfycat_api_secret {
  label: "Gfycat Api Secret"
    description: ""
    type: yesno
    group_label: "Service Configuration"
    sql: ${TABLE}.gfycat_api_secret ;;
    hidden: no
  }

  dimension: isdefault_allowed_untrusted_internal_connections {
  label: "Isdefault Allowed Untrusted Internal Connections"
    description: ""
    type: yesno
    group_label: "Service Configuration"
    sql: ${TABLE}.isdefault_allowed_untrusted_internal_connections ;;
    hidden: no
  }

  dimension: isdefault_allowed_untrusted_inteznal_connections {
  label: "Isdefault Allowed Untrusted Inteznal Connections"
    description: ""
    type: yesno
    group_label: "Service Configuration"
    sql: ${TABLE}.isdefault_allowed_untrusted_inteznal_connections ;;
    hidden: no
  }

  dimension: isdefault_allow_cors_from {
  label: "Isdefault Allow Cors From"
    description: ""
    type: yesno
    group_label: "Service Configuration"
    sql: ${TABLE}.isdefault_allow_cors_from ;;
    hidden: no
  }

  dimension: isdefault_cors_exposed_headers {
  label: "Isdefault Cors Exposed Headers"
    description: ""
    type: yesno
    group_label: "Service Configuration"
    sql: ${TABLE}.isdefault_cors_exposed_headers ;;
    hidden: no
  }

  dimension: isdefault_google_developer_key {
  label: "Isdefault Google Developer Key"
    description: ""
    type: yesno
    group_label: "Service Configuration"
    sql: ${TABLE}.isdefault_google_developer_key ;;
    hidden: no
  }

  dimension: isdefault_image_proxy_options {
  label: "Isdefault Image Proxy Options"
    description: ""
    type: yesno
    group_label: "Service Configuration"
    sql: ${TABLE}.isdefault_image_proxy_options ;;
    hidden: no
  }

  dimension: isdefault_image_proxy_type {
  label: "Isdefault Image Proxy Type"
    description: ""
    type: yesno
    group_label: "Service Configuration"
    sql: ${TABLE}.isdefault_image_proxy_type ;;
    hidden: no
  }

  dimension: isdefault_image_proxy_url {
  label: "Isdefault Image Proxy Url"
    description: ""
    type: yesno
    group_label: "Service Configuration"
    sql: ${TABLE}.isdefault_image_proxy_url ;;
    hidden: no
  }

  dimension: isdefault_read_timeout {
  label: "Isdefault Read Timeout"
    description: ""
    type: yesno
    group_label: "Service Configuration"
    sql: ${TABLE}.isdefault_read_timeout ;;
    hidden: no
  }

  dimension: isdefault_site_url {
  label: "Isdefault Site Url"
    description: ""
    type: yesno
    group_label: "Service Configuration"
    sql: ${TABLE}.isdefault_site_url ;;
    hidden: no
  }

  dimension: isdefault_tls_cert_file {
  label: "Isdefault Tls Cert File"
    description: ""
    type: yesno
    group_label: "Service Configuration"
    sql: ${TABLE}.isdefault_tls_cert_file ;;
    hidden: no
  }

  dimension: isdefault_tls_key_file {
  label: "Isdefault Tls Key File"
    description: ""
    type: yesno
    group_label: "Service Configuration"
    sql: ${TABLE}.isdefault_tls_key_file ;;
    hidden: no
  }

  dimension: isdefault_write_timeout {
  label: "Isdefault Write Timeout"
    description: ""
    type: yesno
    group_label: "Service Configuration"
    sql: ${TABLE}.isdefault_write_timeout ;;
    hidden: no
  }

  dimension: maximum_login_attempts {
    description: ""
    type: number
    group_label: "Service Configuration"
    sql: ${TABLE}.maximum_login_attempts ;;
    hidden: no
  }

  dimension: minimum_hashtag_length {
    description: ""
    type: number
    group_label: "Service Configuration"
    sql: ${TABLE}.minimum_hashtag_length ;;
    hidden: no
  }

  dimension: post_edit_time_limit {
    description: ""
    type: number
    group_label: "Service Configuration"
    sql: ${TABLE}.post_edit_time_limit ;;
    hidden: no
  }

  dimension: restrict_custom_emoji_creation {
    description: ""
    type: string
    group_label: "Service Configuration"
    sql: ${TABLE}.restrict_custom_emoji_creation ;;
    hidden: no
  }

  dimension: restrict_post_delete {
    description: ""
    type: string
    group_label: "Service Configuration"
    sql: ${TABLE}.restrict_post_delete ;;
    hidden: no
  }

  dimension: session_cache_in_minutes {
    description: ""
    type: number
    group_label: "Service Configuration"
    sql: ${TABLE}.session_cache_in_minutes ;;
    hidden: no
  }

  dimension: session_idle_timeout_in_minutes {
    description: ""
    type: number
    group_label: "Service Configuration"
    sql: ${TABLE}.session_idle_timeout_in_minutes ;;
    hidden: no
  }

  dimension: session_length_mobile_in_days {
    description: ""
    type: number
    group_label: "Service Configuration"
    sql: ${TABLE}.session_length_mobile_in_days ;;
    hidden: no
  }

  dimension: session_length_sso_in_days {
    description: ""
    type: number
    group_label: "Service Configuration"
    sql: ${TABLE}.session_length_sso_in_days ;;
    hidden: no
  }

  dimension: session_length_web_in_days {
    description: ""
    type: number
    group_label: "Service Configuration"
    sql: ${TABLE}.session_length_web_in_days ;;
    hidden: no
  }

  dimension: tls_strict_transport {
  label: "Tls Strict Transport"
    description: ""
    type: yesno
    group_label: "Service Configuration"
    sql: ${TABLE}.tls_strict_transport ;;
    hidden: no
  }

  dimension: uses_letsencrypt {
  label: "Uses Letsencrypt"
    description: ""
    type: yesno
    group_label: "Service Configuration"
    sql: ${TABLE}.uses_letsencrypt ;;
    hidden: no
  }

  dimension: websocket_url {
  label: "Websocket Url"
    description: ""
    type: yesno
    group_label: "Service Configuration"
    sql: ${TABLE}.websocket_url ;;
    hidden: no
  }

  dimension: web_server_mode {
    description: ""
    type: string
    group_label: "Service Configuration"
    sql: ${TABLE}.web_server_mode ;;
    hidden: no
  }

  dimension: driver_name_sql {
    description: ""
    type: string
    group_label: "Sql Configuration"
    sql: ${TABLE}.driver_name_sql ;;
    hidden: no
  }

  dimension: enable_public_channels_materialization {
  label: "Enable Public Channels Materialization"
    description: ""
    type: yesno
    group_label: "Sql Configuration"
    sql: ${TABLE}.enable_public_channels_materialization ;;
    hidden: no
  }

  dimension: max_idle_conns {
    description: ""
    type: number
    group_label: "Sql Configuration"
    sql: ${TABLE}.max_idle_conns ;;
    hidden: no
  }

  dimension: max_open_conns {
    description: ""
    type: number
    group_label: "Sql Configuration"
    sql: ${TABLE}.max_open_conns ;;
    hidden: no
  }

  dimension: query_timeout_sql {
    description: ""
    type: number
    group_label: "Sql Configuration"
    sql: ${TABLE}.query_timeout_sql ;;
    hidden: no
  }

  dimension: trace_sql {
  label: "Trace Sql"
    description: ""
    type: yesno
    group_label: "Sql Configuration"
    sql: ${TABLE}.trace_sql ;;
    hidden: no
  }

  dimension: custom_service_terms_enabled_support {
  label: "Custom Service Terms Enabled Support"
    description: ""
    type: yesno
    group_label: "Support Configuration"
    sql: ${TABLE}.custom_service_terms_enabled_support ;;
    hidden: no
  }

  dimension: custom_terms_of_service_enabled {
  label: "Custom Terms Of Service Enabled"
    description: ""
    type: yesno
    group_label: "Support Configuration"
    sql: ${TABLE}.custom_terms_of_service_enabled ;;
    hidden: no
  }

  dimension: custom_terms_of_service_re_acceptance_period {
    description: ""
    type: number
    group_label: "Support Configuration"
    sql: ${TABLE}.custom_terms_of_service_re_acceptance_period ;;
    hidden: no
  }

  dimension: isdefault_about_link {
  label: "Isdefault About Link"
    description: ""
    type: yesno
    group_label: "Support Configuration"
    sql: ${TABLE}.isdefault_about_link ;;
    hidden: no
  }

  dimension: isdefault_help_link {
  label: "Isdefault Help Link"
    description: ""
    type: yesno
    group_label: "Support Configuration"
    sql: ${TABLE}.isdefault_help_link ;;
    hidden: no
  }

  dimension: isdefault_privacy_policy_link {
  label: "Isdefault Privacy Policy Link"
    description: ""
    type: yesno
    group_label: "Support Configuration"
    sql: ${TABLE}.isdefault_privacy_policy_link ;;
    hidden: no
  }

  dimension: isdefault_report_a_problem_link {
  label: "Isdefault Report A Problem Link"
    description: ""
    type: yesno
    group_label: "Support Configuration"
    sql: ${TABLE}.isdefault_report_a_problem_link ;;
    hidden: no
  }

  dimension: isdefault_support_email {
  label: "Isdefault Support Email"
    description: ""
    type: yesno
    group_label: "Support Configuration"
    sql: ${TABLE}.isdefault_support_email ;;
    hidden: no
  }

  dimension: isdefault_terms_of_service_link {
  label: "Isdefault Terms Of Service Link"
    description: ""
    type: yesno
    group_label: "Support Configuration"
    sql: ${TABLE}.isdefault_terms_of_service_link ;;
    hidden: no
  }

  dimension: segment_dedupe_id_support {
    description: ""
    type: string
    group_label: "Support Configuration"
    sql: ${TABLE}.segment_dedupe_id_support ;;
    hidden: no
  }

  dimension: enable_confirm_notifications_to_channel {
  label: "Enable Confirm Notifications To Channel"
    description: ""
    type: yesno
    group_label: "Team Configuration"
    sql: ${TABLE}.enable_confirm_notifications_to_channel ;;
    hidden: no
  }

  dimension: enable_custom_brand {
  label: "Enable Custom Brand"
    description: ""
    type: yesno
    group_label: "Team Configuration"
    sql: ${TABLE}.enable_custom_brand ;;
    hidden: no
  }

  dimension: enable_open_server {
  label: "Enable Open Server"
    description: ""
    type: yesno
    group_label: "Team Configuration"
    sql: ${TABLE}.enable_open_server ;;
    hidden: no
  }

  dimension: enable_team_creation {
  label: "Enable Team Creation"
    description: ""
    type: yesno
    group_label: "Team Configuration"
    sql: ${TABLE}.enable_team_creation ;;
    hidden: no
  }

  dimension: enable_user_creation {
  label: "Enable User Creation"
    description: ""
    type: yesno
    group_label: "Team Configuration"
    sql: ${TABLE}.enable_user_creation ;;
    hidden: no
  }

  dimension: enable_user_deactivation {
  label: "Enable User Deactivation"
    description: ""
    type: yesno
    group_label: "Team Configuration"
    sql: ${TABLE}.enable_user_deactivation ;;
    hidden: no
  }

  dimension: enable_x_to_leave_channels_from_lhs {
  label: "Enable X To Leave Channels From Lhs"
    description: ""
    type: yesno
    group_label: "Team Configuration"
    sql: ${TABLE}.enable_x_to_leave_channels_from_lhs ;;
    hidden: no
  }

  dimension: experimental_default_channels {
    description: ""
    type: number
    group_label: "Team Configuration"
    sql: ${TABLE}.experimental_default_channels ;;
    hidden: no
  }

  dimension: experimental_enable_automatic_replies {
  label: "Experimental Enable Automatic Replies"
    description: ""
    type: yesno
    group_label: "Team Configuration"
    sql: ${TABLE}.experimental_enable_automatic_replies ;;
    hidden: no
  }

  dimension: experimental_primary_team {
  label: "Experimental Primary Team"
    description: ""
    type: yesno
    group_label: "Team Configuration"
    sql: ${TABLE}.experimental_primary_team ;;
    hidden: no
  }

  dimension: experimental_town_square_is_hidden_in_lhs {
  label: "Experimental Town Square Is Hidden In Lhs"
    description: ""
    type: yesno
    group_label: "Team Configuration"
    sql: ${TABLE}.experimental_town_square_is_hidden_in_lhs ;;
    hidden: no
  }

  dimension: experimental_town_square_is_read_only {
  label: "Experimental Town Square Is Read Only"
    description: ""
    type: yesno
    group_label: "Team Configuration"
    sql: ${TABLE}.experimental_town_square_is_read_only ;;
    hidden: no
  }

  dimension: experimental_view_archived_channels {
  label: "Experimental View Archived Channels"
    description: ""
    type: yesno
    group_label: "Team Configuration"
    sql: ${TABLE}.experimental_view_archived_channels ;;
    hidden: no
  }

  dimension: isdefault_custom_brand_text {
  label: "Isdefault Custom Brand Text"
    description: ""
    type: yesno
    group_label: "Team Configuration"
    sql: ${TABLE}.isdefault_custom_brand_text ;;
    hidden: no
  }

  dimension: isdefault_custom_description_text {
  label: "Isdefault Custom Description Text"
    description: ""
    type: yesno
    group_label: "Team Configuration"
    sql: ${TABLE}.isdefault_custom_description_text ;;
    hidden: no
  }

  dimension: isdefault_site_name {
  label: "Isdefault Site Name"
    description: ""
    type: yesno
    group_label: "Team Configuration"
    sql: ${TABLE}.isdefault_site_name ;;
    hidden: no
  }

  dimension: isdefault_user_status_away_timeout {
  label: "Isdefault User Status Away Timeout"
    description: ""
    type: yesno
    group_label: "Team Configuration"
    sql: ${TABLE}.isdefault_user_status_away_timeout ;;
    hidden: no
  }

  dimension: lock_teammate_name_display {
  label: "Lock Teammate Name Display"
    description: ""
    type: yesno
    group_label: "Team Configuration"
    sql: ${TABLE}.lock_teammate_name_display ;;
    hidden: no
  }

  dimension: max_channels_per_team {
    description: ""
    type: number
    group_label: "Team Configuration"
    sql: ${TABLE}.max_channels_per_team ;;
    hidden: no
  }

  dimension: max_notifications_per_channel {
    description: ""
    type: number
    group_label: "Team Configuration"
    sql: ${TABLE}.max_notifications_per_channel ;;
    hidden: no
  }

  dimension: max_users_per_team {
    description: ""
    type: number
    group_label: "Team Configuration"
    sql: ${TABLE}.max_users_per_team ;;
    hidden: no
  }

  dimension: restrict_direct_message {
    description: ""
    type: string
    group_label: "Team Configuration"
    sql: ${TABLE}.restrict_direct_message ;;
    hidden: no
  }

  dimension: restrict_private_channel_creation {
    description: ""
    type: string
    group_label: "Team Configuration"
    sql: ${TABLE}.restrict_private_channel_creation ;;
    hidden: no
  }

  dimension: restrict_private_channel_deletion {
    description: ""
    type: string
    group_label: "Team Configuration"
    sql: ${TABLE}.restrict_private_channel_deletion ;;
    hidden: no
  }

  dimension: restrict_private_channel_management {
    description: ""
    type: string
    group_label: "Team Configuration"
    sql: ${TABLE}.restrict_private_channel_management ;;
    hidden: no
  }

  dimension: restrict_private_channel_manage_members {
    description: ""
    type: string
    group_label: "Team Configuration"
    sql: ${TABLE}.restrict_private_channel_manage_members ;;
    hidden: no
  }

  dimension: restrict_public_channel_creation {
    description: ""
    type: string
    group_label: "Team Configuration"
    sql: ${TABLE}.restrict_public_channel_creation ;;
    hidden: no
  }

  dimension: restrict_public_channel_deletion {
    description: ""
    type: string
    group_label: "Team Configuration"
    sql: ${TABLE}.restrict_public_channel_deletion ;;
    hidden: no
  }

  dimension: restrict_public_channel_management {
    description: ""
    type: string
    group_label: "Team Configuration"
    sql: ${TABLE}.restrict_public_channel_management ;;
    hidden: no
  }

  dimension: restrict_team_invite {
    description: ""
    type: string
    group_label: "Team Configuration"
    sql: ${TABLE}.restrict_team_invite ;;
    hidden: no
  }

  dimension: teammate_name_display {
    description: ""
    type: string
    group_label: "Team Configuration"
    sql: ${TABLE}.teammate_name_display ;;
    hidden: no
  }

  dimension: view_archived_channels {
  label: "View Archived Channels"
    description: ""
    type: yesno
    group_label: "Team Configuration"
    sql: ${TABLE}.view_archived_channels ;;
    hidden: no
  }

  dimension: allowed_themes {
    description: ""
    type: number
    group_label: "Theme Configuration"
    sql: ${TABLE}.allowed_themes ;;
    hidden: no
  }

  dimension: allow_custom_themes {
  label: "Allow Custom Themes"
    description: ""
    type: yesno
    group_label: "Theme Configuration"
    sql: ${TABLE}.allow_custom_themes ;;
    hidden: no
  }

  dimension: enable_theme_selection {
  label: "Enable Theme Selection"
    description: ""
    type: yesno
    group_label: "Theme Configuration"
    sql: ${TABLE}.enable_theme_selection ;;
    hidden: no
  }

  dimension: isdefault_default_theme {
  label: "Isdefault Default Theme"
    description: ""
    type: yesno
    group_label: "Theme Configuration"
    sql: ${TABLE}.isdefault_default_theme ;;
    hidden: no
  }

  dimension: isdefault_supported_timezones_path {
  label: "Isdefault Supported Timezones Path"
    description: ""
    type: yesno
    group_label: "Timezone Configuration"
    sql: ${TABLE}.isdefault_supported_timezones_path ;;
    hidden: no
  }

  dimension: enable {
  label: "Enable"
    description: ""
    type: yesno
    group_label: "Webrtc Configuration"
    sql: ${TABLE}.enable ;;
    hidden: no
  }

  dimension: isdefault_stun_uri {
  label: "Isdefault Stun Uri"
    description: ""
    type: yesno
    group_label: "Webrtc Configuration"
    sql: ${TABLE}.isdefault_stun_uri ;;
    hidden: no
  }

  dimension: isdefault_turn_uri {
  label: "Isdefault Turn Uri"
    description: ""
    type: yesno
    group_label: "Webrtc Configuration"
    sql: ${TABLE}.isdefault_turn_uri ;;
    hidden: no
  }

  dimension: id {
    description: ""
    type: string
    group_label: "Webrtc Configuration"
    sql: ${TABLE}.id ;;
    hidden: no
  }

  dimension: license_users {
    description: "The number of seats (users) provisioned to the license associated with the server (if a license is provisioned and active on the given logging date)."
    type: number
    sql: ${licenses.users} ;;
  }

  # DIMENSION GROUPS/DATES
  dimension_group: logging {
    label:  "   Logging"
    description: "The date that the servers state and configuration was logged. This table contains 1 row per server per day for all servers actively sending telemetry data."
    type: time
    timeframes: [date, week, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.date ;;
    hidden: no
  }

  dimension_group: first_active_telemetry {
    label: " First Security Telemetry"
    description: "The date the server first recorded telemetry data in the security diagnostics data (logged via security_update_check.go)."
    type: time
    timeframes: [date, week, month, year, fiscal_quarter, fiscal_year]
    sql: ${server_fact.first_telemetry_active_date}::date ;;
  }

  dimension_group: last_active_telemetry {
    label: " Last Security Telemetry"
    description: "The date the server last recorded telemetry data in the security diagnostics data (logged via security_update_check.go)."
    type: time
    timeframes: [date, week, month, year, fiscal_quarter, fiscal_year]
    sql: ${server_fact.last_telemetry_active_date}::date ;;
  }

  dimension_group: last_mm2_telemetry {
    label: " Last Diagnostics Telemetry"
    description: "The date the server last recorded diagnostics telemetry (logged via diagnostics.go)."
    type: time
    timeframes: [date, week, month, year, fiscal_quarter, fiscal_year]
    sql: ${server_fact.last_mm2_telemetry_date}::date ;;
  }

  dimension_group: first_mm2_telemetry {
    label: " First Diagnostics Telemetry"
    description: "The date the server first recorded diagnostics telemetry (logged via diagnostics.go)."
    type: time
    timeframes: [date, week, month, year, fiscal_quarter, fiscal_year]
    sql: ${server_fact.first_mm2_telemetry_date}::date ;;
  }

  dimension_group: timestamp {
  description: ""
  type: time
    timeframes: [date, week, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.timestamp ;;
    hidden: yes
  }

  dimension: days_since_first_telemetry_enabled {
    label: "Days Since First Telemetry Enabled"
    description: "Displays the age in days of the server. Age is calculated as days between the first active date (first date telemetry enabled) and logging date of the record."
    type: number
    sql: datediff(day, COALESCE(${server_fact.first_active_date}, ${server_fact.first_telemetry_active_date}, ${nps_server_daily_score.server_install_date}), ${logging_date}::date) ;;
  }

  dimension: days_since_first_telemetry_enabled_band {
    label: "Days Since First Telemetry Band"
    description: "Displays the age in days of the server bucketed into groupings. Age is calculated as days between the first active date (first date telemetry enabled) and logging date of the record."
    type: tier
    style: integer
    tiers: [1,7,31,61,91,181,366,731]
    sql: ${days_since_first_telemetry_enabled} ;;
  }

  dimension: days_from_first_telemetry_to_paid_license {
    label: "Days to Paid License"
    description: "The number of days between the servers first telemetry date and it's first date recording an association with a paid license key."
    type: number
    sql: --CASE WHEN datediff(day, COALESCE(${server_fact.first_active_date}, ${nps_server_daily_score.server_install_date}), ${server_fact.first_paid_license_date}) < 0 THEN 0 ELSE
          datediff(day, COALESCE(${server_fact.first_active_date}, ${nps_server_daily_score.server_install_date}), ${server_fact.first_paid_license_date})
          --END
          ;;
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
    sql: CASE WHEN DATEDIFF(DAY, ${server_fact.first_trial_license_date}, ${server_fact.first_paid_license_date}) < 0 THEN 0 ELSE DATEDIFF(DAY, ${server_fact.first_trial_license_date}, ${server_fact.first_paid_license_date}) END ;;
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
    tiers: [1,7,31,61,91,181,366,731]
    sql: ${days_from_first_telemetry_to_paid_license} ;;
  }


  # MEASURES
  measure: count {
    label: " Count"
    description: "Count of rows/occurrences."
    type: count
  }

  measure: server_count {
    label: " Server Count"
    description: "The distinct count of Server s per grouping."
    type: count_distinct
    sql: ${server_id} ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: server_count_ttr {
    label: "   Server Count (Trailing 3 Releases)"
    group_label: " Server Counts"
    description: "Use this for counting all distinct Server ID's on the latest 3 version releases across dimensions. This measure is a composite of TEDAS servers and additional data sources that logged the server on the given logging date."
    type: count_distinct
    sql: CASE WHEN ${server_version_major_int}::float >= (
                                                    SELECT MIN((split_part(version, '.', 1) || '.' || split_part(version, '.', 2))::float)
                                                    FROM MATTERMOST.VERSION_RELEASE_DATES
                                                    WHERE release_number >= (SELECT MAX(release_number-3) FROM MATTERMOST.VERSION_RELEASE_DATES WHERE release_date < CURRENT_DATE)
                                                    AND release_date < CURRENT_DATE
                                                    )::float
             AND SPLIT_PART(${server_version_major_int}, '.', 2)::float >= (SELECT MIN(split_part(version, '.', 2))
                                                    FROM MATTERMOST.VERSION_RELEASE_DATES
                                                    WHERE release_number >= (SELECT MAX(release_number-3) FROM MATTERMOST.VERSION_RELEASE_DATES WHERE release_date < CURRENT_DATE)
                                                    AND release_date < CURRENT_DATE)::float THEN ${server_id} ELSE NULL END;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: active_user_count_sum {
    description: "The sum of security telemetry-enabled Active Users per grouping."
    group_label: " User Counts: Security Telemetry"
    type: number
    sql: SUM(${active_user_count}) ;;
  }

  measure: active_user_count_max {
    description: "The max of security telemetry-enabled Active Users per grouping."
    group_label: " User Counts: Security Telemetry"
    type: number
    sql: MAX(${active_user_count}) ;;
  }

  measure: user_count_sum {
    description: "The sum of security telemetry-enabled Registered Users per grouping."
    group_label: " User Counts: Security Telemetry"
    type: number
    sql: SUM(${user_count}) ;;
  }

  measure: user_count_max {
    description: "The max of security telemetry-enabled User Count per grouping."
    group_label: " User Counts: Security Telemetry"
    type: number
    sql: MAX(${user_count}) ;;
  }

  measure: system_admins_sum {
    description: "The sum of diagnostics telemetry-enabled System Admins per grouping."
    group_label: " User Counts: Security Telemetry"
    type: number
    sql: SUM(${system_admins}) ;;
  }

  measure: system_admins_max {
    description: "The sum of diagnostics telemetry-enabled System Admins per grouping."
    group_label: " User Counts: Security Telemetry"
    type: number
    sql: MAX(${system_admins}) ;;
  }

  measure: in_security_count {
    label: "  TEDAS Servers"
    description: "The count of servers In Security."
    group_label: " Server Counts"
    type: count_distinct
    sql: case when ${in_security} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: in_mm2_server_count {
    label: " Mattermost2 Servers"
    description: "The count of servers In Mm2 Server."
    group_label: " Server Counts"
    type: count_distinct
    sql: case when ${in_mm2_server} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: tracking_disabled_count {
    label: "Servers w/ Tracking Disabled"
    description: "The count of servers Tracking Disabled."
    group_label: " Server Counts"
    type: count_distinct
    sql: case when ${tracking_disabled} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: has_dupes_count {
    label: "Servers w/ Dupes"
    description: "The count of servers Has Dupes."
    group_label: " Server Counts"
    type: count_distinct
    sql: case when ${has_dupes} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: has_multi_ips_count {
    label: "Servers w/ Multiple IP's"
    description: "The count of servers Has Multi Ips."
    group_label: " Server Counts"
    type: count_distinct
    sql: case when ${has_multi_ips} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: active_users_sum {
    description: "The sum of Active Users per grouping."
    group_label: "Activity Diagnostics"
    type: number
    sql: SUM(${active_users}) ;;
    hidden: yes
  }

  measure: active_users_avg {
    description: "The average Active Users per grouping."
    group_label: "Activity Diagnostics"
    type: average
    sql: ${active_users} ;;
    value_format_name: decimal_1
    hidden: yes
  }

  measure: active_users_median {
    description: "The median Active Users per grouping."
    group_label: "Activity Diagnostics"
    type: median
    sql: ${active_users} ;;
    value_format_name: decimal_1
    hidden: yes
  }

  measure: active_users_daily_sum {
    description: "The sum of Active Users Daily per grouping."
    group_label: "Activity Diagnostics"
    type: number
    sql: SUM(${active_users_daily}) ;;
  }

  measure: active_users_daily_max {
    description: "The max of Active Users Daily per grouping."
    group_label: "Activity Diagnostics"
    type: number
    sql: MAX(${active_users_daily}) ;;
  }

  measure: active_users_daily_avg {
    description: "The average Active Users Daily per grouping."
    group_label: "Activity Diagnostics"
    type: number
    sql: avg(${active_users_daily}) ;;
    value_format_name: decimal_1
  }

  measure: active_users_daily_median {
    description: "The median Active Users Daily per grouping."
    group_label: "Activity Diagnostics"
    type: number
    sql: median(${active_users_daily}) ;;
    value_format_name: decimal_1
  }

  measure: active_users_monthly_sum {
    description: "The sum of Active Users Monthly per grouping."
    group_label: "Activity Diagnostics"
    type: number
    sql: SUM(${active_users_monthly}) ;;
    value_format_name: decimal_1
  }

  measure: active_users_monthly_max {
    description: "The max of Active Users Monthly per grouping."
    group_label: "Activity Diagnostics"
    type: number
    sql: MAX(${active_users_monthly}) ;;
  }

  measure: active_users_monthly_avg {
    description: "The average Active Users Monthly per grouping."
    group_label: "Activity Diagnostics"
    type: number
    sql: AVG(${active_users_monthly}) ;;
    value_format_name: decimal_1
  }

  measure: bot_accounts_sum {
    description: "The sum of Bot Accounts per grouping."
    group_label: "Activity Diagnostics"
    type: sum
    sql: ${bot_accounts} ;;
  }

  measure: bot_accounts_avg {
    description: "The average Bot Accounts per grouping."
    group_label: "Activity Diagnostics"
    type: average
    sql: ${bot_accounts} ;;
    value_format_name: decimal_1
  }

  measure: bot_posts_previous_day_sum {
    description: "The sum of Bot Posts Previous Day per grouping."
    group_label: "Activity Diagnostics"
    type: sum
    sql: ${bot_posts_previous_day} ;;
  }

  measure: bot_posts_previous_day_avg {
    description: "The average Bot Posts Previous Day per grouping."
    group_label: "Activity Diagnostics"
    type: average
    sql: ${bot_posts_previous_day} ;;
    value_format_name: decimal_1
  }

  measure: direct_message_channels_sum {
    description: "The sum of Direct Message Channels per grouping."
    group_label: "Activity Diagnostics"
    type: number
    sql: SUM(${direct_message_channels}) ;;
  }

  measure: direct_message_channels_max {
    description: "The max of Direct Message Channels per grouping."
    group_label: "Activity Diagnostics"
    type: number
    sql: MAX(${direct_message_channels}) ;;
  }

  measure: direct_message_channels_avg {
    description: "The average Direct Message Channels per grouping."
    group_label: "Activity Diagnostics"
    type: average
    sql: ${direct_message_channels} ;;
    value_format_name: decimal_1
  }

  measure: incoming_webhooks_sum {
    description: "The sum of Incoming Webhooks per grouping."
    group_label: "Activity Diagnostics"
    type: sum
    sql: ${incoming_webhooks} ;;
  }

  measure: incoming_webhooks_avg {
    description: "The average Incoming Webhooks per grouping."
    group_label: "Activity Diagnostics"
    type: average
    sql: ${incoming_webhooks} ;;
    value_format_name: decimal_1
  }

  measure: outgoing_webhooks_sum {
    description: "The sum of Outgoing Webhooks per grouping."
    group_label: "Activity Diagnostics"
    type: sum
    sql: ${outgoing_webhooks} ;;
  }

  measure: outgoing_webhooks_avg {
    description: "The average Outgoing Webhooks per grouping."
    group_label: "Activity Diagnostics"
    type: average
    sql: ${outgoing_webhooks} ;;
    value_format_name: decimal_1
  }

  measure: posts_sum {
    description: "The sum of Posts performed by all users across all servers per grouping (from activity server telemetry)."
    group_label: "Activity Diagnostics"
    type: number
    sql: SUM(${posts}) ;;
  }

  measure: posts_max {
    description: "The max of Posts performed by all users across all servers per grouping (from activity server telemetry)."
    group_label: "Activity Diagnostics"
    type: number
    sql: MAX(${posts}) ;;
  }

  measure: posts_avg {
    description: "The average Posts per grouping."
    group_label: "Activity Diagnostics"
    type: average
    value_format_name: decimal_1
    sql: ${posts} ;;
  }

  measure: posts_median {
    label: "Posts (Median)"
    description: "The average Posts per grouping."
    group_label: "Activity Diagnostics"
    type: median
    value_format_name: decimal_1
    sql: ${posts} ;;
  }

  measure: posts_previous_day_sum {
    description: "The sum of Posts Previous Day per grouping."
    group_label: "Activity Diagnostics"
    type: sum
    sql: ${posts_previous_day} ;;
  }

  measure: posts_previous_day_avg {
    description: "The average Posts Previous Day per grouping."
    group_label: "Activity Diagnostics"
    type: average
    sql: ${posts_previous_day} ;;
    value_format_name: decimal_1
  }

  measure: private_channels_sum {
    description: "The sum of Private Channels per grouping."
    group_label: "Activity Diagnostics"
    type: number
    sql: SUM(${private_channels}) ;;
  }

  measure: private_channels_max {
    description: "The max of Private Channels per grouping."
    group_label: "Activity Diagnostics"
    type: number
    sql: MAX(${private_channels}) ;;
  }

  measure: private_channels_avg {
    description: "The average Private Channels per grouping."
    group_label: "Activity Diagnostics"
    type: average
    sql: ${private_channels} ;;
    value_format_name: decimal_1
  }

  measure: private_channels_deleted_sum {
    description: "The sum of Private Channels Deleted per grouping."
    group_label: "Activity Diagnostics"
    type: sum
    sql: ${private_channels_deleted} ;;
  }

  measure: private_channels_deleted_avg {
    description: "The average Private Channels Deleted per grouping."
    group_label: "Activity Diagnostics"
    type: average
    sql: ${private_channels_deleted} ;;
    value_format_name: decimal_1
  }

  measure: public_channels_sum {
    description: "The sum of Public Channels per grouping."
    group_label: "Activity Diagnostics"
    type: number
    sql: SUM(${public_channels}) ;;
  }

  measure: public_channels_max {
    description: "The max of Public Channels per grouping."
    group_label: "Activity Diagnostics"
    type: number
    sql: MAX(${public_channels}) ;;
  }

  measure: public_channels_avg {
    description: "The average Public Channels per grouping."
    group_label: "Activity Diagnostics"
    type: average
    sql: ${public_channels} ;;
    value_format_name: decimal_1
  }

  measure: public_channels_deleted_sum {
    description: "The sum of Public Channels Deleted per grouping."
    group_label: "Activity Diagnostics"
    type: sum
    sql: ${public_channels_deleted} ;;
  }

  measure: public_channels_deleted_avg {
    description: "The average Public Channels Deleted per grouping."
    group_label: "Activity Diagnostics"
    type: average
    value_format_name: decimal_1
    sql: ${public_channels_deleted} ;;
  }

  measure: registered_deactivated_users_sum {
    description: "The sum of Registered Deactivated Users per grouping."
    group_label: "Activity Diagnostics"
    type: sum
    value_format_name: decimal_1
    sql: ${registered_deactivated_users} ;;
  }

  measure: registered_deactivated_users_avg {
    description: "The average Registered Deactivated Users per grouping."
    group_label: "Activity Diagnostics"
    type: average
    value_format_name: decimal_1
    sql: ${registered_deactivated_users} ;;
  }

  measure: registered_inactive_users_sum {
    description: "The sum of Registered Inactive Users per grouping."
    group_label: "Activity Diagnostics"
    type: sum
    value_format_name: decimal_1
    sql: ${registered_inactive_users} ;;
  }

  measure: registered_inactive_users_avg {
    description: "The average Registered Inactive Users per grouping."
    group_label: "Activity Diagnostics"
    type: average
    value_format_name: decimal_1
    sql: ${registered_inactive_users} ;;
  }

  measure: registered_users_sum {
    description: "The sum of Registered Users per grouping."
    group_label: "Activity Diagnostics"
    type: number
    value_format_name: decimal_0
    sql: SUM(${registered_users}) ;;
  }

  measure: registered_users_max {
    description: "The max of Registered Users per grouping."
    group_label: "Activity Diagnostics"
    type: number
    value_format_name: decimal_0
    sql: MAX(${registered_users}) ;;
  }

  measure: registered_users_avg {
    description: "The average Registered Users per grouping."
    group_label: "Activity Diagnostics"
    type: average
    value_format_name: decimal_0
    sql: ${registered_users} ;;
  }

  measure: slash_commands_sum {
    description: "The sum of Slash Commands per grouping."
    group_label: "Activity Diagnostics"
    type: sum
    value_format_name: decimal_0
    sql: ${slash_commands} ;;
  }

  measure: slash_commands_avg {
    description: "The average Slash Commands per grouping."
    group_label: "Activity Diagnostics"
    type: average
    value_format_name: decimal_1
    sql: ${slash_commands} ;;
  }

  measure: teams_sum {
    description: "The sum of Teams per grouping."
    group_label: "Activity Diagnostics"
    type: number
    value_format_name: decimal_0
    sql: SUM(${teams}) ;;
  }

  measure: teams_avg {
    description: "The average Teams per grouping."
    group_label: "Activity Diagnostics"
    type: average
    value_format_name: decimal_1
    sql: ${teams} ;;
  }

  measure: used_apiv3_count {
    label: "Servers w/ Activity Used Apiv3"
    description: "The count of servers with Activity Used Apiv3 enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${used_apiv3} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: isdefault_max_users_for_statistics_count {
    label: "Servers w/ Analytics Isdefault Max Users For Statistics"
    description: "The count of servers with Analytics Isdefault Max Users For Statistics enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${isdefault_max_users_for_statistics} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: allow_banner_dismissal_count {
    label: "Servers w/ Annoucument Allow Banner Dismissal"
    description: "The count of servers with Annoucument Allow Banner Dismissal enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${allow_banner_dismissal} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: enable_banner_count {
    label: "Servers w/ Annoucument Enable Banner"
    description: "The count of servers with Annoucument Enable Banner enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${enable_banner} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: isdefault_banner_color_count {
    label: "Servers w/ Annoucument Isdefault Banner Color"
    description: "The count of servers with Annoucument Isdefault Banner Color enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${isdefault_banner_color} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: isdefault_banner_text_color_count {
    label: "Servers w/ Annoucument Isdefault Banner Text Color"
    description: "The count of servers with Annoucument Isdefault Banner Text Color enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${isdefault_banner_text_color} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: enable_apiv3_client_count {
    label: "Servers w/ Client Requirements Enable Apiv3 Client"
    description: "The count of servers with Client Requirements Enable Apiv3 Client enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${enable_apiv3_client} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: enable_channel_viewed_messages_client_count {
    label: "Servers w/ Client Requirements Enable Channel Viewed Messages Client"
    description: "The count of servers with Client Requirements Enable Channel Viewed Messages Client enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${enable_channel_viewed_messages_client} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: enable_commands_client_count {
    label: "Servers w/ Client Requirements Enable Commands Client"
    description: "The count of servers with Client Requirements Enable Commands Client enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${enable_commands_client} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: enable_custom_emoji_client_count {
    label: "Servers w/ Client Requirements Enable Custom Emoji Client"
    description: "The count of servers with Client Requirements Enable Custom Emoji Client enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${enable_custom_emoji_client} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: enable_developer_client_count {
    label: "Servers w/ Client Requirements Enable Developer Client"
    description: "The count of servers with Client Requirements Enable Developer Client enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${enable_developer_client} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: enable_emoji_picker_client_count {
    label: "Servers w/ Client Requirements Enable Emoji Picker Client"
    description: "The count of servers with Client Requirements Enable Emoji Picker Client enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${enable_emoji_picker_client} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: enable_incoming_webhooks_client_count {
    label: "Servers w/ Client Requirements Enable Incoming Webhooks Client"
    description: "The count of servers with Client Requirements Enable Incoming Webhooks Client enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${enable_incoming_webhooks_client} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: enable_insecure_outgoing_connections_client_count {
    label: "Servers w/ Client Requirements Enable Insecure Outgoing Connections Client"
    description: "The count of servers with Client Requirements Enable Insecure Outgoing Connections Client enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${enable_insecure_outgoing_connections_client} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: enable_multifactor_authentication_client_count {
    label: "Servers w/ Client Requirements Enable Multifactor Authentication Client"
    description: "The count of servers with Client Requirements Enable Multifactor Authentication Client enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${enable_multifactor_authentication_client} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: enable_oauth_service_provider_client_count {
    label: "Servers w/ Client Requirements Enable Oauth Service Provider Client"
    description: "The count of servers with Client Requirements Enable Oauth Service Provider Client enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${enable_oauth_service_provider_client} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: enable_only_admin_integrations_client_count {
    label: "Servers w/ Client Requirements Enable Only Admin Integrations Client"
    description: "The count of servers with Client Requirements Enable Only Admin Integrations Client enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${enable_only_admin_integrations_client} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: advertise_address_count {
    label: "Servers w/ Cluster Advertise Address"
    description: "The count of servers with Cluster Advertise Address enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${advertise_address} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: bind_address_count {
    label: "Servers w/ Cluster Bind Address"
    description: "The count of servers with Cluster Bind Address enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${bind_address} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: enable_cluster_count {
    label: "Servers w/ Cluster Enable Cluster"
    description: "The count of servers with Cluster Enable Cluster enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${enable_cluster} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: network_interface_count {
    label: "Servers w/ Cluster Network Interface"
    description: "The count of servers with Cluster Network Interface enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${network_interface} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: read_only_config_count {
    label: "Servers w/ Cluster Read Only Config"
    description: "The count of servers with Cluster Read Only Config enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${read_only_config} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: use_experimental_gossip_count {
    label: "Servers w/ Cluster Use Experimental Gossip"
    description: "The count of servers with Cluster Use Experimental Gossip enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${use_experimental_gossip} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: use_ip_address_count {
    label: "Servers w/ Cluster Use Ip Address"
    description: "The count of servers with Cluster Use Ip Address enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${use_ip_address} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: enable_compliance_count {
    label: "Servers w/ Compliance Enable Compliance"
    description: "The count of servers with Compliance Enable Compliance enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${enable_compliance} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: enable_compliance_daily_count {
    label: "Servers w/ Compliance Enable Compliance Daily"
    description: "The count of servers with Compliance Enable Compliance Daily enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${enable_compliance_daily} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: message_retention_days_sum {
    description: "The sum of Message Retention Days per grouping."
    group_label: "Data Retention Configuration"
    type: sum
    sql: ${message_retention_days} ;;
  }

  measure: message_retention_days_avg {
    description: "The average Message Retention Days per grouping."
    group_label: "Data Retention Configuration"
    type: average
    sql: ${message_retention_days} ;;
  }

  measure: file_retention_days_sum {
    description: "The sum of File Retention Days per grouping."
    group_label: "Data Retention Configuration"
    type: sum
    sql: ${file_retention_days} ;;
  }

  measure: file_retention_days_avg {
    description: "The average File Retention Days per grouping."
    group_label: "Data Retention Configuration"
    type: average
    sql: ${file_retention_days} ;;
  }

  measure: enable_message_deletion_count {
    label: "Servers w/ Data Retention Enable Message Deletion"
    description: "The count of servers with Data Retention Enable Message Deletion enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${enable_message_deletion} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: enable_file_deletion_count {
    label: "Servers w/ Data Retention Enable File Deletion"
    description: "The count of servers with Data Retention Enable File Deletion enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${enable_file_deletion} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: experimental_timezone_count {
    label: "Servers w/ Display Experimental Timezone"
    description: "The count of servers with Display Experimental Timezone enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${experimental_timezone} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: isdefault_custom_url_schemes_count {
    label: "Servers w/ Display Isdefault Custom Url Schemes"
    description: "The count of servers with Display Isdefault Custom Url Schemes enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${isdefault_custom_url_schemes} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: enable_autocomplete_count {
    label: "Servers w/ ElasticSearch Enable Autocomplete"
    description: "The count of servers with ElasticSearch Enable Autocomplete enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${enable_autocomplete} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: enable_indexing_count {
    label: "Servers w/ ElasticSearch Enable Indexing"
    description: "The count of servers with ElasticSearch Enable Indexing enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${enable_indexing} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: enable_searching_count {
    label: "Servers w/ ElasticSearch Enable Searching"
    description: "The count of servers with ElasticSearch Enable Searching enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${enable_searching} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: isdefault_connection_url_count {
    label: "Servers w/ ElasticSearch Isdefault Connection Url"
    description: "The count of servers with ElasticSearch Isdefault Connection Url enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${isdefault_connection_url} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: isdefault_index_prefix_count {
    label: "Servers w/ ElasticSearch Isdefault Index Prefix"
    description: "The count of servers with ElasticSearch Isdefault Index Prefix enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${isdefault_index_prefix} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: isdefault_password_count {
    label: "Servers w/ ElasticSearch Isdefault Password"
    description: "The count of servers with ElasticSearch Isdefault Password enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${isdefault_password} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: isdefault_username_count {
    label: "Servers w/ ElasticSearch Isdefault Username"
    description: "The count of servers with ElasticSearch Isdefault Username enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${isdefault_username} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: live_indexing_batch_size_sum {
    description: "The sum of Live Indexing Batch Size per grouping."
    group_label: "ElasticSearch Configuration"
    type: sum
    sql: ${live_indexing_batch_size} ;;
  }

  measure: live_indexing_batch_size_avg {
    description: "The average Live Indexing Batch Size per grouping."
    group_label: "ElasticSearch Configuration"
    type: average
    sql: ${live_indexing_batch_size} ;;
  }

  measure: skip_tls_verification_count {
    label: "Servers w/ ElasticSearch Skip Tls Verification"
    description: "The count of servers with ElasticSearch Skip Tls Verification enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${skip_tls_verification} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: sniff_count {
    label: "Servers w/ ElasticSearch Sniff"
    description: "The count of servers with ElasticSearch Sniff enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${sniff} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: enable_email_batching_count {
    label: "Servers w/ Email Enable Email Batching"
    description: "The count of servers with Email Enable Email Batching enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${enable_email_batching} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: enable_preview_mode_banner_count {
    label: "Servers w/ Email Enable Preview Mode Banner"
    description: "The count of servers with Email Enable Preview Mode Banner enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${enable_preview_mode_banner} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: enable_sign_in_with_email_count {
    label: "Servers w/ Email Enable Sign In With Email"
    description: "The count of servers with Email Enable Sign In With Email enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${enable_sign_in_with_email} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: enable_sign_in_with_username_count {
    label: "Servers w/ Email Enable Sign In With Username"
    description: "The count of servers with Email Enable Sign In With Username enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${enable_sign_in_with_username} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: enable_sign_up_with_email_count {
    label: "Servers w/ Email Enable Sign Up With Email"
    description: "The count of servers with Email Enable Sign Up With Email enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${enable_sign_up_with_email} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: enable_smtp_auth_count {
    label: "Servers w/ Email Enable Smtp Auth"
    description: "The count of servers with Email Enable Smtp Auth enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${enable_smtp_auth} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: isdefault_feedback_email_count {
    label: "Servers w/ Email Isdefault Feedback Email"
    description: "The count of servers with Email Isdefault Feedback Email enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${isdefault_feedback_email} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: isdefault_feedback_name_count {
    label: "Servers w/ Email Isdefault Feedback Name"
    description: "The count of servers with Email Isdefault Feedback Name enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${isdefault_feedback_name} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: isdefault_feedback_organization_count {
    label: "Servers w/ Email Isdefault Feedback Organization"
    description: "The count of servers with Email Isdefault Feedback Organization enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${isdefault_feedback_organization} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: isdefault_login_button_border_color_email_count {
    label: "Servers w/ Email Isdefault Login Button Border Color Email"
    description: "The count of servers with Email Isdefault Login Button Border Color Email enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${isdefault_login_button_border_color_email} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: isdefault_login_button_color_email_count {
    label: "Servers w/ Email Isdefault Login Button Color Email"
    description: "The count of servers with Email Isdefault Login Button Color Email enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${isdefault_login_button_color_email} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: isdefault_login_button_text_color_email_count {
    label: "Servers w/ Email Isdefault Login Button Text Color Email"
    description: "The count of servers with Email Isdefault Login Button Text Color Email enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${isdefault_login_button_text_color_email} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: isdefault_reply_to_address_count {
    label: "Servers w/ Email Isdefault Reply To Address"
    description: "The count of servers with Email Isdefault Reply To Address enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${isdefault_reply_to_address} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: require_email_verification_count {
    label: "Servers w/ Email Require Email Verification"
    description: "The count of servers with Email Require Email Verification enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${require_email_verification} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: send_email_notifications_count {
    label: "Servers w/ Email Send Email Notifications"
    description: "The count of servers with Email Send Email Notifications enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${send_email_notifications} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: send_push_notifications_count {
    label: "Servers w/ Email Send Push Notifications"
    description: "The count of servers with Email Send Push Notifications enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${send_push_notifications} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: skip_server_certificate_verification_count {
    label: "Servers w/ Email Skip Server Certificate Verification"
    description: "The count of servers with Email Skip Server Certificate Verification enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${skip_server_certificate_verification} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: use_channel_in_email_notifications_count {
    label: "Servers w/ Email Use Channel In Email Notifications"
    description: "The count of servers with Email Use Channel In Email Notifications enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${use_channel_in_email_notifications} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: client_side_cert_enable_count {
    label: "Servers w/ Experimental Client Side Cert Enable"
    description: "The count of servers with Experimental Client Side Cert Enable enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${client_side_cert_enable} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: enable_click_to_reply_count {
    label: "Servers w/ Experimental Enable Click To Reply"
    description: "The count of servers with Experimental Enable Click To Reply enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${enable_click_to_reply} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: enable_post_metadata_count {
    label: "Servers w/ Experimental Enable Post Metadata"
    description: "The count of servers with Experimental Enable Post Metadata enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${enable_post_metadata} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: isdefault_client_side_cert_check_count {
    label: "Servers w/ Experimental Isdefault Client Side Cert Check"
    description: "The count of servers with Experimental Isdefault Client Side Cert Check enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${isdefault_client_side_cert_check} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: restrict_system_admin_count {
    label: "Servers w/ Experimental Restrict System Admin"
    description: "The count of servers with Experimental Restrict System Admin enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${restrict_system_admin} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: use_new_saml_library_count {
    label: "Servers w/ Experimental Use New Saml Library"
    description: "The count of servers with Experimental Use New Saml Library enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${use_new_saml_library} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: enable_experimental_extensions_count {
    label: "Servers w/ Extension Enable Experimental Extensions"
    description: "The count of servers with Extension Enable Experimental Extensions enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${enable_experimental_extensions} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: amazon_s3_signv2_count {
    label: "Servers w/ File Amazon S3 Signv2"
    description: "The count of servers with File Amazon S3 Signv2 enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${amazon_s3_signv2} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: amazon_s3_sse_count {
    label: "Servers w/ File Amazon S3 Sse"
    description: "The count of servers with File Amazon S3 Sse enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${amazon_s3_sse} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: amazon_s3_ssl_count {
    label: "Servers w/ File Amazon S3 Ssl"
    description: "The count of servers with File Amazon S3 Ssl enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${amazon_s3_ssl} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: amazon_s3_trace_count {
    label: "Servers w/ File Amazon S3 Trace"
    description: "The count of servers with File Amazon S3 Trace enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${amazon_s3_trace} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: enable_file_attachments_count {
    label: "Servers w/ File Enable File Attachments"
    description: "The count of servers with File Enable File Attachments enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${enable_file_attachments} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: enable_mobile_download_count {
    label: "Servers w/ File Enable Mobile Download"
    description: "The count of servers with File Enable Mobile Download enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${enable_mobile_download} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: enable_mobile_upload_count {
    label: "Servers w/ File Enable Mobile Upload"
    description: "The count of servers with File Enable Mobile Upload enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${enable_mobile_upload} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: enable_public_links_count {
    label: "Servers w/ File Enable Public Links"
    description: "The count of servers with File Enable Public Links enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${enable_public_links} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: isabsolute_directory_count {
    label: "Servers w/ File Isabsolute Directory"
    description: "The count of servers with File Isabsolute Directory enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${isabsolute_directory} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: isdefault_directory_count {
    label: "Servers w/ File Isdefault Directory"
    description: "The count of servers with File Isdefault Directory enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${isdefault_directory} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: allow_email_accounts_count {
    label: "Servers w/ Guest Account Allow Email Accounts"
    description: "The count of servers with Guest Account Allow Email Accounts enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${allow_email_accounts} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: enable_guest_accounts_count {
    label: "Servers w/ Guest Account Enable Guest Accounts"
    description: "The count of servers with Guest Account Enable Guest Accounts enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${enable_guest_accounts} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: enforce_multifactor_authentication_guest_count {
    label: "Servers w/ Guest Account Enforce Multifactor Authentication Guest"
    description: "The count of servers with Guest Account Enforce Multifactor Authentication Guest enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${enforce_multifactor_authentication_guest} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: isdefault_restrict_creation_to_domains_count {
    label: "Servers w/ Guest Account Isdefault Restrict Creation To Domains"
    description: "The count of servers with Guest Account Isdefault Restrict Creation To Domains enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${isdefault_restrict_creation_to_domains} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: enable_image_proxy_count {
    label: "Servers w/ Image Proxy Enable Image Proxy"
    description: "The count of servers with Image Proxy Enable Image Proxy enabled."
    type: count_distinct
    group_label: " Server Counts"
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
    sql: case when ${enable_image_proxy} then ${server_id} else null end ;;
  }

  measure: isdefault_remote_image_proxy_options_count {
    label: "Servers w/ Image Proxy Isdefault Remote Image Proxy Options"
    description: "The count of servers with Image Proxy Isdefault Remote Image Proxy Options enabled."
    type: count_distinct
    group_label: " Server Counts"
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
    sql: case when ${isdefault_remote_image_proxy_options} then ${server_id} else null end ;;
  }

  measure: isdefault_remote_image_proxy_url_count {
    label: "Servers w/ Image Proxy Isdefault Remote Image Proxy Url"
    description: "The count of servers with Image Proxy Isdefault Remote Image Proxy Url enabled."
    type: count_distinct
    group_label: " Server Counts"
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
    sql: case when ${isdefault_remote_image_proxy_url} then ${server_id} else null end ;;
  }

  measure: enable_ldap_count {
    label: "Servers w/ Ldap Enable Ldap"
    description: "The count of servers with Ldap Enable Ldap enabled."
    type: count_distinct
    group_label: " Server Counts"
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
    sql: case when ${enable_ldap} then ${server_id} else null end ;;
  }

  measure: enable_admin_filter_count {
    label: "Servers w/ Ldap Enable Admin Filter"
    description: "The count of servers with Ldap Enable Admin Filter enabled."
    type: count_distinct
    group_label: " Server Counts"
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
    sql: case when ${enable_admin_filter} then ${server_id} else null end ;;
  }

  measure: enable_sync_count {
    label: "Servers w/ Ldap Enable Sync"
    description: "The count of servers with Ldap Enable Sync enabled."
    type: count_distinct
    group_label: " Server Counts"
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
    sql: case when ${enable_sync} then ${server_id} else null end ;;
  }

  measure: isdefault_email_attribute_ldap_count {
    label: "Servers w/ Ldap Isdefault Email Attribute Ldap"
    description: "The count of servers with Ldap Isdefault Email Attribute Ldap enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${isdefault_email_attribute_ldap} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: isdefault_first_name_attribute_ldap_count {
    label: "Servers w/ Ldap Isdefault First Name Attribute Ldap"
    description: "The count of servers with Ldap Isdefault First Name Attribute Ldap enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${isdefault_first_name_attribute_ldap} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: isdefault_group_display_name_attribute_count {
    label: "Servers w/ Ldap Isdefault Group Display Name Attribute"
    description: "The count of servers with Ldap Isdefault Group Display Name Attribute enabled."
    type: count_distinct
    group_label: " Server Counts"
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
    sql: case when ${isdefault_group_display_name_attribute} then ${server_id} else null end ;;
  }

  measure: isdefault_group_id_attribute_count {
    label: "Servers w/ Ldap Isdefault Group Id Attribute"
    description: "The count of servers with Ldap Isdefault Group Id Attribute enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${isdefault_group_id_attribute} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: isdefault_id_attribute_ldap_count {
    label: "Servers w/ Ldap Isdefault Id Attribute Ldap"
    description: "The count of servers with Ldap Isdefault Id Attribute Ldap enabled."
    type: count_distinct
    group_label: " Server Counts"
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
    sql: case when ${isdefault_id_attribute_ldap} then ${server_id} else null end ;;
  }

  measure: isdefault_last_name_attribute_ldap_count {
    label: "Servers w/ Ldap Isdefault Last Name Attribute Ldap"
    description: "The count of servers with Ldap Isdefault Last Name Attribute Ldap enabled."
    type: count_distinct
    group_label: " Server Counts"
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
    sql: case when ${isdefault_last_name_attribute_ldap} then ${server_id} else null end ;;
  }

  measure: isdefault_login_button_border_color_ldap_count {
    label: "Servers w/ Ldap Isdefault Login Button Border Color Ldap"
    description: "The count of servers with Ldap Isdefault Login Button Border Color Ldap enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${isdefault_login_button_border_color_ldap} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: isdefault_login_button_color_ldap_count {
    label: "Servers w/ Ldap Isdefault Login Button Color Ldap"
    description: "The count of servers with Ldap Isdefault Login Button Color Ldap enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${isdefault_login_button_color_ldap} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: isdefault_login_button_text_color_ldap_count {
    label: "Servers w/ Ldap Isdefault Login Button Text Color Ldap"
    description: "The count of servers with Ldap Isdefault Login Button Text Color Ldap enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${isdefault_login_button_text_color_ldap} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: isdefault_login_field_name_count {
    label: "Servers w/ Ldap Isdefault Login Field Name"
    description: "The count of servers with Ldap Isdefault Login Field Name enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${isdefault_login_field_name} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: isdefault_login_id_attribute_count {
    label: "Servers w/ Ldap Isdefault Login Id Attribute"
    description: "The count of servers with Ldap Isdefault Login Id Attribute enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${isdefault_login_id_attribute} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: isdefault_nickname_attribute_ldap_count {
    label: "Servers w/ Ldap Isdefault Nickname Attribute Ldap"
    description: "The count of servers with Ldap Isdefault Nickname Attribute Ldap enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${isdefault_nickname_attribute_ldap} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: isdefault_position_attribute_ldap_count {
    label: "Servers w/ Ldap Isdefault Position Attribute Ldap"
    description: "The count of servers with Ldap Isdefault Position Attribute Ldap enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${isdefault_position_attribute_ldap} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: isdefault_username_attribute_ldap_count {
    label: "Servers w/ Ldap Isdefault Username Attribute Ldap"
    description: "The count of servers with Ldap Isdefault Username Attribute Ldap enabled."
    type: count_distinct
    group_label: " Server Counts"
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
    sql: case when ${isdefault_username_attribute_ldap} then ${server_id} else null end ;;
  }

  measure: isempty_admin_filter_count {
    label: "Servers w/ Ldap Isempty Admin Filter"
    description: "The count of servers with Ldap Isempty Admin Filter enabled."
    type: count_distinct
    group_label: " Server Counts"
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
    sql: case when ${isempty_admin_filter} then ${server_id} else null end ;;
  }

  measure: isempty_group_filter_count {
    label: "Servers w/ Ldap Isempty Group Filter"
    description: "The count of servers with Ldap Isempty Group Filter enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${isempty_group_filter} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: isempty_guest_filter_count {
    label: "Servers w/ Ldap Isempty Guest Filter"
    description: "The count of servers with Ldap Isempty Guest Filter enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${isempty_guest_filter} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: skip_certificate_verification_count {
    label: "Servers w/ Ldap Skip Certificate Verification"
    description: "The count of servers with Ldap Skip Certificate Verification enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${skip_certificate_verification} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: feature_cluster_count {
    label: "Servers w/ License Feature Cluster"
    description: "The count of servers with License Feature Cluster enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${feature_cluster} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: feature_compliance_count {
    label: "Servers w/ License Feature Compliance"
    description: "The count of servers with License Feature Compliance enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${feature_compliance} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: feature_custom_brand_count {
    label: "Servers w/ License Feature Custom Brand"
    description: "The count of servers with License Feature Custom Brand enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${feature_custom_brand} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: feature_custom_permissions_schemes_count {
    label: "Servers w/ License Feature Custom Permissions Schemes"
    description: "The count of servers with License Feature Custom Permissions Schemes enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${feature_custom_permissions_schemes} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: feature_data_retention_count {
    label: "Servers w/ License Feature Data Retention"
    description: "The count of servers with License Feature Data Retention enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${feature_data_retention} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: feature_elastic_search_count {
    label: "Servers w/ License Feature Elastic Search"
    description: "The count of servers with License Feature Elastic Search enabled."
    type: count_distinct
    group_label: " Server Counts"
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
    sql: case when ${feature_elastic_search} then ${server_id} else null end ;;
  }

  measure: feature_email_notification_contents_count {
    label: "Servers w/ License Feature Email Notification Contents"
    description: "The count of servers with License Feature Email Notification Contents enabled."
    type: count_distinct
    group_label: " Server Counts"
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
    sql: case when ${feature_email_notification_contents} then ${server_id} else null end ;;
  }

  measure: feature_future_count {
    label: "Servers w/ License Feature Future"
    description: "The count of servers with License Feature Future enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${feature_future} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: feature_google_count {
    label: "Servers w/ License Feature Google"
    description: "The count of servers with License Feature Google enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${feature_google} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: feature_guest_accounts_count {
    label: "Servers w/ License Feature Guest Accounts"
    description: "The count of servers with License Feature Guest Accounts enabled."
    type: count_distinct
    group_label: " Server Counts"
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
    sql: case when ${feature_guest_accounts} then ${server_id} else null end ;;
  }

  measure: feature_guest_accounts_permissions_count {
    label: "Servers w/ License Feature Guest Accounts Permissions"
    description: "The count of servers with License Feature Guest Accounts Permissions enabled."
    type: count_distinct
    group_label: " Server Counts"
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
    sql: case when ${feature_guest_accounts_permissions} then ${server_id} else null end ;;
  }

  measure: feature_id_loaded_count {
    label: "Servers w/ License Feature Id Loaded"
    description: "The count of servers with License Feature Id Loaded enabled."
    type: count_distinct
    group_label: " Server Counts"
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
    sql: case when ${feature_id_loaded} then ${server_id} else null end ;;
  }

  measure: feature_ldap_count {
    label: "Servers w/ License Feature Ldap"
    description: "The count of servers with License Feature Ldap enabled."
    type: count_distinct
    group_label: " Server Counts"
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
    sql: case when ${feature_ldap} then ${server_id} else null end ;;
  }

  measure: feature_ldap_groups_count {
    label: "Servers w/ License Feature Ldap Groups"
    description: "The count of servers with License Feature Ldap Groups enabled."
    type: count_distinct
    group_label: " Server Counts"
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
    sql: case when ${feature_ldap_groups} then ${server_id} else null end ;;
  }

  measure: feature_lock_teammate_name_display_count {
    label: "Servers w/ License Feature Lock Teammate Name Display"
    description: "The count of servers with License Feature Lock Teammate Name Display enabled."
    type: count_distinct
    group_label: " Server Counts"
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
    sql: case when ${feature_lock_teammate_name_display} then ${server_id} else null end ;;
  }

  measure: feature_message_export_count {
    label: "Servers w/ License Feature Message Export"
    description: "The count of servers with License Feature Message Export enabled."
    type: count_distinct
    group_label: " Server Counts"
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
    sql: case when ${feature_message_export} then ${server_id} else null end ;;
  }

  measure: feature_metrics_count {
    label: "Servers w/ License Feature Metrics"
    description: "The count of servers with License Feature Metrics enabled."
    type: count_distinct
    group_label: " Server Counts"
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
    sql: case when ${feature_metrics} then ${server_id} else null end ;;
  }

  measure: feature_mfa_count {
    label: "Servers w/ License Feature Mfa"
    description: "The count of servers with License Feature Mfa enabled."
    type: count_distinct
    group_label: " Server Counts"
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
    sql: case when ${feature_mfa} then ${server_id} else null end ;;
  }

  measure: feature_mhpns_count {
    label: "Servers w/ License Feature Mhpns"
    description: "The count of servers with License Feature Mhpns enabled."
    type: count_distinct
    group_label: " Server Counts"
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
    sql: case when ${feature_mhpns} then ${server_id} else null end ;;
  }

  measure: feature_office365_count {
    label: "Servers w/ License Feature Office365"
    description: "The count of servers with License Feature Office365 enabled."
    type: count_distinct
    group_label: " Server Counts"
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
    sql: case when ${feature_office365} then ${server_id} else null end ;;
  }

  measure: feature_password_count {
    label: "Servers w/ License Feature Password"
    description: "The count of servers with License Feature Password enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${feature_password} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: feature_saml_count {
    label: "Servers w/ License Feature Saml"
    description: "The count of servers with License Feature Saml enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${feature_saml} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: console_json_log_count {
    label: "Servers w/ Log Console Json Log"
    description: "The count of servers with Log Console Json Log enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${console_json_log} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: enable_console_log_count {
    label: "Servers w/ Log Enable Console Log"
    description: "The count of servers with Log Enable Console Log enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${enable_console_log} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: enable_file_log_count {
    label: "Servers w/ Log Enable File Log"
    description: "The count of servers with Log Enable File Log enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${enable_file_log} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: enable_webhook_debugging_count {
    label: "Servers w/ Log Enable Webhook Debugging"
    description: "The count of servers with Log Enable Webhook Debugging enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${enable_webhook_debugging} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: file_json_log_count {
    label: "Servers w/ Log File Json Log"
    description: "The count of servers with Log File Json Log enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${file_json_log} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: isdefault_file_format_count {
    label: "Servers w/ Log Isdefault File Format"
    description: "The count of servers with Log Isdefault File Format enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${isdefault_file_format} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: isdefault_file_location_log_count {
    label: "Servers w/ Log Isdefault File Location Log"
    description: "The count of servers with Log Isdefault File Location Log enabled."
    type: count_distinct
    group_label: " Server Counts"
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
    sql: case when ${isdefault_file_location_log} then ${server_id} else null end ;;
  }

  measure: enable_message_export_count {
    label: "Servers w/ Message Export Enable Message Export"
    description: "The count of servers with Message Export Enable Message Export enabled."
    type: count_distinct
    group_label: " Server Counts"
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
    sql: case when ${enable_message_export} then ${server_id} else null end ;;
  }

  measure: is_default_global_relay_email_address_count {
    label: "Servers w/ Message Export Is Default Global Relay Email Address"
    description: "The count of servers with Message Export Is Default Global Relay Email Address enabled."
    type: count_distinct
    group_label: " Server Counts"
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
    sql: case when ${is_default_global_relay_email_address} then ${server_id} else null end ;;
  }

  measure: is_default_global_relay_smtp_password_count {
    label: "Servers w/ Message Export Is Default Global Relay Smtp Password"
    description: "The count of servers with Message Export Is Default Global Relay Smtp Password enabled."
    type: count_distinct
    group_label: " Server Counts"
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
    sql: case when ${is_default_global_relay_smtp_password} then ${server_id} else null end ;;
  }

  measure: is_default_global_relay_smtp_username_count {
    label: "Servers w/ Message Export Is Default Global Relay Smtp Username"
    description: "The count of servers with Message Export Is Default Global Relay Smtp Username enabled."
    type: count_distinct
    group_label: " Server Counts"
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
    sql: case when ${is_default_global_relay_smtp_username} then ${server_id} else null end ;;
  }

  measure: enable_metrics_count {
    label: "Servers w/ Metric Enable Metrics"
    description: "The count of servers with Metric Enable Metrics enabled."
    type: count_distinct
    group_label: " Server Counts"
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
    sql: case when ${enable_metrics} then ${server_id} else null end ;;
  }

  measure: isdefault_android_app_download_link_count {
    label: "Servers w/ Nativeapp Isdefault Android App Download Link"
    description: "The count of servers with Nativeapp Isdefault Android App Download Link enabled."
    type: count_distinct
    group_label: " Server Counts"
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
    sql: case when ${isdefault_android_app_download_link} then ${server_id} else null end ;;
  }

  measure: isdefault_app_download_link_count {
    label: "Servers w/ Nativeapp Isdefault App Download Link"
    description: "The count of servers with Nativeapp Isdefault App Download Link enabled."
    type: count_distinct
    group_label: " Server Counts"
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
    sql: case when ${isdefault_app_download_link} then ${server_id} else null end ;;
  }

  measure: isdefault_iosapp_download_link_count {
    label: "Servers w/ Nativeapp Isdefault Iosapp Download Link"
    description: "The count of servers with Nativeapp Isdefault Iosapp Download Link enabled."
    type: count_distinct
    group_label: " Server Counts"
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
    sql: case when ${isdefault_iosapp_download_link} then ${server_id} else null end ;;
  }

  measure: console_json_notifications_count {
    label: "Servers w/ Notifications Log Console Json Notifications"
    description: "The count of servers with Notifications Log Console Json Notifications enabled."
    type: count_distinct
    group_label: " Server Counts"
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
    sql: case when ${console_json_notifications} then ${server_id} else null end ;;
  }

  measure: enable_console_notifications_count {
    label: "Servers w/ Notifications Log Enable Console Notifications"
    description: "The count of servers with Notifications Log Enable Console Notifications enabled."
    type: count_distinct
    group_label: " Server Counts"
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
    sql: case when ${enable_console_notifications} then ${server_id} else null end ;;
  }

  measure: enable_file_notifications_count {
    label: "Servers w/ Notifications Log Enable File Notifications"
    description: "The count of servers with Notifications Log Enable File Notifications enabled."
    type: count_distinct
    group_label: " Server Counts"
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
    sql: case when ${enable_file_notifications} then ${server_id} else null end ;;
  }

  measure: file_json_notifications_count {
    label: "Servers w/ Notifications Log File Json Notifications"
    description: "The count of servers with Notifications Log File Json Notifications enabled."
    type: count_distinct
    group_label: " Server Counts"
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
    sql: case when ${file_json_notifications} then ${server_id} else null end ;;
  }

  measure: isdefault_file_location_notifications_count {
    label: "Servers w/ Notifications Log Isdefault File Location Notifications"
    description: "The count of servers with Notifications Log Isdefault File Location Notifications enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${isdefault_file_location_notifications} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: enable_office365_oauth_count {
    label: "Servers w/ Oauth Enable Office365 Oauth"
    description: "The count of servers with Oauth Enable Office365 Oauth enabled."
    type: count_distinct
    group_label: " Server Counts"
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
    sql: case when ${enable_office365_oauth} then ${server_id} else null end ;;
  }

  measure: enable_google_oauth_count {
    label: "Servers w/ Oauth Enable Google Oauth"
    description: "The count of servers with Oauth Enable Google Oauth enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${enable_google_oauth} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: enable_gitlab_oauth_count {
    label: "Servers w/ Oauth Enable Gitlab Oauth"
    description: "The count of servers with Oauth Enable Gitlab Oauth enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${enable_gitlab_oauth} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: enable_lowercase_count {
    label: "Servers w/ Password Enable Lowercase"
    description: "The count of servers with Password Enable Lowercase enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${enable_lowercase} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: enable_uppercase_count {
    label: "Servers w/ Password Enable Uppercase"
    description: "The count of servers with Password Enable Uppercase enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${enable_uppercase} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: enable_symbol_count {
    label: "Servers w/ Password Enable Symbol"
    description: "The count of servers with Password Enable Symbol enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${enable_symbol} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: enable_number_count {
    label: "Servers w/ Password Enable Number"
    description: "The count of servers with Password Enable Number enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${enable_number} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: phase_1_migration_complete_count {
    label: "Servers w/ Permissions General Phase 1 Migration Complete"
    description: "The count of servers with Permissions General Phase 1 Migration Complete enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${phase_1_migration_complete} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: phase_2_migration_complete_count {
    label: "Servers w/ Permissions General Phase 2 Migration Complete"
    description: "The count of servers with Permissions General Phase 2 Migration Complete enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${phase_2_migration_complete} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: allow_insecure_download_url_count {
    label: "Servers w/ Plugin Allow Insecure Download Url"
    description: "The count of servers with Plugin Allow Insecure Download Url enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${allow_insecure_download_url} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: automatic_prepackaged_plugins_count {
    label: "Servers w/ Plugin Automatic Prepackaged Plugins"
    description: "The count of servers with Plugin Automatic Prepackaged Plugins enabled."
    type: count_distinct
    group_label: " Server Counts"
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
    sql: case when ${automatic_prepackaged_plugins} then ${server_id} else null end ;;
  }

  measure: enable_plugins_count {
    label: "Servers w/ Plugin Enable Plugins"
    description: "The count of servers with Plugin Enable Plugins enabled."
    type: count_distinct
    group_label: " Server Counts"
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
    sql: case when ${enable_plugins} then ${server_id} else null end ;;
  }

  measure: enable_antivirus_count {
    label: "Servers w/ Plugin Enable Antivirus"
    description: "The count of servers with Plugin Enable Antivirus enabled."
    type: count_distinct
    group_label: " Server Counts"
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
    sql: case when ${enable_antivirus} then ${server_id} else null end ;;
  }

  measure: enable_autolink_count {
    label: "Servers w/ Plugin Enable Autolink"
    description: "The count of servers with Plugin Enable Autolink enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${enable_autolink} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: enable_aws_sns_count {
    label: "Servers w/ Plugin Enable Aws Sns"
    description: "The count of servers with Plugin Enable Aws Sns enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${enable_aws_sns} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: enable_custom_user_attributes_count {
    label: "Servers w/ Plugin Enable Custom User Attributes"
    description: "The count of servers with Plugin Enable Custom User Attributes enabled."
    type: count_distinct
    group_label: " Server Counts"
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
    sql: case when ${enable_custom_user_attributes} then ${server_id} else null end ;;
  }

  measure: enable_github_count {
    label: "Servers w/ Plugin Enable Github"
    description: "The count of servers with Plugin Enable Github enabled."
    type: count_distinct
    group_label: " Server Counts"
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
    sql: case when ${enable_github} then ${server_id} else null end ;;
  }

  measure: enable_gitlab_count {
    label: "Servers w/ Plugin Enable Gitlab"
    description: "The count of servers with Plugin Enable Gitlab enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${enable_gitlab} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: enable_health_check_count {
    label: "Servers w/ Plugin Enable Health Check"
    description: "The count of servers with Plugin Enable Health Check enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${enable_health_check} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: enable_jenkins_count {
    label: "Servers w/ Plugin Enable Jenkins"
    description: "The count of servers with Plugin Enable Jenkins enabled."
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${enable_jenkins} then ${server_id} else null end ;;
  }

  measure: enable_jira_count {
    label: "Servers w/ Plugin Enable Jira"
    description: "The count of servers with Plugin Enable Jira enabled."
    type: count_distinct
    group_label: " Server Counts"
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
    sql: case when ${enable_jira} then ${server_id} else null end ;;
  }

  measure: enable_jitsi_count {
    label: "Servers w/ Plugin Enable Jitsi"
    description: "The count of servers with Plugin Enable Jitsi enabled."
    type: count_distinct
    group_label: " Server Counts"
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
    sql: case when ${enable_jitsi} then ${server_id} else null end ;;
  }

  measure: enable_confluence_count {
    label: "Servers w/ Plugin Enable Confluence"
    description: "The count of servers with Plugin Enable Confluence enabled."
    type: count_distinct
    group_label: " Server Counts"
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
    sql: case when ${enable_confluence} then ${server_id} else null end ;;
  }

  measure: enable_todo_count {
    label: "Servers w/ Plugin Enable ToDo"
    description: "The count of servers with Plugin Enable ToDo enabled."
    type: count_distinct
    group_label: " Server Counts"
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
    sql: case when ${enable_todo} then ${server_id} else null end ;;
  }

  measure: enable_mscalendar_count {
    label: "Servers w/ Plugin Enable MS Calendar"
    description: "The count of servers with Plugin Enable MS Calendar enabled."
    type: count_distinct
    group_label: " Server Counts"
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
    sql: case when ${enable_mscalendar} then ${server_id} else null end ;;
  }

  measure: enable_skype4business_count {
    label: "Servers w/ Plugin Enable Skype4Business"
    description: "The count of servers with Plugin Enable Skype4Business enabled."
    type: count_distinct
    group_label: " Server Counts"
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
    sql: case when ${enable_skype4business} then ${server_id} else null end ;;
  }

  measure: enable_giphy_count {
    label: "Servers w/ Plugin Enable Giphy"
    description: "The count of servers with Plugin Enable Giphy enabled."
    type: count_distinct
    group_label: " Server Counts"
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
    sql: case when ${enable_giphy} then ${server_id} else null end ;;
  }

  measure: enable_digital_ocean_count {
    label: "Servers w/ Plugin Enable Digital Ocean"
    description: "The count of servers with Plugin Enable Digital Ocean enabled."
    type: count_distinct
    group_label: " Server Counts"
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
    sql: case when ${enable_digital_ocean} then ${server_id} else null end ;;
  }

  measure: enable_incident_response_count {
    label: "Servers w/ Plugin Enable Incident Response"
    description: "The count of servers with Plugin Enable Incident Response enabled."
    type: count_distinct
    group_label: " Server Counts"
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
    sql: case when ${enable_incident_response} then ${server_id} else null end ;;
  }

  measure: enable_memes_count {
    label: "Servers w/ Plugin Enable Memes"
    description: "The count of servers with Plugin Enable Memes enabled."
    type: count_distinct
    group_label: " Server Counts"
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
    sql: case when ${enable_memes} then ${server_id} else null end ;;
  }

  measure: enable_marketplace_count {
    label: "Servers w/ Plugin Enable Marketplace"
    description: "The count of servers with Plugin Enable Marketplace enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${enable_marketplace} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: enable_nps_count {
    label: "Servers w/ NPS Enabled"
    description: "The count of servers with Plugin Enable Nps enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${enable_nps} and ${enable_nps_survey} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: enable_nps_survey_count {
    label: "Servers w/ Plugin Enable Nps Survey"
    description: "The count of servers with Plugin Enable Nps Survey enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${enable_nps_survey} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: enable_remote_marketplace_count {
    label: "Servers w/ Plugin Enable Remote Marketplace"
    description: "The count of servers with Plugin Enable Remote Marketplace enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${enable_remote_marketplace} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: enable_uploads_count {
    label: "Servers w/ Plugin Enable Uploads"
    description: "The count of servers with Plugin Enable Uploads enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${enable_uploads} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: enable_webex_count {
    label: "Servers w/ Plugin Enable Webex"
    description: "The count of servers with Plugin Enable Webex enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${enable_webex} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: enable_welcome_bot_count {
    label: "Servers w/ Plugin Enable Welcome Bot"
    description: "The count of servers with Plugin Enable Welcome Bot enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${enable_welcome_bot} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: enable_zoom_count {
    label: "Servers w/ Plugin Enable Zoom"
    description: "The count of servers with Plugin Enable Zoom enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${enable_zoom} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: is_default_marketplace_url_count {
    label: "Servers w/ Plugin Is Default Marketplace Url"
    description: "The count of servers with Plugin Is Default Marketplace Url enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${is_default_marketplace_url} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: require_plugin_signature_count {
    label: "Servers w/ Plugin Require Plugin Signature"
    description: "The count of servers with Plugin Require Plugin Signature enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${require_plugin_signature} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: signature_public_key_files_sum {
    description: "The sum of Signature Public Key Files per grouping."
    group_label: "Plugin Configuration"
    type: sum
    sql: ${signature_public_key_files} ;;
  }

  measure: signature_public_key_files_avg {
    description: "The average Signature Public Key Files per grouping."
    group_label: "Plugin Configuration"
    type: average
    sql: ${signature_public_key_files} ;;
  }

  measure: active_backend_plugins_sum {
    description: "The sum of Active Backend Plugins per grouping."
    group_label: "Plugin Configuration"
    type: sum
    sql: ${active_backend_plugins} ;;
  }

  measure: active_backend_plugins_avg {
    description: "The average Active Backend Plugins per grouping."
    group_label: "Plugin Configuration"
    type: average
    sql: ${active_backend_plugins} ;;
  }

  measure: active_plugins_sum {
    description: "The sum of Active Plugins per grouping."
    group_label: "Plugin Configuration"
    type: sum
    sql: ${active_plugins} ;;
  }

  measure: active_plugins_avg {
    description: "The average Active Plugins per grouping."
    group_label: "Plugin Configuration"
    type: average
    sql: ${active_plugins} ;;
  }

  measure: active_webapp_plugins_sum {
    description: "The sum of Active Webapp Plugins per grouping."
    group_label: "Plugin Configuration"
    type: sum
    sql: ${active_webapp_plugins} ;;
  }

  measure: active_webapp_plugins_avg {
    description: "The average Active Webapp Plugins per grouping."
    group_label: "Plugin Configuration"
    type: average
    sql: ${active_webapp_plugins} ;;
  }

  measure: disabled_backend_plugins_sum {
    description: "The sum of Disabled Backend Plugins per grouping."
    group_label: "Plugin Configuration"
    type: sum
    sql: ${disabled_backend_plugins} ;;
  }

  measure: disabled_backend_plugins_avg {
    description: "The average Disabled Backend Plugins per grouping."
    group_label: "Plugin Configuration"
    type: average
    sql: ${disabled_backend_plugins} ;;
  }

  measure: disabled_plugins_sum {
    description: "The sum of Disabled Plugins per grouping."
    group_label: "Plugin Configuration"
    type: sum
    sql: ${disabled_plugins} ;;
  }

  measure: disabled_plugins_avg {
    description: "The average Disabled Plugins per grouping."
    group_label: "Plugin Configuration"
    type: average
    sql: ${disabled_plugins} ;;
  }

  measure: disabled_webapp_plugins_sum {
    description: "The sum of Disabled Webapp Plugins per grouping."
    group_label: "Plugin Configuration"
    type: sum
    sql: ${disabled_webapp_plugins} ;;
  }

  measure: disabled_webapp_plugins_avg {
    description: "The average Disabled Webapp Plugins per grouping."
    group_label: "Plugin Configuration"
    type: average
    sql: ${disabled_webapp_plugins} ;;
  }

  measure: enabled_backend_plugins_sum {
    description: "The sum of Enabled Backend Plugins per grouping."
    group_label: "Plugin Configuration"
    type: sum
    sql: ${enabled_backend_plugins} ;;
  }

  measure: enabled_backend_plugins_avg {
    description: "The average Enabled Backend Plugins per grouping."
    group_label: "Plugin Configuration"
    type: average
    sql: ${enabled_backend_plugins} ;;
  }

  measure: enabled_plugins_sum {
    description: "The sum of Enabled Plugins per grouping."
    group_label: "Plugin Configuration"
    type: sum
    sql: ${enabled_plugins} ;;
  }

  measure: enabled_plugins_avg {
    description: "The average Enabled Plugins per grouping."
    group_label: "Plugin Configuration"
    type: average
    sql: ${enabled_plugins} ;;
  }

  measure: enabled_webapp_plugins_sum {
    description: "The sum of Enabled Webapp Plugins per grouping."
    group_label: "Plugin Configuration"
    type: sum
    sql: ${enabled_webapp_plugins} ;;
  }

  measure: enabled_webapp_plugins_avg {
    description: "The average Enabled Webapp Plugins per grouping."
    group_label: "Plugin Configuration"
    type: average
    sql: ${enabled_webapp_plugins} ;;
  }

  measure: inactive_backend_plugins_sum {
    description: "The sum of Inactive Backend Plugins per grouping."
    group_label: "Plugin Configuration"
    type: sum
    sql: ${inactive_backend_plugins} ;;
  }

  measure: inactive_backend_plugins_avg {
    description: "The average Inactive Backend Plugins per grouping."
    group_label: "Plugin Configuration"
    type: average
    sql: ${inactive_backend_plugins} ;;
  }

  measure: inactive_plugins_sum {
    description: "The sum of Inactive Plugins per grouping."
    group_label: "Plugin Configuration"
    type: sum
    sql: ${inactive_plugins} ;;
  }

  measure: inactive_plugins_avg {
    description: "The average Inactive Plugins per grouping."
    group_label: "Plugin Configuration"
    type: average
    sql: ${inactive_plugins} ;;
  }

  measure: inactive_webapp_plugins_sum {
    description: "The sum of Inactive Webapp Plugins per grouping."
    group_label: "Plugin Configuration"
    type: sum
    sql: ${inactive_webapp_plugins} ;;
  }

  measure: inactive_webapp_plugins_avg {
    description: "The average Inactive Webapp Plugins per grouping."
    group_label: "Plugin Configuration"
    type: average
    sql: ${inactive_webapp_plugins} ;;
  }

  measure: plugins_with_broken_manifests_sum {
    description: "The sum of Plugins With Broken Manifests per grouping."
    group_label: "Plugin Configuration"
    type: sum
    sql: ${plugins_with_broken_manifests} ;;
  }

  measure: plugins_with_broken_manifests_avg {
    description: "The average Plugins With Broken Manifests per grouping."
    group_label: "Plugin Configuration"
    type: average
    sql: ${plugins_with_broken_manifests} ;;
  }

  measure: plugins_with_settings_sum {
    description: "The sum of Plugins With Settings per grouping."
    group_label: "Plugin Configuration"
    type: sum
    sql: ${plugins_with_settings} ;;
  }

  measure: plugins_with_settings_avg {
    description: "The average Plugins With Settings per grouping."
    group_label: "Plugin Configuration"
    type: average
    sql: ${plugins_with_settings} ;;
  }

  measure: show_email_address_count {
    label: "Servers w/ Privacy Show Email Address"
    description: "The count of servers with Privacy Show Email Address enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${show_email_address} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: show_full_name_count {
    label: "Servers w/ Privacy Show Full Name"
    description: "The count of servers with Privacy Show Full Name enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${show_full_name} then ${server_id} else null end ;;
  }

  measure: enable_rate_limiter_count {
    label: "Servers w/ Rate Enable Rate Limiter"
    description: "The count of servers with Rate Enable Rate Limiter enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${enable_rate_limiter} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: isdefault_vary_by_header_count {
    label: "Servers w/ Rate Isdefault Vary By Header"
    description: "The count of servers with Rate Isdefault Vary By Header enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${isdefault_vary_by_header} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: max_burst_sum {
    description: "The sum of Max Burst per grouping."
    group_label: "Rate Configuration"
    type: sum
    sql: ${max_burst} ;;
  }

  measure: max_burst_avg {
    description: "The average Max Burst per grouping."
    group_label: "Rate Configuration"
    type: average
    sql: ${max_burst} ;;
  }

  measure: memory_store_size_sum {
    description: "The sum of Memory Store Size per grouping."
    group_label: "Rate Configuration"
    type: sum
    sql: ${memory_store_size} ;;
  }

  measure: memory_store_size_avg {
    description: "The average Memory Store Size per grouping."
    group_label: "Rate Configuration"
    type: average
    sql: ${memory_store_size} ;;
  }

  measure: per_sec_sum {
    description: "The sum of Per Sec per grouping."
    group_label: "Rate Configuration"
    type: sum
    sql: ${per_sec} ;;
  }

  measure: per_sec_avg {
    description: "The average Per Sec per grouping."
    group_label: "Rate Configuration"
    type: average
    sql: ${per_sec} ;;
  }

  measure: vary_by_remote_address_count {
    label: "Servers w/ Rate Vary By Remote Address"
    description: "The count of servers with Rate Vary By Remote Address enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${vary_by_remote_address} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: vary_by_user_count {
    label: "Servers w/ Rate Vary By User"
    description: "The count of servers with Rate Vary By User enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${vary_by_user} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: enable_saml_count {
    label: "Servers w/ Saml Enable Saml"
    description: "The count of servers with Saml Enable Saml enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${enable_saml} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: enable_admin_attribute_count {
    label: "Servers w/ Saml Enable Admin Attribute"
    description: "The count of servers with Saml Enable Admin Attribute enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${enable_admin_attribute} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: enable_sync_with_ldap_count {
    label: "Servers w/ Saml Enable Sync With Ldap"
    description: "The count of servers with Saml Enable Sync With Ldap enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${enable_sync_with_ldap} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: enable_sync_with_ldap_include_auth_count {
    label: "Servers w/ Saml Enable Sync With Ldap Include Auth"
    description: "The count of servers with Saml Enable Sync With Ldap Include Auth enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${enable_sync_with_ldap_include_auth} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: encrypt_saml_count {
    label: "Servers w/ Saml Encrypt Saml"
    description: "The count of servers with Saml Encrypt Saml enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${encrypt_saml} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: isdefault_admin_attribute_count {
    label: "Servers w/ Saml Isdefault Admin Attribute"
    description: "The count of servers with Saml Isdefault Admin Attribute enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${isdefault_admin_attribute} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: isdefault_canonical_algorithm_count {
    label: "Servers w/ Saml Isdefault Canonical Algorithm"
    description: "The count of servers with Saml Isdefault Canonical Algorithm enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${isdefault_canonical_algorithm} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: isdefault_email_attribute_saml_count {
    label: "Servers w/ Saml Isdefault Email Attribute Saml"
    description: "The count of servers with Saml Isdefault Email Attribute Saml enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${isdefault_email_attribute_saml} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: isdefault_first_name_attribute_saml_count {
    label: "Servers w/ Saml Isdefault First Name Attribute Saml"
    description: "The count of servers with Saml Isdefault First Name Attribute Saml enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${isdefault_first_name_attribute_saml} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: isdefault_guest_attribute_count {
    label: "Servers w/ Saml Isdefault Guest Attribute"
    description: "The count of servers with Saml Isdefault Guest Attribute enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${isdefault_guest_attribute} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: isdefault_id_attribute_saml_count {
    label: "Servers w/ Saml Isdefault Id Attribute Saml"
    description: "The count of servers with Saml Isdefault Id Attribute Saml enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${isdefault_id_attribute_saml} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: isdefault_last_name_attribute_saml_count {
    label: "Servers w/ Saml Isdefault Last Name Attribute Saml"
    description: "The count of servers with Saml Isdefault Last Name Attribute Saml enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${isdefault_last_name_attribute_saml} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: isdefault_locale_attribute_count {
    label: "Servers w/ Saml Isdefault Locale Attribute"
    description: "The count of servers with Saml Isdefault Locale Attribute enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${isdefault_locale_attribute} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: isdefault_login_button_border_color_saml_count {
    label: "Servers w/ Saml Isdefault Login Button Border Color Saml"
    description: "The count of servers with Saml Isdefault Login Button Border Color Saml enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${isdefault_login_button_border_color_saml} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: isdefault_login_button_color_saml_count {
    label: "Servers w/ Saml Isdefault Login Button Color Saml"
    description: "The count of servers with Saml Isdefault Login Button Color Saml enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${isdefault_login_button_color_saml} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: isdefault_login_button_text_count {
    label: "Servers w/ Saml Isdefault Login Button Text"
    description: "The count of servers with Saml Isdefault Login Button Text enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${isdefault_login_button_text} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: isdefault_login_button_text_color_saml_count {
    label: "Servers w/ Saml Isdefault Login Button Text Color Saml"
    description: "The count of servers with Saml Isdefault Login Button Text Color Saml enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${isdefault_login_button_text_color_saml} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: isdefault_nickname_attribute_saml_count {
    label: "Servers w/ Saml Isdefault Nickname Attribute Saml"
    description: "The count of servers with Saml Isdefault Nickname Attribute Saml enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${isdefault_nickname_attribute_saml} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: isdefault_position_attribute_saml_count {
    label: "Servers w/ Saml Isdefault Position Attribute Saml"
    description: "The count of servers with Saml Isdefault Position Attribute Saml enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${isdefault_position_attribute_saml} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: isdefault_scoping_idp_name_count {
    label: "Servers w/ Saml Isdefault Scoping Idp Name"
    description: "The count of servers with Saml Isdefault Scoping Idp Name enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${isdefault_scoping_idp_name} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: isdefault_scoping_idp_provider_id_count {
    label: "Servers w/ Saml Isdefault Scoping Idp Provider Id"
    description: "The count of servers with Saml Isdefault Scoping Idp Provider Id enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${isdefault_scoping_idp_provider_id} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: isdefault_signature_algorithm_count {
    label: "Servers w/ Saml Isdefault Signature Algorithm"
    description: "The count of servers with Saml Isdefault Signature Algorithm enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${isdefault_signature_algorithm} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: isdefault_username_attribute_saml_count {
    label: "Servers w/ Saml Isdefault Username Attribute Saml"
    description: "The count of servers with Saml Isdefault Username Attribute Saml enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${isdefault_username_attribute_saml} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: sign_request_count {
    label: "Servers w/ Saml Sign Request"
    description: "The count of servers with Saml Sign Request enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${sign_request} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: verify_saml_count {
    label: "Servers w/ Saml Verify Saml"
    description: "The count of servers with Saml Verify Saml enabled."
    type: count_distinct
    group_label: " Server Counts"
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
    sql: case when ${verify_saml} then ${server_id} else null end ;;
  }

  measure: allow_cookies_for_subdomains_count {
    label: "Servers w/ Service Allow Cookies For Subdomains"
    description: "The count of servers with Service Allow Cookies For Subdomains enabled."
    type: count_distinct
    group_label: " Server Counts"
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
    sql: case when ${allow_cookies_for_subdomains} then ${server_id} else null end ;;
  }

  measure: close_unused_direct_messages_count {
    label: "Servers w/ Service Close Unused Direct Messages"
    description: "The count of servers with Service Close Unused Direct Messages enabled."
    type: count_distinct
    group_label: " Server Counts"
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
    sql: case when ${close_unused_direct_messages} then ${server_id} else null end ;;
  }

  measure: cors_allow_credentials_count {
    label: "Servers w/ Service Cors Allow Credentials"
    description: "The count of servers with Service Cors Allow Credentials enabled."
    type: count_distinct
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
    group_label: " Server Counts"
    sql: case when ${cors_allow_credentials} then ${server_id} else null end ;;
  }

  measure: cors_debug_count {
    label: "Servers w/ Service Cors Debug"
    description: "The count of servers with Service Cors Debug enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${cors_debug} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: custom_service_terms_enabled_service_count {
    label: "Servers w/ Service Custom Service Terms Enabled Service"
    description: "The count of servers with Service Custom Service Terms Enabled Service enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${custom_service_terms_enabled_service} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: disable_bots_when_owner_is_deactivated_count {
    label: "Servers w/ Service Disable Bots When Owner Is Deactivated"
    description: "The count of servers with Service Disable Bots When Owner Is Deactivated enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${disable_bots_when_owner_is_deactivated} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: disable_legacy_mfa_count {
    label: "Servers w/ Service Disable Legacy Mfa"
    description: "The count of servers with Service Disable Legacy Mfa enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${disable_legacy_mfa} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: enable_apiv3_service_count {
    label: "Servers w/ Service Enable Apiv3 Service"
    description: "The count of servers with Service Enable Apiv3 Service enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${enable_apiv3_service} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: enable_api_team_deletion_count {
    label: "Servers w/ Service Enable Api Team Deletion"
    description: "The count of servers with Service Enable Api Team Deletion enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${enable_api_team_deletion} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: enable_bot_account_creation_count {
    label: "Servers w/ Service Enable Bot Account Creation"
    description: "The count of servers with Service Enable Bot Account Creation enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${enable_bot_account_creation} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: enable_channel_viewed_messages_service_count {
    label: "Servers w/ Service Enable Channel Viewed Messages Service"
    description: "The count of servers with Service Enable Channel Viewed Messages Service enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${enable_channel_viewed_messages_service} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: enable_commands_service_count {
    label: "Servers w/ Service Enable Commands Service"
    description: "The count of servers with Service Enable Commands Service enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${enable_commands_service} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: enable_custom_emoji_service_count {
    label: "Servers w/ Service Enable Custom Emoji Service"
    description: "The count of servers with Service Enable Custom Emoji Service enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${enable_custom_emoji_service} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: enable_developer_service_count {
    label: "Servers w/ Service Enable Developer Service"
    description: "The count of servers with Service Enable Developer Service enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${enable_developer_service} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: enable_email_invitations_count {
    label: "Servers w/ Service Enable Email Invitations"
    description: "The count of servers with Service Enable Email Invitations enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${enable_email_invitations} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: enable_emoji_picker_service_count {
    label: "Servers w/ Service Enable Emoji Picker Service"
    description: "The count of servers with Service Enable Emoji Picker Service enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${enable_emoji_picker_service} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: enable_gif_picker_count {
    label: "Servers w/ Service Enable Gif Picker"
    description: "The count of servers with Service Enable Gif Picker enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${enable_gif_picker} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: enable_incoming_webhooks_service_count {
    label: "Servers w/ Service Enable Incoming Webhooks Service"
    description: "The count of servers with Service Enable Incoming Webhooks Service enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${enable_incoming_webhooks_service} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: enable_insecure_outgoing_connections_service_count {
    label: "Servers w/ Service Enable Insecure Outgoing Connections Service"
    description: "The count of servers with Service Enable Insecure Outgoing Connections Service enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${enable_insecure_outgoing_connections_service} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: enable_latex_count {
    label: "Servers w/ Service Enable Latex"
    description: "The count of servers with Service Enable Latex enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${enable_latex} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: enable_multifactor_authentication_service_count {
    label: "Servers w/ Service Enable Multifactor Authentication Service"
    description: "The count of servers with Service Enable Multifactor Authentication Service enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${enable_multifactor_authentication_service} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: enable_oauth_service_provider_service_count {
    label: "Servers w/ Service Enable Oauth Service Provider Service"
    description: "The count of servers with Service Enable Oauth Service Provider Service enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${enable_oauth_service_provider_service} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: enable_only_admin_integrations_service_count {
    label: "Servers w/ Service Enable Only Admin Integrations Service"
    description: "The count of servers with Service Enable Only Admin Integrations Service enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${enable_only_admin_integrations_service} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: enable_outgoing_webhooks_count {
    label: "Servers w/ Service Enable Outgoing Webhooks"
    description: "The count of servers with Service Enable Outgoing Webhooks enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${enable_outgoing_webhooks} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: enable_post_icon_override_count {
    label: "Servers w/ Service Enable Post Icon Override"
    description: "The count of servers with Service Enable Post Icon Override enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${enable_post_icon_override} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: enable_post_search_count {
    label: "Servers w/ Service Enable Post Search"
    description: "The count of servers with Service Enable Post Search enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${enable_post_search} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: enable_post_username_override_count {
    label: "Servers w/ Service Enable Post Username Override"
    description: "The count of servers with Service Enable Post Username Override enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${enable_post_username_override} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: enable_preview_features_count {
    label: "Servers w/ Service Enable Preview Features"
    description: "The count of servers with Service Enable Preview Features enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${enable_preview_features} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: enable_security_fix_alert_count {
    label: "Servers w/ Service Enable Security Fix Alert"
    description: "The count of servers with Service Enable Security Fix Alert enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${enable_security_fix_alert} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: enable_svgs_count {
    label: "Servers w/ Service Enable Svgs"
    description: "The count of servers with Service Enable Svgs enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${enable_svgs} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: enable_testing_count {
    label: "Servers w/ Service Enable Testing"
    description: "The count of servers with Service Enable Testing enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${enable_testing} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: enable_tutorial_count {
    label: "Servers w/ Service Enable Tutorial"
    description: "The count of servers with Service Enable Tutorial enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${enable_tutorial} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: enable_user_access_tokens_count {
    label: "Servers w/ Service Enable User Access Tokens"
    description: "The count of servers with Service Enable User Access Tokens enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${enable_user_access_tokens} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: enable_user_statuses_count {
    label: "Servers w/ Service Enable User Statuses"
    description: "The count of servers with Service Enable User Statuses enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${enable_user_statuses} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: enable_user_typing_messages_count {
    label: "Servers w/ Service Enable User Typing Messages"
    description: "The count of servers with Service Enable User Typing Messages enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${enable_user_typing_messages} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: enforce_multifactor_authentication_service_count {
    label: "Servers w/ Service Enforce Multifactor Authentication Service"
    description: "The count of servers with Service Enforce Multifactor Authentication Service enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${enforce_multifactor_authentication_service} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: experimental_channel_organization_count {
    label: "Servers w/ Service Experimental Channel Organization"
    description: "The count of servers with Service Experimental Channel Organization enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${experimental_channel_organization} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: experimental_enable_authentication_transfer_count {
    label: "Servers w/ Service Experimental Enable Authentication Transfer"
    description: "The count of servers with Service Experimental Enable Authentication Transfer enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${experimental_enable_authentication_transfer} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: experimental_enable_default_channel_leave_join_messages_count {
    label: "Servers w/ Service Experimental Enable Default Channel Leave Join Messages"
    description: "The count of servers with Service Experimental Enable Default Channel Leave Join Messages enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${experimental_enable_default_channel_leave_join_messages} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: experimental_enable_hardened_mode_count {
    label: "Servers w/ Service Experimental Enable Hardened Mode"
    description: "The count of servers with Service Experimental Enable Hardened Mode enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${experimental_enable_hardened_mode} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: experimental_ldap_group_sync_count {
    label: "Servers w/ Service Experimental Ldap Group Sync"
    description: "The count of servers with Service Experimental Ldap Group Sync enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${experimental_ldap_group_sync} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: experimental_limit_client_config_count {
    label: "Servers w/ Service Experimental Limit Client Config"
    description: "The count of servers with Service Experimental Limit Client Config enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${experimental_limit_client_config} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: experimental_strict_csrf_enforcement_count {
    label: "Servers w/ Service Experimental Strict Csrf Enforcement"
    description: "The count of servers with Service Experimental Strict Csrf Enforcement enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${experimental_strict_csrf_enforcement} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: forward_80_to_443_count {
    label: "Servers w/ Service Forward 80 To 443"
    description: "The count of servers with Service Forward 80 To 443 enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${forward_80_to_443} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: gfycat_api_key_count {
    label: "Servers w/ Service Gfycat Api Key"
    description: "The count of servers with Service Gfycat Api Key enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${gfycat_api_key} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: gfycat_api_secret_count {
    label: "Servers w/ Service Gfycat Api Secret"
    description: "The count of servers with Service Gfycat Api Secret enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${gfycat_api_secret} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: isdefault_allowed_untrusted_internal_connections_count {
    label: "Servers w/ Service Isdefault Allowed Untrusted Internal Connections"
    description: "The count of servers with Service Isdefault Allowed Untrusted Internal Connections enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${isdefault_allowed_untrusted_internal_connections} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: isdefault_allowed_untrusted_inteznal_connections_count {
    label: "Servers w/ Service Isdefault Allowed Untrusted Inteznal Connections"
    description: "The count of servers with Service Isdefault Allowed Untrusted Inteznal Connections enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${isdefault_allowed_untrusted_inteznal_connections} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: isdefault_allow_cors_from_count {
    label: "Servers w/ Service Isdefault Allow Cors From"
    description: "The count of servers with Service Isdefault Allow Cors From enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${isdefault_allow_cors_from} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: isdefault_cors_exposed_headers_count {
    label: "Servers w/ Service Isdefault Cors Exposed Headers"
    description: "The count of servers with Service Isdefault Cors Exposed Headers enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${isdefault_cors_exposed_headers} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: isdefault_google_developer_key_count {
    label: "Servers w/ Service Isdefault Google Developer Key"
    description: "The count of servers with Service Isdefault Google Developer Key enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${isdefault_google_developer_key} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: isdefault_image_proxy_options_count {
    label: "Servers w/ Service Isdefault Image Proxy Options"
    description: "The count of servers with Service Isdefault Image Proxy Options enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${isdefault_image_proxy_options} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: isdefault_image_proxy_type_count {
    label: "Servers w/ Service Isdefault Image Proxy Type"
    description: "The count of servers with Service Isdefault Image Proxy Type enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${isdefault_image_proxy_type} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: isdefault_image_proxy_url_count {
    label: "Servers w/ Service Isdefault Image Proxy Url"
    description: "The count of servers with Service Isdefault Image Proxy Url enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${isdefault_image_proxy_url} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: isdefault_read_timeout_count {
    label: "Servers w/ Service Isdefault Read Timeout"
    description: "The count of servers with Service Isdefault Read Timeout enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${isdefault_read_timeout} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: isdefault_site_url_count {
    label: "Servers w/ Service Isdefault Site Url"
    description: "The count of servers with Service Isdefault Site Url enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${isdefault_site_url} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: isdefault_tls_cert_file_count {
    label: "Servers w/ Service Isdefault Tls Cert File"
    description: "The count of servers with Service Isdefault Tls Cert File enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${isdefault_tls_cert_file} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: isdefault_tls_key_file_count {
    label: "Servers w/ Service Isdefault Tls Key File"
    description: "The count of servers with Service Isdefault Tls Key File enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${isdefault_tls_key_file} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: isdefault_write_timeout_count {
    label: "Servers w/ Service Isdefault Write Timeout"
    description: "The count of servers with Service Isdefault Write Timeout enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${isdefault_write_timeout} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: tls_strict_transport_count {
    label: "Servers w/ Service Tls Strict Transport"
    description: "The count of servers with Service Tls Strict Transport enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${tls_strict_transport} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: uses_letsencrypt_count {
    label: "Servers w/ Service Uses Letsencrypt"
    description: "The count of servers with Service Uses Letsencrypt enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${uses_letsencrypt} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: websocket_url_count {
    label: "Servers w/ Service Websocket Url"
    description: "The count of servers with Service Websocket Url enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${websocket_url} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: enable_public_channels_materialization_count {
    label: "Servers w/ Sql Enable Public Channels Materialization"
    description: "The count of servers with Sql Enable Public Channels Materialization enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${enable_public_channels_materialization} then ${server_id} else null end ;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, edition, days_since_first_telemetry_enabled, license_id, license_edition, license_users, user_count, active_user_count, system_admins, first_active_telemetry_date, last_active_telemetry_date]
  }

  measure: max_idle_conns_sum {
    description: "The sum of Max Idle Conns per grouping."
    group_label: "Sql Configuration"
    type: sum
    sql: ${max_idle_conns} ;;
  }

  measure: max_idle_conns_avg {
    description: "The average Max Idle Conns per grouping."
    group_label: "Sql Configuration"
    type: average
    sql: ${max_idle_conns} ;;
  }

  measure: max_open_conns_sum {
    description: "The sum of Max Open Conns per grouping."
    group_label: "Sql Configuration"
    type: sum
    sql: ${max_open_conns} ;;
  }

  measure: max_open_conns_avg {
    description: "The average Max Open Conns per grouping."
    group_label: "Sql Configuration"
    type: average
    sql: ${max_open_conns} ;;
  }

  measure: query_timeout_sql_sum {
    description: "The sum of Query Timeout Sql per grouping."
    group_label: "Sql Configuration"
    type: sum
    sql: ${query_timeout_sql} ;;
  }

  measure: query_timeout_sql_avg {
    description: "The average Query Timeout Sql per grouping."
    group_label: "Sql Configuration"
    type: average
    sql: ${query_timeout_sql} ;;
  }

  measure: trace_sql_count {
    label: "Servers w/ Sql Trace Sql"
    description: "The count of servers with Sql Trace Sql enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${trace_sql} then ${server_id} else null end ;;
  }

  measure: custom_terms_of_service_enabled_count {
    label: "Servers w/ Support Custom Terms Of Service Enabled"
    description: "The count of servers with Support Custom Terms Of Service Enabled enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${custom_terms_of_service_enabled} or ${custom_service_terms_enabled_support} then ${server_id} else null end ;;
  }

  measure: isdefault_about_link_count {
    label: "Servers w/ Support Isdefault About Link"
    description: "The count of servers with Support Isdefault About Link enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${isdefault_about_link} then ${server_id} else null end ;;
  }

  measure: isdefault_help_link_count {
    label: "Servers w/ Support Isdefault Help Link"
    description: "The count of servers with Support Isdefault Help Link enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${isdefault_help_link} then ${server_id} else null end ;;
  }

  measure: isdefault_privacy_policy_link_count {
    label: "Servers w/ Support Isdefault Privacy Policy Link"
    description: "The count of servers with Support Isdefault Privacy Policy Link enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${isdefault_privacy_policy_link} then ${server_id} else null end ;;
  }

  measure: isdefault_report_a_problem_link_count {
    label: "Servers w/ Support Isdefault Report A Problem Link"
    description: "The count of servers with Support Isdefault Report A Problem Link enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${isdefault_report_a_problem_link} then ${server_id} else null end ;;
  }

  measure: isdefault_support_email_count {
    label: "Servers w/ Support Isdefault Support Email"
    description: "The count of servers with Support Isdefault Support Email enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${isdefault_support_email} then ${server_id} else null end ;;
  }

  measure: isdefault_terms_of_service_link_count {
    label: "Servers w/ Support Isdefault Terms Of Service Link"
    description: "The count of servers with Support Isdefault Terms Of Service Link enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${isdefault_terms_of_service_link} then ${server_id} else null end ;;
  }

  measure: enable_confirm_notifications_to_channel_count {
    label: "Servers w/ Team Enable Confirm Notifications To Channel"
    description: "The count of servers with Team Enable Confirm Notifications To Channel enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${enable_confirm_notifications_to_channel} then ${server_id} else null end ;;
  }

  measure: enable_custom_brand_count {
    label: "Servers w/ Team Enable Custom Brand"
    description: "The count of servers with Team Enable Custom Brand enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${enable_custom_brand} then ${server_id} else null end ;;
  }

  measure: enable_open_server_count {
    label: "Servers w/ Team Enable Open Server"
    description: "The count of servers with Team Enable Open Server enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${enable_open_server} then ${server_id} else null end ;;
  }

  measure: enable_team_creation_count {
    label: "Servers w/ Team Enable Team Creation"
    description: "The count of servers with Team Enable Team Creation enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${enable_team_creation} then ${server_id} else null end ;;
  }

  measure: enable_user_creation_count {
    label: "Servers w/ Team Enable User Creation"
    description: "The count of servers with Team Enable User Creation enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${enable_user_creation} then ${server_id} else null end ;;
  }

  measure: enable_user_deactivation_count {
    label: "Servers w/ Team Enable User Deactivation"
    description: "The count of servers with Team Enable User Deactivation enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${enable_user_deactivation} then ${server_id} else null end ;;
  }

  measure: enable_x_to_leave_channels_from_lhs_count {
    label: "Servers w/ Team Enable X To Leave Channels From Lhs"
    description: "The count of servers with Team Enable X To Leave Channels From Lhs enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${enable_x_to_leave_channels_from_lhs} then ${server_id} else null end ;;
  }

  measure: experimental_enable_automatic_replies_count {
    label: "Servers w/ Team Experimental Enable Automatic Replies"
    description: "The count of servers with Team Experimental Enable Automatic Replies enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${experimental_enable_automatic_replies} then ${server_id} else null end ;;
  }

  measure: experimental_primary_team_count {
    label: "Servers w/ Team Experimental Primary Team"
    description: "The count of servers with Team Experimental Primary Team enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${experimental_primary_team} then ${server_id} else null end ;;
  }

  measure: experimental_town_square_is_hidden_in_lhs_count {
    label: "Servers w/ Team Experimental Town Square Is Hidden In Lhs"
    description: "The count of servers with Team Experimental Town Square Is Hidden In Lhs enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${experimental_town_square_is_hidden_in_lhs} then ${server_id} else null end ;;
  }

  measure: experimental_town_square_is_read_only_count {
    label: "Servers w/ Team Experimental Town Square Is Read Only"
    description: "The count of servers with Team Experimental Town Square Is Read Only enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${experimental_town_square_is_read_only} then ${server_id} else null end ;;
  }

  measure: experimental_view_archived_channels_count {
    label: "Servers w/ Team Experimental View Archived Channels"
    description: "The count of servers with Team Experimental View Archived Channels enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${experimental_view_archived_channels} then ${server_id} else null end ;;
  }

  measure: isdefault_custom_brand_text_count {
    label: "Servers w/ Team Isdefault Custom Brand Text"
    description: "The count of servers with Team Isdefault Custom Brand Text enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${isdefault_custom_brand_text} then ${server_id} else null end ;;
  }

  measure: isdefault_custom_description_text_count {
    label: "Servers w/ Team Isdefault Custom Description Text"
    description: "The count of servers with Team Isdefault Custom Description Text enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${isdefault_custom_description_text} then ${server_id} else null end ;;
  }

  measure: isdefault_site_name_count {
    label: "Servers w/ Team Isdefault Site Name"
    description: "The count of servers with Team Isdefault Site Name enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${isdefault_site_name} then ${server_id} else null end ;;
  }

  measure: isdefault_user_status_away_timeout_count {
    label: "Servers w/ Team Isdefault User Status Away Timeout"
    description: "The count of servers with Team Isdefault User Status Away Timeout enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${isdefault_user_status_away_timeout} then ${server_id} else null end ;;
  }

  measure: lock_teammate_name_display_count {
    label: "Servers w/ Team Lock Teammate Name Display"
    description: "The count of servers with Team Lock Teammate Name Display enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${lock_teammate_name_display} then ${server_id} else null end ;;
  }

  measure: view_archived_channels_count {
    label: "Servers w/ Team View Archived Channels"
    description: "The count of servers with Team View Archived Channels enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${view_archived_channels} then ${server_id} else null end ;;
  }

  measure: allowed_themes_sum {
    description: "The sum of Allowed Themes per grouping."
    group_label: "Theme Configuration"
    type: sum
    sql: ${allowed_themes} ;;
  }

  measure: allowed_themes_avg {
    description: "The average Allowed Themes per grouping."
    group_label: "Theme Configuration"
    type: average
    sql: ${allowed_themes} ;;
  }

  measure: allow_custom_themes_count {
    label: "Servers w/ Theme Allow Custom Themes"
    description: "The count of servers with Theme Allow Custom Themes enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${allow_custom_themes} then ${server_id} else null end ;;
  }

  measure: enable_theme_selection_count {
    label: "Servers w/ Theme Enable Theme Selection"
    description: "The count of servers with Theme Enable Theme Selection enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${enable_theme_selection} then ${server_id} else null end ;;
  }

  measure: isdefault_default_theme_count {
    label: "Servers w/ Theme Isdefault Default Theme"
    description: "The count of servers with Theme Isdefault Default Theme enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${isdefault_default_theme} then ${server_id} else null end ;;
  }

  measure: isdefault_supported_timezones_path_count {
    label: "Servers w/ Timezone Isdefault Supported Timezones Path"
    description: "The count of servers with Timezone Isdefault Supported Timezones Path enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${isdefault_supported_timezones_path} then ${server_id} else null end ;;
  }

  measure: enable_count {
    label: "Servers w/ Webrtc Enable"
    description: "The count of servers with Webrtc Enable enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${enable} then ${server_id} else null end ;;
  }

  measure: isdefault_stun_uri_count {
    label: "Servers w/ Webrtc Isdefault Stun Uri"
    description: "The count of servers with Webrtc Isdefault Stun Uri enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${isdefault_stun_uri} then ${server_id} else null end ;;
  }

  measure: isdefault_turn_uri_count {
    label: "Servers w/ Webrtc Isdefault Turn Uri"
    description: "The count of servers with Webrtc Isdefault Turn Uri enabled."
    type: count_distinct
    group_label: " Server Counts"
    sql: case when ${isdefault_turn_uri} then ${server_id} else null end ;;
  }

  measure: avg_posts_per_user_per_day2 {
    group_label: "Activity Diagnostics"
    label: "Avg. Posts Per Active User (Activity)"
    type: number
    sql: (${posts_previous_day_sum}::float/nullif(${active_users_daily_sum}::float,0)) ;;
    value_format_name: decimal_1
  }

  measure: median_posts_per_user_per_day2 {
    group_label: "Activity Diagnostics"
    label: "Median Posts Per Active User (Activity)"
    type: number
    sql: median(${posts_previous_day}::float/nullif(${active_users_daily}::float,0)) ;;
    value_format_name: decimal_1
  }

  measure: avg_posts_per_user_per_day {
    group_label: "Server-Level User Events"
    label: "Avg. Posts Per Active User (Events)"
    type: average
    sql: ${server_events_by_date.post_events}::FLOAT/NULLIF(${server_events_by_date.users}::float,0) ;;
    value_format_name: decimal_1
    drill_fields: [server_fact*]
  }

  measure: median_posts_per_user_per_day {
    group_label: "Server-Level User Events"
    label: "Median Posts Per Active User (Events)"
    type: median
    sql: ${server_events_by_date.post_events}::FLOAT/NULLIF(${server_events_by_date.users}::float,0) ;;
    value_format_name: decimal_1
    drill_fields: [server_fact*]
  }

  measure: posts_sum2 {
    group_label: "Server-Level User Events"
    label: "Posts"
    description: "The sum of all posts performed by all active user across all servers within the given grouping (from events telemetry)."
    type: sum
    sql: ${posts2} ;;
    drill_fields: [server_fact*]
    value_format_name: decimal_0
  }

  measure: events_sum {
    group_label: "Server-Level User Events"
    label: "Total Events"
    description: "The sum of all events performed by all active user across all servers within the given grouping."
    type: sum
    sql: ${events} ;;
    drill_fields: [server_fact*]
    value_format_name: decimal_0
  }

  measure: dau_sum {
    group_label: "Server-Level User Events"
    label: "Daily Active Users (Sum)"
    description: "The sum of all daily active users across all servers within the given grouping."
    type: number
    sql: SUM(${dau}) ;;
    value_format_name: decimal_0
    drill_fields: []
  }

  measure: dau_avg {
    group_label: "Server-Level User Events"
    label: "Daily Active Users (Avg)"
    description: "The average daily active users across all servers within the given grouping."
    type: number
    sql: avg(${dau}) ;;
    value_format_name: decimal_1
  }

  measure: dau_median {
    group_label: "Server-Level User Events"
    label: "Daily Active User (Median)"
    description: "The median daily active users across all servers within the given grouping."
    type: number
    sql: median(${dau}) ;;
    value_format_name: decimal_1
  }

  measure: mau_sum {
    group_label: "Server-Level User Events"
    label: "MAU (Sum)"
    description: "The sum of all daily active users across all servers within the given grouping."
    type: number
    sql: SUM(CASE WHEN ${mau} >= COALESCE(${active_users_monthly},0) THEN ${mau} ELSE ${active_users_monthly} END) ;;
    value_format_name: decimal_0
  }

  measure: server_w_active_users_count {
    group_label: " Server Counts"
    label: "  Servers w/ Active Users"
    description: "Use this for counting distinct Server ID's for servers that have active users > 0 (from activity diagnostics telemetry) across dimensions."
    type: count_distinct
    sql: CASE WHEN  ${active_user_count} > 0 THEN ${server_id} ELSE NULL END;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, days_since_first_telemetry_enabled, user_count, active_user_count, system_admins, server_fact.first_telemetry_active_date, server_fact.last_telemetry_active_date]
  }

  measure: server_7days_w_active_users_count {
    group_label: " Server Counts"
    label: "  Server >=7 Days Old w/ Active Users"
    description: "Use this for counting distinct Server ID's for servers that are >= 7 days old and have active users > 0 across dimensions."
    type: count_distinct
    sql: CASE WHEN datediff(day, ${server_fact.first_active_date}, ${logging_date})  >= 7 AND
            CASE WHEN COALESCE(${active_users_daily},0) >= COALESCE(${active_user_count},0) THEN COALESCE(${active_users_daily},0) ELSE COALESCE(${active_user_count},0) END > 0
          THEN ${server_id} ELSE NULL END;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, days_since_first_telemetry_enabled, user_count, active_user_count, system_admins, server_fact.first_telemetry_active_date, server_fact.last_telemetry_active_date]
  }

  measure: server_1days_w_active_users_count {
    group_label: " Server Counts"
    label: "Server >=1 Day Old w/ Active Users"
    description: "Use this for counting distinct Server ID's for servers that are >= 1 days old and have active users > 0 across dimensions."
    type: count_distinct
    sql: CASE WHEN datediff(day, ${server_fact.first_active_date}, ${logging_date})  >= 1 AND
            CASE WHEN COALESCE(${active_users_daily},0) >= COALESCE(${active_user_count},0) THEN COALESCE(${active_users_daily},0) ELSE COALESCE(${active_user_count},0) END > 0
          THEN ${server_id} ELSE NULL END;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, days_since_first_telemetry_enabled, user_count, active_user_count, system_admins, server_fact.first_telemetry_active_date, server_fact.last_telemetry_active_date]
  }

  measure: server_30days_w_active_users_count {
    group_label: " Server Counts"
    label: "  Servers >=4 Weeks Old w/ Active Users"
    description: "Use this for counting distinct Server ID's for servers that are >= 30 days old and have active users > 0 across dimensions."
    type: count_distinct
    sql: CASE WHEN datediff(day, ${server_fact.first_active_date}, ${logging_date})  >= 30 AND ${active_users_daily} > 0 THEN ${server_id} ELSE NULL END;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, days_since_first_telemetry_enabled, user_count, active_user_count, system_admins, server_fact.first_telemetry_active_date, server_fact.last_telemetry_active_date]
  }

  measure: server_30days_count {
    group_label: " Server Counts"
    label: "  Servers >=4 Weeks Old"
    description: "Use this for counting distinct Server ID's for servers that are >= 60 days old across dimensions."
    type: count_distinct
    sql: CASE WHEN datediff(day, ${server_fact.first_active_date}, ${logging_date})  >= 30 THEN ${server_id} ELSE NULL END;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, days_since_first_telemetry_enabled, user_count, active_user_count, system_admins, server_fact.first_telemetry_active_date, server_fact.last_telemetry_active_date]
  }

  measure: server_60days_w_active_users_count {
    group_label: " Server Counts"
    label: "  Servers >=8 Weeks Old w/ Active Users"
    description: "Use this for counting distinct Server ID's for servers that are >= 60 days old and have active users > 0 across dimensions."
    type: count_distinct
    sql: CASE WHEN datediff(day, ${server_fact.first_active_date}, ${logging_date})  >= 60 AND
            CASE WHEN COALESCE(${active_users_daily},0) >= COALESCE(${active_user_count},0) THEN COALESCE(${active_users_daily},0) ELSE COALESCE(${active_user_count},0) END > 0
          THEN ${server_id} ELSE NULL END;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, days_since_first_telemetry_enabled, user_count, active_user_count, system_admins, server_fact.first_telemetry_active_date, server_fact.last_telemetry_active_date]
  }

  measure: server_60days_count {
    group_label: " Server Counts"
    label: "  Servers >=8 Weeks Old"
    description: "Use this for counting distinct Server ID's for servers that are >= 60 days old across dimensions."
    type: count_distinct
    sql: CASE WHEN datediff(day, ${server_fact.first_active_date}, ${logging_date})  >= 60 THEN ${server_id} ELSE NULL END;;
    drill_fields: [logging_date, server_id, account_sfid, account.name, version, days_since_first_telemetry_enabled, user_count, active_user_count, system_admins, server_fact.first_telemetry_active_date, server_fact.last_telemetry_active_date]
  }

  measure: license_expire_date_max {
    label: "Max. License Expire Date"
    group_label: "License Configuration"
    type: date
    sql: MAX(${expire_date}::date) ;;
  }
}
