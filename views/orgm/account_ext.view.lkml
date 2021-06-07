view: account_ext {
  sql_table_name: "ORGM"."ACCOUNT_EXT"
    ;;

  dimension: account_sfid {
    type: string
    sql: ${TABLE}."ACCOUNT_SFID" ;;
    hidden: yes
  }

  dimension: additional_environment_details {
    group_label: "Customer Journey"
    type: string
    sql: ${TABLE}."ADDITIONAL_ENVIRONMENT_DETAILS";;
  }

  dimension: compelling_event {
    group_label: "Customer Journey"
    type: string
    sql: ${TABLE}."COMPELLING_EVENT";;
  }

  dimension: competitor {
    group_label: "Customer Journey"
    type: string
    sql: ${TABLE}."COMPETITOR" ;;
  }

  dimension: count_lost_oppt {
    group_label: "Opportunities"
    group_item_label: "Count Lost"
    label: "Count Lost Oppt"
    type: number
    sql: ${TABLE}."COUNT_LOST_OPPT" ;;
  }

  dimension: count_open_oppt {
    group_label: "Opportunities"
    group_item_label: "Count Open"
    label: "Count Open Oppt"
    type: number
    sql: ${TABLE}."COUNT_OPEN_OPPT" ;;
  }

  dimension: count_won_oppt {
    group_label: "Opportunities"
    group_item_label: "Count Won"
    label: "Count Won Oppt"
    type: number
    sql: ${TABLE}."COUNT_WON_OPPT" ;;
  }

  dimension: current_identity_provider_sso {
    group_label: "Customer Journey"
    label: "Current Identity Provider (SSO)"
    type: string
    sql: ${TABLE}."CURRENT_IDENTITIY_PROVIDER_SSO" ;;
  }

  dimension: current_productivity_platform {
     group_label: "Customer Journey"
    type: string
    sql: ${TABLE}."CURRENT_PRODUCTIVITY_PLATFORM" ;;
  }

  dimension: emm_mdm {
    group_label: "Customer Journey"
    label: "EMM/MDM"
    type: string
    sql: ${TABLE}."EMM_MDM" ;;
  }
  dimension: extended_support_release_customer {
    group_label: "Customer Journey"
    type: string
    sql: ${TABLE}."EXTENDED_SUPPORT_RELEASE_CUSTOMER" ;;
  }

  dimension: how_did_you_hear_about_mattermost {
    group_label: "Customer Journey"
    type: string
    sql: ${TABLE}."HOW_DID_YOU_HEAR_ABOUT_MATTERMOST" ;;
  }

  dimension: other_integrations {
    group_label: "Customer Journey"
    type: string
    sql: ${TABLE}."OTHER_INTEGRATIONS" ;;
  }

  dimension: regulatory_requirements {
    group_label: "Customer Journey"
    type: string
    sql: ${TABLE}."REGULATORY_REQUIREMENTS" ;;
  }

  dimension: sum_expansion_amount_won {
    group_label: "Amounts"
    group_item_label: "Expansion Won"
    type: number
    sql: ${TABLE}."SUM_EXPANSION_AMOUNT" ;;
  }

  dimension: sum_multi_amount_won {
    group_label: "Amounts"
    group_item_label: "Multi Won"
    type: number
    sql: ${TABLE}."SUM_MULTI_AMOUNT" ;;
  }

  dimension: sum_new_amount_won {
    group_label: "Amounts"
    group_item_label: "New Won"
    type: number
    sql: ${TABLE}."SUM_NEW_AMOUNT" ;;
  }

  dimension: sum_renewal_amount_won {
    group_label: "Amounts"
    group_item_label: "Renewal Won"
    type: number
    sql: ${TABLE}."SUM_RENEWAL_AMOUNT" ;;
  }

  dimension: sum_expansion_amount_open {
    group_label: "Amounts"
    group_item_label: "Expansion Open"
    type: number
    sql: ${TABLE}."SUM_EXPANSION_AMOUNT" ;;
  }

  dimension: sum_multi_amount_open {
    group_label: "Amounts"
    group_item_label: "Multi Open"
    type: number
    sql: ${TABLE}."SUM_MULTI_AMOUNT" ;;
  }

  dimension: sum_new_amount_open {
    group_label: "Amounts"
    group_item_label: "New Open"
    type: number
    sql: ${TABLE}."SUM_NEW_AMOUNT" ;;
  }

  dimension: sum_renewal_amount_open {
    group_label: "Amounts"
    group_item_label: "Renewal Open"
    type: number
    sql: ${TABLE}."SUM_RENEWAL_AMOUNT" ;;
  }

  dimension: sum_expansion_amount_lost {
    group_label: "Amounts"
    group_item_label: "Expansion Lost"
    type: number
    sql: ${TABLE}."SUM_EXPANSION_AMOUNT" ;;
  }

  dimension: sum_multi_amount_lost {
    group_label: "Amounts"
    group_item_label: "Multi Lost"
    type: number
    sql: ${TABLE}."SUM_MULTI_AMOUNT" ;;
  }

  dimension: sum_new_amount_lost {
    group_label: "Amounts"
    group_item_label: "New Lost"
    type: number
    sql: ${TABLE}."SUM_NEW_AMOUNT" ;;
  }

  dimension: sum_renewal_amount_lost {
    group_label: "Amounts"
    group_item_label: "Renewal Lost"
    type: number
    sql: ${TABLE}."SUM_RENEWAL_AMOUNT" ;;
  }

  dimension: target_integrations {
    group_label: "Customer Journey"
    type: string
    sql: ${TABLE}."TARGET_INTEGRATIONS" ;;
  }

  dimension: use_case {
    group_label: "Customer Journey"
    type: string
    sql: ${TABLE}."USE_CASE";;
  }

  dimension_group: min_close_won {
    sql: ${TABLE}.min_close_won_date ;;
    timeframes: [
      date,
      week,
      month,
      fiscal_quarter,
      fiscal_year
    ]
    type: time
  }
}
