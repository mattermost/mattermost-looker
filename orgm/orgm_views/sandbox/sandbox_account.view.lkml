view: account {
  view_label: ""
  sql_table_name: sandbox.account ;;
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

  dimension: company_type {
    type: string
    sql: ${TABLE}."company_type__c" ;;
    label: "Company Type"
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

  dimension: g2k_rank {
    type: number
    sql: ${TABLE}."g2k_rank__c" ;;
  }

  dimension: geo {
    type: string
    sql: ${TABLE}."geo__c" ;;
  }

  dimension: government {
    type: yesno
    sql: ${TABLE}."government__c" ;;
  }

  dimension: id {
    type: number
    sql: ${TABLE}."id" ;;
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

  dimension: numberofemployees {
    type: number
    sql: ${TABLE}."numberofemployees" ;;
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

  dimension: type {
    type: string
    sql: ${TABLE}."type" ;;
    label: "Account Type"
  }

  dimension: website {
    type: string
    sql: ${TABLE}."website" ;;
    label: "Website"
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
}
