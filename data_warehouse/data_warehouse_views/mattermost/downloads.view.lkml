view: downloads {
  sql_table_name: MATTERMOST.DOWNLOADS ;;

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

  measure: download_count {
    label: "Total Downloads"
    description: "The total number of downloads performed"
    type: count
  }

  measure: app_downloads {
    description: "The total number of desktop app downloads performed."
    filters: {
      field: download_category
      value: "app"
    }
    type: count
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
