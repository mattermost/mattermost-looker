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

  dimension: dwh_external_id {
    type: string
    sql: ${TABLE}."dwh_external_id__c" ;;
    group_label: "System"
    label: "DWH External ID"
  }

  dimension: account_number {
    type: string
    sql: ${TABLE}."account_number__c" ;;
    label: "Account #"
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

  dimension: case_study_date {
    sql: ${TABLE}."case_study_date__c" ;;
    group_label: "Marketing"
    label: "Case Study"
  }

  dimension: case_study_link {
    type: string
    sql: ${TABLE}."case_study_link__c" ;;
    group_label: "Marketing"
  }

  dimension: company_type {
    type: string
    sql: ${TABLE}."company_type__c" ;;
    label: "Company Type"
  }

  dimension: cosize {
    #     TBD TO REMOVE
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

  dimension_group: created {
    type: time
    timeframes: [
      time,
      date
    ]
    sql: ${TABLE}."createddate" ;;
    label: "Create Date"
  }

  dimension: csm_lookup {
    group_label: "CS"
    label: "CSM Owner"
    sql: ${TABLE}.csm_lookup__c ;;
    type: string
  }

  dimension: csm_name {
    group_label: "Owners"
    label: "CSM Name"
    sql: ${account_csm.name};;
    type: string
  }

  dimension: csm_enriched_region {
    label: "CSM Enriched Region"
    sql: CASE
              WHEN ${csm_lookup} = '0051R00000I5RZBQA3' THEN 'EMEA'
              WHEN ${csm_lookup} = '0051R00000GnXMsQAN' THEN 'East'
              WHEN ${csm_lookup} = '00536000009uaDQAAY' THEN 'West/APAC'
              WHEN ${csm_lookup} = '0051R00000HTEzFQAX' THEN 'Global Self-Service'
              WHEN ${csm_lookup} = '0051R00000GndedQAB' THEN 'Fed'
              ELSE NULL END ;;
    type: string
  }

  dimension: current_arr {
    type: number
    sql: ${TABLE}."arr_current__c" ;;
    label: "Current ARR"
    value_format_name: "usd_0"
  }

  dimension: customer_segmentation_tier {
    type: string
    sql: ${TABLE}."customer_segmentation_tier__c" ;;
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
    sql: ${TABLE}."demo_req_date__c" ;;
  }



  dimension: description {
    type: string
    sql: ${TABLE}."description" ;;
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
    sql: ${TABLE}."e_purchase_date__c" ;;
  }

  dimension: fax {
    type: string
    sql: ${TABLE}."fax" ;;
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
    sql: ${TABLE}."first_created_date__c" ;;
  }

  dimension: first_lead {
    type: string
    sql: ${TABLE}."first_lead__c" ;;
  }

  dimension: first_lead_round_robin_id {
    type: number
    value_format_name: id
    sql: ${TABLE}."first_lead_round_robin_id__c" ;;
  }

  dimension: first_offer {
    type: string
    sql: ${TABLE}."first_offer__c" ;;
  }

  dimension: first_offer_detail {
    type: string
    sql: ${TABLE}."first_offer_detail__c" ;;
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
    sql: ${TABLE}."followup_date__c" ;;
  }



  dimension: g2k_rank {
    type: number
    sql: ${TABLE}."g2k_rank__c" ;;
  }

  dimension: geo {
    type: string
    sql: ${TABLE}."geo__c" ;;
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
    sql: ${TABLE}."getstarteddate__c" ;;
  }

  dimension: government {
    type: yesno
    sql: ${TABLE}."government__c" ;;
  }

  dimension: id {
    type: number
    sql: ${TABLE}."id" ;;
  }

  dimension: imported_case_study_note {
    type: string
    sql: ${TABLE}."imported_case_study_note__c" ;;
    group_label: "Imported"
    label: "Case Study Note"
  }

  dimension: imported_industry {
    type: string
    sql: ${TABLE}."imported_industry__c" ;;
    group_label: "Imported"
    label: "Industry"
  }

  dimension: inbound_outbound {
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
    sql: ${TABLE}."lead_created_date__c" ;;
  }


  dimension: masterrecordid {
    type: string
    sql: ${TABLE}."masterrecordid" ;;
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
    sql: ${TABLE}."meetingset_date__c" ;;
  }



  dimension: name {
    description: "Name of account that opportunity is linked to Salesforce"
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
    sql: ${TABLE}."named_account__c" ;;
    label: "Named Account"
  }

  dimension: named_account_tier {
    type: string
    sql: ${TABLE}."named_account_tier__c" ;;
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
    sql: ${TABLE}."nda_expiration_date__c" ;;
  }

  dimension: netsuite_conn__account_balance {
    type: number
    sql: ${TABLE}."netsuite_conn__account_balance__c" ;;
    group_label: "Netsuite"
  }

  dimension: netsuite_conn__account_overdue_balance {
    type: number
    sql: ${TABLE}."netsuite_conn__account_overdue_balance__c" ;;
    group_label: "Netsuite"
  }

  dimension: netsuite_conn__celigo_update {
    type: yesno
    sql: ${TABLE}."netsuite_conn__celigo_update__c" ;;
    group_label: "Netsuite"
  }

  dimension: netsuite_conn__channel_tier {
    type: string
    sql: ${TABLE}."netsuite_conn__channel_tier__c" ;;
    group_label: "Netsuite"
  }

  dimension: netsuite_conn__credit_hold {
    type: string
    sql: ${TABLE}."netsuite_conn__credit_hold__c" ;;
    group_label: "Netsuite"
  }

  dimension: netsuite_conn__credit_limit {
    type: number
    sql: ${TABLE}."netsuite_conn__credit_limit__c" ;;
    group_label: "Netsuite"
  }

  dimension: netsuite_conn__days_overdue {
    type: number
    sql: ${TABLE}."netsuite_conn__days_overdue__c" ;;
    group_label: "Netsuite"
  }

  dimension: netsuite_conn__netsuite_id {
    type: string
    sql: ${TABLE}."netsuite_conn__netsuite_id__c" ;;
    group_label: "Netsuite"
  }

  dimension: netsuite_conn__netsuite_sync_err {
    type: string
    sql: ${TABLE}."netsuite_conn__netsuite_sync_err__c" ;;
    group_label: "Netsuite"
  }

  dimension: netsuite_conn__push_to_netsuite {
    type: yesno
    sql: ${TABLE}."netsuite_conn__push_to_netsuite__c" ;;
    group_label: "Netsuite"
  }

  dimension: netsuite_conn__pushed_from_opportunity {
    type: yesno
    sql: ${TABLE}."netsuite_conn__pushed_from_opportunity__c" ;;
    group_label: "Netsuite"
  }

  dimension: netsuite_conn__sync_in_progress {
    type: yesno
    sql: ${TABLE}."netsuite_conn__sync_in_progress__c" ;;
    group_label: "Netsuite"
  }

  dimension: netsuite_conn__unbilled_orders {
    type: number
    sql: ${TABLE}."netsuite_conn__unbilled_orders__c" ;;
    group_label: "Netsuite"
  }

  dimension: numberofemployees {
    type: number
    sql: ${TABLE}."numberofemployees" ;;
  }

  dimension: offer {
    type: string
    sql: ${TABLE}."offer__c" ;;
  }

  dimension: offer_detail {
    type: string
    sql: ${TABLE}."offer_detail__c" ;;
  }

  dimension: other_customer_marketing_comment {
    type: string
    sql: ${TABLE}."other_customer_marketing_comment__c" ;;
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
    sql: ${TABLE}."pre_release_sign_up_date__c" ;;
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
    sql: ${TABLE}."putintonurture_date__c" ;;
  }

  dimension: rating {
    type: string
    sql: ${TABLE}."rating" ;;
  }

  dimension: region {
  #     TBD TO REMOVE
    type: string
    sql: ${TABLE}."region__c" ;;
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
    sql: ${TABLE}."request_a_quote_date__c" ;;
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
    sql: ${TABLE}."responded_date__c" ;;
  }

  dimension: sector {
    type: string
    sql: ${TABLE}."sector__c" ;;
  }

  dimension: sfid {
    primary_key: yes
    type: string
    sql: ${TABLE}."sfid" ;;
    group_label: "System"
    label: "Account SFID"
    link: {
      label: "Salesforce Account"
      # BP: Leverage constants to enable more reused
      url: "@{salesforce_link}{{sfid}}"
    }
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

  dimension: sicdesc {
    type: string
    sql: ${TABLE}."sicdesc" ;;
  }

  dimension: signed_nda {
    type: yesno
    sql: ${TABLE}."signed_nda__c" ;;
  }

  dimension: site {
    type: string
    sql: ${TABLE}."site" ;;
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



  dimension: territory_geo {
    type: string
    sql: ${TABLE}."territory_geo__c" ;;
    group_label: "Territory"
    label: "Territory Geo"
  }

  dimension: territory_area {
    type: string
    sql: ${TABLE}."territory_area__c" ;;
    group_label: "Territory"
    label: "Territory Area"
  }

  dimension: territory_region {
    type: string
    sql: ${TABLE}."territory_region__c" ;;
    group_label: "Territory"
    label: "Territory Region"
  }

  dimension: territory_ent_rep {
    type: string
    sql: ${TABLE}."territory_ent_rep__c" ;;
    group_label: "Territory"
    label: "Territory Ent Rep"
  }

  dimension: territory_comm_rep {
    type: string
    sql: ${TABLE}."territory_comm_rep__c" ;;
    group_label: "Territory"
    label: "Territory Comm Rep"
  }

  dimension: territory_last_updated {
    type: string
    sql: ${TABLE}."territory_last_updated__c" ;;
    group_label: "Territory"
    label: "Territory Last Updated"
  }


  dimension: testimonial1_from {
    type: string
    sql: ${TABLE}."testimonial1_from__c" ;;
    group_label: "Marketing"
  }

  dimension: testimonial_1 {
    type: string
    sql: ${TABLE}."testimonial_1__c" ;;
    group_label: "Marketing"
  }

  dimension: testimonial_2 {
    type: string
    sql: ${TABLE}."testimonial_2__c" ;;
    group_label: "Marketing"
  }

  dimension: testimonial_2_from {
    type: string
    sql: ${TABLE}."testimonial_2_from__c" ;;
    group_label: "Marketing"
  }

  dimension: tickersymbol {
    type: string
    sql: ${TABLE}."tickersymbol" ;;
  }

  dimension: total_sales {
    type: number
    sql: ${TABLE}."total_sales__c" ;;
  }

  dimension: total_seats {
    type: string
    sql: ${TABLE}."total_seats__c" ;;
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
    sql: ${TABLE}."trial_req_date__c" ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}."type" ;;
    label: "Account Type"
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
    sql: ${TABLE}."unqualified_date__c" ;;
  }

  dimension: website {
    type: string
    sql: ${TABLE}."website" ;;
    label: "Website"
  }

  dimension: website_domain {
    type: string
    sql: ${TABLE}."cbit__clearbitdomain__c" ;;
    label: "Website Domain"
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

  measure: vendor_count {
    description: "The distinct count of 'Vendor' Account Types."
    type: count_distinct
    sql: ${sfid} ;;
    filters: [type: "Vendor"]
  }

  measure: prospect_partner_count {
    description: "The distinct count of 'Prospect Partner' Account Types."
    type: count_distinct
    sql: ${sfid} ;;
    filters: [type: "Prospect Partner"]
  }

  measure: prospect_count {
    description: "The distinct count of 'Prospect' Account Types."
    type: count_distinct
    sql: ${sfid} ;;
    filters: [type: "Prospect"]
  }

  measure: partner_count {
    description: "The distinct count of 'Partner' Account Types."
    type: count_distinct
    sql: ${sfid} ;;
    filters: [type: "Partner"]
  }

  measure: customer_count {
    description: "The distinct count of 'Customer' Account Types."
    type: count_distinct
    sql: ${sfid} ;;
    filters: [type: "Customer"]
  }


}
