view: account {
  view_label: ""
  sql_table_name: orgm.account ;;
  drill_fields: [sfid]

  dimension: _hc_err {
    type: string
    sql: ${TABLE}."_hc_err" ;;
    group_label: "System"
    label: "HC Error"
  }

  dimension: _hc_lastop {
    type: string
    sql: ${TABLE}."_hc_lastop" ;;
    group_label: "System"
    label: "HC Last Op"
  }

  dimension: dwh_external_id__c {
    type: string
    sql: ${TABLE}."dwh_external_id__c" ;;
    group_label: "System"
    label: "DWH External ID"
  }


  dimension: account_number__c {
    type: string
    sql: ${TABLE}."account_number__c" ;;
    label: "Account #"
  }

  dimension: account_number_int__c {
    type: number
    sql: ${TABLE}."account_number_int__c" ;;
    hidden:  yes
  }

  dimension: account_end_date__c {
    type: date
    sql: ${TABLE}."account_end_date__c" ;;
    label: "Account End Date"
  }

  dimension: account_start_date__c {
    type: date
    sql: ${TABLE}."account_start_date__c" ;;
    label: "Account Start Date"
  }

  dimension: accountsource {
    type: string
    sql: ${TABLE}."accountsource" ;;
    label: "Account Source"
  }

  dimension: annualrevenue {
    type: number
    sql: ${TABLE}."annualrevenue" ;;
    label: "Annual Revenue"
  }

  dimension: api_id__c {
    type: string
    sql: ${TABLE}."api_id__c" ;;
    group_label: "System"
    label: "API ID"
  }

  dimension: billingcity {
    type: string
    sql: ${TABLE}."billingcity" ;;
    group_label: "Billings"
  }

  dimension: billingcountry {
    type: string
    sql: ${TABLE}."billingcountry" ;;
    group_label: "Billings"
  }

  dimension: billingcountrycode {
    type: string
    sql: ${TABLE}."billingcountrycode" ;;
    group_label: "Billings"
  }

  dimension: billinggeocodeaccuracy {
    type: string
    sql: ${TABLE}."billinggeocodeaccuracy" ;;
    group_label: "Billings"
  }

  dimension: billinglatitude {
    type: number
    sql: ${TABLE}."billinglatitude" ;;
    group_label: "Billings"
  }

  dimension: billinglongitude {
    type: number
    sql: ${TABLE}."billinglongitude" ;;
    group_label: "Billings"
  }

  dimension: billingpostalcode {
    type: string
    sql: ${TABLE}."billingpostalcode" ;;
    group_label: "Billings"
  }

  dimension: billingstate {
    type: string
    sql: ${TABLE}."billingstate" ;;
    group_label: "Billings"
  }

  dimension: billingstatecode {
    type: string
    sql: ${TABLE}."billingstatecode" ;;
    group_label: "Billings"
  }

  dimension: billingstreet {
    type: string
    sql: ${TABLE}."billingstreet" ;;
    group_label: "Billings"
  }

  dimension: case_study_date__c {
    sql: ${TABLE}."case_study_date__c" ;;
    group_label: "Marketing"
    label: "Case Study"
  }

  dimension: case_study_link__c {
    type: string
    sql: ${TABLE}."case_study_link__c" ;;
    group_label: "Marketing"
  }

  dimension: cleaned_up_website__c {
    type: string
    sql: ${TABLE}."cleaned_up_website__c" ;;
    group_label: "System"
    label: "Cleaned up Website"

  }

  dimension: commercial_rep__c {
    type: string
    sql: ${TABLE}."commercial_rep__c" ;;
    group_label: "Owners"
    label: "Commercial Rep"
  }

  dimension: company_type__c {
    type: string
    sql: ${TABLE}."company_type__c" ;;
    label: "Company Type"
  }

  dimension: cosize__c {
    type: string
    sql: ${TABLE}."cosize__c" ;;
    label: "Company Size"
  }

  dimension: createdbyid {
    type: string
    sql: ${TABLE}."createdbyid" ;;
    group_label: "System"
    label: "Created By ID"
  }

  dimension: createddate {
    type: date
    sql: ${TABLE}."createddate" ;;
    label: "Create Date"
  }

  dimension: csm__c {
    type: string
    sql: ${TABLE}."csm__c" ;;
    group_label: "Owners"
    label: "CSM Name"
  }

  dimension: csm_auto_assigned__c {
    type: string
    sql: ${TABLE}."csm_auto_assigned__c" ;;
    group_label: "CS"
    label: "CSM Auto-assigned"
  }

  dimension: csm_id__c {
    type: string
    sql: ${TABLE}."csm_id__c" ;;
    group_label: "Owners"
    label: "CSM ID"
  }

  dimension: csm_override__c {
    type: string
    sql: ${TABLE}."csm_override__c" ;;
    group_label: "CS"
    label: "CSM Override"
  }

  dimension: csm_territory__c {
    type: string
    sql: ${TABLE}."csm_territory__c" ;;
    group_label: "CS"
    label: "CS Territory"}

  dimension: current_arr {
    type: number
    sql: ${TABLE}."arr_current__c" ;;
    label: "Current ARR"
    value_format_name: "usd_0"
  }

  dimension: customer_churned__c {
    type: yesno
    sql: ${TABLE}."customer_churned__c" ;;
    group_label: "CS"
  }

  dimension: customer_segmentation_tier__c {
    type: string
    sql: ${TABLE}."customer_segmentation_tier__c" ;;
    group_label: "CS"
  }

  dimension_group: date_of_issue__c {
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
    sql: ${TABLE}."date_of_issue__c" ;;
  }

  dimension: days_past_renewal__c {
    type: number
    sql: ${TABLE}."days_past_renewal__c" ;;
    group_label: "CS"
  }

  dimension_group: demo_req_date__c {
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
    sql: ${TABLE}."demo_req_date__c" ;;
  }

  dimension_group: deployonbitnamidate__c {
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
    sql: ${TABLE}."deployonbitnamidate__c" ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}."description" ;;
    label: "Account Description"
  }

  dimension_group: e_purchase_date__c {
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
    sql: ${TABLE}."e_purchase_date__c" ;;
  }

  dimension: fax {
    type: string
    sql: ${TABLE}."fax" ;;
  }

  dimension: field_rep__c {
    type: string
    sql: ${TABLE}."field_rep__c" ;;
    group_label: "Owners"
    label: "Field Rep"
  }

  dimension: first_channel__c {
    type: string
    sql: ${TABLE}."first_channel__c" ;;
    label: "First Channel"
  }

  dimension: first_channel_detail__c {
    type: string
    sql: ${TABLE}."first_channel_detail__c" ;;
    label: "First Channel"
  }

  dimension_group: first_created_date__c {
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
    sql: ${TABLE}."first_created_date__c" ;;
  }

  dimension: first_lead__c {
    type: string
    sql: ${TABLE}."first_lead__c" ;;
  }

  dimension: first_lead_round_robin_id__c {
    type: number
    value_format_name: id
    sql: ${TABLE}."first_lead_round_robin_id__c" ;;
  }

  dimension: first_offer__c {
    type: string
    sql: ${TABLE}."first_offer__c" ;;
  }

  dimension: first_offer_detail__c {
    type: string
    sql: ${TABLE}."first_offer_detail__c" ;;
  }

  dimension_group: followup_date__c {
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
    sql: ${TABLE}."followup_date__c" ;;
  }

  dimension: former_owner__c {
    type: string
    sql: ${TABLE}."former_owner__c" ;;
    group_label: "Owners"
    label: "Former Owner"
  }

  dimension: g2k_rank__c {
    type: number
    sql: ${TABLE}."g2k_rank__c" ;;
  }

  dimension: geo__c {
    type: string
    sql: ${TABLE}."geo__c" ;;
  }

  dimension_group: getstarteddate__c {
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
    sql: ${TABLE}."getstarteddate__c" ;;
  }

  dimension: government__c {
    type: yesno
    sql: ${TABLE}."government__c" ;;
  }

  dimension: id {
    type: number
    sql: ${TABLE}."id" ;;
  }

  dimension: imported_case_study_note__c {
    type: string
    sql: ${TABLE}."imported_case_study_note__c" ;;
    group_label: "Imported"
    label: "Case Study Note"
  }

  dimension: imported_industry__c {
    type: string
    sql: ${TABLE}."imported_industry__c" ;;
    group_label: "Imported"
    label: "Industry"
  }

  dimension: inbound_outbound__c {
    type: string
    sql: ${TABLE}."inbound_outbound__c" ;;
  }

  dimension: industry {
    type: string
    sql: ${TABLE}."industry" ;;
    label: "Industry"
  }

  dimension: isdeleted {
    type: yesno
    sql: ${TABLE}."isdeleted" ;;
  }

  dimension_group: last_time_assignm_process_workflow_ran__c {
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
    sql: ${TABLE}."last_time_assignm_process_workflow_ran__c" ;;
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
    sql: ${TABLE}."lastactivitydate" ;;
  }

  dimension: lastmodifiedbyid {
    type: string
    sql: ${TABLE}."lastmodifiedbyid" ;;
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
    sql: ${TABLE}."lastmodifieddate" ;;
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
    sql: ${TABLE}."lastreferenceddate" ;;
  }

  dimension_group: lastreviewed__c {
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
    sql: ${TABLE}."lastreviewed__c" ;;
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
    sql: ${TABLE}."lastvieweddate" ;;
  }

  dimension_group: lead_created_date__c {
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
    sql: ${TABLE}."lead_created_date__c" ;;
  }

  dimension: legal_contact__c {
    type: string
    sql: ${TABLE}."legal_contact__c" ;;
    group_label: "Legal"
  }

  dimension: legal_right_for_case_studies__c {
    type: string
    sql: ${TABLE}."legal_right_for_case_studies__c" ;;
    group_label: "Legal"
  }

  dimension: legal_right_to_use_name_logo__c {
    type: string
    sql: ${TABLE}."legal_right_to_use_name_logo__c" ;;
    group_label: "Legal"
  }

  dimension: legally_agreed_to_joint_pr__c {
    type: string
    sql: ${TABLE}."legally_agreed_to_joint_pr__c" ;;
    group_label: "Legal"
  }

  dimension: legally_agreed_to_pr__c {
    type: string
    sql: ${TABLE}."legally_agreed_to_pr__c" ;;
    group_label: "Legal"
  }

  dimension: logo_sales_logos_dropbox__c {
    type: string
    sql: ${TABLE}."logo_sales_logos_dropbox__c" ;;
  }

  dimension: logo_used_on_our_website__c {
    type: string
    sql: ${TABLE}."logo_used_on_our_website__c" ;;
  }

  dimension: masterrecordid {
    type: string
    sql: ${TABLE}."masterrecordid" ;;
  }

  dimension_group: max_closed_won_date__c {
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
    sql: ${TABLE}."max_closed_won_date__c" ;;
  }

  dimension_group: meetingset_date__c {
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
    sql: ${TABLE}."meetingset_date__c" ;;
  }

  dimension_group: mql_date__c {
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
    sql: ${TABLE}."mql_date__c" ;;
    group_label: "Funnel"
  }

  dimension: name {
    type: string
    sql: ${TABLE}."name" ;;
    label: "Account Name"
  }

  dimension: named_account__c {
    type: yesno
    sql: ${TABLE}."named_account__c" ;;
    label: "Named Account"
  }

  dimension: named_account_tier__c {
    type: string
    sql: ${TABLE}."named_account_tier__c" ;;
    label: "Named Account Tier"
  }

  dimension_group: nda_expiration_date__c {
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
    sql: ${TABLE}."nda_expiration_date__c" ;;
  }

  dimension: netsuite_conn__account_balance__c {
    type: number
    sql: ${TABLE}."netsuite_conn__account_balance__c" ;;
    group_label: "Netsuite"
  }

  dimension: netsuite_conn__account_overdue_balance__c {
    type: number
    sql: ${TABLE}."netsuite_conn__account_overdue_balance__c" ;;
    group_label: "Netsuite"
  }

  dimension: netsuite_conn__celigo_update__c {
    type: yesno
    sql: ${TABLE}."netsuite_conn__celigo_update__c" ;;
    group_label: "Netsuite"
  }

  dimension: netsuite_conn__channel_tier__c {
    type: string
    sql: ${TABLE}."netsuite_conn__channel_tier__c" ;;
    group_label: "Netsuite"
  }

  dimension: netsuite_conn__credit_hold__c {
    type: string
    sql: ${TABLE}."netsuite_conn__credit_hold__c" ;;
    group_label: "Netsuite"
  }

  dimension: netsuite_conn__credit_limit__c {
    type: number
    sql: ${TABLE}."netsuite_conn__credit_limit__c" ;;
    group_label: "Netsuite"
  }

  dimension: netsuite_conn__days_overdue__c {
    type: number
    sql: ${TABLE}."netsuite_conn__days_overdue__c" ;;
    group_label: "Netsuite"
  }

  dimension: netsuite_conn__netsuite_id__c {
    type: string
    sql: ${TABLE}."netsuite_conn__netsuite_id__c" ;;
    group_label: "Netsuite"
  }

  dimension: netsuite_conn__netsuite_sync_err__c {
    type: string
    sql: ${TABLE}."netsuite_conn__netsuite_sync_err__c" ;;
    group_label: "Netsuite"
  }

  dimension: netsuite_conn__push_to_netsuite__c {
    type: yesno
    sql: ${TABLE}."netsuite_conn__push_to_netsuite__c" ;;
    group_label: "Netsuite"
  }

  dimension: netsuite_conn__pushed_from_opportunity__c {
    type: yesno
    sql: ${TABLE}."netsuite_conn__pushed_from_opportunity__c" ;;
    group_label: "Netsuite"
  }

  dimension: netsuite_conn__sync_in_progress__c {
    type: yesno
    sql: ${TABLE}."netsuite_conn__sync_in_progress__c" ;;
    group_label: "Netsuite"
  }

  dimension: netsuite_conn__unbilled_orders__c {
    type: number
    sql: ${TABLE}."netsuite_conn__unbilled_orders__c" ;;
    group_label: "Netsuite"
  }

  dimension: number_of_open_opportunities__c {
    type: number
    sql: ${TABLE}."number_of_open_opportunities__c" ;;
  }

  dimension: number_of_opportunities__c {
    type: number
    sql: ${TABLE}."number_of_opportunities__c" ;;
  }

  dimension: number_of_won_opportunities__c {
    type: number
    sql: ${TABLE}."number_of_won_opportunities__c" ;;
  }

  dimension: numberofemployees {
    type: number
    sql: ${TABLE}."numberofemployees" ;;
  }

  dimension: offer__c {
    type: string
    sql: ${TABLE}."offer__c" ;;
  }

  dimension: offer_detail__c {
    type: string
    sql: ${TABLE}."offer_detail__c" ;;
  }

  dimension: other_customer_marketing_comment__c {
    type: string
    sql: ${TABLE}."other_customer_marketing_comment__c" ;;
  }

  dimension: our_champion__c {
    type: string
    sql: ${TABLE}."our_champion__c" ;;
  }

  dimension: ownerid {
    type: string
    sql: ${TABLE}."ownerid" ;;
    group_label: "Owners"
    label: "Owner ID"
  }

  dimension: ownership {
    type: string
    sql: ${TABLE}."ownership" ;;
    group_label: "Owners"
    label: "Ownership"
  }

  dimension: parentid {
    type: string
    sql: ${TABLE}."parentid" ;;
    group_label: "Parent"
    label: "Parent Account ID"
  }

  dimension: master_account_name {
    type: string
    sql: coalesce(${parent_account.name},${name}) ;;
  }

  dimension: phone {
    type: string
    sql: ${TABLE}."phone" ;;
  }

  dimension: photourl {
    type: string
    sql: ${TABLE}."photourl" ;;
  }

  dimension_group: pr_date__c {
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
    sql: ${TABLE}."pr_date__c" ;;
  }

  dimension: pr_link__c {
    type: string
    sql: ${TABLE}."pr_link__c" ;;
  }

  dimension_group: pre_release_sign_up_date__c {
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
    sql: ${TABLE}."pre_release_sign_up_date__c" ;;
  }

  dimension_group: putintonurture_date__c {
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
    sql: ${TABLE}."putintonurture_date__c" ;;
  }

  dimension: rating {
    type: string
    sql: ${TABLE}."rating" ;;
  }

  dimension: region__c {
    type: string
    sql: ${TABLE}."region__c" ;;
  }

  dimension: renewal_rep__c {
    type: string
    sql: ${TABLE}."renewal_rep__c" ;;
    group_label: "Owners"
    label: "Renewal Rep"
  }

  dimension_group: request_a_quote_date__c {
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
    sql: ${TABLE}."request_a_quote_date__c" ;;
  }

  dimension_group: responded_date__c {
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
    sql: ${TABLE}."responded_date__c" ;;
  }

  dimension: sector__c {
    type: string
    sql: ${TABLE}."sector__c" ;;
  }

  dimension: sfid {
    primary_key: yes
    type: string
    sql: ${TABLE}."sfid" ;;
    group_label: "System"
    label: "Account SFID"
  }

  dimension: shippingcity {
    type: string
    sql: ${TABLE}."shippingcity" ;;
    group_label: "Shipping"
  }

  dimension: shippingcountry {
    type: string
    sql: ${TABLE}."shippingcountry" ;;
    group_label: "Shipping"
  }

  dimension: shippingcountrycode {
    type: string
    sql: ${TABLE}."shippingcountrycode" ;;
    group_label: "Shipping"
  }

  dimension: shippinggeocodeaccuracy {
    type: string
    sql: ${TABLE}."shippinggeocodeaccuracy" ;;
    group_label: "Shipping"
  }

  dimension: shippinglatitude {
    type: number
    sql: ${TABLE}."shippinglatitude" ;;
    group_label: "Shipping"
  }

  dimension: shippinglongitude {
    type: number
    sql: ${TABLE}."shippinglongitude" ;;
    group_label: "Shipping"
  }

  dimension: shippingpostalcode {
    type: string
    sql: ${TABLE}."shippingpostalcode" ;;
    group_label: "Shipping"
  }

  dimension: shippingstate {
    type: string
    sql: ${TABLE}."shippingstate" ;;
    group_label: "Shipping"
  }

  dimension: shippingstatecode {
    type: string
    sql: ${TABLE}."shippingstatecode" ;;
    group_label: "Shipping"
  }

  dimension: shippingstreet {
    type: string
    sql: ${TABLE}."shippingstreet" ;;
    group_label: "Shipping"
  }

  dimension: sic {
    type: string
    sql: ${TABLE}."sic" ;;
  }

  dimension: sic_description__c {
    type: string
    sql: ${TABLE}."sic_description__c" ;;
  }

  dimension: sicdesc {
    type: string
    sql: ${TABLE}."sicdesc" ;;
  }

  dimension: signed_nda__c {
    type: yesno
    sql: ${TABLE}."signed_nda__c" ;;
  }

  dimension: site {
    type: string
    sql: ${TABLE}."site" ;;
  }

  dimension: solution_architect_1__c {
    type: string
    sql: ${TABLE}."solution_architect_1__c" ;;
  }

  dimension: solution_architect_2__c {
    type: string
    sql: ${TABLE}."solution_architect_2__c" ;;
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
    sql: ${TABLE}."systemmodstamp" ;;
    group_label: "System"
  }

  dimension: territory__c {
    type: string
    sql: ${TABLE}."territory__c" ;;
    group_label: "Region and Territory"
    label: "Territory Name"
  }

  dimension: territoryid__c {
    type: string
    sql: ${TABLE}."territoryid__c" ;;
    group_label: "Region and Territory"
    label: "Territory ID"
  }

  dimension: testimonial1_from__c {
    type: string
    sql: ${TABLE}."testimonial1_from__c" ;;
    group_label: "Marketing"
  }

  dimension: testimonial_1__c {
    type: string
    sql: ${TABLE}."testimonial_1__c" ;;
    group_label: "Marketing"
  }

  dimension: testimonial_2__c {
    type: string
    sql: ${TABLE}."testimonial_2__c" ;;
    group_label: "Marketing"
  }

  dimension: testimonial_2_from__c {
    type: string
    sql: ${TABLE}."testimonial_2_from__c" ;;
    group_label: "Marketing"
  }

  dimension: tickersymbol {
    type: string
    sql: ${TABLE}."tickersymbol" ;;
  }

  dimension: total_sales__c {
    type: number
    sql: ${TABLE}."total_sales__c" ;;
  }

  dimension: total_seats__c {
    type: string
    sql: ${TABLE}."total_seats__c" ;;
  }

  dimension_group: trial_req_date__c {
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
    sql: ${TABLE}."trial_req_date__c" ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}."type" ;;
    label: "Account Type"
  }

  dimension: unique_accounts__c {
    type: number
    sql: ${TABLE}."unique_accounts__c" ;;
  }

  dimension_group: unqualified_date__c {
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
    sql: ${TABLE}."unqualified_date__c" ;;
  }

  dimension_group: video_case_study_date__c {
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
    sql: ${TABLE}."video_case_study_date__c" ;;
  }

  dimension: video_case_study_link__c {
    type: string
    sql: ${TABLE}."video_case_study_link__c" ;;
  }

  dimension: website {
    type: string
    sql: ${TABLE}."website" ;;
  }

  dimension_group: x1stcontactusdate__c {
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
    sql: ${TABLE}."x1stcontactusdate__c" ;;
  }

  measure: arr_current {
    type: sum
    sql: ${TABLE}."arr_current__c" ;;
    group_label: "Total"
    label: "Current ARR"
    value_format_name: "usd_0"
  }

  measure: count {
    type: count_distinct
    sql: ${sfid} ;;
    drill_fields: [sfid, name]
  }
}
