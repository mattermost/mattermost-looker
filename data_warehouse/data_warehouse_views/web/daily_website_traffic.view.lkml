# This is the view file for the analytics.web.daily_website_traffic table.
view: daily_website_traffic {
  sql_table_name: web.daily_website_traffic ;;
  view_label: "Daily Website Traffic"

  # FILTERS

  # DIMENSIONS
  dimension: anonymous_id {
    description: "" 
    type: string
    sql: ${TABLE}.anonymous_id ;;
    hidden: no
  }

  dimension: channel {
    description: "" 
    type: string
    sql: ${TABLE}.channel ;;
    hidden: no
  }

  dimension: context_app_build {
    description: "" 
    type: string
    sql: ${TABLE}.context_app_build ;;
    hidden: no
  }

  dimension: context_app_name {
    description: "" 
    type: string
    sql: ${TABLE}.context_app_name ;;
    hidden: no
  }

  dimension: context_app_namespace {
    description: "" 
    type: string
    sql: ${TABLE}.context_app_namespace ;;
    hidden: no
  }

  dimension: context_app_version {
    description: "" 
    type: string
    sql: ${TABLE}.context_app_version ;;
    hidden: no
  }

  dimension: context_ip {
    description: "" 
    type: string
    sql: ${TABLE}.context_ip ;;
    hidden: no
  }

  dimension: context_library_name {
    description: "" 
    type: string
    sql: ${TABLE}.context_library_name ;;
    hidden: no
  }

  dimension: context_library_version {
    description: "" 
    type: string
    sql: ${TABLE}.context_library_version ;;
    hidden: no
  }

  dimension: context_locale {
    description: "" 
    type: string
    sql: ${TABLE}.context_locale ;;
    hidden: no
  }

  dimension: context_os_name {
    description: "" 
    type: string
    sql: ${TABLE}.context_os_name ;;
    hidden: no
  }

  dimension: context_os_version {
    description: "" 
    type: string
    sql: ${TABLE}.context_os_version ;;
    hidden: no
  }

  dimension: context_page_path {
    description: "" 
    type: string
    sql: ${TABLE}.context_page_path ;;
    hidden: no
  }

  dimension: context_page_referrer {
    description: "" 
    type: string
    sql: ${TABLE}.context_page_referrer ;;
    hidden: no
  }

  dimension: context_page_search {
    description: "" 
    type: string
    sql: ${TABLE}.context_page_search ;;
    hidden: no
  }

  dimension: context_page_title {
    description: "" 
    type: string
    sql: ${TABLE}.context_page_title ;;
    hidden: no
  }

  dimension: context_page_url {
    description: "" 
    type: string
    sql: ${TABLE}.context_page_url ;;
    hidden: no
  }

  dimension: context_screen_density {
    description: "" 
    type: number
    sql: ${TABLE}.context_screen_density ;;
    hidden: no
  }

  dimension: context_traits_portal_customer_id {
    description: "" 
    type: string
    sql: ${TABLE}.context_traits_portal_customer_id ;;
    hidden: no
  }

  dimension: context_useragent {
    description: "" 
    type: string
    sql: ${TABLE}.context_useragent ;;
    hidden: no
  }

  dimension: name {
    description: "" 
    type: string
    sql: ${TABLE}.name ;;
    hidden: no
  }

  dimension: objectobjectpath {
    description: "" 
    type: string
    sql: ${TABLE}.objectobjectpath ;;
    hidden: no
  }

  dimension: objectobjectreferrer {
    description: "" 
    type: string
    sql: ${TABLE}.objectobjectreferrer ;;
    hidden: no
  }

  dimension: objectobjectsearch {
    description: "" 
    type: string
    sql: ${TABLE}.objectobjectsearch ;;
    hidden: no
  }

  dimension: objectobjecttitle {
    description: "" 
    type: string
    sql: ${TABLE}.objectobjecttitle ;;
    hidden: no
  }

  dimension: objectobjecturl {
    description: "" 
    type: string
    sql: ${TABLE}.objectobjecturl ;;
    hidden: no
  }

  dimension: path {
    description: "" 
    type: string
    sql: ${TABLE}.path ;;
    hidden: no
  }

  dimension: referrer {
    description: "" 
    type: string
    sql: ${TABLE}.referrer ;;
    hidden: no
  }

  dimension: search {
    description: "" 
    type: string
    sql: ${TABLE}.search ;;
    hidden: no
  }

  dimension: title {
    description: "" 
    type: string
    sql: ${TABLE}.title ;;
    hidden: no
  }

  dimension: url {
    description: "" 
    type: string
    sql: ${TABLE}.url ;;
    hidden: no
  }

  dimension: user_id {
    description: "" 
    type: string
    sql: ${TABLE}.user_id ;;
    hidden: no
  }

  dimension: id {
    description: "" 
    type: string
    sql: ${TABLE}.id ;;
    hidden: no
  }

  dimension: utm_source {
    description: "" 
    type: string
    sql: ${TABLE}.utm_source ;;
    hidden: no
  }

  dimension: utm_medium {
    description: "" 
    type: string
    sql: ${TABLE}.utm_medium ;;
    hidden: no
  }

  dimension: utm_campaign {
    description: "" 
    type: string
    sql: ${TABLE}.utm_campaign ;;
    hidden: no
  }

  dimension: utm_adgroup {
    description: "" 
    type: string
    sql: ${TABLE}.utm_adgroup ;;
    hidden: no
  }

  dimension: utm_content {
    description: "" 
    type: string
    sql: ${TABLE}.utm_content ;;
    hidden: no
  }

  dimension: utm_term {
    description: "" 
    type: string
    sql: ${TABLE}.utm_term ;;
    hidden: no
  }

  dimension: gclid {
    description: "" 
    type: string
    sql: ${TABLE}.gclid ;;
    hidden: no
  }

  dimension: referrer_search_term {
    description: "" 
    type: string
    sql: ${TABLE}.referrer_search_term ;;
    hidden: no
  }

  dimension: referrer_source {
    description: "" 
    type: string
    sql: ${TABLE}.referrer_source ;;
    hidden: no
  }

  
  # DIMENSION GROUPS/DATES
  dimension_group: logging {
    description: "" 
    type: time
    timeframes: [date, month, year]
    sql: ${TABLE}.date ;;
    hidden: no
  }

  dimension_group: timestamp {
	description: "" 
	type: time
	timeframes: [date, month, year]
    sql: ${TABLE}.timestamp ;;
    hidden: no
  }

  
  # MEASURES
  measure: count {
    description: "Count of rows/occurrences."
    type: count
  }

  measure: anonymous_count {
    label: " Anonymous Count"
    description: "The distinct count of Anonymouss per grouping."
    type: count_distinct
    sql: ${anonymous_id} ;;
  }

  measure: context_traits_portal_customer_count {
    label: " Context_Traits_Portal_Customer Count"
    description: "The distinct count of Context_Traits_Portal_Customers per grouping."
    type: count_distinct
    sql: ${context_traits_portal_customer_id} ;;
  }

  measure: user_count {
    label: " User Count"
    description: "The distinct count of Users per grouping."
    type: count_distinct
    sql: ${user_id} ;;
  }


}