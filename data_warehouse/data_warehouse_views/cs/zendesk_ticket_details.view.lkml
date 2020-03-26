view: zendesk_ticket_details {
  sql_table_name: "CS"."ZENDESK_TICKET_DETAILS"
    ;;

  dimension: account_sfid {
    hidden: yes
    type: string
    sql: ${TABLE}."ACCOUNT_SFID" ;;
  }

  dimension: name {
    description: "Name of account that opportunity is linked to Salesforce"
    label: "Account Name"
    link: {
      label: "Salesforce Account"
      # BP: Leverage constants to enable more reused
      url: "@{salesforce_link}{{account_sfid}}"
    }
    sql: ${account.name} ;;
    type: string
  }

  dimension: subject {
    type: string
    sql: ${TABLE}."RAW_SUBJECT" ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}."DESCRIPTION" ;;
  }

  dimension: assignee_name {
    type: string
    sql: ${TABLE}."ASSIGNEE_NAME" ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      date,
      week,
      month,
      fiscal_quarter,
      fiscal_year
    ]
    sql: ${TABLE}."CREATED_AT" ;;
  }

  dimension: created_on_date {
    hidden: yes
    type: yesno
    sql: ${created_date} = ${dates.date_date};;
  }

  dimension_group: solved_at {
    type: time
    timeframes: [
      date,
      week,
      month,
      fiscal_quarter,
      fiscal_year
    ]
    sql: ${TABLE}."SOLVED_AT" ;;
  }

  dimension: solved_at_on_date {
    hidden: yes
    type: yesno
    sql: ${solved_at_date} = ${dates.date_date};;
  }

  dimension: customer_type {
    type: string
    sql: ${TABLE}."CUSTOMER_TYPE" ;;
  }

  dimension: support_type {
    type: string
    sql: CASE
            WHEN ${premium_support} THEN 'Premium'
            WHEN ${enterprise_edition_version} = 'e20' THEN 'E20'
            WHEN ${enterprise_edition_version} = 'e10' THEN 'E10'
            ELSE 'Free' END
          ;;
  }

  dimension: support_type_category {
    type: string
    sql: CASE WHEN ${support_type} IN ('Premium','E20','E10') THEN 'Paid' ELSE 'Free' END
          ;;
  }

  dimension: enterprise_edition_version {
    type: string
    sql: ${TABLE}."ENTERPRISE_EDITION_VERSION" ;;
  }

  dimension: e20_customer_level_tier {
    label: "Level Tier"
    type: string
    sql: CASE
            WHEN ${TABLE}."E20_CUSTOMER_LEVEL_TIER" = 'level_1___critical_business_impact' THEN 'Level 1'
            WHEN ${TABLE}."E20_CUSTOMER_LEVEL_TIER" = 'level_2___major_business_impact' THEN 'Level 2'
            WHEN ${TABLE}."E20_CUSTOMER_LEVEL_TIER" = 'level_3___moderate_business_impact' THEN 'Level 3'
            WHEN ${TABLE}."E20_CUSTOMER_LEVEL_TIER" = 'level_4___minor_business_impact' THEN 'Level 4'
          ELSE 'No Level' END;;
  }

  dimension: first_response_sla {
    group_label: "SLAs"
    label: "First Response SLA (min)"
    type: number
    sql: CASE
            WHEN ${premium_support} AND ${e20_customer_level_tier} = 'Level 1' THEN 60
            WHEN ${premium_support} AND ${e20_customer_level_tier} = 'Level 2' THEN 120
            WHEN ${premium_support} AND ${e20_customer_level_tier} = 'Level 3' THEN 480
            WHEN ${premium_support} AND ${e20_customer_level_tier} = 'Level 4' THEN 1440
            WHEN ${enterprise_edition_version} = 'e20' AND NOT ${premium_support} AND ${e20_customer_level_tier} = 'Level 1' THEN 240
            WHEN ${enterprise_edition_version} = 'e20' AND NOT ${premium_support} AND ${e20_customer_level_tier} = 'Level 2' THEN 480
            WHEN ${enterprise_edition_version} = 'e20' AND NOT ${premium_support} AND ${e20_customer_level_tier} = 'Level 3' THEN 1440
            WHEN ${enterprise_edition_version} = 'e20' AND NOT ${premium_support} AND ${e20_customer_level_tier} = 'Level 4' THEN 1440
            WHEN ${enterprise_edition_version} = 'e10' THEN 1440
          ELSE NULL END;;
  }

  dimension: followup_internal_sla {
    label: "Follow-up Internal SLA (min)"
    group_label: "SLAs"
    type: number
    sql: CASE
            WHEN ${premium_support} AND ${e20_customer_level_tier} = 'Level 1' THEN 120
            WHEN ${premium_support} AND ${e20_customer_level_tier} = 'Level 2' THEN 240
            WHEN ${premium_support} AND ${e20_customer_level_tier} = 'Level 3' THEN 480
            WHEN ${premium_support} AND ${e20_customer_level_tier} = 'Level 4' THEN 1440
            WHEN ${enterprise_edition_version} = 'e20' AND NOT ${premium_support} AND ${e20_customer_level_tier} = 'Level 1' THEN 240
            WHEN ${enterprise_edition_version} = 'e20' AND NOT ${premium_support} AND ${e20_customer_level_tier} = 'Level 2' THEN 480
            WHEN ${enterprise_edition_version} = 'e20' AND NOT ${premium_support} AND ${e20_customer_level_tier} = 'Level 3' THEN 1440
            WHEN ${enterprise_edition_version} = 'e20' AND NOT ${premium_support} AND ${e20_customer_level_tier} = 'Level 4' THEN 1440
            WHEN ${enterprise_edition_version} = 'e10' THEN 1440
          ELSE NULL END;;
  }

  dimension: met_first_response_sla {
    group_label: "SLAs"
    label: "Met First Response SLA?"
    type:  yesno
    sql: ${first_response_sla} > ${reply_time_in_minutes_cal} OR ${reply_time_in_minutes_cal} IS NULL;;
  }

  dimension: met_followup_internal_sla {
    group_label: "SLAs"
    label: "Met Follow-up Internal SLA?"
    type:  yesno
    sql: ${followup_internal_sla} > ${followup_internal} OR ${followup_internal} IS NULL;;
  }

  dimension: product_bug {
    label: "Is Product Bug?"
    sql: ${tags} like '%jira%' or ${tags} like '%bug%';;
    type: yesno
  }

  dimension: autoclosed {
    label: "Is Auto Closed?"
    sql: ${tags} like '%autoclosed%';;
    type: yesno
  }

  dimension: tags {
    type: string
    sql: ${TABLE}."TAGS" ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}."STATUS" ;;
  }

  dimension: organization_name {
    hidden: yes
    type: string
    sql: ${TABLE}."ORGANIZATION_NAME" ;;
  }

  dimension: premium_support {
    label: "Premium Support?"
    type: yesno
    sql: CASE WHEN ${TABLE}."PREMIUM_SUPPORT" = 'true' THEN true ELSE false END ;;
  }

  dimension: satisfaction_rating_reason {
    group_label: "Satisfation"
    group_item_label: "Reason"
    type: string
    sql: ${TABLE}."SATISFACTION_RATING_REASON" ;;
  }

  dimension: satisfaction_rating_score {
    group_label: "Satisfation"
    group_item_label: "Score"
    type: string
    sql: ${TABLE}."SATISFACTION_RATING_SCORE" ;;
  }

  dimension: ticket_id {
    type: number
    value_format_name: id
    sql: ${TABLE}.TICKET_ID ;;
    link: {
      label: "Zendesk Ticket"
      url: "@{zendesk_link}tickets/{{ticket_id}}"
    }
  }

  dimension: agent_wait_time_in_minutes_bus {
    hidden: yes
    type: number
    sql: ${TABLE}."AGENT_WAIT_TIME_IN_MINUTES_BUS" ;;
  }

  dimension: agent_wait_time_in_minutes_cal {
    hidden: yes
    type: number
    sql: ${TABLE}."AGENT_WAIT_TIME_IN_MINUTES_CAL" ;;
  }

  dimension: first_resolution_time_in_minutes_bus {
    hidden: yes
    type: number
    sql: ${TABLE}."FIRST_RESOLUTION_TIME_IN_MINUTES_BUS" ;;
  }

  dimension: first_resolution_time_in_minutes_cal {
    hidden: yes
    type: number
    sql: ${TABLE}."FIRST_RESOLUTION_TIME_IN_MINUTES_CAL" ;;
  }

  dimension: full_resolution_time_in_minutes_bus {
    hidden: yes
    type: number
    sql: ${TABLE}."FULL_RESOLUTION_TIME_IN_MINUTES_BUS" ;;
  }

  dimension: full_resolution_time_in_minutes_cal {
    hidden: yes
    type: number
    sql: ${TABLE}."FULL_RESOLUTION_TIME_IN_MINUTES_CAL" ;;
  }

  dimension: on_hold_time_in_minutes_bus {
    hidden: yes
    type: number
    sql: ${TABLE}."ON_HOLD_TIME_IN_MINUTES_BUS" ;;
  }

  dimension: on_hold_time_in_minutes_cal {
    hidden: yes
    type: number
    sql: ${TABLE}."ON_HOLD_TIME_IN_MINUTES_CAL" ;;
  }

  dimension: reply_time_in_minutes_bus {
#     hidden: yes
    type: number
    sql: ${TABLE}."REPLY_TIME_IN_MINUTES_BUS" ;;
  }

  dimension: reply_time_in_minutes_cal {
#     hidden: yes
    type: number
    sql: ${TABLE}."REPLY_TIME_IN_MINUTES_CAL" ;;
  }

  dimension: followup_internal {
    description: "Time a customer waited for follow up between first reply, while a ticket was open and being worked, and close time"
    type: number
    sql: ${requester_wait_time_in_minutes_bus} - ${reply_time_in_minutes_bus} - ${on_hold_time_in_minutes_bus} ;;
  }

  dimension: requester_wait_time_in_minutes_bus {
    hidden: yes
    type: number
    sql: ${TABLE}."REQUESTER_WAIT_TIME_IN_MINUTES_BUS" ;;
  }

  dimension: requester_wait_time_in_minutes_cal {
    hidden: yes
    type: number
    sql: ${TABLE}."REQUESTER_WAIT_TIME_IN_MINUTES_CAL" ;;
  }

  measure: count_tickets {
    type: count_distinct
    sql: ${ticket_id} ;;
    drill_fields: [organization_name, assignee_name]
  }

  measure: avg_full_resolution_time_in_minutes_bus {
    label: "Avg Time to Resolution (Bus)"
    group_label: "Time to Resolution"
    group_item_label: "Avg Business"
    type: average
    sql: ${full_resolution_time_in_minutes_bus} ;;
    drill_fields: [organization_name, assignee_name]
    value_format_name: decimal_0
  }

  measure: avg_full_resolution_time_in_minutes_cal {
    label: "Avg Time to Resolution (Cal)"
    group_label: "Time to Resolution"
    group_item_label: "Avg Calendar"
    type: average
    sql: ${full_resolution_time_in_minutes_bus} ;;
    drill_fields: [organization_name, assignee_name]
    value_format_name: decimal_0
  }

  measure: count_tickets_solved_on_date {
    type: count_distinct
    sql: ${ticket_id} ;;
    drill_fields: [organization_name, assignee_name]
    filters: {
      field: solved_at_on_date
      value: "yes"
    }
  }

  measure: count_tickets_created_date {
    type: count_distinct
    sql: ${ticket_id} ;;
    drill_fields: [organization_name, assignee_name]
    filters: {
      field: created_on_date
      value: "yes"
    }
  }

  measure: count_level_1 {
    type: count_distinct
    sql: CASE WHEN ${e20_customer_level_tier} = 'Level 1' THEN ${ticket_id} ELSE NULL END ;;
  }

  measure: count_level_2 {
    type: count_distinct
    sql: CASE WHEN ${e20_customer_level_tier} = 'Level 2' THEN ${ticket_id} ELSE NULL END ;;
  }

  measure: count_level_3 {
    type: count_distinct
    sql: CASE WHEN ${e20_customer_level_tier} = 'Level 3' THEN ${ticket_id} ELSE NULL END ;;
  }

  measure: count_level_4 {
    type: count_distinct
    sql: CASE WHEN ${e20_customer_level_tier} = 'Level 4' THEN ${ticket_id} ELSE NULL END ;;
  }

}
