# Account data from salesforce.
#
# Groups Labels
# - Amounts
# - Billing Info
# - CS
# - Funnel
# - Imported
# - Legal
# - Marketing
# - Netsuite
# - Owners
# - Region and Terriory
# - Shipping
# - System
# - Zendesk


include: "_hc_fields.view"
include: "_systemmodstamp.view"

view: account {
  sql_table_name: orgm.account ;;
  extends: [ _hc_fields, _systemmodstamp ]
  drill_fields: [account_drill_fields*]

  #
  # Sets
  #

  set: account_drill_fields {
    fields: [sfid]
  }

  set: account_fields_core {
    fields: [sfid, name]
  }

  set: account_core {
    fields: [
      name,
      sfid,
      owner_name,
      csm_name,
      master_account_name,
      count,
      customer_segmentation_tier,
      industry_category,
      arr_current,
      website,
      website_count,
      territory_sales_segment,
      company_type_major
    ]
  }


  #
  # Dimensions
  #

  dimension: account_number {
    label: "Account #"
    sql: ${TABLE}.account_number__c ;;
    type: string
  }

  dimension: account_source {
    sql: ${TABLE}.accountsource ;;
    type: string
  }

  dimension: licensed_account {
    label: "Currently Licensed?"
    sql: ${arr_current} > 0 ;;
    type: yesno
  }

  dimension: hold_public {
    hidden: yes
    label: "Hold Public?"
    sql: ${name} = 'Hold Public' ;;
    type: yesno
  }

  dimension: licensed_account_not_hold_public {
    sql: ${licensed_account} AND NOT ${hold_public} ;;
    type: yesno
  }

  dimension: annual_revenue {
    sql: ${TABLE}.annualrevenue ;;
    type: number
  }

  dimension: arr_current {
    label: "Current ARR"
    sql: ${TABLE}.arr_current__c ;;
    value_format_name: "usd_0"
    type: number
  }



  dimension: billing_city {
    group_label: "Billing Info"
    sql: ${TABLE}.billingcity ;;
    type: string
  }

  dimension: billing_country {
    group_label: "Billing Info"
    sql: ${TABLE}.billingcountry ;;
    type: string
  }

  dimension: billing_country_code {
    group_label: "Billing Info"
    sql: ${TABLE}.billingcountrycode ;;
    type: string
  }

  dimension: billing_geocode_accuracy {
    group_label: "Billing Info"
    sql: ${TABLE}.billinggeocodeaccuracy ;;
    type: string
  }

  dimension: billing_latitude {
    group_label: "Billing Info"
    sql: ${TABLE}.billinglatitude ;;
    type: number
  }

  dimension: billing_longitude {
    group_label: "Billing Info"
    sql: ${TABLE}.billinglongitude ;;
    type: number
  }

  dimension: billing_postal_code {
    group_label: "Billing Info"
    sql: ${TABLE}.billingpostalcode ;;
    type: string
  }

  dimension: billing_state {
    group_label: "Billing Info"
    sql: ${TABLE}.Billingstate ;;
    type: string
  }

  dimension: billing_state_code {
    group_label: "Billing Info"
    sql: ${TABLE}.billingstatecode ;;
    type: string
  }

  dimension: billing_street {
    group_label: "Billing Info"
    sql: ${TABLE}.billingstreet ;;
    type: string
  }

  # TODO: This field setup correctly?
  dimension: case_study_date {
    group_label: "Marketing"
    label: "Case Study"
    sql: ${TABLE}.case_study_date__c ;;
  }

  dimension: case_study_link {
    group_label: "Marketing"
    sql: ${TABLE}.case_study_link__c ;;
    type: string
  }


  dimension: company_type {
    sql: ${TABLE}.company_type__c ;;
    type: string
  }

  dimension: company_type_major {
    sql: case when ${TABLE}.company_type__c in ('Academic','Non-Profit') then 'Education/Non-Profit' else ${TABLE}.company_type__c end ;;
    type: string
  }

  dimension: cosize {
    label: "Company Size"
    sql: ${TABLE}.cosize__c ;;
    type: string
  }

  dimension: createdbyid {
    group_label: "System"
    label: "Created by ID"
    sql: ${TABLE}.createdbyid ;;
    type: string
  }

  dimension: created_date {
    sql: ${TABLE}.createddate ;;
    type: date
  }

  dimension: csm_lookup {
    group_label: "CS"
    label: "CSM Owner"
    sql: ${TABLE}.csm_lookup__c ;;
    type: string
  }

  dimension: customer_engineer {
    group_label: "Owners"
    label: "Account Level Customer Engineerr"
    sql: ${TABLE}.customer_engineer__c ;;
    type: string
  }

  dimension: customer_segmentation_tier {
    group_label: "CS"
    sql: ${TABLE}.customer_segmentation_tier__c ;;
    type: string
  }


  dimension_group: demo_req {
    sql: ${TABLE}.demo_req_date__c ;;
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    type: time
  }


  dimension: description {
    label: "Account Description"
    sql: ${TABLE}.description ;;
    type: string
  }

  dimension: dwh_external_id__c {
    type: string
    sql: ${TABLE}.dwh_external_id__c ;;
    group_label: "System"
    label: "DWH External ID"
  }


  dimension_group: e_purchase {
    sql: ${TABLE}.e_purchase_date__c ;;
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    type: time
  }

  dimension: fax {
    sql: ${TABLE}.fax ;;
    type: string
  }


  dimension_group: first_created {
    convert_tz: no
    datatype: date
    sql: ${TABLE}.first_created_date__c ;;
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    type: time
  }

  dimension: first_lead {
    sql: ${TABLE}.first_lead__c ;;
    type: string
  }

  dimension: first_lead_round_robin_id {
    sql: ${TABLE}.first_lead_round_robin_id__c ;;
    type: number
    value_format_name: id
  }

  dimension: first_offer {
    sql: ${TABLE}.first_offer__c ;;
    type: string
  }

  dimension: first_offer_detail {
    sql: ${TABLE}.first_offer_detail__c ;;
    type: string
  }

  dimension_group: followup {
    sql: ${TABLE}.followup_date__c ;;
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    type: time
  }



  dimension: g2k_rank {
    sql: ${TABLE}.g2k_rank__c ;;
    type: number
  }

  dimension: g2k_account {
    sql: ${g2k_rank} IS NOT NULL ;;
    type: yesno
    label: "Is G2K Account?"
  }

  dimension: geo {
    description: "Global regions (eg. AMER, APAC, EMEA, ROW)"
    sql: ${TABLE}.geo__c ;;
    type: string
  }

  dimension_group: get_started {
    convert_tz: no
    datatype: date
    sql: ${TABLE}.getstarteddate__c ;;
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    type: time
  }

  dimension: government {
    sql: ${TABLE}.government__c ;;
    type: yesno
  }

  dimension: health_score {
    sql: ${TABLE}.health_score__c ;;
    type: number
  }

  dimension: imported_case_study_note {
    group_label: "Imported"
    label: "Case Study Note"
    sql: ${TABLE}.imported_case_study_note__c ;;
    type: string
  }

  dimension: imported_industry {
    group_label: "Imported"
    label: "Industry"
    sql: ${TABLE}.imported_industry__c ;;
    type: string
  }

  dimension: inbound_outbound {
    sql: ${TABLE}.inbound_outbound__c ;;
    type: string
  }

  dimension: industry {
    label: "Industry"
    sql: ${TABLE}.industry ;;
    type: string
  }

  dimension: industry_category {
    label: "Industry Category"
    sql: ${account_industry_mapping.industry_category} ;;
    type: string
  }


  dimension: isdeleted {
    sql: ${TABLE}.isdeleted ;;
    type: yesno
    group_label: "System"
  }



  dimension_group: last_activity {
    convert_tz: no
    datatype: date
    sql: ${TABLE}.lastactivitydate ;;
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    type: time
  }

  dimension: lastmodifiedbyid {
    label: "Last Modified By ID"
    sql: ${TABLE}.lastmodifiedbyid ;;
    type: string
  }

  dimension_group: last_modified {
    sql: ${TABLE}.lastmodifieddate ;;
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    type: time
  }

  dimension_group: last_referenced {
    sql: ${TABLE}.lastreferenceddate ;;
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    type: time
    group_label: "System"
  }

  dimension_group: last_reviewed {
    convert_tz: no
    datatype: date
    sql: ${TABLE}.lastreviewed__c ;;
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    type: time
  }

  dimension_group: last_viewed {
    sql: ${TABLE}.lastvieweddate ;;
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    type: time
  }

  dimension: latest_telemetry_date {
    sql: ${TABLE}.latest_telemetry_date__c ;;
    type: date
    group_label: "Licensed vs. Usage"
  }

  dimension_group: lead_created {
    sql: ${TABLE}.lead_created_date__c ;;
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    type: time
  }

  dimension: masterrecordid {
    label: "Master Record ID"
    sql: ${TABLE}.masterrecordid ;;
    type: string
  }


  dimension_group: meeting_set {
    sql: ${TABLE}.meetingset_date__c ;;
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    type: time
  }


  dimension: name {
    description: "Name of account that opportunity is linked to Salesforce"
    label: "Account Name"
    link: {
      label: "Salesforce Account"
      # BP: Leverage constants to enable more reused
      url: "@{salesforce_link}{{sfid}}"
      icon_url: "https://mattermost.my.salesforce.com/favicon.ico"
    }
    sql: ${TABLE}.name ;;
    type: string
  }

  dimension: named_account {
    sql: ${TABLE}.named_account__c ;;
    type: yesno
    label: "Is Named Account?"
  }

  dimension: named_account_tier {
    sql: ${TABLE}.named_account_tier__c ;;
    type: string
  }

  dimension_group: nda_expiration {
    convert_tz: no
    datatype: date
    label: "NDA Expiration"
    sql: ${TABLE}.nda_expiration_date__c ;;
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    type: time
  }


  dimension: netsuite_conn_celigo_update {
    group_item_label: "Celigo Update"
    group_label: "Netsuite"
    label: "Netsuite Celigo Update"
    sql: ${TABLE}.netsuite_conn__celigo_update__c ;;
    type: yesno
  }

  dimension: netsuite_conn_credit_hold {
    group_item_label: "Credit Hold"
    group_label: "Netsuite"
    label: "Netsuite Credit Hold"
    sql: ${TABLE}.netsuite_conn__credit_hold__c ;;
    type: string
  }

  dimension: netsuite_conn_netsuite_id {
    group_item_label: "Netsuite ID"
    group_label: "Netsuite"
    label: "Netsuite ID"
    sql: ${TABLE}.netsuite_conn__netsuite_id__c ;;
    type: string
  }

  dimension: netsuite_conn_netsuite_sync_err {
    group_item_label: "Sync Error"
    group_label: "Netsuite"
    label: "Netsuite Sync Error"
    sql: ${TABLE}.netsuite_conn__netsuite_sync_err__c ;;
    type: string
  }

  dimension: netsuite_conn_push_to_netsuite {
    group_item_label: "Push To Netsuite"
    group_label: "Netsuite"
    label: "Push To Netsuite"
    sql: ${TABLE}.netsuite_conn__push_to_netsuite__c ;;
    type: yesno
  }

  dimension: netsuite_conn_pushed_from_opportunity {
    group_item_label: "Push From Opportunity"
    group_label: "Netsuite"
    label: "Netsuite Push From Opportunity"
    sql: ${TABLE}.netsuite_conn__pushed_from_opportunity__c ;;
    type: yesno
  }

  dimension: netsuite_conn_sync_in_progress {
    group_item_label: "Sync In Progress"
    group_label: "Netsuite"
    label: "Netsuite Sync In Progress"
    sql: ${TABLE}.netsuite_conn__sync_in_progress__c ;;
    type: yesno
  }

  dimension: number_of_employees {
    label: "# of Employees"
    sql: ${TABLE}.numberofemployees ;;
    type: number
  }

  dimension: number_of_employees_tier {
    label: "# of Employees Tier"
    sql: ${number_of_employees} ;;
    type: tier
    tiers: [251,501,1001,5001]
    style: integer
  }

  dimension: offer {
    sql: ${TABLE}.offer__c ;;
    type: string
  }

  dimension: offer_detail {
    sql: ${TABLE}.offer_detail__c ;;
    type: string
  }

  dimension: other_customer_marketing_comment {
    sql: ${TABLE}.other_customer_marketing_comment__c ;;
    type: string
  }



  dimension: ownerid {
    group_label: "Owners"
    label: "Owner ID"
    sql: ${TABLE}.ownerid ;;
    type: string
  }

  dimension: owner_name {
    group_label: "Owners"
    sql: ${account_owner.name};;
    type: string
  }

  dimension: csm_name {
    group_label: "Owners"
    label: "CSM Name"
    sql: ${account_csm.name};;
    type: string
  }

  dimension: ownership {
    group_label: "Owners"
    sql: ${TABLE}.ownership ;;
    type: string
  }

  dimension: parentid {
    group_label: "Parent"
    label: "Parent Account ID"
    sql: ${TABLE}.parentid ;;
    type: string
  }

  dimension: parent_account_name {
    group_label: "Parent"
    label: "Parent Account Name"
    sql: ${parent_account.name} ;;
    type: string
  }

  dimension: parent_account_arr {
    group_label: "Parent"
    label: "Parent Account ARR"
    sql: ${parent_account.arr_current} ;;
    type: number
  }

  dimension: master_account_name {
    label: "Master Account Name"
    sql: coalesce(${parent_account.name}, ${name}) ;;
    type: string
  }

  dimension: phone {
    sql: ${TABLE}.phone ;;
    type: string
  }

  dimension: photo_url {
    sql: ${TABLE}.photourl ;;
    type: string
  }



  dimension_group: pre_release_sign_up {
    # description: "TODO"
    sql: ${TABLE}.pre_release_sign_up_date__c ;;
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    type: time
  }

  dimension_group: put_into_nurture {
    # description: "TODO"
    sql: ${TABLE}.putintonurture_date__c ;;
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    type: time
  }

  dimension: rating {
    sql: ${TABLE}.rating ;;
    type: string
  }

  dimension: region {
    sql: ${TABLE}.region__c ;;
    type: string
  }


  dimension_group: request_a_quote {
    sql: ${TABLE}.request_a_quote_date__c ;;
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    type: time
  }

  dimension_group: responded {
    sql: ${TABLE}.responded_date__c ;;
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    type: time
  }

  dimension: seats_licensed {
    sql: ${TABLE}.seats_licensed__c ;;
    type: number
    value_format_name: decimal_0
    group_label: "Licensed vs. Usage"
  }

  dimension: seats_active_latest {
    sql: ${TABLE}.seats_active_latest__c ;;
    type: number
    value_format_name: decimal_0
    group_label: "Licensed vs. Usage"
  }

  dimension: seats_active_mau {
    sql: ${TABLE}.seats_active_mau__c ;;
    type: number
    value_format_name: decimal_0
    group_label: "Licensed vs. Usage"
  }

  dimension: seats_active_max {
    sql: ${TABLE}.seats_active_max__c ;;
    type: number
    value_format_name: decimal_0
    group_label: "Licensed vs. Usage"
  }

  dimension: seats_active_override {
    sql: ${TABLE}.seats_active_override__c ;;
    type: yesno
    group_label: "Licensed vs. Usage"
  }

  dimension: seats_active_wau {
    sql: ${TABLE}.seats_active_wau__c ;;
    type: number
    value_format_name: decimal_0
    group_label: "Licensed vs. Usage"
  }

  dimension: sector {
    sql: ${TABLE}.sector__c ;;
    type: string
  }

  dimension: sfid {
    label: "Account ID"
    primary_key: yes
    sql: ${TABLE}.sfid ;;
    link: {
      label: "Salesforce Account"
      url: "@{salesforce_link}{{value}}"
      icon_url: "https://mattermost.my.salesforce.com/favicon.ico"
    }
    type: string
  }

  dimension: shipping_city {
    group_label: "Shipping"
    sql: ${TABLE}.shippingcity ;;
    type: string
  }

  dimension: shipping_country {
    group_label: "Shipping"
    sql: ${TABLE}.shippingcountry ;;
    type: string
  }

  dimension: shipping_country_code {
    group_label: "Shipping"
    sql: ${TABLE}.shippingcountrycode ;;
    type: string
  }

  dimension: shipping_geocode_accuracy {
    group_label: "Shipping"
    sql: ${TABLE}.shippinggeocodeaccuracy ;;
    type: string
  }

  dimension: shipping_latitude {
    group_label: "Shipping"
    sql: ${TABLE}.shippinglatitude ;;
    type: number
  }

  dimension: shipping_longitude {
    group_label: "Shipping"
    sql: ${TABLE}.shippinglongitude ;;
    type: number
  }

  dimension: shipping_postal_code {
    group_label: "Shipping"
    sql: ${TABLE}.shippingpostalcode ;;
    type: string
  }

  dimension: shipping_state {
    group_label: "Shipping"
    sql: ${TABLE}.shippingstate ;;
    type: string
  }

  dimension: shipping_state_code {
    group_label: "Shipping"
    sql: ${TABLE}.shippingstatecode ;;
    type: string
  }

  dimension: shipping_street {
    group_label: "Shipping"
    sql: ${TABLE}.shippingstreet ;;
    type: string
  }

  dimension: sic {
    description: "The Standard Industrial Classification"
    label: "SIC"
    sql: ${TABLE}.sic ;;
    type: string
  }

  dimension: sic_desc {
    description: "The description of the Standard Industrial Classification"
    label: "SIC Description"
    sql: ${TABLE}.sicdesc ;;
    type: string
  }

  dimension: signed_nda {
    label: "Signed NDA"
    sql: ${TABLE}.signed_nda__c ;;
    type: yesno
  }

  dimension: site {
    sql: ${TABLE}.site ;;
    type: string
  }


  dimension: territory_geo {
    type: string
    sql: ${TABLE}.territory_geo__c ;;
    group_label: "Territory"
    label: "Territory Geo"
  }

  dimension: territory_area {
    type: string
    sql: ${TABLE}.territory_area__c ;;
    group_label: "Territory"
    label: "Territory Area"
  }

  dimension: territory_region {
    type: string
    sql: ${TABLE}.territory_region__c ;;
    group_label: "Territory"
    label: "Territory Region"
  }

  dimension: territory_sales_segment {
    type: string
    sql: CASE WHEN  ${TABLE}.territory_segment__c  = 'AMER_APAC' THEN 'AMER/APAC' ELSE ${TABLE}.territory_segment__c END;;
    group_label: "Territory"
    label: "Territory Sales Segment"
  }

  dimension: territory_ent_rep {
    type: string
    sql: ${TABLE}.territory_ent_rep__c ;;
    group_label: "Territory"
    label: "Territory Ent Rep"
  }

  dimension: territory_comm_rep {
    type: string
    sql: ${TABLE}.territory_comm_rep__c ;;
    group_label: "Territory"
    label: "Territory Comm Rep"
  }

  dimension: territory_last_updated {
    type: string
    sql: ${TABLE}.territory_last_updated__c ;;
    group_label: "Territory"
    label: "Territory Last Updated"
  }



  dimension: ticker_symbol {
    sql: ${TABLE}.tickersymbol ;;
    type: string
  }

  dimension_group: trial_req {
    label: "Trial Request"
    sql: ${TABLE}.trial_req_date__c ;;
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    type: time
  }

  dimension: type {
    label: "Account Type"
    sql: ${TABLE}.type ;;
    type: string
  }

  dimension_group: unqualified {
    sql: ${TABLE}.unqualified_date__c ;;
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    type: time
  }

  dimension: website {
    sql: ${TABLE}.website ;;
    type: string
  }


  dimension: website_domain {
    type: string
    sql: ${TABLE}.cbit__clearbitdomain__c;;
    label: "Website Domain"
  }


  dimension_group: x1st_contact_us {
    sql: ${TABLE}.x1stcontactusdate__c ;;
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    type: time
  }


  #
  # Measures
  #

  measure: count {
    drill_fields: [sfid, name, owner_name, csm_name]
    label: "# of Accounts"
    sql: ${sfid} ;;
    type: count_distinct
  }

  measure: avg_health_score {
    label: "Avg Health Score"
    sql: ${health_score} ;;
    type: average
    value_format_name: decimal_0
  }


  measure: count_of_licensed_accounts{
    drill_fields: [sfid, name]
    label: "# of Licensed Accounts"
    sql: ${sfid} ;;
    type: count_distinct
    filters: {
      field: licensed_account
      value: "yes"
    }
  }

  measure: total_current_arr {
    drill_fields: [sfid, name, arr_current]
    label: "Total Current ARR"
    sql: ${arr_current} ;;
    type: sum_distinct
    value_format_name: usd_0
  }

  measure: website_count {
    hidden: yes
    type: count_distinct
    sql: regexp_replace(replace(replace(replace(${website},'http://',''),'www.',''),'https://',''),'/$','') ;;
    drill_fields: [name, owner_name, csm_name, account_daily_arr_deltas.new_day_arr]
  }

}
