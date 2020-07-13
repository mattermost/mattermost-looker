view: downloads {
  sql_table_name: MATTERMOST.DOWNLOADS ;;

  filter: week_to_date {
    description: "Boolean used to filter data to compare current week to previous week's week to date metrics."
    type: yesno
    sql: CASE WHEN ${log_week}::DATE <> date_trunc('week', CURRENT_DATE::DATE) AND DAYOFWEEK(${log_date}::DATE) <= DAYOFWEEK(CURRENT_DATE::DATE)
      THEN TRUE ELSE FALSE END;;
  }

  filter: month_to_date {
    description: "Boolean used to filter data to compare current month to previous month's month to date metrics."
    type: yesno
    sql: CASE WHEN (${log_month} || '-01')::DATE = date_trunc('month', CURRENT_DATE) THEN TRUE
            WHEN (${log_month} || '-01')::DATE <> date_trunc('month', CURRENT_DATE::DATE) AND EXTRACT(DAY FROM ${log_date}::DATE)::int <= EXTRACT(DAY FROM CURRENT_DATE::DATE)
            THEN TRUE ELSE FALSE END;;
  }

  dimension: ip_address {
    description: "The IP address of the user performing the download."
    label: "Client IP Address"
    type: string
    sql: ${TABLE}.ip_address ;;
  }

  dimension_group: log {
    type: time
    timeframes: [
      date,
      week,
      month,
      fiscal_quarter,
      year,
      fiscal_year
    ]
    sql: ${TABLE}."LOGDATE" ;;
  }

  dimension: logtime {
    label: "Logging Timestamp"
    description: "A timestamp of the time of day the download was performed (string)."
    type: string
    sql: ${TABLE}.logtime ;;
  }

  dimension: uri {
    description: "Uniform Resource Identifier (URI) identifying the downloaded resource."
    type: string
    sql: ${TABLE}.uri;;
  }

  dimension: cs_uri_query {
    label: "CS URI Query"
    description: "Uniform Resource Identifier (URI) identifying the downloaded source."
    type: string
    sql: ${TABLE}.cs_uri_query;;
  }

  dimension: download_category {
    label: "Download Category"
    description: "The download category ie App vs. Server"
    type: string
    sql: ${TABLE}.category ;;
  }

  dimension: download_type {
    description: "eg. Desktop, EE, TE"
    type: string
    sql: ${TABLE}."TYPE" ;;
  }

  dimension: operating_system {
    description: "The operating system the download is intended for."
    type: string
    sql: ${TABLE}.os ;;
  }

  dimension: source {
    description: "The source of the download ie Mattermost.com, Github.com, Mattermost.org, etc. (null if creferrer is not populated)"
    type: string
    sql: ${TABLE}.server_source  ;;
  }

  dimension: bytessent {
    label: "Bytes Sent"
    description: "The number of bytes sent during the download transaction."
    type: string
    sql: ${TABLE}.bytessent ;;
  }

  dimension: creferrer {
    label: "Referrer URL"
    description: "URL of download source (not always populated)."
    type: string
    sql: ${TABLE}.creferrer ;;
  }

  dimension: time_taken {
    label: "Download Duration"
    description: "The time, in seconds, it took to download the resource."
    type: number
    sql: ${TABLE}.time_taken ;;
  }

  dimension: useragent {
    description: "Text identifying the browser and operating system of the user"
    label: "User Agent"
    type: string
    sql: ${TABLE}."USERAGENT" ;;
  }

  dimension: version {
    description: "The version of the downloaded resource."
    type: string
    sql: ${TABLE}."VERSION" ;;
  }

  measure: unique_download_count {
    label: "Unique Downloads"
    description: "The count of unique IP's that have performed downloads."
    type: count_distinct
    sql: ${ip_address} ;;
  }

  measure: unique_team_download_count {
    label: "Unique Team Downloads"
    description: "The count of unique IP's that have performed a team edition server download."
    type: count_distinct
    sql: CASE WHEN ${download_type} = 'team' THEN ${ip_address} ELSE null END;;
  }

  measure: unique_enterprise_download_count {
    label: "Unique Enterprise Downloads"
    description: "The count of unique IP's that have performed a enterprise edition server download."
    type: count_distinct
    sql: CASE WHEN ${download_type} = 'enterprise' THEN ${ip_address} ELSE null END;;
  }

  measure: download_count {
    label: "Total Downloads"
    description: "The total number of downloads performed"
    type: count
    drill_fields: [log_date, ip_address, download_category, download_type, version, source, creferrer, useragent, download_count]
  }

  measure: app_downloads {
    description: "The total number of desktop app downloads performed."
    filters: {
      field: download_category
      value: "app"
    }
    type: count
  }

  measure: unique_app_downloads {
    description: "The count of unique IP's that have performed a desktop app download."
    filters: {
      field: download_category
      value: "app"
    }
    type: count_distinct
    sql: ${ip_address} ;;
  }

  measure: unique_server_downloads {
    description: "The count of unique IP's that have performed a server download."
    filters: {
      field: download_category
      value: "server"
    }
    type: count_distinct
    sql: ${ip_address} ;;
  }

  measure: server_downloads {
    description: "The total number of server downloads performed."
    filters: {
      field: download_category
      value: "server"
    }
    type: count
  }

  dimension: uri_avg_bytes_sent {
    label: "URI Avg. Bytes Sent"
    description: "The average number of bytes sent, across all downloads ever recorded, for the specific URI."
    type: number
    sql: ${TABLE}.bytessent_uri_avg ;;
  }

}
