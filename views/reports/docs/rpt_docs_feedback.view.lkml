view: rpt_docs_feedback {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "REPORTS_DOCS".rpt_docs_feedback;;
  label: "Documentation Feedback"


  dimension: event_id {
    type: string
    sql: ${TABLE}."EVENT_ID" ;;
    primary_key: yes
    hidden: yes
  }

  dimension_group: timestamp {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.timestamp ;;
    description: "The date and time when the feedback was submitted."
  }

  ### Feedback

  dimension: label {
    type: string
    sql: ${TABLE}.label ;;
    label: "Label"
    group_label: "User Feedback"
    description: "The label of the rating."
  }

  dimension: rating {
    type: number
    sql: ${TABLE}.rating ;;
    label: "Rating"
    group_label: "User Feedback"
    description: "The rating the user provided to the documentation page."
  }

  dimension: feedback {
    type: string
    sql: ${TABLE}.feedback ;;
    label: "Feedback"
    group_label: "User Feedback"
    description: "The text of the feedback the user provided."
  }

  ### Browser information


  dimension: browser_locale {
    type: string
    sql: ${TABLE}.browser_locale ;;
    group_label: "Browser"
    label: "Locale"
    description: "The browser's locale."
  }


  dimension: ua_browser_family {
    type: string
    sql: ${TABLE}.ua_browser_family ;;
    label: "Browser Family"
    group_label: "Browser"
    description: "The family of the browser, as extracted from the user agent."
  }

  dimension: ua_device_family {
    type: string
    sql: ${TABLE}.ua_device_family ;;
    label: "Device Family"
    group_label: "Browser"
    description: "The device the browser is running on, as extracted from the user agent."
  }

  dimension: ua_os_family {
    type: string
    sql: ${TABLE}.ua_os_family ;;
    label: "OS Family"
    group_label: "Browser"
    description: "The OS the browser is running on, as extracted from the user agent."

  }

  ### IP Information


  dimension: client_ip {
    type: string
    sql: ${TABLE}.client_ip ;;
    label: "IP Address"
    group_label: "IP Info"
    description: "The IP of the browser where the feedback was submitted from."
  }


  dimension: geolocated_country_name {
    type: string
    sql: ${TABLE}.geolocated_country_name ;;
    label: "Country Name"
    group_label: "IP Info"
    description: "The name of the country where the feedback was submitted from, derived from IP address geolocation."
  }


  ### Page information

  dimension: page_path {
    type: string
    sql: ${TABLE}.page_path ;;
    label: "Path"
    group_label: "Page"
    description: "The path to the page where the feedback was submitted from."
  }

  dimension: page_title {
    type: string
    sql: ${TABLE}.page_title ;;
    label: "Title"
    group_label: "Page"
    description: "The title of the page."
  }

  dimension: page_search {
    type: string
    sql: ${TABLE}.page_search ;;
    label: "Search"
    group_label: "Page"
    description: "The search query from the page, if any."
  }

  ### Referrer information

  dimension: referrer {
    type: string
    sql: ${TABLE}.referrer ;;
    label: "Referrer"
    group_label: "Referrer"
    description: "The referrer to the current page."
  }

  dimension: referring_domain {
    type: string
    sql: ${TABLE}.referring_domain ;;
    label: "Referrer's domain"
    group_label: "Referrer"
    description: "The domain of the referrer to the current page."
  }

  dimension: initial_referrer {
    type: string
    sql: ${TABLE}.initial_referrer ;;
    label: "Initial Referrer"
    group_label: "Referrer"
    description: "The initial referrer to the current page."
  }

  dimension: initial_referring_domain {
    type: string
    sql: ${TABLE}.initial_referring_domain ;;
    label: "Inital Referrer's Domain"
    group_label: "Referrer"
    description: "The domain of the initial referrer to the current page."
  }

### UTM properties

  dimension: utm_campaign_name {
    type: string
    sql: ${TABLE}.utm_campaign_name ;;
    label: "Campaign"
    group_label: "UTM Properties"
    description: "Name of the campaign."
  }

  dimension: utm_campaign_source {
    type: string
    sql: ${TABLE}.utm_campaign_source ;;
    label: "Source"
    group_label: "UTM Properties"
    description: "Source of the traffic."
  }

  dimension: utm_campaign_medium {
    type: string
    sql: ${TABLE}.utm_campaign_medium ;;
    label: "Medium"
    group_label: "UTM Properties"
    description: "Advertising medium."
  }

  ### Metrics

  measure: count {
    type: count
    drill_fields: [page_path, utm_campaign_name, geolocated_country_name]
  }
}
