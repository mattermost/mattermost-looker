view: contract {
  sql_table_name: "ORGM"."CONTRACT"
    ;;
  drill_fields: [id]

  dimension: id {
    hidden: yes
    type: number
    sql: ${TABLE}."ID" ;;
  }

  dimension: acceptance {
    type: string
    sql: ${TABLE}."ACCEPTANCE__C" ;;
  }

  dimension: accountid {
    hidden: yes
    type: string
    sql: ${TABLE}."ACCOUNTID" ;;
  }

  dimension: activatedbyid {
    hidden: yes
    type: string
    sql: ${TABLE}."ACTIVATEDBYID" ;;
  }

  dimension_group: activated {
    type: time
    timeframes: [
      date,
      month,
      fiscal_quarter,
      fiscal_year
    ]
    sql: CAST(${TABLE}."ACTIVATEDDATE" AS TIMESTAMP_NTZ) ;;
  }

  dimension: agreement_status {
    type: string
    sql: ${TABLE}."AGREEMENT_STATUS__C" ;;
  }

  dimension: agreement_type {
    type: string
    sql: ${TABLE}."AGREEMENT_TYPE__C" ;;
  }

  dimension: assignment {
    type: string
    sql: ${TABLE}."ASSIGNMENT__C" ;;
  }

  dimension: audit_rights {
    type: string
    sql: ${TABLE}."AUDIT_RIGHTS__C" ;;
  }

  dimension: auto_renewal {
    type: string
    sql: ${TABLE}."AUTO_RENEWAL__C" ;;
  }

  dimension: billing_city {
    type: string
    group_label: "Billing Address"
    sql: ${TABLE}."BILLINGCITY" ;;
  }

  dimension: billing_country {
    type: string
    group_label: "Billing Address"
    sql: ${TABLE}."BILLINGCOUNTRY" ;;
  }

  dimension: billing_country_code {
    type: string
    group_label: "Billing Address"
    sql: ${TABLE}."BILLINGCOUNTRYCODE" ;;
  }

  dimension: billing_postal_code {
    type: string
    group_label: "Billing Address"
    sql: ${TABLE}."BILLINGPOSTALCODE" ;;
  }

  dimension: billing_state {
    type: string
    group_label: "Billing Address"
    sql: ${TABLE}."BILLINGSTATE" ;;
  }

  dimension: billing_state_code {
    type: string
    group_label: "Billing Address"
    sql: ${TABLE}."BILLINGSTATECODE" ;;
  }

  dimension: billing_street {
    type: string
    group_label: "Billing Address"
    sql: ${TABLE}."BILLINGSTREET" ;;
  }

  dimension_group: company_signed {
    type: time
    timeframes: [
      date,
      month,
      fiscal_quarter,
      fiscal_year
    ]
    sql: CAST(${TABLE}."COMPANYSIGNEDDATE" AS TIMESTAMP_NTZ) ;;
  }

  dimension: company_signed_id {
    label: "Company Signed ID"
    type: string
    sql: ${TABLE}."COMPANYSIGNEDID" ;;
  }

  dimension: contract_opportunity {
    hidden: yes
    type: string
    sql: ${TABLE}."CONTRACT_OPPORTUNITY__C" ;;
  }

  dimension: opportunity_name {
    label: "Contract Opportunity"
    type: string
    sql: ${opportunity_contracts.name} ;;
  }

  dimension_group: contract_request {
    type: time
    timeframes: [
      date,
      month,
      fiscal_quarter,
      fiscal_year
    ]
    sql: CAST(${TABLE}."CONTRACT_REQUEST_DATE__C" AS TIMESTAMP_NTZ) ;;
  }

  dimension: contract_number {
    type: string
    sql: ${TABLE}."CONTRACTNUMBER" ;;
  }

  dimension: contract_term {
    type: number
    sql: ${TABLE}."CONTRACTTERM" ;;
  }

  dimension: createdbyid {
    hidden: yes
    type: string
    sql: ${TABLE}."CREATEDBYID" ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      date,
      month,
      fiscal_quarter,
      fiscal_year
    ]
    sql: CAST(${TABLE}."CREATEDDATE" AS TIMESTAMP_NTZ) ;;
  }

  dimension_group: customer_signed {
    type: time
    timeframes: [
      date,
      month,
      fiscal_quarter,
      fiscal_year
    ]
    sql: CAST(${TABLE}."CUSTOMERSIGNEDDATE" AS TIMESTAMP_NTZ) ;;
  }

  dimension: customer_signed_id {
    label: "Customer Signed ID"
    type: string
    sql: ${TABLE}."CUSTOMERSIGNEDID" ;;
  }

  dimension: customer_signed_title {
    type: string
    sql: ${TABLE}."CUSTOMERSIGNEDTITLE" ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}."DESCRIPTION" ;;
  }

  dimension: discount_e10 {
    type: string
    sql: ${TABLE}."DISCOUNT_E10__C" ;;
  }

  dimension: discount_e20 {
    type: string
    sql: ${TABLE}."DISCOUNT_E20__C" ;;
  }

  dimension: discount_percent_offered {
    type: number
    sql: ${TABLE}."DISCOUNT_PERCENT_OFERED__C" ;;
  }

  dimension: early_termination {
    type: string
    sql: ${TABLE}."EARLY_TERMINATION__C" ;;
  }

  dimension: end_customer {
    type: string
    sql: ${TABLE}."END_CUSTOMER__C" ;;
  }

  dimension_group: end {
    type: time
    timeframes: [
      date,
      month,
      fiscal_quarter,
      fiscal_year
    ]
    sql: CAST(${TABLE}."ENDDATE" AS TIMESTAMP_NTZ) ;;
  }

  dimension: exceptions_to_waiver_of_indirect_damage {
    type: string
    sql: ${TABLE}."EXCEPTIONS_TO_WAIVER_OF_INDIRECT_DAMAGE__C" ;;
  }

  dimension: excluded_customers {
    type: string
    sql: ${TABLE}."EXCLUDED_CUSTOMERS__C" ;;
  }

  dimension: fee_caps {
    type: string
    sql: ${TABLE}."FEE_CAPS__C" ;;
  }

  dimension: feedback_provision {
    type: string
    sql: ${TABLE}."FEEDBACK_PROVISION__C" ;;
  }

  dimension: geo {
    type: string
    sql: ${TABLE}."GEO__C" ;;
  }

  dimension: governing_law {
    type: string
    sql: ${TABLE}."GOVERNING_LAW__C" ;;
  }

  dimension: isdeleted {
    type: yesno
    sql: ${TABLE}."ISDELETED" ;;
  }

  dimension_group: last_status_change {
    type: time
    timeframes: [
      date,
      month,
      fiscal_quarter,
      fiscal_year
    ]
    sql: CAST(${TABLE}."LAST_STATUS_CHANGE__C" AS TIMESTAMP_NTZ) ;;
  }

  dimension_group: last_activity {
    hidden: yes
    type: time
    timeframes: [
      date,
      month,
      fiscal_quarter,
      fiscal_year
    ]
    sql: CAST(${TABLE}."LASTACTIVITYDATE" AS TIMESTAMP_NTZ) ;;
  }

  dimension: lastmodifiedbyid {
    hidden: yes
    type: string
    sql: ${TABLE}."LASTMODIFIEDBYID" ;;
  }

  dimension_group: last_modified {
    hidden: yes
    type: time
    timeframes: [
      date,
      month,
      fiscal_quarter,
      fiscal_year
    ]
    sql: CAST(${TABLE}."LASTMODIFIEDDATE" AS TIMESTAMP_NTZ) ;;
  }

  dimension: legal_counsel {
    type: string
    sql: ${TABLE}."LEGAL_COUNSEL__C" ;;
  }

  dimension: liability_cap_direct_damages {
    type: string
    sql: ${TABLE}."LIABILITY_CAP_DIRECT_DAMAGES__C" ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}."NAME" ;;
  }

  dimension: sfid {
    primary_key: yes
    label: "Contract SFID"
    type: string
    sql: ${TABLE}."SFID" ;;
  }

  dimension_group: systemmodstamp {
    type: time
    timeframes: [
      date,
      month,
      fiscal_quarter,
      fiscal_year
    ]
    sql: CAST(${TABLE}."SYSTEMMODSTAMP" AS TIMESTAMP_NTZ) ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name]
  }
}
