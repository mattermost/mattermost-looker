# This is the view file for the analytics.blp.license_server_fact table.
view: license_server_fact {
  sql_table_name: blp.license_server_fact ;;
  view_label: "License Server Fact"

  # SETS
  set: licensed_server_drill {
    fields: [server_id, customer_id, customer_name, license_id, company, edition, users, trial, issued_date, start_date, expire_date, license_activation_date, last_active_date]
  }

  # DIMENSIONS
  dimension: active_last_7days {
    type: yesno
    description: "Boolean indicating the customer has sent telemetry w/in the last 7 days."
    sql: CASE WHEN ${TABLE}.last_telemetry_date >= CURRENT_DATE - INTERVAL '7 DAYS' THEN TRUE ELSE FALSE END ;;
  }

  dimension_group: last_telemetry {
    type: time
    timeframes: [date, week, month, year, fiscal_year, fiscal_quarter]
    sql: ${TABLE}.last_telemetry_date ;;
  }

  dimension: id {
    description: ""
    type: string
    sql: ${TABLE}.id ;;
    hidden: no
    primary_key: yes
  }

  dimension: server_id {
    description: ""
    type: string
    sql: ${TABLE}.server_id ;;
    hidden: no
  }

  dimension: license_id {
    description: ""
    type: string
    sql: ${TABLE}.license_id ;;
    hidden: no
  }

  dimension: company {
    description: "The coalesced Salesforce Account Name or, if unavailabe/does not exist, license company name provided during license purchasing and/or trial request process."
    type: string
    sql: COALESCE(${account_name}, ${server_fact.company_name}, ${TABLE}.company) ;;
    hidden: no
  }

  dimension: edition {
    label: "Edition"
    description: ""
    type: string
    sql: ${TABLE}.edition ;;
    hidden: no
  }

  dimension: users {
    label: "Users"
    description: ""
    type: number
    sql: ${TABLE}.users ;;
    hidden: no
  }

  dimension: trial {
    description: "Indicates the license is marked a trial or is <= 90 days from start to expire."
    type: yesno
    sql: CASE WHEN ${TABLE}.trial OR DATEDIFF(day, ${start_date}::date, ${expire_date}::date) <= 90 then TRUE ELSE FALSE END ;;
    hidden: no
  }

  dimension: license_email {
    description: ""
    type: string
    sql: ${TABLE}.license_email ;;
    hidden: no
  }

  dimension: contact_sfid {
    description: ""
    type: string
    sql: ${TABLE}.contact_sfid ;;
    hidden: no
  }

  dimension: account_sfid {
    type: string
    sql: COALESCE(${server_fact.account_sfid}, ${TABLE}.account_sfid) ;;
    hidden: yes
    link: {
      label: "Salesforce Account Record"
      url: "https://mattermost.lightning.force.com/lightning/r/{{ value }}/view"
      icon_url: "https://mattermost.my.salesforce.com/favicon.ico"
    }
    link: {
      label: "Server Metrics Dashboard"
      url: "https://mattermost.looker.com/dashboards/95?Account%20SFID%2FCustomer%20ID={{ value }}"
    }
  }

  dimension: account_name {
    type: string
    sql: COALESCE(${server_fact.account_name}, ${TABLE}.account_name) ;;
    hidden: yes
    link: {
      label: "Salesforce Account Record"
      url: "https://mattermost.lightning.force.com/lightning/r/{{ account_sfid._value }}/view"
      icon_url: "https://mattermost.my.salesforce.com/favicon.ico"
    }
    link: {
      label: "Server Metrics Dashboard"
      url: "https://mattermost.looker.com/dashboards/95?Account%20SFID%2FCustomer%20ID={{ account_sfid._value }}"
    }
  }

  dimension: stripeid {
    description: "The stripeid associated with the licensed customer."
    type: string
    sql: ${TABLE}.stripeid ;;
    hidden: no
  }

  dimension: customer_id {
    description: "The customer id associated with the licensed customer. Coalesced license id and OrgM account sfid."
    type: string
    sql: ${TABLE}.customer_id ;;
    link: {
      label: "Salesforce Account Record"
      url: "https://mattermost.lightning.force.com/lightning/r/{{ account_sfid._value }}/view"
      icon_url: "https://mattermost.my.salesforce.com/favicon.ico"
    }
    link: {
      label: "Server Metrics Dashboard"
      url: "https://mattermost.looker.com/dashboards/95?Account%20SFID%2FCustomer%20ID={{ account_sfid._value }}"
    }
    hidden: no
  }

  dimension: in_salesforce {
    description: "Boolean indicating the company/customer has an account record created in Salesforce"
    type: yesno
    sql: CASE WHEN ${account_sfid} is null then false else true end ;;
  }

  dimension: license_customer_id {
    description: "The license customer id associated with the licensed customer."
    type: string
    sql: ${TABLE}.license_customer_id ;;
    hidden: no
  }

  dimension: customer_name {
    description: "The customer name associated with the licensed customer. Coalesced license company and OrgM account name."
    type: string
    sql: ${TABLE}.customer_name ;;
    link: {
      label: "Salesforce Account Record"
      url: "https://mattermost.lightning.force.com/lightning/r/{{ account_sfid._value }}/view"
      icon_url: "https://mattermost.my.salesforce.com/favicon.ico"
    }
    link: {
      label: "Server Metrics Dashboard"
      url: "https://mattermost.looker.com/dashboards/95?Account%20SFID%2FCustomer%20ID={{ account_sfid._value }}"
    }
    hidden: no
  }

  dimension: opportunity_sfid {
    description: "The Salesforce Opportunity ID associated wtih the license id."
    type: string
    sql: ${TABLE}.opportunity_sfid ;;
  }

  dimension: latest_license {
    description: "Boolean indicating the license is the last license activated and associated with a server."
    type: yesno
    sql: CASE WHEN ${TABLE}.license_priority_rank = 1 THEN TRUE ELSE FALSE END ;;
    hidden: no
  }

  dimension: is_activated {
    description: "Boolean indicating the license is associated with an activated server that has sent telemetry with the license key associated."
    type: yesno
    sql: CASE WHEN ${license_activation_date} is not null THEN TRUE ELSE FALSE END ;;
  }

  dimension: active_users {
    description: "The sum of the measure for all servers associated with the customer id that have sent telemetry in the last 7 days."
    group_label: "Aggregate Server Telemetry"
    type: number
    sql: ${TABLE}.active_users ;;
  }

  dimension: monthly_active_users {
    description: "The sum of the measure for all servers associated with the customer id that have sent telemetry in the last 7 days."
    group_label: "Aggregate Server Telemetry"
    type: number
    sql: ${TABLE}.monthly_active_users ;;
  }

  dimension:bot_accounts {
    description: "The sum of the measure for all servers associated with the customer id that have sent telemetry in the last 7 days."
    group_label: "Aggregate Server Telemetry"
    type: number
    sql: ${TABLE}.bot_accounts ;;
  }

  dimension: bot_posts_previous_day {
    description: "The sum of the measure for all servers associated with the customer id that have sent telemetry in the last 7 days."
    group_label: "Aggregate Server Telemetry"
    type: number
    sql: ${TABLE}.bot_posts_previous_day ;;
  }

  dimension: direct_message_channels {
    description: "The sum of the measure for all servers associated with the customer id that have sent telemetry in the last 7 days."
    group_label: "Aggregate Server Telemetry"
    type: number
    sql: ${TABLE}.direct_message_channels ;;
  }

  dimension: incoming_webhooks {
    description: "The sum of the measure for all servers associated with the customer id that have sent telemetry in the last 7 days."
    group_label: "Aggregate Server Telemetry"
    type: number
    sql: ${TABLE}.incoming_webhooks ;;
  }

  dimension: outgoing_webhooks {
    description: "The sum of the measure for all servers associated with the customer id that have sent telemetry in the last 7 days."
    group_label: "Aggregate Server Telemetry"
    type: number
    sql: ${TABLE}.outgoing_webhooks ;;
  }

  dimension: posts {
    description: "The sum of all posts made on servers associated with the customer id."
    group_label: "Aggregate Server Telemetry"
    type: number
    sql: ${TABLE}.posts ;;
  }

  dimension: posts_previous_day {
    description: "The sum of the measure for all servers associated with the customer id that have sent telemetry in the last 7 days."
    group_label: "Aggregate Server Telemetry"
    type: number
    sql: ${TABLE}.posts_previous_day ;;
  }

  dimension: private_channels {
    description: "The sum of the measure for all servers associated with the customer id that have sent telemetry in the last 7 days."
    group_label: "Aggregate Server Telemetry"
    type: number
    sql: ${TABLE}.private_channels - COALESCE(${TABLE}.private_channels_deleted, 0) ;;
  }

  dimension: public_channels {
    description: "The sum of the measure for all servers associated with the customer id that have sent telemetry in the last 7 days."
    group_label: "Aggregate Server Telemetry"
    type: number
    sql: ${TABLE}.public_channels - COALESCe(${TABLE}.public_channels_deleted, 0) ;;
  }

  dimension: registered_users {
    description: "The sum of the measure for all servers associated with the customer id that have sent telemetry in the last 7 days."
    group_label: "Aggregate Server Telemetry"
    type: number
    sql: ${TABLE}.registered_users - COALESCE(${TABLE}.registered_deactivated_users, 0) ;;
  }

  dimension: registered_inactive_users {
    description: "The sum of the measure for all servers associated with the customer id that have sent telemetry in the last 7 days."
    group_label: "Aggregate Server Telemetry"
    type: number
    sql: ${TABLE}.registered_inactive_users ;;
  }

  dimension: slash_commands {
    description: "The sum of the measure for all servers associated with the customer id that have sent telemetry in the last 7 days."
    group_label: "Aggregate Server Telemetry"
    type: number
    sql: ${TABLE}.slash_commands ;;
  }

  dimension: teams {
    description: "The sum of the measure for all servers associated with the customer id that have sent telemetry in the last 7 days."
    group_label: "Aggregate Server Telemetry"
    type: number
    sql: ${TABLE}.teams ;;
  }

  dimension: guest_accounts {
    description: "The sum of the measure for all servers associated with the customer id that have sent telemetry in the last 7 days."
    group_label: "Aggregate Server Telemetry"
    type: number
    sql: ${TABLE}.guest_accounts ;;
  }

  dimension: expired_license {
    type: yesno
    description: "Boolean indicating the license is expired."
    sql: CASE WHEN ${license_retired_date} <= CURRENT_DATE OR (${license_retired_date} IS NULL AND ${expire_date} <= CURRENT_DATE) THEN TRUE ELSE FALSE END ;;
  }

  measure: is_activated_max {
    type: yesno
    sql: MAX(CASE WHEN ${license_activation_date} is not null THEN TRUE ELSE FALSE END) ;;
  }

  dimension: first_paid_license {
    type: yesno
    sql: ${server_fact.first_paid_license_date} = ${issued_date} ;;
  }

  dimension: first_trial_license {
    type: yesno
    sql: ${server_fact.first_trial_license_date} = ${issued_date} and not ${trial};;
  }

  dimension: days_to_expiration {
    type: number
    sql: datediff(DAYS, CURRENT_DATE::DATE, ${expire_date}::DATE) ;;
  }

  measure: min_days_to_expiration {
    description: "The min. number of days until a license expires within each grouping."
    type: number
    sql: min(${days_to_expiration}) ;;
  }


  # DIMENSION GROUPS/DATES
  dimension_group: issued {
    label: "License Issued"
    description: ""
    type: time
    timeframes: [date, month, year]
    sql: ${TABLE}.issued_date ;;
    hidden: no
  }

  measure: min_issued_date {
    type: date
    sql: MIN(${issued_date}::date) ;;
  }

  dimension_group: start {
    label: "License Start"
    description: ""
    type: time
    timeframes: [date, month, year]
    sql: ${TABLE}.start_date ;;
    hidden: no
  }

  measure: min_start_date {
    type: date
    sql: MIN(${start_date}::date) ;;
  }

  dimension_group: expire {
    label: "License Expire"
    description: ""
    type: time
    timeframes: [date, month, year]
    sql: ${TABLE}.expire_date ;;
    hidden: no
  }

  measure: max_expire_date {
    type: date
    sql: MAX(${expire_date}::date) ;;
  }

  dimension_group: license_activation {
    description: ""
    type: time
    timeframes: [date, week, month, year, fiscal_year, fiscal_quarter]
    sql: ${TABLE}.license_activation_date ;;
    hidden: no
  }

  dimension_group: last_active {
  description: ""
  type: time
  timeframes: [date, week, month, year, fiscal_year, fiscal_quarter]
    sql: ${TABLE}.last_active_date ;;
    hidden: no
  }

  dimension_group: license_retired {
    description: "Value is retrieved via a windowing function that identifies the start date of the next license associated with the server, so there is no overlapping of license keys on Server logging dates."
    type: time
    timeframes: [date, week, month, year, fiscal_year, fiscal_quarter]
    sql: ${TABLE}.license_retired_date ;;
    hidden: no
  }


  # MEASURES
  measure: count {
    description: "Count of rows/occurrences."
    type: count
    drill_fields: [licensed_server_drill*]
  }

  measure: server_count {
    label: " Server Count"
    description: "The distinct count of Servers per grouping."
    type: count_distinct
    sql: ${server_id} ;;
    drill_fields: [licensed_server_drill*]
  }

  measure: license_count {
    label: " License Count"
    description: "The distinct count of Licenses per grouping."
    type: count_distinct
    sql: ${license_id} ;;
    drill_fields: [licensed_server_drill*]
  }

  measure: users_sum {
    description: "The sum of Users per grouping."
    type: sum
    sql: ${users} ;;
    drill_fields: [licensed_server_drill*]
  }

  measure: users_sum_distinct {
    description: "The sum of distinct Users values per grouping."
    label: "Licensed Users (Distinct)"
    type: number
    sql: SUM(DISTINCT ${users}) ;;
    drill_fields: [licensed_server_drill*]
  }

  measure: customer_count {
    description: "The count of distinct customers per grouping."
    type: count_distinct
    sql: ${customer_id} ;;
    drill_fields: [licensed_server_drill*]
  }

  measure: active_customer_count {
    description: "The count of distinct accounts that have sent server telemetry w/in the last 7 days."
    type: count_distinct
    sql: case when ${TABLE}.last_telemetry_date >= current_date - interval '7 days' then ${customer_id} else null end ;;
    drill_fields: [licensed_server_drill*]
  }

  measure: inactive_customer_count {
    description: "The count of distinct accounts that have not sent server telemetry w/in the last 7 days."
    type: count_distinct
    sql: case when ${TABLE}.last_telemetry_date < current_date - interval '7 days' then ${customer_id} else null end ;;
    drill_fields: [licensed_server_drill*]
  }

  measure: customer_wout_telemetry_count {
    label: "Customers w/ No Telemetry"
    description: "The count of distinct accounts that have not sent server telemetry w/in the last 7 days."
    type: count_distinct
    sql: case when ${TABLE}.last_telemetry_date IS NULL then ${customer_id} else null end ;;
    drill_fields: [licensed_server_drill*]
  }

  measure: max_edition {
    label: "Edition (Max)"
    description: "The highest (E20 -> E10 -> Null) edition found in each grouped dimension."
    type: string
    sql: CASE WHEN
              MAX(CASE WHEN ${edition} = 'E20' THEN 3
                WHEN ${edition} = 'E10' THEN 2
                WHEN ${edition} IS NULL THEN 0
                ELSE 0 END) = 3 THEN 'E20'
              WHEN
               MAX(CASE WHEN ${edition} = 'E20' THEN 3
                WHEN ${edition} = 'E10' THEN 2
                WHEN ${edition} IS NOT NULL THEN 1
                WHEN ${edition} IS NULL THEN 0
                ELSE 0 END) = 2 THEN 'E10'
             WHEN
              MAX(CASE WHEN ${edition} = 'E20' THEN 3
                WHEN ${edition} = 'E10' THEN 2
                WHEN ${edition} IS NOT NULL THEN 1
                WHEN ${edition} IS NULL THEN 0
                ELSE 0 END) = 0 THEN NULL
            ELSE NULL END;;
  }

}
