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

  dimension: automated_ticket_classification {
    description: "Automated ticket category classification based on a standard list of ticket classification groupings and regular expression pattern matching."
    type: string
    sql: CASE
        WHEN regexp_like(${subject}, '(\B|\b|.)*(renewal|check in|checking in|check in|health check|new subscription|Closed/Won|invoice|subscription)(\B|\b|.)*',
                         'is')                                                                                   THEN 'Renewals & Health Checks'
        WHEN regexp_like(${subject}, '(\B|\b|.)*(react native)(\B|\b|.)*', 'is')
                                                                                                                 THEN 'React Native App'
        WHEN regexp_like(${subject}, '(\B|\b|.)*(import|export)(\B|\b|.)*', 'is') or ${category} = 'Data Export and Import'
                                                                                                                 THEN 'Data Import/Export'
        WHEN regexp_like(${subject}, '(\B|\b|.)*(cluster|multiserver|multi-server|servers|node)(\B|\b|.)*', 'is')
                                                                                                                 THEN 'Multi-Server/Clustering'
        WHEN regexp_like(${subject}, '(\B|\b|.)*(guest account|guest link)(\B|\b|.)*', 'is')
                                                                                                                 THEN 'Guest Account'
        WHEN regexp_like(${subject}, '(\B|\b|.)*(gitlab|omnibus)(\B|\b|.)*', 'is')
                                                                                                                 THEN 'Gitlabl Omnibus'
        WHEN regexp_like(${subject}, '(\B|\b|.)*(api)(\B|\b|.)*', 'is') OR ${category} in ('Developer Toolkit')
                                                                                                                 THEN 'Developer Toolkit'
        WHEN regexp_like(${subject}, '(\B|\b|.)*(bleve)(\B|\b|.)*', 'is')
                                                                                                                 THEN 'Bleve'
        WHEN regexp_like(${subject}, '(\B|\b|.)*(emoji|giphy|gif|emoticon)(\B|\b|.)*', 'is')
                                                                                                                 THEN 'Emojis & Gifs'
        WHEN regexp_like(${subject}, '(\B|\b|.)*(elastic|search)(\B|\b|.)*', 'is')
                                                                                                                 THEN 'Search/ElasticSearch'
        WHEN regexp_like(${subject},
                 '(\B|\b|.)*(getting started|get started|new user|invite|invitation|members|adding guests|add guests|onboard|join team|join the team|user create|create new user|create user|add user|add a new user|add new user|signup|adding users|user account creat|sign up|user not saving)(\B|\b|.)*',
                 'is')
                                                                                                                 THEN 'Invites & Onboarding'
        WHEN regexp_like(${subject}, '(\B|\b|.)*(delete user|delete my user|user access|deactivating user|user deactivation|deactivation user|remove user|removing inactive user|remove inactive user|deactivate user|disable user|diabling user|disabled user|decrease active user)(\B|\b|.)*', 'is')
                                                                                                                 THEN 'User Deactivation'
        WHEN regexp_like(${subject}, '(\B|\b|.)*(active user|user stat|telemetry|system statistics|system console|admin console|user activity|usage|admin|accessibility)(\B|\b|.)*', 'is') or ${category} = 'System Console'
                                                                                                                 THEN 'Admin Console, Usage & Telemetry'
        WHEN regexp_like(${subject}, '(\B|\b|.)*(team|groups|group discovery|person to group|user to group)(\B|\b|.)*', 'is')
                                                                                                                 THEN 'Teams & Groups'
        WHEN regexp_like(${subject}, '(\B|\b|.)*(log|logs of users|user logs|chat logs|backup|archive|archiv|unarchiv|logging|user log|get the posts|chat history)(\B|\b|.)*', 'is')
                                                                                                                 THEN 'Logging & Chat History'
        WHEN regexp_like(${subject}, '(\B|\b|.)*(admin)(\B|\b|.)*', 'is')
                                                                                                                 THEN 'Admin'
        WHEN regexp_like(${subject}, '(\B|\b|.)*(restrict|permissions|role|system setting)(\B|\b|.)*', 'is')
                                                                                                                 THEN 'System/User Permissions & Roles'
        WHEN regexp_like(${subject}, '(\B|\b|.)*(phone app|mobile|ios|android|andorid)(\B|\b|.)*', 'is') or ${category} = 'Mobile'
                                                                                                                 THEN 'Mobile'
        WHEN regexp_like(${subject}, '(\B|\b|.)*(theme)(\B|\b|.)*', 'is')
                                                                                                                 THEN 'Custom Themes'
        WHEN regexp_like(${subject}, '(\B|\b|.)*(desktop)(\B|\b|.)*', 'is') or ${category} = 'Desktop'
                                                                                                                 THEN 'Desktop'
        WHEN regexp_like(${subject}, '(\B|\b|.)*(cli|command line interface|command line)(\B|\b|.)*', 'is')
                                                                                                                 THEN 'CLI'
        WHEN regexp_like(${subject}, '(\B|\b|.)*(webhook|web hook)(\B|\b|.)*', 'is')
                                                                                                                 THEN 'Webhooks'
        WHEN regexp_like(${subject},
                         '(\B|\b|.)*(zoom|integration|plugin|marketplace|jitsi|jira|mscalendar|todo|to do|plug in|digitalocean)(\B|\b|.)*',
                         'is') OR ${category} = 'Integrations'
                                                                                                                 THEN 'Plugins'
        WHEN regexp_like(${subject}, '(\B|\b|.)*(AD/LDAP|ldap|ladp| ad |ad )(\B|\b|.)*', 'is') or ${category} = 'LDAP'
                                                                                                                 THEN 'AD/LDAP'
        WHEN regexp_like(${subject}, '(\B|\b|.)*(experimental|latex)(\B|\b|.)*', 'is')
                                                                                                                 THEN 'Experimental Features'
        WHEN regexp_like(${subject},
                         '(\B|\b|.)*(sso|single sign on|signle sign on|single-signon|single signon|mfa|multifactor authentication|multifactor|multi factor|authentication|oauth|saml|authenticat|multi-factor)(\B|\b|.)*',
                         'is') OR ${category} = 'Authentication & Provisioning'
                                                                                                                 THEN 'Authentication (SSO/MFA/OAuth/SAML)'
        WHEN regexp_like(${subject}, '(\B|\b|.)*(posts|scroll|group chat)(\B|\b|.)*', 'is') OR ${category} IN ('User Interface')
                                                                                                                 THEN 'Chat, Posts & Channel UI'
        WHEN regexp_like(${subject}, '(\B|\b|.)*(server)(\B|\b|.)*', 'is') OR ${category} IN ('Server Issue', 'Server Issues')
                                                                                                                 THEN 'Server Issues'
        WHEN regexp_like(${subject}, '(\B|\b|.)*(nonprofit|non-profit|npo|university|student|school)(\B|\b|.)*', 'is')
                                                                                                                 THEN 'Education & Non-Profit'
        WHEN regexp_like(${subject}, '(\B|\b|.)*(mysql|database|postgres|db|sql)(\B|\b|.)*', 'is') or ${category} = 'Database'
                                                                                                                 THEN 'Database'
        WHEN regexp_like(${subject}, '(\B|\b|.)*(pw|password|pasword|passwort)(\B|\b|.)*', 'is')
                                                                                                                 THEN 'Password'
        WHEN regexp_like(${subject},
                         '(\B|\b|.)*(users get invalid|login|logout|log in|log out|logged in|logged out|logon|log on|unable to access|log-in|log-out|logging in|log back|sign in|forgot username|sing in|user disconnecting|loggin)(\B|\b|.)*', 'is') or ${category} in ('Login')
                                                                                                                 THEN 'Login/Logout Issues'
        WHEN regexp_like(${subject}, '(\B|\b|.)*(upgrade|upgrading|Enterprise|e10|switch mattermost edition|switch edition)(\B|\b|.)*', 'is') or ${category} = 'Upgrading'
                                                                                                                 THEN 'Upgrade'
        WHEN regexp_like(${subject}, '(\B|\b|.)*(cloud|preparing your workspace|prepare your workspace)(\B|\b|.)*',
                         'is')
                                                                                                                 THEN 'Cloud'
        WHEN regexp_like(${subject}, '(\B|\b|.)*(slack)(\B|\b|.)*', 'is')
                                                                                                                 THEN 'Slack'
        WHEN regexp_like(${subject}, '(\B|\b|.)*(channel|sidebar|grouping|group away)(\B|\b|.)*', 'is')
                                                                                                                 THEN 'Channels & Sidebar'
        WHEN regexp_like(${subject}, '(\B|\b|.)*(email)(\B|\b|.)*', 'is')
                                                                                                                 THEN 'Email'
        WHEN regexp_like(${subject}, '(\B|\b|.)*(slash)(\B|\b|.)*', 'is')
                                                                                                                 THEN 'Slash Commands'
        WHEN regexp_like(${subject}, '(\B|\b|.)*(performance|compression|slowness|loading|unresponsive|lag)(\B|\b|.)*', 'is')
                                                                                                                 THEN 'Performance'
        WHEN regexp_like(${subject}, '(\B|\b|.)*(attachment|attachement|file|photo|attach|documents|image)(\B|\b|.)*', 'is')
                                                                                                                 THEN 'Files & Attachments'
        WHEN regexp_like(${subject}, '(\B|\b|.)*(preview)(\B|\b|.)*', 'is')
                                                                                                                 THEN 'Previews (Links/Files)'
        WHEN regexp_like(${subject},
                         '(\B|\b|.)*(not running|cannot start|can\'t start|production is down|not workign|outage|mattermost down|can\'t launch|unreachable|glitch|not running|doesn\'t open|not able|stopped working|production incident|crash|bug|whitescreen|white screen|greyscreen|grayscreen|grey screen|gray screen|issue|bad gateway|unavailable|500 error|error|service restart|not displaying|not working|prod down|prod not work|froze|service failed|went down|failing|cant open|can\'t open|broken|cpu spik)(\B|\b|.)*',
                         'is')
                                                                                                                 THEN 'General Crashes & Bugs'
        WHEN regexp_like(${subject}, '(\B|\b|.)*(contact us)(\B|\b|.)*', 'is')
                                                                                                                 THEN 'Contact Us'
        WHEN regexp_like(${subject}, '(\B|\b|.)*(trial)(\B|\b|.)*', 'is')
                                                                                                                 THEN 'Mattermost Trial'
        WHEN regexp_like(${subject}, '(\B|\b|.)*(migrate|migrating|migration)(\B|\b|.)*', 'is')
                                                                                                                 THEN 'Migration'
        WHEN regexp_like(${subject}, '(\B|\b|.)*(monitoring)(\B|\b|.)*', 'is')
                                                                                                                 THEN 'Monitoring'
        WHEN regexp_like(${subject}, '(\B|\b|.)*(rentention|delete data|delete old data|retention|dataretention|data retention|storage|deleting history|deleting chat history)(\B|\b|.)*', 'is')
                                                                                                                 THEN 'Data Retention & Storage'
        WHEN regexp_like(${subject}, '(\B|\b|.)*(uninstall)(\B|\b|.)*', 'is')
                                                                                                                 THEN 'Uninstall'
        WHEN regexp_like(${subject}, '(\B|\b|.)*(network|connection|connectivity|internet|connect)(\B|\b|.)*', 'is') or ${category} = 'Connectivity'
                                                                                                                 THEN 'Network Connection'
        WHEN regexp_like(${subject}, '(\B|\b|.)*(mattermost app|application|app review)(\B|\b|.)*', 'is')
                                                                                                                 THEN 'Mattermost Application'
        WHEN regexp_like(${subject}, '(\B|\b|.)*(consolidation|combining|combination of two licenses into one|consolidat|merge)(\B|\b|.)*', 'is')
                                                                                                                 THEN 'Mattermost Consolidation'
        WHEN regexp_like(${subject},
                         '(\B|\b|.)*(unlock|cannot access|can not access|reactivat|unlock account|disable account|disabling account|disabled account|locked account|locked out|disabled account|account deactivation|account deactivated|account deactvated|account lock|delete account|delete my account|account created by mistake|remove the account|cancel|leave|account deletion|locked out)(\B|\b|.)*',
                         'is')
                                                                                                                 THEN 'Account Deactivation/Lockout'
        WHEN regexp_like(${subject},
                         '(\B|\b|.)*(user deactivation|user deactivation|remove user|user removal|sync user|user sync|disabled users|disable user|user disabl|disable a user|disabling users)(\B|\b|.)*',
                         'is')
                                                                                                                 THEN 'User Deactivation'
        WHEN regexp_like(${subject}, '(\B|\b|.)*(notification|alerting|alarming|alert|alarm)(\B|\b|.)*', 'is') OR ${category} = 'Notifications & Status'
                                                                                                                 THEN 'Alerting & Notifications'
        WHEN regexp_like(${subject}, '(\B|\b|.)*(read message|read receipt|read reciept|alerting|alarming|alert|alarm)(\B|\b|.)*', 'is')
                                                                                                                 THEN 'Read Receipts'
        WHEN regexp_like(${subject}, '(\B|\b|.)*(documentation|docs)(\B|\b|.)*', 'is')
                                                                                                                 THEN 'Documentation'
        WHEN regexp_like(${subject}, '(\B|\b|.)*(price|pricing|quote|purchase)(\B|\b|.)*', 'is') or ${category} = 'Pricing'
                                                                                                                 THEN 'Pricing'
        WHEN regexp_like(${subject}, '(\B|\b|.)*(test)(\B|\b|.)*', 'is')
                                                                                                                 THEN 'Test'
        WHEN regexp_like(${subject}, '(\B|\b|.)*(multitenant|multi-tenan|tenant|tenancy|own environment)(\B|\b|.)*',
                         'is')
                                                                                                                 THEN 'Multi-Tenancy'
        WHEN regexp_like(${subject}, '(\B|\b|.)*(license|licensing|seats available|available seat)(\B|\b|.)*', 'is') OR ${category} = 'Licensing'
                                                                                                                 THEN 'Licensing & Seats'
        WHEN regexp_like(${subject}, '(\B|\b|.)*(intern|internship|work from home|hire|working from home|job|career|data analyst|working for mattermost|work for mattermost|work at mattermost)(\B|\b|.)*'
        , 'is')                                                                                                  THEN 'Jobs & Hiring'
        WHEN regexp_like(${subject}, '(\B|\b|.)*(contributor|customs duty receive|contribut)(\B|\b|.)*', 'is')
                                                                                                                 THEN 'Contributor Community'
        WHEN regexp_like(${subject}, '(\B|\b|.)*(encrypt|privacy|vulnerability|secure|security|ssl|proxy|firewall|untrusted|locking down)(\B|\b|.)*', 'is')
                                                                                                                 THEN 'Encryption, Security & Privacy'
        WHEN regexp_like(${subject}, '(\B|\b|.)*(gdpr)(\B|\b|.)*', 'is')
                                                                                                                 THEN 'GDPR'
        WHEN regexp_like(${subject}, '(\B|\b|.)*(implement)(\B|\b|.)*', 'is')
                                                                                                                 THEN 'Implementation'
        WHEN regexp_like(${subject}, '(\B|\b|.)*(account activat|activate account|mattermost account|account on mattermost|create account|reactivate)(\B|\b|.)*', 'is')
                                                                                                                 THEN 'Mattermost Account'
        WHEN regexp_like(${subject}, '(\B|\b|.)*(help|support|question|technical difficult|problem)(\B|\b|.)*', 'is') or ${category}  IN ('General Inquiry','General Support')
                                                                                                                 THEN 'General Support'
        WHEN regexp_like(${subject}, '(\B|\b|.)*(config|adding a phone number|subpath|install|nicknames|pronouns|modification|username|deployment)(\B|\b|.)*'
        , 'is') or ${category} = 'Installation'                                                                     THEN 'Installation & Configuration'
        WHEN regexp_like(${subject}, '(\B|\b|.)*(not possible|add feature)(\B|\b|.)*', 'is') or ${category} in ('Product')
                                                                                                                 THEN 'Product/Feature Request'
        WHEN regexp_like(${subject}, '(\B|\b|.)*(partnership|partner|resale|reseller)(\B|\b|.)*', 'is')
                                                                                                                 THEN 'Partnerships'
        WHEN regexp_like(${subject}, '(\B|\b|.)*(version)(\B|\b|.)*', 'is')
                                                                                                                 THEN 'Mattermost Version'
        WHEN regexp_like(${subject}, '(\B|\b|.)*(message|messaging)(\B|\b|.)*', 'is') or ${category} = 'Messaging'
                                                                                                                 THEN 'Messaging Issue'
        WHEN regexp_like(${subject}, '(\B|\b|.)*(disabl)(\B|\b|.)*', 'is')
                                                                                                                 THEN 'Disabling Feature'
        WHEN regexp_like(${subject}, '(\B|\b|.)*(quarterly|trueup|true up|usage screenshot)(\B|\b|.)*', 'is') or ${category} = 'Compliance & Auditing'
                                                                                                                 THEN 'Compliance & Auditing'
        WHEN regexp_like(${subject}, '(\B|\b|.)*(additional seat|more users|expand|expansion)(\B|\b|.)*', 'is')
                                                                                                                 THEN 'Expansion'
        WHEN regexp_like(${subject}, '(\B|\b|.)*(thread|reply|replies)(\B|\b|.)*', 'is')
                                                                                                                 THEN 'Threads & Replies'
        WHEN regexp_like(${subject}, '(\B|\b|.)*(invoic|pay per month|pay for month|billing|monthly payment|paypal|visa|charge|receipt|bill|payment|shipping address|billing address)(\B|\b|.)*', 'is')
                                                                                                                 THEN 'Billing & Invoicing'
        WHEN regexp_like(${subject}, '(\B|\b|.)*(audio|video|call)(\B|\b|.)*', 'is')
                                                                                                                 THEN 'Audio & Video'
        WHEN regexp_like(${subject}, '(\B|\b|.)*(unsubscribe)(\B|\b|.)*', 'is')
                                                                                                                 THEN 'Unsubscribe'
        WHEN ${category} in ('User Issue')                                                                       THEN 'General User Issue'
        WHEN ${category} in ('Uncategorized', 'Unknown')                                                                    THEN 'Uncategorized'

                                                                                                                 ELSE 'Uncategorized' END ;;
  }

  dimension: business_impact {
    type: string
    sql: ${TABLE}."BUSINESS_IMPACT" ;;
  }

  dimension: last_comment_at {
    description: "Date last comment was added on a ticket"
    group_label: "Last Comment"
    group_item_label: "Date (All)"
    label: "Last Comment Date (All)"
    type: date
    sql: ${TABLE}."LAST_COMMENT_AT";;
  }

  dimension: last_customer_comment_at {
    description: "Date last comment was added by a customer on a ticket"
    group_label: "Last Comment"
    group_item_label: "Date (Customer)"
    label: "Last Comment Date (Customer)"
    type: date
    sql: ${TABLE}.last_enduser_comment_at ;;
  }

  dimension: last_agent_or_admin_comment_at {
    description: "Date last comment was added by an agent or admin on a ticket."
    group_label: "Last Comment"
    group_item_label: "Date (Agent)"
    label: "Last Comment Date (Agent)"
    type: date
    sql: ${TABLE}.last_non_enduser_comment_at;;
   }

  dimension: days_since_last_agent_admin_comment {
    description: "Number of days since last comment on a ticket from an agent or admin."
    group_label: "Last Comment"
    group_item_label: "Days Since (Agent)"
    label: "Days Since Last Comment (Agent)"
    type: number
    sql: CASE WHEN NOT ${open} THEN NULL ELSE current_date - ${last_agent_or_admin_comment_at}::date END;;
  }

  dimension: days_since_last_customer_comment {
    description: "Number of days since last comment on a ticket from a customer."
    group_label: "Last Comment"
    group_item_label: "Days Since (Customer)"
    label: "Days Since Last Comment (Customer)"
    type: number
    sql: CASE WHEN NOT ${open} THEN NULL ELSE current_date - ${last_customer_comment_at}::date END;;
  }

  dimension: days_since_last_comment {
    description: "Number of days since last comment on a ticket from anyone."
    group_label: "Last Comment"
    group_item_label: "Days Since (All)"
    label: "Days Since Last Comment (All)"
    type: number
    sql: CASE WHEN NOT ${open} THEN NULL ELSE current_date - ${last_comment_at}::date END;;
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

  dimension: days_since_last_comment_range {
    group_label: "Last Comment"
    group_item_label: "Days Since Tier (Agent)"
    label: "Days Since Last Comment Tier (Agent)"
    description: "Range of days since last agent or admin comment on a ticket."
    type: tier
    style: integer
    tiers: [1, 4, 8, 14]
    sql: ${days_since_last_agent_admin_comment};;
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
    sql: COALESCE(${TABLE}."ASSIGNEE_NAME",'Support Team') ;;
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
    sql: coalesce(${sales_billing_support_category},${tech_support_category},'Uncategorized') ;;
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

  dimension: requester_name {
    label: "Requester Name"
    description: "Name of person requesting ticket"
    type: string
    sql: ${TABLE}."REQUESTER_NAME" ;;
  }

  dimension: submitter_name {
    label: "Submitter Name"
    description: "Name of person submitting ticket"
    type: string
    sql: ${TABLE}."SUBMITTER_NAME" ;;
  }

  dimension: submitter_email {
    label: "Submitter Email"
    description: "Email of person submitting ticket"
    type: string
    sql: ${TABLE}."SUBMITTER_EMAIL" ;;
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

  dimension: create_lead {
    hidden: yes
    sql: 'Create/Update Lead' ;;
    action: {
      label: "Create/Update Lead"
      url: "https://hooks.zapier.com/hooks/catch/586877/ok0wnn5/"
      param: {
        name: "submitter_email"
        value: "{{ submitter_email }}"
      }
      param: {
        name: "most_recent_action__c"
        value: "Contact Request"
      }
      param: {
        name: "most_recent_action_detail__c"
        value: "Admin Advisory"
      }
      param: {
        name: "most_recent_lead_source__c"
        value: "Referral"
      }
      param: {
        name: "most_recent_lead_source_detail__c"
        value: "MM Product"
      }
      param: {
        name: "description"
        value: "{{ description }}"
      }
      user_attribute_param: {
        user_attribute: email
        name: "action_performed_by"
      }
    }
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

  measure: number_of_good_csat_tickets {
  label: "# of good CSAT tickets"
  group_label: "CSAT"
  description: "# of tickets that have a good CSAT response"
  type: count_distinct
  sql: CASE WHEN ${satisfaction_rating_score} = 'good' THEN ${ticket_id} END ;;
  drill_fields: [core_drill_fields*]
  }

  measure: number_of_bad_csat_tickets {
    label: "# of bad CSAT tickets"
    group_label: "CSAT"
    description: "# of tickets that have a bad CSAT response"
    type: count_distinct
    sql: CASE WHEN ${satisfaction_rating_score} = 'bad' THEN ${ticket_id} END ;;
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
    fields: [account.name, requester_name, ticket_id, subject, assignee_name, status, support_type, satisfaction_rating_score, category, ticket_support_type, days_since_last_agent_admin_comment, priority, created_date, solved_at_time, calendar_days_open,
            first_response_sla, reply_time_in_minutes_bus, met_first_response_sla, followup_internal_sla, followup_internal, met_followup_internal_sla]
  }

}
