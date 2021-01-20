# This is the view file for the analytics.mattermost.cloud_clearbit table.
view: cloud_clearbit {
  sql_table_name: mattermost.cloud_clearbit ;;
  view_label: "Cloud Clearbit"

  # FILTERS

  # DIMENSIONS
  dimension: person_github_avatar {
    description: ""
    type: string
    sql: ${TABLE}.person_github_avatar ;;
    hidden: no
  }

  dimension: company_name {
    description: ""
    type: string
    sql: ${TABLE}.company_name ;;
    hidden: no
  }

  dimension: company_timezone {
    description: ""
    type: string
    sql: ${TABLE}.company_timezone ;;
    hidden: no
  }

  dimension: person_employment_name {
    description: ""
    type: string
    sql: ${TABLE}.person_employment_name ;;
    hidden: no
  }

  dimension: company_twitter_bio {
    description: ""
    type: string
    sql: ${TABLE}.company_twitter_bio ;;
    hidden: no
  }

  dimension: person_timezone {
    description: ""
    type: string
    sql: ${TABLE}.person_timezone ;;
    hidden: no
  }

  dimension: person_email {
    description: ""
    type: string
    sql: ${TABLE}.person_email ;;
    hidden: no
  }

  dimension: company_twitter_followers {
    description: ""
    type: number
    sql: ${TABLE}.company_twitter_followers ;;
    hidden: no
  }

  dimension: company_twitter_avatar {
    description: ""
    type: string
    sql: ${TABLE}.company_twitter_avatar ;;
    hidden: no
  }

  dimension: company_category_subindustry {
    description: ""
    type: string
    sql: ${TABLE}.company_category_subindustry ;;
    hidden: no
  }

  dimension: person_inactiveat {
    description: ""
    type: string
    sql: ${TABLE}.person_inactiveat ;;
    hidden: no
  }

  dimension: company_parent_domain {
    description: ""
    type: string
    sql: ${TABLE}.company_parent_domain ;;
    hidden: no
  }

  dimension: person_name_givenname {
    description: ""
    type: string
    sql: ${TABLE}.person_name_givenname ;;
    hidden: no
  }

  dimension: person_employment_seniority {
    description: ""
    type: string
    sql: ${TABLE}.person_employment_seniority ;;
    hidden: no
  }

  dimension: person_site {
    description: ""
    type: string
    sql: ${TABLE}.person_site ;;
    hidden: no
  }

  dimension: company_facebook_likes {
    description: ""
    type: number
    sql: ${TABLE}.company_facebook_likes ;;
    hidden: no
  }

  dimension: person_location {
    description: ""
    type: string
    sql: ${TABLE}.person_location ;;
    hidden: no
  }

  dimension: company_type {
    description: ""
    type: string
    sql: ${TABLE}.company_type ;;
    hidden: no
  }

  dimension: person_employment_domain {
    description: ""
    type: string
    sql: ${TABLE}.person_employment_domain ;;
    hidden: no
  }

  dimension: person_googleplus_handle {
    description: ""
    type: string
    sql: ${TABLE}.person_googleplus_handle ;;
    hidden: no
  }

  dimension: person_id {
    description: ""
    type: string
    sql: ${TABLE}.person_id ;;
    hidden: no
  }

  dimension: company_geo_streetnumber {
    description: ""
    type: string
    sql: ${TABLE}.company_geo_streetnumber ;;
    hidden: no
  }

  dimension: company_id {
    description: ""
    type: string
    sql: ${TABLE}.company_id ;;
    hidden: no
  }

  dimension: person_name_familyname {
    description: ""
    type: string
    sql: ${TABLE}.person_name_familyname ;;
    hidden: no
  }

  dimension: person_twitter_following {
    description: ""
    type: number
    sql: ${TABLE}.person_twitter_following ;;
    hidden: no
  }

  dimension: company_geo_statecode {
    description: ""
    type: string
    sql: ${TABLE}.company_geo_statecode ;;
    hidden: no
  }

  dimension: company_facebook_handle {
    description: ""
    type: string
    sql: ${TABLE}.company_facebook_handle ;;
    hidden: no
  }

  dimension: company_location {
    description: ""
    type: string
    sql: ${TABLE}.company_location ;;
    hidden: no
  }

  dimension: company_category_naicscode {
    description: ""
    type: string
    sql: ${TABLE}.company_category_naicscode ;;
    hidden: no
  }

  dimension: company_ultimateparent_domain {
    description: ""
    type: string
    sql: ${TABLE}.company_ultimateparent_domain ;;
    hidden: no
  }

  dimension: company_twitter_site {
    description: ""
    type: string
    sql: ${TABLE}.company_twitter_site ;;
    hidden: no
  }

  dimension: company_category_industry {
    description: ""
    type: string
    sql: ${TABLE}.company_category_industry ;;
    hidden: no
  }

  dimension: person_github_company {
    description: ""
    type: string
    sql: ${TABLE}.person_github_company ;;
    hidden: no
  }

  dimension: company_identifiers_usein {
    description: ""
    type: string
    sql: ${TABLE}.company_identifiers_usein ;;
    hidden: no
  }

  dimension: company_site_phonenumbers {
    description: ""
    type: string
    sql: ${TABLE}.company_site_phonenumbers ;;
    hidden: no
  }

  dimension: company_geo_lng {
    description: ""
    type: number
    sql: ${TABLE}.company_geo_lng ;;
    hidden: no
  }

  dimension: person_activeat {
    description: ""
    type: string
    sql: ${TABLE}.person_activeat ;;
    hidden: no
  }

  dimension: company_twitter_id {
    description: ""
    type: string
    sql: ${TABLE}.company_twitter_id ;;
    hidden: no
  }

  dimension: person_github_id {
    description: ""
    type: number
    sql: ${TABLE}.person_github_id ;;
    hidden: no
  }

  dimension: person_gravatar_avatar {
    description: ""
    type: string
    sql: ${TABLE}.person_gravatar_avatar ;;
    hidden: no
  }

  dimension: person_twitter_site {
    description: ""
    type: string
    sql: ${TABLE}.person_twitter_site ;;
    hidden: no
  }

  dimension: company_metrics_employees {
    description: ""
    type: number
    sql: ${TABLE}.company_metrics_employees ;;
    hidden: no
  }

  dimension: person_bio {
    description: ""
    type: string
    sql: ${TABLE}.person_bio ;;
    hidden: no
  }

  dimension: person_employment_subrole {
    description: ""
    type: string
    sql: ${TABLE}.person_employment_subrole ;;
    hidden: no
  }

  dimension: company_twitter_handle {
    description: ""
    type: string
    sql: ${TABLE}.company_twitter_handle ;;
    hidden: no
  }

  dimension: person_emailprovider {
    description: ""
    type: yesno
    sql: ${TABLE}.person_emailprovider ;;
    hidden: no
  }

  dimension: person_geo_state {
    description: ""
    type: string
    sql: ${TABLE}.person_geo_state ;;
    hidden: no
  }

  dimension: company_metrics_alexaglobalrank {
    description: ""
    type: number
    sql: ${TABLE}.company_metrics_alexaglobalrank ;;
    hidden: no
  }

  dimension: person_indexedat {
    description: ""
    type: string
    sql: ${TABLE}.person_indexedat ;;
    hidden: no
  }

  dimension: company_twitter_location {
    description: ""
    type: string
    sql: ${TABLE}.company_twitter_location ;;
    hidden: no
  }

  dimension: company_geo_streetname {
    description: ""
    type: string
    sql: ${TABLE}.company_geo_streetname ;;
    hidden: no
  }

  dimension: company_metrics_marketcap {
    description: ""
    type: number
    sql: ${TABLE}.company_metrics_marketcap ;;
    hidden: no
  }

  dimension: company_geo_countrycode {
    description: ""
    type: string
    sql: ${TABLE}.company_geo_countrycode ;;
    hidden: no
  }

  dimension: person_avatar {
    description: ""
    type: string
    sql: ${TABLE}.person_avatar ;;
    hidden: no
  }

  dimension: person_twitter_avatar {
    description: ""
    type: string
    sql: ${TABLE}.person_twitter_avatar ;;
    hidden: no
  }

  dimension: person_employment_role {
    description: ""
    type: string
    sql: ${TABLE}.person_employment_role ;;
    hidden: no
  }

  dimension: person_geo_statecode {
    description: ""
    type: string
    sql: ${TABLE}.person_geo_statecode ;;
    hidden: no
  }

  dimension: company_linkedin_handle {
    description: ""
    type: string
    sql: ${TABLE}.company_linkedin_handle ;;
    hidden: no
  }

  dimension: person_geo_lat {
    description: ""
    type: number
    sql: ${TABLE}.person_geo_lat ;;
    hidden: no
  }

  dimension: company_techcategories {
    description: ""
    type: string
    sql: ${TABLE}.company_techcategories ;;
    hidden: no
  }

  dimension: company_domainaliases {
    description: ""
    type: string
    sql: ${TABLE}.company_domainaliases ;;
    hidden: no
  }

  dimension: company_indexedat {
    description: ""
    type: string
    sql: ${TABLE}.company_indexedat ;;
    hidden: no
  }

  dimension: person_github_handle {
    description: ""
    type: string
    sql: ${TABLE}.person_github_handle ;;
    hidden: no
  }

  dimension: person_twitter_location {
    description: ""
    type: string
    sql: ${TABLE}.person_twitter_location ;;
    hidden: no
  }

  dimension: company_metrics_fiscalyearend {
    description: ""
    type: number
    sql: ${TABLE}.company_metrics_fiscalyearend ;;
    hidden: no
  }

  dimension: company_category_sector {
    description: ""
    type: string
    sql: ${TABLE}.company_category_sector ;;
    hidden: no
  }

  dimension: person_gravatar_handle {
    description: ""
    type: string
    sql: ${TABLE}.person_gravatar_handle ;;
    hidden: no
  }

  dimension: person_employment_title {
    description: ""
    type: string
    sql: ${TABLE}.person_employment_title ;;
    hidden: no
  }

  dimension: company {
    description: ""
    type: string
    sql: ${TABLE}.company ;;
    hidden: no
  }

  dimension: company_tech {
    description: ""
    type: string
    sql: ${TABLE}.company_tech ;;
    hidden: no
  }

  dimension: company_geo_country {
    description: ""
    type: string
    sql: ${TABLE}.company_geo_country ;;
    hidden: no
  }

  dimension: person_utcoffset {
    description: ""
    type: number
    sql: ${TABLE}.person_utcoffset ;;
    hidden: no
  }

  dimension: company_legalname {
    description: ""
    type: string
    sql: ${TABLE}.company_legalname ;;
    hidden: no
  }

  dimension: company_geo_city {
    description: ""
    type: string
    sql: ${TABLE}.company_geo_city ;;
    hidden: no
  }

  dimension: company_domain {
    description: ""
    type: string
    sql: ${TABLE}.company_domain ;;
    hidden: no
  }

  dimension: company_utcoffset {
    description: ""
    type: number
    sql: ${TABLE}.company_utcoffset ;;
    hidden: no
  }

  dimension: company_phone {
    description: ""
    type: string
    sql: ${TABLE}.company_phone ;;
    hidden: no
  }

  dimension: company_category_siccode {
    description: ""
    type: string
    sql: ${TABLE}.company_category_siccode ;;
    hidden: no
  }

  dimension: company_ticker {
    description: ""
    type: string
    sql: ${TABLE}.company_ticker ;;
    hidden: no
  }

  dimension: person_twitter_statuses {
    description: ""
    type: number
    sql: ${TABLE}.person_twitter_statuses ;;
    hidden: no
  }

  dimension: company_crunchbase_handle {
    description: ""
    type: string
    sql: ${TABLE}.company_crunchbase_handle ;;
    hidden: no
  }

  dimension: company_geo_state {
    description: ""
    type: string
    sql: ${TABLE}.company_geo_state ;;
    hidden: no
  }

  dimension: company_geo_lat {
    description: ""
    type: number
    sql: ${TABLE}.company_geo_lat ;;
    hidden: no
  }

  dimension: person_gravatar_urls {
    description: ""
    type: string
    sql: ${TABLE}.person_gravatar_urls ;;
    hidden: no
  }

  dimension: company_metrics_raised {
    description: ""
    type: number
    sql: ${TABLE}.company_metrics_raised ;;
    hidden: no
  }

  dimension: company_logo {
    description: ""
    type: string
    sql: ${TABLE}.company_logo ;;
    hidden: no
  }

  dimension: person_geo_country {
    description: ""
    type: string
    sql: ${TABLE}.person_geo_country ;;
    hidden: no
  }

  dimension: person_geo_countrycode {
    description: ""
    type: string
    sql: ${TABLE}.person_geo_countrycode ;;
    hidden: no
  }

  dimension: person_github_followers {
    description: ""
    type: number
    sql: ${TABLE}.person_github_followers ;;
    hidden: no
  }

  dimension: person_twitter_favorites {
    description: ""
    type: number
    sql: ${TABLE}.person_twitter_favorites ;;
    hidden: no
  }

  dimension: person_github_following {
    description: ""
    type: number
    sql: ${TABLE}.person_github_following ;;
    hidden: no
  }

  dimension: company_metrics_employeesrange {
    description: ""
    type: string
    sql: ${TABLE}.company_metrics_employeesrange ;;
    hidden: no
  }

  dimension: company_geo_subpremise {
    description: ""
    type: string
    sql: ${TABLE}.company_geo_subpremise ;;
    hidden: no
  }

  dimension: company_foundedyear {
    description: ""
    type: number
    sql: ${TABLE}.company_foundedyear ;;
    hidden: no
  }

  dimension: person {
    description: ""
    type: string
    sql: ${TABLE}.person ;;
    hidden: no
  }

  dimension: person_twitter_followers {
    description: ""
    type: number
    sql: ${TABLE}.person_twitter_followers ;;
    hidden: no
  }

  dimension: company_description {
    description: ""
    type: string
    sql: ${TABLE}.company_description ;;
    hidden: no
  }

  dimension: person_twitter_handle {
    description: ""
    type: string
    sql: ${TABLE}.person_twitter_handle ;;
    hidden: no
  }

  dimension: person_twitter_bio {
    description: ""
    type: string
    sql: ${TABLE}.person_twitter_bio ;;
    hidden: no
  }

  dimension: person_twitter_id {
    description: ""
    type: number
    sql: ${TABLE}.person_twitter_id ;;
    hidden: no
  }

  dimension: company_metrics_alexausrank {
    description: ""
    type: number
    sql: ${TABLE}.company_metrics_alexausrank ;;
    hidden: no
  }

  dimension: company_emailprovider {
    description: ""
    type: yesno
    sql: ${TABLE}.company_emailprovider ;;
    hidden: no
  }

  dimension: person_name_fullname {
    description: ""
    type: string
    sql: ${TABLE}.person_name_fullname ;;
    hidden: no
  }

  dimension: person_gravatar_avatars {
    description: ""
    type: string
    sql: ${TABLE}.person_gravatar_avatars ;;
    hidden: no
  }

  dimension: company_metrics_annualrevenue {
    description: ""
    type: number
    sql: ${TABLE}.company_metrics_annualrevenue ;;
    hidden: no
  }

  dimension: company_metrics_estimatedannualrevenue {
    description: ""
    type: string
    sql: ${TABLE}.company_metrics_estimatedannualrevenue ;;
    hidden: no
  }

  dimension: company_geo_postalcode {
    description: ""
    type: string
    sql: ${TABLE}.company_geo_postalcode ;;
    hidden: no
  }

  dimension: person_fuzzy {
    description: ""
    type: yesno
    sql: ${TABLE}.person_fuzzy ;;
    hidden: no
  }

  dimension: company_tags {
    description: ""
    type: string
    sql: ${TABLE}.company_tags ;;
    hidden: no
  }

  dimension: person_geo_city {
    description: ""
    type: string
    sql: ${TABLE}.person_geo_city ;;
    hidden: no
  }

  dimension: company_category_industrygroup {
    description: ""
    type: string
    sql: ${TABLE}.company_category_industrygroup ;;
    hidden: no
  }

  dimension: company_site_emailaddresses {
    description: ""
    type: string
    sql: ${TABLE}.company_site_emailaddresses ;;
    hidden: no
  }

  dimension: person_facebook_handle {
    description: ""
    type: string
    sql: ${TABLE}.person_facebook_handle ;;
    hidden: no
  }

  dimension: person_linkedin_handle {
    description: ""
    type: string
    sql: ${TABLE}.person_linkedin_handle ;;
    hidden: no
  }

  dimension: company_twitter_following {
    description: ""
    type: number
    sql: ${TABLE}.company_twitter_following ;;
    hidden: no
  }

  dimension: person_geo_lng {
    description: ""
    type: number
    sql: ${TABLE}.person_geo_lng ;;
    hidden: no
  }

  dimension: person_github_blog {
    description: ""
    type: string
    sql: ${TABLE}.person_github_blog ;;
    hidden: no
  }

  dimension: server_id {
    description: ""
    type: string
    sql: ${TABLE}.server_id ;;
    hidden: no
  }


  # DIMENSION GROUPS/DATES

  # MEASURES
  measure: count {
    description: "Count of rows/occurrences."
    type: count
  }

  measure: company_twitter_followers_max {
    description: "The max Company Twitter Followers within each grouping."
    type: max
    group_label: "Company Twitter Followers Measures"
    sql: ${company_twitter_followers} ;;
  }

  measure: company_twitter_followers_min {
    description: "The min Company Twitter Followers within each grouping."
    type: min
    group_label: "Company Twitter Followers Measures"
    sql: ${company_twitter_followers} ;;
  }

  measure: company_twitter_followers_avg {
    description: "The average Company Twitter Followers within each grouping."
    type: average
    group_label: "Company Twitter Followers Measures"
    sql: ${company_twitter_followers} ;;
  }

  measure: company_twitter_followers_median {
    description: "The median  Company Twitter Followers within each grouping."
    type: median
    group_label: "Company Twitter Followers Measures"
    sql: ${company_twitter_followers} ;;
  }

  measure: company_facebook_likes_max {
    description: "The max Company Facebook Likes within each grouping."
    type: max
    group_label: "Company Facebook Likes Measures"
    sql: ${company_facebook_likes} ;;
  }

  measure: company_facebook_likes_min {
    description: "The min Company Facebook Likes within each grouping."
    type: min
    group_label: "Company Facebook Likes Measures"
    sql: ${company_facebook_likes} ;;
  }

  measure: company_facebook_likes_avg {
    description: "The average Company Facebook Likes within each grouping."
    type: average
    group_label: "Company Facebook Likes Measures"
    sql: ${company_facebook_likes} ;;
  }

  measure: company_facebook_likes_median {
    description: "The median  Company Facebook Likes within each grouping."
    type: median
    group_label: "Company Facebook Likes Measures"
    sql: ${company_facebook_likes} ;;
  }

  measure: person_count {
    label: " Person Count"
    description: "The distinct count of Cloud Clearbit Persons within each grouping."
    type: count_distinct
    sql: ${person_id} ;;
  }

  measure: company_count {
    label: " Company Count"
    description: "The distinct count of Cloud Clearbit Companys within each grouping."
    type: count_distinct
    sql: ${company_id} ;;
  }

  measure: person_twitter_following_max {
    description: "The max Person Twitter Followings within each grouping."
    type: max
    group_label: "Person Twitter Following Measures"
    sql: ${person_twitter_following} ;;
  }

  measure: person_twitter_following_min {
    description: "The min Person Twitter Followings within each grouping."
    type: min
    group_label: "Person Twitter Following Measures"
    sql: ${person_twitter_following} ;;
  }

  measure: person_twitter_following_avg {
    description: "The average Person Twitter Followings within each grouping."
    type: average
    group_label: "Person Twitter Following Measures"
    sql: ${person_twitter_following} ;;
  }

  measure: person_twitter_following_median {
    description: "The median  Person Twitter Followings within each grouping."
    type: median
    group_label: "Person Twitter Following Measures"
    sql: ${person_twitter_following} ;;
  }

  measure: companyentifiers_usein_count {
    label: " Companyentifiers Usein Count"
    description: "The distinct count of Cloud Clearbit Companysentifiers Usein within each grouping."
    type: count_distinct
    sql: ${company_identifiers_usein} ;;
  }

  measure: company_twitter_count {
    label: " Company Twitter Count"
    description: "The distinct count of Cloud Clearbit Company Twitters within each grouping."
    type: count_distinct
    sql: ${company_twitter_id} ;;
  }

  measure: person_github_id_max {
    description: "The max Person Github Ids within each grouping."
    type: max
    group_label: "Person Github Id Measures"
    sql: ${person_github_id} ;;
  }

  measure: person_github_id_min {
    description: "The min Person Github Ids within each grouping."
    type: min
    group_label: "Person Github Id Measures"
    sql: ${person_github_id} ;;
  }

  measure: person_github_id_avg {
    description: "The average Person Github Ids within each grouping."
    type: average
    group_label: "Person Github Id Measures"
    sql: ${person_github_id} ;;
  }

  measure: person_github_id_median {
    description: "The median  Person Github Ids within each grouping."
    type: median
    group_label: "Person Github Id Measures"
    sql: ${person_github_id} ;;
  }

  measure: company_metrics_employees_max {
    description: "The max Company Metrics Employees within each grouping."
    type: max
    group_label: "Company Metrics Employees Measures"
    sql: ${company_metrics_employees} ;;
  }

  measure: company_metrics_employees_min {
    description: "The min Company Metrics Employees within each grouping."
    type: min
    group_label: "Company Metrics Employees Measures"
    sql: ${company_metrics_employees} ;;
  }

  measure: company_metrics_employees_avg {
    description: "The average Company Metrics Employees within each grouping."
    type: average
    group_label: "Company Metrics Employees Measures"
    sql: ${company_metrics_employees} ;;
  }

  measure: company_metrics_employees_median {
    description: "The median  Company Metrics Employees within each grouping."
    type: median
    group_label: "Company Metrics Employees Measures"
    sql: ${company_metrics_employees} ;;
  }

  measure: person_emailprovider_count {
    label: "Person_Emailprovider Users"
    description: "The distinct count of Cloud Clearbit with Person Emailprovider marked true."
    group_label: "User Counts"
    type: count_distinct
    sql: case when ${person_emailprovider} then ${server_id}  else null end ;;
  }

  measure: company_metrics_alexaglobalrank_max {
    description: "The max Company Metrics Alexaglobalranks within each grouping."
    type: max
    group_label: "Company Metrics Alexaglobalrank Measures"
    sql: ${company_metrics_alexaglobalrank} ;;
  }

  measure: company_metrics_alexaglobalrank_min {
    description: "The min Company Metrics Alexaglobalranks within each grouping."
    type: min
    group_label: "Company Metrics Alexaglobalrank Measures"
    sql: ${company_metrics_alexaglobalrank} ;;
  }

  measure: company_metrics_alexaglobalrank_avg {
    description: "The average Company Metrics Alexaglobalranks within each grouping."
    type: average
    group_label: "Company Metrics Alexaglobalrank Measures"
    sql: ${company_metrics_alexaglobalrank} ;;
  }

  measure: company_metrics_alexaglobalrank_median {
    description: "The median  Company Metrics Alexaglobalranks within each grouping."
    type: median
    group_label: "Company Metrics Alexaglobalrank Measures"
    sql: ${company_metrics_alexaglobalrank} ;;
  }

  measure: company_metrics_marketcap_max {
    description: "The max Company Metrics Marketcaps within each grouping."
    type: max
    group_label: "Company Metrics Marketcap Measures"
    sql: ${company_metrics_marketcap} ;;
  }

  measure: company_metrics_marketcap_min {
    description: "The min Company Metrics Marketcaps within each grouping."
    type: min
    group_label: "Company Metrics Marketcap Measures"
    sql: ${company_metrics_marketcap} ;;
  }

  measure: company_metrics_marketcap_avg {
    description: "The average Company Metrics Marketcaps within each grouping."
    type: average
    group_label: "Company Metrics Marketcap Measures"
    sql: ${company_metrics_marketcap} ;;
  }

  measure: company_metrics_marketcap_median {
    description: "The median  Company Metrics Marketcaps within each grouping."
    type: median
    group_label: "Company Metrics Marketcap Measures"
    sql: ${company_metrics_marketcap} ;;
  }

  measure: company_metrics_fiscalyearend_max {
    description: "The max Company Metrics Fiscalyearends within each grouping."
    type: max
    group_label: "Company Metrics Fiscalyearend Measures"
    sql: ${company_metrics_fiscalyearend} ;;
  }

  measure: company_metrics_fiscalyearend_min {
    description: "The min Company Metrics Fiscalyearends within each grouping."
    type: min
    group_label: "Company Metrics Fiscalyearend Measures"
    sql: ${company_metrics_fiscalyearend} ;;
  }

  measure: company_metrics_fiscalyearend_avg {
    description: "The average Company Metrics Fiscalyearends within each grouping."
    type: average
    group_label: "Company Metrics Fiscalyearend Measures"
    sql: ${company_metrics_fiscalyearend} ;;
  }

  measure: company_metrics_fiscalyearend_median {
    description: "The median  Company Metrics Fiscalyearends within each grouping."
    type: median
    group_label: "Company Metrics Fiscalyearend Measures"
    sql: ${company_metrics_fiscalyearend} ;;
  }

  measure: person_utcoffset_max {
    description: "The max Person Utcoffsets within each grouping."
    type: max
    group_label: "Person Utcoffset Measures"
    sql: ${person_utcoffset} ;;
  }

  measure: person_utcoffset_min {
    description: "The min Person Utcoffsets within each grouping."
    type: min
    group_label: "Person Utcoffset Measures"
    sql: ${person_utcoffset} ;;
  }

  measure: person_utcoffset_avg {
    description: "The average Person Utcoffsets within each grouping."
    type: average
    group_label: "Person Utcoffset Measures"
    sql: ${person_utcoffset} ;;
  }

  measure: person_utcoffset_median {
    description: "The median  Person Utcoffsets within each grouping."
    type: median
    group_label: "Person Utcoffset Measures"
    sql: ${person_utcoffset} ;;
  }

  measure: company_utcoffset_max {
    description: "The max Company Utcoffsets within each grouping."
    type: max
    group_label: "Company Utcoffset Measures"
    sql: ${company_utcoffset} ;;
  }

  measure: company_utcoffset_min {
    description: "The min Company Utcoffsets within each grouping."
    type: min
    group_label: "Company Utcoffset Measures"
    sql: ${company_utcoffset} ;;
  }

  measure: company_utcoffset_avg {
    description: "The average Company Utcoffsets within each grouping."
    type: average
    group_label: "Company Utcoffset Measures"
    sql: ${company_utcoffset} ;;
  }

  measure: company_utcoffset_median {
    description: "The median  Company Utcoffsets within each grouping."
    type: median
    group_label: "Company Utcoffset Measures"
    sql: ${company_utcoffset} ;;
  }

  measure: person_twitter_statuses_max {
    description: "The max Person Twitter Statuses within each grouping."
    type: max
    group_label: "Person Twitter Statuses Measures"
    sql: ${person_twitter_statuses} ;;
  }

  measure: person_twitter_statuses_min {
    description: "The min Person Twitter Statuses within each grouping."
    type: min
    group_label: "Person Twitter Statuses Measures"
    sql: ${person_twitter_statuses} ;;
  }

  measure: person_twitter_statuses_avg {
    description: "The average Person Twitter Statuses within each grouping."
    type: average
    group_label: "Person Twitter Statuses Measures"
    sql: ${person_twitter_statuses} ;;
  }

  measure: person_twitter_statuses_median {
    description: "The median  Person Twitter Statuses within each grouping."
    type: median
    group_label: "Person Twitter Statuses Measures"
    sql: ${person_twitter_statuses} ;;
  }

  measure: company_metrics_raised_max {
    description: "The max Company Metrics Raiseds within each grouping."
    type: max
    group_label: "Company Metrics Raised Measures"
    sql: ${company_metrics_raised} ;;
  }

  measure: company_metrics_raised_min {
    description: "The min Company Metrics Raiseds within each grouping."
    type: min
    group_label: "Company Metrics Raised Measures"
    sql: ${company_metrics_raised} ;;
  }

  measure: company_metrics_raised_avg {
    description: "The average Company Metrics Raiseds within each grouping."
    type: average
    group_label: "Company Metrics Raised Measures"
    sql: ${company_metrics_raised} ;;
  }

  measure: company_metrics_raised_median {
    description: "The median  Company Metrics Raiseds within each grouping."
    type: median
    group_label: "Company Metrics Raised Measures"
    sql: ${company_metrics_raised} ;;
  }

  measure: person_github_followers_max {
    description: "The max Person Github Followers within each grouping."
    type: max
    group_label: "Person Github Followers Measures"
    sql: ${person_github_followers} ;;
  }

  measure: person_github_followers_min {
    description: "The min Person Github Followers within each grouping."
    type: min
    group_label: "Person Github Followers Measures"
    sql: ${person_github_followers} ;;
  }

  measure: person_github_followers_avg {
    description: "The average Person Github Followers within each grouping."
    type: average
    group_label: "Person Github Followers Measures"
    sql: ${person_github_followers} ;;
  }

  measure: person_github_followers_median {
    description: "The median  Person Github Followers within each grouping."
    type: median
    group_label: "Person Github Followers Measures"
    sql: ${person_github_followers} ;;
  }

  measure: person_twitter_favorites_max {
    description: "The max Person Twitter Favorites within each grouping."
    type: max
    group_label: "Person Twitter Favorites Measures"
    sql: ${person_twitter_favorites} ;;
  }

  measure: person_twitter_favorites_min {
    description: "The min Person Twitter Favorites within each grouping."
    type: min
    group_label: "Person Twitter Favorites Measures"
    sql: ${person_twitter_favorites} ;;
  }

  measure: person_twitter_favorites_avg {
    description: "The average Person Twitter Favorites within each grouping."
    type: average
    group_label: "Person Twitter Favorites Measures"
    sql: ${person_twitter_favorites} ;;
  }

  measure: person_twitter_favorites_median {
    description: "The median  Person Twitter Favorites within each grouping."
    type: median
    group_label: "Person Twitter Favorites Measures"
    sql: ${person_twitter_favorites} ;;
  }

  measure: person_github_following_max {
    description: "The max Person Github Followings within each grouping."
    type: max
    group_label: "Person Github Following Measures"
    sql: ${person_github_following} ;;
  }

  measure: person_github_following_min {
    description: "The min Person Github Followings within each grouping."
    type: min
    group_label: "Person Github Following Measures"
    sql: ${person_github_following} ;;
  }

  measure: person_github_following_avg {
    description: "The average Person Github Followings within each grouping."
    type: average
    group_label: "Person Github Following Measures"
    sql: ${person_github_following} ;;
  }

  measure: person_github_following_median {
    description: "The median  Person Github Followings within each grouping."
    type: median
    group_label: "Person Github Following Measures"
    sql: ${person_github_following} ;;
  }

  measure: company_foundedyear_max {
    description: "The max Company Foundedyears within each grouping."
    type: max
    group_label: "Company Foundedyear Measures"
    sql: ${company_foundedyear} ;;
  }

  measure: company_foundedyear_min {
    description: "The min Company Foundedyears within each grouping."
    type: min
    group_label: "Company Foundedyear Measures"
    sql: ${company_foundedyear} ;;
  }

  measure: company_foundedyear_avg {
    description: "The average Company Foundedyears within each grouping."
    type: average
    group_label: "Company Foundedyear Measures"
    sql: ${company_foundedyear} ;;
  }

  measure: company_foundedyear_median {
    description: "The median  Company Foundedyears within each grouping."
    type: median
    group_label: "Company Foundedyear Measures"
    sql: ${company_foundedyear} ;;
  }

  measure: person_twitter_followers_max {
    description: "The max Person Twitter Followers within each grouping."
    type: max
    group_label: "Person Twitter Followers Measures"
    sql: ${person_twitter_followers} ;;
  }

  measure: person_twitter_followers_min {
    description: "The min Person Twitter Followers within each grouping."
    type: min
    group_label: "Person Twitter Followers Measures"
    sql: ${person_twitter_followers} ;;
  }

  measure: person_twitter_followers_avg {
    description: "The average Person Twitter Followers within each grouping."
    type: average
    group_label: "Person Twitter Followers Measures"
    sql: ${person_twitter_followers} ;;
  }

  measure: person_twitter_followers_median {
    description: "The median  Person Twitter Followers within each grouping."
    type: median
    group_label: "Person Twitter Followers Measures"
    sql: ${person_twitter_followers} ;;
  }

  measure: person_twitter_id_max {
    description: "The max Person Twitter Ids within each grouping."
    type: max
    group_label: "Person Twitter Id Measures"
    sql: ${person_twitter_id} ;;
  }

  measure: person_twitter_id_min {
    description: "The min Person Twitter Ids within each grouping."
    type: min
    group_label: "Person Twitter Id Measures"
    sql: ${person_twitter_id} ;;
  }

  measure: person_twitter_id_avg {
    description: "The average Person Twitter Ids within each grouping."
    type: average
    group_label: "Person Twitter Id Measures"
    sql: ${person_twitter_id} ;;
  }

  measure: person_twitter_id_median {
    description: "The median  Person Twitter Ids within each grouping."
    type: median
    group_label: "Person Twitter Id Measures"
    sql: ${person_twitter_id} ;;
  }

  measure: company_metrics_alexausrank_max {
    description: "The max Company Metrics Alexausranks within each grouping."
    type: max
    group_label: "Company Metrics Alexausrank Measures"
    sql: ${company_metrics_alexausrank} ;;
  }

  measure: company_metrics_alexausrank_min {
    description: "The min Company Metrics Alexausranks within each grouping."
    type: min
    group_label: "Company Metrics Alexausrank Measures"
    sql: ${company_metrics_alexausrank} ;;
  }

  measure: company_metrics_alexausrank_avg {
    description: "The average Company Metrics Alexausranks within each grouping."
    type: average
    group_label: "Company Metrics Alexausrank Measures"
    sql: ${company_metrics_alexausrank} ;;
  }

  measure: company_metrics_alexausrank_median {
    description: "The median  Company Metrics Alexausranks within each grouping."
    type: median
    group_label: "Company Metrics Alexausrank Measures"
    sql: ${company_metrics_alexausrank} ;;
  }

  measure: company_emailprovider_count {
    label: "Company_Emailprovider Users"
    description: "The distinct count of Cloud Clearbit workspaces with Company Emailprovider marked true."
    group_label: "User Counts"
    type: count_distinct
    sql: case when ${company_emailprovider} then ${server_id} else null end ;;
  }

  measure: company_metrics_annualrevenue_max {
    description: "The max Company Metrics Annualrevenues within each grouping."
    type: max
    group_label: "Company Metrics Annualrevenue Measures"
    sql: ${company_metrics_annualrevenue} ;;
  }

  measure: company_metrics_annualrevenue_min {
    description: "The min Company Metrics Annualrevenues within each grouping."
    type: min
    group_label: "Company Metrics Annualrevenue Measures"
    sql: ${company_metrics_annualrevenue} ;;
  }

  measure: company_metrics_annualrevenue_avg {
    description: "The average Company Metrics Annualrevenues within each grouping."
    type: average
    group_label: "Company Metrics Annualrevenue Measures"
    sql: ${company_metrics_annualrevenue} ;;
  }

  measure: company_metrics_annualrevenue_median {
    description: "The median  Company Metrics Annualrevenues within each grouping."
    type: median
    group_label: "Company Metrics Annualrevenue Measures"
    sql: ${company_metrics_annualrevenue} ;;
  }

  measure: person_fuzzy_count {
    label: "Person_Fuzzy Users"
    description: "The distinct count of Cloud Clearbit with Person Fuzzy marked true."
    group_label: "User Counts"
    type: count_distinct
    sql: case when ${person_fuzzy} then ${server_id}  else null end ;;
  }

  measure: company_twitter_following_max {
    description: "The max Company Twitter Followings within each grouping."
    type: max
    group_label: "Company Twitter Following Measures"
    sql: ${company_twitter_following} ;;
  }

  measure: company_twitter_following_min {
    description: "The min Company Twitter Followings within each grouping."
    type: min
    group_label: "Company Twitter Following Measures"
    sql: ${company_twitter_following} ;;
  }

  measure: company_twitter_following_avg {
    description: "The average Company Twitter Followings within each grouping."
    type: average
    group_label: "Company Twitter Following Measures"
    sql: ${company_twitter_following} ;;
  }

  measure: company_twitter_following_median {
    description: "The median  Company Twitter Followings within each grouping."
    type: median
    group_label: "Company Twitter Following Measures"
    sql: ${company_twitter_following} ;;
  }

  measure: server_count {
    label: " Server Count"
    description: "The distinct count of Cloud Clearbit Servers within each grouping."
    type: count_distinct
    sql: ${server_id} ;;
  }


}
