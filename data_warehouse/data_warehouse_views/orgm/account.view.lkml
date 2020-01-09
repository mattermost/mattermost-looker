view: account {

  sql_table_name: orgm.account ;;
  drill_fields: [sfid]


  #
  # Sets
  #

  set: account_fields_core {
    fields: [account_id_18_digit, name]
  }


  #
  # Dimensions
  #

  dimension: account_id_18_digit {
    primary_key: yes
    type: string
    sql: ${TABLE}.account_id_18_digit__c ;;
    group_label: "Ditch"
  }

  dimension: _hc_err {
    type: string
    sql: ${TABLE}._hc_err ;;
    group_label: "System"
    label: "HC Error"
  }

  dimension: _hc_lastop {
    type: string
    sql: ${TABLE}._hc_lastop ;;
    group_label: "System"
    label: "HC Last Op"
  }

  dimension: account_arr {
    type: number
    sql: ${TABLE}.account_arr__c ;;
    group_label: "Amounts"
  }

  dimension: account_arr_summary {
    type: number
    sql: ${TABLE}.account_arr_summary__c ;;
    label: "ARR"
    group_label: "Amounts"
  }

  dimension: account_number {
    type: string
    sql: ${TABLE}.account_number__c ;;
    label: "Account #"
  }

  dimension: account_number_int {
    type: number
    sql: ${TABLE}.account_number_int__c ;;
    hidden:  yes
  }

  dimension: account_end_date {
    type: date
    sql: ${TABLE}.account_end_date__c ;;
    label: "Account End Date"
    group_label: "Ditch"
  }

  dimension: account_start_date {
    type: date
    sql: ${TABLE}.account_start_date__c ;;
    label: "Account Start Date"
    group_label: "Ditch"
  }

  dimension: accountsource {
    type: string
    sql: ${TABLE}.accountsource ;;
    label: "Account Source"
  }

  dimension: annualrevenue {
    type: number
    sql: ${TABLE}.annualrevenue ;;
    label: "Annual Revenue"
  }

  dimension: api_id {
    type: string
    sql: ${TABLE}.api_id__c ;;
    group_label: "System"
    label: "API ID"
  }

  dimension: assigned_once_with_workflow {
    type: yesno
    sql: ${TABLE}.assigned_once_with_workflow__c ;;
    group_label: "System"
    label: "Assigned Once with WF"
  }

  dimension: assigned_owner {
    type: string
    sql: ${TABLE}.assigned_owner__c ;;
    group_label: "Owners"
    label: "Assigned Owner"
  }

  dimension: assigned_owner_id {
    type: string
    sql: ${TABLE}.assigned_owner_id__c ;;
    group_label: "Owners"
    label: "Assigned Owner ID"  }

  dimension: billingcity {
    type: string
    sql: ${TABLE}.billingcity ;;
    group_label: "Billing Info"
  }

  dimension: billingcountry {
    type: string
    sql: ${TABLE}.billingcountry ;;
    group_label: "Billing Info"
  }

  dimension: billingcountrycode {
    type: string
    sql: ${TABLE}.billingcountrycode ;;
    group_label: "Billing Info"
  }

  dimension: billinggeocodeaccuracy {
    type: string
    sql: ${TABLE}.billinggeocodeaccuracy ;;
    group_label: "Billing Info"
  }

  dimension: billinglatitude {
    type: number
    sql: ${TABLE}.billinglatitude ;;
    group_label: "Billing Info"
  }

  dimension: billinglongitude {
    type: number
    sql: ${TABLE}.billinglongitude ;;
    group_label: "Billing Info"
  }

  dimension: billingpostalcode {
    type: string
    sql: ${TABLE}.billingpostalcode ;;
    group_label: "Billing Info"
  }

  dimension: Billingstate {
    type: string
    sql: ${TABLE}.Billingstate ;;
    group_label: "Billing Info"
  }

  dimension: billingstatecode {
    type: string
    sql: ${TABLE}.billingstatecode ;;
    group_label: "Billing Info"
  }

  dimension: billingstreet {
    type: string
    sql: ${TABLE}.billingstreet ;;
    group_label: "Billing Info"
  }

  dimension: case_study_date {
    sql: ${TABLE}.case_study_date__c ;;
    group_label: "Marketing"
    label: "Case Study"
  }

  dimension: case_study_link {
    type: string
    sql: ${TABLE}.case_study_link__c ;;
    group_label: "Marketing"
  }

  dimension: cleaned_up_website {
    type: string
    sql: ${TABLE}.cleaned_up_website__c ;;
    group_label: "System"
    label: "Cleaned up Website"
  }

  dimension: commercial_rep {
    type: string
    sql: ${TABLE}.commercial_rep__c ;;
    group_label: "Owners"
    label: "Commercial Rep"
  }

  dimension: company_type {
    type: string
    sql: ${TABLE}.company_type__c ;;
    label: "Company Type"
  }

  dimension: cosize {
    type: string
    sql: ${TABLE}.cosize__c ;;
    label: "Company Size"
  }

  dimension: createdbyid {
    type: string
    sql: ${TABLE}.createdbyid ;;
    group_label: "System"
    label: "Created By ID"
  }

  dimension: createddate {
    type: date
    sql: ${TABLE}.createddate ;;
    label: "Create Date"
  }

  dimension: csm {
    type: string
    sql: ${TABLE}.csm__c ;;
    group_label: "Owners"
    label: "CSM Name"
  }

  dimension: csm_auto_assigned {
    type: string
    sql: ${TABLE}.csm_auto_assigned__c ;;
    group_label: "CS"
    label: "CSM Auto-assigned"
  }

  dimension: csm_id {
    type: string
    sql: ${TABLE}.csm_id__c ;;
    group_label: "Owners"
    label: "CSM ID"
  }

  dimension: csm_override {
    type: string
    sql: ${TABLE}.csm_override__c ;;
    group_label: "CS"
    label: "CSM Override"
  }

  dimension: csm_territory {
    type: string
    sql: ${TABLE}.csm_territory__c ;;
    group_label: "CS"
    label: "CS Territory"}

  dimension: customer_churned {
    type: yesno
    sql: ${TABLE}.customer_churned__c ;;
    group_label: "CS"
  }

  dimension: customer_segmentation_tier {
    type: string
    sql: ${TABLE}.customer_segmentation_tier__c ;;
    group_label: "CS"
  }

  dimension_group: date_of_issue {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.date_of_issue__c ;;
  }

  dimension: days_past_renewal {
    type: number
    sql: ${TABLE}.days_past_renewal__c ;;
    group_label: "CS"
  }

  dimension_group: demo_req_date {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.demo_req_date__c ;;
  }

  dimension_group: deployonbitnamidate {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.deployonbitnamidate__c ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
    label: "Account Description"
  }

  dimension_group: e_purchase_date {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.e_purchase_date__c ;;
  }

  dimension: fax {
    type: string
    sql: ${TABLE}.fax ;;
  }

  dimension: field_rep {
    type: string
    sql: ${TABLE}.field_rep__c ;;
    group_label: "Owners"
    label: "Field Rep"
  }

  dimension: first_channel {
    type: string
    sql: ${TABLE}.first_channel__c ;;
  }

  dimension: first_channel_detail {
    type: string
    sql: ${TABLE}.first_channel_detail__c ;;
  }

  dimension_group: first_created_date {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.first_created_date__c ;;
  }

  dimension: first_lead {
    type: string
    sql: ${TABLE}.first_lead__c ;;
  }

  dimension: first_lead_round_robin_id {
    type: number
    value_format_name: id
    sql: ${TABLE}.first_lead_round_robin_id__c ;;
  }

  dimension: first_offer {
    type: string
    sql: ${TABLE}.first_offer__c ;;
  }

  dimension: first_offer_detail {
    type: string
    sql: ${TABLE}.first_offer_detail__c ;;
  }

  dimension_group: followup_date {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.followup_date__c ;;
  }

  dimension: former_owner {
    type: string
    sql: ${TABLE}.former_owner__c ;;
    group_label: "Owners"
    label: "Former Owner"
  }

  dimension: g2k_rank {
    type: number
    sql: ${TABLE}.g2k_rank__c ;;
  }

  dimension: geo {
    type: string
    sql: ${TABLE}.geo__c ;;
  }

  dimension_group: getstarteddate {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.getstarteddate__c ;;
  }

  dimension: government {
    type: yesno
    sql: ${TABLE}.government__c ;;
  }

  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: imported_case_study_note {
    type: string
    sql: ${TABLE}.imported_case_study_note__c ;;
    group_label: "Imported"
    label: "Case Study Note"
  }

  dimension: imported_industry {
    type: string
    sql: ${TABLE}.imported_industry__c ;;
    group_label: "Imported"
    label: "Industry"
  }

  dimension: inbound_outbound {
    type: string
    sql: ${TABLE}.inbound_outbound__c ;;
  }

  dimension: industry {
    type: string
    sql: ${TABLE}.industry ;;
    label: "Industry"
  }

  dimension: isdeleted {
    type: yesno
    sql: ${TABLE}.isdeleted ;;
  }

  dimension_group: last_time_assignm_process_workflow_ran {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.last_time_assignm_process_workflow_ran__c ;;
  }

  dimension_group: lastactivitydate {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.lastactivitydate ;;
  }

  dimension: lastmodifiedbyid {
    type: string
    sql: ${TABLE}.lastmodifiedbyid ;;
  }

  dimension_group: lastmodifieddate {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.lastmodifieddate ;;
  }

  dimension_group: lastreferenceddate {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.lastreferenceddate ;;
  }

  dimension_group: lastreviewed {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.lastreviewed__c ;;
  }

  dimension_group: lastvieweddate {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.lastvieweddate ;;
  }

  dimension_group: lead_created_date {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.lead_created_date__c ;;
  }

  dimension: legal_contact {
    type: string
    sql: ${TABLE}.legal_contact__c ;;
    group_label: "Legal"
  }

  dimension: legal_right_for_case_studies {
    type: string
    sql: ${TABLE}.legal_right_for_case_studies__c ;;
    group_label: "Legal"
  }

  dimension: legal_right_to_use_name_logo {
    type: string
    sql: ${TABLE}.legal_right_to_use_name_logo__c ;;
    group_label: "Legal"
  }

  dimension: legally_agreed_to_joint_pr {
    type: string
    sql: ${TABLE}.legally_agreed_to_joint_pr__c ;;
    group_label: "Legal"
  }

  dimension: legally_agreed_to_pr {
    type: string
    sql: ${TABLE}.legally_agreed_to_pr__c ;;
    group_label: "Legal"
  }

  dimension: logo_sales_logos_dropbox {
    type: string
    sql: ${TABLE}.logo_sales_logos_dropbox__c ;;
  }

  dimension: logo_used_on_our_website {
    type: string
    sql: ${TABLE}.logo_used_on_our_website__c ;;
  }

  dimension: masterrecordid {
    type: string
    sql: ${TABLE}.masterrecordid ;;
  }

  dimension: mattermost_rep {
    type: string
    sql: ${TABLE}.mattermost_rep__c ;;
    group_label: "Owners"
    label: "Mattermost Rep"
  }

  dimension_group: max_closed_won_date {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.max_closed_won_date__c ;;
  }

  dimension_group: meetingset_date {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.meetingset_date__c ;;
  }

  dimension_group: mql_date {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.mql_date__c ;;
    group_label: "Funnel"
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
    type: yesno
    sql: ${TABLE}.named_account__c ;;
    label: "Named Account"
  }

  dimension: named_account_tier {
    type: string
    sql: ${TABLE}.named_account_tier__c ;;
    label: "Named Account Tier"
  }

  dimension_group: nda_expiration_date {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.nda_expiration_date__c ;;
  }

  dimension: netsuite_conn__account_balance {
    type: number
    sql: ${TABLE}.netsuite_conn__account_balance__c ;;
    group_label: "Netsuite"
  }

  dimension: netsuite_conn__account_overdue_balance {
    type: number
    sql: ${TABLE}.netsuite_conn__account_overdue_balance__c ;;
    group_label: "Netsuite"
  }

  dimension: netsuite_conn__celigo_update {
    type: yesno
    sql: ${TABLE}.netsuite_conn__celigo_update__c ;;
    group_label: "Netsuite"
  }

  dimension: netsuite_conn__channel_tier {
    type: string
    sql: ${TABLE}.netsuite_conn__channel_tier__c ;;
    group_label: "Netsuite"
  }

  dimension: netsuite_conn__credit_hold {
    type: string
    sql: ${TABLE}.netsuite_conn__credit_hold__c ;;
    group_label: "Netsuite"
  }

  dimension: netsuite_conn__credit_limit {
    type: number
    sql: ${TABLE}.netsuite_conn__credit_limit__c ;;
    group_label: "Netsuite"
  }

  dimension: netsuite_conn__days_overdue {
    type: number
    sql: ${TABLE}.netsuite_conn__days_overdue__c ;;
    group_label: "Netsuite"
  }

  dimension: netsuite_conn__netsuite_id {
    type: string
    sql: ${TABLE}.netsuite_conn__netsuite_id__c ;;
    group_label: "Netsuite"
  }

  dimension: netsuite_conn__netsuite_sync_err {
    type: string
    sql: ${TABLE}.netsuite_conn__netsuite_sync_err__c ;;
    group_label: "Netsuite"
  }

  dimension: netsuite_conn__push_to_netsuite {
    type: yesno
    sql: ${TABLE}.netsuite_conn__push_to_netsuite__c ;;
    group_label: "Netsuite"
  }

  dimension: netsuite_conn__pushed_from_opportunity {
    type: yesno
    sql: ${TABLE}.netsuite_conn__pushed_from_opportunity__c ;;
    group_label: "Netsuite"
  }

  dimension: netsuite_conn__sync_in_progress {
    type: yesno
    sql: ${TABLE}.netsuite_conn__sync_in_progress__c ;;
    group_label: "Netsuite"
  }

  dimension: netsuite_conn__unbilled_orders {
    type: number
    sql: ${TABLE}.netsuite_conn__unbilled_orders__c ;;
    group_label: "Netsuite"
  }

  dimension: number_of_open_opportunities {
    type: number
    sql: ${TABLE}.number_of_open_opportunities__c ;;
  }

  dimension: number_of_opportunities {
    type: number
    sql: ${TABLE}.number_of_opportunities__c ;;
  }

  dimension: number_of_won_opportunities {
    type: number
    sql: ${TABLE}.number_of_won_opportunities__c ;;
  }

  dimension: numberofemployees {
    type: number
    sql: ${TABLE}.numberofemployees ;;
  }

  dimension: obsoleteregion {
    type: string
    sql: ${TABLE}.obsoleteregion__c ;;
    group_label: "Ditch"
  }

  dimension: obsoleteterritory {
    type: string
    sql: ${TABLE}.obsoleteterritory__c ;;
    group_label: "Ditch"
  }

  dimension: offer {
    type: string
    sql: ${TABLE}.offer__c ;;
  }

  dimension: offer_detail {
    type: string
    sql: ${TABLE}.offer_detail__c ;;
  }

  dimension: other_customer_marketing_comment {
    type: string
    sql: ${TABLE}.other_customer_marketing_comment__c ;;
  }

  dimension: our_champion {
    type: string
    sql: ${TABLE}.our_champion__c ;;
  }

  dimension: ownerid {
    type: string
    sql: ${TABLE}.ownerid ;;
    group_label: "Owners"
    label: "Owner ID"
  }

  dimension: owner_name {
    type: string
    sql: ${account_owner.name};;
    group_label: "Owners"
    label: "Owner Name"
  }

  dimension: csm_name {
    type: string
    sql: ${account_csm.name};;
    group_label: "Owners"
    label: "CSM Name (based on id)"
  }

  dimension: ownership {
    type: string
    sql: ${TABLE}.ownership ;;
    group_label: "Owners"
    label: "Ownership"
  }

  dimension: parentid {
    type: string
    sql: ${TABLE}.parentid ;;
    group_label: "Parent"
    label: "Parent Account ID"
  }

  dimension: parent_account_name {
    label: "Master Account"
    type: string
    sql: coalesce(${parent_account.name},${name}) ;;
  }

  dimension: phone {
    type: string
    sql: ${TABLE}.phone ;;
  }

  dimension: photourl {
    type: string
    sql: ${TABLE}.photourl ;;
  }

  dimension_group: pr_date {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.pr_date__c ;;
  }

  dimension: pr_link {
    type: string
    sql: ${TABLE}.pr_link__c ;;
  }

  dimension_group: pre_release_sign_up_date {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.pre_release_sign_up_date__c ;;
  }

  dimension_group: putintonurture_date {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.putintonurture_date__c ;;
  }

  dimension: rating {
    type: string
    sql: ${TABLE}.rating ;;
  }

  dimension: region {
    type: string
    sql: ${TABLE}.region__c ;;
  }

#   dimension: csm_enriched_region {
#     type: string
#     sql: CASE
#               WHEN ${csm_id} = '0051R00000GndedQAB' THEN 'FEDERAL'
#               WHEN ${region} IN ('Rest of EMEA','DACH','France','UKI') THEN 'EMEA'
#               WHEN ${region} IN ('ANZ','JPS') THEN 'APAC'
#               ELSE ${region} END ;;
#   }

  dimension: renewal_rep {
    type: string
    sql: ${TABLE}.renewal_rep__c ;;
    group_label: "Owners"
    label: "Renewal Rep"
  }

  dimension_group: request_a_quote_date {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.request_a_quote_date__c ;;
  }

  dimension_group: responded_date {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.responded_date__c ;;
  }

  dimension: sector {
    type: string
    sql: ${TABLE}.sector__c ;;
  }

  dimension: sfid {
    type: string
    sql: ${TABLE}.sfid ;;
    label: "Account ID"
    description: "Salesforce Account SFID"
  }

  dimension: shippingcity {
    type: string
    sql: ${TABLE}.shippingcity ;;
    group_label: "Shipping"
  }

  dimension: shippingcountry {
    type: string
    sql: ${TABLE}.shippingcountry ;;
    group_label: "Shipping"
  }

  dimension: shippingcountrycode {
    type: string
    sql: ${TABLE}.shippingcountrycode ;;
    group_label: "Shipping"
  }

  dimension: shippinggeocodeaccuracy {
    type: string
    sql: ${TABLE}.shippinggeocodeaccuracy ;;
    group_label: "Shipping"
  }

  dimension: shippinglatitude {
    type: number
    sql: ${TABLE}.shippinglatitude ;;
    group_label: "Shipping"
  }

  dimension: shippinglongitude {
    type: number
    sql: ${TABLE}.shippinglongitude ;;
    group_label: "Shipping"
  }

  dimension: shippingpostalcode {
    type: string
    sql: ${TABLE}.shippingpostalcode ;;
    group_label: "Shipping"
  }

  dimension: shippingstate {
    type: string
    sql: ${TABLE}.shippingstate ;;
    group_label: "Shipping"
  }

  dimension: shippingstatecode {
    type: string
    sql: ${TABLE}.shippingstatecode ;;
    group_label: "Shipping"
  }

  dimension: shippingstreet {
    type: string
    sql: ${TABLE}.shippingstreet ;;
    group_label: "Shipping"
  }

  dimension: sic {
    type: string
    sql: ${TABLE}.sic ;;
  }

  dimension: sic_description {
    type: string
    sql: ${TABLE}.sic_description__c ;;
  }

  dimension: sicdesc {
    type: string
    sql: ${TABLE}.sicdesc ;;
  }

  dimension: signed_nda {
    type: yesno
    sql: ${TABLE}.signed_nda__c ;;
  }

  dimension: site {
    type: string
    sql: ${TABLE}.site ;;
  }

  dimension: solution_architect_1 {
    type: string
    sql: ${TABLE}.solution_architect_1__c ;;
  }

  dimension: solution_architect_2 {
    type: string
    sql: ${TABLE}.solution_architect_2__c ;;
  }

  dimension_group: systemmodstamp {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.systemmodstamp ;;
    group_label: "System"
  }

  dimension: territory {
    type: string
    sql: ${TABLE}.territory__c ;;
    group_label: "Region and Territory"
    label: "Territory Name"
  }

  dimension: territoryid {
    type: string
    sql: ${TABLE}.territoryid__c ;;
    group_label: "Region and Territory"
    label: "Territory ID"
  }

  dimension: testimonial1_from {
    type: string
    sql: ${TABLE}.testimonial1_from__c ;;
    group_label: "Marketing"
  }

  dimension: testimonial_1 {
    type: string
    sql: ${TABLE}.testimonial_1__c ;;
    group_label: "Marketing"
  }

  dimension: testimonial_2 {
    type: string
    sql: ${TABLE}.testimonial_2__c ;;
    group_label: "Marketing"
  }

  dimension: testimonial_2_from {
    type: string
    sql: ${TABLE}.testimonial_2_from__c ;;
    group_label: "Marketing"
  }

  dimension: tickersymbol {
    type: string
    sql: ${TABLE}.tickersymbol ;;
  }

  dimension: total_sales {
    type: number
    sql: ${TABLE}.total_sales__c ;;
  }

  dimension: total_seats {
    type: string
    sql: ${TABLE}.total_seats__c ;;
  }

  dimension_group: trial_req_date {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.trial_req_date__c ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
    label: "Account Type"
  }

  dimension: unique_accounts {
    type: number
    sql: ${TABLE}.unique_accounts__c ;;
  }

  dimension_group: unqualified_date {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.unqualified_date__c ;;
  }

  dimension_group: video_case_study_date {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.video_case_study_date__c ;;
  }

  dimension: video_case_study_link {
    type: string
    sql: ${TABLE}.video_case_study_link__c ;;
  }

  dimension: website {
    type: string
    sql: ${TABLE}.website ;;
  }

  dimension_group: x1stcontactusdate {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.x1stcontactusdate__c ;;
  }

  dimension: zendesk__create_in_zendesk {
    type: yesno
    sql: ${TABLE}.zendesk__create_in_zendesk__c ;;
    group_label: "Zendesk"
  }

  dimension: zendesk__createdupdatedflag {
    type: yesno
    sql: ${TABLE}.zendesk__createdupdatedflag__c ;;
    group_label: "Zendesk"
  }

  dimension: zendesk__domain_mapping {
    type: string
    sql: ${TABLE}.zendesk__domain_mapping__c ;;
    group_label: "Zendesk"
  }

  dimension_group: zendesk__last_sync_date {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.zendesk__last_sync_date__c ;;
    group_label: "Zendesk"
  }

  dimension: zendesk__last_sync_status {
    type: string
    sql: ${TABLE}.zendesk__last_sync_status__c ;;
    group_label: "Zendesk"
  }

  dimension: zendesk__notes {
    type: string
    sql: ${TABLE}.zendesk__notes__c ;;
    group_label: "Zendesk"
  }

  dimension: zendesk__result {
    type: string
    sql: ${TABLE}.zendesk__result__c ;;
    group_label: "Zendesk"
  }

  dimension: zendesk__tags {
    type: string
    sql: ${TABLE}.zendesk__tags__c ;;
    group_label: "Zendesk"
  }

  dimension: zendesk__zendesk_oldtags {
    type: string
    sql: ${TABLE}.zendesk__zendesk_oldtags__c ;;
    group_label: "Zendesk"
  }

  dimension: zendesk__zendesk_organization {
    type: string
    sql: ${TABLE}.zendesk__zendesk_organization__c ;;
    group_label: "Zendesk"
  }

  dimension: zendesk__zendesk_organization_id {
    type: string
    sql: ${TABLE}.zendesk__zendesk_organization_id__c ;;
    group_label: "Zendesk"
  }

  dimension: zendesk__zendesk_outofsync {
    type: yesno
    sql: ${TABLE}.zendesk__zendesk_outofsync__c ;;
    group_label: "Zendesk"
  }

  measure: count {
    type: count
    drill_fields: [account_id_18_digit, name]
  }
}
