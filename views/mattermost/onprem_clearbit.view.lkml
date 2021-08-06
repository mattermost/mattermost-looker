
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



  dimension: company_category_subindustry {
    label: "Company Category Subindustry"
    description: "The Company Category Subindustry of the instance."
    type: string
    sql: ${TABLE}.company_category_subindustry ;;
  }


  dimension: company_twitter_handle {
    label: "Company Twitter Handle"
    description: "The Company Twitter Handle of the instance."
    type: string
    sql: ${TABLE}.company_twitter_handle ;;
  }


  dimension: company_crunchbase_handle {
    label: "Company Crunchbase Handle"
    description: "The Company Crunchbase Handle of the instance."
    type: string
    sql: ${TABLE}.company_crunchbase_handle ;;
  }


  dimension: company_linkedin_handle {
    label: "Company Linkedin Handle"
    description: "The Company Linkedin Handle of the instance."
    type: string
    sql: ${TABLE}.company_linkedin_handle ;;
  }


  dimension: company_metrics_annualrevenue {
    label: "Company Metrics Annualrevenue"
    description: "The Company Metrics Annualrevenue of the instance."
    type: string
    sql: ${TABLE}.company_metrics_annualrevenue ;;
  }



  dimension: geoip_countrycode {
    label: "Geoip Countrycode"
    description: "The Geoip Countrycode of the instance."
    type: string
    sql: ${TABLE}.geoip_countrycode ;;
  }


  dimension: company_legalname {
    label: "Company Legalname"
    description: "The Company Legalname of the instance."
    type: string
    sql: ${TABLE}.company_legalname ;;
  }


  dimension: company_identifiers_usein {
    label: "Company Identifiers Usein"
    description: "The Company Identifiers Usein of the instance."
    type: string
    sql: ${TABLE}.company_identifiers_usein ;;
  }


  dimension: company_metrics_marketcap {
    label: "Company Metrics Marketcap"
    description: "The Company Metrics Marketcap of the instance."
    type: string
    sql: ${TABLE}.company_metrics_marketcap ;;
  }



  dimension: company_timezone {
    label: "Company Timezone"
    description: "The Company Timezone of the instance."
    type: string
    sql: ${TABLE}.company_timezone ;;
  }


  dimension: company_category_industry {
    label: "Company Category Industry"
    description: "The Company Category Industry of the instance."
    type: string
    sql: ${TABLE}.company_category_industry ;;
  }


  dimension: company_site_emailaddresses {
    label: "Company Site Emailaddresses"
    description: "The Company Site Emailaddresses of the instance."
    type: string
    sql: ${TABLE}.company_site_emailaddresses ;;
  }


  dimension: company_foundedyear {
    label: "Company Foundedyear"
    description: "The Company Foundedyear of the instance."
    type: string
    sql: ${TABLE}.company_foundedyear ;;
  }



  dimension: company_id {
    label: "Company Id"
    description: "The Company Id of the instance."
    type: string
    sql: ${TABLE}.company_id ;;
  }


  dimension: company_facebook_handle {
    label: "Company Facebook Handle"
    description: "The Company Facebook Handle of the instance."
    type: string
    sql: ${TABLE}.company_facebook_handle ;;
  }


  dimension: company_metrics_employees {
    label: "Company Metrics Employees"
    description: "The Company Metrics Employees of the instance."
    type: string
    sql: ${TABLE}.company_metrics_employees ;;
  }



  dimension: company_twitter_bio {
    label: "Company Twitter Bio"
    description: "The Company Twitter Bio of the instance."
    type: string
    sql: ${TABLE}.company_twitter_bio ;;
  }


  dimension: company_geo_countrycode {
    label: "Company Geo Countrycode"
    description: "The Company Geo Countrycode of the instance."
    type: string
    sql: ${TABLE}.company_geo_countrycode ;;
  }


  dimension: company {
    label: "Company"
    description: "The Company of the instance."
    type: string
    sql: ${TABLE}.company ;;
  }


  dimension: company_twitter_following {
    label: "Company Twitter Following"
    description: "The Company Twitter Following of the instance."
    type: string
    sql: ${TABLE}.company_twitter_following ;;
  }



  dimension: company_category_industrygroup {
    label: "Company Category Industrygroup"
    description: "The Company Category Industrygroup of the instance."
    type: string
    sql: ${TABLE}.company_category_industrygroup ;;
  }


  dimension: company_metrics_fiscalyearend {
    label: "Company Metrics Fiscalyearend"
    description: "The Company Metrics Fiscalyearend of the instance."
    type: string
    sql: ${TABLE}.company_metrics_fiscalyearend ;;
  }



  dimension: company_name {
    label: "Company Name"
    description: "The Company Name of the instance."
    type: string
    sql: ${TABLE}.company_name ;;
  }


  dimension: type {
    label: "Type"
    description: "The Type of the instance."
    type: string
    sql: ${TABLE}.type ;;
  }


  dimension: company_site_phonenumbers {
    label: "Company Site Phonenumbers"
    description: "The Company Site Phonenumbers of the instance."
    type: string
    sql: ${TABLE}.company_site_phonenumbers ;;
  }


  dimension: company_type {
    label: "Company Type"
    description: "The Company Type of the instance."
    type: string
    sql: ${TABLE}.company_type ;;
  }


  dimension: company_metrics_alexaglobalrank {
    label: "Company Metrics Alexaglobalrank"
    description: "The Company Metrics Alexaglobalrank of the instance."
    type: string
    sql: ${TABLE}.company_metrics_alexaglobalrank ;;
  }



  dimension: company_metrics_employeesrange {
    label: "Company Metrics Employeesrange"
    description: "The Company Metrics Employeesrange of the instance."
    type: string
    sql: ${TABLE}.company_metrics_employeesrange ;;
  }


  dimension: company_metrics_raised {
    label: "Company Metrics Raised"
    description: "The Company Metrics Raised of the instance."
    type: string
    sql: ${TABLE}.company_metrics_raised ;;
  }



  dimension: company_category_naicscode {
    label: "Company Category Naicscode"
    description: "The Company Category Naicscode of the instance."
    type: string
    sql: ${TABLE}.company_category_naicscode ;;
  }


  dimension: company_tech {
    label: "Company Tech"
    description: "The Company Tech of the instance."
    type: string
    sql: ${TABLE}.company_tech ;;
  }


  dimension: company_facebook_likes {
    label: "Company Facebook Likes"
    description: "The Company Facebook Likes of the instance."
    type: string
    sql: ${TABLE}.company_facebook_likes ;;
  }



  dimension: geoip_state {
    label: "Geoip State"
    description: "The Geoip State of the instance."
    type: string
    sql: ${TABLE}.geoip_state ;;
  }


  dimension: company_geo_subpremise {
    label: "Company Geo Subpremise"
    description: "The Company Geo Subpremise of the instance."
    type: string
    sql: ${TABLE}.company_geo_subpremise ;;
  }


  dimension: ip {
    label: "Ip"
    description: "The Ip of the instance."
    type: string
    sql: ${TABLE}.ip ;;
  }


  dimension: company_geo_city {
    label: "Company Geo City"
    description: "The Company Geo City of the instance."
    type: string
    sql: ${TABLE}.company_geo_city ;;
  }


  dimension: company_techcategories {
    label: "Company Techcategories"
    description: "The Company Techcategories of the instance."
    type: string
    sql: ${TABLE}.company_techcategories ;;
  }


  dimension: company_twitter_followers {
    label: "Company Twitter Followers"
    description: "The Company Twitter Followers of the instance."
    type: string
    sql: ${TABLE}.company_twitter_followers ;;
  }



  dimension: company_twitter_location {
    label: "Company Twitter Location"
    description: "The Company Twitter Location of the instance."
    type: string
    sql: ${TABLE}.company_twitter_location ;;
  }


  dimension: company_domain {
    label: "Company Domain"
    description: "The Company Domain of the instance."
    type: string
    sql: ${TABLE}.company_domain ;;
  }


  dimension: company_logo {
    label: "Company Logo"
    description: "The Company Logo of the instance."
    type: string
    sql: ${TABLE}.company_logo ;;
  }


  dimension: company_metrics_alexausrank {
    label: "Company Metrics Alexausrank"
    description: "The Company Metrics Alexausrank of the instance."
    type: string
    sql: ${TABLE}.company_metrics_alexausrank ;;
  }



  dimension: company_ticker {
    label: "Company Ticker"
    description: "The Company Ticker of the instance."
    type: string
    sql: ${TABLE}.company_ticker ;;
  }


  dimension: company_parent_domain {
    label: "Company Parent Domain"
    description: "The Company Parent Domain of the instance."
    type: string
    sql: ${TABLE}.company_parent_domain ;;
  }


  dimension: company_domainaliases {
    label: "Company Domainaliases"
    description: "The Company Domainaliases of the instance."
    type: string
    sql: ${TABLE}.company_domainaliases ;;
  }


  dimension: company_utcoffset {
    label: "Company Utcoffset"
    description: "The Company Utcoffset of the instance."
    type: string
    sql: ${TABLE}.company_utcoffset ;;
  }



  dimension: company_geo_streetnumber {
    label: "Company Geo Streetnumber"
    description: "The Company Geo Streetnumber of the instance."
    type: string
    sql: ${TABLE}.company_geo_streetnumber ;;
  }


  dimension: geoip_country {
    label: "Geoip Country"
    description: "The Geoip Country of the instance."
    type: string
    sql: ${TABLE}.geoip_country ;;
  }


  dimension: company_description {
    label: "Company Description"
    description: "The Company Description of the instance."
    type: string
    sql: ${TABLE}.company_description ;;
  }


  dimension: company_geo_statecode {
    label: "Company Geo Statecode"
    description: "The Company Geo Statecode of the instance."
    type: string
    sql: ${TABLE}.company_geo_statecode ;;
  }


  dimension: company_twitter_avatar {
    label: "Company Twitter Avatar"
    description: "The Company Twitter Avatar of the instance."
    type: string
    sql: ${TABLE}.company_twitter_avatar ;;
  }


  dimension: company_emailprovider {
    label: "Company Emailprovider"
    description: "Indicates Company Emailprovider is marked true/enabled."
    type: yesno
    sql: ${TABLE}.company_emailprovider ;;
  }



  dimension: company_phone {
    label: "Company Phone"
    description: "The Company Phone of the instance."
    type: string
    sql: ${TABLE}.company_phone ;;
  }


  dimension: company_twitter_id {
    label: "Company Twitter Id"
    description: "The Company Twitter Id of the instance."
    type: string
    sql: ${TABLE}.company_twitter_id ;;
  }


  dimension: company_location {
    label: "Company Location"
    description: "The Company Location of the instance."
    type: string
    sql: ${TABLE}.company_location ;;
  }


  dimension: company_category_sector {
    label: "Company Category Sector"
    description: "The Company Category Sector of the instance."
    type: string
    sql: ${TABLE}.company_category_sector ;;
  }


  dimension: company_geo_lat {
    label: "Company Geo Lat"
    description: "The Company Geo Lat of the instance."
    type: string
    sql: ${TABLE}.company_geo_lat ;;
  }



  dimension: company_indexedat {
    label: "Company Indexedat"
    description: "The Company Indexedat of the instance."
    type: string
    sql: ${TABLE}.company_indexedat ;;
  }


  dimension: company_ultimateparent_domain {
    label: "Company Ultimateparent Domain"
    description: "The Company Ultimateparent Domain of the instance."
    type: string
    sql: ${TABLE}.company_ultimateparent_domain ;;
  }


  dimension: company_geo_streetname {
    label: "Company Geo Streetname"
    description: "The Company Geo Streetname of the instance."
    type: string
    sql: ${TABLE}.company_geo_streetname ;;
  }


  dimension: company_geo_state {
    label: "Company Geo State"
    description: "The Company Geo State of the instance."
    type: string
    sql: ${TABLE}.company_geo_state ;;
  }


  dimension: company_metrics_estimatedannualrevenue {
    label: "Company Metrics Estimatedannualrevenue"
    description: "The Company Metrics Estimatedannualrevenue of the instance."
    type: string
    sql: ${TABLE}.company_metrics_estimatedannualrevenue ;;
  }


  dimension: company_twitter_site {
    label: "Company Twitter Site"
    description: "The Company Twitter Site of the instance."
    type: string
    sql: ${TABLE}.company_twitter_site ;;
  }


  dimension: company_category_siccode {
    label: "Company Category Siccode"
    description: "The Company Category Siccode of the instance."
    type: string
    sql: ${TABLE}.company_category_siccode ;;
  }


  dimension: geoip_city {
    label: "Geoip City"
    description: "The Geoip City of the instance."
    type: string
    sql: ${TABLE}.geoip_city ;;
  }


  dimension: company_geo_postalcode {
    label: "Company Geo Postalcode"
    description: "The Company Geo Postalcode of the instance."
    type: string
    sql: ${TABLE}.company_geo_postalcode ;;
  }


  dimension: geoip_statecode {
    label: "Geoip Statecode"
    description: "The Geoip Statecode of the instance."
    type: string
    sql: ${TABLE}.geoip_statecode ;;
  }


  dimension: company_geo_country {
    label: "Company Geo Country"
    description: "The Company Geo Country of the instance."
    type: string
    sql: ${TABLE}.company_geo_country ;;
  }


  dimension: company_tags {
    label: "Company Tags"
    description: "The Company Tags of the instance."
    type: string
    sql: ${TABLE}.company_tags ;;
  }


  dimension: domain {
    label: "Domain"
    description: "The Domain of the instance."
    type: string
    sql: ${TABLE}.domain ;;
  }


  dimension: company_geo_lng {
    label: "Company Geo Lng"
    description: "The Company Geo Lng of the instance."
    type: string
    sql: ${TABLE}.company_geo_lng ;;
  }



  dimension: server_id {
    label: "Server Id"
    description: "The Server Id of the instance."
    type: string
    sql: ${TABLE}.server_id ;;
  }


### DATES & TIMESTAMPS



### MEASURES



  measure: fuzzy_count {
    group_label: "Instance Counts"
    label: "Fuzzy"
    description: "The distinct count of servers/workspaces with Fuzzy marked true/enabled."
    type: count_distinct
    sql: CASE WHEN ${fuzzy} THEN {} ELSE NULL END;;
  }



  measure: company_metrics_annualrevenue_sum {
    group_label: "Company Metrics Annualrevenue Measures"
    label: "Company Metrics Annualrevenue (Sum)"
    description: "The sum of Company Metrics Annualrevenue across all instances within the grouping."
    type: sum
    sql: ${company_metrics_annualrevenue} ;;
  }

  measure: company_metrics_annualrevenue_avg {
    group_label: "Company Metrics Annualrevenue Measures"
    label: "Company Metrics Annualrevenue (Avg)"
    description: "The average Company Metrics Annualrevenue across all instances within the grouping."
    type: average
    sql: ${company_metrics_annualrevenue} ;;
  }

  measure: company_metrics_annualrevenue_median {
    group_label: "Company Metrics Annualrevenue Measures"
    label: "Company Metrics Annualrevenue (Avg)"
    description: "The median Company Metrics Annualrevenue across all instances within the grouping."
    type: median
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
    label: "Company Metrics Marketcap (Sum)"
    description: "The sum of Company Metrics Marketcap across all instances within the grouping."
    type: sum
    sql: ${company_metrics_marketcap} ;;
  }

  measure: company_metrics_marketcap_avg {
    group_label: "Company Metrics Marketcap Measures"
    label: "Company Metrics Marketcap (Avg)"
    description: "The average Company Metrics Marketcap across all instances within the grouping."
    type: average
    sql: ${company_metrics_marketcap} ;;
  }

  measure: company_metrics_marketcap_median {
    group_label: "Company Metrics Marketcap Measures"
    label: "Company Metrics Marketcap (Avg)"
    description: "The median Company Metrics Marketcap across all instances within the grouping."
    type: median
    sql: ${company_metrics_marketcap} ;;
  }



  measure: company_foundedyear_sum {
    group_label: "Company Foundedyear Measures"
    label: "Company Foundedyear (Sum)"
    description: "The sum of Company Foundedyear across all instances within the grouping."
    type: sum
    sql: ${company_foundedyear} ;;
  }

  measure: company_foundedyear_avg {
    group_label: "Company Foundedyear Measures"
    label: "Company Foundedyear (Avg)"
    description: "The average Company Foundedyear across all instances within the grouping."
    type: average
    sql: ${company_foundedyear} ;;
  }

  measure: company_foundedyear_median {
    group_label: "Company Foundedyear Measures"
    label: "Company Foundedyear (Avg)"
    description: "The median Company Foundedyear across all instances within the grouping."
    type: median
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

  measure: company_metrics_employees_avg {
    group_label: "Company Metrics Employees Measures"
    label: "Company Metrics Employees (Avg)"
    description: "The average Company Metrics Employees across all instances within the grouping."
    type: average
    sql: ${company_metrics_employees} ;;
  }

  measure: company_metrics_employees_median {
    group_label: "Company Metrics Employees Measures"
    label: "Company Metrics Employees (Avg)"
    description: "The median Company Metrics Employees across all instances within the grouping."
    type: median
    sql: ${company_metrics_employees} ;;
  }



  measure: company_twitter_following_sum {
    group_label: "Company Twitter Following Measures"
    label: "Company Twitter Following (Sum)"
    description: "The sum of Company Twitter Following across all instances within the grouping."
    type: sum
    sql: ${company_twitter_following} ;;
  }

  measure: company_twitter_following_avg {
    group_label: "Company Twitter Following Measures"
    label: "Company Twitter Following (Avg)"
    description: "The average Company Twitter Following across all instances within the grouping."
    type: average
    sql: ${company_twitter_following} ;;
  }

  measure: company_twitter_following_median {
    group_label: "Company Twitter Following Measures"
    label: "Company Twitter Following (Avg)"
    description: "The median Company Twitter Following across all instances within the grouping."
    type: median
    sql: ${company_twitter_following} ;;
  }



  measure: company_metrics_fiscalyearend_sum {
    group_label: "Company Metrics Fiscalyearend Measures"
    label: "Company Metrics Fiscalyearend (Sum)"
    description: "The sum of Company Metrics Fiscalyearend across all instances within the grouping."
    type: sum
    sql: ${company_metrics_fiscalyearend} ;;
  }

  measure: company_metrics_fiscalyearend_avg {
    group_label: "Company Metrics Fiscalyearend Measures"
    label: "Company Metrics Fiscalyearend (Avg)"
    description: "The average Company Metrics Fiscalyearend across all instances within the grouping."
    type: average
    sql: ${company_metrics_fiscalyearend} ;;
  }

  measure: company_metrics_fiscalyearend_median {
    group_label: "Company Metrics Fiscalyearend Measures"
    label: "Company Metrics Fiscalyearend (Avg)"
    description: "The median Company Metrics Fiscalyearend across all instances within the grouping."
    type: median
    sql: ${company_metrics_fiscalyearend} ;;
  }



  measure: company_metrics_alexaglobalrank_sum {
    group_label: "Company Metrics Alexaglobalrank Measures"
    label: "Company Metrics Alexaglobalrank (Sum)"
    description: "The sum of Company Metrics Alexaglobalrank across all instances within the grouping."
    type: sum
    sql: ${company_metrics_alexaglobalrank} ;;
  }

  measure: company_metrics_alexaglobalrank_avg {
    group_label: "Company Metrics Alexaglobalrank Measures"
    label: "Company Metrics Alexaglobalrank (Avg)"
    description: "The average Company Metrics Alexaglobalrank across all instances within the grouping."
    type: average
    sql: ${company_metrics_alexaglobalrank} ;;
  }

  measure: company_metrics_alexaglobalrank_median {
    group_label: "Company Metrics Alexaglobalrank Measures"
    label: "Company Metrics Alexaglobalrank (Avg)"
    description: "The median Company Metrics Alexaglobalrank across all instances within the grouping."
    type: median
    sql: ${company_metrics_alexaglobalrank} ;;
  }



  measure: company_metrics_raised_sum {
    group_label: "Company Metrics Raised Measures"
    label: "Company Metrics Raised (Sum)"
    description: "The sum of Company Metrics Raised across all instances within the grouping."
    type: sum
    sql: ${company_metrics_raised} ;;
  }

  measure: company_metrics_raised_avg {
    group_label: "Company Metrics Raised Measures"
    label: "Company Metrics Raised (Avg)"
    description: "The average Company Metrics Raised across all instances within the grouping."
    type: average
    sql: ${company_metrics_raised} ;;
  }

  measure: company_metrics_raised_median {
    group_label: "Company Metrics Raised Measures"
    label: "Company Metrics Raised (Avg)"
    description: "The median Company Metrics Raised across all instances within the grouping."
    type: median
    sql: ${company_metrics_raised} ;;
  }



  measure: company_facebook_likes_sum {
    group_label: "Company Facebook Likes Measures"
    label: "Company Facebook Likes (Sum)"
    description: "The sum of Company Facebook Likes across all instances within the grouping."
    type: sum
    sql: ${company_facebook_likes} ;;
  }

  measure: company_facebook_likes_avg {
    group_label: "Company Facebook Likes Measures"
    label: "Company Facebook Likes (Avg)"
    description: "The average Company Facebook Likes across all instances within the grouping."
    type: average
    sql: ${company_facebook_likes} ;;
  }

  measure: company_facebook_likes_median {
    group_label: "Company Facebook Likes Measures"
    label: "Company Facebook Likes (Avg)"
    description: "The median Company Facebook Likes across all instances within the grouping."
    type: median
    sql: ${company_facebook_likes} ;;
  }



  measure: company_twitter_followers_sum {
    group_label: "Company Twitter Followers Measures"
    label: "Company Twitter Followers (Sum)"
    description: "The sum of Company Twitter Followers across all instances within the grouping."
    type: sum
    sql: ${company_twitter_followers} ;;
  }

  measure: company_twitter_followers_avg {
    group_label: "Company Twitter Followers Measures"
    label: "Company Twitter Followers (Avg)"
    description: "The average Company Twitter Followers across all instances within the grouping."
    type: average
    sql: ${company_twitter_followers} ;;
  }

  measure: company_twitter_followers_median {
    group_label: "Company Twitter Followers Measures"
    label: "Company Twitter Followers (Avg)"
    description: "The median Company Twitter Followers across all instances within the grouping."
    type: median
    sql: ${company_twitter_followers} ;;
  }



  measure: company_metrics_alexausrank_sum {
    group_label: "Company Metrics Alexausrank Measures"
    label: "Company Metrics Alexausrank (Sum)"
    description: "The sum of Company Metrics Alexausrank across all instances within the grouping."
    type: sum
    sql: ${company_metrics_alexausrank} ;;
  }

  measure: company_metrics_alexausrank_avg {
    group_label: "Company Metrics Alexausrank Measures"
    label: "Company Metrics Alexausrank (Avg)"
    description: "The average Company Metrics Alexausrank across all instances within the grouping."
    type: average
    sql: ${company_metrics_alexausrank} ;;
  }

  measure: company_metrics_alexausrank_median {
    group_label: "Company Metrics Alexausrank Measures"
    label: "Company Metrics Alexausrank (Avg)"
    description: "The median Company Metrics Alexausrank across all instances within the grouping."
    type: median
    sql: ${company_metrics_alexausrank} ;;
  }



  measure: company_utcoffset_sum {
    group_label: "Company Utcoffset Measures"
    label: "Company Utcoffset (Sum)"
    description: "The sum of Company Utcoffset across all instances within the grouping."
    type: sum
    sql: ${company_utcoffset} ;;
  }

  measure: company_utcoffset_avg {
    group_label: "Company Utcoffset Measures"
    label: "Company Utcoffset (Avg)"
    description: "The average Company Utcoffset across all instances within the grouping."
    type: average
    sql: ${company_utcoffset} ;;
  }

  measure: company_utcoffset_median {
    group_label: "Company Utcoffset Measures"
    label: "Company Utcoffset (Avg)"
    description: "The median Company Utcoffset across all instances within the grouping."
    type: median
    sql: ${company_utcoffset} ;;
  }



  measure: company_emailprovider_count {
    group_label: "Instance Counts"
    label: "Company Emailprovider"
    description: "The distinct count of servers/workspaces with Company Emailprovider marked true/enabled."
    type: count_distinct
    sql: CASE WHEN ${company_emailprovider} THEN {} ELSE NULL END;;
  }



  measure: company_twitter_id_count {
    group_label: "Company_Twitter Counts"
    label: "Company Twitter Id"
    description: "The distinct count of company twitter id's within the grouping."
    type: count_distinct
    sql: ${company_twitter_id} ;;
  }



  measure: company_geo_lat_sum {
    group_label: "Company Geo Lat Measures"
    label: "Company Geo Lat (Sum)"
    description: "The sum of Company Geo Lat across all instances within the grouping."
    type: sum
    sql: ${company_geo_lat} ;;
  }

  measure: company_geo_lat_avg {
    group_label: "Company Geo Lat Measures"
    label: "Company Geo Lat (Avg)"
    description: "The average Company Geo Lat across all instances within the grouping."
    type: average
    sql: ${company_geo_lat} ;;
  }

  measure: company_geo_lat_median {
    group_label: "Company Geo Lat Measures"
    label: "Company Geo Lat (Avg)"
    description: "The median Company Geo Lat across all instances within the grouping."
    type: median
    sql: ${company_geo_lat} ;;
  }



  measure: company_geo_lng_sum {
    group_label: "Company Geo Lng Measures"
    label: "Company Geo Lng (Sum)"
    description: "The sum of Company Geo Lng across all instances within the grouping."
    type: sum
    sql: ${company_geo_lng} ;;
  }

  measure: company_geo_lng_avg {
    group_label: "Company Geo Lng Measures"
    label: "Company Geo Lng (Avg)"
    description: "The average Company Geo Lng across all instances within the grouping."
    type: average
    sql: ${company_geo_lng} ;;
  }

  measure: company_geo_lng_median {
    group_label: "Company Geo Lng Measures"
    label: "Company Geo Lng (Avg)"
    description: "The median Company Geo Lng across all instances within the grouping."
    type: median
    sql: ${company_geo_lng} ;;
  }



  measure: server_id_count {
    group_label: "Server Counts"
    label: "Server Id"
    description: "The distinct count of server id's within the grouping."
    type: count_distinct
    sql: ${server_id} ;;
  }



    
    }
    