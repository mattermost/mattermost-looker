# This is the view file for the analytics.events.user_events_telemetry table.
view: user_events_telemetry {
  sql_table_name: events.user_events_telemetry ;;
  view_label: "User Events Telemetry (Messaging)"

  set: server_drill {
    fields: [event_date, context_traits_portal_customer_id, server_fact.installation_id,
      event, type, category,
      license_server_fact.customer_name, stripe_customer_dns, subscriptions.plan,
      stripe_customer_email, category, type, user_actual_count, event_count, user_id]
  }

  set: uet_true_up_review {
    fields: [active_users, event_date, authentication_features, user_events_telemetry.customer_name,
      incoming_webhooks_count, license_id, licensed_seats, outgoing_webhooks_count, plugin_names, server_id, server_version,
      total_plugins, server_installation_type, license_plan, type]
  }

  set: user_drill {
    fields: [user_actual_id, user_actual_role, event_count, post_count, post_reaction_count, root_count, user_id]
  }

  # FILTERS

  dimension: license_id {
    label: "License Id"
    group_label: "True Up Review"
    description: "True Up - License Id"
    type: string
    sql: ${TABLE}.license_id ;;
  }

  dimension: incoming_webhooks_count {
    label: "Incoming Webhooks Count"
    group_label: "True Up Review"
    description: "True Up - Incoming Webhooks Count"
    type: string
    sql: ${TABLE}.incoming_webhooks_count ;;
  }

  dimension: server_version {
    label: "Server Version"
    group_label: "True Up Review"
    description: "True Up - Server Version"
    type: string
    sql: ${TABLE}.server_version ;;
  }

  dimension: customer_name {
    label: "Customer Name"
    group_label: "True Up Review"
    description: "True Up - Customer Name"
    type: string
    sql: ${TABLE}.customer_name ;;
  }

  dimension: server_id {
    label: "Server Id"
    group_label: "True Up Review"
    description: "True Up - Server Id"
    type: string
    sql: ${TABLE}.server_id ;;
  }

  dimension: authentication_features {
    label: "Authentication Features"
    group_label: "True Up Review"
    description: "True Up - Authentication Features"
    type: string
    sql: ${TABLE}.authentication_features ;;
  }

  dimension: active_users {
    label: "Active Users"
    group_label: "True Up Review"
    description: "True Up - Active Users"
    type: string
    sql: ${TABLE}.active_users ;;
  }

  dimension: total_plugins {
    label: "Total Plugins"
    group_label: "True Up Review"
    description: "True Up - Total Plugins"
    type: string
    sql: ${TABLE}.total_plugins ;;
  }

  dimension: licensed_seats {
    label: "Licensed Seats"
    group_label: "True Up Review"
    description: "True Up - Licensed Seats"
    type: string
    sql: ${TABLE}.licensed_seats ;;
  }

  dimension: outgoing_webhooks_count {
    label: "Outgoing Webhooks Count"
    group_label: "True Up Review"
    description: "True Up - Outgoing Webhooks Count"
    type: string
    sql: ${TABLE}.outgoing_webhooks_count ;;
  }

  dimension: plugin_names {
    label: "Plugin Names"
    group_label: "True Up Review"
    description: "True Up - Plugin Names"
    type: string
    sql: ${TABLE}.plugin_names ;;
  }

  dimension: license_plan {
    label: "License Plan"
    group_label: "True Up Review"
    description: "True Up - License Plan"
    type: string
    sql: ${TABLE}.license_plan ;;
  }

  dimension: server_installation_type {
    label: "Server Installation Type"
    group_label: "True Up Review"
    description: "True Up - Server Installation Type"
    type: string
    sql: ${TABLE}.server_installation_type ;;
  }

  dimension: option {
    label: "Option"
    description: "Deployment Option Select - Option"
    type: string
    sql: ${TABLE}.option ;;
  }

  dimension: campaign_utm_source {
    label: "UTM Source"
    description: "UTM Source"
    type: string
    sql: ${TABLE}.campaign_utm_source ;;
  }

  dimension: campaign_utm_medium {
    label: "UTM Medium"
    description: "UTM Medium"
    type: string
    sql: ${TABLE}.campaign_utm_medium ;;
  }

  dimension: campaign_utm_campaign {
    label: "UTM Campaign"
    description: "UTM Campaign"
    type: string
    sql: ${TABLE}.campaign_utm_campaign ;;
  }

  dimension: caller_info {
    description: "Caller Info"
    type: string
    sql: ${TABLE}.caller_info ;;
  }

  dimension: reaction_event {
    group_label: "Event Type Filter"
    description: "Boolean indicating the event performed was a reaction i.e. emoji response to a post or upload."
    type: yesno
    sql: CASE WHEN ${type} = 'api_reaction_save' THEN TRUE ELSE FALSE END ;;
  }

  dimension: lhs_event {
    label: "LHS Direct Message Event"
    group_label: "Event Type Filter"
    description: "Boolean indicating the event triggered was lefthand sidebar DM Count event."
    type: yesno
    sql: CASE WHEN ${type} = 'LHS_DM_GM_Count' THEN TRUE ELSE FALSE END ;;
  }

  dimension: gaexp {
    label: "Google Analytics A/B test tag"
    description: "Google Analytics A/B test tag."
    type: string
    sql: ${TABLE}.gaexp ;;
  }

  dimension: admin_team_configuration_event {
    group_label: "Event Type Filter"
    description: "Boolean indicating the event performed was an 'admin_team_config_page' event."
    type: yesno
    sql: CASE WHEN ${category} = 'admin_team_config_page' THEN TRUE ELSE FALSE END ;;
  }

  dimension: admin_channel_configuration_event {
    group_label: "Event Type Filter"
    description: "Boolean indicating the event performed was an 'admin_channel_config_page' event."
    type: yesno
    sql: CASE WHEN ${category} = 'admin_channel_config_page' THEN TRUE ELSE FALSE END ;;
  }

  dimension: cloud_event {
    group_label: "Event Type Filter"
    description: "Boolean indicating the event performed was Cloud Category event."
    type: yesno
    sql: CASE WHEN split_part(${category}, '_', 1) THEN TRUE ELSE FALSE END ;;
  }

  dimension: cloud_server {
    description: "Boolean indicating the event was performed by a cloud user (during workspace creation) or cloud server (post workspace creation).."
    type: yesno
    sql: CASE WHEN (split_part(${category}, '_', 1) = 'cloud') or (${server_fact.cloud_server} = TRUE) THEN TRUE ELSE FALSE END ;;
  }

  dimension: stripe_customer_email {
    group_label: "Stripe Customer Details"
    description: "The email provided when purchasing an online subscription or creating a cloud workspace."
    type: string
    sql: COALESCE(${customers.email}, ${portal_customers.email}) ;;
  }

  dimension: stripe_customer_dns {
    group_label: "Stripe Customer Details"
    label: "Stripe Customer DNS"
    description: "The workspace domain name of the stripe customers Mattermost workspace."
    type: string
    sql: COALESCE(${subscriptions.cws_dns}, ${portal_subscriptions.cws_dns}) ;;
  }

  dimension: properties {
    description: "The raw data from each single event record logged in the table, consolidated into a single json/variant column."
    type: string
    sql: object_construct(user_events_telemetry.*) ;;
    html:
    {% assign words = value | replace: '}', '' | replace: '{', '' | replace: ', ', '; ' | split: ',' %}
    <ul>
    {% for word in words %}
    <li>{{ word }}</li>
    {% endfor %} ;;
  }

  # DIMENSIONS
  dimension: _dbt_source_relation2 {
    description: ""
    type: string
    sql: ${TABLE}._dbt_source_relation2 ;;
    hidden: no
  }

  dimension: event_source {
    label: " Event Source"
    description: "The source of the event triggered by the user: WebApp, Desktop, Mobile, and/or Customer Portal"
    type: string
    sql: CASE WHEN SPLIT_PART(${TABLE}._dbt_source_relation2, '.', 3) IN ('SEGMENT_WEBAPP_EVENTS','RUDDER_WEBAPP_EVENTS') AND lower(COALESCE(${TABLE}.context_user_agent, ${TABLE}.context_useragent)) LIKE '%electron%' THEN 'Desktop'
              WHEN SPLIT_PART(${TABLE}._dbt_source_relation2, '.', 3) IN ('SEGMENT_WEBAPP_EVENTS','RUDDER_WEBAPP_EVENTS') AND lower(COALESCE(${TABLE}.context_user_agent, ${TABLE}.context_useragent)) NOT LIKE '%electron%' THEN 'WebApp'
              WHEN SPLIT_PART(${TABLE}._dbt_source_relation2, '.', 3) IN ('SEGMENT_MOBILE_EVENTS','MOBILE_EVENTS') THEN 'Mobile'
              WHEN SPLIT_PART(${TABLE}._dbt_source_relation2, '.', 3) IN ('PORTAL_EVENTS') THEN 'Customer Portal'
              ELSE 'WebApp' END;;
    suggestions: ["Desktop", "Mobile", "Portal", "WebApp"]
  }

  dimension: _dbt_source_relation {
    description: ""
    type: string
    sql: ${TABLE}._dbt_source_relation ;;
    hidden: yes
  }

  dimension: context_library_version {
    group_label: "User Agent Attributes"
    label: "Library Version"
    description: ""
    type: string
    sql: ${TABLE}.context_library_version ;;
    hidden: no
  }

  dimension: context_device_model {
    group_label: "User Agent Attributes"
    description: ""
    label: "Device Model"
    type: string
    sql: COALESCE(NULLIF(${user_agent_registry.device_model}, 'Other'),${TABLE}.context_device_model) ;;
    hidden: no
  }

  dimension: context_network_cellular {
    group_label: "User Agent Attributes"
    description: "Boolean indicating the user performed the event using a cellular network rather than a wifi or wired connection."
    label: "Used Cellular Network"
    type: yesno
    sql: COALESCE(${TABLE}.context_network_cellular, FALSE) ;;
    hidden: no
  }

  dimension: context_traits_device_dimensions_width {
    group_label: "Context Attributes"
    description: ""
    type: number
    sql: ${TABLE}.context_traits_device_dimensions_width ;;
    hidden: yes
  }

  dimension: context_os_name {
    group_label: "User Agent Attributes"
    label: "Operating System"
    description: "The operating system of the user performing the event."
    type: string
    sql: COALESCE(NULLIF(${user_agent_registry.operating_system}, 'Other'), ${TABLE}.context_os_name, ${context_device_os}, ${context_traits_device_os}) ;;
    hidden: no
  }


  dimension: valid_operating_system {
    description: "Regex filter to reduce noise produced by invalid user agents and test servers."
    group_label: "User Agent Attributes"
    type: yesno
    sql: CASE WHEN REGEXP_SUBSTR(${context_os_name}, '^[A-Za-z]') IS NOT NULL THEN TRUE ELSE FALSE END ;;
  }

  dimension: context_device_type {
    group_label: "User Agent Attributes"
    label: "Device Type"
    description: "The device type of the user performing the event."
    type: string
    sql: COALESCE(NULLIF(${user_agent_registry.device_type}, 'Other'),${TABLE}.context_device_type) ;;
    hidden: no
  }

  dimension: context_traits_anonymousid {
    group_label: "Context Attributes"
    description: ""
    type: string
    sql: ${TABLE}.context_traits_anonymousid ;;
    hidden: yes
  }

  dimension: category {
    label: " Event Category"
    description: "The event category of the event that was triggered i.e. api, ui, cloud_account_creation, settings, etc."
    type: string
    sql: ${TABLE}.category ;;
    hidden: no
  }

  dimension: context_screen_density {
    group_label: "User Agent Attributes"
    label: "Screen Density"
    description: ""
    type: number
    sql: ${TABLE}.context_screen_density ;;
    hidden: no
  }

  dimension: context_traits_ip {
    group_label: "User Agent Attributes"
    label: "IP Address"
    description: "The IP Address of the user performing the event."
    type: string
    sql: COALESCE(${TABLE}.context_traits_ip, ${context_ip}) ;;
    hidden: no
  }

  dimension: context_app_name {
    label: "App Name"
    description: "The Mattermost App Name. Typically App Name = 'Mattermost' - though a few anomalies of custom names provided."
    type: string
    sql: COALESCE(${TABLE}.context_app_name, ${context_app_namespace}) ;;
    hidden: no
  }

  dimension: context_useragent {
    label: "User Agent"
    description: "The User Agent of the user performing the event."
    type: string
    sql: ${TABLE}.context_useragent ;;
    hidden: no
  }

  dimension: context_screen_height {
    group_label: "User Agent Attributes"
    label: "Screen Height"
    description: ""
    type: number
    sql: ${TABLE}.context_screen_height ;;
    hidden: no
  }

  dimension: event {
    description: ""
    type: string
    sql: ${TABLE}.event ;;
    hidden: yes
  }

  dimension: user_actual_role {
    description: "The role of the user performing the event (i.e. system admin, user, etc.)"
    type: string
    sql: ${TABLE}.user_actual_role ;;
    hidden: no
  }

  dimension: anonymous_id {
    description: ""
    type: string
    sql: COALESCE(${TABLE}.anonymous_id, ${context_traits_anonymousid}) ;;
    hidden: no
  }

  dimension: feature_flags {
    description: "Feature Flags"
    group_label: "Feature Flags"
    type: string
    sql: ${TABLE}.feature_flags ;;
    hidden: no
  }

  dimension: password_requirements_cloud_signup {
    description: "Password Requirements (Cloud Signup)"
    group_label: "Feature Flags"
    type: string
    sql: TRIM(SPLIT_PART(SPLIT_PART(${TABLE}.feature_flags,',',1),':',2)) ;;
    hidden: no
  }

  dimension: show_email_on_sso_password_page {
    description: "Show Email on SSO Password Page"
    group_label: "Feature Flags"
    type: string
    sql: TRIM(SPLIT_PART(SPLIT_PART(${TABLE}.feature_flags,',',1),':',2)) ;;
    hidden: no
  }

  dimension: preparing_workspace_new_wording {
    description: "Preparing Workspace New Wording"
    group_label: "Feature Flags"
    type: string
    sql: TRIM(SPLIT_PART(SPLIT_PART(${TABLE}.feature_flags,',',2),':',2)) ;;
    hidden: no
  }

  dimension: sso {
    description: "SSO"
    group_label: "Feature Flags"
    type: string
    sql: TRIM(SPLIT_PART(SPLIT_PART(${TABLE}.feature_flags,',',2),':',2)) ;;
    hidden: no
  }

  dimension: context_timezone {
    label: "Timezone"
    description: ""
    type: string
    sql: ${TABLE}.context_timezone ;;
    hidden: no
  }

  dimension: context_device_id {
    group_label: "User Agent Attributes"
    description: ""
    label: "Device ID"
    type: string
    sql: ${TABLE}.context_device_id ;;
    hidden: no
  }

  dimension: context_library_name {
    group_label: "User Agent Attributes"
    description: "Library Name"
    type: string
    sql: ${TABLE}.context_library_name ;;
    hidden: no
  }

  dimension: context_screen_width {
    group_label: "User Agent Attributes"
    description: ""
    label: "Screen Width"
    type: number
    sql: ${TABLE}.context_screen_width ;;
    hidden: no
  }

  dimension: context_network_wifi {
    group_label: "User Agent Attributes"
    label: "Used Wifi Network"
    description: "Boolean indicating the user performed the event on a wifi network rather than a cellular network or wired connection."
    type: yesno
    sql: ${TABLE}.context_network_wifi ;;
    hidden: no
  }

  dimension: user_actual_id {
    label: " User ID"
    description: "The unique user id of the user performing the event."
    type: string
    sql: COALESCE(${TABLE}.user_actual_id, ${anonymous_id}) ;;
    hidden: no
  }

  dimension: context_device_name {
    group_label: "User Agent Attributes"
    description: "The name of the device the user performing the event is using."
    label: "Device Name"
    type: string
    sql: ${TABLE}.context_device_name ;;
    hidden: no
  }

  dimension: user_id {
    label: " Server ID"
    description: "The server id of the user performing the event"
    type: string
    sql: ${TABLE}.user_id;;
    hidden: no
  }

  dimension: context_os_version {
    group_label: "User Agent Attributes"
    label: "OS Version"
    description: "The OS version of the operating system of the user performing the event."
    type: string
    sql: COALESCE(NULLIF(${user_agent_registry.os_version}, 'Other'), ${TABLE}.context_os_version) ;;
    hidden: no
  }

  dimension: os_version_major {
    group_label: "User Agent Attributes"
    label: "OS Version (Major)"
    description: "The OS version w/out trailing dot release of the operating system of the user performing the event."
    type: string
    sql: CASE WHEN nullif(SPLIT_PART(${context_os_version}, '.', 2), '') IS NULL THEN ${context_os_version} ELSE SPLIT_PART(${context_os_version}, '.',1) || '.' || SPLIT_PART(${context_os_version}, '.',2) END;;
    hidden: no
  }

  dimension: context_app_build {
    group_label: "User Agent Attributes"
    description: "The app build version of the user performing the event."
    label: "App Build"
    type: string
    sql: coalesce(${TABLE}.context_app_build, ${context_traits_app_build}) ;;
    hidden: no
  }

  dimension: type {
    label: " Event Name"
    description: "The name of the event that was performed."
    type: string
    sql: CASE WHEN COALESCE(${TABLE}.type, ${event}) = 'pageview_getting_started' THEN COALESCE(${TABLE}.type, ${event}) || '_cloud'
          ELSE COALESCE(${TABLE}.type, ${event}) end;;
    hidden: no
  }

  dimension: name {
    label: "Name"
    description: "The name of the event."
    type: string
    sql: ${TABLE}.name;;
    hidden: no
  }

  dimension: sign_up_seqence {
    label: "Chronological Sequence for Cloud Sign-up"
    type: number
    sql: CASE WHEN COALESCE(${type}, ${event}) IN ('cloud_signup_b_page_visit','cloud_signup_page_visit') THEN 1
      WHEN COALESCE(${type}, ${event}) = 'click_start_trial' THEN 2
      WHEN COALESCE(${type}, ${event}) = 'pageview_verify_email' THEN 3
      WHEN COALESCE(${type}, ${event}) = 'enter_valid_code' THEN 4
      WHEN COALESCE(${type}, ${event}) = 'pageview_create_workspace' and ${name} = 'pageview_company_name' THEN 5
      WHEN COALESCE(${type}, ${event}) = 'workspace_name_valid' THEN 6
      WHEN COALESCE(${type}, ${event}) = 'workspace_provisioning_started' THEN 7
      WHEN COALESCE(${type}, ${event}) = 'workspace_provisioning_ended' THEN 8
      ELSE NULL
      end;;
    hidden: no
  }

  dimension: sign_up_events_sequence {
    label: "Event Sequence for Cloud Sign-up"
    type: string
    sql: CASE WHEN COALESCE(${type}, ${event}) IN ('cloud_signup_b_page_visit','cloud_signup_page_visit') THEN 'Sign-Up Page'
      WHEN COALESCE(${type}, ${event}) = 'click_start_trial' THEN 'Click Start Trial'
      WHEN COALESCE(${type}, ${event}) = 'pageview_verify_email' THEN 'Verify Email'
      WHEN COALESCE(${type}, ${event}) = 'enter_valid_code' THEN 'Enter Valid Code'
      WHEN COALESCE(${type}, ${event}) = 'pageview_create_workspace' and ${name} = 'pageview_company_name' THEN 'Enter Company Name'
      WHEN COALESCE(${type}, ${event}) = 'workspace_name_valid' THEN 'Workspace Name Valid'
      WHEN COALESCE(${type}, ${event}) = 'workspace_provisioning_started' THEN 'Workspace Creation Started'
      WHEN COALESCE(${type}, ${event}) = 'workspace_provisioning_ended' THEN 'Workspace Creation Ended'
      ELSE NULL
      end;;
    hidden: no
  }

  dimension: context_traits_server {
    group_label: "Context Attributes"
    description: ""
    type: string
    sql: ${TABLE}.context_traits_server ;;
    hidden: yes
  }

  dimension: context_traits_device_istablet {
    group_label: "User Agent Attributes"
    label: "Used Tablet"
    description: "Boolean indicating the event was performed via tablet device."
    type: yesno
    sql: COALESCE(${TABLE}.context_traits_device_istablet, ${context_device_is_tablet}, false) ;;
    hidden: no
  }

  dimension: context_traits_app_build {
    group_label: "Context Attributes"
    description: ""
    type: string
    sql: ${TABLE}.context_traits_app_build ;;
    hidden: yes
  }

  dimension: context_traits_device_os {
    group_label: "User Agent Attributes"
    description: ""
    type: string
    sql: ${TABLE}.context_traits_device_os ;;
    hidden: yes
  }

  dimension: context_app_namespace {
    label: "App Namespace"
    description: "The app namespace of the service collecting the Mattermost application data. Typically defaults to 'com.rudderlabs.javascript'."
    type: string
    sql: ${TABLE}.context_app_namespace ;;
    hidden: no
  }

  dimension: context_device_manufacturer {
    group_label: "User Agent Attributes"
    description: ""
    label: "Device Brand"
    type: string
    sql: COALESCE(NULLIF(${user_agent_registry.device_brand}, 'Other'),${TABLE}.context_device_manufacturer) ;;
    hidden: no
  }

  dimension: context_network_bluetooth {
    group_label: "User Agent Attributes"
    label: "Used Bluetooth"
    description: ""
    type: yesno
    sql: ${TABLE}.context_network_bluetooth ;;
    hidden: no
  }

  dimension: context_locale {
    group_label: "User Agent Attributes"
    label: "Locale"
    description: ""
    type: string
    sql: ${TABLE}.context_locale ;;
    hidden: no
  }

  dimension: context_traits_id {
    group_label: "Context Attributes"
    description: ""
    type: string
    sql: ${TABLE}.context_traits_id ;;
    hidden: yes
  }

  dimension: context_traits_userid {
    group_label: "Context Attributes"
    description: ""
    type: string
    sql: ${TABLE}.context_traits_userid ;;
    hidden: yes
  }

  dimension: context_network_carrier {
    group_label: "User Agent Attributes"
    description: ""
    label: "Network Carrier"
    type: string
    sql: ${TABLE}.context_network_carrier ;;
    hidden: no
  }

  dimension: id {
    description: "The unique id of the event performed."
    type: string
    sql: ${TABLE}.id ;;
    hidden: no
    primary_key: yes
  }

  dimension: event_text {
    description: ""
    type: string
    sql: ${TABLE}.event_text ;;
    hidden: yes
  }

  dimension: context_app_version {
    label: "App Version"
    description: ""
    type: string
    sql: COALESCE(${TABLE}.context_app_version, ${context_traits_app_version}) ;;
    hidden: no
  }

  dimension: context_ip {
    group_label: "Context Attributes"
    description: ""
    type: string
    sql: ${TABLE}.context_ip ;;
    hidden: yes
  }

  dimension: channel {
    group_label: "Channel Attributes"
    description: ""
    type: string
    sql: ${TABLE}.channel ;;
    hidden: no
  }

  dimension: context_traits_app_version {
    group_label: "Context Attributes"
    description: ""
    type: string
    sql: ${TABLE}.context_traits_app_version ;;
    hidden: yes
  }

  dimension: context_traits_device_dimensions_height {
    group_label: "Context Attributes"
    description: ""
    type: number
    sql: ${TABLE}.context_traits_device_dimensions_height ;;
    hidden: yes
  }

  dimension: from_background {
    description: ""
    type: yesno
    sql: ${TABLE}.from_background ;;
    hidden: no
  }

  dimension: channel_id {
    group_label: "Channel Attributes"
    description: ""
    type: string
    sql: ${TABLE}.channel_id ;;
    hidden: no
  }

  dimension: context_page_url {
    group_label: "Webpage Attributes (Portal Events)"
    description: ""
    type: string
    sql: ${TABLE}.context_page_url ;;
    hidden: no
  }

  dimension: context_page_referrer {
    group_label: "Webpage Attributes (Portal Events)"
    description: ""
    type: string
    sql: ${TABLE}.context_page_referrer ;;
    hidden: no
  }

  dimension: page {
    group_label: "Webpage Attributes (Portal Events)"
    description: ""
    type: string
    sql: ${TABLE}.page ;;
    hidden: no
  }

  dimension: context_page_title {
    group_label: "Webpage Attributes (Portal Events)"
    description: ""
    type: string
    sql: ${TABLE}.context_page_title ;;
    hidden: no
  }

  dimension: context_page_search {
    group_label: "Webpage Attributes (Portal Events)"
    description: ""
    type: string
    sql: ${TABLE}.context_page_search ;;
    hidden: no
  }

  dimension: context_page_path {
    group_label: "Webpage Attributes (Portal Events)"
    description: ""
    type: string
    sql: ${TABLE}.context_page_path ;;
    hidden: no
  }

  dimension: subscription_id {
    description: "The unique subscription id associated with the user performing the subscription_purchased and stripe_confirm_card_error Customer Portal Events."
    type: string
    sql: ${TABLE}.subscription_id ;;
    hidden: no
  }

  dimension: context_traits_portal_customer_id {
    label: "Context Traits Portal Customer ID"
    description: ""
    type: string
    sql: ${TABLE}.context_traits_portal_customer_id ;;
    hidden: no
  }

  dimension: portal_customer_id {
    label:  "Portal Customer ID"
    description: ""
    type: string
    sql: ${TABLE}.portal_customer_id ;;
    hidden: no
  }

  dimension: stripe_error {
    description: "The error message provided to the user when they trigger the stripe_confirm_card_error Customer Portal event."
    type: string
    sql: ${TABLE}.stripe_error ;;
    hidden: no
  }

  dimension: workspace_name {
    description: "The workspace name provided during the account creation process (only provided for certain events in the portal cloud account creation workflow).."
    type: string
    sql: ${TABLE}.workspace_name ;;
    hidden: no
  }

  dimension: suggestion {
    description: "The suggested name provided to a user when they trigger the workspace_name_taken event."
    type: string
    sql: ${TABLE}.suggestion ;;
    hidden: no
  }

  dimension: duration {
    description: "The time, in milliseconds, for the event to complete (only for page_load, channel_switch, and team_switch events)."
    type: number
    sql: ${TABLE}.duration ;;
    hidden: no
  }

  dimension: root_id {
    description: "The root id used to track the origin of a post reply (for api_posts_replied events). Root ID = The Post ID of the original post responsible for the thread."
    type: string
    sql: ${TABLE}.root_id ;;
    hidden: no
  }

  dimension: post_id {
    description: "The unique id generated during a post or reply event."
    type: string
    sql: ${TABLE}.post_id ;;
    hidden: no
  }

  dimension: sort {
    description: "Indicates the sort preference selected by a user when triggering the api_profiles_get_in_team event. This event is triggered when a user launches the modal to search users w/in a team."
    type: string
    sql: ${TABLE}.sort ;;
    hidden: no
  }

  dimension: team_id {
    description: "The unique team id where the event was performed by the user."
    type: string
    sql: ${TABLE}.team_id ;;
    hidden: no
  }

  dimension: userid {
    description: ""
    type: string
    sql: ${TABLE}.userid ;;
    hidden: yes
  }

  dimension: version {
    description: ""
    type: string
    sql: ${TABLE}.version ;;
    hidden: no
  }

  dimension: keyword {
    label: "Emoji/Gif Keyword"
    description: "The keyword of the emoji and or gif being shared/viewd via the 'shares' and/or 'views' events."
    type: string
    sql: ${TABLE}.keyword ;;
    hidden: no
  }

  dimension: count {
    label: "LHS: Direct Message Count"
    description: "The count  of direct message channels  appearing in  the users lefthand sidebar."
    type: number
    sql: ${TABLE}.count ;;
    hidden: no
  }

  dimension: gfyid {
    description: "A string of unique keywords used to identify a gif being shared by the 'shares' event."
    label: "Gfy ID"
    type: string
    sql: ${TABLE}.gfyid ;;
    hidden: no
  }

  dimension: context {
    description: ""
    type: string
    sql: ${TABLE}.context ;;
    hidden: yes
  }

  dimension: field {
    group_label: "User Update Settings Attributes"
    label: "Field Updated"
    description: "The field updated by the user when performing the user_settings_update event (i.e. picture, name, position, email, and sidebar setting options)."
    type: string
    sql: ${TABLE}.field ;;
    hidden: no
  }

  dimension: plugin_id {
    description: "The unique string identifier of the plugin downloaded and/or updated by the user triggering a ui_marketplace_download/update event."
    type: string
    sql: ${TABLE}.plugin_id ;;
    hidden: no
  }

  dimension: installed_version {
    description: ""
    type: string
    sql: ${TABLE}.installed_version ;;
    hidden: no
  }

  dimension: group_constrained {
    description: "Boolean indicating the search for profile not in team/channel was or was not group constained."
    type: yesno
    sql: ${TABLE}.group_constrained ;;
    hidden: no
  }

  dimension: value {
    group_label: "User Update Settings Attributes"
    label: "Value Updated To"
    description: "The value updated to by the user when performing the user_settings_update event (i.e. true, false, recent, never, none, by_type, alpha, or after_seven_days)."
    type: string
    sql: ${TABLE}.value ;;
    hidden: no
  }

  dimension: include_deleted {
    group_label: "Get Channel Event Attributes"
    description: "Boolean indicating whether the user elected to include deleted channels when performing the api_channel_get_by_name_and_teamName event."
    type: yesno
    sql: ${TABLE}.include_deleted ;;
    hidden: no
  }

  dimension: role {
    group_label: "Add/Remove Role Event Attributes"
    description: "The role that was added and/or removed via the add_roles and remove_roles event performed by the user/system admin."
    type: string
    sql: ${TABLE}.role ;;
    hidden: yes
  }

  dimension: privacy {
    group_label: "Update Channel Privacy Event Attributes"
    label: "Privacy Settings"
    description: "The privacy setting selected by the user performing the api_channels_update_privacy event."
    type: string
    sql: CASE WHEN ${TABLE}.privacy = 'O' THEN 'Open'
              WHEN ${TABLE}.privacy = 'P' THEN 'Private'
              ELSE ${TABLE}.privacy END ;;
    hidden: no
  }

  dimension: scheme_id {
    description: "The unique scheme id associated with the scheme being patched or updated by the api_schemes_patch and api_teams_update_scheme events."
    type: string
    sql: ${TABLE}.scheme_id ;;
    hidden: no
  }

  dimension: channelsids {
    group_label: "Channel Attributes"
    description: ""
    type: string
    sql: ${TABLE}.channelsids ;;
    hidden: no
  }

  dimension: channel_ids {
    group_label: "Channel Attributes"
    description: ""
    type: string
    sql: ${TABLE}.channel_ids ;;
    hidden: no
  }

  dimension: from_page {
    description: "The source of the in-product api_request_trial_license event performed by the user (i.e. license, ldap, or saml page)."
    type: string
    sql: ${TABLE}.from_page ;;
    hidden: no
  }

  dimension: context_compiled {
    group_label: "Context Attributes"
    description: ""
    type: yesno
    sql: ${TABLE}.context_compiled ;;
    hidden: yes
  }

  dimension: context_terminators_lastindex {
    group_label: "Context Attributes"
    description: ""
    type: number
    sql: ${TABLE}.context_terminators_lastindex ;;
    hidden: yes
  }

  dimension: context_contains {
    group_label: "Context Attributes"
    description: ""
    type: string
    sql: ${TABLE}.context_contains ;;
    hidden: yes
  }

  dimension: context_relevance {
    group_label: "Context Attributes"
    description: ""
    type: number
    sql: ${TABLE}.context_relevance ;;
    hidden: yes
  }

  dimension: warnmetricid {
    group_label: "Warn Metric: Active User Attributes"
    label: "Warn Metric ID"
    description: "A string identifying the warn metric that appeared to the user before performing the api_request_send_metric_ack event acknowledging they've seen the warning notifying them of their active user overage."
    type: string
    sql: ${TABLE}.warnmetricid ;;
    hidden: no
  }

  dimension: metric {
    group_label: "Warn Metric: Active User Attributes"
    description: "The active user warn metric that appeared to the user before they performed the click_warn_metric_bot_id or click_warn_metric_contact_us event (i.e. > 200, > 400, or > 500 active users)."
    type: string
    sql: ${TABLE}.metric ;;
    hidden: no
  }

  dimension: context_traits_cross_domain_id {
    group_label: "Context Attributes"
    description: "?"
    label: "Cross Domain ID"
    type: string
    sql: ${TABLE}.context_traits_cross_domain_id ;;
    hidden: no
  }

  dimension: context_amp_id {
    group_label: "Context Attributes"
    description: "?"
    label: "Amp ID"
    type: string
    sql: ${TABLE}.context_amp_id ;;
    hidden: no
  }

  dimension: channel_name {
    group_label: "Get Channel Event Attributes"
    description: "The name of the channel selected by the user when performing the api_channel_get_by_name_and_teamName event."
    type: string
    sql: ${TABLE}.channel_name ;;
    hidden: no
  }

  dimension: context_campaign_medium {
    group_label: "Marketing Campaign Attributes"
    label: "Campaign Medium"
    description: ""
    type: string
    sql: ${TABLE}.context_campaign_medium ;;
    hidden: no
  }

  dimension: context_campaign_source {
    group_label: "Marketing Campaign Attributes"
    label: "Campaign Source"
    description: ""
    type: string
    sql: ${TABLE}.context_campaign_source ;;
    hidden: no
  }

  dimension: team_name {
    group_label: "Get Channel Event Attributes"
    description: "The team name of the channel selected by the user performing the api_channel_get_by_name_and_teamName event."
    type: string
    sql: ${TABLE}.team_name ;;
    hidden: no
  }

  dimension: channel_id_tid {
    group_label: "Channel Attributes"
    description: ""
    type: string
    sql: ${TABLE}.channel_id_tid ;;
    hidden: no
  }

  dimension: context_campaign_name {
    group_label: "Marketing Campaign Attributes"
    label: "Campaign Name"
    description: ""
    type: string
    sql: ${TABLE}.context_campaign_name ;;
    hidden: no
  }

  dimension: channel_id_value {
    group_label: "Channel Attributes"
    description: ""
    type: string
    sql: ${TABLE}.channel_id_value ;;
    hidden: no
  }

  dimension: context_campaign_content {
    group_label: "Marketing Campaign Attributes"
    label: "Campaign Content"
    description: ""
    type: string
    sql: ${TABLE}.context_campaign_content ;;
    hidden: no
  }

  dimension: context_campaign_term {
    group_label: "Marketing Campaign Attributes"
    description: ""
    label: "Campaign Term"
    type: string
    sql: ${TABLE}.context_campaign_term ;;
    hidden: no
  }

  dimension: segment_dedupe_id {
    description: ""
    type: string
    sql: ${TABLE}.segment_dedupe_id ;;
    hidden: yes
  }

  dimension: context_user_agent {
    label: "User Agent"
    description: "The User Agent of the user performing the event."
    type: string
    sql: COALESCE(${TABLE}.context_user_agent, ${context_useragent}) ;;
    hidden: no
  }

  dimension: context_server {
    group_label: "Context Attributes"
    description: ""
    type: string
    sql: ${TABLE}.context_server ;;
    hidden: yes
  }

  dimension: context_device_os {
    group_label: "User Agent Attributes"
    description: "The operating system of the user performing the event."
    label: "Operating System"
    type: string
    sql: ${TABLE}.context_device_os ;;
    hidden: yes
  }

  dimension: context_device_is_tablet {
    group_label: "Context Attributes"
    description: ""
    type: yesno
    sql: ${TABLE}.context_device_is_tablet ;;
    hidden: yes
  }

  dimension: context_device_dimensions_height {
    group_label: "Context Attributes"
    description: ""
    type: number
    sql: ${TABLE}.context_device_dimensions_height ;;
    hidden: yes
  }

  dimension: context_device_dimensions_width {
    group_label: "Context Attributes"
    description: ""
    type: number
    sql: ${TABLE}.context_device_dimensions_width ;;
    hidden: yes
  }

  dimension: timestamp {
    type: date_time
    sql: ${TABLE}.timestamp ;;
    hidden: no
  }

  dimension: password_requirements {
    type: string
    sql: ${TABLE}.password_requirements ;;
    hidden: no
  }

  dimension: oauth_provider {
    type: string
    sql: ${TABLE}.oauth_provider ;;
    hidden: no
  }

  dimension: context_traits_use_oauth {
    description: "Context Traits Use OAUTH"
    type: string
    sql: ${TABLE}.context_traits_use_oauth ;;
    hidden: no
  }



  dimension: first {
    description: "First"
    group_label: "Selector Dimensions"
    type: string
    sql: ${TABLE}.first ;;
    hidden: no
  }

  dimension: second {
    description: "Second"
    group_label: "Selector Dimensions"
    type: string
    sql: ${TABLE}.second ;;
    hidden: no
  }

  dimension: third {
    description: "Third"
    group_label: "Selector Dimensions"
    type: string
    sql: ${TABLE}.third ;;
    hidden: no
  }

  dimension: first_effectiveness {
    description: "First Effectiveness"
    group_label: "Selector Metrics"
    type: string
    sql: ${TABLE}.first_effectiveness ;;
    hidden: yes
  }

  dimension: first_recomputations {
    description: "First Recomputations"
    group_label: "Selector Metrics"
    type: string
    sql: ${TABLE}.first_recomputations ;;
    hidden: yes
  }

  dimension: second_effectiveness {
    description: "Second Effectiveness"
    group_label: "Selector Metrics"
    type: string
    sql: ${TABLE}.second_effectiveness ;;
    hidden: yes
  }

  dimension: second_recomputations {
    description: "Second Recomputations"
    group_label: "Selector Metrics"
    type: string
    sql: ${TABLE}.second_recomputations ;;
    hidden: yes
  }

  dimension: third_effectiveness {
    description: "Third Effectiveness"
    group_label: "Selector Metrics"
    type: string
    sql: ${TABLE}.third_effectiveness ;;
    hidden: yes
  }

  dimension: third_recomputations {
    description: "Third Recomputations"
    group_label: "Selector Metrics"
    type: string
    sql: ${TABLE}.third_recomputations ;;
    hidden: yes
  }

  # DIMENSION GROUPS/DATES
  dimension_group: original_timestamp {
  description: ""
  type: time
  timeframes: [time, week, date, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.original_timestamp ;;
    hidden: yes
  }

  dimension_group: sent_at {
  description: ""
  type: time
    timeframes: [time, week, date, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.sent_at ;;
    hidden: yes
  }

  dimension_group: event {
    label: " Event"
  description: "The date and/or time groupings available to group the timestamps of the events performed by users."
  type: time
    timeframes: [raw, week, date, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.timestamp;;
    hidden: no
  }

  dimension: event_dayname {
    label: "Event Day Name"
    group_label: " Event Date"
    description: "The name of the day of the week that the event was performed on."
    type: string
    sql: dayname(${TABLE}.timestamp) ;;
    order_by_field: event_day
  }

  dimension: event_day {
    label: "Event Day #"
    group_label: " Event Date"
    description: "The number of the day of the week that the event was performed on."
    type: number
    sql: extract(dayofweek from ${TABLE}.timestamp)::int ;;
    hidden: yes
  }

  dimension: event_week_of_year {
    label: "Event Week #"
    group_label: " Event Date"
    description: "The number of the week in the year that the event was performed on."
    type: number
    sql: weekiso(${TABLE}.timestamp)::int ;;
    hidden: no
  }

  dimension: priority {
    label: "Priority"
    description: "Priority of the message (empty, urgent or important)"
    type:  string
    sql: ${TABLE}.priority ;;
  }

  dimension: requested_ack {
    label: "Requested Acknowledge"
    description: "Whether the sender requested acknowledge"
    type:  yesno
    sql: ${TABLE}.requested_ack ;;
  }

  dimension_group: uuid_ts {
  description: ""
  type: time
  timeframes: [date, month, year]
    sql: ${TABLE}.uuid_ts ;;
    hidden: yes
  }

  dimension_group: received_at {
  description: "Received At"
  type: time
  timeframes: [raw, week, date, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.received_at ;;
    hidden: no
  }

  dimension_group: channel_id_timestamp {
  description: ""
  type: time
    timeframes: [time, week, date, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.channel_id_timestamp ;;
    hidden: no
  }

  dimension_group: active_user_date {
    label: "Active User"
    description: "Use with Active User/Instance Dimensions to enable Daily, Weekly & Monthly active user/instance functionality with this explore."
    type: time
    timeframes: [raw, date, week, month, year, fiscal_quarter, fiscal_year, day_of_week, fiscal_month_num,
      week_of_year, day_of_year, day_of_week_index, month_name, day_of_month, fiscal_quarter_of_year]
    sql: ${dates.date_raw};;

  }


  # MEASURES
  measure: count1 {
    label: "Count"
    description: "Count of rows/occurrences."
    type: number
    sql: coalesce(count(${id}),0) ;;
    drill_fields: [server_drill*]
  }

  measure: event_count {
    label: "  Event Count"
    description: "The distinct count of events within each grouping."
    type: count_distinct
    drill_fields: [server_drill*]
    sql: ${id} ;;
  }

  measure: anonymous_count {
    label: " Anonymous Count"
    description: "The distinct count of Anonymouss within each grouping."
    type: count_distinct
    sql: ${anonymous_id} ;;
    drill_fields: [server_drill*]
    hidden: yes
  }

  measure: context_device_count {
    label: " Context Device Count"
    description: "The distinct count of Context Devices within each grouping."
    type: count_distinct
    sql: ${context_device_id} ;;
    hidden: yes
  }

  measure: user_actual_count {
    label: "  User Count"
    description: "The distinct count of Users within each grouping."
    type: number
    sql: COALESCE(COUNT(DISTINCT COALESCE(${user_actual_id}, ${context_traits_portal_customer_id}, ${anonymous_id})), 0) ;;
    drill_fields: [server_drill*]
  }

  measure: daily_active_users {
    group_label: "Active User Measures (DAU, WAU, MAU)"
    label: "Daily Active Users"
    description: "The count of daily active users on the given active user date."
    type: count_distinct
    sql: CASE WHEN ${active_user_date_date} = ${event_date} THEN ${user_actual_id} ELSE NULL END ;;
    drill_fields: [user_drill*]
  }

  measure: weekly_active_users {
    group_label: "Active User Measures (DAU, WAU, MAU)"
    label: "Weekly Active Users"
    description: "The count of Weekly active users on the given active user date."
    type: count_distinct
    sql: CASE WHEN ${event_date} <= ${active_user_date_raw} and ${event_date} >= ${active_user_date_raw} - interval '7 days'
          THEN ${user_actual_id} ELSE NULL END ;;
    drill_fields: [user_drill*]
  }


  measure: monthly_active_users {
    group_label: "Active User Measures (DAU, WAU, MAU)"
    label: "Monthly Active Users"
    description: "The count of monthly active users on the given active user date."
    type: count_distinct
    sql: ${user_actual_id} ;;
    drill_fields: [user_drill*]
  }

  measure: daily_active_instances {
    group_label: "Active Instance Measures (DAI, WAI, MAI)"
    label: "Daily Active Instances"
    description: "The count of daily active instances on the given active user date."
    type: count_distinct
    sql: CASE WHEN ${active_user_date_date} = ${event_date} THEN ${user_id} ELSE NULL END ;;
  }

  measure: weekly_active_instances {
    group_label: "Active Instance Measures (DAI, WAI, MAI)"
    label: "Weekly Active Instances"
    description: "The count of Weekly active instances on the given active user date."
    type: count_distinct
    sql: CASE WHEN ${event_date} <= ${active_user_date_date} and ${event_date} >= ${active_user_date_date} - interval '7 days'
            THEN ${user_id} ELSE NULL END ;;
  }

  measure: monthly_active_instances {
    group_label: "Active Instance Measures (DAI, WAI, MAI)"
    label: "Monthly Active Instances"
    description: "The count of monthly active instances on the given active user date."
    type: count_distinct
    sql: CASE WHEN ${active_user_date_raw} IS NOT NULL THEN ${user_id} ELSE NULL END ;;
  }

  measure: user_count {
    label: "  Server Count"
    description: "The distinct count of Servers within each grouping."
    type: count_distinct
    sql: ${user_id} ;;
    drill_fields: [server_drill*]
  }

  measure: context_traits_count {
    label: " Context Traits Count"
    description: "The distinct count of Context Traitss within each grouping."
    type: count_distinct
    sql: ${context_traits_id} ;;
  }

  measure: channel_count {
    label: " Channel Count"
    description: "The distinct count of Channels within each grouping."
    type: count_distinct
    sql: ${channel_id} ;;
    drill_fields: [server_drill*]
  }

  measure: subscription_count {
    label: " Subscription Count"
    description: "The distinct count of Subscriptions within each grouping."
    type: count_distinct
    sql: ${subscription_id} ;;
    drill_fields: [server_drill*]
  }

  measure: context_traits_portal_customer_count {
    label: " Context Traits Portal Customer Count"
    description: "The distinct count of Context Traits Portal Customers within each grouping."
    type: count_distinct
    sql: coalesce(${context_traits_portal_customer_id}, ${portal_customer_id}) ;;
    drill_fields: [server_drill*]
  }

  measure: root_count {
    label: "  Reply Count"
    description: "The distinct count of Replies to a thread within each grouping."
    type: count_distinct
    sql: CASE WHEN ${type} = 'api_posts_replied' THEN ${id} ELSE NULL END;;
    drill_fields: [server_drill*]
  }

  measure: thread_count {
    label: "  Thread Count"
    description: "The distinct count of threads created within each grouping."
    type: count_distinct
    sql: CASE WHEN ${type} = 'api_posts_replied' THEN ${root_id} ELSE NULL END;;
    drill_fields: [server_drill*]
  }

  measure: post_count {
    label: "  Post Count"
    description: "The distinct count of Posts, including replies to threads, within each grouping."
    type: number
    sql: COUNT(CASE WHEN ${type} = 'api_posts_create' THEN ${id} ELSE NULL END) ;;
    drill_fields: [server_drill*]
  }

  measure: post_no_reply_count {
    label: "  Post Count (No Replies)"
    description: "The distinct count of Posts, including replies to threads, within each grouping."
    type: number
    sql: COUNT(CASE WHEN ${type} = 'api_posts_create' AND (nullif(${root_id}, '') IS NULL or ${root_id} = ${post_id}) THEN ${id} ELSE NULL END) ;;
    drill_fields: [server_drill*]
  }

  measure: post_edits_count {
    label: "  Edit Post Count"
    description: "The distinct count of Posts, including replies to threads, within each grouping."
    type: number
    sql: COUNT(CASE WHEN ${type} = 'api_posts_patch' THEN ${id} ELSE NULL END) ;;
    drill_fields: [server_drill*]
  }

  measure: post_reaction_count {
    label: "  Reaction Count"
    description: "The distinct count of Posts, including replies to threads, within each grouping."
    type: number
    sql: COUNT(CASE WHEN ${type} = 'api_reactions_save' THEN ${id} ELSE NULL END);;
  }

  measure: custom_emojis_added {
    label: "  Custom Emojis Added Count"
    description: "The distinct count of custom emojis added within each grouping."
    type: number
    sql: COUNT(CASE WHEN ${type} = 'api_emoji_custom_add' THEN ${id} ELSE NULL END);;
  }

  measure: team_count {
    label: "  Team Count"
    description: "The distinct count of Teams within each grouping."
    type: count_distinct
    sql: ${team_id} ;;
    drill_fields: [server_drill*]
  }

  measure: views {
    label: "Gif Views"
    description: "The sum of gif views by users w/in each grouping."
    type: number
    sql: COUNT(CASE WHEN ${type} = 'views' THEN ${id} ELSE NULL END) ;;
    drill_fields: [server_drill*]
  }

  measure: batch_add_members_sum {
    group_label: "Batch Add Members Measures"
    label: "Batch Add Members (Sum)"
    description: "The sum of new members batch added to (group or team?) by users w/in each grouping."
    type: number
    sql: COALESCE(SUM(CASE WHEN ${type} = 'api_teams_batch_add_members' THEN ${count} ELSE NULL END),0) ;;
    drill_fields: [server_drill*]
  }

  measure: batch_add_members_avg {
    group_label: "Batch Add Members Measures"
    label: "Batch Add Members (Avg)"
    description: "The average of new members batch added to (group or team?) per api_teams_batch_add_members event by users w/in each grouping."
    type: average
    sql: CASE WHEN ${type} = 'api_teams_batch_add_members' THEN ${count} ELSE NULL END ;;
    drill_fields: [server_drill*]
  }

  measure: batch_add_members_median {
    group_label: "Batch Add Members Measures"
    label: "Batch Add Members (Median)"
    description: "The median of new members batch added to (group or team?) per api_teams_batch_add_members event by users w/in each grouping."
    type: median
    sql: CASE WHEN ${type} = 'api_teams_batch_add_members' THEN ${count} ELSE NULL END ;;
    drill_fields: [server_drill*]
  }

  measure: members_removed_from_team_sum {
    group_label: "Admin Team Configuration Measures"
    label: "Members Removed From Team (Sum)"
    description: "The sum of members removed from a team w/in each grouping."
    type: number
    sql: COALESCE(SUM(CASE WHEN ${type} = 'members_removed_from_team' THEN ${count} ELSE NULL END),0) ;;
    drill_fields: [server_drill*]
  }

  measure: members_removed_from_team_avg {
    group_label: "Admin Team Configuration Measures"
    label: "Members Removed From Team (Avg)"
    description: "The average # of members removed from teams per members_removed_from_team event by users w/in each grouping."
    type: average
    sql: CASE WHEN ${type} = 'members_removed_from_team' THEN ${count} ELSE NULL END ;;
    drill_fields: [server_drill*]
  }

  measure: members_removed_from_team_median {
    group_label: "Admin Team Configuration Measures"
    label: "Members Removed From Team (Median)"
    description: "The median # of members removed from teams per members_removed_from_team event by users w/in each grouping."
    type: median
    sql: CASE WHEN ${type} = 'members_removed_from_team' THEN ${count} ELSE NULL END ;;
    drill_fields: [server_drill*]
  }

  measure: groups_added_to_team_sum {
    group_label: "Admin Team Configuration Measures"
    label: "Groups Added To Team (Sum)"
    description: "The sum of groups added to teams w/in each grouping."
    type: sum
    sql: CASE WHEN ${type} = 'groups_added_to_team' THEN ${count} ELSE NULL END ;;
    drill_fields: [server_drill*]
  }

  measure: groups_added_to_team_avg {
    group_label: "Admin Team Configuration Measures"
    label: "Groups Added To Team (Avg)"
    description: "The average # of groups added to teams per groups_added_to_team event by users w/in each grouping."
    type: average
    sql: CASE WHEN ${type} = 'groups_added_to_team' THEN ${count} ELSE NULL END ;;
    drill_fields: [server_drill*]
  }

  measure: groups_added_to_team_median {
    group_label: "Admin Team Configuration Measures"
    label: "Groups Added To Team (Median)"
    description: "The median # of groups added to teams per groups_added_to_team event by users w/in each grouping."
    type: median
    sql: CASE WHEN ${type} = 'groups_added_to_team' THEN ${count} ELSE NULL END ;;
    drill_fields: [server_drill*]
  }

  measure: groups_removed_from_team_sum {
    group_label: "Admin Team Configuration Measures"
    label: "Groups Removed From Team (Sum)"
    description: "The sum of groups removed from teams w/in each grouping."
    type: sum
    sql: CASE WHEN ${type} = 'groups_removed_from_team' THEN ${count} ELSE NULL END ;;
    drill_fields: [server_drill*]
  }

  measure: groups_removed_from_team_avg {
    group_label: "Admin Team Configuration Measures"
    label: "Groups Removed From Team (Avg)"
    description: "The average # of groups removed from teams per groups_removed_from_team event by users w/in each grouping."
    type: average
    sql: CASE WHEN ${type} = 'groups_removed_from_team' THEN ${count} ELSE NULL END ;;
    drill_fields: [server_drill*]
  }

  measure: groups_removed_from_team_median {
    group_label: "Admin Team Configuration Measures"
    label: "Groups Removed From Team (Median)"
    description: "The median # of groups removed from teams per groups_added_to_team event by users w/in each grouping."
    type: median
    sql: CASE WHEN ${type} = 'groups_removed_from_team' THEN ${count} ELSE NULL END ;;
    drill_fields: [server_drill*]
  }

  measure: members_added_to_team_sum {
    group_label: "Admin Team Configuration Measures"
    label: "Members Added To Team (Sum)"
    description: "The sum of members added to teams w/in each grouping."
    type: number
    sql: COALESCE(SUM(CASE WHEN ${type} = 'members_added_to_team' THEN ${count} ELSE NULL END),0) ;;
    drill_fields: [server_drill*]
  }

  measure: members_added_to_team_avg {
    group_label: "Admin Team Configuration Measures"
    label: "Members Added To Team (Avg)"
    description: "The average # of members added to teams per members_added_to_team event by users w/in each grouping."
    type: average
    sql: CASE WHEN ${type} = 'members_added_to_team' THEN ${count} ELSE NULL END ;;
    drill_fields: [server_drill*]
  }

  measure: members_added_to_team_median {
    group_label: "Admin Team Configuration Measures"
    label: "Members Added To Team (Median)"
    description: "The median # of members added to teams per members_added_to_team event by users w/in each grouping."
    type: median
    sql: CASE WHEN ${type} = 'members_added_to_team' THEN ${count} ELSE NULL END ;;
    drill_fields: [server_drill*]
  }

  measure: members_elevated_to_team_admin_sum {
    group_label: "Admin Team Configuration Measures"
    label: "Members Elevated To Team Admin (Sum)"
    description: "The sum of members elevated to team admin w/in each grouping."
    type: sum
    sql: CASE WHEN ${type} = 'members_elevated_to_team_admin' THEN ${count} ELSE NULL END ;;
    drill_fields: [server_drill*]
  }

  measure: members_elevated_to_team_admin_avg {
    group_label: "Admin Team Configuration Measures"
    label: "Members Elevated To Team Admin (Avg)"
    description: "The average # of members elevated to team admin per members_elevated_to_team_admin event by users w/in each grouping."
    type: average
    drill_fields: [server_drill*]
    sql: CASE WHEN ${type} = 'members_elevated_to_team_admin' THEN ${count} ELSE NULL END ;;
  }

  measure: members_elevated_to_team_admin_median {
    group_label: "Admin Team Configuration Measures"
    label: "Members Elevated To Team Admin (Median)"
    description: "The median # of members elevated to team admin per members_elevated_to_team_admin event by users w/in each grouping."
    type: median
    sql: CASE WHEN ${type} = 'members_elevated_to_team_admin' THEN ${count} ELSE NULL END ;;
    drill_fields: [server_drill*]
  }


  measure: count_max {
    description: "The max. count of direct messages appearing in a user lefthand sidebar within each grouping."
    type: max
    group_label: "  LHS DM Count Measures"
    label: "LHS DM Count (Max)"
    sql: CASE WHEN ${type} = 'LHS_DM_GM_Count' THEN ${count} ELSE NULL END ;;
  }

  measure: count_min {
    description: "The min. count of direct messages appearing in a user lefthand sidebar within each grouping."
    type: min
    group_label: "  LHS DM Count Measures"
    label: "LHS DM Count (Min)"
    sql: CASE WHEN ${type} = 'LHS_DM_GM_Count' THEN ${count} ELSE NULL END ;;
  }

  measure: count_avg {
    description: "The average count of direct messages appearing in a user lefthand sidebar within each grouping."
    type: average
    group_label: "  LHS DM Count Measures"
    label: "LHS DM Count (Avg)"
    sql: CASE WHEN ${type} = 'LHS_DM_GM_Count' THEN ${count} ELSE NULL END ;;
  }

  measure: count_median {
    description: "The median count of direct messages appearing in a user lefthand sidebar within each grouping."
    type: median
    group_label: "  LHS DM Count Measures"
    label: "LHS DM Count (Median)"
    sql: CASE WHEN ${type} = 'LHS_DM_GM_Count' THEN ${count} ELSE NULL END ;;
  }

  measure: plugin_added_count {
    label: " Plugin Downloads"
    description: "The distinct count of Plugin download events performed within each grouping."
    type: number
    sql: COALESCE(COUNT(DISTINCT CASE WHEN ${type} = 'ui_marketplace_download' then ${id} ELSE NULL END),0) ;;
  }

  measure: plugin_updates_count {
    label: " Plugin Updates"
    description: "The distinct count of Plugin update events performed within each grouping."
    type: number
    sql: COALESCE(COUNT(DISTINCT CASE WHEN ${type} = 'ui_marketplace_download_update' then ${id} ELSE NULL END),0) ;;
  }

  measure: scheme_count {
    label: " Scheme Count"
    description: "The distinct count of Schemes within each grouping."
    type: count_distinct
    sql: ${scheme_id} ;;
  }

  measure: channels_count {
    label: " Channels Count"
    description: "The distinct count of Channelss within each grouping."
    type: count_distinct
    sql: ${channel_ids} ;;
  }

  measure: context_traits_cross_domain_count {
    label: " Context Traits Cross Domain Count"
    description: "The distinct count of Context Traits Cross Domains within each grouping."
    type: count_distinct
    sql: ${context_traits_cross_domain_id} ;;
  }

  measure: context_amp_count {
    label: " Context Amp Count"
    description: "The distinct count of Context Amps within each grouping."
    type: count_distinct
    sql: ${context_amp_id} ;;
  }

  measure: channel_tid_count {
    label: " Channel Tid Count"
    description: "The distinct count of Channels Tid within each grouping."
    type: count_distinct
    sql: ${channel_id_tid} ;;
  }

  measure: channel_value_count {
    label: " Channel Value Count"
    description: "The distinct count of Channels Value within each grouping."
    type: count_distinct
    sql: ${channel_id_value} ;;
  }

  measure: segment_dedupe_count {
    label: " Segment Dedupe Count"
    description: "The distinct count of Segment Dedupes within each grouping."
    type: count_distinct
    sql: ${segment_dedupe_id} ;;
  }

  measure: duration_avg {
    group_label: "  Duration Measures"
    description: "The average time, in milliseconds, for the event to complete (only for page_load, channel_switch, and team_switch events)."
    type: average
    sql: ${duration} ;;
    hidden: no
  }

  measure: duration_median {
    group_label: "  Duration Measures"
    description: "The median time, in milliseconds, for the event to complete (only for page_load, channel_switch, and team_switch events)."
    type: median
    sql: ${duration} ;;
    hidden: no
  }

  measure: first_triggered {
    label: "First Triggered"
    description: "The date & time the event was first triggered."
    type: date_time
    sql: MIN(${TABLE}.timestamp) ;;
  }

  measure: last_triggered {
    label: "Last Triggered"
    description: "The date & time the event was last triggered."
    type: date_time
    sql: MAX(${TABLE}.timestamp) ;;
  }


  measure: first_effectiveness_avg {
    description: "First Effectiveness Avg"
    group_label: "Selector Measures"
    type: number
    sql: ROUND(AVG(${first_effectiveness}),2) ;;
    hidden: no
  }
  measure: first_recomputations_sum {
    description: "First Recomputations Sum"
    group_label: "Selector Measures"
    type: number
    sql: ROUND(SUM(${first_recomputations}),2) ;;
    hidden: no
  }

  measure: second_effectiveness_avg {
    description: "Second Effectiveness Avg"
    group_label: "Selector Measures"
    type: number
    sql: ROUND(AVG(${first_effectiveness}),2) ;;
    hidden: no
  }
  measure: second_recomputations_sum {
    description: "Second Recomputations Sum"
    group_label: "Selector Measures"
    type: number
    sql: ROUND(SUM(${first_recomputations}),2) ;;
    hidden: no
  }

  measure: third_effectiveness_avg {
    description: "Third Effectiveness Avg"
    group_label: "Selector Measures"
    type: number
    sql: ROUND(AVG(${first_effectiveness}),2) ;;
    hidden: no
  }
  measure: third_recomputations_sum {
    description: "Third Recomputations Sum"
    group_label: "Selector Measures"
    type: number
    sql: ROUND(SUM(${first_recomputations}),2) ;;
    hidden: no
  }


}
