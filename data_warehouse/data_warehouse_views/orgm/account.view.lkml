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
      ownerid,
      csm_name,
      parent_account_name,
      count,
      csm_enriched_region,
      customer_segmentation_tier
    ]
  }


  #
  # Dimensions
  #

  dimension: account_id_18_digit {
    sql: ${TABLE}.account_id_18_digit__c ;;
    group_label: "Ditch"
  }

  dimension: account_number {
    label: "Account #"
    sql: ${TABLE}.account_number__c ;;
    type: string
  }

  dimension: account_end_date {
    label: "Account End Date"
    sql: ${TABLE}.account_end_date__c ;;
    type: date
    group_label: "Ditch"
  }

  dimension: account_start_date {
    label: "Account Start Date"
    sql: ${TABLE}.account_start_date__c ;;
    type: date
    group_label: "Ditch"
  }

  dimension: account_source {
    sql: ${TABLE}.accountsource ;;
    type: string
  }

  dimension: annual_revenue {
    sql: ${TABLE}.annualrevenue ;;
    type: number
  }

  dimension: api_id {
    group_label: "System"
    label: "API ID"
    sql: ${TABLE}.api_id__c ;;
    type: string
  }

  dimension: assigned_once_with_workflow {
    group_label: "System"
    label: "Assigned Once with WF"
    sql: ${TABLE}.assigned_once_with_workflow__c ;;
    type: yesno
  }

  dimension: assigned_owner {
    group_label: "Owners"
    sql: ${TABLE}.assigned_owner__c ;;
    type: string
  }

  dimension: assigned_owner_id {
    group_label: "Owners"
    sql: ${TABLE}.assigned_owner_id__c ;;
    type: string
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

  dimension: cleaned_up_website {
    group_label: "System"
    label: "Cleaned up Website"
    sql: ${TABLE}.cleaned_up_website__c ;;
    type: string
  }

  dimension: commercial_rep {
    group_label: "Owners"
    sql: ${TABLE}.commercial_rep__c ;;
    type: string
  }

  dimension: company_type {
    sql: ${TABLE}.company_type__c ;;
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

  dimension: csm {
    group_label: "Owners"
    label: "CSM Name"
    sql: ${TABLE}.csm__c ;;
    type: string
  }

  dimension: csm_auto_assigned {
    group_label: "CS"
    label: "CSM Auto-assigned"
    sql: ${TABLE}.csm_auto_assigned__c ;;
    type: string
  }

  dimension: csm_id {
    group_label: "Owners"
    label: "CSM ID"
    sql: ${TABLE}.csm_id__c ;;
    type: string
  }

  dimension: csm_override {
    group_label: "CS"
    label: "CSM Override"
    sql: ${TABLE}.csm_override__c ;;
    type: string
  }

  dimension: csm_territory {
    group_label: "CS"
    label: "CS Territory"
    sql: ${TABLE}.csm_territory__c ;;
    type: string
  }

  dimension: customer_churned {
    group_label: "CS"
    sql: ${TABLE}.customer_churned__c ;;
    type: yesno
  }

  dimension: customer_segmentation_tier {
    group_label: "CS"
    sql: ${TABLE}.customer_segmentation_tier__c ;;
    type: string
  }

  dimension_group: date_of_issue {
    convert_tz: no
    datatype: date
    sql: ${TABLE}.date_of_issue__c ;;
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

  dimension: days_past_renewal {
    group_label: "CS"
    sql: ${TABLE}.days_past_renewal__c ;;
    type: number
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

  dimension_group: deploy_on_bitnami {
    convert_tz: no
    datatype: date
    sql: ${TABLE}.deployonbitnamidate__c ;;
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

  dimension: description {
    label: "Account Description"
    sql: ${TABLE}.description ;;
    type: string
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

  dimension: field_rep {
    group_label: "Owners"
    sql: ${TABLE}.field_rep__c ;;
    type: string
  }

  dimension: first_channel {
    sql: ${TABLE}.first_channel__c ;;
    type: string
  }

  dimension: first_channel_detail {
    sql: ${TABLE}.first_channel_detail__c ;;
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

  dimension: former_owner {
    group_label: "Owners"
    type: string
    sql: ${TABLE}.former_owner__c ;;
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

  dimension: is_deleted {
    sql: ${TABLE}.isdeleted ;;
    type: yesno
  }

  dimension_group: last_time_assignm_process_workflow_ran {
    # description: "TODO"
    sql: ${TABLE}.last_time_assignm_process_workflow_ran__c ;;
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

  dimension: legal_contact {
    group_label: "Legal"
    sql: ${TABLE}.legal_contact__c ;;
    type: string
  }

  dimension: legal_right_for_case_studies {
    group_label: "Legal"
    sql: ${TABLE}.legal_right_for_case_studies__c ;;
    type: string
  }

  dimension: legal_right_to_use_name_logo {
    group_label: "Legal"
    sql: ${TABLE}.legal_right_to_use_name_logo__c ;;
    type: string
  }

  dimension: legally_agreed_to_joint_pr {
    group_label: "Legal"
    label: "Legally Agreed To Joint PR"
    sql: ${TABLE}.legally_agreed_to_joint_pr__c ;;
    type: string
  }

  dimension: legally_agreed_to_pr {
    group_label: "Legal"
    label: "Legally Agreed To PR"
    sql: ${TABLE}.legally_agreed_to_pr__c ;;
    type: string
  }

  dimension: logo_sales_logos_dropbox {
    # description: "TODO"
    sql: ${TABLE}.logo_sales_logos_dropbox__c ;;
    type: string
  }

  dimension: logo_used_on_our_website {
    sql: ${TABLE}.logo_used_on_our_website__c ;;
    type: string
  }

  dimension: masterrecordid {
    label: "Master Record ID"
    sql: ${TABLE}.masterrecordid ;;
    type: string
  }

  dimension: mattermost_rep {
    group_label: "Owners"
    label: "Mattermost Rep"
    sql: ${TABLE}.mattermost_rep__c ;;
    type: string
  }

  dimension_group: max_closed_won {
    convert_tz: no
    datatype: date
    label: "Closed / Won"
    sql: ${TABLE}.max_closed_won_date__c ;;
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

  dimension_group: mql {
    label: "MQL"
    group_label: "Funnel"
    sql: ${TABLE}.mql_date__c ;;
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
    group_label: "Account"
    label: "Account Name"
    link: {
      label: "Salesforce Account"
      # BP: Leverage constants to enable more reused
      url: "@{salesforce_link}{{sfid}}"
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

  # TODO: These netsuite fields do not exist in the db
  # dimension: netsuite_conn_account_balance {
  #   group_item_label: "Account Balance"
  #   group_label: "Netsuite"
  #   label: "Netsuite Account Balance"
  #   sql: ${TABLE}.netsuite_conn__account_balance__c ;;
  #   type: number
  # }

  # dimension: netsuite_conn_account_overdue_balance {
  #   group_item_label: "Account Overdue Balance"
  #   group_label: "Netsuite"
  #   label: "Netsuite Account Overdue Balance"
  #   sql: ${TABLE}.netsuite_conn__account_overdue_balance__c ;;
  #   type: number
  # }

  # dimension: netsuite_conn_channel_tier {
  #   group_item_label: "Channel Tier"
  #   group_label: "Netsuite"
  #   label: "Netsuite Channel Tier"
  #   sql: ${TABLE}.netsuite_conn__channel_tier__c ;;
  #   type: string
  # }

  # dimension: netsuite_conn_credit_limit {
  #   group_item_label: "Credit Limit"
  #   group_label: "Netsuite"
  #   label: "Netsuite Credit Limit"
  #   sql: ${TABLE}.netsuite_conn__credit_limit__c ;;
  #   type: number
  # }

  # dimension: netsuite_conn_days_overdue {
  #   group_item_label: "Days Overdue"
  #   group_label: "Netsuite"
  #   label: "Netsuite Days Overdue"
  #   sql: ${TABLE}.netsuite_conn__days_overdue__c ;;
  #   type: number
  # }

  # dimension: netsuite_conn_unbilled_orders {
  #   group_item_label: "Unbilled Orders"
  #   group_label: "Netsuite"
  #   label: "Netsuite Unbilled Orders"
  #   sql: ${TABLE}.netsuite_conn__unbilled_orders__c ;;
  #   type: number
  # }

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

  dimension: number_of_open_opportunities {
    label: "# of Open Opportunities"
    sql: ${TABLE}.number_of_open_opportunities__c ;;
    type: number
  }

  dimension: number_of_opportunities {
    label: "# of Opportunities"
    sql: ${TABLE}.number_of_opportunities__c ;;
    type: number
  }

  dimension: number_of_won_opportunities {
    label: "# of Won Opportunities"
    sql: ${TABLE}.number_of_won_opportunities__c ;;
    type: number
  }

  dimension: number_of_employees {
    label: "# of Employees"
    sql: ${TABLE}.numberofemployees ;;
    type: number
  }

  dimension: obsolete_region {
    sql: ${TABLE}.obsoleteregion__c ;;
    type: string
    group_label: "Ditch"
  }

  dimension: obsolete_territory {
    sql: ${TABLE}.obsoleteterritory__c ;;
    type: string
    group_label: "Ditch"
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

  dimension: our_champion {
    sql: ${TABLE}.our_champion__c ;;
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
    label: "CSM Name (based on id)"
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
    label: "Master Account"
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

  # TODO: These fields do not exist in the database
  # dimension_group: pr {
  #   convert_tz: no
  #   datatype: date
  #   label: "PR"
  #   sql: ${TABLE}.pr_date__c ;;
  #   timeframes: [
  #     raw,
  #     date,
  #     week,
  #     month,
  #     quarter,
  #     year
  #   ]
  #   type: time
  # }


  # dimension: pr_link {
  #   label: "PR Link"
  #   sql: ${TABLE}.pr_link__c ;;
  #   type: string
  # }

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

  dimension: csm_enriched_region {
    label: "CSM Enriched Region"
    sql: CASE
              WHEN ${csm_id} = '0051R00000GndedQAB' THEN 'Federal'
              WHEN ${sfid} = '00136000015uBxoAAE' THEN 'EMEA'
              WHEN ${region} IN ('Rest of EMEA','DACH','France','UKI') THEN 'EMEA'
              WHEN ${region} IN ('ANZ','JPS') THEN 'APAC'
              ELSE ${region} END ;;
    type: string
  }

  dimension: renewal_rep {
    group_label: "Owners"
    label: "Renewal Rep"
    sql: ${TABLE}.renewal_rep__c ;;
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

  dimension: sector {
    sql: ${TABLE}.sector__c ;;
    type: string
  }

  dimension: sfid {
    label: "Account ID"
    primary_key: yes
    sql: ${TABLE}.sfid ;;
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

  # TODO: This field is always the same as
  # dimension: sic_description {
  #   sql: ${TABLE}.sic_description__c ;;
  #   type: string
  # }

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

  dimension: solution_architect_1 {
    sql: ${TABLE}.solution_architect_1__c ;;
    type: string
  }

  dimension: solution_architect_2 {
    sql: ${TABLE}.solution_architect_2__c ;;
    type: string
  }

  dimension: territory {
    group_label: "Region and Territory"
    label: "Territory Name"
    sql: ${TABLE}.territory__c ;;
    type: string
  }

  dimension: territoryid {
    group_label: "Region and Territory"
    label: "Territory ID"
    sql: ${TABLE}.territoryid__c ;;
    type: string
  }

  # TODO: These fields don't seem to be in the database
  # dimension: testimonial_1_from {
  #   group_label: "Marketing"
  #   sql: ${TABLE}.testimonial1_from__c ;;
  #   type: string
  # }

  # dimension: testimonial_1 {
  #   group_label: "Marketing"
  #   sql: ${TABLE}.testimonial_1__c ;;
  #   type: string
  # }

  # dimension: testimonial_2 {
  #   group_label: "Marketing"
  #   sql: ${TABLE}.testimonial_2__c ;;
  #   type: string
  # }

  # dimension: testimonial_2_from {
  #   group_label: "Marketing"
  #   sql: ${TABLE}.testimonial_2_from__c ;;
  #   type: string
  # }

  dimension: ticker_symbol {
    sql: ${TABLE}.tickersymbol ;;
    type: string
  }

  dimension: total_sales {
    sql: ${TABLE}.total_sales__c ;;
    type: number
  }

  dimension: total_seats {
    sql: ${TABLE}.total_seats__c ;;
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

  dimension: unique_accounts {
    sql: ${TABLE}.unique_accounts__c ;;
    type: number
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

  dimension_group: video_case_study {
    convert_tz: no
    datatype: date
    sql: ${TABLE}.video_case_study_date__c ;;
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

  dimension: video_case_study_link {
    sql: ${TABLE}.video_case_study_link__c ;;
    type: string
  }

  dimension: website {
    sql: ${TABLE}.website ;;
    type: string
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

  dimension: zendesk_create_in_zendesk {
    group_label: "Zendesk"
    sql: ${TABLE}.zendesk__create_in_zendesk__c ;;
    type: yesno
  }

  dimension: zendesk_created_updated_flag {
    group_label: "Zendesk"
    sql: ${TABLE}.zendesk__createdupdatedflag__c ;;
    type: yesno
  }

  dimension: zendesk_domain_mapping {
    group_label: "Zendesk"
    sql: ${TABLE}.zendesk__domain_mapping__c ;;
    type: string
  }

  dimension_group: zendesk_last_sync_date {
    group_label: "Zendesk"
    sql: ${TABLE}.zendesk__last_sync_date__c ;;
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

  dimension: zendesk_last_sync_status {
    group_item_label: "Last Sync Status"
    group_label: "Zendesk"
    sql: ${TABLE}.zendesk__last_sync_status__c ;;
    type: string
  }

  dimension: zendesk_notes {
    group_item_label: "Notes"
    group_label: "Zendesk"
    sql: ${TABLE}.zendesk__notes__c ;;
    type: string
  }

  dimension: zendesk_result {
    group_item_label: "Result"
    group_label: "Zendesk"
    sql: ${TABLE}.zendesk__result__c ;;
    type: string
  }

  dimension: zendesk_tags {
    group_item_label: "Tags"
    group_label: "Zendesk"
    sql: ${TABLE}.zendesk__tags__c ;;
    type: string
  }

  dimension: zendesk_old_tags {
    group_item_label: "Old Tags"
    group_label: "Zendesk"
    sql: ${TABLE}.zendesk__zendesk_oldtags__c ;;
    type: string
  }

  dimension: zendesk_organization {
    group_item_label: "Organization"
    group_label: "Zendesk"
    sql: ${TABLE}.zendesk__zendesk_organization__c ;;
    type: string
  }

  dimension: zendesk_organization_id {
    group_item_label: "Organization ID"
    group_label: "Zendesk"
    sql: ${TABLE}.zendesk__zendesk_organization_id__c ;;
    type: string
  }

  dimension: zendesk_out_of_sync {
    group_item_label: "Out of Sync"
    group_label: "Zendesk"
    sql: ${TABLE}.zendesk__zendesk_outofsync__c ;;
    type: yesno
  }


  #
  # Measures
  #

  measure: count {
    drill_fields: [sfid, name]
    label: "# of Accounts"
    sql: ${sfid} ;;
    type: count_distinct
  }


  #
  # Hidden Fields (Used for derived values or joins)
  #

  dimension: account_number_int {
    hidden:  yes
    sql: ${TABLE}.account_number_int__c ;;
    type: number
  }

}
