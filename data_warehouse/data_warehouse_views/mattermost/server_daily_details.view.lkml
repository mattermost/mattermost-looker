view: server_daily_details {
  sql_table_name: mattermost.server_daily_details ;;
  view_label: "Server Daily Details"

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
    description: "Is contained in the events.security table data on the given logging date."
    type: yesno
    sql: ${TABLE}.in_security ;;
  }

  dimension: in_mattermos2_server {
    description: "Is contained in the mattermost2.server table data on the given logging date."
    type: yesno
    sql: ${TABLE}.in_mm2_server ;;
  }

  dimension: has_dupes {
    label: "Has Duplicates"
    group_label: "Data Validation"
    description: "Indicates whether the server is noted as having duplicate records in raw security and server tables."
    type: yesno
    sql: ${TABLE}.has_dupes ;;
  }

  dimension: has_multi_ips {
    label: "Has Multiple IP's"
    group_label: "Data Validation"
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
    description: "The count of users that have visited the Mattermost site in the last 24 hours on the server."
    type: number
    sql: ${TABLE}.active_user_count ;;
  }

  dimension: user_count {
    description: "The count of all users provisioned to/associated with the server."
    type: number
    sql: ${TABLE}.user_count ;;
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
    type: number
    sql: datediff(day, ${server_fact.first_telemetry_active_date}, ${logging_date}) ;;
  }

  dimension: days_since_first_telemetry_enabled_band {
    type: tier
    style: integer
    tiers: [1, 8, 31, 61, 91, 366]
    sql: ${days_since_first_telemetry_enabled} ;;
  }

  dimension_group: first_telemetry_enabled {
    type: time
    timeframes: [date, month, year]
    sql: ${server_fact.first_telemetry_active_date}::date ;;
  }

  dimension: server_age {
    label: "Age (Days)"
    description: "Displays the age in days of the server bucketed into groupings. Age is calculated from first active date (first date telemetry enabled) to logging date."
    type: tier
    style: integer
    tiers: [0,31,61,91,181,366,731]
    sql: datediff(day, ${server_fact.first_telemetry_active_date}, ${logging_date}) ;;
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
  }

  measure: server_7days_count {
    label: "Server >= 7 Days Old Count"
    description: "Use this for counting distinct Server ID's for servers that are >= 7 days old across dimensions."
    type: count_distinct
    sql: CASE WHEN datediff(day, ${server_fact.first_active_date}, ${logging_date})  >= 7 then ${server_id} else null end;;
  }

  measure: server_7days_w_active_users_count {
    label: "Server >=7 Days Old w/ Active Users Count"
    description: "Use this for counting distinct Server ID's for servers that are >= 7 days old and have active users > 0 across dimensions."
    type: count_distinct
    sql: CASE WHEN datediff(day, ${server_fact.first_active_date}, ${logging_date})  >= 7 AND ${active_user_count} > 0 THEN ${server_id} ELSE NULL END;;
  }

  measure: server_w_active_users_count {
    label: "Server w/ Active Users Count"
    description: "Use this to count distinct Server ID's with > 0 active users across dimensions."
    type: count_distinct
    sql: CASE WHEN ${active_user_count} > 0 THEN ${server_id} ELSE NULL END ;;
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
}
