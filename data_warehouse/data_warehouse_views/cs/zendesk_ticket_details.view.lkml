view: zendesk_ticket_details {
  sql_table_name: "CS"."ZENDESK_TICKET_DETAILS";;

  dimension: account_sfid {
    hidden: yes
    type: string
    sql: ${TABLE}."ACCOUNT_SFID" ;;
  }

  dimension: name {
    description: "Account Name pulled from Salesforce"
    group_label: "Ticket Details"
    label: "Account Name"
    link: {
      label: "Salesforce Account"
      # BP: Leverage constants to enable more reused
      url: "@{salesforce_link}{{account_sfid}}"
    }
    sql: ${account.name} ;;
    type: string
  }

  dimension: last_comment_at {
    description: "Date last coment was added on a ticket"
    group_label: "Last Comment"
    label: "Last Comment Date"
    type: date
    sql: ${TABLE}."LAST_COMMENT_AT";;
  }

  dimension: days_since_last_comment {
    description: "Number of days since last comment on a ticket."
    group_label: "Last Comment"
    label: "Days Since Last Comment"
    type: number
    sql: current_date - ${last_comment_at}::date;;
  }

  dimension: days_since_last_comment_range {
    group_label: "Last Comment"
    label: "Days since last comment range"
    description: "Range of days since last comment on a ticket."
    type: tier
    style: integer
    tiers: [1, 4, 8, 14]
    sql: ${days_since_last_comment} ;;
  }

  dimension: priority {
    description: "Prioirity drop-down on a ZenDesk ticket. Priority options are as Urgent, High, Normal and Low."
    group_label: "SLAs"
    label: "Priority"
    type: string
    sql: CASE
    WHEN ${TABLE}."PRIORITY" = 'urgent' THEN 'L1 (Urgent)'
    WHEN ${TABLE}."PRIORITY" = 'high' THEN 'L2 (High)'
    WHEN ${TABLE}."PRIORITY" = 'normal' THEN 'L3 (Normal)'
    WHEN ${TABLE}."PRIORITY" = 'low' THEN 'L4 (Low)'
    ELSE 'Unkown' END;;
  }

  dimension: subject {
   description: "Single line of text that provides a quick description of the issue.  More details of ticket in Description field."
    group_label: "Ticket Details"
    label: "Subject"
    type: string
    sql: ${TABLE}."RAW_SUBJECT" ;;
  }

  dimension: account_at_risk {
    description: "Account is flagged At Risk in SFDC and pulled into ZenDesk organization table."
    label: "Customer At Risk?"
    type: yesno
    sql: ${TABLE}."ACCOUNT_OPPT_EARLY_WARNING" > 0;;
  }

  dimension: account_early_warning {
    description: "Account is flagged Early Warning in SFDC and pulled into ZenDesk organization table."
    label: "Customer Early Warning?"
    type: yesno
    sql: ${TABLE}."ACCOUNT_OPPT_AT_RISK" > 0;;
  }

  dimension: description {
    description: "Description of a ticket,- usually a customer question, issue or feedback. The description is the first comment in the ticket."
    group_label: "Ticket Details"
    label: "Description"
    type: string
    sql: ${TABLE}."DESCRIPTION" ;;
  }

  dimension: assignee_name {
    description: "Support Engineer currently assigned to the ticket"
    group_label: "Ticket Details"
    label: "Support Engineer Assigned"
    type: string
    sql: ${TABLE}."ASSIGNEE_NAME" ;;
  }

  dimension_group: created {
    description: "Timeframe ticket was created in Zendesk"
    group_label: "Created Date"
    type: time
    timeframes: [
      time,
      date,
      hour_of_day,
      week,
      month,
      fiscal_quarter,
      fiscal_year
    ]
    sql: ${TABLE}."CREATED_AT" ;;
  }

  dimension: created_on_date {
    description: "Date the ticket was created in Zendesk"
    hidden: yes
    type: yesno
    sql: ${created_date} = ${dates.date_date};;
  }

  dimension_group: solved_at {
    description:"Timeframe ticket was set to resolved status"
    group_label: "SLAs"
    type: time
    timeframes: [
      hour12,
      time,
      date,
      week,
      month,
      fiscal_quarter,
      fiscal_year
    ]
    sql: ${TABLE}."SOLVED_AT" ;;
  }

  dimension: solved_at_on_date {
    description:"Date the ticket was set to resolved status"
    hidden: yes
    type: yesno
    sql: ${solved_at_date} = ${dates.date_date};;
  }

  dimension: category {
    description: "The reason a case was created. For example: mobile, database, server, notifications."
    group_label: "Ticket Details"
    label: "Category"
    type: string
    sql: CASE
          WHEN ${TABLE}."CATEGORY" = 'tsupport' THEN 'General Support'
          WHEN ${TABLE}."CATEGORY" = 'tsupport_desktop' THEN 'Desktop'
          WHEN ${TABLE}."CATEGORY" = 'tsupport_ldap' THEN 'LDAP'
          WHEN ${TABLE}."CATEGORY" = 'tsupport_mobile' THEN 'Mobile'
          WHEN ${TABLE}."CATEGORY" = 'tsupport_db' THEN 'DB'
          WHEN ${TABLE}."CATEGORY" = 'tsupport_connectivity' THEN 'Connectivity'
          WHEN ${TABLE}."CATEGORY" = 'tsupport_installation' THEN 'Installation'
          WHEN ${TABLE}."CATEGORY" = 'tsupport_upgrading' THEN 'Upgrading'
          WHEN ${TABLE}."CATEGORY" = 'general_inquiry' THEN 'General Inquiry'
          WHEN ${TABLE}."CATEGORY" = 'user_issue' THEN 'User Issue'
        ELSE 'Unknown' END
    ;;
  }

  dimension: customer_type {
    description: "Type of customer logging ticket.  Options are customer, trial, potential customer, noncustomer, reseller"
    group_label: "Ticket Details"
    label: "Customer Type"
    type: string
    sql: ${TABLE}."CUSTOMER_TYPE" ;;
  }

  dimension: support_type {
    description: "Type of license: Team Edition, E10, E20, Premiere"
    group_label: "Ticket Details"
    label: "License Type"
    type: string
    sql: CASE
            WHEN ${premium_support} THEN 'Premium'
            WHEN ${enterprise_edition_version} = 'e20' THEN 'E20'
            WHEN ${enterprise_edition_version} = 'e10' THEN 'E10'
            ELSE 'Free' END
          ;;
  }

  dimension: support_type_category {
    description: "Classifies ticket as free or paid customer"
    group_label: "Ticket Details"
    label: "Free/Paid"
    type: string
    sql: CASE WHEN ${support_type} IN ('Premium','E20','E10') THEN 'Paid' ELSE 'Free' END
          ;;
  }

  dimension: enterprise_edition_version {
    label: "Enterprise Edition"
    description: "Broken out by enterprise version.  Options are E10 or E20"
    group_label: "Ticket Details"
    type: string
    sql: ${TABLE}."ENTERPRISE_EDITION_VERSION" ;;
  }

  dimension: e20_customer_level_tier {
    description: "E20 and Premiere support SLA ticket level. Options: L1, L2, L3, L4"
    group_label: "SLAs"
    label: "E20 Customer Level Tier"
    type: string
    sql: CASE
            WHEN ${support_type} in ('E20','Premium') AND ${TABLE}."E20_CUSTOMER_LEVEL_TIER" = 'level_1___critical_business_impact' THEN 'Level 1'
            WHEN ${support_type} in ('E20','Premium') AND ${TABLE}."E20_CUSTOMER_LEVEL_TIER" = 'level_2___major_business_impact' THEN 'Level 2'
            WHEN ${support_type} in ('E20','Premium') AND ${TABLE}."E20_CUSTOMER_LEVEL_TIER" = 'level_3___moderate_business_impact' THEN 'Level 3'
            WHEN ${support_type} in ('E20','Premium') AND ${TABLE}."E20_CUSTOMER_LEVEL_TIER" = 'level_4___minor_business_impact' THEN 'Level 4'
          ELSE 'No Level' END;;
  }

  dimension: first_response_sla {
    description: "External SLA: The duration between ticket creation and the first public agent reply on the ticket."
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
    description: "Internal SLA: The duration between ticket's first reply time and next reply time, unless otherwise communicated."
    label: "Next Reply Time Internal SLA (min)"
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
    description: "First response time SLA met? Yes/No"
    group_label: "SLAs"
    label: "Met First Response SLA?"
    type:  yesno
    sql: ${first_response_sla} > ${reply_time_in_minutes_cal} OR ${reply_time_in_minutes_cal} IS NULL;;
  }

  dimension: met_followup_internal_sla {
    description: "Followup Reply Time SLA met? Yes/No"
    group_label: "SLAs"
    label: "Followup Reply Time Internal SLA?"
    type:  yesno
    sql: ${followup_internal_sla} > ${followup_internal} OR ${followup_internal} IS NULL;;
  }

  dimension: pending_do_not_close {
    description: "Checkbox on the ticket. This is used for tickets that are expected to be open for a long period of time. This stops the clock. Examples are customer requests ticket remain open after a solution is provided, the customer is on vacation, or the customer is out ill."
    group_label: "Status"
    label: "Pending - Do Not Close"
    type: yesno
    sql: ${TABLE}."PENDING_DO_NOT_CLOSE" ;;
  }

  dimension: escalated_to_SET {
    description: "Tickets that have the tag jira_escalated in ticket details. These tickets have been escalated to Sustained Engineering Team for further help."
    group_label: "Status"
    label: "Ticket escalated to SET?"
    sql: ${tags} like '%jira%' ;;
    type: yesno
  }

  dimension: is_product_bug {
    description: "Tickets that have the tag client_software_bug or server_software_bug tag in Zendesk? Yes/No"
    group_label: "Status"
    label: "Ticket identified as bug?"
    sql: ${tags} like '%bug%' ;;
    type: yesno
  }

  dimension: autoclosed {
    label: "Is Auto Closed?"
    group_label: "Status"
    description: "Was the ticket auto closed? Yes/No"
    sql: ${tags} like '%autoclosed%';;
    type: yesno
  }

  dimension: open {
    label: "Is Open?"
    description: "Is the ticket status not equal to solved or closed? Yes/No"
    group_label: "Status"
    sql: ${status} NOT IN ('closed','solved') ;;
    type: yesno
  }

  dimension: calendar_days_open {
    group_label: "SLAs"
    label: "Calendar days open"
    description: "Duration ticket is open (if not closed).  During ticket was open (if closed)."
    type: number
    sql: coalesce(${full_resolution_time_in_minutes_cal}, TIMESTAMPDIFF(minutes, ${created_time}, current_timestamp))/(24*60) ;;
    value_format_name: decimal_0
  }

  dimension: calendar_days_open_buckets {
    group_label: "SLAs"
    label: "Calendar days open range"
    description: "Day ranges ticket is open."
    type: tier
    sql: ${calendar_days_open} ;;
    style: integer
    tiers: [1, 3, 8, 16, 30, 60, 90, 120, 150, 180, 365]
  }

  dimension: tags {
    group_label: "Ticket Details"
    description: "Tags are words, or combinations of words that are used to add more context to tickets."
    label: "Ticket Tags"
    type: string
    sql: ${TABLE}."TAGS" ;;
  }

  dimension: status {
    group_label: "Status"
    description: "Status of the ticket."
    label: "Ticket Status"
    type: string
    sql: CASE WHEN ${pending_do_not_close} THEN 'do not close' WHEN ${TABLE}."STATUS" = 'pending' THEN 'waiting on customer' ELSE ${TABLE}."STATUS" END
    ;;
  }

  dimension: organization_name {
    hidden: yes
    type: string
    sql: ${TABLE}."ORGANIZATION_NAME" ;;
  }

  dimension: premium_support {
    label: "Premium Support?"
    group_label: "Ticket Details"
    description: "Premiere Support Customer? Yes/No"
    type: yesno
    sql: CASE WHEN ${TABLE}."PREMIUM_SUPPORT" = 'true' THEN true ELSE false END ;;
  }

  dimension: satisfaction_rating_reason {
    group_label: "CSAT"
    label: "CSAT Reason"
    description: "Reason for CSAT score"
    type: string
    sql: ${TABLE}."SATISFACTION_RATING_REASON" ;;
  }

  dimension: satisfaction_rating_score {
    group_label: "CSAT"
    label: "CSAT Score"
    description: "CSAT score rating. Options are good or bad."
    type: string
    sql: ${TABLE}."SATISFACTION_RATING_SCORE" ;;
  }

  dimension: ticket_id {
    group_label: "Ticket Details"
    label: "Ticket ID"
    description: "Ticket ID # in Zendesk"
    type: number
    value_format_name: id
    sql: ${TABLE}.TICKET_ID ;;
    link: {
      label: "Zendesk Ticket"
      url: "@{zendesk_link}tickets/{{value}}"
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
    label: "Reply time (business time minutes)"
    group_label: "SLAs"
    description: "Reply time in tickets in business time minutes.  Business time is M-F 9am-5pm pacific time."
#     hidden: yes
    type: number
    sql: ${TABLE}."REPLY_TIME_IN_MINUTES_BUS" ;;
  }

  dimension: reply_time_in_minutes_cal {
    label: "Reply time (calendar time minutes)"
    description: "Reply time in tickets in calendar days - non bus time."
    group_label: "SLAs"
#     hidden: yes
    type: number
    sql: ${TABLE}."REPLY_TIME_IN_MINUTES_CAL" ;;
  }

  dimension: followup_internal {
    group_label: "SLAs"
    label: "Followup time (business time minutes)"
    description: "Time a customer waited for follow up between first reply, while a ticket was open and being worked, and close time. Based on business time minutes."
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
    label: "# of Tickets"
    description: "# of tickets"
    type: count_distinct
    sql: ${ticket_id} ;;
    drill_fields: [core_drill_fields*]
  }

  measure: median_full_resolution_time_in_minutes_bus {
    # hidden: yes
    label: "Median Minutes to Resolution (Bus)"
    group_label: "Minutes to Resolution"
    group_item_label: "Median Business Minutes"
    type: median
    sql: ${full_resolution_time_in_minutes_bus} ;;
    drill_fields: [core_drill_fields*, median_full_resolution_time_in_minutes_bus]
    value_format_name: decimal_0
  }

  measure: median_full_resolution_time_in_minutes_cal {
    # hidden: yes
    label: "Median Minutes to Resolution (Cal)"
    group_label: "Minutes to Rsolution"
    group_item_label: "Median Calendar Minutes"
    type: median
    sql: ${full_resolution_time_in_minutes_bus} ;;
    value_format_name: decimal_0
    drill_fields: [core_drill_fields*,median_full_resolution_time_in_minutes_cal]
  }

  measure: avg_full_resolution_time_in_minutes_bus {
    # hidden: yes
    label: "Avg Minutes to Resolution (Bus)"
    group_label: "Minutes to Resolution"
    group_item_label: "Avg Business Minutes"
    type: average
    sql: ${full_resolution_time_in_minutes_bus} ;;
    drill_fields: [core_drill_fields*, avg_full_resolution_time_in_minutes_bus]
    value_format_name: decimal_0
  }

  measure: avg_full_resolution_time_in_minutes_cal {
    # hidden: yes
    label: "Avg Minutes to Resolution (Cal)"
    group_label: "Minutes to Resolution"
    group_item_label: "Avg Calendar Minutes"
    type: average
    sql: ${full_resolution_time_in_minutes_bus} ;;
    value_format_name: decimal_0
    drill_fields: [core_drill_fields*,avg_full_resolution_time_in_minutes_cal]
  }

  measure: count_tickets_solved_on_date {
    label: "# of Tickets Solved"
    description: "# of tickets solved based on filter or dimension date range selected "
    type: count_distinct
    sql: ${ticket_id} ;;
    drill_fields: [core_drill_fields*]
    filters: {
      field: solved_at_on_date
      value: "yes"
    }
  }

  measure: count_tickets_created_date {
    label: "# of Tickets Created"
    description: "# of tickets created based on filter or dimension date range selected "
    type: count_distinct
    sql: ${ticket_id} ;;
    drill_fields: [core_drill_fields*]
    filters: {
      field: created_on_date
      value: "yes"
    }
  }

  measure: count_level_1 {
    label: "# of L1 Tickets"
    group_label: "SLAs"
    description: "# of E20 and premiere support tickets created as L1"
    type: count_distinct
    sql: CASE WHEN ${e20_customer_level_tier} = 'Level 1' THEN ${ticket_id} ELSE NULL END ;;
    drill_fields: [core_drill_fields*]
  }

  measure: count_level_2 {
    label: "# of L2 Tickets"
    group_label: "SLAs"
    description: "# of E20 and premiere support tickets created as L2"
    type: count_distinct
    sql: CASE WHEN ${e20_customer_level_tier} = 'Level 2' THEN ${ticket_id} ELSE NULL END ;;
    drill_fields: [core_drill_fields*]
  }

  measure: count_level_3 {
    label: "# of L3 Tickets"
    group_label: "SLAs"
    description: "# of E20 and premiere support tickets created as L3"
    type: count_distinct
    sql: CASE WHEN ${e20_customer_level_tier} = 'Level 3' THEN ${ticket_id} ELSE NULL END ;;
    drill_fields: [core_drill_fields*]
  }

  measure: count_level_4 {
    label: "# of L4 Tickets"
    group_label: "SLAs"
    description: "# of E20 and premiere support tickets created as L4"
    type: count_distinct
    sql: CASE WHEN ${e20_customer_level_tier} = 'Level 4' THEN ${ticket_id} ELSE NULL END ;;
    drill_fields: [core_drill_fields*]
  }

  measure: avg_calendar_days_open {
    # hidden: yes
    description: "Average # of calendar days tickets are open"
    group_label: "Open Days"
    label: "Avg Days Open (Cal)"
    type: average
    sql: ${calendar_days_open} ;;
    value_format_name: decimal_0
    drill_fields: [core_drill_fields*, avg_calendar_days_open]
  }

  measure: median_calendar_days_open {
    # hidden: yes
    group_label: "Open Days"
    label: "Median Days Open (Cal)"
    type: median
    sql: ${calendar_days_open} ;;
    value_format_name: decimal_0
    drill_fields: [core_drill_fields*, median_calendar_days_open]
  }

  measure: avg_reply_time_in_minutes_bus {
    # hidden: yes
    description: "Average reply time in minutes between business hours of 9am-5pm pacific time for all tickets"
    label: "Avg Reply Time in Min (Bus)"
    group_label: "Minutes to Reply"
    group_item_label: "Avg Business Minutes"
    type: average
    sql: ${reply_time_in_minutes_bus} ;;
    drill_fields: [core_drill_fields*, avg_reply_time_in_minutes_bus]
    value_format_name: decimal_0
  }

  set: core_drill_fields {
    fields: [account.name, ticket_id, assignee_name, status, support_type, category, priority, days_since_last_comment, created_date, solved_at_time, e20_customer_level_tier, calendar_days_open,
            first_response_sla, reply_time_in_minutes_bus, met_first_response_sla, followup_internal_sla, followup_internal, met_followup_internal_sla, account_at_risk, account_early_warning]
  }

}
