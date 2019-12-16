view: account {
  sql_table_name: orgm.account ;;
  drill_fields: [account_id_18_digit__c]

  dimension: account_id_18_digit__c {
    primary_key: yes
    type: string
    sql: ${TABLE}."account_id_18_digit__c" ;;
  }

  dimension: _hc_err {
    type: string
    sql: ${TABLE}."_hc_err" ;;
  }

  dimension: _hc_lastop {
    type: string
    sql: ${TABLE}."_hc_lastop" ;;
  }

  dimension: account_arr__c {
    type: number
    sql: ${TABLE}."account_arr__c" ;;
  }

  dimension: account_arr_summary__c {
    type: number
    sql: ${TABLE}."account_arr_summary__c" ;;
  }

  dimension_group: account_end_date__c {
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
    sql: ${TABLE}."account_end_date__c" ;;
  }

  dimension: account_number__c {
    type: string
    sql: ${TABLE}."account_number__c" ;;
  }

  dimension: account_number_int__c {
    type: number
    sql: ${TABLE}."account_number_int__c" ;;
  }

  dimension_group: account_start_date__c {
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
    sql: ${TABLE}."account_start_date__c" ;;
  }

  dimension: accountsource {
    type: string
    sql: ${TABLE}."accountsource" ;;
  }

  dimension: annualrevenue {
    type: number
    sql: ${TABLE}."annualrevenue" ;;
  }

  dimension: api_id__c {
    type: string
    sql: ${TABLE}."api_id__c" ;;
  }

  dimension: assigned_once_with_workflow__c {
    type: yesno
    sql: ${TABLE}."assigned_once_with_workflow__c" ;;
  }

  dimension: assigned_owner__c {
    type: string
    sql: ${TABLE}."assigned_owner__c" ;;
  }

  dimension: assigned_owner_id__c {
    type: string
    sql: ${TABLE}."assigned_owner_id__c" ;;
  }

  dimension: billingcity {
    type: string
    sql: ${TABLE}."billingcity" ;;
  }

  dimension: billingcountry {
    type: string
    sql: ${TABLE}."billingcountry" ;;
  }

  dimension: billingcountrycode {
    type: string
    sql: ${TABLE}."billingcountrycode" ;;
  }

  dimension: billinggeocodeaccuracy {
    type: string
    sql: ${TABLE}."billinggeocodeaccuracy" ;;
  }

  dimension: billinglatitude {
    type: number
    sql: ${TABLE}."billinglatitude" ;;
  }

  dimension: billinglongitude {
    type: number
    sql: ${TABLE}."billinglongitude" ;;
  }

  dimension: billingpostalcode {
    type: string
    sql: ${TABLE}."billingpostalcode" ;;
  }

  dimension: billingstate {
    type: string
    sql: ${TABLE}."billingstate" ;;
  }

  dimension: billingstatecode {
    type: string
    sql: ${TABLE}."billingstatecode" ;;
  }

  dimension: billingstreet {
    type: string
    sql: ${TABLE}."billingstreet" ;;
  }

  dimension_group: case_study_date__c {
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
    sql: ${TABLE}."case_study_date__c" ;;
  }

  dimension: case_study_link__c {
    type: string
    sql: ${TABLE}."case_study_link__c" ;;
  }

  dimension: cleaned_up_website__c {
    type: string
    sql: ${TABLE}."cleaned_up_website__c" ;;
  }

  dimension: commercial_rep__c {
    type: string
    sql: ${TABLE}."commercial_rep__c" ;;
  }

  dimension: company_type__c {
    type: string
    sql: ${TABLE}."company_type__c" ;;
  }

  dimension: cosize__c {
    type: string
    sql: ${TABLE}."cosize__c" ;;
  }

  dimension: createdbyid {
    type: string
    sql: ${TABLE}."createdbyid" ;;
  }

  dimension_group: createddate {
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
    sql: ${TABLE}."createddate" ;;
  }

  dimension: csm__c {
    type: string
    sql: ${TABLE}."csm__c" ;;
  }

  dimension: csm_auto_assigned__c {
    type: string
    sql: ${TABLE}."csm_auto_assigned__c" ;;
  }

  dimension: csm_id__c {
    type: string
    sql: ${TABLE}."csm_id__c" ;;
  }

  dimension: csm_override__c {
    type: string
    sql: ${TABLE}."csm_override__c" ;;
  }

  dimension: csm_territory__c {
    type: string
    sql: ${TABLE}."csm_territory__c" ;;
  }

  dimension: customer_churned__c {
    type: yesno
    sql: ${TABLE}."customer_churned__c" ;;
  }

  dimension: customer_segmentation_tier__c {
    type: string
    sql: ${TABLE}."customer_segmentation_tier__c" ;;
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
  }

  dimension: first_channel__c {
    type: string
    sql: ${TABLE}."first_channel__c" ;;
  }

  dimension: first_channel_detail__c {
    type: string
    sql: ${TABLE}."first_channel_detail__c" ;;
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
  }

  dimension: imported_industry__c {
    type: string
    sql: ${TABLE}."imported_industry__c" ;;
  }

  dimension: inbound_outbound__c {
    type: string
    sql: ${TABLE}."inbound_outbound__c" ;;
  }

  dimension: industry {
    type: string
    sql: ${TABLE}."industry" ;;
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
  }

  dimension: legal_right_for_case_studies__c {
    type: string
    sql: ${TABLE}."legal_right_for_case_studies__c" ;;
  }

  dimension: legal_right_to_use_name_logo__c {
    type: string
    sql: ${TABLE}."legal_right_to_use_name_logo__c" ;;
  }

  dimension: legally_agreed_to_joint_pr__c {
    type: string
    sql: ${TABLE}."legally_agreed_to_joint_pr__c" ;;
  }

  dimension: legally_agreed_to_pr__c {
    type: string
    sql: ${TABLE}."legally_agreed_to_pr__c" ;;
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

  dimension: mattermost_rep__c {
    type: string
    sql: ${TABLE}."mattermost_rep__c" ;;
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
  }

  dimension: name {
    type: string
    sql: ${TABLE}."name" ;;
  }

  dimension: named_account__c {
    type: yesno
    sql: ${TABLE}."named_account__c" ;;
  }

  dimension: named_account_tier__c {
    type: string
    sql: ${TABLE}."named_account_tier__c" ;;
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
  }

  dimension: netsuite_conn__account_overdue_balance__c {
    type: number
    sql: ${TABLE}."netsuite_conn__account_overdue_balance__c" ;;
  }

  dimension: netsuite_conn__celigo_update__c {
    type: yesno
    sql: ${TABLE}."netsuite_conn__celigo_update__c" ;;
  }

  dimension: netsuite_conn__channel_tier__c {
    type: string
    sql: ${TABLE}."netsuite_conn__channel_tier__c" ;;
  }

  dimension: netsuite_conn__credit_hold__c {
    type: string
    sql: ${TABLE}."netsuite_conn__credit_hold__c" ;;
  }

  dimension: netsuite_conn__credit_limit__c {
    type: number
    sql: ${TABLE}."netsuite_conn__credit_limit__c" ;;
  }

  dimension: netsuite_conn__days_overdue__c {
    type: number
    sql: ${TABLE}."netsuite_conn__days_overdue__c" ;;
  }

  dimension: netsuite_conn__netsuite_id__c {
    type: string
    sql: ${TABLE}."netsuite_conn__netsuite_id__c" ;;
  }

  dimension: netsuite_conn__netsuite_sync_err__c {
    type: string
    sql: ${TABLE}."netsuite_conn__netsuite_sync_err__c" ;;
  }

  dimension: netsuite_conn__push_to_netsuite__c {
    type: yesno
    sql: ${TABLE}."netsuite_conn__push_to_netsuite__c" ;;
  }

  dimension: netsuite_conn__pushed_from_opportunity__c {
    type: yesno
    sql: ${TABLE}."netsuite_conn__pushed_from_opportunity__c" ;;
  }

  dimension: netsuite_conn__sync_in_progress__c {
    type: yesno
    sql: ${TABLE}."netsuite_conn__sync_in_progress__c" ;;
  }

  dimension: netsuite_conn__unbilled_orders__c {
    type: number
    sql: ${TABLE}."netsuite_conn__unbilled_orders__c" ;;
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

  dimension: obsoleteregion__c {
    type: string
    sql: ${TABLE}."obsoleteregion__c" ;;
  }

  dimension: obsoleteterritory__c {
    type: string
    sql: ${TABLE}."obsoleteterritory__c" ;;
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
  }

  dimension: ownership {
    type: string
    sql: ${TABLE}."ownership" ;;
  }

  dimension: parent_s_parent_acount__c {
    type: string
    sql: ${TABLE}."parent_s_parent_acount__c" ;;
  }

  dimension: parentid {
    type: string
    sql: ${TABLE}."parentid" ;;
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
    type: string
    sql: ${TABLE}."sfid" ;;
  }

  dimension: shippingcity {
    type: string
    sql: ${TABLE}."shippingcity" ;;
  }

  dimension: shippingcountry {
    type: string
    sql: ${TABLE}."shippingcountry" ;;
  }

  dimension: shippingcountrycode {
    type: string
    sql: ${TABLE}."shippingcountrycode" ;;
  }

  dimension: shippinggeocodeaccuracy {
    type: string
    sql: ${TABLE}."shippinggeocodeaccuracy" ;;
  }

  dimension: shippinglatitude {
    type: number
    sql: ${TABLE}."shippinglatitude" ;;
  }

  dimension: shippinglongitude {
    type: number
    sql: ${TABLE}."shippinglongitude" ;;
  }

  dimension: shippingpostalcode {
    type: string
    sql: ${TABLE}."shippingpostalcode" ;;
  }

  dimension: shippingstate {
    type: string
    sql: ${TABLE}."shippingstate" ;;
  }

  dimension: shippingstatecode {
    type: string
    sql: ${TABLE}."shippingstatecode" ;;
  }

  dimension: shippingstreet {
    type: string
    sql: ${TABLE}."shippingstreet" ;;
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
  }

  dimension: territory__c {
    type: string
    sql: ${TABLE}."territory__c" ;;
  }

  dimension: territoryid__c {
    type: string
    sql: ${TABLE}."territoryid__c" ;;
  }

  dimension: testimonial1_from__c {
    type: string
    sql: ${TABLE}."testimonial1_from__c" ;;
  }

  dimension: testimonial_1__c {
    type: string
    sql: ${TABLE}."testimonial_1__c" ;;
  }

  dimension: testimonial_2__c {
    type: string
    sql: ${TABLE}."testimonial_2__c" ;;
  }

  dimension: testimonial_2_from__c {
    type: string
    sql: ${TABLE}."testimonial_2_from__c" ;;
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

  dimension: zendesk__create_in_zendesk__c {
    type: yesno
    sql: ${TABLE}."zendesk__create_in_zendesk__c" ;;
  }

  dimension: zendesk__createdupdatedflag__c {
    type: yesno
    sql: ${TABLE}."zendesk__createdupdatedflag__c" ;;
  }

  dimension: zendesk__domain_mapping__c {
    type: string
    sql: ${TABLE}."zendesk__domain_mapping__c" ;;
  }

  dimension_group: zendesk__last_sync_date__c {
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
    sql: ${TABLE}."zendesk__last_sync_date__c" ;;
  }

  dimension: zendesk__last_sync_status__c {
    type: string
    sql: ${TABLE}."zendesk__last_sync_status__c" ;;
  }

  dimension: zendesk__notes__c {
    type: string
    sql: ${TABLE}."zendesk__notes__c" ;;
  }

  dimension: zendesk__result__c {
    type: string
    sql: ${TABLE}."zendesk__result__c" ;;
  }

  dimension: zendesk__tags__c {
    type: string
    sql: ${TABLE}."zendesk__tags__c" ;;
  }

  dimension: zendesk__zendesk_oldtags__c {
    type: string
    sql: ${TABLE}."zendesk__zendesk_oldtags__c" ;;
  }

  dimension: zendesk__zendesk_organization__c {
    type: string
    sql: ${TABLE}."zendesk__zendesk_organization__c" ;;
  }

  dimension: zendesk__zendesk_organization_id__c {
    type: string
    sql: ${TABLE}."zendesk__zendesk_organization_id__c" ;;
  }

  dimension: zendesk__zendesk_outofsync__c {
    type: yesno
    sql: ${TABLE}."zendesk__zendesk_outofsync__c" ;;
  }

  measure: count {
    type: count
    drill_fields: [account_id_18_digit__c, name]
  }
}
