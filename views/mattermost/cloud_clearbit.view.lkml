# This is the view file for the analytics.mattermost.cloud_clearbit table.
view: cloud_clearbit {
  sql_table_name: mattermost.cloud_clearbit ;;
  view_label: "Cloud Clearbit"

  # Sets
  set: clearbit_drill {
    fields: [company_name, workspace, person_email, company_category_industry, company_metrics_employees, company_metrics_estimatedannualrevenue, person_name_fullname, person_employment_role, person_employment_subrole, company_metrics_alexaglobalrank]
  }

  # DIMENSIONS
  dimension: person_github_avatar {
    group_label: "Person Websites"
    label: "Github Avatar"
    description: ""
    type: string
    sql: ${TABLE}.person_github_avatar ;;
    hidden: yes
  }

  dimension: workspace {
    group_label: "Company Details"
    description: "The customers workspace name"
    type: string
    sql: ${license_server_fact.customer_name} ;;
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

  dimension: person_employment_name {
    group_label: "Person Employment"
    label: "Employment Name"
    description: ""
    type: string
    sql: COALESCE(${TABLE}.person_employment_name, 'Unknown') ;;
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

  dimension: person_timezone {
    group_label: "Person Geo"
    label: "Timezone"
    description: ""
    type: string
    sql: ${TABLE}.person_timezone ;;
    hidden: no
  }

  dimension: person_email {
    group_label: "Person Email"
    label: "Email"
    description: ""
    type: string
    sql: COALESCE(${license_server_fact.license_email}, ${TABLE}.person_email) ;;
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

  dimension: person_inactiveat {
    group_label: "Person Details"
    label: "Inactive At"
    description: ""
    type: string
    sql: ${TABLE}.person_inactiveat ;;
    hidden: no
  }

  dimension: company_parent_domain {
    description: ""
    type: string
    sql: ${TABLE}.company_parent_domain ;;
    hidden: yes
  }

  dimension: person_name_givenname {
    group_label: "Person  Name"
    label: "Given Name"
    description: ""
    type: string
    sql: ${TABLE}.person_name_givenname ;;
    hidden: no
  }

  dimension: person_employment_seniority {
    group_label: "Person Employment"
    label: "Employment Seniority"
    description: ""
    type: string
    sql: COALESCE(${TABLE}.person_employment_seniority, 'Unknown') ;;
    hidden: no
  }

  dimension: person_site {
    group_label: "Person Websites"
    label: "Site"
    description: ""
    type: string
    sql: ${TABLE}.person_site ;;
    hidden: no
  }

  dimension: company_facebook_likes {
    group_label: "Company Websites"
    label: "Facebook Likes"
    description: ""
    type: number
    sql: ${TABLE}.company_facebook_likes ;;
    hidden: no
  }

  dimension: person_location {
    group_label: "Person Geo"
    label: "Location"
    description: ""
    type: string
    sql: COALESCE(${TABLE}.person_location, 'Unknown') ;;
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

  dimension: person_employment_domain {
    group_label: "Person Employment"
    label: "Employment Domain"
    description: ""
    type: string
    sql: COALESCE(${TABLE}.person_employment_domain, 'Unknown') ;;
    hidden: no
  }

  dimension: person_googleplus_handle {
    group_label: "Person Websites"
    label: "Google+ Handle"
    description: ""
    type: string
    sql: ${TABLE}.person_googleplus_handle ;;
    hidden: yes
  }

  dimension: person_id {
    label: "Person ID"
    description: ""
    type: string
    sql: ${TABLE}.person_id ;;
    hidden: yes
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

  dimension: person_name_familyname {
    group_label: "Person  Name"
    label: "Last Name"
    description: ""
    type: string
    sql: ${TABLE}.person_name_familyname ;;
    hidden: no
  }

  dimension: person_twitter_following {
    group_label: "Person Websites"
    label: "Twitter Following"
    description: ""
    type: number
    sql: ${TABLE}.person_twitter_following ;;
    hidden: no
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

  dimension: person_github_company {
    group_label: "Person Websites"
    label: "Github Company"
    description: ""
    type: string
    sql: ${TABLE}.person_github_company ;;
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

  dimension: person_activeat {
    group_label: "Person Details"
    label: "Active At"
    description: ""
    type: string
    sql: ${TABLE}.person_activeat ;;
    hidden: no
  }

  dimension: company_twitter_id {
    description: ""
    type: string
    sql: ${TABLE}.company_twitter_id ;;
    hidden: yes
  }

  dimension: person_github_id {
    group_label: "Person Websites"
    label: "Github ID"
    description: ""
    type: number
    sql: ${TABLE}.person_github_id ;;
    hidden: yes
  }

  dimension: person_gravatar_avatar {
    group_label: "Person Websites"
    label: "Gravatar Avatar"
    description: ""
    type: string
    sql: ${TABLE}.person_gravatar_avatar ;;
    hidden: yes
  }

  dimension: person_twitter_site {
    group_label: "Person Websites"
    label: "Twitter Site"
    description: ""
    type: string
    sql: ${TABLE}.person_twitter_site ;;
    hidden: no
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

  dimension: person_bio {
    group_label: "Person Details"
    label: "Bio"
    description: ""
    type: string
    sql: ${TABLE}.person_bio ;;
    hidden: no
  }

  dimension: person_employment_subrole {
    group_label: "Person Employment"
    label: "Subrole"
    description: ""
    type: string
    sql: COALESCE(${TABLE}.person_employment_subrole, 'Unknown') ;;
    hidden: no
  }

  dimension: company_twitter_handle {
    group_label: "Company Websites"
    label: "Twitter Handle"
    description: ""
    type: string
    sql: ${TABLE}.company_twitter_handle ;;
    hidden: no
  }

  dimension: person_emailprovider {
    group_label: "Person Email"
    label: "Email Provider"
    description: ""
    type: yesno
    sql: ${TABLE}.person_emailprovider ;;
    hidden: no
  }

  dimension: person_geo_state {
    group_label: "Person Geo"
    label: "State"
    description: ""
    type: string
    sql: COALESCE(${TABLE}.person_geo_state, 'Unknown') ;;
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

  dimension: person_indexedat {
    group_label: "Person Details"
    label: "Last Indexed"
    description: ""
    type: string
    sql: ${TABLE}.person_indexedat ;;
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

  dimension: person_avatar {
    description: ""
    type: string
    sql: ${TABLE}.person_avatar ;;
    hidden: yes
  }

  dimension: person_twitter_avatar {
    group_label: "Person Websites"
    label: "Twitter Avatar"
    description: ""
    type: string
    sql: ${TABLE}.person_twitter_avatar ;;
    hidden: yes
  }

  dimension: person_employment_role {
    group_label: "Person Employment"
    label: "Role"
    description: ""
    type: string
    sql: COALESCE(${TABLE}.person_employment_role, 'Unknown') ;;
    hidden: no
  }

  dimension: person_geo_statecode {
    group_label: "Person Geo"
    label: "State (ISO)"
    description: ""
    type: string
    sql: COALESCE(${TABLE}.person_geo_statecode, 'Unknown') ;;
    hidden: no
  }

  dimension: company_linkedin_handle {
    group_label: "Company Websites"
    label: "LinkedIn Handle"
    description: ""
    type: string
    sql: COALESCE(${TABLE}.company_linkedin_handle, 'Unknown') ;;
    hidden: no
  }

  dimension: person_lat_lon {
    group_label: "Person Geo"
    label: "Location (Lat. & Lon.)"
    type: location
    sql_latitude: ${person_geo_lat} ;;
    sql_longitude: ${person_geo_lng} ;;
  }

  dimension: person_geo_lat {
    group_label: "Person Geo"
    label: "Latitude"
    description: ""
    type: number
    sql: ${TABLE}.person_geo_lat ;;
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

  dimension: person_github_handle {
    group_label: "Person Websites"
    label: "Github Handle"
    description: ""
    type: string
    sql: ${TABLE}.person_github_handle ;;
    hidden: no
  }

  dimension: person_twitter_location {
    group_label: "Person Websites"
    label: "Twitter Location"
    description: ""
    type: string
    sql: ${TABLE}.person_twitter_location ;;
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

  dimension: person_gravatar_handle {
    description: ""
    type: string
    sql: ${TABLE}.person_gravatar_handle ;;
    hidden: yes
  }

  dimension: person_employment_title {
    group_label: "Person Employment"
    label: "Title"
    description: ""
    type: string
    sql: COALESCE(${TABLE}.person_employment_title, 'Unknown') ;;
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

  dimension: person_utcoffset {
    group_label: "Person Geo"
    label: "UTC Offset"
    description: ""
    type: number
    sql: ${TABLE}.person_utcoffset ;;
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

  dimension: person_twitter_statuses {
    group_label: "Person Websites"
    label: "Twitter Statuses"
    description: ""
    type: number
    sql: ${TABLE}.person_twitter_statuses ;;
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

  dimension: person_gravatar_urls {
    description: ""
    type: string
    sql: ${TABLE}.person_gravatar_urls ;;
    hidden: yes
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

  dimension: person_geo_country {
    group_label: "Person Geo"
    label: "Country"
    description: ""
    type: string
    sql: COALESCE(INITCAP(${TABLE}.person_geo_country), 'Unknown') ;;
    hidden: no
  }

  dimension: person_geo_countrycode {
    group_label: "Person Geo"
    label: "Country (ISO)"
    description: ""
    type: string
    sql: COALESCE(${TABLE}.person_geo_countrycode, 'Unknown') ;;
    hidden: no
  }

  dimension: person_github_followers {
    group_label: "Person Websites"
    label: "Github Followers"
    description: ""
    type: number
    sql: ${TABLE}.person_github_followers ;;
    hidden: no
  }

  dimension: person_twitter_favorites {
    group_label: "Person Websites"
    label: "Twitter Favorites"
    description: ""
    type: number
    sql: ${TABLE}.person_twitter_favorites ;;
    hidden: no
  }

  dimension: person_github_following {
    group_label: "Person Websites"
    label: "Github Following"
    description: ""
    type: number
    sql: ${TABLE}.person_github_following ;;
    hidden: no
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

  dimension: person {
    description: ""
    type: string
    sql: ${TABLE}.person ;;
    hidden: yes
  }

  dimension: person_twitter_followers {
    group_label: "Person Websites"
    label: "Twitter Followers"
    description: ""
    type: number
    sql: ${TABLE}.person_twitter_followers ;;
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

  dimension: person_twitter_handle {
    group_label: "Person Websites"
    label: "Twitter Handle"
    description: ""
    type: string
    sql: ${TABLE}.person_twitter_handle ;;
    hidden: no
  }

  dimension: person_twitter_bio {
    group_label: "Person Websites"
    label: "Twitter Bio"
    description: ""
    type: string
    sql: ${TABLE}.person_twitter_bio ;;
    hidden: no
  }

  dimension: person_twitter_id {
    group_label: "Person Websites"
    label: "Twitter ID"
    description: ""
    type: number
    sql: ${TABLE}.person_twitter_id ;;
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

  dimension: person_name_fullname {
    group_label: "Person  Name"
    label: "Full Name"
    description: ""
    type: string
    sql: ${TABLE}.person_name_fullname ;;
    hidden: no
  }

  dimension: person_gravatar_avatars {
    description: ""
    type: string
    sql: ${TABLE}.person_gravatar_avatars ;;
    hidden: yes
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

  dimension: person_fuzzy {
    label: "Fuzzy Match"
    description: "Indicates the data may not be an exact match but an inference made by Clearbit."
    type: yesno
    sql: ${TABLE}.person_fuzzy ;;
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

  dimension: person_geo_city {
    group_label: "Person Geo"
    label: "City"
    description: ""
    type: string
    sql: COALESCE(${TABLE}.person_geo_city, 'Unknown') ;;
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

  dimension: person_facebook_handle {
    group_label: "Person Websites"
    label: "Facebook Handle"
    description: ""
    type: string
    sql: ${TABLE}.person_facebook_handle ;;
    hidden: no
  }

  dimension: person_linkedin_handle {
    group_label: "Person Websites"
    label: "LinkedIn Handle"
    description: ""
    type: string
    sql: ${TABLE}.person_linkedin_handle ;;
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

  dimension: person_geo_lng {
    group_label: "Person Geo"
    label: "Longitude"
    description: ""
    type: number
    sql: ${TABLE}.person_geo_lng ;;
    hidden: no
  }

  dimension: person_github_blog {
    group_label: "Person Websites"
    label: "Github Blog"
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
    label: " Workspaces"
    description: "The distinct count of Cloud Clearbit Servers within each grouping."
    type: count_distinct
    sql: ${server_id} ;;
    drill_fields: [clearbit_drill*]
  }


}
