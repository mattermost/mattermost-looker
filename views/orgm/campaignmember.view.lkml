view: campaignmember {
  view_label: "Campaign Member"
  sql_table_name: ORGM.CAMPAIGNMEMBER ;;


  #
  # Sets
  #


  #
  # Dimensions
  #

  dimension: account_type {
    sql: ${TABLE}.ACCOUNTTYPE__C ;;
    type: string
  }

  dimension: campaignid {
    # hidden: yes
    label: "Campaign ID"
    sql: ${TABLE}.CAMPAIGNID ;;
    type: string
  }

  dimension: city {
    sql: ${TABLE}.CITY ;;
    type: string
  }

  dimension: company_or_account {
    sql: ${TABLE}.COMPANYORACCOUNT ;;
    type: string
  }

  dimension: contactid {
    label: "Contact ID"
    sql: ${TABLE}.CONTACTID ;;
    type: string
  }


  dimension_group: contact_us_request {
    type: time
    label: "Contact Us Requested"
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${campaignmember_ext.contact_us_request}::timestamp;;
  }

  dimension: contact_us_notes {
    type: string
    sql: ${TABLE}.contact_us_notes__c ;;
  }

  dimension_group: trial_req {
   type: time
    label: "Trial Requested"
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${campaignmember_ext.trial_request}::timestamp;;
  }

  dimension_group: converted {
    sql: ${TABLE}.CONVERTED_DATE__C ;;
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

  dimension: cosize {
    sql: ${TABLE}.COSIZE__C ;;
    type: string
  }

  dimension: country {
    map_layer_name: countries
    sql: ${TABLE}.COUNTRY ;;
    type: string
  }

  dimension: createdbyid {
    label: "Created By ID"
    sql: ${TABLE}.CREATEDBYID ;;
    type: string
  }

  dimension_group: created {
    sql: ${TABLE}.CREATEDDATE ;;
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
    sql: ${TABLE}.DESCRIPTION ;;
    type: string
  }

  dimension: do_not_call {
    sql: ${TABLE}.DONOTCALL ;;
    type: yesno
  }

  dimension: email {
    sql: ${TABLE}.EMAIL ;;
    type: string
  }

  dimension_group: first_responded_on {
    sql: ${TABLE}.FIRST_RESPONDED_ON__C ;;
    timeframes: [
      date,
      week,
      month,
      quarter,
      fiscal_quarter,
      year,
      fiscal_year
    ]
    type: time
  }

  dimension: firstname {
    sql: ${TABLE}.FIRSTNAME ;;
    type: string
  }


  dimension: geo {
    sql: ${TABLE}.GEO__C ;;
    type: string
  }

  dimension: has_opted_out_of_email {
    sql: ${TABLE}.HASOPTEDOUTOFEMAIL ;;
    type: yesno
  }

  dimension: has_opted_out_of_fax {
    sql: ${TABLE}.HASOPTEDOUTOFFAX ;;
    type: yesno
  }

  dimension: has_responded {
    sql: ${TABLE}.HASRESPONDED ;;
    type: yesno
  }

  dimension: is_deleted {
    sql: ${TABLE}.ISDELETED ;;
    type: yesno
  }

  dimension: lastmodifiedbyid {
    label: "Last Modified By ID"
    sql: ${TABLE}.LASTMODIFIEDBYID ;;
    type: string
  }

  dimension_group: last_modified {
    sql: ${TABLE}.LASTMODIFIEDDATE ;;
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

  dimension: lastname {
    sql: ${TABLE}.LASTNAME ;;
    type: string
  }

  dimension: leadid {
    # hidden: yes
    label: "Lead ID"
    sql: ${TABLE}.LEADID ;;
    type: string
  }

  dimension: leadorcontactid {
    label: "Lead or Contact ID"
    sql: ${TABLE}.LEADORCONTACTID ;;
    type: string
  }

  dimension: leadorcontactownerid {
    label: "Lead or Contact Owener ID"
    sql: ${TABLE}.LEADORCONTACTOWNERID ;;
    type: string
  }

  dimension: lead_source {
    sql: ${TABLE}.LEADSOURCE ;;
    type: string
  }

  dimension: mobile_phone {
    sql: ${TABLE}.MOBILEPHONE ;;
    type: string
  }

  dimension: mql {
    label: "MQL"
    sql: ${TABLE}.MQL__C ;;
    type: yesno
  }

  dimension_group: mql {
    sql: ${TABLE}.MQL_DATE__C ;;
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
    sql: ${TABLE}.NAME ;;
    type: string
  }

  dimension: named_account {
    sql: ${TABLE}.NAMED_ACCOUNT__C ;;
    type: yesno
  }

  dimension: phone {
    sql: ${TABLE}.PHONE ;;
    type: string
  }

  dimension: postal_code {
    sql: ${TABLE}.POSTALCODE ;;
    type: string
  }

  dimension_group: pql {
    label: "PQL"
    sql: ${TABLE}.PQL_DATE__C ;;
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

  dimension: region {
    sql: ${TABLE}.REGION__C ;;
    type: string
  }

  dimension: senior_title {
    sql: ${TABLE}.SENIOR_TITLE__C ;;
    type: yesno
  }

  dimension: sfid {
    label: "Campaign Member ID"
    primary_key: yes
    sql: ${TABLE}.SFID ;;
    type: string
    link: {
      label: "Salesforce Campaign Member"
      # BP: Leverage constants to enable more reused
      url: "@{salesforce_link}{{sfid}}"
    }
  }

  dimension: state {
    sql: ${TABLE}.STATE ;;
    type: string
  }

  dimension: status {
    sql: ${TABLE}.STATUS ;;
    type: string
  }

  dimension: street {
    sql: ${TABLE}.STREET ;;
    type: string
  }

  dimension: technical_title {
    sql: ${TABLE}.TECHNICAL_TITLE__C ;;
    type: yesno
  }

  dimension: title {
    sql: ${TABLE}.TITLE ;;
    type: string
  }

  dimension: type {
    sql: ${TABLE}.TYPE ;;
    type: string
  }


  #
  # Measures
  #

  measure: count {
    drill_fields: [detail*]
    label: "# of Campaign Members"
    description: "# of trial requests, downloads, webinars, contact us, etc."
    type: count_distinct
    sql: ${sfid} ;;
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      lastname,
      firstname,
      name,
      lead.id,
      lead.name,
      lead.company,
      campaign.name,
      campaign.id
    ]
  }
}
