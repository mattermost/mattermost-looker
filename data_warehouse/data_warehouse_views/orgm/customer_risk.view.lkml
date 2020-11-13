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

  dimension: account_name {
    hidden: yes
    label: "Account Name"
    description: "Salesforce Account Name"
    type: string
    link: {
      label: "Salesforce Account"
      url: "@{salesforce_link}{{account}}"
      icon_url: "https://mattermost.my.salesforce.com/favicon.ico"
    }
    sql: ${account.name} ;;
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

  dimension: contraction {
    label: "Contraction?"
    type: string
    sql: ${TABLE}."CONTRACTION__C" ;;
  }

  dimension: createdbyid {
    hidden: yes
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
    label: "Customer Risk Name"
    type: string
    link: {
      label: "Salesforce Customer Risk"
      # BP: Leverage constants to enable more reused
      url: "@{salesforce_link}{{sfid}}"
      icon_url: "https://mattermost.my.salesforce.com/favicon.ico"
    }
    sql: ${TABLE}."NAME" ;;
  }

  dimension: next_step {
    type: string
    sql: ${TABLE}."NEXT_STEP__C" ;;
  }

  dimension: of_seats_licensed {
    label: "# of Seats Licensed"
    type: number
    sql: ${TABLE}."OF_SEATS_LICENSED__C" ;;
  }

  dimension: opportunity {
    hidden: yes
    type: string
    sql: ${TABLE}."OPPORTUNITY__C" ;;
  }

  dimension: opportunity_name {
    type: string
    sql: ${opportunity.name} ;;
    drill_fields: [opportunity_name]
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

  dimension: risk_assigned {
    label: "Risk Assigned?"
    sql: ${status} NOT IN ('Renewed', 'Churned', 'Risk Resolved');;
    type: yesno
  }

  dimension_group: delayed {
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
    sql: CAST(${TABLE}."DELAYED_DATE__C" AS TIMESTAMP_NTZ) ;;
  }

  dimension_group: risk_resolved {
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
    sql: CAST(${TABLE}."RISK_RESOLVED_DATE__C" AS TIMESTAMP_NTZ) ;;
  }

  dimension: seats_at_risk {
    type: number
    sql: ${TABLE}."SEATS_AT_RISK__C" ;;
  }

  dimension: secondary_reason {
    type: string
    sql: ${TABLE}."SECONDARY_REASON__C" ;;
  }

  dimension: sfid {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}."SFID" ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}."STATUS__C" ;;
    drill_fields: [opportunity_name]
  }

  dimension: status_short {
    sql: CASE
         WHEN ${status} = 'At Risk' THEN 'AR'
         WHEN ${status} = 'Early Warning' THEN 'EW'
         WHEN ${status} = 'Delayed' THEN 'D'
         ELSE '' END;;
    type: string
    label: "Renewal Risk Status (Short)"
    group_label: "Renewals"
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
    label: "Engagement"
    type: string
    sql: ${TABLE}."TYPE__C" ;;
  }

  measure: total_renewal_at_risk_amount {
    label: "Total At Risk Amount"
    group_label: "Total Amounts"
    sql: ${risk_amount} ;;
    filters: [status: "At Risk"]
    type: sum_distinct
    sql_distinct_key: ${sfid} ;;
    value_format_name: mm_usd_short
    drill_fields: [name,  status, risk_amount, seats_at_risk, seats_at_risk]
  }

  measure: total_renewal_early_warning_amount {
    label: "Total Early Warning Amount"
    group_label: "Total Amounts"
    sql: ${risk_amount} ;;
    filters: [status: "Early Warning"]
    type: sum_distinct
    sql_distinct_key: ${sfid} ;;
    value_format_name: mm_usd_short
    drill_fields: [name,  status, risk_amount, seats_at_risk, seats_at_risk]
  }

  measure: total_delayed_amount {
    label: "Total Delayed Amount"
    group_label: "Total Amounts"
    sql: ${risk_amount} ;;
    filters: [status: "Delayed"]
    type: sum_distinct
    sql_distinct_key: ${sfid} ;;
    value_format_name: mm_usd_short
    drill_fields: [name,  status, risk_amount, seats_at_risk, seats_at_risk]
  }

  measure: total_risk_amount {
    # description: "TODO"
    group_label: "Total Amounts"
    sql: ${risk_amount};;
    type: sum_distinct
    sql_distinct_key: ${sfid} ;;
    value_format_name: mm_usd_short
    drill_fields: [name,  status, risk_amount, seats_at_risk, seats_at_risk]
  }

  measure: total_renewal_at_risk_seat_risk {
    label: "Total At Risk Seat Risk"
    group_label: "Total Seat Risk"
    sql: ${seats_at_risk} ;;
    filters: [status: "At Risk"]
    type: sum_distinct
    sql_distinct_key: ${sfid} ;;
    drill_fields: [name,  status, risk_amount, seats_at_risk, seats_at_risk]
  }

  measure: total_renewal_early_warning_seat_risk {
    label: "Total Early Warning Seat Risk"
    group_label: "Total Seat Risk"
    sql: ${seats_at_risk} ;;
    filters: [status: "Early Warning"]
    type: sum_distinct
    sql_distinct_key: ${sfid} ;;
    drill_fields: [name,  status, risk_amount, seats_at_risk, seats_at_risk]
  }

  measure: total_delayed_seat_risk {
    label: "Total Delayed Seat Risk"
    group_label: "Total Seat Risk"
    sql: ${seats_at_risk} ;;
    filters: [status: "Delayed"]
    type: sum_distinct
    sql_distinct_key: ${sfid} ;;
    drill_fields: [name,  status, risk_amount, seats_at_risk, seats_at_risk]
  }

  measure: total_seat_risk {
    # description: "TODO"
    group_label: "Total Seat Risk"
    sql: ${seats_at_risk};;
    type: sum_distinct
    sql_distinct_key: ${sfid} ;;
    drill_fields: [name,  status, risk_amount, seats_at_risk, seats_at_risk]
  }

  measure: count {
    label: "# of Customer Risks"
    type: count
    drill_fields: [name,  status, risk_amount, seats_at_risk, seats_at_risk]
  }
}
