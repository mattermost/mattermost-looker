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
    description: "Date last comment was added on a ticket"
    group_label: "Last Comment"
    label: "Last Comment Date"
    type: date
    sql: ${TABLE}."LAST_COMMENT_AT";;
  }

  dimension: sales_support {
    label: "Sales & Billings Support"
    description: "Tickets assigned to Sales Support queue in Zendesk.  Tickets in this queue are bliing questions, pricing issues, licensing questions or general sales inquiry."
    type: yesno
   sql: ${sales_billing_support_category} IS NOT NULL;;
  }

  dimension: tech_support {
    label: "Technical Support"
    description: "Tickets assigned to Technical Support queue in Zendesk.  Tickets in this queue are product related."
    type: yesno
    sql: ${sales_billing_support_category} IS NULL;;
  }

  dimension: ticket_support_type {
    label: "Ticket Support Type"
    description: "Technical or Sales & Billings Support"
    type: string
    sql: CASE WHEN ${sales_billing_support_category} IS NULL THEN 'Technical' WHEN ${sales_billing_support_category} IS NOT NULL THEN 'Sales & Billings Support' ELSE NULL END;;
  }

  dimension: days_since_last_comment {
    description: "Number of days since last comment on a ticket."
    group_label: "Last Comment"
    label: "Days Since Last Comment (Open Tickets)"
    type: number
    sql: CASE WHEN NOT ${open} THEN NULL ELSE current_date - ${last_comment_at}::date END;;
  }

  dimension: days_since_last_comment_range {
    group_label: "Last Comment"
    label: "Days since last comment range (Open Tickets)"
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
    ELSE 'Unknown' END;;
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
    sql: ${TABLE}."ACCOUNT_OPPT_AT_RISK" > 0;;
  }

  dimension: account_early_warning {
    description: "Account is flagged Early Warning in SFDC and pulled into ZenDesk organization table."
    label: "Customer Early Warning?"
    type: yesno
    sql: ${TABLE}."ACCOUNT_OPPT_EARLY_WARNING" > 0;;
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
    sql: COALESCE(${TABLE}."ASSIGNEE_NAME",'Unassigned') ;;
  }

  dimension_group: created {
    description: "Timeframe ticket was created in Zendesk"
    group_label: "Created Date"
    type: time
    timeframes: [
      day_of_week_index,
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
      day_of_week_index,
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

  dimension: tech_support_category {
    description: "Category options selected for technical support queue. Category examples are desktop, server, database, LDAP, Mobile"
    group_label: "Ticket Details"
    label: "Tech Support Category"
    type: string
    sql: CASE
          WHEN ${TABLE}."TECH_SUPPORT_CATEGORY" = 'tsupport' THEN 'General Support'
          WHEN ${TABLE}."TECH_SUPPORT_CATEGORY" = 'tsupport_desktop' THEN 'Desktop'
          WHEN ${TABLE}."TECH_SUPPORT_CATEGORY" = 'tsupport_ldap' THEN 'LDAP'
          WHEN ${TABLE}."TECH_SUPPORT_CATEGORY" = 'tsupport_mobile' THEN 'Mobile'
          WHEN ${TABLE}."TECH_SUPPORT_CATEGORY" = 'tsupport_db' THEN 'Database'
          WHEN ${TABLE}."TECH_SUPPORT_CATEGORY" = 'tsupport_connectivity' THEN 'Connectivity'
          WHEN ${TABLE}."TECH_SUPPORT_CATEGORY" = 'tsupport_installation' THEN 'Installation'
          WHEN ${TABLE}."TECH_SUPPORT_CATEGORY" = 'tsupport_upgrading' THEN 'Upgrading'
          WHEN ${TABLE}."TECH_SUPPORT_CATEGORY" = 'general_inquiry' THEN 'General Inquiry'
          WHEN ${TABLE}."TECH_SUPPORT_CATEGORY" = 'user_issue' THEN 'User Issue'
          WHEN ${TABLE}."TECH_SUPPORT_CATEGORY" = 'tsupport_login' THEN 'Login'
          WHEN ${TABLE}."TECH_SUPPORT_CATEGORY" = 'tsupport_messaging' THEN 'Messaging'
          WHEN ${TABLE}."TECH_SUPPORT_CATEGORY" = 'tsupport_status' THEN 'Notifications & Status'
          WHEN ${TABLE}."TECH_SUPPORT_CATEGORY" = 'tsupport_search' THEN 'Search'
          WHEN ${TABLE}."TECH_SUPPORT_CATEGORY" = 'tsupport_ui' THEN 'User Interface'
          WHEN ${TABLE}."TECH_SUPPORT_CATEGORY" = 'tsupport_system' THEN 'System Console'
          WHEN ${TABLE}."TECH_SUPPORT_CATEGORY" = 'tsupport_roles' THEN 'Roles & Permissions'
          WHEN ${TABLE}."TECH_SUPPORT_CATEGORY" = 'tsupport_utc_management' THEN 'User, Team & Channel Management'
          WHEN ${TABLE}."TECH_SUPPORT_CATEGORY" = 'tsupport_audit' THEN 'Compliance & Auditing'
          WHEN ${TABLE}."TECH_SUPPORT_CATEGORY" = 'tsupport_authentication' THEN 'Authentication & Provisioning'
          WHEN ${TABLE}."TECH_SUPPORT_CATEGORY" = 'tsupport_branding' THEN 'Branding'
          WHEN ${TABLE}."TECH_SUPPORT_CATEGORY" = 'tsupport_server' THEN 'Server Issues'
          WHEN ${TABLE}."TECH_SUPPORT_CATEGORY" = 'tsupport_devops' THEN 'DevOps Command Center'
          WHEN ${TABLE}."TECH_SUPPORT_CATEGORY" = 'tsupport_inport_export' THEN 'Data Export and Import'
          WHEN ${TABLE}."TECH_SUPPORT_CATEGORY" = 'tsupport_toolkit' THEN 'Developer Toolkit'
          WHEN ${TABLE}."TECH_SUPPORT_CATEGORY" = 'tsupport_integrations' THEN 'Integrations'
          WHEN ${TABLE}."TECH_SUPPORT_CATEGORY" = 'tsupport_onboarding' THEN 'Onboarding'
          WHEN ${TABLE}."TECH_SUPPORT_CATEGORY" IS NOT NULL THEN 'Unknown'
        ELSE NULL END
    ;;
  }

  dimension: sales_billing_support_category {
    description: "Category options selected for billing/sales support queue. Category examples are pricing, licensing, renewal, general questions."
    group_label: "Ticket Details"
    label: "Sales & Billings Category"
    type: string
    sql: CASE
          WHEN ${TABLE}."SALES_BILLINGS_SUPPORT_CATEGORY" = 'sales_pricing' THEN 'Pricing'
          WHEN ${TABLE}."SALES_BILLINGS_SUPPORT_CATEGORY" = 'sales-licensing' THEN 'Licensing'
          WHEN ${TABLE}."SALES_BILLINGS_SUPPORT_CATEGORY" = 'sales-product' THEN 'Product'
          WHEN ${TABLE}."SALES_BILLINGS_SUPPORT_CATEGORY" = 'sales-renewals' THEN 'Renewals'
          WHEN ${TABLE}."SALES_BILLINGS_SUPPORT_CATEGORY" = 'sales_credit_card_issues' THEN 'Credit Card Issues'
          WHEN ${TABLE}."SALES_BILLINGS_SUPPORT_CATEGORY" = 'sales_general' THEN 'General'
          WHEN ${TABLE}."SALES_BILLINGS_SUPPORT_CATEGORY" IS NOT NULL THEN 'Unknown'
        ELSE NULL END
    ;;
  }

  dimension: ticket_form {
    description: "Name of the form filled out.  Options are Sales/Billing Support Form or Technical Support Form."
    group_label: "Ticket Details"
    label: "Form Name"
    type: string
    sql: ${TABLE}.form_name ;;
  }

  dimension: old_category {
    description: "Old ticket categories pre self-service forms"
    group_label: "Ticket Details"
    label: "Old Category (depr)"
    type: string
    sql: CASE
          WHEN ${TABLE}."TECH_SUPPORT_CATEGORY" = 'tsupport' THEN 'General Support'
          WHEN ${TABLE}."TECH_SUPPORT_CATEGORY" = 'tsupport_desktop' THEN 'Desktop'
          WHEN ${TABLE}."TECH_SUPPORT_CATEGORY" = 'tsupport_ldap' THEN 'LDAP'
          WHEN ${TABLE}."TECH_SUPPORT_CATEGORY" = 'tsupport_mobile' THEN 'Mobile'
          WHEN ${TABLE}."TECH_SUPPORT_CATEGORY" = 'tsupport_db' THEN 'Database'
          WHEN ${TABLE}."TECH_SUPPORT_CATEGORY" = 'tsupport_connectivity' THEN 'Connectivity'
          WHEN ${TABLE}."TECH_SUPPORT_CATEGORY" = 'tsupport_installation' THEN 'Installation'
          WHEN ${TABLE}."TECH_SUPPORT_CATEGORY" = 'tsupport_upgrading' THEN 'Upgrading'
          WHEN ${TABLE}."TECH_SUPPORT_CATEGORY" = 'general_inquiry' THEN 'General Inquiry'
          WHEN ${TABLE}."TECH_SUPPORT_CATEGORY" = 'user_issue' THEN 'User Issue'
          WHEN ${TABLE}."TECH_SUPPORT_CATEGORY" = 'billing' THEN 'General Billing'
          WHEN ${TABLE}."TECH_SUPPORT_CATEGORY" = 'licensing' THEN 'Licensing'
          WHEN ${TABLE}."TECH_SUPPORT_CATEGORY" = 'renewals' THEN 'Renewals'
          WHEN ${TABLE}."TECH_SUPPORT_CATEGORY" = 'pricing' THEN 'Pricing'
          WHEN ${TABLE}."TECH_SUPPORT_CATEGORY" = 'product' THEN 'Product'
          WHEN ${TABLE}."TECH_SUPPORT_CATEGORY" = 'credit_card' THEN 'Credit Card'
          WHEN ${TABLE}."TECH_SUPPORT_CATEGORY" = 'tsupport_login' THEN 'Login'
          WHEN ${TABLE}."TECH_SUPPORT_CATEGORY" = 'tsupport_messaging' THEN 'Messaging'
          WHEN ${TABLE}."TECH_SUPPORT_CATEGORY" = 'tsupport_status' THEN 'Notifications & Status'
          WHEN ${TABLE}."TECH_SUPPORT_CATEGORY" = 'tsupport_search' THEN 'Search'
          WHEN ${TABLE}."TECH_SUPPORT_CATEGORY" = 'tsupport_ui' THEN 'User Interface'
          WHEN ${TABLE}."TECH_SUPPORT_CATEGORY" = 'tsupport_system' THEN 'System Console'
          WHEN ${TABLE}."TECH_SUPPORT_CATEGORY" = 'tsupport_roles' THEN 'Roles & Permissions'
          WHEN ${TABLE}."TECH_SUPPORT_CATEGORY" = 'tsupport_utc_management' THEN 'User, Team & Channel Management'
          WHEN ${TABLE}."TECH_SUPPORT_CATEGORY" = 'tsupport_audit' THEN 'Compliance & Auditing'
          WHEN ${TABLE}."TECH_SUPPORT_CATEGORY" = 'tsupport_branding' THEN 'Branding'
          WHEN ${TABLE}."TECH_SUPPORT_CATEGORY" = 'tsupport_server' THEN 'Server Issues'
          WHEN ${TABLE}."TECH_SUPPORT_CATEGORY" = 'tsupport_devops' THEN 'DevOps Command Center'
          WHEN ${TABLE}."TECH_SUPPORT_CATEGORY" = 'tsupport_inport_export' THEN 'Data Export and Import'
          WHEN ${TABLE}."TECH_SUPPORT_CATEGORY" = 'tsupport_toolkit' THEN 'Developer Toolkit'
          WHEN ${TABLE}."TECH_SUPPORT_CATEGORY" = 'tsupport_integrations' THEN 'Integrations'
          WHEN ${TABLE}."TECH_SUPPORT_CATEGORY" = 'tsupport_onboarding' THEN 'Onboarding'
        ELSE 'Unknown' END
    ;;
  }

  dimension: category {
    description: "Combines both Sales/Billing support and Technical Support Categories."
    group_label: "Ticket Details"
    label: "Category"
    type: string
    sql: coalesce(${sales_billing_support_category},${tech_support_category},'Unassigned') ;;
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


  dimension: first_response_sla {
    description: "External SLA: The duration between ticket creation and the first public agent reply on the ticket."
    group_label: "SLAs"
    label: "First Response SLA (min)"
    type: number
    sql: CASE
            WHEN ${premium_support} AND ${priority} = 'L1 (Urgent)' THEN 60
            WHEN ${premium_support} AND ${priority} = 'L2 (High)' THEN 120
            WHEN ${premium_support} AND ${priority} = 'L3 (Normal)' THEN 480
            WHEN ${premium_support} AND ${priority} = 'L4 (Low)' THEN 1440
            WHEN ${enterprise_edition_version} = 'e20' AND NOT ${premium_support} AND ${priority} = 'L1 (Urgent)' THEN 240
            WHEN ${enterprise_edition_version} = 'e20' AND NOT ${premium_support} AND ${priority} = 'L2 (High)' THEN 480
            WHEN ${enterprise_edition_version} = 'e20' AND NOT ${premium_support} AND ${priority} = 'L3 (Normal)' THEN 1440
            WHEN ${enterprise_edition_version} = 'e20' AND NOT ${premium_support} AND ${priority} = 'L4 (Low)' THEN 1440
            WHEN ${enterprise_edition_version} = 'e10' THEN 1440
          ELSE NULL END;;
  }

  dimension: followup_internal_sla {
    description: "Internal SLA: The duration between ticket's first reply time and next reply time, unless otherwise communicated."
    label: "Next Reply Time Internal SLA (min)"
    group_label: "SLAs"
    type: number
    sql: CASE
            WHEN ${premium_support} AND ${priority} = 'L1 (Urgent)' THEN 120
            WHEN ${premium_support} AND ${priority} = 'L2 (High)' THEN 240
            WHEN ${premium_support} AND ${priority} = 'L3 (Normal)' THEN 480
            WHEN ${premium_support} AND ${priority} = 'L4 (Low)' THEN 1440
            WHEN ${enterprise_edition_version} = 'e20' AND NOT ${premium_support} AND ${priority} = 'L1 (Urgent)' THEN 240
            WHEN ${enterprise_edition_version} = 'e20' AND NOT ${premium_support} AND ${priority} = 'L2 (High)' THEN 480
            WHEN ${enterprise_edition_version} = 'e20' AND NOT ${premium_support} AND ${priority} = 'L3 (Normal)' THEN 1440
            WHEN ${enterprise_edition_version} = 'e20' AND NOT ${premium_support} AND ${priority} = 'L4 (Low)' THEN 1440
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

  dimension: has_first_response_sla {
    description: "License Type has a First Response SLA (Yes/No)"
    group_label: "SLAs"
    label: "Has First Response SLA?"
    type:  yesno
    sql: ${support_type} IN ('E20','Premium');;
  }

  dimension: has_followup_internal_sla {
    description: "License Type has a Follow-up SLA (Yes/No)"
    group_label: "SLAs"
    label: "Has Follow-up SLA?"
    type:  yesno
    sql: ${support_type} IN ('E20','Premium');;
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
    sql: CASE WHEN ${pending_do_not_close} AND ${TABLE}."STATUS" not in ('solved','closed') THEN 'do not close' WHEN ${TABLE}."STATUS" = 'pending' THEN 'waiting on customer' ELSE ${TABLE}."STATUS" END
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
    group_label: "Minutes to Resolution"
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

  measure: count_tickets_solved_past_xweeks {
    group_label: "Previous 12 Weeks"
    label: "# of Tickets Solved (Past 12w)"
    group_item_label: "# of Tickets Solved"
    description: "# of tickets solved in past 12 weeks"
    type: count_distinct
    sql: ${ticket_id};;
    drill_fields: [core_drill_fields*]
    filters: {
      field: created_past_xweeks
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

  dimension: created_past_xweeks {
    sql:  ${created_date} >= DATEADD('day', -77, TO_DATE(DATEADD('day', (0 - EXTRACT(DOW FROM CURRENT_DATE())::integer), CURRENT_DATE())))
          AND ${created_date} < DATEADD('day', 84, DATEADD('day', -77, TO_DATE(DATEADD('day', (0 - EXTRACT(DOW FROM CURRENT_DATE())::integer), CURRENT_DATE())))) ;;
    type: yesno
    hidden: yes
  }

  dimension: solved_at_past_xweeks {
    sql: ${solved_at_date} >= DATEADD('day', -77, TO_DATE(DATEADD('day', (0 - EXTRACT(DOW FROM CURRENT_DATE())::integer), CURRENT_DATE())))
        AND ${solved_at_date} < DATEADD('day', 84, DATEADD('day', -77, TO_DATE(DATEADD('day', (0 - EXTRACT(DOW FROM CURRENT_DATE())::integer), CURRENT_DATE())))) ;;
    type: yesno
    hidden: yes
  }


  measure: count_tickets_created_past_xweeks {
    group_label: "Previous 12 Weeks"
    label: "# of Tickets Created (Past 12w)"
    group_item_label: "# of Tickets Created"
    description: "# of tickets created in past 12 weeks"
    type: count_distinct
    sql: ${ticket_id};;
    drill_fields: [core_drill_fields*]
    filters: {
      field: created_past_xweeks
      value: "yes"
    }
  }

  measure: count_tickets_not_met_first_response_sla_xweeks {
    group_label: "Previous 12 Weeks"
    label: "# of First Response SLA Not Met (Past 12w)"
    group_item_label: "# of First Response SLA Not Met"
    description: "# of tickets where first response sla is not met where ticket was created in past 12 weeks"
    type: count_distinct
    sql: ${ticket_id} ;;
    drill_fields: [core_drill_fields*]
    filters: {
      field: met_first_response_sla
      value: "no"
    }
    filters: {
      field: created_past_xweeks
      value: "yes"
    }
    filters: {
      field: has_first_response_sla
      value: "yes"
    }
  }

  measure: count_tickets_not_met_followup_internal_sla_xweeks {
    group_label: "Previous 12 Weeks"
    label: "# of Follow-up SLA Not Met (Past 12w)"
    group_item_label: "# of Follow-up SLA Not Met"
    description: "# of tickets where follow-up sla is not met where ticket was created in past 12 weeks"
    type: count_distinct
    sql: ${ticket_id} ;;
    drill_fields: [core_drill_fields*]
    filters: {
      field: met_followup_internal_sla
      value: "no"
    }
    filters: {
      field: solved_at_past_xweeks
      value: "yes"
    }
    filters: {
      field: has_followup_internal_sla
      value: "yes"
    }
  }

  measure: count_tickets_open {
    label: "# of Tickets Open"
    description: "# of tickets open"
    type: count_distinct
    sql: ${ticket_id} ;;
    drill_fields: [core_drill_fields*]
    filters: {
      field: open
      value: "yes"
    }
  }

  measure: count_level_1_past_xweeks {
    group_label: "Previous 12 Weeks"
    label: "# of L1 Tickets (Past 12w)"
    group_item_label: "# of L1 Tickets"
    description: "# of E20 and premiere support tickets created as L1"
    type: count_distinct
    sql: ${ticket_id} ;;
    drill_fields: [core_drill_fields*]
    filters: {
      field: created_past_xweeks
      value: "yes"
    }
    filters: {
      field: priority
      value: "L1 (Urgent)"
    }
    filters: {
      field: support_type_category
      value: "Paid"
    }
  }

  measure: count_level_1 {
    label: "# of L1 Tickets"
    group_label: "SLAs"
    description: "# of E20 and premiere support tickets created as L1"
    type: count_distinct
    sql: ${ticket_id};;
    drill_fields: [core_drill_fields*]
    filters: {
      field: priority
      value: "L1 (Urgent)"
    }
  }

  measure: count_level_2 {
    label: "# of L2 Tickets"
    group_label: "SLAs"
    description: "# of E20 and premiere support tickets created as L2"
    type: count_distinct
    sql: CASE WHEN ${priority} = 'L2 (High)' THEN ${ticket_id} ELSE NULL END ;;
    drill_fields: [core_drill_fields*]
  }

  measure: count_level_3 {
    label: "# of L3 Tickets"
    group_label: "SLAs"
    description: "# of E20 and premiere support tickets created as L3"
    type: count_distinct
    sql: CASE WHEN ${priority} = 'L3 (Normal)' THEN ${ticket_id} ELSE NULL END ;;
    drill_fields: [core_drill_fields*]
  }

  measure: count_level_4 {
    label: "# of L4 Tickets"
    group_label: "SLAs"
    description: "# of E20 and premiere support tickets created as L4"
    type: count_distinct
    sql: CASE WHEN ${priority} = 'L4 (Low)' THEN ${ticket_id} ELSE NULL END ;;
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
    fields: [account.name, ticket_id, assignee_name, status, support_type, category, ticket_support_type, ticket_form, priority, days_since_last_comment, created_date, solved_at_time, calendar_days_open,
            first_response_sla, reply_time_in_minutes_bus, met_first_response_sla, followup_internal_sla, followup_internal, met_followup_internal_sla, account_at_risk, account_early_warning]
  }

}
