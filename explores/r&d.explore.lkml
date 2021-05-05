include: "/**/**/*.view.lkml"
include: "/**/**/*.explore.lkml"

explore: ADDRESSES {
  hidden: yes
  group_label: "BLApi"
  description: "Contains all billing and shipping addresses provided by Mattermost customers."
  label: "Addresses"
}

explore: CONTACT_US_REQUESTS {
  hidden: yes
  group_label: "BLApi"
  description: "Contains all contact us requests recieved by Mattermost users, customers, and interested parties."
  label: "Contact Us Requests"
}

explore: CREDIT_CARDS {
  hidden: yes
  group_label: "BLApi"
  description: "Contains all credit cards provided by Mattermost Customers."
  label: "Credit Cards"

  join: CUSTOMERS {
    sql_on: ${CUSTOMERS.stripe_id} = ${CREDIT_CARDS.stripe_id} ;;
    relationship: many_to_one
    view_label: "Customers (BLApi)"
  }

  join: SUBSCRIPTIONS {
    sql_on: ${CUSTOMERS.id} = ${SUBSCRIPTIONS.customer_id} ;;
    relationship: one_to_many
  }
}

explore: CUSTOMERS {
  group_label: "BLApi"
  description: "Contains all Mattermost customer records."
  label: "Customers (Blapi)"

  join: SUBSCRIPTIONS {
    view_label: "Subscriptions (BLApi)"
    sql_on: ${CUSTOMERS.id} = ${SUBSCRIPTIONS.customer_id} ;;
    relationship: one_to_many
  }

  join: subscriptions_stripe {
    from: subscriptions
    view_label: "Subscriptions (Stripe)"
    sql_on: ${SUBSCRIPTIONS.stripe_id} = ${subscriptions_stripe.id} ;;
    relationship: one_to_one
  }

  join: INVOICES {
    view_label: "Invoices (BLApi)"
    sql_on: ${INVOICES.subscription_id} = ${SUBSCRIPTIONS.id} ;;
    relationship: one_to_many
  }

  join: invoices_previous_month {
    from: INVOICES
    relationship: one_to_one
    sql_on: ${invoices_previous_month.subscription_id} = ${INVOICES.subscription_id} AND date_trunc('month', ${INVOICES.invoice_start_date}::date) - interval '1 month' = date_trunc('month', ${invoices_previous_month.invoice_start_date}::date) ;;
    fields: []
  }

  join: invoices_stripe {
    from: invoices
    sql_on: ${INVOICES.stripe_id} = ${invoices_stripe.id} ;;
    relationship: one_to_one
    view_label: "Invoices (Stripe)"
  }

  join: CREDIT_CARDS {
    view_label: "Credit Cards (BLApi)"
    sql_on: ${CUSTOMERS.stripe_id} = ${CREDIT_CARDS.stripe_id} ;;
    relationship: one_to_many
  }

  join: PAYMENT_METHODS {
    view_label: "Payment Methods (BLApi)"
    sql_on: ${PAYMENT_METHODS.customer_id} = ${CUSTOMERS.id} ;;
    relationship: one_to_many
  }

  join: ADDRESSES {
    view_label: "Addresses (Billing)"
    sql_on: ${ADDRESSES.customer_id} = ${CUSTOMERS.id} AND ${ADDRESSES.id} = ${PAYMENT_METHODS.address_id} AND ${ADDRESSES.address_type} = 'billing' ;;
    relationship: one_to_one
  }

  join: company_addresses {
    from: ADDRESSES
    view_label: "Addresses (Company)"
    sql_on: ${ADDRESSES.customer_id} = ${CUSTOMERS.id} AND ${ADDRESSES.address_type} = 'company' ;;
    relationship: one_to_one
  }

  join: CONTACT_US_REQUESTS {
    sql_on: ${CUSTOMERS.id} = ${CONTACT_US_REQUESTS.customer_id} ;;
    relationship: one_to_many
  }

  join: USAGE_EVENTS {
    sql_on: ${INVOICES.subscription_id} = ${USAGE_EVENTS.subscription_id} AND ${USAGE_EVENTS.timestamp_date} between ${INVOICES.invoice_start_date} AND ${INVOICES.invoice_end_date} ;;
    relationship: many_to_one
  }

  join: customers_stripe {
    from: customers
    view_label: "Customer (Stripe)"
    sql_on: ${CUSTOMERS.stripe_id} = ${customers_stripe.id} ;;
    relationship: one_to_one
  }

  join: PAYMENTS {
    view_label: "Payments (BLApi)"
    sql_on: ${PAYMENTS.id} = ${PURCHASE_FACT.payment_id} ;;
    relationship: one_to_one
  }

  join: PURCHASE_FACT {
    view_label: "Purchase Fact (Blapi)"
    sql_on: ${PURCHASE_FACT.invoice_stripe_id} = ${invoices_stripe.id} ;;
    relationship: one_to_one
  }

  join: server_fact {
    sql_on: ${subscriptions_stripe.cws_installation} = ${server_fact.installation_id} ;;
    relationship: one_to_one
    view_label: "Stripe Customer Server Details"
    fields: [server_fact.active_users, server_fact.monthly_active_users, server_fact.direct_message_channels, server_fact.public_channels, server_fact.private_channels, server_fact.slash_commands, server_fact.teams, server_fact.bot_posts_previous_day, server_fact.posts_previous_day, server_fact.bot_accounts, server_fact.guest_accounts, server_fact.incoming_webhooks, server_fact.outgoing_webhooks, server_fact.first_active_date, server_fact.first_active_month, server_fact.first_active_week, server_fact.first_active_year, server_fact.last_active_date, server_fact.last_active_month, server_fact.last_active_week, server_fact.last_active_year, server_fact.max_registered_users, server_fact.max_registered_deactivated_users, server_fact.max_posts]
  }

  join: person {
    view_label: "Person"
    sql_on: ${person.email} = ${CUSTOMERS.email};;
    relationship: one_to_one
  }

  join: person_owner {
    from: user
    sql_on: ${person.object_ownerid} = ${person_owner.sfid} ;;
    fields: []
    relationship: many_to_one
  }

  join: lead {
    view_label: "Lead"
    sql_on: ${person.object} = 'Lead' AND ${lead.sfid} = ${person.sfid};;
    relationship: one_to_one
    fields: []
    required_joins: [person]
  }

  join: contact {
    view_label: "Contact"
    sql_on: ${person.object} = 'Contact' AND ${contact.sfid} = ${person.sfid};;
    relationship: one_to_one
    fields: []
    required_joins: [person]
  }

  join: account {
    view_label: "Account"
    sql_on: ${person.accountid} = ${account.sfid};;
    relationship: many_to_one
    fields: [name, account.owner_name, sfid]
    required_joins: [person,lead,contact]
  }

  join: account_domain_mapping {
    sql_on: ${person.domain} = ${account_domain_mapping.domain};;
    relationship: many_to_one
    fields: []
  }

  join: territory_mapping_domain {
    from: territory_mapping
    sql_on: concat('.',split_part(${person.domain},'.',2)) = ${territory_mapping_domain.domain};;
    relationship: many_to_one
    fields: []
  }

  join: territory_mapping_country {
    from: territory_mapping
    sql_on: ${person.country_code} = ${territory_mapping_country.country_code};;
    relationship: many_to_one
    fields: []
  }

  join: account_owner {
    from: user
    sql_on: ${account_owner.sfid} = ${account.ownerid} ;;
    relationship: many_to_one
    fields: []
  }

}

explore: FEATURES {
  hidden: yes
  group_label: "BLApi"
  description: "Contains a list of features provided by varioius Mattermost SKU's."
  label: "Features"
}

explore: INVOICES {
  group_label: "BLApi"
  description: "Contains all invoices for Mattermost Cloud customers."
  label: "Invoices (BLApi)"

  join: SUBSCRIPTIONS {
    sql_on: ${SUBSCRIPTIONS.id} = ${INVOICES.subscription_id} ;;
    relationship: many_to_one
    view_label: "Subscriptions (BLApi)"
  }

  join: CUSTOMERS {
    sql_on: ${CUSTOMERS.id} = ${SUBSCRIPTIONS.customer_id} ;;
    relationship: many_to_one
    view_label: "Customers (BLApi)"
  }

  join: invoices_blapi {
    from: invoices
    sql_on: ${INVOICES.stripe_id} = ${invoices_blapi.id} ;;
    relationship: one_to_one
    view_label: "Invoices (Stripe)"
  }

  join: invoices_previous_month {
    from: INVOICES
    relationship: one_to_one
    type: left_outer
    sql_on: ${invoices_previous_month.subscription_id} = ${INVOICES.subscription_id} AND date_trunc('month', ${INVOICES.invoice_start_date}::date) - interval '1 month' = date_trunc('month', ${invoices_previous_month.invoice_start_date}::date) ;;
    fields: []
  }

  join: PAYMENTS {
    view_label: "Payments (BLApi)"
    sql_on: ${PAYMENTS.id} = ${PURCHASE_FACT.payment_id} ;;
    relationship: one_to_one
  }

  join: PURCHASE_FACT {
    view_label: "Purchase Fact (Blapi)"
    sql_on: ${PURCHASE_FACT.invoice_stripe_id} = ${invoices_blapi.id} ;;
    relationship: one_to_one
  }

  join: server_fact {
    view_label: "Server Fact"
    relationship: one_to_one
    sql_on: ${SUBSCRIPTIONS.cloud_installation_id} = ${server_fact.installation_id} ;;
  }

  join: license_server_fact {
    view_label: "License Fact"
    sql_on: ${license_server_fact.server_id} = ${server_fact.server_id};;
    relationship: one_to_many
    fields: []
  }

  join: subscriptions_stripe {
    from: subscriptions
    view_label: "Subscriptions (Stripe)"
    sql_on: ${SUBSCRIPTIONS.stripe_id} = ${subscriptions_stripe.id} ;;
    relationship: one_to_one
    fields: []
  }

}

explore: PAYMENTS {
  hidden: yes
  group_label: "BLApi"
  description: "Contains all future, received and currently processing payments from Mattermost customers."
  label: "Payments"

  join: charges {
    view_label: "Charges (Stripe)"
    sql_on: ${PAYMENTS.stripe_charge_id} = ${charges.id} ;;
    relationship: one_to_one
  }

  join: customers {
    view_label: "Charges (Stripe)"
    sql_on: ${charges.customer} = ${customers.id} ;;
    relationship: many_to_one
    fields: []
  }
}

explore: PAYMENT_METHODS {
  hidden: yes
  group_label: "BLApi"
  description: "Contains all identifying information for all payment methods provided by customers."
  label: "Payment Methods"

  join: CUSTOMERS {
    sql_on: ${CUSTOMERS.id} = ${PAYMENT_METHODS.customer_id} ;;
    relationship: many_to_one
  }

  join: SUBSCRIPTIONS {
    sql_on: ${CUSTOMERS.id} = ${SUBSCRIPTIONS.customer_id} ;;
    relationship: one_to_many
  }

  join: ADDRESSES {
    sql_on: ${PAYMENT_METHODS.address_id} = ${ADDRESSES.id} AND ${ADDRESSES.customer_id} = ${CUSTOMERS.id} ;;
    relationship: one_to_many
  }
}

explore: PURCHASE_FACT {
  group_label: "BLApi"
  description: "Contains all customers and key identifiers/most recent customer attributes."
  label: "Purchase Fact"
  hidden: yes
}

explore: SUBSCRIPTIONS {
  hidden: yes
  group_label: "BLApi"
  description: "Contains all subscriptions for Mattermost customers."
  label: "Subscriptions (BLApi)"

  join: CUSTOMERS {
    sql_on: ${CUSTOMERS.id} = ${SUBSCRIPTIONS.customer_id} ;;
    relationship: many_to_one
    view_label: "Customers (BLApi)"
  }

  join: INVOICES {
    view_label: "Invoices (BLApi)"
    sql_on: ${INVOICES.subscription_id} = ${SUBSCRIPTIONS.id} ;;
    relationship: one_to_many
  }

  join: invoices_previous_month {
    from: INVOICES
    relationship: one_to_one
    sql_on: ${invoices_previous_month.subscription_id} = ${INVOICES.subscription_id} AND date_trunc('month', ${INVOICES.invoice_start_date}::date) - interval '1 month' = date_trunc('month', ${invoices_previous_month.invoice_start_date}::date) ;;
    fields: []
  }

  join: invoices_stripe {
    from: invoices
    sql_on: ${INVOICES.stripe_id} = ${invoices_stripe.id} ;;
    relationship: one_to_one
  }

  join: PAYMENTS {
    view_label: "Payments (BLApi)"
    sql_on: ${PAYMENTS.id} = ${PURCHASE_FACT.payment_id} ;;
    relationship: one_to_one
  }

  join: PURCHASE_FACT {
    view_label: "Purchase Fact (Blapi)"
    sql_on: ${PURCHASE_FACT.invoice_stripe_id} = ${invoices_stripe.id} ;;
    relationship: one_to_one
  }

  join: subscriptions_stripe {
    from: subscriptions
    view_label: "Subscriptions (Stripe)"
    sql_on: ${SUBSCRIPTIONS.stripe_id} = ${subscriptions_stripe.id} ;;
    relationship: one_to_one
  }
}

explore: USAGE_EVENTS {
  group_label: "BLApi"
  label: "Usage Events"
  description: "Daily snapshot of registered users associated with each cloud installation, as well as incremental snapshots for deltas (changes) throughout the day. Supports invoicing."
  hidden: yes

  join: SUBSCRIPTIONS {
    sql_on: ${USAGE_EVENTS.subscription_id} = ${SUBSCRIPTIONS.id} ;;
    relationship: many_to_one
  }

  join: subscriptions_stripe {
    from: subscriptions
    view_label: "Subscriptions (Stripe)"
    sql_on: ${SUBSCRIPTIONS.stripe_id} = ${subscriptions_stripe.id} ;;
    relationship: one_to_one
    fields: []
  }


  join: CUSTOMERS {
    sql_on: ${SUBSCRIPTIONS.customer_id} = ${CUSTOMERS.id} ;;
    relationship: many_to_one
  }

  join: INVOICES {
    view_label: "Invoices"
    sql_on: ${INVOICES.subscription_id} = ${USAGE_EVENTS.subscription_id} AND ${USAGE_EVENTS.timestamp_date} between ${INVOICES.invoice_start_date} AND ${INVOICES.invoice_end_date} ;;
    relationship: many_to_one
  }

  join: invoices_previous_month {
    from: INVOICES
    view_label: "Invoices Previous Month"
    relationship: one_to_one
    type: left_outer
    sql_on: ${invoices_previous_month.subscription_id} = ${INVOICES.subscription_id} AND date_trunc('month', ${INVOICES.invoice_start_date}::date) - interval '1 month' = date_trunc('month', ${invoices_previous_month.invoice_start_date}::date) ;;
    fields: []
  }

  join: invoices_stripe {
    from: invoices
    sql_on: ${INVOICES.stripe_id} = ${invoices_stripe.id} ;;
    relationship: one_to_one
  }

  join: PAYMENTS {
    view_label: "Payments (BLApi)"
    sql_on: ${PAYMENTS.id} = ${PURCHASE_FACT.payment_id} ;;
    relationship: one_to_one
  }

  join: PURCHASE_FACT {
    view_label: "Purchase Fact (Blapi)"
    sql_on: ${PURCHASE_FACT.invoice_stripe_id} = ${invoices_stripe.id} ;;
    relationship: one_to_one
  }

  join: CREDIT_CARDS {
    view_label: "Credit Cards (BLApi)"
    sql_on: ${CUSTOMERS.stripe_id} = ${CREDIT_CARDS.stripe_id} ;;
    relationship: one_to_many
  }

  join: PAYMENT_METHODS {
    view_label: "Payment Methods (BLApi)"
    sql_on: ${PAYMENT_METHODS.customer_id} = ${CUSTOMERS.id} ;;
    relationship: one_to_many
  }

  join: ADDRESSES {
    view_label: "Address (Billing)"
    sql_on: ${ADDRESSES.customer_id} = ${CUSTOMERS.id} AND ${ADDRESSES.id} = ${PAYMENT_METHODS.address_id} AND ${ADDRESSES.address_type} = 'billing' ;;
    relationship: one_to_one
  }

  join: company_addresses {
    from: ADDRESSES
    view_label: "Address (Company)"
    sql_on: ${ADDRESSES.customer_id} = ${CUSTOMERS.id} AND ${ADDRESSES.address_type} = 'company' ;;
    relationship: one_to_one
  }
}

explore: daily_page_visits {
  hidden: yes
  join: blog_paths {
    view_label: "Daily Page Visits"
    sql_on: ${daily_page_visits.page_path_2} = ${blog_paths.page_path} ;;
    relationship: many_to_one
    fields: [blog_paths.category]
  }
}

explore: downloads {
  group_label: "Product"
  description: "Contains all downloads from Mattermost web properties including server and dekstop app downloads. Use this to trend downloads over time."
}

explore: nps_data {
  label: "NPS Data"
  group_label: "Product"
  description: "Contains raw NPS data. Typically you will want to use 'NPS User Monthly Score' instead of this, which contains a structured version of this data that allows you to trend the aggregate NPS score, not just the score at time of submission."
  extends: [_base_account_core_explore]

  join: license_overview {
    sql_on: ${nps_data.license_id} = ${license_overview.licenseid}  ;;
    relationship: many_to_many
    fields: []
  }

  join: account {
    sql_on: ${license_overview.account_sfid} = ${account.sfid};;
    relationship: many_to_one
    fields: [account.account_core*]
  }
}

explore: github_contributions {
  group_label: "Contributors & Employees"
  label: "GitHub Community Contributions"
  sql_always_where: ${is_staff} = FALSE ;;

  join: github_contributors {
    sql_on: ${github_contributions.author} = ${github_contributors.author} ;;
    relationship: many_to_one
    fields: []
  }

  join: staff_github_usernames {
    sql_on: ${github_contributions.author} = ${staff_github_usernames.username} ;;
    relationship: many_to_one
    fields: []
  }

  join: github_repo_categorization {
    sql_on: ${github_repo_categorization.repo} = ${github_contributions.repo} ;;
    relationship: many_to_one
    fields: [category]
  }
}

explore: server_daily_details {
  group_label: "Product"
  label: " Server Daily Details"
  description: "Contains a daily snapshot of each non-test/dev server's state. Use this to trend server counts, TEDAS/TEDAU, and age over time. Includes server version, ip, active users, registered users, operating system, Salesforce Account ID, database type, etc."
  extends: [_base_account_core_explore]

  join: account {
    sql_on: ${license_server_fact.customer_id} = ${account.sfid} ;;
    relationship: many_to_one
    type: left_outer
    fields: [account.account_core*]
  }

  join: server_fact {
    sql_on: ${server_daily_details.server_id} = ${server_fact.server_id} ;;
    relationship: many_to_one
    type: inner
  }

  join: subscriptions {
    view_label: "Subscriptions (BLApi)"
    sql_on: ${license_server_fact.license_id} = ${subscriptions.cws_installation} ;;
    relationship: one_to_one
    fields: [subscriptions.cws_dns]
  }

  join: nps_server_daily_score {
    view_label: "Server NPS"
    sql_on: ${nps_server_daily_score.server_id} = ${server_daily_details.server_id}
      AND ${nps_server_daily_score.date_date}::DATE = DATE_TRUNC('day', ${server_daily_details.logging_date}::DATE);;
    relationship: one_to_one
    type: left_outer
    fields: []
  }

  join: server_upgrades {
    view_label: " Server Daily Details"
    sql_on: ${server_upgrades.server_id} = ${server_daily_details.server_id}
      AND ${server_upgrades.logging_date} = ${server_daily_details.logging_date};;
    relationship: one_to_one
    fields: [server_upgrades.prev_version, server_upgrades.server_edition_upgrades, server_upgrades.server_version_upgrades, server_upgrades.is_version_upgrade_date, server_upgrades.is_edition_upgrade_date]
  }

  join: license_server_fact {
    type: left_outer
    relationship: many_to_one
    sql_on: (${license_server_fact.server_id} = ${server_daily_details.server_id}) and (${server_daily_details.logging_date} BETWEEN ${license_server_fact.start_date} AND ${license_server_fact.license_retired_date});;
  }

  join: trial_requests {
    sql_on: ${trial_requests.license_id} = ${license_server_fact.license_id} ;;
    relationship: many_to_one
    type: left_outer
    fields: []
  }

  join: server_events_by_date {
    view_label: " Server Daily Details"
    sql_on: ${server_daily_details.server_id} = ${server_events_by_date.server_id}
      AND ${server_daily_details.logging_date} = ${server_events_by_date.logging_date};;
    relationship: one_to_one
    fields: []
  }

  join: excludable_servers {
    view_label: " Server Daily Details"
    sql_on: ${excludable_servers.server_id} = ${server_daily_details.server_id} ;;
    relationship: many_to_one
    fields: [excludable_servers.reason]
  }

  join: server_daily_details_ext {
    view_label: " Server Daily Details"
    sql_on: ${server_daily_details.logging_date} = ${server_daily_details_ext.logging_date}
      AND ${server_daily_details.server_id} = ${server_daily_details_ext.server_id} ;;
    relationship: one_to_one
    fields: [server_daily_details_ext.active_users_daily, server_daily_details_ext.active_users_daily_band, server_daily_details_ext.active_users_monthly, server_daily_details_ext.registered_deactivated_users, server_daily_details_ext.registered_users,
      server_daily_details_ext.registered_users_band]
  }

  join: version_release_dates {
    view_label: " Server Daily Details"
    sql_on: ${server_daily_details.server_version_major} = split_part(${version_release_dates.version}, '.', 1) || '.' || split_part(${version_release_dates.version}, '.', 2) ;;
    relationship: many_to_one
    fields: [version_release_dates.supported]
  }

  join: user_events_telemetry {
    view_label: "User Events"
    sql_on: ${user_events_telemetry.user_id} = ${server_daily_details.server_id} and ${user_events_telemetry.event_date} = ${server_daily_details.logging_date} ;;
    relationship: one_to_many
    fields: [user_events_telemetry.post_count, user_events_telemetry.count1, user_events_telemetry.event_count, user_events_telemetry.thread_count, user_events_telemetry.members_added_to_team_sum,
      user_events_telemetry.members_removed_from_team_sum, user_events_telemetry.groups_removed_from_team_sum, user_events_telemetry.batch_add_members_sum, user_events_telemetry.user_actual_count, user_events_telemetry.event_count,
      user_events_telemetry.custom_emojis_added, user_events_telemetry.post_reaction_count, user_events_telemetry.groups_added_to_team_sum, user_events_telemetry.plugin_added_count, user_events_telemetry.plugin_updates_count]
  }
}

explore: server_fact {
  group_label: "Product"
  description: "Contains the most recent state of a server. Includes first active date, last active date, license id, Salesforce Account ID, version, max active user counts, etc."
  hidden: no

  join: license_server_fact {
    view_label: "License Fact"
    sql_on: ${license_server_fact.server_id} = ${server_fact.server_id};;
    relationship: one_to_many
  }

  join: lead {
    view_label: "Lead (Salesforce)"
    sql_on:  ${license_server_fact.license_email} = ${lead.email} ;;
    relationship: many_to_one
    fields: [lead.email, lead.name, lead.convertedaccountid, lead.existing_account__c, lead.matched_account, lead.sfid, lead.job_function, lead.convertedcontactid, lead.lead_source, lead.lead_type, lead.lead_status_combined, lead.most_recent_action]
  }

  join: trial_requests {
    sql_on: ${trial_requests.license_id} = ${license_server_fact.license_id} ;;
    relationship: many_to_one
    type: left_outer
    fields: []
  }

  join: excludable_servers {
    view_label: "Server Fact"
    sql_on: ${excludable_servers.server_id} = ${server_fact.server_id} ;;
    relationship: one_to_one
    fields: [excludable_servers.reason]
  }

  join: version_release_dates {
    view_label: "Server Fact"
    sql_on: ${server_fact.server_version_major} = split_part(${version_release_dates.version}, '.', 1) || '.' || split_part(${version_release_dates.version}, '.', 2) ;;
    relationship: many_to_one
    fields: [version_release_dates.supported]
  }

  join: cloud_clearbit {
    view_label: "Clearbit (Cloud)"
    sql_on: ${server_fact.server_id} = ${cloud_clearbit.server_id} ;;
    relationship: one_to_one
  }

  join: server_daily_details_ext {
    view_label: "Enabled Plugins"
    sql_on: ${server_daily_details_ext.server_id} = ${license_server_fact.server_id} AND ${server_daily_details_ext.logging_date} = ${server_fact.last_mm2_telemetry_date} ;;
    relationship: one_to_one
    fields: [server_daily_details_ext.enable_plugins_count, server_daily_details_ext.enable_antivirus_count, server_daily_details_ext.enable_autolink_count, server_daily_details_ext.enable_aws_sns_count,
      server_daily_details_ext.enable_custom_user_attributes_count, server_daily_details_ext.enable_github_count, server_daily_details_ext.enable_gitlab_count, server_daily_details_ext.enable_health_check_count,
      server_daily_details_ext.enable_jenkins_count, server_daily_details_ext.enable_jira_count, server_daily_details_ext.enable_marketplace_count, server_daily_details_ext.enable_nps_count, server_daily_details_ext.enable_remote_marketplace_count,
      server_daily_details_ext.enable_uploads_count, server_daily_details_ext.enable_webex_count, server_daily_details_ext.enable_welcome_bot_count, server_daily_details_ext.enable_zoom_count, server_daily_details_ext.enable_confluence_count,
      server_daily_details_ext.enable_jitsi_count, server_daily_details_ext.enable_mscalendar_count, server_daily_details_ext.enable_todo_count, server_daily_details_ext.enable_skype4business_count, server_daily_details_ext.enable_giphy_count,
      server_daily_details_ext.enable_digital_ocean_count, server_daily_details_ext.enable_incident_response_count, server_daily_details_ext.enable_memes_count, server_daily_details_ext.ask_community_link_enabled_count, server_daily_details_ext.enable_matterpoll_count,
      server_daily_details_ext.enable_channel_recommender_count, server_daily_details_ext.enable_agenda_count, server_daily_details_ext.enable_msteamsmeeting_count, server_daily_details_ext.enable_icebreaker_count]
  }
}


explore: nps_user_monthly_score {
  group_label: "Product"
  label: "NPS User Daily Score"
  description: "Contains NPS Score data per user per day for all users that have submitted an NPS survey (Updated every 30 minutes for new submissions). Can be used to trend NPS by date by server version, server age, user role, user age, etc.."
  extends: [_base_account_core_explore]
  always_filter: {
    filters: [21days_since_release: "yes"]
  }

  join: nps_feedback_classification {
    view_label: "NPS User Daily Score"
    sql_on: ${nps_feedback_classification.user_id} = ${nps_user_monthly_score.user_id}
      AND ${nps_feedback_classification.server_id} = ${nps_user_monthly_score.server_id}
      AND ${nps_feedback_classification.last_feedback_date} = ${nps_user_monthly_score.last_feedback_date} ;;
    relationship: many_to_one
    type: left_outer
    fields: [nps_feedback_classification.categorized_at_date, nps_feedback_classification.categorized_at_month, nps_feedback_classification.categorized_at_week, nps_feedback_classification.categorized_at_year, nps_feedback_classification.categorized_at_time, nps_feedback_classification.categorized_by, nps_feedback_classification.category_rank]
  }

  join: account {
    sql_on: ${server_fact.account_sfid} = ${account.sfid} ;;
    fields: [account.account_core*]
    relationship: many_to_one
  }

  join: server_fact {
    view_label: "NPS User Daily Score"
    sql_on: ${nps_user_monthly_score.server_id} = ${server_fact.server_id};;
    relationship: many_to_one
    fields: [server_fact.first_server_version_major]
  }

  join: license_server_fact {
    sql_on: ${nps_user_monthly_score.server_id} = ${license_server_fact.server_id} AND ${nps_user_monthly_score.last_score_date} between CASE WHEN ${license_server_fact.edition} = 'Mattermost Cloud' THEN ${license_server_fact.issued_date} ELSE ${license_server_fact.start_date} END AND ${license_server_fact.license_retired_date} ;;
    relationship: many_to_one
  }

  join: trial_requests {
    sql_on: ${trial_requests.license_id} = ${license_server_fact.license_id} ;;
    relationship: many_to_one
    type: left_outer
    fields: []
  }

  join: excludable_servers {
    sql_on: ${excludable_servers.server_id} = ${nps_user_monthly_score.server_id} ;;
    relationship: many_to_one
    fields: [excludable_servers.reason]
  }

  join: version_release_dates {
    view_label: "NPS User Daily Score"
    sql_on: ${nps_user_monthly_score.server_version_major} = SPLIT_PART(${version_release_dates.version}, '.', 1) || '.' || SPLIT_PART(${version_release_dates.version}, '.', 2) ;;
    relationship: many_to_one
    fields: [version_release_dates.release_date, version_release_dates.release_month, version_release_dates.release_year, version_release_dates.release_week]
  }

  join: server_daily_details {
    sql_on: ${nps_user_monthly_score.server_id} = ${server_daily_details.server_id} and ${nps_user_monthly_score.last_score_date} = ${server_daily_details.logging_date} ;;
    relationship: many_to_one
    type: left_outer
    fields: []
  }

  join: server_daily_details_ext {
    view_label: "Enabled Plugins"
    sql_on: ${nps_user_monthly_score.server_id} = ${server_daily_details_ext.server_id} and ${nps_user_monthly_score.month_date}::date = ${server_daily_details_ext.logging_date}::date ;;
    relationship: many_to_one
    type: left_outer
    fields: [server_daily_details_ext.enable_plugins, server_daily_details_ext.enable_antivirus, server_daily_details_ext.enable_autolink, server_daily_details_ext.enable_aws_sns,
      server_daily_details_ext.enable_custom_user_attributes, server_daily_details_ext.enable_github, server_daily_details_ext.enable_gitlab, server_daily_details_ext.enable_health_check,
      server_daily_details_ext.enable_jenkins, server_daily_details_ext.enable_jira, server_daily_details_ext.enable_marketplace, server_daily_details_ext.enable_nps, server_daily_details_ext.enable_remote_marketplace,
      server_daily_details_ext.enable_uploads, server_daily_details_ext.enable_webex, server_daily_details_ext.enable_welcome_bot, server_daily_details_ext.enable_zoom, server_daily_details_ext.enable_confluence,
      server_daily_details_ext.enable_jitsi, server_daily_details_ext.enable_mscalendar, server_daily_details_ext.enable_todo, server_daily_details_ext.enable_skype4business, server_daily_details_ext.enable_giphy,
      server_daily_details_ext.enable_digital_ocean, server_daily_details_ext.enable_incident_response, server_daily_details_ext.enable_memes, server_daily_details_ext.enable_comgithubmatterpollmatterpoll,
      server_daily_details_ext.enable_agenda, server_daily_details_ext.enable_commattermostmsteamsmeetings, server_daily_details_ext.enable_comnilsbrinkmannicebreaker, server_daily_details_ext.enable_comgithubjespinorecommend]
  }
}

explore: server_daily_details_ext {
  group_label: "Product"
  label: " Server Daily Details Ext"
  description: "An extension of 'Server Daily Details' explore that includes all server configuration and activity data. Can be used to report the volume of servers by day with various configuration settings activated, activity thresholds reached, or age milestones attained."
  extends: [_base_account_core_explore]


  join: account {
    sql_on: ${license_server_fact.customer_id} = ${account.sfid} ;;
    type: left_outer
    relationship: many_to_one
    fields: [account.account_core*]
  }

  join: server_fact {
    sql_on: ${server_daily_details_ext.server_id} = ${server_fact.server_id} ;;
    type: left_outer
    relationship: many_to_one
  }

  join: server_daily_details_ext2 {
    from: server_daily_details_ext
    view_label: "Enabled Plugins First 7 Days"
    sql_on: ${server_daily_details_ext2.server_id} = ${server_fact.server_id} AND ${server_daily_details_ext2.logging_date}::date <= ${server_fact.first_active_date}::date + interval '7 days' ;;
    relationship: one_to_many
    fields: [server_daily_details_ext2.enable_plugins_count, server_daily_details_ext2.enable_antivirus_count, server_daily_details_ext2.enable_autolink_count, server_daily_details_ext2.enable_aws_sns_count,
      server_daily_details_ext2.enable_custom_user_attributes_count, server_daily_details_ext2.enable_github_count, server_daily_details_ext2.enable_gitlab_count, server_daily_details_ext2.enable_health_check_count,
      server_daily_details_ext2.enable_jenkins_count, server_daily_details_ext2.enable_jira_count, server_daily_details_ext2.enable_marketplace_count, server_daily_details_ext2.enable_nps_count, server_daily_details_ext2.enable_remote_marketplace_count,
      server_daily_details_ext2.enable_uploads_count, server_daily_details_ext2.enable_webex_count, server_daily_details_ext2.enable_welcome_bot_count, server_daily_details_ext2.enable_zoom_count, server_daily_details_ext2.enable_confluence_count,
      server_daily_details_ext2.enable_jitsi_count, server_daily_details_ext2.enable_mscalendar_count, server_daily_details_ext2.enable_todo_count, server_daily_details_ext2.enable_skype4business_count, server_daily_details_ext2.enable_giphy_count,
      server_daily_details_ext2.enable_digital_ocean_count, server_daily_details_ext2.enable_incident_response_count, server_daily_details_ext2.enable_memes_count, server_daily_details_ext2.enable_matterpoll_count,
      server_daily_details_ext2.enable_channel_recommender_count, server_daily_details_ext2.enable_agenda_count, server_daily_details_ext2.enable_msteamsmeeting_count, server_daily_details_ext2.enable_icebreaker_count]
  }

  join: nps_server_daily_score {
    view_label: "NPS Score"
    sql_on: ${nps_server_daily_score.server_id} = ${server_daily_details_ext.server_id}
      AND ${nps_server_daily_score.date_date}::DATE = DATE_TRUNC('day', ${server_daily_details_ext.logging_date}::DATE);;
    relationship: one_to_one
    type: left_outer
    fields: [nps_server_daily_score.nps_server_core*]
  }

  join: server_upgrades {
    view_label: " Server Daily Details Ext"
    sql_on: ${server_upgrades.server_id} = ${server_daily_details_ext.server_id}
      AND ${server_upgrades.logging_date} = ${server_daily_details_ext.logging_date};;
    relationship: one_to_one
    fields: [server_upgrades.prev_version, server_upgrades.server_edition_upgrades, server_upgrades.server_version_upgrades]
  }

  join: server_events_by_date {
    sql_on: ${server_daily_details_ext.server_id} = ${server_events_by_date.server_id}
      AND ${server_daily_details_ext.logging_date} = ${server_events_by_date.logging_date};;
    relationship: one_to_one
    fields: []
  }

  join: excludable_servers {
    view_label: " Server Daily Details Ext"
    sql_on: ${excludable_servers.server_id} = ${server_daily_details_ext.server_id} ;;
    relationship: many_to_one
    fields: [excludable_servers.reason]
  }

  join: version_release_dates {
    view_label: " Server Daily Details Ext"
    sql_on: ${server_daily_details_ext.server_version_major} = split_part(${version_release_dates.version}, '.', 1) || '.' || split_part(${version_release_dates.version}, '.', 2) ;;
    relationship: many_to_one
    fields: [version_release_dates.supported]
  }

  join: license_server_fact {
    type: left_outer
    relationship: many_to_one
    sql_on: (${license_server_fact.server_id} = ${server_daily_details_ext.server_id}) and (${server_daily_details_ext.logging_date} BETWEEN ${license_server_fact.start_date} AND ${license_server_fact.license_retired_date});;
  }

  join: trial_requests {
    sql_on: ${trial_requests.license_id} = ${license_server_fact.license_id} ;;
    relationship: many_to_one
    type: left_outer
    fields: []
  }
}

explore: events_registry {
  label: "Events Registry"
  group_label: "Product"
  description: "Contains the name and details of all user events currently, and historically, captured on the Mattermost platform. Including the first and most recent date the event was logged."
}

explore: user_events_by_date {
  extends: [_base_account_core_explore, server_fact]
  label: " User Events By Date"
  group_label: "Product"
  description: "Contains all 'whitelist' user events by day. 1 row per user per event per day (for all 'whitelist' events performed by that user across web, desktop, and mobile). Also provides the sum of events performed for each row, which captures the total number of events performed by the user, for the given event, on the given date (must be >= 1). Use this to track and trend the volume of individual events by day, by browser, by os, etc.."

  join: server_daily_details {
    view_label: "Server Details"
    sql_on: ${user_events_by_date.server_id} = ${server_daily_details.server_id}
      AND ${user_events_by_date.logging_date} = ${server_daily_details.logging_date};;
    relationship: many_to_one
    fields: [server_daily_details.server_version_major, server_daily_details.version, server_daily_details.edition2]
  }

  join: account {
    sql: ${server_fact.account_sfid} = ${account.sfid} ;;
  }

  join: server_fact {
    view_label: "Server Details"
    sql_on: ${server_fact.server_id} = ${user_events_by_date.server_id} ;;
    relationship: many_to_one
#     fields: [server_fact.license_all, server_fact.license_id_filter, server_fact.gitlab_install, server_fact.first_active_date, server_fact.first_active_week, server_fact.first_active_month, server_fact.first_active_year, server_fact.first_active_fiscal_quarter, server_fact.first_active_fiscal_year, server_fact.license_id, server_fact.account_sfid, server_fact.first_server_version, server_fact.first_server_version_major, server_fact.first_server_edition]
  }

  join: events_registry {
    view_label: " User Events By Date"
    sql_on: ${events_registry.event_name} = ${user_events_by_date.event_name} ;;
    relationship: many_to_one
    fields: [events_registry.event_category, events_registry.date_added_date, events_registry.last_triggered_date]
  }

  join: user_fact {
    view_label: " User Events By Date"
    sql_on: ${user_fact.user_id} = ${user_events_by_date.user_id} ;;
    relationship: many_to_one
    fields: [user_fact.first_event_name, user_fact.second_event_name, user_fact.third_event_name, user_fact.fourth_event_name, user_fact.fifth_event_name, user_fact.sixth_event_name, user_fact.seventh_event_name, user_fact.eighth_event_name, user_fact.ninth_event_name, user_fact.tenth_event_name]
  }

  join: user_agent_registry {
    view_label: "User Agent Details"
    sql_on: ${user_agent_registry.context_useragent} = ${user_events_by_date.user_agent} ;;
    relationship: many_to_one
    type: left_outer
    fields: [user_agent_registry.device_type, user_agent_registry.device_model, user_agent_registry.device_brand]
  }

  join: excludable_servers {
    view_label: "Server Details"
    sql_on: ${user_events_by_date.server_id} =  ${excludable_servers.server_id};;
    relationship: many_to_one
    fields: [excludable_servers.reason]
  }

  join: license_current {
    from: license_server_fact
    type: left_outer
    relationship: many_to_one
    sql_on: (${license_current.server_id} = ${user_events_by_date.server_id}) and (${user_events_by_date.logging_date} BETWEEN ${license_current.start_date} AND ${license_current.license_retired_date});;
    fields: []
  }


}

explore: user_events_by_date_agg {
  extends: [_base_account_core_explore, server_fact]
  label: "User Events By Date Agg"
  group_label: "Product"
  description: "Contains an aggregated version of the 'User Events By Date' explore. Sums all events performed by the user across mobile, web, and desktop. Use this to trend DAU and MAU over time. 1 row per user per day for all dates >= the user's first event date (i.e. contains row for users on dates where user has not performed event to track disengagement)."

  join: server_daily_details {
    view_label: "Server Details"
    sql_on: ${user_events_by_date_agg.server_id} = ${server_daily_details.server_id}
      AND ${user_events_by_date_agg.logging_date} = ${server_daily_details.logging_date};;
    relationship: many_to_one
    fields: [server_daily_details.server_version_major, server_daily_details.version, server_daily_details.edition2]
  }

  join: account {
    sql: ${server_fact.account_sfid} = ${account.sfid} ;;
  }

  join: server_fact {
    view_label: "Server Details"
    sql_on: ${server_fact.server_id} = ${user_events_by_date_agg.server_id} ;;
    relationship: many_to_one
    fields: [server_fact.license_all, server_fact.license_id_filter, server_fact.gitlab_install, server_fact.first_active_date, server_fact.first_active_week, server_fact.first_active_month, server_fact.first_active_year, server_fact.first_active_fiscal_quarter, server_fact.first_active_fiscal_year, server_fact.license_id, server_fact.account_sfid, server_fact.first_server_version, server_fact.first_server_version_major, server_fact.first_server_edition]
  }

  join: excludable_servers {
    view_label: "Server Details"
    sql_on: ${user_events_by_date_agg.server_id} =  ${excludable_servers.server_id};;
    relationship: many_to_one
    fields: [excludable_servers.reason]
  }

  join: user_fact {
    view_label: "User Events By Date Agg"
    sql_on: ${user_fact.user_id} = ${user_events_by_date_agg.user_id} ;;
    relationship: many_to_one
    fields: [user_fact.first_event_name, user_fact.second_event_name, user_fact.third_event_name, user_fact.fourth_event_name, user_fact.fifth_event_name, user_fact.sixth_event_name, user_fact.seventh_event_name, user_fact.eighth_event_name, user_fact.ninth_event_name, user_fact.tenth_event_name]
  }

  join: license_current {
    from: license_server_fact
    type: left_outer
    relationship: many_to_one
    sql_on: (${license_current.server_id} = ${user_events_by_date_agg.server_id}) and (${user_events_by_date_agg.logging_date} BETWEEN ${license_current.start_date} AND ${license_current.license_retired_date});;
    fields: []
  }
}

explore: snowflake_amortized_rates {
  label: "Snowflake Amortized Rates"
  group_label: "zBizOps Spend"
  description: "Contains Snowflake spend data. Primarily for BizOps to track Snowflake cost of usage."
}

explore: snowflake_contract_rates {
  label: "Snowflake Contract Rates"
  group_label: "zBizOps Spend"
  description: "Contains Snowflake spend data. Primarily for BizOps to track Snowflake cost of usage."
}

explore: snowflake_warehouse_cost {
  label: "Snowflake Warehouse Cost"
  group_label: "zBizOps Spend"
  description: "Contains Snowflake spend data. Primarily for BizOps to track Snowflake cost of usage."
}

explore: licenses {
  label: "Licenses"
  group_label: "BLP"
  hidden: yes
}

explore: license_daily_details {
  label: "License Daily Details"
  group_label: "BLP"
  description: "Contains a daily snapshot of license data including aggregate measures for all servers associated with a license, Salesforce account information, # licensed users, # registered users, licensed MAU, licensed DAU, and aggregate server activity totals. You can use this to track specific customers over time or view the most up-to-date data available for trial and non-trial licenses."
  hidden: yes
}

explore: user_fact {
  label: "User Fact"
  description: "Contains the current state (or last recorded state) of a user including first active dates, all time event/activity counts, NPS scores/dates, etc."
  group_label: "Product"
  extends: [_base_account_core_explore]

  join: account {
    sql_on: ${user_fact.account_sfid} = ${account.sfid} ;;
    relationship: many_to_one
    fields: [account.account_core*]
  }

  join: server_fact {
    view_label: "User Fact"
    sql_on: ${user_fact.server_id} = ${server_fact.server_id} ;;
    relationship: many_to_one
    fields: [server_fact.server_edition, server_fact.server_version, server_fact.server_version_major]
  }

  join: server_fact2 {
    from: server_fact
    view_label: "User Fact"
    sql_on: ${user_fact.first_server_id} = ${server_fact2.server_id} ;;
    relationship: many_to_one
    fields: [server_fact2.first_server_edition, server_fact2.first_server_version, server_fact2.first_server_version_major]
  }
}

explore: user_daily_details {
  label: "User Daily Details"
  description: "Use this to trend the state of a users activity (events), mau status, NPS score, etc. over time. Contains a daily snapshot of user allowing you to trend by various dimensions and measures including user age at the time of the logging data (snapshot date)."
  group_label: "Product"
  extends: [_base_account_core_explore]

  join: account {
    sql_on: ${user_daily_details.account_sfid} = ${account.sfid} ;;
    relationship: many_to_one
    fields: [account.account_core*]
  }

  join: user_fact {
    view_label: "User Daily Details"
    relationship: many_to_one
    sql_on: ${user_daily_details.user_id} = ${user_fact.user_id} ;;
    fields: []
  }
}

explore: server_upgrades {
  label: " Server Upgrades"
  description: "Use this to trend the number of server upgrades by version or edition over time."
  group_label: "Product"
  extends: [_base_account_core_explore, server_fact]
  hidden: no

  join: account {
    sql_on: ${server_fact.account_sfid} = ${account.sfid} ;;
    relationship: many_to_one
    fields: [account.account_core*]
  }

  join: server_fact {
    sql_on: ${server_fact.server_id} = ${server_upgrades.server_id} ;;
    relationship: many_to_one
  }

  join: license_current {
    from: license_server_fact
    type: left_outer
    relationship: many_to_one
    sql_on: (${license_current.server_id} = ${server_upgrades.server_id}) and (${server_upgrades.logging_date} BETWEEN ${license_current.start_date} AND ${license_current.license_retired_date});;
    fields: []
  }

  join: excludable_servers {
    view_label: " Server Upgrades"
    sql_on: ${excludable_servers.server_id} = ${server_upgrades.server_id} ;;
    relationship: many_to_one
    fields: [excludable_servers.reason]
  }

  join: version_release_dates {
    view_label: "Server Daily Details"
    sql_on: ${server_upgrades.current_version_major} = split_part(${version_release_dates.version}, '.', 1) || '.' || split_part(${version_release_dates.version}, '.', 2) ;;
    relationship: many_to_one
    fields: [version_release_dates.supported, version_release_dates.release_date, version_release_dates.release_month, version_release_dates.release_year, version_release_dates.release_week]
  }

  join: server_daily_details {
    view_label: "Server Daily Details"
    sql_on: ${server_upgrades.server_id} = ${server_daily_details.server_id} and ${server_upgrades.logging_date} = ${server_daily_details.logging_date} ;;
    fields: [server_daily_details.active_user_count]
    relationship: many_to_one
  }

  join: server_daily_details_ext {
    view_label: "Server Daily Details"
    sql_on: ${server_upgrades.server_id} = ${server_daily_details_ext.server_id} and ${server_upgrades.logging_date} = ${server_daily_details_ext.logging_date} ;;
    relationship: many_to_one
    fields: []
  }
}

explore: excludable_servers {
  label: "Excludable Servers"
  hidden: yes
}

explore: server_events_by_date {
  label: "Server Events By Date"
  hidden: yes
}

explore: nps_server_version_daily_score {
  label: "NPS Server Version Daily Score"
  group_label: "Product"
  always_filter: {
    filters: [21days_since_release: "yes"]
  }

  # join: account {
  #   sql_on: ${server_fact.account_sfid} = ${account.sfid} ;;
  #   fields: [account.account_core*]
  #   relationship: many_to_one
  # }

  join: server_fact {
    view_label: "Server Fact"
    sql_on: ${nps_server_version_daily_score.server_id} = ${server_fact.server_id};;
    relationship: many_to_one
  }

  join: license_server_fact {
    type: left_outer
    relationship: many_to_one
    sql_on: (${license_server_fact.server_id} = ${nps_server_version_daily_score.server_id}) and (${nps_server_version_daily_score.last_score_date} BETWEEN CASE WHEN ${license_server_fact.edition} = 'Mattermost Cloud' THEN ${license_server_fact.issued_date} ELSE ${license_server_fact.start_date} END AND ${license_server_fact.license_retired_date});;
  }

  join: trial_requests {
    sql_on: ${trial_requests.license_id} = ${license_server_fact.license_id} ;;
    relationship: many_to_one
    type: left_outer
    fields: []
  }

  join: excludable_servers {
    sql_on: ${excludable_servers.server_id} = ${nps_server_version_daily_score.server_id} ;;
    relationship: many_to_one
    fields: [excludable_servers.reason]
  }

  join: version_release_dates {
    view_label: "NPS Server Version Daily Score"
    sql_on: ${nps_server_version_daily_score.server_version_major} = SPLIT_PART(${version_release_dates.version}, '.', 1) || '.' || SPLIT_PART(${version_release_dates.version}, '.', 2) ;;
    relationship: many_to_one
    fields: [version_release_dates.release_date, version_release_dates.release_month, version_release_dates.release_year, version_release_dates.release_week]
  }

  join: server_daily_details {
    sql_on: ${nps_server_version_daily_score.server_id} = ${server_daily_details.server_id} and ${nps_server_version_daily_score.last_score_date} = ${server_daily_details.logging_date} ;;
    relationship: many_to_one
    type: left_outer
    fields: []
  }
}

explore: licenses_grouped {
  label: "Licenses (Server Level)"
  group_label: "BLP"
  hidden: yes
}

explore: licenses_only {
  label: "Licenses"
  group_label: "BLP"
  hidden: yes
}

explore: version_release_dates {
  label: "Version Release Dates"
  hidden: yes
}

explore: hist_license_mapping {
  label: "Legacy License Mapping"
  view_label: "Legacy License Mapping"
  group_label: "BLP"
  join: account {
    view_label: "Legacy License Mapping"

    relationship: many_to_one
    sql_on: ${hist_license_mapping.account_sfid} = ${account.sfid} ;;
    fields: [name, sfid]
  }
}

explore: enterprise_license_fact {
  extends: [_base_account_core_explore]
  group_label: "BLP"
  join: account {
    sql_on: ${account.sfid} = ${enterprise_license_fact.account_sfid} ;;
    type: full_outer
  }
}

explore: trial_licenses {
  label: "Trial Licenses"
  sql_always_where: ${license_daily_details.is_trial} ;;
  from: license_daily_details
  view_label: "License Daily Details"
  view_name: license_daily_details
  extends: [license_daily_details]

  join: lead {
    view_label: "Associated Lead"
    sql_on: lower(${license_daily_details.license_email}) = lower(${lead.email});;
    relationship: many_to_many
    fields: [email,sfid,lead.status,lead.status_order]
  }

  join: contact {
    view_label: "Associated Contact"
    sql_on: lower(${license_daily_details.license_email}) = lower(${contact.email});;
    relationship: many_to_many
    fields: [email,sfid]
  }

  join: owner {
    view_label: "Associated Lead / Contact Owner"
    from: user
    relationship: many_to_one
    sql_on: ${owner.sfid} = coalesce(${contact.ownerid},${lead.ownerid});;
    fields: [name]
  }
}

explore: in_product_trial_requests {
  group_label: "Product"
  label: "In Product Trial Requests"
  from: trial_requests

  join: lead {
    view_label: "Associated Lead"
    sql_on: ${in_product_trial_requests.is_lead} AND ${in_product_trial_requests.sfid} = ${lead.sfid};;
    relationship: many_to_one
    fields: []
  }

  join: contact {
    view_label: "Associated Contact"
    sql_on: ${in_product_trial_requests.is_contact} AND ${in_product_trial_requests.sfid} = ${contact.sfid};;
    relationship: many_to_one
    fields: []
  }

  join: owner {
    view_label: "Associated Lead / Contact Owner"
    from: user
    relationship: many_to_one
    sql_on: ${owner.sfid} = coalesce(${contact.ownerid},${lead.ownerid});;
    fields: []
  }

  join: server_fact {
    relationship: many_to_one
    sql_on: ${in_product_trial_requests.server_id} = ${server_fact.server_id} ;;
  }

  join: license_server_fact {
    view_label: "Server Fact"
    sql_on: ${license_server_fact.server_id} = ${server_fact.server_id};;
    relationship: one_to_many
    fields: []
  }


}

explore: user_agent_registry {
  label: "User Agent Registry"
  group_label: "Website"
  hidden: yes
}

explore: daily_website_traffic {
  group_label: "Website"
  label: "Daily Website Traffic"

  join: user_agent_registry {
    view_label: "Daily Website Traffic"
    relationship: many_to_one
    sql_on: ${daily_website_traffic.context_useragent} = ${user_agent_registry.context_useragent} ;;
    fields: [user_agent_registry.bot, user_agent_registry.browser, user_agent_registry.browser_version, user_agent_registry.browser_w_version, user_agent_registry.operating_system, user_agent_registry.os_version, user_agent_registry.os_w_version, user_agent_registry.device_brand, user_agent_registry.device_type, user_agent_registry.device_model]
  }

  join: blog_paths {
    view_label: "Daily Website Traffic"
    sql_on: ${daily_website_traffic.context_page_path_pt_2} = ${blog_paths.page_path_pt_2} ;;
    relationship: many_to_one
    fields: [blog_paths.category]
  }
}

explore: stripe_charges {
  label: "Stripe Charges"
  group_label: "Finance"
  from: charges
  view_name: charges
  join: customers {
    sql_on: ${customers.id} = ${charges.customer} ;;
    relationship: many_to_one
    fields: []
  }
}

explore: customers {
  view_label: "Stripe Customers"
  group_label: "Finance"

  join: CUSTOMERS{
    from: CUSTOMERS
    view_label: "Customer (BLApi)"
    sql_on: ${CUSTOMERS.stripe_id} = ${customers.id} ;;
    relationship: one_to_one
  }

  join: subscriptions_stripe {
    from: subscriptions
    sql_on: ${customers.id} = ${subscriptions_stripe.customer} ;;
    relationship: one_to_many
  }

  join: subscriptions_blapi {
    from: SUBSCRIPTIONS
    view_label: "Subscriptions (BLApi)"
    sql_on: ${subscriptions_blapi.stripe_id} = ${subscriptions_stripe.id} ;;
    relationship: one_to_one

  }

  join: subscription_items {
    sql_on: ${subscriptions_stripe.id} = ${subscription_items.subscription} ;;
    relationship: one_to_many
  }

  join: invoices {
    sql_on: ${subscriptions_stripe.id} = ${invoices.subscription} ;;
    relationship: one_to_many
  }

  join: invoices_blapi {
    from: INVOICES
    sql_on: ${invoices_blapi.stripe_id} = ${invoices.id} ;;
    relationship: one_to_one
    view_label: "Invoices (BLApi)"
  }

  join: invoices_previous_month {
    from: INVOICES
    relationship: one_to_one
    sql_on: ${invoices_previous_month.subscription_id} = ${invoices_blapi.subscription_id} AND date_trunc('month', ${invoices_blapi.invoice_start_date}::date) - interval '1 month' = date_trunc('month', ${invoices_previous_month.invoice_start_date}::date) ;;
    fields: []
  }

  join: PAYMENTS {
    view_label: "Payments (BLApi)"
    sql_on: ${PAYMENTS.id} = ${PURCHASE_FACT.payment_id} ;;
    relationship: one_to_one
  }

  join: PURCHASE_FACT {
    view_label: "Purchase Fact (Blapi)"
    sql_on: ${PURCHASE_FACT.invoice_stripe_id} = ${invoices.id} ;;
    relationship: one_to_one
  }

  join: invoice_line_items {
    sql_on: ${invoices.id} = ${invoice_line_items.invoice} ;;
    relationship: one_to_many
  }

  join: charges {
    sql_on: ${customers.id} = ${charges.customer} AND (${charges.invoice} = ${invoices.charge} OR ${charges.invoice} IS NULL);;
    relationship: one_to_many
  }

  join: products {
    sql_on: ${products.id} = ${subscription_items.plan_product} OR ${products.id} = ${invoice_line_items.plan_product};;
    relationship: many_to_one
  }

  join: server_fact {
    sql_on: ${subscriptions_stripe.cws_installation} = ${server_fact.installation_id} ;;
    relationship: one_to_one
    view_label: "Stripe Customer Server Details"
    fields: [server_fact.active_users, server_fact.monthly_active_users, server_fact.direct_message_channels, server_fact.public_channels, server_fact.private_channels, server_fact.slash_commands, server_fact.teams, server_fact.bot_posts_previous_day, server_fact.posts_previous_day, server_fact.bot_accounts, server_fact.guest_accounts, server_fact.incoming_webhooks, server_fact.outgoing_webhooks, server_fact.first_active_date, server_fact.first_active_month, server_fact.first_active_week, server_fact.first_active_year, server_fact.last_active_date, server_fact.last_active_month, server_fact.last_active_week, server_fact.last_active_year, server_fact.max_registered_users, server_fact.max_registered_deactivated_users, server_fact.max_posts]
  }
}

explore: issues {
  label: "Jira Tickets (Issues)"
  group_label: "Product"

  join: issue_comments {
    sql_on: ${issue_comments.issueid} = ${issues.id} ;;
    type: left_outer
    relationship: one_to_many
    fields: [issue_comments.comment_count]
  }
}

explore: netsuite_opportunity {
  label: "Netsuite (Opportunity Level)"
  extends: [account]
  view_name: account
  group_label: "Finance"

  join: netsuite_financial {
    sql_on: ${opportunity.sfid} = ${netsuite_financial.opportunityid} ;;
    relationship: many_to_one
  }
}

explore: issue_comments {
  label: "Jira Comments (Issues)"
  group_label: "Product"

  join: issues {
    view_label: "Jira Tickets (Issues)"
    sql_on: ${issue_comments.issueid} = ${issues.id} ;;
    type: left_outer
    relationship: many_to_one
    fields: [issues.id, issues.key, issues.customfield_11101_value, issues.label, issues.description_filter, issues.telemetry_ticket, issues.fix_version, issues.resolution_name, issues.status_name, issues.created_date, issues.created_month, issues.created_year, issues.created_week, issues.labels, issues.description, issues.summary, issues.creator_displayname, issues.reporter_displayname, issues.customfield_11100_displayname]
  }
}

explore: server_telemetry {
  label: "Server Telemetry"
  group_label: "Quality Assurance"

  join: server_version {
    view_label: "Server Details"
    from: server_telemetry
    sql_on: ${server_telemetry.user_id} = ${server_version.user_id} and ${server_telemetry.timestamp_date} = ${server_version.timestamp_date} AND ${server_version.telemetry_relation} = 'SERVER' ;;
    type: left_outer
    relationship: many_to_many
    fields: [server_version.version]
  }

  join: server_license {
    view_label: "Server Details"
    from: server_telemetry
    sql_on: ${server_telemetry.user_id} = ${server_license.user_id} and ${server_telemetry.timestamp_date} = ${server_license.timestamp_date} AND ${server_license.telemetry_relation} = 'LICENSE';;
    type: left_outer
    relationship: many_to_many
    fields: [server_license.license_id]
  }
}

explore: events_web_desktop_telemetry {
  label: "Events Web Desktop Telemetry"
  group_label: "Quality Assurance"
}

explore: events_mobile_telemetry {
  label: "Events Mobile Telemetry"
  group_label: "Quality Assurance"
}

explore: plugins_telemetry {
  label: "Plugins Telemetry"
  group_label: "Quality Assurance"
}

explore: twitter {
  label: "Twitter Mentions"
  description: "Contains all tweets, replies, and retweets for and to tweets containing the keyword 'Mattermost'."
  group_label: "Mattermost Community"
}

explore: nps_feedback_classification {
  label: "Nps Feedback Classification"
  hidden: yes
}

explore: p2p_forum_activity {
  label: "Peer-to-Peer Forum Activity"
  description: "Contains a dailys snapshot of the aggregate counts of registrations and posts to Mattermost Peer-to-Peer Forums."
  group_label: "Mattermost Community"
}

explore: community_program_members {
  label: "Community Program Members"
  description: "Contains Members and/or Partners participating in Mattermost Community Programs (i.e. Mattermost Superstars & Trusted Partners)."
  group_label: "Mattermost Community"
}

explore: license_server_fact {
  group_label: "BLP"
  label: "License Server Fact"
  hidden: no
  extends: [person]

  join: server_fact {
    sql_on: ${license_server_fact.server_id} = ${server_fact.server_id} ;;
    relationship: many_to_one
    type: left_outer
  }

  join: excludable_servers {
    view_label: "License Server Fact"
    sql_on: ${license_server_fact.server_id} = ${excludable_servers.server_id} ;;
    relationship: many_to_one
    type: left_outer
    fields: [excludable_servers.reason]
  }

  join: trial_requests {
    sql_on: ${trial_requests.license_id} = ${license_server_fact.license_id} ;;
    relationship: many_to_one
    type: left_outer
    fields: []

  }

  join: person {
    view_label: "Person"
    sql_on: ${person.email} = ${license_server_fact.license_email};;
    relationship: many_to_one
  }
}

explore: incident_response_events {
  description: "Contains all Incident Response events recorded by servers with Incident Response enabled. Including, but not limited to: Update/Create Playbook, Add/Remove Checklist Items, and Create/End Incident."
  view_label: "Incident Management"
  label: "Incident Management"
  group_label: "Integrations"
  extends: [license_server_fact]

  join: server_daily_details {
    view_label: "Incident Management"
    sql_on: TRIM(${incident_response_events.user_id}) = TRIM(${server_daily_details.server_id}) AND ${incident_response_events.timestamp_date} = ${server_daily_details.logging_date} ;;
    relationship: many_to_one
    type: left_outer
    fields: [server_daily_details.db_type, server_daily_details.database_type_version,server_daily_details.database_version, server_daily_details.database_version_major, server_daily_details.database_version_major_release, server_daily_details.server_version_major, server_daily_details.version, server_daily_details.edition]
  }

  join: server_fact {
    view_label: "Incident Management"
    sql_on: TRIM(${incident_response_events.user_id}) = TRIM(${server_fact.server_id}) ;;
    relationship: many_to_one
    fields: [server_fact.installation_id, server_fact.first_server_version, server_fact.first_server_version_major, server_fact.first_server_edition, server_fact.server_edition, server_fact.cloud_server, server_fact.max_registered_users]
  }

  join: excludable_servers {
    view_label: "Incident Management"
    sql_on: TRIM(${incident_response_events.user_id}) = TRIM(${excludable_servers.server_id}) ;;
    relationship: many_to_one
    fields: [excludable_servers.reason]
  }

  join: license_server_fact {
    sql_on: TRIM(${license_server_fact.server_id}) = TRIM(${incident_response_events.user_id}) AND ${incident_response_events.timestamp_date}::DATE BETWEEN ${license_server_fact.start_date} AND ${license_server_fact.license_retired_date} ;;
    relationship: many_to_one
  }

  join: license_current {
    from: license_server_fact
    view_label: "License Current"
    sql_on: TRIM(${license_current.server_id}) = TRIM(${incident_response_events.user_id}) AND ${license_current.current_customer} ;;
    relationship: many_to_one
    fields: []
  }

  join: version_release_dates {
    sql_on: ${incident_response_events.serverversion_major} = SPLIT_PART(${version_release_dates.version}, '.',1) || '.' || SPLIT_PART(${version_release_dates.version}, '.',2) ;;
    relationship: many_to_one
    fields: []
  }

  join: dates {
    view_label: "Monthly Active Dates"
    sql_on: ${incident_response_events.timestamp_date}::date <= ${dates.date_date}::date AND ${incident_response_events.timestamp_date}::date >= ${dates.date_date}::date - INTERVAL '30 DAYS' AND ${dates.date_date}::DATE <= CURRENT_DATE::DATE ;;
    relationship: many_to_many
    type: left_outer
  }
}

explore: plugin_events {
  label: "Plugin Telemetry"
  view_label: "Plugin Telemetry"
  group_label: "Integrations"
  description: "Contains all Plugin event telemetry recorded by servers on versions where plugin telemetry has been enabled (v. 5.27+)."
  extends: [person]

  join: server_daily_details {
    view_label: "Plugin Telemetry"
    sql_on: ${plugin_events.user_id} = ${server_daily_details.server_id} AND ${plugin_events.timestamp_date}_date} = ${server_daily_details.logging_date} ;;
    relationship: many_to_one
    type: left_outer
    fields: [server_daily_details.database_version, server_daily_details.database_version_major, server_daily_details.database_version_major_release, server_daily_details.server_version_major, server_daily_details.version, server_daily_details.edition]
  }

  join: server_fact {
    view_label: "Plugin Telemetry"
    sql_on: ${plugin_events.user_id} = ${server_fact.server_id} ;;
    relationship: many_to_one
    fields: [server_fact.installation_id, server_fact.first_server_version, server_fact.first_server_version_major, server_fact.first_server_edition, server_fact.cloud_server]
  }

  join: excludable_servers {
    view_label: "Plugin Telemetry"
    sql_on: ${plugin_events.user_id} = ${excludable_servers.server_id} ;;
    relationship: many_to_one
    fields: [excludable_servers.reason]
  }

  join: license_server_fact {
    sql_on: ${license_server_fact.server_id} = ${plugin_events.user_id} AND ${plugin_events.original_timestamp_date}::DATE BETWEEN ${license_server_fact.start_date} AND ${license_server_fact.license_retired_date} ;;
    relationship: many_to_one
    fields: [license_server_fact.customer_id, license_server_fact.customer_name, license_server_fact.edition, license_server_fact.license_email]
  }

  join: person {
    sql_on: ${person.email} = ${license_server_fact.license_email};;
    relationship: many_to_one
  }

  join: nps_user_monthly_score {
    view_label: "NPS Data"
    sql_on: ${nps_user_monthly_score.user_id} = ${plugin_events.useractualid} AND ${nps_user_monthly_score.month_date}::DATE = ${plugin_events.timestamp_date}::DATE AND UPPER(${plugin_events.event}) = 'NPS_NPS_DISABLE' ;;
    relationship: many_to_one
    fields: [nps_user_monthly_score.count_passive, nps_user_monthly_score.count_users, nps_user_monthly_score.promoter_type,nps_user_monthly_score.pct_promoter_score, nps_user_monthly_score.pct_detractor_score, nps_user_monthly_score.count_promoters, nps_user_monthly_score.count_detractors,nps_user_monthly_score.score, nps_user_monthly_score.responses, nps_user_monthly_score.responses_alltime, nps_user_monthly_score.nps_score, nps_user_monthly_score.avg_score, nps_user_monthly_score.sum_responses, nps_user_monthly_score.sum_responses_all_time]
  }
}

explore: cloud_onboarding_flows {
  label: "Cloud Onboarding Flows"
  hidden: yes
}

explore: incident_response_telemetry {
  label: "Incident Management Telemetry"
  group_label: "Quality Assurance"
}

explore: cloud_clearbit {
  label: "Cloud Clearbit"
  hidden: yes

  join: license_server_fact {
    sql_on: ${cloud_clearbit.server_id} = ${license_server_fact.server_id} AND ${license_server_fact.edition} = 'Mattermost Cloud' ;;
    relationship: one_to_one
    fields: []
  }
}

explore: hacktoberboard_dev {
  label: "Hacktoberboard Dev"
  group_label: "Experimental"
}

explore: telemetry_columns {
  label: "Telemetry Columns"

  join: telemetry_tables {
    type: left_outer
    relationship: many_to_one
    sql_on: ${telemetry_columns.table} = ${telemetry_tables.table} AND ${telemetry_columns.date_added_date}::date = ${telemetry_tables.snapshot_date}::date ;;
    fields: []
  }
}

explore: telemetry_tables {
  label: "Telemetry Tables"
}

explore: daily_server_user_agent_events {
  label: "Daily Server User Agent Events"
  group_label: " User Agent Analysis"

  join: server_daily_details {
    type: left_outer
    view_label: "Server Details"
    relationship: many_to_one
    sql_on: ${daily_server_user_agent_events.logging_date} = ${server_daily_details.logging_date} AND ${server_daily_details.server_id} = ${daily_server_user_agent_events.server_id} ;;
    fields: [server_daily_details.database_version, server_daily_details.database_version_major, server_daily_details.server_version_major, server_daily_details.version, server_daily_details.edition, server_daily_details.edition2]
  }

  join: excludable_servers {
    view_label: "Daily Server User Agent Events"
    relationship: many_to_one
    type: left_outer
    sql_on: ${excludable_servers.server_id} = ${daily_server_user_agent_events.server_id} ;;
    fields: [excludable_servers.reason]
  }

  join: server_fact {
    relationship: many_to_one
    view_label: "Server Details"
    type: left_outer
    sql_on: ${server_fact.server_id} = ${daily_server_user_agent_events.server_id} ;;
    fields: [server_fact.cloud_server, server_fact.first_server_edition, server_fact.first_server_version, server_fact.first_server_version_major]
  }

  join: license_server_fact {
    type: left_outer
    relationship: many_to_one
    view_label: "License & Customer Details"
    sql_on: (${license_server_fact.server_id} = ${server_daily_details.server_id}) and (${server_daily_details.logging_date} BETWEEN ${license_server_fact.start_date} AND ${license_server_fact.license_retired_date});;
    fields: [license_server_fact.customer_name, license_server_fact.license_email, license_server_fact.customer_id, license_server_fact.users]
  }


}

explore: focalboard_activity {
  label: "Focalboard Telemetry"
  group_label: "Focalboard"
  hidden: yes
}

explore: focalboard_config {
  label: "Focalboard Telemetry"
  group_label: "Focalboard"
  hidden: yes
}

explore: focalboard_server {
  fields: [ALL_FIELDS*, -focalboard_activity.event, -focalboard_activity.event_text, -focalboard_config.event, focalboard_fact.focalboard_facts*]
  view_label: "Focalboard Telemetry"
  group_label: "Focalboard"
  label: "Focalboard Telemtry"

  join: focalboard_activity {
    view_label: "Focalboard Telemetry"
    sql_on: ${focalboard_server.user_id} = ${focalboard_activity.user_id} and ${focalboard_server.timestamp_date}::date = ${focalboard_activity.timestamp_date} ;;
    relationship: one_to_one
  }

  join: focalboard_config {
    view_label: "Focalboard Telemetry"
    sql_on: ${focalboard_server.user_id} = ${focalboard_config.user_id} and ${focalboard_server.timestamp_date}::date = ${focalboard_config.timestamp_date} ;;
    relationship: one_to_one
  }

  join: focalboard_fact {
    view_label: "Focalboard Instance Facts (To Date)"
    sql_on: ${focalboard_server.user_id} = ${focalboard_fact.instance_id} ;;
    relationship: many_to_one
    fields: [focalboard_fact.focalboard_facts*]
  }
}

explore: incident_daily_details {
  label: "Incident Daily Details"
  group_label: "Incident Collaboration"
  hidden: no

  join: license_server_fact {
    view_label: "Incident Daily Details"
    relationship: many_to_one
    sql_on: (${license_server_fact.server_id} = ${incident_daily_details.server_id}) and (${incident_daily_details.logging_date} BETWEEN ${license_server_fact.start_date} AND ${license_server_fact.license_retired_date});;
    fields: [license_server_fact.customer_name, license_server_fact.customer_id, license_server_fact.company, license_server_fact.users]
  }

  join: server_fact {
    view_label: "Incident Daily Details"
    sql_on: ${server_fact.server_id} = ${incident_daily_details.server_id} ;;
    relationship: many_to_one
    type: left_outer
    fields: []
  }

  join: excludable_servers {
    view_label: "Incident Daily Details"
    relationship: many_to_one
    sql_on: ${excludable_servers.server_id} = ${incident_daily_details.server_id} ;;
  }

  join: server_daily_details {
    view_label: "Incident Daily Details"
    sql_on: ${incident_daily_details.server_id} = ${server_daily_details.server_id} AND ${server_daily_details.logging_date}::DATE = ${incident_daily_details.logging_date}::DATE ;;
    relationship: one_to_one
    type: left_outer
    fields: [server_daily_details.product_edition, server_daily_details.total_instances, server_daily_details.database_version, server_daily_details.database_version_major, server_daily_details.version, server_daily_details.server_version_major]
  }

  join: incident_collaboration_fact {
    view_label: "Incident Collaboration Facts (To Date)"
    sql_on: ${incident_collaboration_fact.server_id} = ${incident_daily_details.server_id} ;;
    relationship: many_to_one
    fields: [incident_collaboration_fact.incident_facts*]
  }
}

explore: incident_collaboration {
  from: server_daily_details_ext
  # sql_always_where: ${server_fact.last_active_date}::date >= CURRENT_DATE - INTERVAL '3 DAYS' ;;
  view_label: "Incident Collaboration Daily"
  hidden: yes
  group_label: "Incident Collaboration"
  label: "Incident Collaboration Daily"
  fields: [incident_collaboration.server_id, incident_collaboration.product_edition, incident_collaboration.version, incident_collaboration.server_version_major, incident_daily_details*, license_server_fact.customer_name, license_server_fact.customer_id, license_server_fact.company, license_server_fact.users,-incident_daily_details.logging_date,-incident_daily_details.logging_month, -incident_daily_details.logging_week,-incident_daily_details.logging_year,-incident_daily_details.logging_fiscal_quarter, -incident_daily_details.logging_fiscal_year, incident_collaboration.logging_date,incident_collaboration.logging_week,incident_collaboration.logging_month,incident_collaboration.logging_year,incident_collaboration.logging_fiscal_quarter,incident_collaboration.logging_fiscal_year,incident_collaboration.total_instances, server_fact.cloud_server, excludable_servers.reason, incident_collaboration.last_day_of_week, incident_collaboration.last_day_of_month]

  join: incident_daily_details {
    view_label: "Incident Collaboration Daily"
    sql_on: ${incident_daily_details.server_id} = ${incident_collaboration.server_id} AND ${incident_collaboration.logging_date}::DATE = ${incident_daily_details.logging_date}::DATE ;;
    relationship: one_to_one
    type: left_outer
  }

  join: incident_collaboration_fact {
    view_label: "Incident Collaboration Facts (To Date)"
    sql_on: ${incident_collaboration_fact.server_id} = ${incident_collaboration.server_id} ;;
    relationship: many_to_one
    fields: [incident_collaboration_fact.incident_facts*]
  }

  join: license_server_fact {
    view_label: "Incident Collaboration Daily"
    relationship: many_to_one
    sql_on: (${license_server_fact.server_id} = ${incident_collaboration.server_id}) and (${incident_collaboration.logging_date} BETWEEN ${license_server_fact.start_date} AND ${license_server_fact.license_retired_date});;
    fields: [license_server_fact.customer_name, license_server_fact.customer_id, license_server_fact.company, license_server_fact.users]
  }

  join: server_fact {
    view_label: "Incident Collaboration Daily"
    sql_on: ${server_fact.server_id} = ${incident_collaboration.server_id} ;;
    relationship: many_to_one
    type: left_outer
  }

  join: excludable_servers {
    view_label: "Incident Collaboration Daily"
    relationship: many_to_one
    sql_on: ${excludable_servers.server_id} = ${incident_collaboration.server_id} ;;
  }
}

explore: incident_collaboration_fact {
  label: "Incident Collaboration Fact"
  hidden: yes
}

explore: focalboard_fact {
  label: "Focalboard Fact"
  hidden: yes
}
