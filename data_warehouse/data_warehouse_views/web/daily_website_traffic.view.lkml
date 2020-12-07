# This is the view file for the analytics.web.daily_website_traffic table.
view: daily_website_traffic {
  sql_table_name: web.daily_website_traffic ;;
  view_label: "Daily Website Traffic"

  # FILTERS

  # DIMENSIONS
  dimension: anonymous_id {
    description: "The unique identifier of the user visiting the mattermost web property."
    type: string
    sql: ${TABLE}.anonymous_id ;;
    hidden: no
  }

  dimension: web_property {
    description: "The Mattermost Web Property visited i.e. WWW, Integrations, Customers, Support."
    type: string
    sql: CASE WHEN coalesce(split_part(regexp_substr(${context_page_url},
                                          '^(https://|http://)([a-z0-9-]{1,20}[\.]{1}|[A-Za-z0-9-]{1,100})[A-Za-z0-9-]{0,100}[\.]{1}[a-z]{1,10}'),
                            '//', 2), '') NOT IN ('mattermost.com', 'integrations.mattermost.com', 'support.mattermost.com','customers.mattermost.com')
                            THEN 'Other'
              ELSE split_part(regexp_substr(${context_page_url},
                                          '^(https://|http://)([a-z0-9-]{1,20}[\.]{1}|[A-Za-z0-9-]{1,100})[A-Za-z0-9-]{0,100}[\.]{1}[a-z]{1,10}'),
                            '//', 2) END ;;
  }

  dimension: channel {
    description: ""
    type: string
    sql: ${TABLE}.channel ;;
    hidden: yes
  }

  dimension: context_app_build {
    description: ""
    type: string
    sql: ${TABLE}.context_app_build ;;
    hidden: yes
  }

  dimension: context_app_name {
    description: ""
    type: string
    sql: ${TABLE}.context_app_name ;;
    hidden: yes
  }

  dimension: context_app_namespace {
    description: ""
    type: string
    sql: ${TABLE}.context_app_namespace ;;
    hidden: yes
  }

  dimension: context_app_version {
    description: ""
    type: string
    sql: ${TABLE}.context_app_version ;;
    hidden: yes
  }

  dimension: context_ip {
    description: "The IP Address of the user visiting the webpage."
    type: string
    sql: ${TABLE}.context_ip ;;
    hidden: no
  }

  dimension: context_library_name {
    description: ""
    type: string
    sql: ${TABLE}.context_library_name ;;
    hidden: yes
  }

  dimension: context_library_version {
    description: ""
    type: string
    sql: ${TABLE}.context_library_version ;;
    hidden: yes
  }

  dimension: context_locale {
    description: "General location information about the user visiting the webpage (en-US, en-UK, de, etc)."
    type: string
    sql: CASE WHEN nullif(SPLIT_PART(${TABLE}.context_locale, '-', 2), '') IS NULL THEN UPPER(${TABLE}.context_locale)
                ELSE UPPER(SPLIT_PART(${TABLE}.context_locale, '-', 2)) END
          ;;
    hidden: no
  }

  dimension: context_os_name {
    description: ""
    type: string
    sql: ${TABLE}.context_os_name ;;
    hidden: yes
  }

  dimension: context_os_version {
    description: ""
    type: string
    sql: ${TABLE}.context_os_version ;;
    hidden: yes
  }

  dimension: context_page_path {
    label: "Page Path"
    description: ""
    type: string
    sql: COALESCE(${TABLE}.context_page_path, ${TABLE}.path) ;;
    hidden: no
  }

  dimension: context_page_referrer {
    label: "Page Referrer URL"
    type: string
    sql: ${TABLE}.context_page_referrer ;;
    hidden: no
  }

  dimension: context_page_search {
    label: "Page Search"
    description: "The UTM tracking parameter string in the url of the page URL visited."
    type: string
    sql: ${TABLE}.context_page_search ;;
    hidden: no
  }

  dimension: context_page_title {
    label: "Page Title"
    description: "The title of the webpage visited."
    type: string
    sql: ${TABLE}.context_page_title ;;
    hidden: no
  }

  dimension: context_page_url {
    label: "Page URL"
    description: "The URL of the webpage visited (less the UTM tracking parameters)."
    type: string
    sql: CASE WHEN NULLIF(SPLIT_PART(${TABLE}.context_page_url, '?', 2),'') IS NOT NULL THEN
              CASE WHEN regexp_substr(SPLIT_PART(${TABLE}.context_page_url, '?', 1), 'preparing[-]{1}workspace') = 'preparing-workspace' THEN 'https://customers.mattermost.com/preparing-workspace'
              ELSE SPLIT_PART(${TABLE}.context_page_url, '?', 1) END
            WHEN regexp_substr(${TABLE}.context_page_url, 'preparing[-]{1}workspace') = 'preparing-workspace' THEN 'https://customers.mattermost.com/preparing-workspace'
            WHEN NULLIF(SPLIT_PART(${TABLE}.context_page_url, '/requests/', 2),'') IS NOT NULL THEN SPLIT_PART(${TABLE}.context_page_url, '/requests/', 1) || '/requests'
          ELSE ${TABLE}.context_page_url END ;;
    hidden: no
  }


  dimension: context_screen_density {
    description: "The Screen Density of the device used to visit the webpage."
    type: number
    sql: ${TABLE}.context_screen_density ;;
    hidden: no
  }

  dimension: context_traits_portal_customer_id {
    description: "The Customer Web Portal Id of the user visting the webpage. This is populated when a user has logged into the web portal and been assigned a user id."
    type: string
    sql: ${TABLE}.context_traits_portal_customer_id ;;
    hidden: no
  }

  dimension: context_useragent {
    description: "The user agent string providing the raw information about the os, browser, and device used to visit the webpage."
    group_label: " User Agent Info."
    type: string
    sql: ${TABLE}.context_useragent ;;
    hidden: no
  }

  dimension: name {
    description: ""
    type: string
    sql: COALESCE(${TABLE}.name, '') ;;
    hidden: no
  }

  dimension: objectobjectpath {
    description: ""
    type: string
    sql: ${TABLE}.objectobjectpath ;;
    hidden: yes
  }

  dimension: objectobjectreferrer {
    description: ""
    type: string
    sql: ${TABLE}.objectobjectreferrer ;;
    hidden: yes
  }

  dimension: objectobjectsearch {
    description: ""
    type: string
    sql: ${TABLE}.objectobjectsearch ;;
    hidden: yes
  }

  dimension: objectobjecttitle {
    description: ""
    type: string
    sql: ${TABLE}.objectobjecttitle ;;
    hidden: yes
  }

  dimension: objectobjecturl {
    description: ""
    type: string
    sql: ${TABLE}.objectobjecturl ;;
    hidden: yes
  }

  dimension: path {
    description: ""
    type: string
    sql: ${TABLE}.path ;;
    hidden: yes
  }

  dimension: referrer {
    description: ""
    type: string
    sql: ${TABLE}.referrer ;;
    hidden: yes
  }

  dimension: search {
    description: ""
    type: string
    sql: ${TABLE}.search ;;
    hidden: yes
  }

  dimension: title {
    description: ""
    type: string
    sql: ${TABLE}.title ;;
    hidden: yes
  }

  dimension: url {
    description: ""
    type: string
    sql: ${TABLE}.url ;;
    hidden: yes
  }

  dimension: user_id {
    description: ""
    type: string
    sql: ${TABLE}.user_id ;;
    hidden: yes
  }

  dimension: id {
    description: ""
    type: string
    sql: ${TABLE}.id ;;
    hidden: yes
  }

  dimension: utm_source {
    group_label: " Marketing UTM Info."
    label: "UTM Source"
    description: "The Mattermost advertising source (google, bing, etc) that directed the user to the Mattermost webpage URL."
    type: string
    sql: NULLIF(INITCAP(lower(COALESCE(split_part(regexp_substr(${context_page_search}, 'utm_source=[A-Za-z0-9_]{0,100}'), '=', 2), ${TABLE}.context_campaign_source, ${TABLE}.context_campaign_source__c))),'') ;;
    hidden: no
  }

  dimension: utm_medium {
    group_label: " Marketing UTM Info."
    label: "UTM Medium"
    description: "The Mattermost advertising medium (cpc, display, etc.) that directed the user to the Mattermost webpage URL."
    type: string
    sql: NULLIF(INITCAP(lower(COALESCE(split_part(regexp_substr(${context_page_search}, 'utm_medium=[A-Za-z0-9_]{0,100}'), '=', 2), ${TABLE}.context_campaign_medium, ${TABLE}.context_campaign_medium__c))),'') ;;
    hidden: no
  }

  dimension: utm_campaign {
    group_label: " Marketing UTM Info."
    label: "UTM Campaign"
    description: "The Mattermost advertising campaign name that directed the user to the Mattermost webpage URL."
    type: string
    sql: NULLIF(INITCAP(lower(COALESCE(replace(replace(split_part(regexp_substr(${context_page_search}, 'utm_campaign=[A-Za-z0-9_%-]{0,100}'), '=', 2),
                        '%2B', ''), '%20', ' '), ${TABLE}.context_campaign_name, ${TABLE}.context_campaign_campaign__c))),'') ;;
    hidden: no
  }

  dimension: utm_adgroup {
    group_label: " Marketing UTM Info."
    label: "UTM Adgroup"
    description: "The Mattermost advertising adgroup that directed the user to the Mattermost webpage URL."
    type: string
    sql: NULLIF(INITCAP(lower(COALESCE(split_part(regexp_substr(${context_page_search}, 'utm_adgroup=[A-Za-z0-9_]{0,100}'), '=', 2), ${TABLE}.context_campaign_adgroup, ${TABLE}.context_campaign_adgroup__c))), '') ;;
    hidden: no
  }

  dimension: utm_content {
    group_label: " Marketing UTM Info."
    label: "UTM Content ID"
    description: "The Mattermost advertising content id that directed the user to the webpage URL."
    type: string
    sql: NULLIF(INITCAP(lower(COALESCE(split_part(regexp_substr(${context_page_search}, 'utm_content=[A-Za-z0-9_]{0,100}'), '=', 2), ${TABLE}.context_campaign_content, ${TABLE}.context_campaign_content__c))),'') ;;
    hidden: no
  }

  dimension: utm_term {
    group_label: " Marketing UTM Info."
    label: "UTM Term"
    description: "The Mattermost advertising term that directed the user to the webpage URL."
    type: string
    sql: NULLIF(INITCAP(lower(CASE WHEN REGEXP_SUBSTR(COALESCE(replace(replace(split_part(regexp_substr(${context_page_search}, 'utm_term=[A-Za-z0-9_%-]{0,100}'), '=', 2), '%2B',
                        ''), '%20', ' '), ${TABLE}.context_campaign_term, ${TABLE}.context_campaign_term__c), '^[0-9]{1}(\-|\_)') IS NOT NULL THEN NULL
                              ELSE COALESCE(replace(replace(split_part(regexp_substr(${context_page_search}, 'utm_term=[A-Za-z0-9_%-]{0,100}'), '=', 2), '%2B',
                        ''), '%20', ' '), ${TABLE}.context_campaign_term, ${TABLE}.context_campaign_term__c) END)),'') ;;
    hidden: no
  }

  dimension: gclid {
    description: "The Gclid ID associated with the Mattermost advertising campaign that directed the user to the webpage URL"
    type: string
    sql: ${TABLE}.gclid ;;
    hidden: no
  }

  dimension: referrer_search_term {
    description: ""
    type: string
    sql:  split_part(replace(replace(replace(replace(split_part(
                                                           regexp_substr(COALESCE(${TABLE}.context_page_referrer
                                                                                         , ${TABLE}.referrer), 'q=[A-Za-z0-9_%+/:.-]{0,100}'),
                                                           '=', 2), '%2B', ''), '%20', ' '), '%2', ''), '+', ' '), ' %',
                   1)  ;;
    hidden: yes
  }

  dimension: referrer_source {
    description: ""
    type: string
    sql: CASE
                                                       WHEN split_part(regexp_substr(COALESCE(${TABLE}.context_page_referrer
                                                                                         , ${TABLE}.referrer)
                                                                           ,
                                                                                     '^(https://|http://)([a-z0-9-]{1,20}[\.]{1}|[A-Za-z0-9-]{1,100})[A-Za-z0-9]{0,100}[\.]{1}[a-z]{1,10}'),
                                                                       '//'
                                                           , 2) IS NULL
                                                           THEN 'Other'
                                                           ELSE split_part(regexp_substr(
                                                                                   COALESCE(${TABLE}.context_page_referrer, ${TABLE}.referrer)
                                                                               ,
                                                                                   '^(https://|http://)([a-z0-9-]{1,20}[\.]{1}|[A-Za-z0-9-]{1,100})[A-Za-z0-9-]{0,100}[\.]{1}[a-z]{1,10}'),
                                                                           '//'
                                                               , 2) END ;;
    hidden: yes
  }

  filter: week_to_date {
    description: "Boolean used to filter data to compare current week to previous week's week to date metrics."
    type: yesno
    sql: CASE WHEN ${logging_week}::DATE <> date_trunc('week', CURRENT_DATE::DATE) AND DAYOFWEEK(${logging_date}::DATE) <= DAYOFWEEK(CURRENT_DATE::DATE)
    THEN TRUE ELSE FALSE END;;
  }

  filter: month_to_date {
    description: "Boolean used to filter data to compare current month to previous month's month to date metrics."
    type: yesno
    sql: CASE WHEN (${logging_month} || '-01')::DATE = date_trunc('month', CURRENT_DATE) THEN TRUE
            WHEN (${logging_month} || '-01')::DATE <> date_trunc('month', CURRENT_DATE::DATE) AND EXTRACT(DAY FROM ${logging_date}::DATE)::int <= EXTRACT(DAY FROM CURRENT_DATE::DATE)
            THEN TRUE ELSE FALSE END;;
  }


  # DIMENSION GROUPS/DATES
  dimension_group: logging {
    description: ""
    type: time
    timeframes: [date, time, week, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.timestamp ;;
    hidden: no
  }

  dimension_group: timestamp {
  description: ""
  type: time
  timeframes: [time, date, week, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.timestamp ;;
    hidden: no
  }


  # MEASURES
  measure: count {
    label: "Pageviews"
    description: "The total # of Pageviews i.e. total number of times all users viewed the webpage."
    type: count
  }

  measure: anonymous_count {
    label: "User Count"
    description: "The distinct count of Anonymouss per grouping."
    type: count_distinct
    sql: ${anonymous_id} ;;
  }

  measure: context_traits_portal_customer_count {
    label: "Portal Customer Count"
    description: "The distinct count of Context_Traits_Portal_Customers per grouping."
    type: count_distinct
    sql: ${context_traits_portal_customer_id} ;;
  }


}
