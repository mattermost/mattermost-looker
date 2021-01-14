view: customer_onboarding {
  sql_table_name: "ORGM"."CUSTOMER_ONBOARDING__C"
    ;;
  drill_fields: [id]

  dimension: id {
    hidden: yes
    type: number
    sql: ${TABLE}."ID" ;;
  }

  dimension: account_name {
    hidden: yes
    type: string
    link: {
      label: "Salesforce Account"
      url: "@{salesforce_link}{{accountid}}"
      icon_url: "https://mattermost.my.salesforce.com/favicon.ico"
    }
    sql: ${account.name} ;;
  }


  dimension: accountid {
    type: string
    hidden: yes
    sql: ${TABLE}.account_name__c ;;
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
    sql: ${customer_onboarding_owner.name} ;;
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
    sql:${customer_onboarding_csm.name}  ;;
  }

  dimension: cse_owner {
    hidden: yes
    type: string
    sql: ${TABLE}."CSE_OWNER__C" ;;
  }

  dimension: cse_owner_name {
    label: "CSE Owner"
    group_label: "Owners"
    type: string
    sql: ${customer_onboarding_cse.name} ;;
  }

  dimension: primary_contact {
    hidden: yes
    type: string
    sql: ${TABLE}."PRIMARY_CONTACT__C" ;;
  }

  dimension: primary_contact_name {
    label: "Primary Contact"
    type: string
    sql:${customer_onboarding_primary_contact.name}  ;;
  }

  dimension: executive_sponsor {
    hidden: yes
    type: string
    sql: ${TABLE}."EXEC_SPONSOR__C" ;;
  }

  dimension: executive_sponsor_name {
    label: "Executive Sponsor"
    type: string
    sql:${customer_onboarding_executive_sponsor.name}  ;;
  }

  dimension: company_highlights {
    group_label: "Customer Journey"
    type: string
    sql: ${TABLE}."COMPANY_HIGHLIGHTS__C" ;;
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
      date,
      week,
      month,
      fiscal_quarter,
      fiscal_year
    ]
    sql: CAST(${TABLE}."CREATEDDATE" AS TIMESTAMP_NTZ) ;;
  }

  dimension: current_challenges {
    group_label: "Customer Journey"
    type: string
    sql: ${TABLE}."CURRENT_CHALLENGES__C" ;;
  }

  dimension: current_identity_provider_sso {
    label: "Current Identity Provider (SSO)"
    group_label: "Customer Journey"
    type: string
    sql: ${TABLE}."CURRENT_IDENTITY_PROVIDER_SSO__C" ;;
  }

  dimension: current_productivity_platform {
    group_label: "Customer Journey"
    type: string
    sql: ${TABLE}."CURRENT_PRODUCTIVITY_PLATFORM__C" ;;
  }

  dimension: data_migration_required {
    group_label: "Customer Journey"
    type: string
    sql: ${TABLE}."DATA_MIGRATION_REQUIRED__C"  ;;
  }

  dimension: database_type {
    group_label: "Customer Journey"
    type: string
    sql: ${TABLE}."DATABASE_TYPE__C" ;;
  }

  dimension: deployment_model {
    group_label: "Customer Journey"
    type: string
    sql: ${TABLE}."DEPLOYMENT_MODEL__C" ;;
  }

  dimension: emm_mdm {
    group_label: "Customer Journey"
    label: "EMM?MDM"
    type: string
    sql: ${TABLE}."EMM_MDM__C" ;;
  }

  dimension: existing_chat_solution {
    group_label: "Customer Journey"
    type: string
    sql: ${TABLE}."EXISTING_CHAT_SOLUTION__C" ;;
  }

  dimension: expansion_plan {
    type: string
    sql: ${TABLE}."EXPANSION_PLAN__C" ;;
  }

  dimension: infosec_questionnaire_completed {
    label: "INFOSEC Questionnaire Completed"
    group_label: "Customer Journey"
    type: string
    sql: ${TABLE}."INFOSEC_QUESTIONNAIRE_COMPLETED__C" ;;
  }

  dimension: integrations_enabled {
    group_label: "Adoption"
    type: string
    sql: ${TABLE}."INTEGRATIONS_ENABLED__C" ;;
  }

  dimension: isdeleted {
    hidden: yes
    type: yesno
    sql: ${TABLE}."ISDELETED" ;;
  }


  dimension: key_benefits {
    group_label: "Customer Journey"
    type: string
    sql: ${TABLE}."KEY_BENEFITS__C" ;;
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

  dimension: latest_telemetry_date {
    group_label: "Adoption"
    type: date
    sql: ${TABLE}."LATEST_TELEMETRY_DATE__C" ;;
  }

  dimension: license_key {
    type: string
    sql: ${TABLE}."LICENSE_KEY__C";;
  }

  dimension: load_balancer {
    group_label: "Customer Journey"
    type: string
    sql: ${TABLE}."LOAD_BALANCER__C" ;;
  }

  dimension: mobile_in_scope {
    group_label: "Customer Journey"
    type: string
    sql: ${TABLE}."MOBILE_IN_SCOPE__C" ;;
  }

  dimension: name {
    label: "Customer Onboarding Name"
    type: string
    link: {
      label: "Salesforce Onboarding"
      # BP: Leverage constants to enable more reused
      url: "@{salesforce_link}{{sfid}}"
      icon_url: "https://mattermost.my.salesforce.com/favicon.ico"
    }
    sql: ${TABLE}."NAME" ;;
  }

  dimension: number_of_plugins  {
    label: "# of Plugins"
    group_label: "Adoption"
    sql: ${TABLE}."OF_PLUGINS__C" ;;
  }

  dimension: number_of_seats_licensed {
    label: "# of Seats Licensed"
    group_label: "Adoption"
    type: number
    sql: ${TABLE}."OF_SEATS_LICENSED__C" ;;
  }

  dimension: number_of_webhooks {
    label: "# of Webhooks"
    group_label: "Adoption"
    sql: ${TABLE}."OF_WEBHOOKS__C" ;;
  }

  dimension: opportunity_name {
    hidden: yes
    type: string
    sql: ${TABLE}."OPPORTUNITY_NAME__C" ;;
  }

  dimension: other_integrations {
    group_label: "Adoption"
    type: string
    sql: ${TABLE}."OTHER_INTEGRATIONS__C" ;;
  }

  dimension: primary_objective {
    group_label: "Customer Journey"
    type: string
    sql: ${TABLE}."PRIMARY_OBJECTIVE__C" ;;
  }

  dimension: product {
    type: string
    sql: ${TABLE}."PRODUCT__C" ;;
  }

  dimension: seats_registered {
    group_label: "Adoption"
    type: number
    sql: ${TABLE}."SEATS_REGISTERED__C" ;;
  }

  dimension: regulatory_requirements {
    group_label: "Customer Journey"
    type: string
    sql: ${TABLE}."REGULATORY_REQUIREMENTS__C" ;;
  }

  dimension_group: renewal_date {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      fiscal_quarter,
      fiscal_year
    ]
    sql: CAST(${TABLE}."RENEWAL_DATE__C" AS TIMESTAMP_NTZ) ;;
  }


  dimension: seat_utilization {
    group_label: "Adoption"
    type: number
    sql: ${TABLE}."SEAT_UTILIZATION__C" ;;
  }

  dimension: seats_active_latest {
    description: "Daily Active Users"
    group_label: "Adoption"
    type: number
    sql: ${TABLE}."SEATS_ACTIVE_LATEST__C" ;;
  }

  dimension: seats_active_mau {
    group_label: "Adoption"
    type: number
    sql: ${TABLE}."SEATS_ACTIVE_MAU__C" ;;
  }

  dimension: seats_active_max {
    group_label: "Adoption"
    type: number
    sql: ${TABLE}."SEATS_ACTIVE_MAX__C" ;;
  }

  dimension: seats_active_override {
    group_label: "Adoption"
    type: yesno
    sql: ${TABLE}."SEATS_ACTIVE_OVERRIDE__C" ;;
  }

  dimension: server_version {
    group_label: "Adoption"
    type: number
    sql: ${TABLE}."SERVER_VERSION__C" ;;
  }

  dimension: sfid {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}."SFID" ;;
  }

  dimension: stage {
    type: string
    sql: ${TABLE}."STAGE__C" ;;
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
      quarter,
      year
    ]
    sql: CAST(${TABLE}."SYSTEMMODSTAMP" AS TIMESTAMP_NTZ) ;;
  }

  dimension: target_go_live_date {
    label: "Target Go-Live Date"
    type: date
    sql: ${TABLE}."TARGET_GO_LIVE_DATE__C";;
  }

  dimension: target_integrations {
    group_label: "Customer Journey"
    type: string
    sql: ${TABLE}."TARGET_INTEGRATIONS__C" ;;
  }

  dimension: usage_maturity {
    group_label: "Adoption"
    type: string
    sql: ${TABLE}."USAGE_MATURITY__C" ;;
  }

  dimension: usage_maturity_reason {
    group_label: "Adoption"
    type: string
    sql: ${TABLE}."USAGE_MATURITY_REASON__C" ;;
  }

  dimension: use_case {
    group_label: "Customer Journey"
    type: string
    sql: ${TABLE}."USER_CASE__C" ;;
  }

  measure: count {
    type: count_distinct
    sql: ${sfid} ;;
    drill_fields: [account_name, owner_name, csm_owner_name, use_case, stage, seat_utilization]
  }

  measure: total_number_of_plugins  {
    label: "# of Plugins"
    group_label: "Adoption"
    type: sum_distinct
    sql: ${number_of_plugins} ;;
  }

  measure: total_number_of_seats_licensed {
    label: "# of Seats Licensed"
    group_label: "Adoption"
    type: sum_distinct
    sql: ${number_of_seats_licensed} ;;
  }

  measure: total_number_of_webhooks {
    label: "# of Webhooks"
    group_label: "Adoption"
    type: sum_distinct
    sql: ${number_of_webhooks} ;;
  }

  measure: total_seats_registered {
    group_label: "Adoption"
    type: sum_distinct
    sql: ${seats_registered} ;;
  }

  measure: total_seat_utilization {
    group_label: "Adoption"
    type: number
    value_format_name: percent_2
    sql: ${total_seats_registered}/nullif(${total_number_of_seats_licensed},0) ;;
  }

  measure: total_seats_active_latest {
    description: "Daily Active Users"
    group_label: "Adoption"
    type: sum_distinct
    sql: ${seats_active_latest} ;;
  }

  measure: total_seats_active_mau {
    group_label: "Adoption"
    type: sum_distinct
    sql: ${seats_active_mau} ;;
  }

  measure: total_seats_active_max {
    group_label: "Adoption"
    type: sum_distinct
    sql: ${seats_active_max} ;;
  }
}
