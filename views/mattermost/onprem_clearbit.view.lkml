
# This is the view file for the analytics.mattermost.onprem_clearbit table.
view: onprem_clearbit {
sql_table_name: mattermost.onprem_clearbit ;;
view_label: "Onprem Clearbit"



### SETS



### DIMENSIONS

  dimension: fuzzy {
    label: "Fuzzy"
    description: "Indicates Fuzzy is marked true/enabled."
    type: yesno
    sql: ${TABLE}.fuzzy ;;
  }

  dimension: company_name {
    label: " Company Name"
    description: ""
    type: string
    sql: ${TABLE}.company_name ;;
    hidden: no
  }

  dimension: company_timezone {
    group_label: "Company Geo"
    label: "Timezone"
    description: ""
    type: string
    sql: COALESCE(${TABLE}.company_timezone, 'Unknown') ;;
    hidden: no
  }

  dimension: company_twitter_bio {
    group_label: "Company Websites"
    label: "Twitter Bio"
    description: ""
    type: string
    sql: ${TABLE}.company_twitter_bio ;;
    hidden: no
  }

  dimension: company_twitter_followers {
    group_label: "Company Websites"
    label: "Twitter Followers"
    description: ""
    type: number
    sql: ${TABLE}.company_twitter_followers ;;
    hidden: no
  }

  dimension: company_twitter_avatar {
    description: ""
    type: string
    sql: ${TABLE}.company_twitter_avatar ;;
    hidden: yes
  }

  dimension: company_category_subindustry {
    group_label: "Company Industry"
    label: "Sub-Industry"
    description: ""
    type: string
    sql: COALESCE(${TABLE}.company_category_subindustry, 'Unknown') ;;
    hidden: no
  }

  dimension: company_parent_domain {
    description: ""
    type: string
    sql: ${TABLE}.company_parent_domain ;;
    hidden: yes
  }

  dimension: company_facebook_likes {
    group_label: "Company Websites"
    label: "Facebook Likes"
    description: ""
    type: number
    sql: ${TABLE}.company_facebook_likes ;;
    hidden: no
  }

  dimension: company_type {
    group_label: "Company Industry"
    label: "Type"
    description: ""
    type: string
    sql: COALESCE(${TABLE}.company_type, 'Unknown') ;;
    hidden: no
  }

  dimension: company_geo_streetnumber {
    group_label: "Company Geo"
    label: "Street Number"
    description: ""
    type: string
    sql: ${TABLE}.company_geo_streetnumber ;;
    hidden: no
  }

  dimension: company_id {
    description: ""
    type: string
    sql: ${TABLE}.company_id ;;
    hidden: yes
  }

  dimension: company_geo_statecode {
    group_label: "Company Geo"
    label: "State (ISO)"
    description: ""
    type: string
    sql: COALESCE(${TABLE}.company_geo_statecode, 'Unknown') ;;
    hidden: no
  }

  dimension: company_facebook_handle {
    group_label: "Company Websites"
    label: "Facebook Handle"
    description: ""
    type: string
    sql: ${TABLE}.company_facebook_handle ;;
    hidden: no
  }

  dimension: company_location {
    group_label: "Company Geo"
    label: "Location"
    description: ""
    type: string
    sql: COALESCE(${TABLE}.company_location, 'Unknown') ;;
    hidden: no
  }

  dimension: company_category_naicscode {
    group_label: "Company Industry"
    label: "NAICS Code"
    description: ""
    type: string
    sql: COALESCE(${TABLE}.company_category_naicscode, 'Unknown') ;;
    hidden: no
  }

  dimension: company_ultimateparent_domain {
    description: ""
    type: string
    sql: ${TABLE}.company_ultimateparent_domain ;;
    hidden: yes
  }

  dimension: company_twitter_site {
    group_label: "Company Websites"
    label: "Twitter Site"
    description: ""
    type: string
    sql: ${TABLE}.company_twitter_site ;;
    hidden: no
  }

  dimension: company_category_industry {
    group_label: "Company Industry"
    label: "Industry"
    description: ""
    type: string
    sql: COALESCE(${TABLE}.company_category_industry, 'Unknown') ;;
    hidden: no
  }

  dimension: company_identifiers_usein {
    description: ""
    type: string
    sql: ${TABLE}.company_identifiers_usein ;;
    hidden: yes
  }

  dimension: company_site_phonenumbers {
    group_label: "Company Details"
    label: "Phone Numbers"
    description: ""
    type: string
    sql: ${TABLE}.company_site_phonenumbers ;;
    hidden: no
  }

  dimension: company_geo_lng {
    group_label: "Company Geo"
    label: "Longitude"
    description: ""
    type: number
    sql: ${TABLE}.company_geo_lng ;;
    hidden: no
  }

  dimension: company_twitter_id {
    description: ""
    type: string
    sql: ${TABLE}.company_twitter_id ;;
    hidden: yes
  }

  dimension: company_metrics_employees {
    group_label: "Company Employees"
    label: "Employees"
    description: ""
    type: number
    sql: ${TABLE}.company_metrics_employees ;;
    hidden: no
  }

  dimension: market_segment {
    description: "The market segment of the company based on the number of employees identified via the employees field."
    type: string
    sql: CASE WHEN ${company_metrics_employees} >= 5000 THEN 'Enterprise'
              WHEN ${company_metrics_employees} >= 500 and ${company_metrics_employees} < 5000 THEN 'Mid-Market'
              WHEN ${company_metrics_employees} < 500 THEN 'SMB'
              ELSE NULL END;;
  }

  dimension: company_twitter_handle {
    group_label: "Company Websites"
    label: "Twitter Handle"
    description: ""
    type: string
    sql: ${TABLE}.company_twitter_handle ;;
    hidden: no
  }

  dimension: company_metrics_alexaglobalrank {
    group_label: "Company Alexa Rank"
    label: "Global Rank"
    description: "Alexa Rank is a measure of a websites global popularity."
    type: number
    sql: ${TABLE}.company_metrics_alexaglobalrank ;;
    hidden: no
  }

  dimension: company_twitter_location {
    group_label: "Company Websites"
    label: "Twitter Location"
    description: ""
    type: string
    sql: COALESCE(${TABLE}.company_twitter_location, 'Unknown') ;;
    hidden: no
  }

  dimension: company_geo_streetname {
    group_label: "Company Geo"
    label: "Street Name"
    description: ""
    type: string
    sql: ${TABLE}.company_geo_streetname ;;
    hidden: no
  }

  dimension: company_metrics_marketcap {
    group_label: "Company Financials"
    label: "Market Cap."
    description: ""
    type: number
    value_format_name: usd_0
    sql: ${TABLE}.company_metrics_marketcap ;;
    hidden: no
  }

  dimension: company_geo_countrycode {
    group_label: "Company Geo"
    label: "Country (ISO)"
    description: ""
    type: string
    sql: COALESCE(${TABLE}.company_geo_countrycode, 'Unknown') ;;
    hidden: no
  }

  dimension: company_lat_lon {
    group_label: "Company Geo"
    label: "Location (Lat. & Lon.)"
    type: location
    sql_latitude: ${company_geo_lat} ;;
    sql_longitude: ${company_geo_lng} ;;
  }

  dimension: company_linkedin_handle {
    group_label: "Company Websites"
    label: "LinkedIn Handle"
    description: ""
    type: string
    sql: COALESCE(${TABLE}.company_linkedin_handle, 'Unknown') ;;
    hidden: no
  }

  dimension: company_techcategories {
    group_label: "Company Technology"
    label: "Tech Categories"
    description: ""
    type: string
    sql: COALESCE(${TABLE}.company_techcategories, 'Unknown') ;;
    hidden: no
  }

  dimension: company_domainaliases {
    group_label: "Company Email/Domain"
    label: "Domain Aliases"
    description: ""
    type: string
    sql: ${TABLE}.company_domainaliases ;;
    hidden: no
  }

  dimension: company_indexedat {
    group_label: "Company Details"
    label: "Last Indexed"
    description: ""
    type: string
    sql: ${TABLE}.company_indexedat ;;
    hidden: no
  }

  dimension: company_metrics_fiscalyearend {
    description: ""
    type: number
    sql: ${TABLE}.company_metrics_fiscalyearend ;;
    hidden: yes
  }

  dimension: company_category_sector {
    group_label: "Company Industry"
    label: "Sector"
    description: ""
    type: string
    sql: COALESCE(${TABLE}.company_category_sector, 'Unknown') ;;
    hidden: no
  }

  dimension: company {
    description: ""
    type: string
    sql: ${TABLE}.company ;;
    hidden: yes
  }

  dimension: company_tech {
    group_label: "Company Technology"
    label: "Tech Stack"
    description: ""
    type: string
    sql: COALESCE(${TABLE}.company_tech, 'Unknown') ;;
    hidden: no
  }

  dimension: company_geo_country {
    group_label: "Company Geo"
    label: "Country"
    description: ""
    type: string
    sql: COALESCE(INITCAP(${TABLE}.company_geo_country), 'Unknown') ;;
    hidden: no
  }

  dimension: company_legalname {
    label: "Company (Legal Name)"
    description: ""
    type: string
    sql: ${TABLE}.company_legalname ;;
    hidden: no
  }

  dimension: company_geo_city {
    group_label: "Company Geo"
    label: "City"
    description: ""
    type: string
    sql: COALESCE(${TABLE}.company_geo_city, 'Unknown') ;;
    hidden: no
  }

  dimension: company_domain {
    group_label: "Company Email/Domain"
    label: "Domain"
    description: ""
    type: string
    sql: ${TABLE}.company_domain ;;
    hidden: no
  }

  dimension: company_utcoffset {
    group_label: "Company Geo"
    label: "UTC Offset"
    description: ""
    type: number
    sql: ${TABLE}.company_utcoffset ;;
    hidden: no
  }

  dimension: company_phone {
    group_label: "Company Details"
    label: "Phone"
    description: ""
    type: string
    sql: ${TABLE}.company_phone ;;
    hidden: no
  }

  dimension: company_category_siccode {
    group_label: "Company Industry"
    label: "SIC Code"
    description: ""
    type: string
    sql: COALESCE(${TABLE}.company_category_siccode, 'Unknown') ;;
    hidden: no
  }

  dimension: company_ticker {
    group_label: "Company Financials"
    label: "Ticker"
    description: ""
    type: string
    sql: ${TABLE}.company_ticker ;;
    hidden: no
  }

  dimension: company_crunchbase_handle {
    description: ""
    type: string
    sql: ${TABLE}.company_crunchbase_handle ;;
    hidden: yes
  }

  dimension: company_geo_state {
    group_label: "Company Geo"
    label: "State"
    description: ""
    type: string
    sql: COALESCE(${TABLE}.company_geo_state, 'Unknown') ;;
    hidden: no
  }

  dimension: company_geo_lat {
    group_label: "Company Geo"
    label: "latitude"
    description: ""
    type: number
    sql: ${TABLE}.company_geo_lat ;;
    hidden: no
  }

  dimension: company_metrics_raised {
    group_label: "Company Financials"
    label: "Funds Raised"
    description: ""
    value_format_name: usd_0
    type: number
    sql: ${TABLE}.company_metrics_raised ;;
    hidden: no
  }

  dimension: company_metrics_raised_thousands {
    group_label: "Company Financials"
    label: "Funds Raised (Thousands)"
    description: ""
    value_format: "$0.00,\"k\""
    type: number
    sql: ${TABLE}.company_metrics_raised ;;
    hidden: yes
  }

  dimension: company_metrics_raised_millions {
    group_label: "Company Financials"
    label: "Funds Raised (Millions)"
    description: ""
    value_format: "$0.00,,\"M\""
    type: number
    sql: ${TABLE}.company_metrics_raised ;;
    hidden: yes
  }

  dimension: company_metrics_raised_billions {
    group_label: "Company Financials"
    label: "Funds Raised (Billions)"
    description: ""
    value_format: "$0.00,,,\"B\""
    type: number
    sql: ${TABLE}.company_metrics_raised ;;
    hidden: yes
  }

  dimension: funds_raised_band {
    group_label: "Company Financials"
    label: "Funds Raised Band"
    description: ""
    type: string
    sql: CASE WHEN ${company_metrics_raised} IS NULL THEN 'Unknown'
              WHEN ${company_metrics_raised} < 50000 THEN '$0-50k'
              WHEN ${company_metrics_raised} < 250000 THEN '$50k-250k'
              WHEN ${company_metrics_raised} < 1000000 THEN '$250k-1M'
              WHEN ${company_metrics_raised} < 10000000 THEN '$1M-10M'
              WHEN ${company_metrics_raised} < 50000000 THEN '$10M-50M'
              WHEN ${company_metrics_raised} < 250000000 THEN '$50M-250M'
              WHEN ${company_metrics_raised} < 1000000000 THEN '$250M-1B'
              WHEN ${company_metrics_raised} >= 1000000000 THEN '$1B+'
              ELSE 'Uknown' END ;;
    hidden: no
  }

  dimension: company_logo {
    description: ""
    type: string
    sql: ${TABLE}.company_logo ;;
    hidden: yes
  }

  dimension: company_metrics_employeesrange {
    group_label: "Company Employees"
    label: "Employees Band"
    description: ""
    type: string
    sql: COALESCE(${TABLE}.company_metrics_employeesrange, 'Unknown') ;;
    hidden: no
  }

  dimension: company_geo_subpremise {
    group_label: "Company Geo"
    label: "Subpremise"
    description: ""
    type: string
    sql: COALESCE(${TABLE}.company_geo_subpremise, 'Unknown') ;;
    hidden: no
  }

  dimension: company_foundedyear {
    group_label: "Company Details"
    label: "Founded Year"
    description: ""
    type: string
    sql: COALESCE(${TABLE}.company_foundedyear::varchar, 'Unknown') ;;
    hidden: no
  }

  dimension: company_description {
    group_label: "Company Details"
    label: "Description"
    description: ""
    type: string
    sql: ${TABLE}.company_description ;;
    hidden: no
  }

  dimension: company_metrics_alexausrank {
    group_label: "Company Alexa Rank"
    label: "Alexa US Rank"
    description: "A measure of website popularity w/in the US."
    type: number
    sql: ${TABLE}.company_metrics_alexausrank ;;
    hidden: no
  }

  dimension: company_emailprovider {
    group_label: "Company Email/Domain"
    label: "Email Provider"
    description: ""
    type: yesno
    sql: ${TABLE}.company_emailprovider ;;
    hidden: no
  }

  dimension: company_metrics_annualrevenue {
    group_label: "Company Financials"
    label: "Annual Revenue"
    description: "The company's annual revenue sourced by Clearbit from Crunchbase."
    type: number
    sql: ${TABLE}.company_metrics_annualrevenue ;;
    hidden: no
  }

  dimension: company_metrics_estimatedannualrevenue {
    group_label: "Company Financials"
    label: "Annual Revenue Band"
    description: "The company's estimated annual revenue range sourced by Clearbit from Crunchbase."
    type: string
    sql: COALESCE(${TABLE}.company_metrics_estimatedannualrevenue, 'Unknown') ;;
    hidden: no
  }

  dimension: company_geo_postalcode {
    group_label: "Company Geo"
    label: "Postal Code"
    description: ""
    type: string
    sql: ${TABLE}.company_geo_postalcode ;;
    hidden: no
  }

  dimension: company_tags {
    group_label: "Company Industry"
    label: "Tags"
    description: "Tags used to classify company by various industry focuses."
    type: string
    sql: ${TABLE}.company_tags ;;
    hidden: no
  }

  dimension: company_category_industrygroup {
    group_label: "Company Industry"
    label: "Industry Group"
    description: ""
    type: string
    sql: COALESCE(${TABLE}.company_category_industrygroup, 'Unknown') ;;
    hidden: no
  }

  dimension: company_site_emailaddresses {
    group_label: "Company Email/Domain"
    label: "Email Addresses"
    description: "Various company contact/department email addresses scraped from the web."
    type: string
    sql: ${TABLE}.company_site_emailaddresses ;;
    hidden: no
  }

  dimension: company_twitter_following {
    group_label: "Company Websites"
    label: "Twitter Following"
    description: ""
    type: number
    sql: ${TABLE}.company_twitter_following ;;
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

  measure: company_count {
    label: " Company Count"
    description: "The distinct count of Cloud Clearbit Companys within each grouping."
    type: count_distinct
    sql: ${company_id} ;;
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

  measure: company_metrics_raised_max {
    label: "Funds Raised (Max)"
    description: "The max Company Metrics Raiseds within each grouping."
    type: max
    group_label: "Company Metrics Raised Measures"
    sql: ${company_metrics_raised} ;;
  }

  measure: company_metrics_raised_min {
    label: "Funds Raised (Min)"
    description: "The min Company Metrics Raiseds within each grouping."
    type: min
    group_label: "Company Metrics Raised Measures"
    sql: ${company_metrics_raised} ;;
  }

  measure: company_metrics_raised_avg {
    label: "Funds Raised (Avg)"
    description: "The average Company Metrics Raiseds within each grouping."
    type: average
    group_label: "Company Metrics Raised Measures"
    sql: ${company_metrics_raised} ;;
  }

  measure: company_metrics_raised_median {
    label: "Funds Raised (Med)"
    description: "The median  Company Metrics Raiseds within each grouping."
    type: median
    group_label: "Company Metrics Raised Measures"
    sql: ${company_metrics_raised} ;;
  }

  measure: company_foundedyear_max {
    label: "Founded Year (Max)"
    description: "The max Company Foundedyears within each grouping."
    type: max
    group_label: "Company Foundedyear Measures"
    sql: ${company_foundedyear} ;;
  }

  measure: company_foundedyear_min {
    label: "Founded Year (Min)"
    description: "The min Company Foundedyears within each grouping."
    type: min
    group_label: "Company Foundedyear Measures"
    sql: ${company_foundedyear} ;;
  }

  measure: company_foundedyear_avg {
    label: "Founded Year (Avg)"
    description: "The average Company Foundedyears within each grouping."
    type: average
    group_label: "Company Foundedyear Measures"
    sql: ${company_foundedyear} ;;
  }

  measure: company_foundedyear_median {
    label: "Founded Year (Med)"
    description: "The median  Company Foundedyears within each grouping."
    type: median
    group_label: "Company Foundedyear Measures"
    sql: ${company_foundedyear} ;;
  }


  measure: company_metrics_alexausrank_max {
    label: "Alexa US Rank (Max)"
    description: "The max Company Metrics Alexausranks within each grouping."
    type: max
    group_label: "Company Metrics Alexausrank Measures"
    sql: ${company_metrics_alexausrank} ;;
  }

  measure: company_metrics_alexausrank_min {
    label: "Alexa US Rank (Min)"
    description: "The min Company Metrics Alexausranks within each grouping."
    type: min
    group_label: "Company Metrics Alexausrank Measures"
    sql: ${company_metrics_alexausrank} ;;
  }

  measure: company_metrics_alexausrank_avg {
    label: "Alexa US Rank (Avg)"
    description: "The average Company Metrics Alexausranks within each grouping."
    type: average
    group_label: "Company Metrics Alexausrank Measures"
    sql: ${company_metrics_alexausrank} ;;
  }

  measure: company_metrics_alexausrank_median {
    label: "Alexa US Rank (Med)"
    description: "The median  Company Metrics Alexausranks within each grouping."
    type: median
    group_label: "Company Metrics Alexausrank Measures"
    sql: ${company_metrics_alexausrank} ;;
  }

  measure: company_emailprovider_count {
    label: "Company_Email Provider Users"
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


  dimension: geoip_countrycode {
    label: "Geoip Countrycode"
    group_label: "IP Geo"
    description: "The Geoip Countrycode of the instance."
    type: string
    sql: ${TABLE}.geoip_countrycode ;;
  }


  dimension: type {
    label: "Type"
    description: "The Type of the instance."
    type: string
    sql: ${TABLE}.type ;;
  }


  dimension: geoip_state {
    label: "Geoip State"
    group_label: "IP Geo"
    description: "The Geoip State of the instance."
    type: string
    sql: ${TABLE}.geoip_state ;;
  }


  dimension: ip {
    label: "Ip"
    description: "The Ip of the instance."
    type: string
    sql: ${TABLE}.ip ;;
  }


  dimension: geoip_country {
    label: "Geoip Country"
    group_label: "IP Geo"
    description: "The Geoip Country of the instance."
    type: string
    sql: ${TABLE}.geoip_country ;;
  }


  dimension: geoip_city {
    label: "Geoip City"
    group_label: "IP Geo"
    description: "The Geoip City of the instance."
    type: string
    sql: ${TABLE}.geoip_city ;;
  }


  dimension: geoip_statecode {
    label: "Geoip Statecode"
    description: "The Geoip Statecode of the instance."
    type: string
    sql: ${TABLE}.geoip_statecode ;;
  }


  dimension: domain {
    label: "Domain"
    description: "The Domain of the instance."
    type: string
    sql: ${TABLE}.domain ;;
  }


### DATES & TIMESTAMPS



### MEASURES



  measure: fuzzy_count {
    group_label: "Instance Counts"
    label: "Instances (Fuzzy IP Match)"
    description: "The distinct count of servers/workspaces with Fuzzy marked true/enabled."
    type: count_distinct
    sql: CASE WHEN ${fuzzy} THEN ${server_id} ELSE NULL END;;
  }



  measure: company_metrics_annualrevenue_sum {
    group_label: "Company Metrics Annualrevenue Measures"
    label: "Company Metrics Annual Revenue (Sum)"
    description: "The sum of Company Metrics Annualrevenue across all instances within the grouping."
    type: sum
    sql: ${company_metrics_annualrevenue} ;;
  }


  measure: company_identifiers_usein_count {
    group_label: "Company Countsentifiers_Usein"
    label: "Company Identifiers Usein"
    description: "The distinct count of company identifiers usein's within the grouping."
    type: count_distinct
    sql: ${company_identifiers_usein} ;;
  }



  measure: company_metrics_marketcap_sum {
    group_label: "Company Metrics Marketcap Measures"
    label: "Company Metrics Market Cap (Sum)"
    description: "The sum of Company Metrics Marketcap across all instances within the grouping."
    type: sum
    sql: ${company_metrics_marketcap} ;;
  }



  measure: company_foundedyear_sum {
    group_label: "Company Foundedyear Measures"
    label: "Company Founded Year (Avg)"
    description: "The sum of Company Foundedyear across all instances within the grouping."
    type: average
    sql: ${company_foundedyear} ;;
  }

  measure: company_id_count {
    group_label: "Company Counts"
    label: "Company Id"
    description: "The distinct count of company id's within the grouping."
    type: count_distinct
    sql: ${company_id} ;;
  }



  measure: company_metrics_employees_sum {
    group_label: "Company Metrics Employees Measures"
    label: "Company Metrics Employees (Sum)"
    description: "The sum of Company Metrics Employees across all instances within the grouping."
    type: sum
    sql: ${company_metrics_employees} ;;
  }

  measure: company_twitter_following_sum {
    group_label: "Company Twitter Following Measures"
    label: "Company Twitter Following (Sum)"
    description: "The sum of Company Twitter Following across all instances within the grouping."
    type: sum
    sql: ${company_twitter_following} ;;
  }

  measure: company_metrics_fiscalyearend_sum {
    group_label: "Company Metrics Fiscalyearend Measures"
    label: "Company Metrics Fiscalyearend (Sum)"
    description: "The sum of Company Metrics Fiscalyearend across all instances within the grouping."
    type: sum
    sql: ${company_metrics_fiscalyearend} ;;
  }



  measure: company_metrics_alexaglobalrank_sum {
    group_label: "Company Metrics Alexaglobalrank Measures"
    label: "Alexa Global Rank (Sum)"
    description: "The sum of Company Metrics Alexaglobalrank across all instances within the grouping."
    type: sum
    sql: ${company_metrics_alexaglobalrank} ;;
  }


  measure: company_metrics_raised_sum {
    group_label: "Company Metrics Raised Measures"
    label: "Funds Raised (Sum)"
    description: "The sum of Company Metrics Raised across all instances within the grouping."
    type: sum
    sql: ${company_metrics_raised} ;;
  }



  measure: company_facebook_likes_sum {
    group_label: "Company Facebook Likes Measures"
    label: "Company Facebook Likes (Sum)"
    description: "The sum of Company Facebook Likes across all instances within the grouping."
    type: sum
    sql: ${company_facebook_likes} ;;
  }


  measure: company_twitter_followers_sum {
    group_label: "Company Twitter Followers Measures"
    label: "Company Twitter Followers (Sum)"
    description: "The sum of Company Twitter Followers across all instances within the grouping."
    type: sum
    sql: ${company_twitter_followers} ;;
  }

  measure: company_metrics_alexausrank_sum {
    group_label: "Company Metrics Alexausrank Measures"
    label: "Alexa US Rank (Sum)"
    description: "The sum of Company Metrics Alexausrank across all instances within the grouping."
    type: sum
    sql: ${company_metrics_alexausrank} ;;
  }

  measure: company_utcoffset_sum {
    group_label: "Company Utcoffset Measures"
    label: "Company Utc Offset (Sum)"
    description: "The sum of Company Utcoffset across all instances within the grouping."
    type: sum
    sql: ${company_utcoffset} ;;
  }

  measure: company_twitter_id_count {
    group_label: "Company_Twitter Counts"
    label: "Company Twitter Id"
    description: "The distinct count of company twitter id's within the grouping."
    type: count_distinct
    sql: ${company_twitter_id} ;;
  }


  measure: server_id_count {
    group_label: "Instance Counts"
    label: "Instances"
    description: "The distinct count of server id's within the grouping."
    type: count_distinct
    sql: ${server_id} ;;
  }




    }
