# This is the view file for the analytics.mattermost.marketo_forms table.
view: marketo_forms {
  sql_table_name: mattermost.marketo_forms ;;
  view_label: "Marketo Forms"

  # FILTERS

  # DIMENSIONS
  dimension: lastformreferrer {
    description: "" 
    type: string
    sql: ${TABLE}.lastformreferrer ;;
    hidden: no
  }

  dimension: longitude {
    description: "" 
    type: string
    sql: ${TABLE}.longitude ;;
    hidden: no
  }

  dimension: dscorgpkg__fiscal_year_end__c {
    description: "" 
    type: string
    sql: ${TABLE}.dscorgpkg__fiscal_year_end__c ;;
    hidden: no
  }

  dimension: context_app_build {
    description: "" 
    type: string
    sql: ${TABLE}.context_app_build ;;
    hidden: no
  }

  dimension: dscorgpkg__company_hq_state_full_name__c {
    description: "" 
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
    description: "" 
    type: string
    sql: ${TABLE}.what_s_prompting_you_to_evaluate_mm__c ;;
    hidden: no
  }

  dimension: munchkinid {
    description: "" 
    type: string
    sql: ${TABLE}.munchkinid ;;
    hidden: no
  }

  dimension: latitude {
    description: "" 
    type: string
    sql: ${TABLE}.latitude ;;
    hidden: no
  }

  dimension: anonymous_id {
    description: "" 
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
    description: "" 
    type: string
    sql: ${TABLE}.current_technologies_used__c ;;
    hidden: no
  }

  dimension: linkedin__c {
    description: "" 
    type: string
    sql: ${TABLE}.linkedin__c ;;
    hidden: no
  }

  dimension: context_screen_density {
    description: "" 
    type: number
    sql: ${TABLE}.context_screen_density ;;
    hidden: no
  }

  dimension: context_app_name {
    description: "" 
    type: string
    sql: ${TABLE}.context_app_name ;;
    hidden: no
  }

  dimension: numberofemployees {
    description: "" 
    type: string
    sql: ${TABLE}.numberofemployees ;;
    hidden: no
  }

  dimension: most_recent_action_detail__c {
    description: "" 
    type: string
    sql: ${TABLE}.most_recent_action_detail__c ;;
    hidden: no
  }

  dimension: dscorgpkg__company_hq_country_code__c {
    description: "" 
    type: string
    sql: ${TABLE}.dscorgpkg__company_hq_country_code__c ;;
    hidden: no
  }

  dimension: clearbitformstatus {
    description: "" 
    type: string
    sql: ${TABLE}.clearbitformstatus ;;
    hidden: no
  }

  dimension: lastname {
    description: "" 
    type: string
    sql: ${TABLE}.lastname ;;
    hidden: no
  }

  dimension: accepttrialtermsyn {
    description: "" 
    type: string
    sql: ${TABLE}.accepttrialtermsyn ;;
    hidden: no
  }

  dimension: formid {
    description: "" 
    type: string
    sql: ${TABLE}.formid ;;
    hidden: no
  }

  dimension: context_page_url {
    description: "" 
    type: string
    sql: ${TABLE}.context_page_url ;;
    hidden: no
  }

  dimension: id {
    description: "" 
    type: string
    sql: ${TABLE}.id ;;
    hidden: no
  }

  dimension: firstname {
    description: "" 
    type: string
    sql: ${TABLE}.firstname ;;
    hidden: no
  }

  dimension: context_ip {
    description: "" 
    type: string
    sql: ${TABLE}.context_ip ;;
    hidden: no
  }

  dimension: where_are_you_with_mattermost__c {
    description: "" 
    type: string
    sql: ${TABLE}.where_are_you_with_mattermost__c ;;
    hidden: no
  }

  dimension: dscorgpkg__company_hq_state__c {
    description: "" 
    type: string
    sql: ${TABLE}.dscorgpkg__company_hq_state__c ;;
    hidden: no
  }

  dimension: context_library_version {
    description: "" 
    type: string
    sql: ${TABLE}.context_library_version ;;
    hidden: no
  }

  dimension: event_text {
    description: "" 
    type: string
    sql: ${TABLE}.event_text ;;
    hidden: no
  }

  dimension: context_app_namespace {
    description: "" 
    type: string
    sql: ${TABLE}.context_app_namespace ;;
    hidden: no
  }

  dimension: clearbitstatus {
    description: "" 
    type: string
    sql: ${TABLE}.clearbitstatus ;;
    hidden: no
  }

  dimension: how_did_you_hear_about_mattermost__c {
    description: "" 
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
    description: "" 
    type: string
    sql: ${TABLE}.spamcheck ;;
    hidden: no
  }

  dimension: user_id {
    description: "" 
    type: string
    sql: ${TABLE}.user_id ;;
    hidden: no
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
    description: "" 
    type: string
    sql: ${TABLE}.dscorgpkg__company_hq_country_full_name__c ;;
    hidden: no
  }

  dimension: countrycode {
    description: "" 
    type: string
    sql: ${TABLE}.countrycode ;;
    hidden: no
  }

  dimension: event {
    description: "" 
    type: string
    sql: ${TABLE}.event ;;
    hidden: no
  }

  dimension: which_plug_ins_integrations__c {
    description: "" 
    type: string
    sql: ${TABLE}.which_plug_ins_integrations__c ;;
    hidden: no
  }

  dimension: what_are_you_looking_to_get_out_of_trial__c {
    description: "" 
    type: string
    sql: ${TABLE}.what_are_you_looking_to_get_out_of_trial__c ;;
    hidden: no
  }

  dimension: dscorgpkg__naics_codes__c {
    description: "" 
    type: string
    sql: ${TABLE}.dscorgpkg__naics_codes__c ;;
    hidden: no
  }

  dimension: context_request_ip {
    description: "" 
    type: string
    sql: ${TABLE}.context_request_ip ;;
    hidden: no
  }

  dimension: context_page_path {
    description: "" 
    type: string
    sql: ${TABLE}.context_page_path ;;
    hidden: no
  }

  dimension: source_url__c {
    description: "" 
    type: string
    sql: ${TABLE}.source_url__c ;;
    hidden: no
  }

  dimension: most_recent_action__c {
    description: "" 
    type: string
    sql: ${TABLE}.most_recent_action__c ;;
    hidden: no
  }

  dimension: context_locale {
    description: "" 
    type: string
    sql: ${TABLE}.context_locale ;;
    hidden: no
  }

  dimension: statecode {
    description: "" 
    type: string
    sql: ${TABLE}.statecode ;;
    hidden: no
  }

  dimension: emailoptin {
    description: "" 
    type: string
    sql: ${TABLE}.emailoptin ;;
    hidden: no
  }

  dimension: dscorgpkg__company_hq_city__c {
    description: "" 
    type: string
    sql: ${TABLE}.dscorgpkg__company_hq_city__c ;;
    hidden: no
  }

  dimension: contact_us_inquiry_type__c {
    description: "" 
    type: string
    sql: ${TABLE}.contact_us_inquiry_type__c ;;
    hidden: no
  }

  dimension: tell_us_more_about_how_we_can_help_you__c {
    description: "" 
    type: string
    sql: ${TABLE}.tell_us_more_about_how_we_can_help_you__c ;;
    hidden: no
  }

  dimension: dscorgpkg__company_hq_postal_code__c {
    description: "" 
    type: string
    sql: ${TABLE}.dscorgpkg__company_hq_postal_code__c ;;
    hidden: no
  }

  dimension: dscorgpkg__company_hq_address__c {
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
    description: "" 
    type: string
    sql: ${TABLE}.license_quantity__c ;;
    hidden: no
  }

  dimension: enterpriseproductoptions {
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
    description: "" 
    type: string
    sql: ${TABLE}.accepttermsyn ;;
    hidden: no
  }

  dimension: where_are_you_with_mm_quote_form__c {
    description: "" 
    type: string
    sql: ${TABLE}.where_are_you_with_mm_quote_form__c ;;
    hidden: no
  }

  dimension: number_of_end_users_quote_form__c {
    description: "" 
    type: number
    sql: ${TABLE}.number_of_end_users_quote_form__c ;;
    hidden: no
  }

  dimension: context_traits_portal_customer_id {
    description: "" 
    type: string
    sql: ${TABLE}.context_traits_portal_customer_id ;;
    hidden: no
  }

  dimension: utm_medium__c {
    description: "" 
    type: string
    sql: ${TABLE}.utm_medium__c ;;
    hidden: no
  }

  dimension: context_campaign_content {
    description: "" 
    type: string
    sql: ${TABLE}.context_campaign_content ;;
    hidden: no
  }

  dimension: utm_campaign__c {
    description: "" 
    type: string
    sql: ${TABLE}.utm_campaign__c ;;
    hidden: no
  }

  dimension: context_campaign_source {
    description: "" 
    type: string
    sql: ${TABLE}.context_campaign_source ;;
    hidden: no
  }

  dimension: context_campaign_name {
    description: "" 
    type: string
    sql: ${TABLE}.context_campaign_name ;;
    hidden: no
  }

  dimension: context_campaign_adgroup {
    description: "" 
    type: string
    sql: ${TABLE}.context_campaign_adgroup ;;
    hidden: no
  }

  dimension: obility_id__c {
    description: "" 
    type: string
    sql: ${TABLE}.obility_id__c ;;
    hidden: no
  }

  dimension: context_campaign_term {
    description: "" 
    type: string
    sql: ${TABLE}.context_campaign_term ;;
    hidden: no
  }

  dimension: context_campaign_medium {
    description: "" 
    type: string
    sql: ${TABLE}.context_campaign_medium ;;
    hidden: no
  }

  dimension: utm_adgroup__c {
    description: "" 
    type: string
    sql: ${TABLE}.utm_adgroup__c ;;
    hidden: no
  }

  dimension: utm_source__c {
    description: "" 
    type: string
    sql: ${TABLE}.utm_source__c ;;
    hidden: no
  }

  dimension: utm_term__c {
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
    description: "" 
    type: string
    sql: ${TABLE}.dscorgpkg__twitter_url__c ;;
    hidden: no
  }

  dimension: selectsession {
    description: "" 
    type: string
    sql: ${TABLE}.selectsession ;;
    hidden: no
  }

  
  # DIMENSION GROUPS/DATES
  dimension_group: clearbitenrichedat {
	description: "" 
	type: time
	timeframes: [time, week, date, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.clearbitenrichedat ;;
    hidden: no
  }

  dimension_group: uuid_ts {
	description: "" 
	type: time
	timeframes: [time, week, date, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.uuid_ts ;;
    hidden: no
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
    hidden: no
  }

  dimension_group: sent_at {
	description: "" 
	type: time
	timeframes: [time, week, date, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.sent_at ;;
    hidden: no
  }

  dimension_group: received_at {
	description: "" 
	type: time
	timeframes: [time, week, date, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.received_at ;;
    hidden: no
  }

  
  # MEASURES
  measure: count {
    description: "Count of rows/occurrences."
    type: count
  }

  measure: anonymous_count {
    label: " Anonymous Count"
    description: "The distinct count of Marketo Forms Anonymouss within each grouping."
    type: count_distinct
    sql: ${anonymous_id} ;;
  }

  measure: context_screen_density_max {
    description: "The max Context Screen Densitys within each grouping."
    type: max
    group_label: "Context Screen Density Measures"
    sql: ${context_screen_density} ;;
  }

  measure: context_screen_density_min {
    description: "The min Context Screen Densitys within each grouping."
    type: min
    group_label: "Context Screen Density Measures"
    sql: ${context_screen_density} ;;
  }

  measure: context_screen_density_avg {
    description: "The average Context Screen Densitys within each grouping."
    type: average
    group_label: "Context Screen Density Measures"
    sql: ${context_screen_density} ;;
  }

  measure: context_screen_density_median {
    description: "The median  Context Screen Densitys within each grouping."
    type: median
    group_label: "Context Screen Density Measures"
    sql: ${context_screen_density} ;;
  }

  measure: id_count {
    label: " Id Count"
    description: "The distinct count of Marketo Forms Id within each grouping."
    type: count_distinct
    sql: ${id} ;;
  }

  measure: user_count {
    label: " User Count"
    description: "The distinct count of Marketo Forms Users within each grouping."
    type: count_distinct
    sql: ${user_id} ;;
  }

  measure: number_of_end_users_quote_form__c_sum {
    description: "The sum of Number Of End Users Quote Form  Cs within each grouping."
    type: sum
    group_label: "Number Of End Users Quote Form  C Measures"
    sql: ${number_of_end_users_quote_form__c} ;;
  }

  measure: number_of_end_users_quote_form__c_max {
    description: "The max Number Of End Users Quote Form  Cs within each grouping."
    type: max
    group_label: "Number Of End Users Quote Form  C Measures"
    sql: ${number_of_end_users_quote_form__c} ;;
  }

  measure: number_of_end_users_quote_form__c_min {
    description: "The min Number Of End Users Quote Form  Cs within each grouping."
    type: min
    group_label: "Number Of End Users Quote Form  C Measures"
    sql: ${number_of_end_users_quote_form__c} ;;
  }

  measure: number_of_end_users_quote_form__c_avg {
    description: "The average Number Of End Users Quote Form  Cs within each grouping."
    type: average
    group_label: "Number Of End Users Quote Form  C Measures"
    sql: ${number_of_end_users_quote_form__c} ;;
  }

  measure: number_of_end_users_quote_form__c_median {
    description: "The median  Number Of End Users Quote Form  Cs within each grouping."
    type: median
    group_label: "Number Of End Users Quote Form  C Measures"
    sql: ${number_of_end_users_quote_form__c} ;;
  }

  measure: context_traits_portal_customer_count {
    label: " Context Traits Portal Customer Count"
    description: "The distinct count of Marketo Forms Context Traits Portal Customers within each grouping."
    type: count_distinct
    sql: ${context_traits_portal_customer_id} ;;
  }

  measure: obility__c_count {
    label: " Obility  C Count"
    description: "The distinct count of Marketo Forms Obilitys  C within each grouping."
    type: count_distinct
    sql: ${obility_id__c} ;;
  }


}