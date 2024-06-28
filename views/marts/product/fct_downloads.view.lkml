# The name of this view in Looker is "Fct Downloads"
view: fct_downloads {
  sql_table_name: "MART_PRODUCT".fct_downloads ;;
  label: "  Downloads: Request"

  dimension: request_id {
    type: string
    sql: ${TABLE}.request_id ;;
    primary_key: yes
    hidden: yes
  }


  dimension: daily_ip_id {
    type: string
    sql: ${TABLE}.daily_ip_id ;;
    description: "A unique id for each IP and date."
    hidden: yes
  }


  ###
  ### Dates & timestamps
  ###

  dimension_group: log_at {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.log_at ;;
    description: "The timestamp when the download request was made."
  }

  dimension_group: log_date {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.log_date ;;
    description: "The date that the download request occurred."
    # Log at also includes time
    hidden: yes
  }



  ###
  ### Client information
  ###

  dimension: client_fingerprint {
    type: string
    sql: ${TABLE}.client_fingerprint ;;
    description: "A hash to help distinguish between different clients from the same IP address."
  }

  dimension: client_ip {
    type: string
    sql: ${TABLE}.client_ip ;;
    description: "The IP address of the client that made the request."
  }


  ###
  ### HTTP request information
  ###

  dimension: cookie {
    type: string
    sql: ${TABLE}.cookie ;;
    description: "The Cookie header in the request, including name-value pairs and any attributes."
    group_label: "HTTP Request Information"
  }

  dimension: host_header {
    type: string
    sql: ${TABLE}.host_header ;;
    description: "The HTTP Host header value for the request."
    group_label: "HTTP Request Information"
  }

  dimension: http_method {
    type: string
    sql: ${TABLE}.http_method ;;
    description: "The HTTP method of the request"
    group_label: "HTTP Request Information"
  }


  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
    description: "The HTTP status code that CloudFront returned to the viewer. Should be 2xx."
    group_label: "HTTP Request Information"
  }


  dimension: protocol {
    type: string
    sql: ${TABLE}.protocol ;;
    description: "The protocol used for the request."
    group_label: "HTTP Request Information"
  }

  dimension: uri {
    type: string
    sql: ${TABLE}.uri ;;
    description: "The portion of the URI that identifies the path and object."
    group_label: "HTTP Request Information"
  }

  dimension: query_string {
    type: string
    sql: ${TABLE}.query_string ;;
    description: "The query string portion of the URI, if any."
    group_label: "HTTP Request Information"
  }

  dimension: referrer_url {
    type: string
    sql: ${TABLE}.referrer_url ;;
    description: "The page that lead to the download request (if not a direct download). The value of the Referer field in the request header."
    group_label: "HTTP Request Information"
  }

  dimension: request_bytes {
    type: number
    sql: ${TABLE}.request_bytes ;;
    description: "The total number of bytes that the viewer sent in the request, including headers."
    group_label: "HTTP Request Information"
  }

  dimension: response_bytes {
    type: number
    sql: ${TABLE}.response_bytes ;;
    description: "The number of bytes sent by the server to the client in response to the request, including headers."
    group_label: "HTTP Request Information"
  }

  dimension: time_taken {
    type: string
    sql: ${TABLE}.time_taken ;;
    description: "The number of seconds (to the thousandth of a second, for example, 0.082) from when the server receives the viewer's request to when the server writes the last byte of the response to the output queue, as measured on the server. From the perspective of the viewer, the total time to get the full response will be longer than this value because of network latency and TCP buffering."
    group_label: "HTTP Request Information"
  }


  ###
  ### Downloaded file details
  ###

  dimension: download_type {
    type: string
    sql: ${TABLE}.download_type ;;
  }


  dimension: operating_system {
    type: string
    sql: ${TABLE}.operating_system ;;
    description: "The operating system the download is for."
  }


  dimension: version {
    type: string
    sql: ${TABLE}.version ;;
    label: "Full"
    group_label: "Version"
  }

  dimension: version_major {
    type: string
    sql: ${TABLE}.version_major ;;
    label: "Major"
    group_label: "Version"
  }

  dimension: version_minor {
    type: string
    sql: ${TABLE}.version_minor ;;
    label: "Minor"
    group_label: "Version"
  }

  dimension: version_patch {
    type: string
    sql: ${TABLE}.version_patch ;;
    label: "Patch"
    group_label: "Version"
  }

  ###
  ### Information extracted from User-Agent header
  ###


  dimension: user_agent {
    type: string
    sql: ${TABLE}.user_agent ;;
    label: "Raw"
    description: "The user agent string"
    group_label: "User Agent"
  }

  dimension: ua_browser_family {
    type: string
    sql: ${TABLE}.ua_browser_family ;;
    label: "Browser Family"
    description: "The browser family of the user agent."
    group_label: "User Agent"
  }

  dimension: ua_os_family {
    type: string
    sql: ${TABLE}.ua_os_family ;;
    label: "OS Family"
    description: "The Operating System family of the user agent."
    group_label: "User Agent"
  }


  ###
  ### Metrics
  ###

  measure: download_count {
    label: "Total Downloads"
    description: "The total number of downloads performed"
    type: count
    drill_fields: [log_at_time, client_ip, uri, download_type, version, referrer_url, user_agent]
  }

  measure: unique_download_ip_count {
    label: "Total Distinct IPs"
    description: "The total number of distinct IPs requesting a download"
    type: count_distinct
    drill_fields: [log_at_time, client_ip, uri, download_type, version, referrer_url, user_agent]
    sql: ${client_ip} ;;
  }

  measure: unique_download_client_count {
    label: "Total Distinct Clients"
    description: "The total number of distinct clients requesting a download"
    type: count_distinct
    drill_fields: [log_at_time, client_ip, uri, download_type, version, referrer_url, user_agent]
    sql: ${client_fingerprint} ;;
  }

  measure: avg_download_size {
    label: "Average download size"
    description: "The average download size in bytes"
    type: average
    sql: ${response_bytes} ;;
  }
}
