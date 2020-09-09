view: customer_risk {
  sql_table_name: "ORGM"."CUSTOMER_RISK__C"
    ;;
  drill_fields: [id]

  dimension: id {
    hidden: yes
    type: number
    sql: ${TABLE}."ID" ;;
  }


  dimension: account {
    hidden: yes
    type: string
    sql: ${TABLE}."ACCOUNT__C" ;;
  }

  dimension: owner {
    hidden: yes
    type: string
    sql: ${TABLE}."ACCOUNT_OWNER__C" ;;
  }

  dimension: owner_name {
    label: "Account Owner"
    group_label: "Owners"
    type: string
    sql: ${customer_risk_owner.name} ;;
  }

  dimension: ce_owner {
    hidden: yes
    type: string
    sql: ${TABLE}."CE_OWNER__C" ;;
  }

  dimension: ce_owner_name {
    label: "CE Owner"
    group_label: "Owners"
    type: string
    sql:${customer_risk_ce.name}  ;;
  }

  dimension: csm_owner {
    hidden: yes
    type: string
    sql: ${TABLE}."CSM_OWNER__C" ;;
  }

  dimension: csm_owner_name {
    label: "CSM Owner"
    group_label: "Owners"
    type: string
    sql:${customer_risk_csm.name}  ;;
  }

  dimension: key_contact {
    hidden: yes
    type: string
    sql: ${TABLE}.key_contact__c ;;
  }

  dimension: contact_name {
    label: "Key Contact"
    group_label: "Owners"
    type: string
    sql: ${customer_risk_contact.name} ;;
  }

  dimension: additional_details {
    type: string
    sql: ${TABLE}."ADDITIONAL_DETAILS__C" ;;
  }

  dimension_group: at_risk {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      fiscal_quarter,
      fiscal_year
    ]
    sql: CAST(${TABLE}."AT_RISK_DATE__C" AS TIMESTAMP_NTZ) ;;
  }


  dimension_group: churned {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      fiscal_quarter,
      fiscal_year
    ]
    sql: CAST(${TABLE}."CHURNED_DATE__C" AS TIMESTAMP_NTZ) ;;
  }

  dimension: competitor {
    type: string
    sql: ${TABLE}."COMPETITOR__C" ;;
  }

  dimension: createdbyid {
    type: string
    sql: ${TABLE}."CREATEDBYID" ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      fiscal_quarter,
      fiscal_year
    ]
    sql: CAST(${TABLE}."CREATEDDATE" AS TIMESTAMP_NTZ) ;;
  }


  dimension: current_arr {
    type: number
    sql: ${TABLE}."CURRENT_ARR__C" ;;
  }

  dimension_group: early_warning {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      fiscal_quarter,
      fiscal_year
    ]
    sql: CAST(${TABLE}."EARLY_WARNING_DATE__C" AS TIMESTAMP_NTZ) ;;
  }

  dimension: isdeleted {
    hidden: yes
    type: yesno
    sql: ${TABLE}."ISDELETED" ;;
  }

  dimension: lastmodifiedbyid {
    hidden: yes
    type: string
    sql: ${TABLE}."LASTMODIFIEDBYID" ;;
  }

  dimension_group: lastmodified {
    hidden: yes
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      fiscal_quarter,
      fiscal_year
    ]
    sql: CAST(${TABLE}."LASTMODIFIEDDATE" AS TIMESTAMP_NTZ) ;;
  }

  dimension: name {
    label: "Risk Name"
    type: string
    sql: ${TABLE}."NAME" ;;
  }

  dimension: next_step {
    type: string
    sql: ${TABLE}."NEXT_STEP__C" ;;
  }

  dimension: of_seats_licensed {
    type: number
    sql: ${TABLE}."OF_SEATS_LICENSED__C" ;;
  }

  dimension: opportunity {
    type: string
    sql: ${TABLE}."OPPORTUNITY__C" ;;
  }

  dimension: reason {
    type: string
    sql: ${TABLE}."REASON__C" ;;
  }

  dimension_group: renewed {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      fiscal_quarter,
      fiscal_year
    ]
    sql: CAST(${TABLE}."RENEWED_DATE__C" AS TIMESTAMP_NTZ) ;;
  }

  dimension: risk_amount {
    type: number
    sql: ${TABLE}."RISK_AMOUNT__C" ;;
  }

  dimension: seats_at_risk {
    type: number
    sql: ${TABLE}."SEATS_AT_RISK__C" ;;
  }

  dimension: sfid {
    primary_key: yes
    type: string
    sql: ${TABLE}."SFID" ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}."STATUS__C" ;;
  }

  dimension_group: systemmodstamp {
    hidden: yes
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      fiscal_quarter,
      fiscal_year
    ]
    sql: CAST(${TABLE}."SYSTEMMODSTAMP" AS TIMESTAMP_NTZ) ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}."TYPE__C" ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name]
  }
}
