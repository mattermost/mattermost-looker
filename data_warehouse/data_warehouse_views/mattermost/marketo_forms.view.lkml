# This is the view file for the analytics.mattermost.marketo_forms table.
view: marketo_forms {
  sql_table_name: mattermost.marketo_forms ;;
  view_label: "Marketo Forms"

  # FILTERS

  # DIMENSIONS
  dimension: lastformreferrer {
    label: "Last Form Referrer"
    description: ""
    type: string
    sql: ${TABLE}.lastformreferrer ;;
    hidden: no
  }

  dimension: longitude {
    label: "Longitude"
    group_label: "Clearbit"
    description: ""
    type: string
    sql: ${TABLE}.longitude ;;
    hidden: no
  }

  dimension: dscorgpkg__fiscal_year_end__c {
    label: "Company Fiscal Year End"
    group_label: "Clearbit"
    description: ""
    type: string
    sql: ${TABLE}.dscorgpkg__fiscal_year_end__c ;;
    hidden: no
  }

  dimension: context_app_build {
    description: ""
    type: string
    sql: ${TABLE}.context_app_build ;;
    hidden: yes
  }

  dimension: dscorgpkg__company_hq_state_full_name__c {
    label: "Company HQ State Name"
    group_label: "Clearbit"
    type: string
    sql: ${TABLE}.dscorgpkg__company_hq_state_full_name__c ;;
    hidden: no
  }

  dimension: email {
    description: ""
    type: string
    sql: ${TABLE}.email ;;
    hidden: no
  }

  dimension: what_s_prompting_you_to_evaluate_mm__c {
    group_label: "Form Questions"
    label: "What Prompted Mattermost Eval."
    description: "The input provided by the user when asked 'What prompted you to evaluate Mattermost?'."
    type: string
    sql: ${TABLE}.what_s_prompting_you_to_evaluate_mm__c ;;
    hidden: no
  }

  dimension: munchkinid {
    label: "Munchkin Id"
    description: ""
    type: string
    sql: ${TABLE}.munchkinid ;;
    hidden: no
  }

  dimension: latitude {
    label: "Latitude"
    group_label: "Clearbit"
    description: ""
    type: string
    sql: ${TABLE}.latitude ;;
    hidden: no
  }

  dimension: anonymous_id {
    label: "User Id"
    description: "Distinct user id of user submitting form."
    type: string
    sql: ${TABLE}.anonymous_id ;;
    hidden: no
  }

  dimension: context_useragent {
    description: ""
    type: string
    sql: ${TABLE}.context_useragent ;;
    hidden: no
  }

  dimension: current_technologies_used__c {
    label: "Current Technology Used"
    group_label: "Clearbit"
    description: ""
    type: string
    sql: ${TABLE}.current_technologies_used__c ;;
    hidden: no
  }

  dimension: linkedin__c {
    label: "LinkedIn Handle"
    description: "LinkedIn Handle of user submitting form."
    type: string
    sql: ${TABLE}.linkedin__c ;;
    hidden: no
  }

  dimension: context_screen_density {
    description: ""
    type: number
    sql: ${TABLE}.context_screen_density ;;
    hidden: yes
  }

  dimension: context_app_name {
    description: ""
    type: string
    sql: ${TABLE}.context_app_name ;;
    hidden: yes
  }

  dimension: numberofemployees {
    label: "# Employees"
    description: ""
    type: string
    sql: ${TABLE}.numberofemployees ;;
    hidden: no
  }

  dimension: most_recent_action_detail__c {
    label: "Most Recent Action Detail"
    description: "The title of the most recent action completed by the user submitting the form."
    type: string
    sql: ${TABLE}.most_recent_action_detail__c ;;
    hidden: no
  }

  dimension: dscorgpkg__company_hq_country_code__c {
    label: "Company HQ Country Code"
    group_label: "Clearbit"
    description: ""
    type: string
    sql: ${TABLE}.dscorgpkg__company_hq_country_code__c ;;
    hidden: no
  }

  dimension: clearbitformstatus {
    label: "Clearbit Form Status"
    group_label: "Clearbit"
    description: ""
    type: string
    sql: ${TABLE}.clearbitformstatus ;;
    hidden: no
  }

  dimension: lastname {
    label: "Last Name"
    description: "Last name of the user submitting the form."
    type: string
    sql: ${TABLE}.lastname ;;
    hidden: no
  }

  dimension: accepttrialtermsyn {
    label: "Accept Trial Terms (Yes/No)"
    description: ""
    type: string
    sql: ${TABLE}.accepttrialtermsyn ;;
    hidden: no
  }

  dimension: formid {
    label: "Form Id"
    description: "Marketo form id."
    type: string
    sql: ${TABLE}.formid ;;
    hidden: no
  }

  dimension: context_page_url {
    description: ""
    type: string
    sql: ${TABLE}.context_page_url ;;
    hidden: yes
  }

  dimension: id {
    description: ""
    type: string
    sql: ${TABLE}.id ;;
    hidden: yes
  }

  dimension: firstname {
    label: "First Name"
    description: "First name of the user submitting the form."
    type: string
    sql: ${TABLE}.firstname ;;
    hidden: no
  }

  dimension: context_ip {
    description: ""
    type: string
    sql: ${TABLE}.context_ip ;;
    hidden: yes
  }

  dimension: where_are_you_with_mattermost__c {
    label: "Mattermost Stage"
    description: "The input provided by the user when asked 'Where are you with Mattermost?'."
    type: string
    sql: ${TABLE}.where_are_you_with_mattermost__c ;;
    hidden: no
  }

  dimension: dscorgpkg__company_hq_state__c {
    label: "Company HQ State"
    group_label: "Clearbit"
    description: ""
    type: string
    sql: ${TABLE}.dscorgpkg__company_hq_state__c ;;
    hidden: no
  }

  dimension: context_library_version {
    description: ""
    type: string
    sql: ${TABLE}.context_library_version ;;
    hidden: yes
  }

  dimension: event_text {
    description: ""
    type: string
    sql: ${TABLE}.event_text ;;
    hidden: yes
  }

  dimension: context_app_namespace {
    description: ""
    type: string
    sql: ${TABLE}.context_app_namespace ;;
    hidden: yes
  }

  dimension: clearbitstatus {
    label: "Clearbit Status"
    group_label: "Clearbit"
    description: ""
    type: string
    sql: ${TABLE}.clearbitstatus ;;
    hidden: no
  }

  dimension: how_did_you_hear_about_mattermost__c {
    label: "Heard About Mattermost"
    description: "The input provided by the user when asked 'How did you hear about Mattermost?'."
    type: string
    sql: ${TABLE}.how_did_you_hear_about_mattermost__c ;;
    hidden: no
  }

  dimension: context_app_version {
    description: ""
    type: string
    sql: ${TABLE}.context_app_version ;;
    hidden: no
  }

  dimension: context_page_title {
    description: ""
    type: string
    sql: ${TABLE}.context_page_title ;;
    hidden: no
  }

  dimension: context_page_referrer {
    description: ""
    type: string
    sql: ${TABLE}.context_page_referrer ;;
    hidden: no
  }

  dimension: number_of_end_users__c {
    description: ""
    type: string
    sql: ${TABLE}.number_of_end_users__c ;;
    hidden: no
  }

  dimension: context_library_name {
    description: ""
    type: string
    sql: ${TABLE}.context_library_name ;;
    hidden: no
  }

  dimension: channel {
    description: ""
    type: string
    sql: ${TABLE}.channel ;;
    hidden: no
  }

  dimension: city {
    description: ""
    type: string
    sql: ${TABLE}.city ;;
    hidden: no
  }

  dimension: siccode {
    label: "SIC Code"
    description: ""
    type: string
    sql: ${TABLE}.siccode ;;
    hidden: no
  }

  dimension: website {
    description: ""
    type: string
    sql: ${TABLE}.website ;;
    hidden: no
  }

  dimension: spamcheck {
    label: "Spam Check"
    description: ""
    type: string
    sql: ${TABLE}.spamcheck ;;
    hidden: no
  }

  dimension: user_id {
    description: ""
    type: string
    sql: ${TABLE}.user_id ;;
    hidden: yes
  }

  dimension: company {
    description: ""
    type: string
    sql: ${TABLE}.company ;;
    hidden: no
  }

  dimension: state {
    description: ""
    type: string
    sql: ${TABLE}.state ;;
    hidden: no
  }

  dimension: country {
    description: ""
    type: string
    sql: ${TABLE}.country ;;
    hidden: no
  }

  dimension: dscorgpkg__company_hq_country_full_name__c {
    label: "Company HQ Country"
    group_label: "Clearbit"
    description: ""
    type: string
    sql: ${TABLE}.dscorgpkg__company_hq_country_full_name__c ;;
    hidden: no
  }

  dimension: countrycode {
    label: "Country Code"
    description: ""
    type: string
    sql: ${TABLE}.countrycode ;;
    hidden: no
  }

  dimension: event {
    description: ""
    type: string
    sql: ${TABLE}.event ;;
    hidden: yes
  }

  dimension: which_plug_ins_integrations__c {
    label: "Plugin Interest"
    description: "The input provided by the user when asked 'Which plugins interest you?'."
    type: string
    sql: ${TABLE}.which_plug_ins_integrations__c ;;
    hidden: no
  }

  dimension: what_are_you_looking_to_get_out_of_trial__c {
    label: "Trial Objective"
    description: "The input provided by the user when asked 'What are you looking to get ouf the trial?'."
    type: string
    sql: ${TABLE}.what_are_you_looking_to_get_out_of_trial__c ;;
    hidden: no
  }

  dimension: dscorgpkg__naics_codes__c {
    label: "NAICS Codes"
    group_label: "Clearbit"
    description: ""
    type: string
    sql: ${TABLE}.dscorgpkg__naics_codes__c ;;
    hidden: no
  }

  dimension: context_request_ip {
    description: ""
    type: string
    sql: ${TABLE}.context_request_ip ;;
    hidden: yes
  }

  dimension: context_page_path {
    group_label: "URL Parameters"
    label: "Page Path"
    description: ""
    type: string
    sql: ${TABLE}.context_page_path ;;
    hidden: no
  }

  dimension: source_url__c {
    group_label: "URL Parameters"
    label: "Source URL"
    description: ""
    type: string
    sql: ${TABLE}.source_url__c ;;
    hidden: no
  }

  dimension: most_recent_action__c {
    label: "Most Recent Action"
    description: "Title of most recent action performed by user submitting form."
    type: string
    sql: ${TABLE}.most_recent_action__c ;;
    hidden: no
  }

  dimension: context_locale {
    description: ""
    type: string
    sql: ${TABLE}.context_locale ;;
    hidden: yes
  }

  dimension: statecode {
    label: "State (ISO)"
    description: "The user's 2-digit state ISO code."
    type: string
    sql: ${TABLE}.statecode ;;
    hidden: no
  }

  dimension: emailoptin {
    group_label: "Form Questions"
    label: "Email Opt In"
    description: ""
    type: string
    sql: ${TABLE}.emailoptin ;;
    hidden: no
  }

  dimension: dscorgpkg__company_hq_city__c {
    label: "Company HQ City"
    group_label: "Clearbit"
    description: ""
    type: string
    sql: ${TABLE}.dscorgpkg__company_hq_city__c ;;
    hidden: no
  }

  dimension: contact_us_inquiry_type__c {
    group_label: "Form Questions"
    label: "Contact Us Inquiry Type"
    description: ""
    type: string
    sql: ${TABLE}.contact_us_inquiry_type__c ;;
    hidden: no
  }

  dimension: tell_us_more_about_how_we_can_help_you__c {
    group_label: "Form Questions"
    label: "Tell Us More..."
    description: "The input provided by the user when asked 'Tell us more about how we can help you?'."
    type: string
    sql: ${TABLE}.tell_us_more_about_how_we_can_help_you__c ;;
    hidden: no
  }

  dimension: dscorgpkg__company_hq_postal_code__c {
    label: "Company HQ Zipcode"
    group_label: "Clearbit"
    description: ""
    type: string
    sql: ${TABLE}.dscorgpkg__company_hq_postal_code__c ;;
    hidden: no
  }

  dimension: dscorgpkg__company_hq_address__c {
    label: "Company HQ Address"
    group_label: "Clearbit"
    description: ""
    type: string
    sql: ${TABLE}.dscorgpkg__company_hq_address__c ;;
    hidden: no
  }

  dimension: phone {
    description: ""
    type: string
    sql: ${TABLE}.phone ;;
    hidden: no
  }

  dimension: license_quantity__c {
    group_label: "Form Questions"
    label: "License Quantity"
    description: ""
    type: string
    sql: ${TABLE}.license_quantity__c ;;
    hidden: no
  }

  dimension: enterpriseproductoptions {
    group_label: "Form Questions"
    label: "Enterprise Product Options"
    description: ""
    type: string
    sql: ${TABLE}.enterpriseproductoptions ;;
    hidden: no
  }

  dimension: context_page_search {
    description: ""
    type: string
    sql: ${TABLE}.context_page_search ;;
    hidden: no
  }

  dimension: accepttermsyn {
    group_label: "Form Questions"
    label: "Accept Terms (Yes/No)"
    description: ""
    type: string
    sql: ${TABLE}.accepttermsyn ;;
    hidden: no
  }

  dimension: where_are_you_with_mm_quote_form__c {
    group_label: "Form Questions"
    label: "Mattermost Quote Form Stage"
    description: ""
    type: string
    sql: ${TABLE}.where_are_you_with_mm_quote_form__c ;;
    hidden: no
  }

  dimension: number_of_end_users_quote_form__c {
    group_label: "Form Questions"
    label: "# End Users"
    description: ""
    type: number
    sql: ${TABLE}.number_of_end_users_quote_form__c ;;
    hidden: no
  }

  dimension: context_traits_portal_customer_id {
    label: "Portal Customer Id"
    description: ""
    type: string
    sql: ${TABLE}.context_traits_portal_customer_id ;;
    hidden: no
  }

  dimension: utm_medium__c {
    label: "UTM Medium"
    group_label: "UTM Parameters"
    description: ""
    type: string
    sql: ${TABLE}.utm_medium__c ;;
    hidden: no
  }

  dimension: context_campaign_content {
    label: "Campaign Content"
    group_label: "Campaign Parameters"
    description: ""
    type: string
    sql: ${TABLE}.context_campaign_content ;;
    hidden: no
  }

  dimension: utm_campaign__c {
    label: "UTM Campaign"
    group_label: "UTM Parameters"
    description: ""
    type: string
    sql: ${TABLE}.utm_campaign__c ;;
    hidden: no
  }

  dimension: context_campaign_source {
    label: "Campaign Source"
    group_label: "Campaign Parameters"
    description: ""
    type: string
    sql: ${TABLE}.context_campaign_source ;;
    hidden: no
  }

  dimension: context_campaign_name {
    label: "Campaign Name"
    group_label: "Campaign Parameters"
    description: ""
    type: string
    sql: ${TABLE}.context_campaign_name ;;
    hidden: no
  }

  dimension: context_campaign_adgroup {
    label: "Campaign Ad Group"
    group_label: "Campaign Parameters"
    description: ""
    type: string
    sql: ${TABLE}.context_campaign_adgroup ;;
    hidden: no
  }

  dimension: obility_id__c {
    label: "Obility Id"
    description: ""
    type: string
    sql: ${TABLE}.obility_id__c ;;
    hidden: no
  }

  dimension: context_campaign_term {
    label: "Campaign Term"
    group_label: "Campaign Parameters"
    description: ""
    type: string
    sql: ${TABLE}.context_campaign_term ;;
    hidden: no
  }

  dimension: context_campaign_medium {
    label: "Campaign Medium"
    group_label: "Campaign Parameters"
    description: ""
    type: string
    sql: ${TABLE}.context_campaign_medium ;;
    hidden: no
  }

  dimension: utm_adgroup__c {
    label: "UTM Ad Group"
    group_label: "UTM Parameters"
    description: ""
    type: string
    sql: ${TABLE}.utm_adgroup__c ;;
    hidden: no
  }

  dimension: utm_source__c {
    label: "UTM Source"
    group_label: "UTM Parameters"
    description: ""
    type: string
    sql: ${TABLE}.utm_source__c ;;
    hidden: no
  }

  dimension: utm_term__c {
    label: "UTM Term"
    group_label: "UTM Parameters"
    description: ""
    type: string
    sql: ${TABLE}.utm_term__c ;;
    hidden: no
  }

  dimension: gclid__c {
    description: ""
    type: string
    sql: ${TABLE}.gclid__c ;;
    hidden: no
  }

  dimension: utm_content__c {
    label: "UTM Content"
    group_label: "UTM Parameters"
    description: ""
    type: string
    sql: ${TABLE}.utm_content__c ;;
    hidden: no
  }

  dimension: region__c {
    description: ""
    type: string
    sql: ${TABLE}.region__c ;;
    hidden: no
  }

  dimension: dscorgpkg__twitter_url__c {
    label: "Twitter URL"
    group_label: "Clearbit"
    description: ""
    type: string
    sql: ${TABLE}.dscorgpkg__twitter_url__c ;;
    hidden: no
  }

  dimension: selectsession {
    description: ""
    type: string
    sql: ${TABLE}.selectsession ;;
    hidden: yes
  }


  # DIMENSION GROUPS/DATES
  dimension_group: clearbitenrichedat {
    label: "Clearbit Enriched"
  description: ""
  type: time
  timeframes: [time, date]
    sql: ${TABLE}.clearbitenrichedat ;;
    hidden: no
  }

  dimension_group: uuid_ts {
  description: ""
  type: time
  timeframes: [time, week, date, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.uuid_ts ;;
    hidden: yes
  }

  dimension_group: timestamp {
  description: ""
  type: time
  timeframes: [time, week, date, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.timestamp ;;
    hidden: no
  }

  dimension_group: original_timestamp {
  description: ""
  type: time
  timeframes: [time, week, date, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.original_timestamp ;;
    hidden: yes
  }

  dimension_group: sent_at {
  description: ""
  type: time
  timeframes: [time, week, date, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.sent_at ;;
    hidden: yes
  }

  dimension_group: received_at {
  description: ""
  type: time
  timeframes: [time, week, date, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.received_at ;;
    hidden: yes
  }


  # MEASURES
  measure: count {
    description: "Count of rows/occurrences."
    type: count
  }

  measure: anonymous_count {
    label: " User Count"
    description: "The distinct count of Marketo Forms Users within each grouping."
    type: count_distinct
    sql: ${anonymous_id} ;;
  }

  measure: context_screen_density_max {
    description: "The max Context Screen Densitys within each grouping."
    type: max
    group_label: "Context Screen Density Measures"
    sql: ${context_screen_density} ;;
    hidden: yes
  }

  measure: context_screen_density_min {
    description: "The min Context Screen Densitys within each grouping."
    type: min
    group_label: "Context Screen Density Measures"
    sql: ${context_screen_density} ;;
    hidden: yes
  }

  measure: context_screen_density_avg {
    description: "The average Context Screen Densitys within each grouping."
    type: average
    group_label: "Context Screen Density Measures"
    sql: ${context_screen_density} ;;
    hidden: yes
  }

  measure: context_screen_density_median {
    description: "The median  Context Screen Densitys within each grouping."
    type: median
    group_label: "Context Screen Density Measures"
    sql: ${context_screen_density} ;;
    hidden: yes
  }

  measure: id_count {
    label: " Form Completes"
    description: "The distinct count of Marketo Form completes within each grouping."
    type: count_distinct
    sql: ${id} ;;
  }

  measure: user_count {
    label: " Server Count"
    description: "The distinct count of Marketo Forms Users within each grouping."
    type: count_distinct
    sql: ${user_id} ;;
    hidden: yes
  }

  measure: number_of_end_users_quote_form__c_sum {
    description: "The sum of Number Of End Users Quote Form  Cs within each grouping."
    type: sum
    group_label: "Number Of End Users Quote Form  C Measures"
    sql: ${number_of_end_users_quote_form__c} ;;
    hidden: yes
  }

  measure: number_of_end_users_quote_form__c_max {
    description: "The max Number Of End Users Quote Form  Cs within each grouping."
    type: max
    group_label: "Number Of End Users Quote Form  C Measures"
    sql: ${number_of_end_users_quote_form__c} ;;
    hidden: yes
  }

  measure: number_of_end_users_quote_form__c_min {
    description: "The min Number Of End Users Quote Form  Cs within each grouping."
    type: min
    group_label: "Number Of End Users Quote Form  C Measures"
    sql: ${number_of_end_users_quote_form__c} ;;
    hidden: yes
  }

  measure: number_of_end_users_quote_form__c_avg {
    description: "The average Number Of End Users Quote Form  Cs within each grouping."
    type: average
    group_label: "Number Of End Users Quote Form  C Measures"
    sql: ${number_of_end_users_quote_form__c} ;;
    hidden: yes
  }

  measure: number_of_end_users_quote_form__c_median {
    description: "The median  Number Of End Users Quote Form  Cs within each grouping."
    type: median
    group_label: "Number Of End Users Quote Form  C Measures"
    sql: ${number_of_end_users_quote_form__c} ;;
    hidden: yes
  }

  measure: context_traits_portal_customer_count {
    label: " Portal Customer Count"
    description: "The distinct count of Marketo Forms Context Traits Portal Customers within each grouping."
    type: count_distinct
    sql: ${context_traits_portal_customer_id} ;;
  }

  measure: obility__c_count {
    label: " Obility  C Count"
    description: "The distinct count of Marketo Forms Obilitys  C within each grouping."
    type: count_distinct
    sql: ${obility_id__c} ;;
    hidden: yes
  }


}
