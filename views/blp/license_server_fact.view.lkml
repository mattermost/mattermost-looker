# This is the view file for the analytics.blp.license_server_fact table.
view: license_server_fact {
  sql_table_name: blp.license_server_fact ;;
  view_label: "License Server Fact"

  # SETS
  set: licensed_server_drill {
    fields: [server_id, customer_id, customer_name, license_email,
      license_id, company, edition, users, trial, issued_date, start_date,
      expire_date, license_activation_date, last_active_date]
  }

  set: view_default {
    fields: [active_last_7days,last_telemetry_date, last_server_telemetry_date, id, active_paying_customer, server_id, license_id, company, edition, trial, opportunity_sfid, account_sfid, users, license_email,
contact_sfid, account_name, stripeid, customer_id, license_customer_id, customer_name, latest_license, active_users, customer_licensed_users, monthly_active_users,
bot_accounts, bot_posts_previous_day, direct_message_channels, incoming_webhooks, outgoing_webhooks, posts, posts_previous_day, private_channels,
public_channels, registered_users, registered_inactive_users, slash_commands, teams, guest_accounts, issued_date,
start_date, expire_date, license_activation_date, last_active_date, license_retired_date, ]
  }

  # DIMENSIONS
  dimension: active_last_7days {
    type: yesno
    description: "Boolean indicating the customer has sent telemetry w/in the last 7 days."
    sql: CASE WHEN ${TABLE}.last_telemetry_date >= CURRENT_DATE - INTERVAL '7 DAYS' THEN TRUE ELSE FALSE END ;;
  }

  dimension_group: last_telemetry {
    type: time
    timeframes: [raw, date, week, month, year, fiscal_year, fiscal_quarter]
    sql: ${TABLE}.last_telemetry_date ;;
    hidden: yes
  }

  dimension_group: last_server_telemetry {
    description: "The last time the server associated with the license sent telemetry."
    type: time
    timeframes: [raw, date, week, month, year, fiscal_year, fiscal_quarter]
    sql: ${TABLE}.last_server_telemetry ;;
  }

  dimension: current_customer {
    label: "Active License"
    description: "Boolean indicating the license is the customers latest and is not expired (customers can expand mid-contract and be provisioned a new license - the expire date of the previous license is never updated, so there is logic in place to identify the latest)."
    sql: CASE WHEN ${license_retired_date} >= CURRENT_DATE AND LOWER(${customer_name}) not like 'mattermost%' and ${latest_license} THEN TRUE ELSE FALSE END ;;
    type: yesno
  }

  dimension: active_paying_customer {
    label: "Active, Licensed Customer"
    description: "Boolean indicating the license is currently active (not expired), the server telemetry is not outdated (sent telemetry w/in 7 days) or the license has never been associated with a server, and it is not a trial."
    type: yesno
    sql: CASE WHEN (${last_server_telemetry_date} >= CURRENT_DATE - INTERVAL '7 DAYS' OR ${license_activation_date} IS NULL) AND ${latest_license} AND ${license_retired_date} >= CURRENT_DATE AND ${customer_name} NOT LIKE 'Mattermost%' THEN TRUE ELSE FALSE END ;;
  }

  dimension: trial_request_type {
    label: "Trial Request Type"
    type: string
    sql: CASE WHEN ${cloud_customer} THEN 'Cloud'
              WHEN ${trial_requests.server_id} IS NOT NULL and ${trial_requests.site_url} != 'https://mattermost.com' and COALESCE(${trial_requests.valid_email}, TRUE) THEN 'In-Product'
              WHEN ${trial} AND COALESCE(${trial_requests.valid_email}, TRUE) THEN 'Website'
            ELSE NULL END ;;
  }

  dimension: id {
    description: ""
    type: string
    sql: ${TABLE}.id ;;
    hidden: no
    primary_key: yes
  }

  dimension: server_id {
    description: "Server ID"
    type: string
    sql: ${TABLE}.server_id ;;
    hidden: no
  }

  dimension: license_id {
    description: "License ID"
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
    description: "Edition"
    type: string
    sql:  ${TABLE}.edition ;;
    # --IFF(NOT ${TABLE}.trial and ${TABLE}.edition IS NULL AND ${TABLE}.opportunity_sfid IS NOT NULL AND ${TABLE}.account_sfid IS NOT NULL, 'E20', COALESCE(${TABLE}.edition, 'E20 Trial')) ;;
    hidden: no
  }

  dimension: edition_null {
    label: "Edition"
    description: ""
    type: string
    sql: ${TABLE}.edition ;;
    hidden: yes
  }

  dimension: users {
    label: "Users"
    description: ""
    type: number
    sql: ${TABLE}.users ;;
    hidden: no
  }

  dimension: paying_cloud_customer {
    group_label: "Cloud Filters"
    description: "Boolean indicating the license is associated with a *paying* cloud customer."
    type: yesno
    sql:  CASE WHEN CONTAINS(COALESCE(lower(${edition}), 'None'), 'cloud enterprise') THEN TRUE
    WHEN CONTAINS(COALESCE(lower(${edition}), 'None'), 'cloud professional') THEN TRUE
    ELSE FALSE END ;;
  }

  dimension: cloud_customer {
    group_label: "Cloud Filters"
    description: "Boolean indicating the license is associated with a cloud customer."
    type: yesno
    sql:  CASE WHEN COALESCE(lower(${edition}), 'None') LIKE '%cloud%' THEN TRUE ELSE FALSE END ;;
  }

  dimension: trial {
    description: "Indicates the license is marked a trial or is <= 90 days from start to expire."
    type: yesno
    sql: CASE WHEN ${edition} = 'E20 Trial' THEN TRUE ELSE FALSE END;;
    hidden: no
  }

  dimension: license_email {
    description: "License Email"
    type: string
    sql: ${TABLE}.license_email ;;
    hidden: no
  }

  dimension: email_type {
    description: "Email Type"
    type: string
    sql: CASE WHEN ${license_email} like '%gmail%' THEN 'gmail'
    WHEN ${license_email} not like '%gmail%' THEN 'company_email'
    ELSE '-' END ;;
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
      icon_url: "https://www.google.com/s2/favicons?domain=looker.com"
    }
    link: {
      label: "Customer 360 Dashboard"
      url: "https://mattermost.looker.com/dashboards/175?Account%20Name=&Account%20SFID={{ account_sfid._value }}"
      icon_url: "https://www.google.com/s2/favicons?domain=looker.com"
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
      icon_url: "https://www.google.com/s2/favicons?domain=looker.com"
    }
    link: {
      label: "Customer 360 Dashboard"
      url: "https://mattermost.looker.com/dashboards/175?Account%20Name=&Account%20SFID={{ account_sfid._value }}"
      icon_url: "https://www.google.com/s2/favicons?domain=looker.com"
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
      url: "https://mattermost.lightning.force.com/lightning/r/{{ value }}/view"
      icon_url: "https://mattermost.my.salesforce.com/favicon.ico"
    }
    link: {
      label: "Server Metrics Dashboard"
      url: "https://mattermost.looker.com/dashboards/95?Account%20SFID%2FCustomer%20ID={{ value }}"
    }
    link: {
      label: "Customer 360 Dashboard"
      url: "https://mattermost.looker.com/dashboards/175?Account%20Name=&Account%20SFID={{ value }}"
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

  dimension: customer_name_unlinked {
    label: " Customer Name (Unlinked)"
    description: "Customer name. Created to separate Name and ID fields, which are both included in the same Salesforce customer field."
    type: string
    sql: ${TABLE}.customer_name ;;
    hidden: no
  }

  dimension: customer_name {
    description: "The customer name associated with the licensed customer. Coalesced license company and OrgM account name."
    type: string
    sql: ${TABLE}.customer_name ;;
    link: {
      label: "Salesforce Account Record"
      url: "https://mattermost.lightning.force.com/lightning/r/{{ customer_id._value }}/view"
      icon_url: "https://mattermost.my.salesforce.com/favicon.ico"
    }
    link: {
      label: "Server Metrics Dashboard"
      url: "https://mattermost.looker.com/dashboards/95?Account%20SFID%2FCustomer%20ID={{ customer_id._value }}"
      icon_url: "https://www.google.com/s2/favicons?domain=looker.com"
    }
    link: {
      label: "Customer 360 Dashboard"
      url: "https://mattermost.looker.com/dashboards/175?Account%20Name=&Account%20SFID={{ customer_id._value }}"
      icon_url: "https://www.google.com/s2/favicons?domain=looker.com"
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
    order_by_field: active_users_sort
  }

  dimension: active_users_sort {
    description: "The sum of the measure for all servers associated with the customer id that have sent telemetry in the last 7 days."
    group_label: "Aggregate Server Telemetry"
    type: number
    sql: COALESCE(${TABLE}.active_users, 0) ;;
    hidden: yes
  }

  dimension: customer_licensed_users {
    description: "The sum of the measure for all servers associated with the customer id that have sent telemetry in the last 7 days."
    group_label: "Aggregate Server Telemetry"
    type: number
    sql: ${TABLE}.customer_license_users ;;
    order_by_field: customer_licensed_users_sort
  }

  dimension: customer_licensed_users_sort {
    description: "The sum of the measure for all servers associated with the customer id that have sent telemetry in the last 7 days."
    group_label: "Aggregate Server Telemetry"
    type: number
    sql: COALESCE(${TABLE}.customer_license_users, 0) ;;
    hidden: yes
  }

  dimension: mau_pct_licensed {
    description: "The percentage/ratio of monthly active users to licensed users."
    label: "MAU % of Licensed"
    group_label: "Aggregate Server Telemetry"
    type: number
    value_format_name: percent_1
    sql: ${monthly_active_users}::float/NULLIF(${customer_licensed_users}::float, 0) ;;
  }

  dimension: dau_pct_licensed {
    description: "The percentage/ratio of daily active users to licensed users."
    label: "DAU % of Licensed"
    group_label: "Aggregate Server Telemetry"
    type: number
    value_format_name: percent_1
    sql: ${active_users}::float/NULLIF(${customer_licensed_users}::float, 0) ;;
  }

  dimension: registered_pct_licensed {
    description: "The percentage/ratio of registered users to licensed users."
    label: "License Utilization"
    group_label: "Aggregate Server Telemetry"
    type: number
    value_format_name: percent_1
    sql: ${registered_users}::float/NULLIF(${customer_licensed_users}::float, 0) ;;
  }

  dimension: monthly_active_users {
    description: "The sum of the measure for all servers associated with the customer id that have sent telemetry in the last 7 days."
    group_label: "Aggregate Server Telemetry"
    type: number
    sql: ${TABLE}.monthly_active_users ;;
    order_by_field: monthly_active_users_sort
  }

  dimension: monthly_active_users_sort {
    description: "The sum of the measure for all servers associated with the customer id that have sent telemetry in the last 7 days."
    group_label: "Aggregate Server Telemetry"
    type: number
    sql: COALESCE(${TABLE}.monthly_active_users, 0) ;;
    hidden: yes
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
    order_by_field: registered_users_sort
  }

  dimension: registered_users_sort {
    description: "The sum of the measure for all servers associated with the customer id that have sent telemetry in the last 7 days."
    group_label: "Aggregate Server Telemetry"
    type: number
    sql: COALESCE(${registered_users}, 0) ;;
    hidden: yes
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

  dimension: channels {
    description: "The total number of public, private, and direct message channels for all servers associated with the customer id that have sent telemetry in the last 7 days."
    group_label: "Aggregate Server Telemetry"
    type: number
    sql: coalesce(${direct_message_channels}, 0) + coalesce(${public_channels}, 0) + coalesce(${private_channels}, 0) ;;
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
    label: "Max. Days to Expiration"
    description: "The max. number of days until a license expires within each grouping."
    type: number
    sql: max(${days_to_expiration}) ;;
  }


  # DIMENSION GROUPS/DATES
  dimension_group: issued {
    label: "License Issued Date"
    description: "License Issued Date"
    type: time
    timeframes: [raw, date, month, year, week, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.issued_date ;;
    hidden: no
  }

  measure: min_issued_date {
    type: date
    sql: MIN(${issued_date}::date) ;;
  }

  dimension_group: start {
    label: "License Start Date"
    description: "License Start Date"
    type: time
    timeframes: [raw, date, month, year, week, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.start_date ;;
    hidden: no
  }

  measure: min_start_date {
    type: date
    sql: MIN(${start_date}::date) ;;
  }

  dimension_group: expire {
    label: "License Expire Date"
    description: "License Expire Dat"
    type: time
    timeframes: [raw, date, month, year, week, fiscal_quarter, fiscal_year]
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
    timeframes: [raw, date, week, month, year, fiscal_year, fiscal_quarter]
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
    sql: case when ${trial_request_type} = 'In-Product' then ${server_id} else ${license_email} end;;
    drill_fields: [licensed_server_drill*]
  }

  measure: license_count_active_users_7days {
    label: " Licenses w/ Active Users (>= 7 Days)"
    description: "The distinct count of Licenses with active usership >= 7 days from the license issued date per grouping."
    type: count_distinct
    sql: CASE WHEN ${server_fact.last_active_user_date}::date >= ${issued_date}::date + INTERVAL '7 DAYS'
            THEN case when ${trial_request_type} = 'In-Product' then ${server_id} else ${license_email} end
            ELSE NULL END;;
    drill_fields: [licensed_server_drill*]
  }

  measure: license_count_active_users_14days {
    label: " Licenses w/ Active Users (>= 14 Days)"
    description: "The distinct count of Licenses with active usership >= 14 days from the license issued date per grouping."
    type: count_distinct
    sql: CASE WHEN ${server_fact.last_active_user_date}::date >= ${issued_date}::date + INTERVAL '14 DAYS'
            THEN case when ${trial_request_type} = 'In-Product' then ${server_id} else ${license_email} end
            ELSE NULL END;;
    drill_fields: [licensed_server_drill*]
  }

  measure: license_count_active_users_28days {
    label: " Licenses w/ Active Users (>= 28 Days)"
    description: "The distinct count of Licenses with active usership >= 28 days from the license issued date per grouping."
    type: count_distinct
    sql: CASE WHEN ${server_fact.last_active_user_date}::date >= ${issued_date}::date + INTERVAL '28 DAYS'
            THEN case when ${trial_request_type} = 'In-Product' then ${server_id} else ${license_email} end
            ELSE NULL END;;
    drill_fields: [licensed_server_drill*]
  }

  measure: list_of_email {
    type: string
    sql: LISTAGG(DISTINCT ${license_email}, ', ') ;;
  }



  measure: activated_license_count {
    label: " Activated License Count"
    description: "The distinct count of Activated License requests per grouping."
    type: count_distinct
    sql: case when ${trial_request_type} = 'In-Product' then ${server_id} else ${license_id} end;;
    filters: [is_activated: "yes"]
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
    sql: md5(${customer_id}) ;;
    drill_fields: [licensed_server_drill*]
  }

  measure: customer_mau_less50_telemetry_count {
    label: "Customers w/ MAU < 50% Licensed"
    description: "The count of distinct customer accounts with < 50% monthly active users to licensed users."
    type: count_distinct
    sql: case when ${mau_pct_licensed} < .5 then md5(${customer_id}) else null end ;;
    drill_fields: [licensed_server_drill*]
  }

  measure: customer_nomau_telemetry_count {
    label: "Customers w/out MAU Data"
    description: "The count of distinct customer accounts with < 50% monthly active users to licensed users."
    type: count_distinct
    sql: case when ${monthly_active_users} IS NULL then md5(${customer_id}) else null end ;;
    drill_fields: [licensed_server_drill*]
  }

  measure: customer_mau50_telemetry_count {
    label: "Customers w/ MAU 50-100% Licensed"
    description: "The count of distinct customer accounts with 50-100% monthly active users to licensed users."
    type: count_distinct
    sql: case when ${mau_pct_licensed} >= .5 and ${mau_pct_licensed} <= 1 then md5(${customer_id}) else null end ;;
    drill_fields: [licensed_server_drill*]
  }

  measure: customer_mau100_telemetry_count {
    label: "Customers w/ MAU > 100% Licensed"
    description: "The count of distinct customer accounts with > 100% monthly active users to licensed users."
    type: count_distinct
    sql: case when ${mau_pct_licensed} > 1 then md5(${customer_id}) else null end ;;
    drill_fields: [licensed_server_drill*]
  }

  measure: active_customer_count {
    label: "Customers w/ Active Telemetry"
    description: "The count of distinct accounts that have sent server telemetry w/in the last 7 days."
    type: count_distinct
    sql: case when ${TABLE}.last_telemetry_date >= current_date - interval '7 days' then md5(${customer_id}) else null end ;;
    drill_fields: [licensed_server_drill*]
  }

  measure: customer_wout_telemetry_count {
    label: "Customers w/ No Telemetry"
    description: "The count of distinct customer accounts that have never sent server telemetry."
    type: count_distinct
    sql: case when ${TABLE}.last_telemetry_date IS NULL then md5(${customer_id}) else null end ;;
    drill_fields: [licensed_server_drill*]
  }

  measure: customer_woutdated_telemetry_count {
    label: "Customers w/ Outdated Telemetry"
    description: "The count of distinct customer accounts that have not sent server telemetry w/in the last 7 days."
    type: count_distinct
    sql: case when ${TABLE}.last_telemetry_date < CURRENT_DATE - INTERVAL '7 DAYS' then md5(${customer_id}) else null end ;;
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

  measure: starter_enterprise_trial_conversions {
    label: "Starter to Enterprise Trial Conversion"
    type: number
    description: "The distinct count of servers that began as Starter Edition servers and converted to an Enterprise Trial after the servers initial first active date."
    sql: COUNT(DISTINCT case when ${TABLE}.edition = 'E20 Trial' and ${issued_date}::date > ${server_fact.first_active_date}::date
          AND (${server_fact.server_edition} = 'E0' OR ${server_fact.first_server_edition} = 'E0')
          THEN ${server_id} ELSE NULL END);;
    drill_fields: [licensed_server_drill*]
  }

}
