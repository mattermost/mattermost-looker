view: server_fact {
  sql_table_name: mattermost.server_fact ;;
  view_label: "Server Fact"

  set: drill_set1 {
    fields: [server_id, license_server_fact.customer_name, first_active_date, last_active_date, quality_score,
      max_registered_users, dau, current_mau, admin_events_alltime, signup_events_alltime, signup_email_events_alltime,
      tutorial_events_alltime, post_events_alltime, invite_members_alltime]
  }

  set: incident_collaboration {
    fields: [product_edition, server_count, server_id]
  }

  filter: license_all {
    type: string
    hidden: yes
  }


  dimension: quality_score {
    type: number
    description: "Quality Score of the account"
    sql: round(DIV0(${post_events_alltime},${max_registered_users}) * ${dau},0) ;;
  }

  dimension: product_edition {
    label: " Product Edition"
    description: "The Mattermost SKU associated with the server on the given logging date."
    type: string
    sql: CASE WHEN ${license_server_fact.edition_null} IS NOT NULL AND NOT ${license_server_fact.trial} THEN ${license_server_fact.edition}
                      WHEN ${license_server_fact.edition} = 'Mattermost Cloud' THEN 'Mattermost Cloud'
                      WHEN ${license_server_fact.edition} IS NOT NULL AND ${license_server_fact.trial} THEN 'E20 Trial'
                      WHEN ${license_server_fact.customer_id} is not null and NOT ${license_server_fact.trial} THEN 'E10'
                      ELSE ${server_edition}
                      END ;;
    order_by_field: product_edition_sort
  }

  dimension: product_edition_sort {
    label: " Product Edition"
    description: "The Mattermost SKU associated with the server on the given logging date."
    type: number
    hidden: yes
    sql: CASE WHEN CASE WHEN ${license_server_fact.edition} IS NOT NULL AND NOT ${license_server_fact.trial} THEN ${license_server_fact.edition}
                      WHEN ${license_server_fact.edition} = 'Mattermost Cloud' THEN 'Mattermost Cloud'
                      WHEN ${license_server_fact.edition} IS NOT NULL AND ${license_server_fact.trial} THEN 'E20 Trial'
                      WHEN ${license_server_fact.customer_id} is not null and NOT ${license_server_fact.trial} THEN 'E10'
                      ELSE ${server_edition}
                      END = 'E20' then 1
              WHEN CASE WHEN ${license_server_fact.edition} IS NOT NULL AND NOT ${license_server_fact.trial} THEN ${license_server_fact.edition}
                      WHEN ${license_server_fact.edition} = 'Mattermost Cloud' THEN 'Mattermost Cloud'
                      WHEN ${license_server_fact.edition} IS NOT NULL AND ${license_server_fact.trial} THEN 'E20 Trial'
                      WHEN ${license_server_fact.customer_id} is not null and NOT ${license_server_fact.trial} THEN 'E10'
                      ELSE ${server_edition}
                      END = 'E10' then 2
              WHEN CASE WHEN ${license_server_fact.edition} IS NOT NULL AND NOT ${license_server_fact.trial} THEN ${license_server_fact.edition}
                      WHEN ${license_server_fact.edition} = 'Mattermost Cloud' THEN 'Mattermost Cloud'
                      WHEN ${license_server_fact.edition} IS NOT NULL AND ${license_server_fact.trial} THEN 'E20 Trial'
                      WHEN ${license_server_fact.customer_id} is not null and NOT ${license_server_fact.trial} THEN 'E10'
                      ELSE ${server_edition}
                      END = 'E20 Trial' then 3
              WHEN CASE WHEN ${license_server_fact.edition} IS NOT NULL AND NOT ${license_server_fact.trial} THEN ${license_server_fact.edition}
                      WHEN ${license_server_fact.edition} = 'Mattermost Cloud' THEN 'Mattermost Cloud'
                      WHEN ${license_server_fact.edition} IS NOT NULL AND ${license_server_fact.trial} THEN 'E20 Trial'
                      WHEN ${license_server_fact.customer_id} is not null and NOT ${license_server_fact.trial} THEN 'E10'
                      ELSE ${server_edition}
                      END = 'E0' then 4
              WHEN CASE WHEN ${license_server_fact.edition} IS NOT NULL AND NOT ${license_server_fact.trial} THEN ${license_server_fact.edition}
                      WHEN ${license_server_fact.edition} = 'Mattermost Cloud' THEN 'Mattermost Cloud'
                      WHEN ${license_server_fact.edition} IS NOT NULL AND ${license_server_fact.trial} THEN 'E20 Trial'
                      WHEN ${license_server_fact.customer_id} is not null and NOT ${license_server_fact.trial} THEN 'E10'
                      ELSE ${server_edition}
                      END = 'Mattermost Cloud' then 5
              WHEN CASE WHEN ${license_server_fact.edition} IS NOT NULL AND NOT ${license_server_fact.trial} THEN ${license_server_fact.edition}
                      WHEN ${license_server_fact.edition} = 'Mattermost Cloud' THEN 'Mattermost Cloud'
                      WHEN ${license_server_fact.edition} IS NOT NULL AND ${license_server_fact.trial} THEN 'E20 Trial'
                      WHEN ${license_server_fact.customer_id} is not null and NOT ${license_server_fact.trial} THEN 'E10'
                      ELSE ${server_edition}
                      END = 'TE' then 6
              ELSE 7 END
                      ;;
  }

  dimension: retention_28day_flag {
    label: " 28-Day Retention"
    group_label: " Telemetry Flags"
    description: "Boolean indicating the instance was retained after 28 days since their first active date. This metric is a flag indicating users performed events between hour 672 and 696 from the instance's first active timestamp."
    type: yesno
    sql: COALESCE(${TABLE}.retention_28day_flag, false) ;;
  }

  dimension: retention_1day_flag {
    label: "1-Day Retention"
    group_label: "Telemetry Flags"
    description: "Boolean indicating the instance was retained after 1 days since their first active date. This metric is a flag indicating users performed events between hour 24 and 48 from the instance's first active timestamp."
    type: yesno
    sql: COALESCE(${TABLE}.retention_1day_flag, false) ;;
  }

  dimension: dev_testing_enabled {
    label: "Dev/Test Mode Enabled"
    group_label: " Telemetry Flags"
    description: "Boolean indicating the instance has developer services or testing enabled in their configuration settings. Indicative of a non-production instance."
    type: yesno
    sql: COALESCE(${TABLE}.dev_testing_enabled, false) ;;
  }

  dimension: retention_28day_users {
    label: " 28-Day Retained Users"
    group_label: "User Event Dimensions"
    description: "Number indicating the count of instance users that were retained after 28 days since their first active date. This count indicates the users performed events between hour 672 and 696 hours from the instance's first active timestamp."
    type: number
    sql: COALESCE(${TABLE}.retention_28day_users, 0) ;;
    value_format_name: decimal_0
  }

  dimension: retention_1day_users {
    label: " 1-Day Retained Users"
    group_label: "User Event Dimensions"
    description: "Number indicating the count of instance users that were retained after 1 days since their first active date. This count indicates the users performed events between hour 24 and 48 hours from the instance's first active timestamp."
    type: number
    sql: COALESCE(${TABLE}.retention_1day_users, 0) ;;
    value_format_name: decimal_0
  }

  dimension: retention_7day_flag {
    label: "7-Day Retention"
    group_label: "Telemetry Flags"
    description: "Boolean indicating the instance was retained after 7 days since their first active date. This metric is a flag indicating users performed events between hour 168 and 192 from the instance's first active timestamp."
    type: yesno
    sql: COALESCE(${TABLE}.retention_7day_flag, false) ;;
  }

  dimension: retention_7day_users {
    label: " 7-Day Retained Users"
    group_label: "User Event Dimensions"
    description: "Number indicating the count of instance users that were retained after 7 days since their first active date. This count indicates the users performed events between hour 168 and 192 hours from the instance's first active timestamp."
    type: number
    sql: COALESCE(${TABLE}.retention_7day_users, 0) ;;
    value_format_name: decimal_0
  }

  dimension: retention_14day_flag {
    label: "14-Day Retention"
    group_label: "Telemetry Flags"
    description: "Boolean indicating the instance was retained after 14 days since their first active date. This metric is a flag indicating users performed events between hour 336 and 360 from the instance's first active timestamp."
    type: yesno
    sql: COALESCE(${TABLE}.retention_14day_flag, false) ;;
  }

  dimension: retention_14day_users {
    label: " 14-Day Retained Users"
    group_label: "User Event Dimensions"
    description: "Number indicating the count of instance users that were retained after 14 days since their first active date. This count indicates the users performed events between hour 336 and 360 hours from the instance's first active timestamp."
    type: number
    sql: COALESCE(${TABLE}.retention_14day_users, 0) ;;
    value_format_name: decimal_0
  }

  dimension: retention_0day_flag {
    label: "0-Day Retention"
    group_label: "Telemetry Flags"
    description: "Boolean indicating the instance was retained in the first 24 hours since their first active date. This metric is a flag indicating users performed events between hour 0 and 24 from the instance's first active timestamp."
    type: yesno
    sql: COALESCE(${TABLE}.retention_0day_flag, false) ;;
  }

  dimension: retention_0day_users {
    label: " 0-Day Retained Users"
    group_label: "User Event Dimensions"
    description: "Number indicating the count of instance users that were retained in the first 24 hours since their first active date. This count indicates the users performed events between hour 0 and 24 hours from the instance's first active timestamp."
    type: number
    sql: COALESCE(${TABLE}.retention_0day_users, 0) ;;
    value_format_name: decimal_0
  }


  dimension_group: cloud_payment_method_added {
    label: "Cloud Payment Method Added"
    description: "The date/time the Mattermost Cloud Instance added its first payment method into our billing system."
    type: time
    timeframes: [time, date, week, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.cloud_payment_method_added ;;
  }

  dimension: license_id_filter {
    description: "The license ID1 & ID2 or condition filter for dashboard usage."
    sql: {% condition license_all %} ${license_id} {% endcondition %} OR  {% condition license_all %} ${license_id2} {% endcondition %};;
    type: yesno
    hidden: yes
  }

  dimension: installation_type {
    description: "The installation type of the server at time of build/install (i.e. docker, gitlab, omnibus, etc.)."
    sql: COALESCE(${TABLE}.installation_type, CASE WHEN ${gitlab_install} THEN 'gitlab' ELSE NULL END, case when ${cloud_server} then 'cloud' else null end, 'Other') ;;
    type: string
  }

  dimension: active_users_alltime {
    description: "The server has had >= 1 Active User during it's telemetry lifetime."
    label: ">= 1 Active Users During Lifetime"
    group_label: " Status & Activity Filters"
    type: yesno
    sql: CASE WHEN ${server_fact.max_active_user_count} > 0 THEN TRUE ELSE FALSE END ;;
  }

  dimension: dev_server {
    description: "Boolean that evaluates to true when the pluginversion is in alpha (i.e. not released to GA) or the server version has not yet been released."
    group_label: " Telemetry Flags"
    type: yesno
    sql: CASE WHEN ${server_id} IN  ('ctjqfcwp9ig6xnfdtxz3mgk7uy','g6mwsqa5yibutnqfggp67fbs1w', '4k15shdyrfr39m9h675xy1pssw')
            OR
            (regexp_substr(${version}, '^[0-9]{1,2}.{1}[0-9]{1,2}.{1}[0-9]{1,2}$') IS NULL
             AND
            regexp_substr(regexp_substr(${version},'^[0-9]{1,2}.{1}[0-9]{1,2}.{1}[0-9]{1,2}.{1}[0-9]{1,2}.{1}[0-9]{1,2}.{1}[0-9]{1,2}'), '[0-9]{0,}[.]{1}[0-9[{0,}[.]{1}[0-9]{0,}[.]{1}[0-9]{0,}$') IS NULL
            AND NOT ${cloud_server})
            THEN TRUE ELSE FALSE END ;;
  }

  dimension: max_mau {
    type: number
    sql: ${TABLE}.max_mau ;;
    hidden: yes
  }

  dimension: community_server {
    description: "Boolean indicating the server performing the event is the Mattermost Community server."
    group_label: " Telemetry Flags"
    type: yesno
    sql: CASE WHEN ${server_id} = '93mykbogbjfrbbdqphx3zhze5c' THEN TRUE ELSE FALSE END ;;
  }

  dimension: currently_sending_telemetry {
    group_label: " Status & Activity Filters"
    description: "True when server has recently sent telemetry (w/in 5 days) and/or has a paid license w/ an expire date >= Current Date (this is an assumption that they're actively using the product, but are protected behind a firewall or airgap network). "
    type: yesno
    sql: CASE WHEN datediff(DAY, ${first_active_date}, ${last_active_date}) >= 7 AND ${last_active_date} >= (SELECT MAX(last_active_date - interval '5 day') FROM mattermost.server_fact) THEN TRUE
        WHEN (datediff(DAY, ${first_active_date}, ${last_active_date}) < 7 AND datediff(DAY, ${first_active_date}, ${last_active_date}) >= 3) AND ${last_active_date} >= (SELECT MAX(last_active_date - INTERVAL '1 DAY') FROM mattermost.server_fact) THEN TRUE
        WHEN (datediff(DAY, ${first_active_date}, ${last_active_date}) < 3) AND ${last_active_date} = (SELECT MAX(last_active_date) FROM mattermost.server_fact) THEN TRUE
         WHEN ${paid_license_expire_date} >= CURRENT_DATE THEN TRUE
          ELSE FALSE END ;;
  }

  dimension: has_post_events {
    label: ">= 1 Posts (All Time)"
    group_label: " Status & Activity Filters"
    description: "Server has had >= 1 posts created during its lifetime (user-based 'api_posts_create' event)."
    type: yesno
    sql: ${post_events_alltime} >= 1 ;;
  }

  dimension: has_request_trial_events {
    label: ">= 1 Request Trial Event (All Time)"
    group_label: " Status & Activity Filters"
    description: "Server has had >= 1 'API Request Trial Event' triggered during its lifetime i.e. a system admin has requested to trial Mattermost via the in-app request trial button."
    type: yesno
    sql: ${post_events_alltime} >= 1 ;;
  }

  dimension: has_signup_events {
    label: ">= 1 Signup Events (All Time)"
    group_label: " Status & Activity Filters"
    description: "Server has had >= 1 Signup Events during its lifetime (user-based 'api_posts_create' event)."
    type: yesno
    sql: ${signup_events_alltime} >= 1 ;;
  }

  dimension: boards {
    label: "Total Boards"
    group_label: "Boards"
    type: number
    sql: ${TABLE}.boards ;;
  }

  dimension: boards_views {
    label: "Total Boards Views"
    group_label: "Boards"
    type: number
    sql: ${TABLE}.boards_views ;;
  }

  dimension: boards_cards {
    label: "Total Boards Cards"
    group_label: "Boards"
    type: number
    sql: ${TABLE}.boards_cards ;;
  }

  dimension: has_signup_email_events {
    label: ">= 1 Signup Email Events (All Time)"
    group_label: " Status & Activity Filters"
    description: "Server has had >= 1 Signup Email Events during its lifetime (user-based 'api_posts_create' event)."
    type: yesno
    sql: ${signup_email_events_alltime} >= 1 ;;
  }

  dimension: has_admin_events {
    label: ">= 1 Admin Events (All Time)"
    group_label: " Status & Activity Filters"
    description: "Server has had >= 1 Admin Events during its lifetime (user-based 'api_posts_create' event)."
    type: yesno
    sql: ${admin_events_alltime} >= 1 ;;
  }

  dimension: has_tutorial_events {
    label: ">= 1 Tutorial Events (All Time)"
    group_label: " Status & Activity Filters"
    description: "Server has had >= 1 Tutorial Events during its lifetime (user-based 'api_posts_create' event)."
    type: yesno
    sql: ${tutorial_events_alltime} >= 1 ;;
  }

  dimension: has_invite_events {
    label: ">= 1 Invite Member Events (All Time)"
    group_label: " Status & Activity Filters"
    description: "Server has had >= 1 Invite Member Events during its lifetime (user-based 'api_posts_create' event)."
    type: yesno
    sql: ${invite_members_alltime} >= 1 ;;
  }

  dimension: engaged {
    description: "Boolean indicating the instance users have engaged with the server or workspace beyond just standing it up and/or creating it i.e. performed any events, downloaded plugins, etc."
    group_label: " Status & Activity Filters"
    type: yesno
    sql: ${admin_events_alltime} >= 1 OR ${invite_members_alltime} >= 1 OR ${tutorial_events_alltime} >= 1 OR ${post_events_alltime} >= 1 OR ${signup_events_alltime} >= 1 OR ${signup_email_events_alltime} >= 1 OR ${plugins_downloaded} >= 1
      OR ${days_active}::float/NULLIF((${days_active} + ${days_inactive}), 0)::float >= .3;;
  }

  # Dimensions
  dimension: server_id {
    label: "  Instance ID"
    description: "The telemetry id associated with each distinct Mattermost Instance (Server/Cloud Workspace)."
    type: string
    sql: ${TABLE}.server_id ;;
    primary_key: yes
  }

  dimension: installation_id {
    label: "Installation ID"
    description: "The unique ID provided to cloud servers."
    type: string
    sql: ${TABLE}.installation_id ;;
  }

  dimension: storage_bytes {
    label: "Storage in Bytes"
    description: "The file storage used per instance, rounded with (at most) 8 trailing zeros."
    type: number
    sql: ${TABLE}.storage_bytes ;;
  }

  dimension: cloud_server {
    label: "   Cloud Workspace"
    description: "Indicates whether the server is using Mattermost's cloud product."
    type: yesno
    sql: CASE WHEN ${TABLE}.installation_id IS NOT NULL THEN TRUE ELSE FALSE END ;;
  }

  dimension: plugins_downloaded {
    label: " Plugins Downloaded"
    group_label: "Plugin Dimensions"
    description: "The distinct count of plugins downloaded by users on the server/cloud workspace."
    type: number
    value_format_name: decimal_0
    sql: COALESCE(${TABLE}.plugins_downloaded, 0) ;;
  }

  dimension: downloaded_plugins_bands {
    label: "Plugins Downloaded Band"
    group_label: "Plugin Dimensions"
    description: "The number of distinct plugins downloaded on the server stratified into bands."
    type: tier
    style: integer
    tiers: [1, 2, 3, 4, 5, 10]
    sql: ${plugins_downloaded};;
  }


  dimension: server_version {
    group_label: " Server Versions"
    label: "  Server Version (Current)"
    description: "The current server version, or if current telemetry is not available, the last recorded server version recorded for the server."
    type: string
    sql: CASE WHEN regexp_substr(regexp_substr(${TABLE}.version,'[0-9]{0,}[.]{1}[0-9[{0,}[.]{1}[0-9]{0,}[.]{1}[0-9]{0,}[.]{1}[0-9]{0,}[.]{1}[0-9]{0,}[.]{1}[0-9]{0,}'), '[0-9]{0,}[.]{1}[0-9[{0,}[.]{1}[0-9]{0,}[.]{1}[0-9]{0,}$') IS NULL THEN
          regexp_substr(${TABLE}.version,'^[0-9]{0,}[.]{1}[0-9[{0,}[.]{1}[0-9]{0,}[.]{1}[0-9]{0,}')
          ELSE regexp_substr(regexp_substr(${TABLE}.version,'[0-9]{0,}[.]{1}[0-9[{0,}[.]{1}[0-9]{0,}[.]{1}[0-9]{0,}[.]{1}[0-9]{0,}[.]{1}[0-9]{0,}[.]{1}[0-9]{0,}'), '[0-9]{0,}[.]{1}[0-9[{0,}[.]{1}[0-9]{0,}[.]{1}[0-9]{0,}$') END;;
    order_by_field: server_version_major_sort
  }

  dimension: version {
    group_label: " Server Versions"
    label: "  Server Version (Current)"
    description: "The current server version, or if current telemetry is not available, the last recorded server version recorded for the server."
    type: string
    sql: ${TABLE}.version ;;
    hidden: yes
  }

  dimension: first_version {
    group_label: " Server Versions"
    label: "First Server Version"
    description: "The first server version, i.e. the version logged on the server's first telemetry date, recorded for the server."
    type: string
    sql: ${TABLE}.first_server_version;;
    hidden: yes
  }

  dimension: server_version_major {
    group_label: " Server Versions"
    label: "  Server Version: Major (Current)"
    description: "The current server version - excluding the trailing '.' release, or if current telemetry is not available, the last recorded server version recorded for the server."
    type: string
    sql: split_part(${server_version}, '.', 1) || '.' || split_part(${server_version}, '.', 2)  ;;
    order_by_field: server_version_major_sort
  }

  dimension: server_version_major_sort {
    group_label: " Server Versions"
    label: "  Server Version: Major (Current)"
    description: "The current server version - excluding the trailing '.' release, or if current telemetry is not available, the last recorded server version recorded for the server."
    type: number
    sql: (split_part(${server_version}, '.', 1) ||
          CASE WHEN split_part(${server_version}, '.', 2) = '10' THEN '99'
            ELSE split_part(${server_version}, '.', 2) || '0' END)::int ;;
    hidden: yes
  }

  dimension: first_server_version {
    group_label: " Server Versions"
    label: "First Server Version"
    description: "The first server version, i.e. the version logged on the server's first telemetry date, recorded for the server."
    type: string
    sql: CASE WHEN regexp_substr(regexp_substr(${TABLE}.first_server_version,'[0-9]{0,}[.]{1}[0-9[{0,}[.]{1}[0-9]{0,}[.]{1}[0-9]{0,}[.]{1}[0-9]{0,}[.]{1}[0-9]{0,}[.]{1}[0-9]{0,}'), '[0-9]{0,}[.]{1}[0-9[{0,}[.]{1}[0-9]{0,}[.]{1}[0-9]{0,}$') IS NULL THEN
          regexp_substr(${TABLE}.first_server_version,'^[0-9]{0,}[.]{1}[0-9[{0,}[.]{1}[0-9]{0,}[.]{1}[0-9]{0,}')
          ELSE regexp_substr(regexp_substr(${TABLE}.first_server_version,'[0-9]{0,}[.]{1}[0-9[{0,}[.]{1}[0-9]{0,}[.]{1}[0-9]{0,}[.]{1}[0-9]{0,}[.]{1}[0-9]{0,}[.]{1}[0-9]{0,}'), '[0-9]{0,}[.]{1}[0-9[{0,}[.]{1}[0-9]{0,}[.]{1}[0-9]{0,}$') END;;
    order_by_field: first_server_version_sort
  }

  dimension: first_server_version_sort {
    group_label: " Server Versions"
    label: "  Server Version: Major (Current)"
    description: "The current server version, or if current telemetry is not available, the last recorded server version recorded for the server."
    type: number
    sql: (split_part(${first_server_version}, '.', 1) ||
          CASE WHEN split_part(${first_server_version}, '.', 2) = '10' THEN '99'
            ELSE split_part(${first_server_version}, '.', 2) || '0' END)::int ;;
    hidden: yes
  }

  dimension: first_server_version_major {
    group_label: " Server Versions"
    label: "First Server Version: Major"
    description: "The first server version - excluding the '.' release, i.e. the version logged on the server's first telemetry date, recorded for the server."
    type: string
    sql: split_part(${first_server_version}, '.', 1) || '.' || split_part(${first_server_version}, '.', 2)  ;;
    order_by_field: first_server_version_major_sort
  }

  dimension: first_server_version_major_sort {
    group_label: " Server Versions"
    label: "  First Server Version: Major"
    description: "The first server version - excluding the '.' release, i.e. the version logged on the server's first telemetry date, recorded for the server."
    type: number
    sql: (split_part(${first_server_version}, '.', 1) ||
          CASE WHEN split_part(${first_server_version}, '.', 2) = '10' THEN '99'
            ELSE split_part(${first_server_version}, '.', 2) || '0' END)::int ;;
    hidden: yes
  }

  dimension: first_server_edition {
    group_label: " Server Editions"
    label: "First Server Edition"
    description: "The first server version, i.e. the version logged on the server's first telemetry date, recorded for the server ."
    type: string
    sql: CASE WHEN ${TABLE}.first_server_edition = 'true' THEN 'E0' WHEN ${TABLE}.first_server_edition = 'false' THEN 'TE' ELSE NULL END;;
  }

  dimension: starter_edition {
    group_label: " Server Editions"
    label: "Starter Edition"
    description: "Boolean indicating this server was on the Mattermost Starter edition at some point during it's lifetime (use for starter to trial conversion calculations)."
    type: yesno
    sql: CASE WHEN (${first_server_edition} = 'E0' OR ${server_edition} = 'E0') THEN TRUE ELSE FALSE END ;;
  }

  dimension: server_edition {
    group_label: " Server Editions"
    label: " Server Edition (Current)"
    description: "The first server version, i.e. the version logged on the server's first telemetry date, recorded for the server ."
    type: string
    sql: CASE WHEN ${TABLE}.server_edition = 'true' THEN 'E0' WHEN ${TABLE}.server_edition = 'false' THEN 'TE' ELSE NULL END;;
  }

  dimension: version_upgrades {
    group_label: "Upgrade Dimensions"
    description: "The total number of server version upgrades performed by the server i.e. number of times the server has been upgraded to a later version."
    type: number
    sql: ${TABLE}.version_upgrade_count ;;
  }

  dimension: edition_upgrades {
    group_label: "Upgrade Dimensions"
    description: "The total number of edition upgrades performed by the server i.e. number of times the server has been upgraded from TE to E0."
    type: number
    sql: ${TABLE}.edition_upgrade_count ;;
  }

  dimension: gitlab_install {
    label: " Gitlab Install"
    description: "Boolean indicating the server's OAuth enable gitlab flag = True on the date of server activation (first logged diagnostics activity date)."
    type: yesno
    sql: ${TABLE}.gitlab_install ;;
  }

  dimension: account_sfid {
    label: "Account SFID"
    description: "The Salesforce Account ID of the Mattermost customer associated with the server (null if no Salesforce Account found)."
    type: string
    sql: ${TABLE}.account_sfid ;;
    link: {
      label: "Salesforce Account Record"
      url: "https://mattermost.lightning.force.com/lightning/r/{{ account_sfid._value }}/view"
      icon_url: "https://mattermost.my.salesforce.com/favicon.ico"
    }
    hidden: yes
  }

  dimension: account_name {
    label: "Account Name"
    description: "The Salesforce Account Name of the Mattermost customer associated with the server (null if no Salesforce Account found)."
    type: string
    sql: ${TABLE}.account_name ;;
    link: {
      label: "Salesforce Account Record"
      url: "https://mattermost.lightning.force.com/lightning/r/{{ account_sfid._value }}/view"
      icon_url: "https://mattermost.my.salesforce.com/favicon.ico"
    }
    hidden: yes
  }

  dimension: company_name {
    label: "Customer Name"
    description: "The coalesce Mattermost Customer Name using the Salesforce Account Name, or if not available, the license company name, of the Mattermost customer associated with the server (null if no Salesforce Account found)."
    type: string
    sql: COALESCE(${TABLE}.account_name, ${TABLE}.company);;
    hidden: yes
  }

  dimension: active_paying_customer {
    label: "Current Customer"
    description: "Identifies whether the server is tied to a current customer based on the paid license expiration date."
    type: yesno
    sql: CASE WHEN ${TABLE}.paid_license_expire_date::date >= CURRENT_DATE THEN TRUE ELSE FALSE END ;;
    hidden: yes
  }

  dimension: active_trial {
    label: "Active Trial"
    description: "Identifies whether the server is tied to a currently active trial license based on the trial license expiration date."
    type: yesno
    sql: CASE WHEN ${TABLE}.trial_license_expire_date::date >= CURRENT_DATE THEN TRUE ELSE FALSE END ;;
    hidden: yes
  }

  dimension: license_id {
    label: "License ID (Current)"
    description: "The latest Mattermost Customer License ID associated with the server i.e. on the current date or last license associated prior to churn and/or disabling telemetry (null if no license found)."
    type: string
    sql: COALESCE(${TABLE}.last_license_id1, ${license_id2}) ;;
    hidden: yes
  }

  dimension: license_id2 {
    label: "License ID2 (Current)"
    description: "The latest Mattermost Customer License ID associated with the server i.e. on the current date or last license associated prior to churn and/or disabling telemetry (null if no license found)."
    type: string
    hidden: yes
    sql: ${TABLE}.last_license_id2 ;;
  }

  dimension_group: customer_first_active {
    label: "Customer First Active Telemetry"
    description: "The date the server was first active (first recorded instance of server appearing server logging data: mattermost2.server - diagnostics.go or events.security - security_update_check.go)."
    type: time
    timeframes: [raw, date, week, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.customer_first_active_date ;;
  }

  dimension_group: first_active {
    label: " First Active"
    description: "The date the server was first active (first recorded instance of server appearing server logging data: mattermost2.server - diagnostics.go or events.security - security_update_check.go)."
    type: time
    timeframes: [raw, hour, time, time_of_day, hour_of_day, date, week, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.first_active_date ;;
  }

  dimension_group: last_active {
    label: " Last Active"
    description: "The date the server was last active (last recorded instance of server appearing server logging data: mattermost2.server - diagnostics.go or events.security - security_update_check.go)."
    type: time
    timeframes: [raw, date, week, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.last_active_date ;;
  }

  dimension: first_to_last_active {
    label: "Days First to Last Active"
    group_label: "Days Active Dimensions"
    description: "The number of days between a server's first active date and last active date i.e. the age of the server, in days, since first sending telemetry to last sending telemetry."
    type: number
    sql: datediff(days,${first_active_date}, ${last_active_date}) ;;
    value_format_name: decimal_0
  }

  dimension: days_active {
    group_label: "Days Active Dimensions"
    description: "The number of days a server logged >= 1 event since it's first active date."
    type: number
    sql: coalesce(${TABLE}.days_active, 0) ;;
    value_format_name: decimal_0
  }

  dimension: days_inactive {
    group_label: "Days Active Dimensions"
    description: "The number of days a server logged 0 events since it's first active date."
    type: number
    sql: ${TABLE}.days_inactive ;;
    value_format_name: decimal_0
  }

  dimension: days_active_pct {
    group_label: "Days Active Dimensions"
    label: "Days Active (% Total)"
    description: "The % of total days first to last active that a server logged >= 1 event."
    type: number
    value_format_name: percent_1
    sql: ${days_active}/(COALESCE(${first_to_last_active},0)+1) ;;
  }

  dimension_group: first_active_user {
    type: time
    description: "The first date an active user was logged on the Mattermost Messaging instance."
    label: " First Active User"
    sql: ${TABLE}.first_active_user_date ;;
    timeframes: [raw, date, week, month, year, fiscal_quarter, fiscal_year]
  }

  dimension_group: last_active_user_activity {
    type: time
    description: "The first date an active user was logged on the Mattermost Messaging instance."
    label: " Last Active User"
    sql: ${TABLE}.last_active_user_date ;;
    timeframes: [raw, date, week, month, year, fiscal_quarter, fiscal_year]
  }

  dimension_group: first_telemetry_active {
    label: " First Security Telemetry"
    description: "The date the server first recorded security telemetry data in the security diagnostics data (logged via security_update_check.go)."
    type: time
    timeframes: [raw, date, week, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.first_telemetry_active_date ;;
  }

  dimension_group: last_telemetry_active {
    label: " Last Security Telemetry"
    description: "The date the server last recorded security telemetry data in the security diagnostics data."
    type: time
    timeframes: [raw, date, week, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.last_telemetry_active_date ;;
  }

  dimension_group: last_mm2_telemetry {
    label: " Last Diagnostics Telemetry"
    description: "The date the server last recorded diagnostics telemetry (logged via diagnostics.go)."
    type: time
    timeframes: [raw, date, week, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.last_mm2_telemetry_date ;;
  }

  dimension_group: first_mm2_telemetry {
    label: " First Diagnostics Telemetry"
    description: "The date the server first recorded diagnostics telemetry (logged via diagnostics.go)."
    type: time
    timeframes: [raw, date, week, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.first_mm2_telemetry_date ;;
  }

  dimension_group: first_plugin_install {
    label: " First Plugin Install"
    description: "The date the first plugin was manually downloaded to the server/cloud workspace."
    type: time
    timeframes: [date, week, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.first_plugin_install_date ;;
  }

  dimension: days_to_first_plugin_install {
    description: "The # of days between the first active date of a server/cloud workspace and date first plugin was manually installed/downloaded by a user."
    type: number
    sql: datediff(days, ${first_active_date}::date, ${first_plugin_install_date}::date) ;;
    value_format_name: decimal_0
  }

  dimension: days_to_first_plugin_install_band {
    group_label: "Plugin Dimensions"
    description: "The # of days between the first active date of a server/cloud workspace and date first plugin was manually installed/downloaded by a user segmented into bands."
    type: tier
    style: integer
    tiers: [1, 8, 31, 61, 91, 181, 366]
    sql: ${days_to_first_plugin_install} ;;
  }

  dimension: max_active_user_count {
    group_label: "*Active User Dimensions"
    description: "The all-time maximum number of active users logged on the server."
    type: number
    sql: ${TABLE}.max_active_user_count;;
  }

  dimension: max_registered_users {
    group_label: "*Registered User Dimensions"
    label: "Registered Users"
    description: "The current number of registered users logged on the server."
    type: number
    sql: ${TABLE}.registered_users - COALESCE(${max_registered_deactivated_users}, 0);;
  }

  dimension: registered_users_max {
    group_label: "*Registered User Dimensions"
    label: "Max. Registered Users"
    description: "The max number of registered users logged on the server during it's lifetime."
    type: number
    sql: CASE WHEN ${TABLE}.max_registered_users - COALESCE(${max_registered_deactivated_users}, 0) < 0 THEN 0 ELSE ${TABLE}.max_registered_users - COALESCE(${max_registered_deactivated_users}, 0) END;;
  }

  dimension: enabled_plugins_max {
    group_label: "Plugin Dimensions"
    label: "Max. Enabled Plugins"
    description: "The max number of enabled plugins logged on the server during it's lifetime."
    type: number
    sql: COALESCE(${TABLE}.max_enabled_plugins, 3);;
  }


  dimension: max_registered_user_bands {
    group_label: "*Registered User Dimensions"
    label: "Max. Registered User Bands"
    description: "The max number of registered users stratified into bands currently logged on the server."
    type: tier
    style: integer
    tiers: [2, 3, 4, 5, 6, 7, 8, 9, 10]
    sql: ${registered_users_max};;
  }

  dimension: max_enabled_plugins_bands {
    group_label: "Plugin Dimensions"
    label: "Max. Enabled Plugins Band"
    description: "The max number of enabled plugins on the server stratified into bands currently logged on the server."
    type: tier
    style: integer
    tiers: [1, 2, 3, 4, 5, 10]
    sql: ${enabled_plugins_max};;
  }

  dimension: max_disabled_plugins_bands {
    label: "Max. Disabled Plugins Band"
    group_label: "Plugin Dimensions"
    description: "The max number of disabled plugins on the server stratified into bands currently logged on the server."
    type: tier
    style: integer
    tiers: [1, 2, 3, 4, 5]
    sql: COALESCE(IFF(${TABLE}.max_disabled_plugins < 0, 0, ${TABLE}.max_disabled_plugins),0);;
  }


  dimension: registered_user_bands {
    label: "Registered User Band"
    group_label: "*Registered User Dimensions"
    description: "The current number of registered users stratified into bands currently logged on the server."
    type: tier
    style: integer
    tiers: [2, 5, 11, 21, 50, 101, 1001]
    sql: ${TABLE}.registered_users - COALESCE(${max_registered_deactivated_users}, 0);;
  }

  dimension: max_registered_deactivated_users {
    group_label: "*Registered User Dimensions"
    label: "Deactivated Users"
    description: "The running total (maximum) of deactivated users logged on the server."
    type: number
    sql: ${TABLE}.registered_deactivated_users;;
  }

  dimension: signup_events_alltime {
    group_label: "User Event Dimensions"
    description: "The all-time count of signup events performed by users on the server (from user event telemetry)."
    type: number
    sql: ${TABLE}.signup_events_alltime;;
  }

  dimension: post_events_alltime {
    group_label: "User Event Dimensions"
    description: "The all-time count of posts created by users on the server (from user event telemetry)."
    type: number
    sql: COALESCE(${TABLE}.posts_events_alltime, 0);;
  }

  dimension: avg_posts_per_active_day {
    group_label: "User Event Dimensions"
    description: "The total number of posts performed on the server/workspace divided by the number of days active (user performing >=1 event)."
    type: number
    value_format_name: decimal_1
    sql: COALESCE(COALESCE(${post_events_alltime},0)/NULLIF(${days_active},0), 0) ;;
  }

  dimension: posts_per_day_bands {
    label: "Posts Per Active Day Band"
    group_label: "User Event Dimensions"
    description: "The average number of posts performed by the server/workspace per active day since first activity stratified into bands to date."
    type: tier
    style: relational
    value_format_name: decimal_0
    tiers: [1, 2, 3, 4, 5, 10, 20, 50, 100]
    sql: COALESCE(${avg_posts_per_active_day},0);;
  }

  dimension: api_request_trial_events_alltime {
    group_label: "User Event Dimensions"
    description: "The all-time count of request trial events (in-app request trial button clicks) triggered by users on the server (from user event telemetry)."
    type: number
    sql: ${TABLE}.api_request_trial_events_alltime;;
  }

  dimension: max_posts {
    label: "Posts"
    group_label: "Activity Dimensions"
    description: "The total number of posts created on the server to date (logged via the server diagnostics.go code)."
    type: number
    sql: ${TABLE}.posts;;
  }

  dimension: direct_message_channels {
    group_label: "Activity Dimensions"
    label: "Direct Message Channels"
    description: "The total number of direct messages created on the server to date (logged via the server diagnostics.go code)."
    type: number
    sql: ${TABLE}.direct_message_channels;;
  }

  dimension: public_channels {
    group_label: "Activity Dimensions"
    description: "The total number of public channels created on the server to date (logged via the server diagnostics.go code)."
    type: number
    sql: COALESCE(IFF(${TABLE}.public_channels < 0, 0, ${TABLE}.public_channels),0);;
  }

  dimension: public_channels_bands {
    label: "Public Channels Band"
    group_label: "Activity Dimensions"
    description: "The total number of public channels created on the server stratified into bands to date (logged via the server diagnostics.go code)."
    type: tier
    style: integer
    tiers: [1, 2, 3, 4, 5, 10, 20, 50, 100]
    sql: ${public_channels};;
  }

  dimension: private_channels {
    group_label: "Activity Dimensions"
    description: "The total number of private channels created on the server to date (logged via the server diagnostics.go code)."
    type: number
    sql: COALESCE(IFF(${TABLE}.private_channels < 0, 0, ${TABLE}.private_channels), 0);;
  }

  dimension: private_channels_bands {
    label: "Private Channels Band"
    group_label: "Activity Dimensions"
    description: "The total number of private channels created on the server stratified into bands to date (logged via the server diagnostics.go code)."
    type: tier
    style: integer
    tiers: [1, 2, 3, 4, 5, 10, 20, 50, 100]
    sql: ${private_channels};;
  }

  dimension: slash_commands {
    group_label: "Activity Dimensions"
    description: "The total number of slash_commands executed on the server (logged via the server diagnostics.go code) to date."
    type: number
    sql: COALESCE(IFF(${TABLE}.slash_commands < 0, 0, ${TABLE}.slash_commands), 0) ;;
  }

  dimension: slash_commands_bands {
    label: "Slash Commands Band"
    group_label: "Activity Dimensions"
    description: "The total number of slash commands executed on the server stratified into bands currently logged on the server."
    type: tier
    style: integer
    tiers: [1, 2, 3, 4, 5, 10, 20]
    sql: ${slash_commands};;
  }

  dimension: teams {
    description: "The total number of teams associated with the server (logged via the server diagnostics.go code) to date."
    type: number
    group_label: "Activity Dimensions"
    sql: COALESCE(IFF(${TABLE}.teams < 0, 0, ${TABLE}.teams), 0);;
  }

  dimension: teams_bands {
    label: "Teams Band"
    group_label: "Activity Dimensions"
    description: "The total number of teams associated with the server stratified into bands currently logged on the server."
    type: tier
    style: integer
    tiers: [1, 2, 3, 4, 5, 10, 20]
    sql: ${teams};;
  }

  dimension: posts_previous_day {
    label: "Posts (Previous Day)"
    group_label: "Activity Dimensions"
    description: "The total number of posts created on the server (logged via the server diagnostics.go code) the previous day before the last active date (yesterday for servers currently sending telemetry)."
    type: number
    sql: ${TABLE}.posts_previous_day;;
  }

  dimension: bot_posts_previous_day {
    label: "Bot Posts"
    group_label: "Activity Dimensions"
    description: "The total number of bot posts created on the server (logged via the server diagnostics.go code) the previous day before the last active date (yesterday for servers currently sending telemetry)."
    type: number
    sql: ${TABLE}.bot_posts_previous_day;;
  }

  dimension: active_users {
    description: "The number of active users on the server (logged via the server diagnostics.go code) on the most recent telemetry date (last active date)."
    type: number
    group_label: "Activity Dimensions"
    sql: ${TABLE}.active_users;;
  }

  dimension: monthly_active_users {
    description: "The total number of monthly active users on the servers (logged via the server diagnostics.go code) within the last 30 days of the server's most recent telemetry date (last active date)."
    type: number
    group_label: "Activity Dimensions"
    sql: ${TABLE}.monthly_active_users;;
  }

  dimension: bot_accounts {
    group_label: "Activity Dimensions"
    description: "The total number of bot_accounts created on the server (logged via the server diagnostics.go code) to date."
    type: number
    sql: COALESCE(IFF(${TABLE}.bot_accounts <0, 0, ${TABLE}.bot_accounts), 0);;
  }

  dimension: bot_account_bands {
    label: "Bot Accounts Band"
    group_label: "Activity Dimensions"
    description: "The total number of bot accounts associated with the server stratified into bands (logged via the server diagnostics.go code) to date."
    type: tier
    style: integer
    tiers: [1, 2, 3, 4, 5, 10, 20]
    sql: ${bot_accounts};;
  }

  dimension: guest_accounts {
    description: "The total number of guest_accounts created on the server (logged via the server diagnostics.go code) to date."
    type: number
    group_label: "Activity Dimensions"
    sql: ${TABLE}.guest_accounts;;
  }

  dimension: guest_account_bands {
    label: "Guest Accounts Band"
    group_label: "Activity Dimensions"
    description: "The total number of guest accounts associated with the server stratified into bands (logged via the server diagnostics.go code) to date."
    type: tier
    style: integer
    tiers: [1, 2, 3, 4, 5, 10, 20]
    sql: ${guest_accounts};;
  }

  dimension: incoming_webhooks {
    description: "The total number of incoming_webhooks created on the server (logged via the server diagnostics.go code) to date."
    type: number
    group_label: "Activity Dimensions"
    sql: COALESCE(${TABLE}.incoming_webhooks, 0);;
  }

  dimension: incoming_webhooks_bands {
    label: "Incoming Webhooks Band"
    group_label: "Activity Dimensions"
    description: "The total number of incoming webhooks associated with the server stratified into bands (logged via the server diagnostics.go code) to date."
    type: tier
    style: integer
    tiers: [1, 2, 3, 4, 5, 10, 20]
    sql: ${incoming_webhooks};;
  }

  dimension: outgoing_webhooks {
    description: "The total number of guest_accounts created on the server (logged via the server diagnostics.go code) to date."
    type: number
    group_label: "Activity Dimensions"
    sql: COALESCE(${TABLE}.outgoing_webhooks, 0);;
  }

  dimension: outgoing_webhooks_bands {
    label: "Outgoing Webhooks Band"
    group_label: "Activity Dimensions"
    description: "The total number of outgoing webhooks associated with the server stratified into bands currently logged on the server."
    type: tier
    style: integer
    tiers: [1, 2, 3, 4, 5, 10, 20]
    sql: ${outgoing_webhooks};;
  }

  dimension: incident_mgmt_events_alltime {
    label: "Incident Collaboration Events"
    description: "The count of distinct incident collaboration events performed by the server to date."
    type: number
    sql: COALESCE(${TABLE}.incident_mgmt_events_alltime, 0) ;;
  }

  dimension: invite_members_alltime {
    group_label: "User Event Dimensions"
    description: "The all-time count of 'Invite Members' events performed by users on the server (from user event telemetry)."
    type: number
    sql: ${TABLE}.invite_members_alltime;;
  }

  dimension: signup_email_events_alltime {
    group_label: "User Event Dimensions"
    description: "The all-time count of signup email events performed by users on the server (from user event telemetry)."
    type: number
    sql: ${TABLE}.signup_email_events_alltime;;
  }

  dimension: tutorial_events_alltime {
    group_label: "User Event Dimensions"
    description: "The all-time count of tutorial events performed by users on the server (from user event telemetry)."
    type: number
    sql: ${TABLE}.tutorial_events_alltime;;
  }

  dimension: admin_events_alltime {
    group_label: "User Event Dimensions"
    description: "The all-time count of admin events performed by users on the server (from user event telemetry)."
    type: number
    sql: ${TABLE}.admin_events_alltime;;
  }

  dimension_group: last_active_user {
    group_label: " Last Event Active User"
    description: "The date the server was first active (first recorded telemetry enabled date)."
    type: time
    timeframes: [date, week, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.last_event_active_user_date ;;
    hidden: yes
  }

  dimension_group: first_paid_license {
    label: " Server First Paid License"
    description: "The date the server's first assocated paid license was issued."
    type: time
    timeframes: [date, week, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.first_paid_license_date ;;
    hidden: yes
  }

  dimension_group: customer_first_paid_license {
    label: " Customer First Paid License"
    description: "The date the customer associated with a server was first issued a paid license."
    type: time
    timeframes: [date, week, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.customer_first_paid_license_date ;;
    hidden: yes
  }

  dimension_group: first_trial_license {
    label: " Server First Trial License"
    description: "The date the server's first associated trial license was issued."
    type: time
    timeframes: [date, week, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.first_trial_license_date ;;
    hidden: yes
  }

  dimension_group: first_100reg_users {
    label: "   First 100 Reg. Users"
    description: "The date the server first reached 100 registered users."
    type: time
    timeframes: [date, week, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.first_100reg_users_date ;;
    hidden: yes
  }

  dimension: days_to_100reg_users {
    group_label: "Days to Reg. User Thresholds"
    label: "Days to 100 Reg. Users"
    type: number
    sql: DATEDIFF(DAY, ${first_active_date}, ${first_100reg_users_date}) ;;
  }

  dimension_group: first_500reg_users {
    label: "   First 500 Reg. Users"
    description: "The date the server first reached 500 registered users."
    type: time
    timeframes: [date, week, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.first_500reg_users_date ;;
    hidden: yes
  }

  dimension: days_to_500reg_users {
    group_label: "Days to Reg. User Thresholds"
    label: "Days to 500 Reg. Users"
    type: number
    sql: DATEDIFF(DAY, ${first_active_date}, ${first_500reg_users_date}) ;;
  }

  dimension_group: first_1kreg_users {
    label: "  First 1k Reg. Users"
    description: "The date the server first reached 1k registered users."
    type: time
    timeframes: [date, week, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.first_1kreg_users_date ;;
    hidden: yes
  }

  dimension: days_to_1kreg_users {
    group_label: "Days to Reg. User Thresholds"
    label: "Days to 1k Reg. Users"
    type: number
    sql: DATEDIFF(DAY, ${first_active_date}, ${first_1kreg_users_date}) ;;
  }

  dimension_group: first_2500reg_users {
    label: "  First 2.5k Reg. Users"
    description: "The date the server first reached 2.5k registered users."
    type: time
    timeframes: [date, week, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.first_2500reg_users_date ;;
    hidden: yes
  }

  dimension: days_to_2500kreg_users {
    group_label: "Days to Reg. User Thresholds"
    label: "Days to 2.5k Reg. Users"
    type: number
    sql: DATEDIFF(DAY, ${first_active_date}, ${first_2500reg_users_date}) ;;
  }

  dimension_group: first_5kreg_users {
    label: " First 5k Reg. Users"
    description: "The date the server first reached 5k registered users."
    type: time
    timeframes: [date, week, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.first_5kreg_users_date ;;
    hidden: yes
  }

  dimension: days_to_5kreg_users {
    group_label: "Days to Reg. User Thresholds"
    label: "Days to 5k Reg. Users"
    type: number
    sql: DATEDIFF(DAY, ${first_active_date}, ${first_5kreg_users_date}) ;;
  }

  dimension_group: first_10kreg_users {
    label: " First 10k Reg. Users"
    description: "The date the server first reached 10k registered users."
    type: time
    timeframes: [date, week, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.first_10kreg_users_date ;;
    hidden: yes
  }

  dimension: days_to_10kreg_users {
    group_label: "Days to Reg. User Thresholds"
    label: "Days to 10k Reg. Users"
    type: number
    sql: DATEDIFF(DAY, ${first_active_date}, ${first_10kreg_users_date}) ;;
  }

  dimension_group: paid_license_expire {
    label: "Paid License Expire"
    type: time
    timeframes: [date, week, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.paid_license_expire_date ;;
  }

  dimension: dau {
    group_label: "Active User Dimensions"
    label: "   Total DAU"
    description: "The current Daily Active User count based on all users that performed events on the last complete day (on the last date the server logged user-level events.)."
    type: number
    sql: CASE WHEN ${TABLE}.dau_total >= coalesce(${active_users}, 0) THEN ${TABLE}.dau_total else ${active_users} END;;
  }

  dimension: mobile_dau {
    group_label: "Active User Dimensions"
    label: "  Mobile DAU"
    description: "The current Mobile Daily Active User count based on all users that performed events on the last complete day (on the last date the server logged user-level events.)."
    type: number
    sql: ${TABLE}.mobile_dau;;
  }

  dimension: mau {
    group_label: "Active User Dimensions"
    label: "   Total MAU"
    description: "The current Monthly Active User count based on all users that performed events in the last 30 days from the last complete day (on the last date the server logged user-level events.)."
    type: number
    sql: case when ${TABLE}.mau_total >= COALESCE(${monthly_active_users}, 0) then ${TABLE}.mau_total else ${monthly_active_users} end;;
  }

  dimension: first_time_mau {
    group_label: "Active User Dimensions"
    label: " First-Time MAU"
    description: "The current First Time Monthly Active User count based on all users that performed events for the first time on the last complete day (on the last date the server logged user-level events.)."
    type: number
    sql: ${TABLE}.first_time_mau;;
  }

  dimension: reengaged_mau {
    group_label: "Active User Dimensions"
    label: " Reengaged MAU"
    description: "The current Reengaged Monthly Active User count based on all users that performed an event for the first time in 30 days on the last complete day (on the last date the server logged user-level events.)."
    type: number
    sql: ${TABLE}.reengaged_mau;;
  }

  dimension: current_mau {
    group_label: "Active User Dimensions"
    label: " Current MAU"
    description: "The current Monthly Active User count based on all users that performed an event in the last 30 days that do not fall into the first-time or reengaged MAU categories ( on the last date the server logged user-level events.)."
    type: number
    sql: ${TABLE}.current_mau;;
  }

  dimension: total_events {
    group_label: "User Event Dimensions"
    label: "   Total Events"
    description: "The total number of events performed by all users associated with the server on the last date the server logged user-level events.."
    type: number
    sql: ${TABLE}.total_events;;
  }

  dimension: web_app_events {
    group_label: "User Event Dimensions"
    label: "Web App Events"
    description: "The total number of Web App client events performed by all users associated with the server on the last date the server logged user-level events.."
    type: number
    sql: ${TABLE}.web_app_events;;
  }

  dimension: desktop_events {
    group_label: "User Event Dimensions"
    label: "Desktop Events"
    description: "The total number of Desktop client events performed by all users associated with the server on the last date the server logged user-level events.."
    type: number
    sql: ${TABLE}.desktop_events;;
  }

  dimension: mobile_events {
    group_label: "User Event Dimensions"
    label: "Mobile Events"
    description: "The total number of Mobile client events performed by all users associated with the server on the last date the server logged user-level events.."
    type: number
    sql: ${TABLE}.mobile_events;;
  }

  dimension: events_alltime {
    group_label: "User Event Dimensions"
    label: "  Total Events (All Time)"
    description: "The total number of events performed by all users associated with the server since the servers install date to the last current day ( on the last date the server logged user-level events.)."
    type: number
    sql: ${TABLE}.events_alltime;;
  }

  dimension: mobile_events_alltime {
    group_label: "User Event Dimensions"
    label: " Mobile Events (All Time)"
    description: "The total number of mobile events performed by all users associated with the server since the servers install date to the last current day (on the last date the server logged user-level events.)."
    type: number
    sql: ${TABLE}.mobile_events_alltime;;
  }

  dimension: promoters {
    label: "  Promoters"
    group_label: "NPS Dimensions"
    description: "The count of NPS users associated with the server that are promoters (score > 8)."
    type: number
    sql: ${TABLE}.promoters ;;
    hidden: yes
  }

  dimension: detractors {
    label: " Detractors"
    group_label: "NPS Dimensions"
    description: "The count of NPS users associated with the server that are detractors (score < 7)."
    type: number
    sql: ${TABLE}.detractors ;;
    hidden: yes
  }

  dimension: passives {
    label: "Passives"
    group_label: "NPS Dimensions"
    description: "The count of NPS users associated with the server that are passives (score >= 7 & <= 8)."
    type: number
    sql: ${TABLE}.passives ;;
    hidden: yes
  }

  dimension: nps_users {
    label: "   NPS Users"
    group_label: "NPS Dimensions"
    description: "The count of all NPS users associated with the server (users that have submitted an NPS survey response)."
    type: number
    sql: ${TABLE}.nps_users ;;
    hidden: yes
  }


  # Measures
  measure: server_count {
    label: "  Server Count"
    group_label: " Instance Counts"
    description: "The distinct count of all servers. If unfiltered this will show all servers that have ever sent telemetry to internal Mattermost Servers."
    type: count_distinct
    sql: ${server_id} ;;
    drill_fields: [drill_set1*]
  }

  measure: active_instances_28day_672_700 {
    label: "  28-Day Active Instances"
    group_label: " Instance Counts"
    description: "The distinct count of all Mattermost Messaging instances with Active Usage (a user performing an action) on the instance between the 672nd & 696th hour from the instances first active timestamp."
    type: count_distinct
    sql: CASE WHEN ${retention_28day_flag} THEN ${server_id} ELSE NULL END;;
    drill_fields: [drill_set1*]
  }

  measure: active_instances_1day_24_48 {
    label: "  1-Day Active Instances"
    group_label: " Instance Counts"
    description: "The distinct count of all Mattermost Messaging instances with Active Usage (a user performing an action) on the instance between the 24th & 48th hour from the instances first active timestamp."
    type: count_distinct
    sql: CASE WHEN ${retention_1day_flag} THEN ${server_id} ELSE NULL END;;
    drill_fields: [drill_set1*]
  }

  measure: active_instances_7day_168_192 {
    label: "  7-Day Active Instances"
    group_label: " Instance Counts"
    description: "The distinct count of all Mattermost Messaging instances with Active Usage (a user performing an action) on the instance between the 24th & 48th hour from the instances first active timestamp."
    type: count_distinct
    sql: CASE WHEN ${retention_7day_flag} THEN ${server_id} ELSE NULL END;;
    drill_fields: [drill_set1*]
  }

  measure: active_instances_14day_336_360 {
    label: "  14-Day Active Instances"
    group_label: " Instance Counts"
    description: "The distinct count of all Mattermost Messaging instances with Active Usage (a user performing an action) on the instance between the 24th & 48th hour from the instances first active timestamp."
    type: count_distinct
    sql: CASE WHEN ${retention_14day_flag} THEN ${server_id} ELSE NULL END;;
    drill_fields: [drill_set1*]
  }

  measure: instances_w_payment_methods {
    label: "  Instances w/ Payment Methods"
    group_label: " Instance Counts"
    description: "The distinct count of all Mattermost Messaging Cloud instances that have added a payment method to their workspace."
    type: count_distinct
    sql: CASE WHEN ${cloud_payment_method_added_date} is not null THEN ${server_id} ELSE NULL END;;
    drill_fields: [drill_set1*]
  }

  measure: server_w_active_users {
    label: " Servers w/ Active Users"
    group_label: " Instance Counts"
    description: "The count of distinct servers w/ > 0 active user during the server's lifetime."
    type: count_distinct
    sql: CASE WHEN ${max_active_user_count} > 0 THEN ${server_id} ELSE NULL END ;;
    drill_fields: [drill_set1*]
  }

  measure: servers_w_post_events {
    label: " Servers w/ Post Events"
    group_label: " Instance Counts"
    description: "The count of distinct servers w/ > 0 Posts created during the server's lifetime."
    type: count_distinct
    sql: case when ${post_events_alltime} > 0 THEN ${server_id} ELSE NULL END ;;
    drill_fields: [drill_set1*]
  }

  measure: servers_w_signup_events {
    label: " Servers w/ Signup Events"
    group_label: " Instance Counts"
    description: "The count of distinct servers w/ > 0 Signup Events during the server's lifetime."
    type: count_distinct
    sql: case when ${signup_events_alltime} > 0 or ${signup_email_events_alltime} > 0 THEN ${server_id} ELSE NULL END ;;
    drill_fields: [drill_set1*]
  }

  measure: servers_w_signup_email_events {
    label: " Servers w/ Signup Email Events"
    group_label: " Instance Counts"
    description: "The count of distinct servers w/ > 0 Signup Email Events during the server's lifetime."
    type: count_distinct
    sql: case when ${signup_email_events_alltime} > 0 THEN ${server_id} ELSE NULL END ;;
    drill_fields: [drill_set1*]
  }

  measure: servers_w_tutorial_events {
    label: " Servers w/ Tutorial Events"
    group_label: " Instance Counts"
    description: "The count of distinct servers w/ > 0 Tutorial Events during the server's lifetime."
    type: count_distinct
    sql: case when ${tutorial_events_alltime} > 0 THEN ${server_id} ELSE NULL END ;;
    drill_fields: [drill_set1*]
  }

  measure: servers_w_admin_events {
    label: " Servers w/ Admin Events"
    group_label: " Instance Counts"
    description: "The count of distinct servers w/ > 0 Admin Events during the server's lifetime."
    type: count_distinct
    sql: case when ${admin_events_alltime} > 0 THEN ${server_id} ELSE NULL END ;;
    drill_fields: [drill_set1*]
  }

  measure: servers_w_invite_member_events {
    label: " Servers w/ Invite Member Events"
    group_label: " Instance Counts"
    description: "The count of distinct servers w/ > 0 Invite Member Events during the server's lifetime."
    type: count_distinct
    sql: case when ${invite_members_alltime} > 0 THEN ${server_id} ELSE NULL END ;;
    drill_fields: [drill_set1*]
  }

  measure: servers_w_incident_mgmt_events {
    label: " Servers w/ Incident Mgmt Events"
    group_label: " Instance Counts"
    description: "The count of distinct servers w/ > 0 Incident Mgmt Events during the server's lifetime."
    type: count_distinct
    sql: case when ${incident_mgmt_events_alltime} > 0 THEN ${server_id} ELSE NULL END ;;
    drill_fields: [drill_set1*]
  }

  measure: median_days_first_to_last_active {
    label: "Days First to Last Active (Median)"
    group_label: "Days Active"
    type: number
    sql: median(${first_to_last_active}) ;;
    drill_fields: [drill_set1*]
    value_format_name: decimal_1
  }

  measure: avg_days_first_to_last_active {
    label: "Days First to Last Active (Avg)"
    group_label: "Days Active"
    type: number
    sql: avg(${first_to_last_active}) ;;
    drill_fields: [drill_set1*]
    value_format_name: decimal_1
  }

  measure: avg_days_active {
    label: "Days Active (Avg)"
    group_label: "Days Active"
    type: number
    sql: avg(${days_active}) ;;
    drill_fields: [drill_set1*]
    value_format_name: decimal_1
  }

  measure: median_days_active {
    label: "Days Active (Median)"
    group_label: "Days Active"
    type: number
    sql: median(${days_active}) ;;
    drill_fields: [drill_set1*]
    value_format_name: decimal_1
  }

  measure: avg_days_active_pct {
    label: "Days Active % (Avg)"
    group_label: "Days Active"
    type: number
    sql: avg(${days_active_pct}) ;;
    drill_fields: [drill_set1*]
    value_format_name: percent_1
  }

  measure: median_days_active_pct {
    label: "Days Active % (Median)"
    group_label: "Days Active"
    type: number
    sql: median(${days_active_pct}) ;;
    drill_fields: [drill_set1*]
    value_format_name: percent_1
  }

  measure: nps_users_sum {
    label: "   NPS Users (Sum)"
    group_label: "NPS Measures"
    description: "The sum of Nps Users that have submitted NPS responses across all servers per grouping."
    type: sum
    value_format_name: decimal_0
    drill_fields: [drill_set1*]
    sql: ${nps_users} ;;
    hidden: yes
  }

  measure: detractors_sum {
    label: " Detractors (Sum)"
    group_label: "NPS Measures"
    description: "The sum of the count of all NPS Detractor responses across all servers per grouping."
    type: sum
    value_format_name: decimal_0
    drill_fields: [drill_set1*]
    sql: ${detractors} ;;
    hidden: yes
  }

  measure: promoters_sum {
    label: "  Promoters (Sum)"
    group_label: "NPS Measures"
    description: "The sum of the count of all NPS Promoter responses across all servers per grouping."
    type: sum
    value_format_name: decimal_0
    sql: ${promoters} ;;
    drill_fields: [drill_set1*]
    hidden: yes
  }

  measure: passives_sum {
    label: "Passives (Sum)"
    group_label: "NPS Measures"
    description: "The sum of the count of all NPS Passive responses across all servers per grouping."
    type: sum
    value_format_name: decimal_0
    sql: ${passives} ;;
    drill_fields: [drill_set1*]
    hidden: yes
  }

  measure: nps_score_all {
    label: "   NPS Score"
    group_label: "NPS Measures"
    description: "The aggregate NPS Score across all servers per grouping based on the NPS calculation: NPS Score = 100 * (% Promoters - % Detractors). "
    type: number
    sql: 100.0 * ((${promoters_sum}/nullif(${nps_users_sum},0))-(${detractors_sum}/nullif(${nps_users_sum},0))) ;;
    drill_fields: [drill_set1*]
    value_format_name: decimal_1
    hidden: yes
  }

  measure: dau_sum {
    group_label: "Active User Measures"
    label: "   Total DAU"
    description: "The current Daily Active User count based on all users that performed events on the last complete day (on the last date the server logged user-level events.)."
    type: sum
    sql: ${dau};;
    drill_fields: [drill_set1*]
  }

  measure: mobile_dau_sum {
    group_label: "Active User Measures"
    label: "  Mobile DAU"
    description: "The current Mobile Daily Active User count based on all users that performed events on the last complete day (on the last date the server logged user-level events.)."
    type: sum
    sql: ${TABLE}.mobile_dau;;
    drill_fields: [drill_set1*]
  }

  measure: mau_sum {
    group_label: "Active User Measures"
    label: "  Total MAU"
    description: "The current Monthly Active User count based on all users that performed events in the last 30 days from the last complete day (on the last date the server logged user-level events.)."
    type: sum
    sql: ${mau};;
    drill_fields: [drill_set1*]
  }

  measure: first_time_mau_sum {
    group_label: "Active User Measures"
    label: "First-Time MAU"
    description: "The current First Time Monthly Active User count based on all users that performed events for the first time on the last complete day (on the last date the server logged user-level events.)."
    type: sum
    sql: ${TABLE}.first_time_mau;;
    drill_fields: [drill_set1*]
  }

  measure: reengaged_mau_sum {
    group_label: "Active User Measures"
    label: "Reengaged MAU"
    description: "The current Reengaged Monthly Active User count based on all users that performed an event for the first time in 30 days on the last complete day (on the last date the server logged user-level events.)."
    type: sum
    sql: ${TABLE}.reengaged_mau;;
    drill_fields: [drill_set1*]
  }

  measure: current_mau_sum {
    group_label: "Active User Measures"
    label: " Current MAU"
    description: "The current Monthly Active User count based on all users that performed an event in the last 30 days that do not fall into the first-time or reengaged MAU categories (on the last date the server logged user-level events.)."
    type: sum
    sql: ${TABLE}.current_mau;;
    drill_fields: [drill_set1*]
  }

  measure: total_events_sum {
    group_label: "Event Measures"
    label: "  Total Events"
    description: "The total number of events performed by all users associated with the server on the last date the server logged user-level events.."
    type: sum
    sql: ${TABLE}.total_events;;
    drill_fields: [drill_set1*]
  }

  measure: posts_sum {
    label: "  Posts"
    description: "The total number of posts performed by all users associated for all servers within the grouping."
    type: sum
    sql: ${max_posts} ;;
    drill_fields: [drill_set1*]
  }

  measure: channels_sum {
    label: "  Channels"
    description: "The total number of public, private, and direct message channels for all servers within the grouping."
    type: sum
    sql: ${direct_message_channels} + ${private_channels} + ${public_channels};;
    drill_fields: [drill_set1*]
  }

  measure: guest_accounts_sum {
    label: "  Guest Accounts"
    description: "The total number of guest accounts for all servers within the grouping."
    type: sum
    sql: ${guest_accounts};;
    drill_fields: [drill_set1*]
  }

  measure: teams_sum {
    label: "  Teams"
    description: "The total number of teams for all servers within the grouping."
    type: sum
    sql: ${teams};;
    drill_fields: [drill_set1*]
  }

  measure: web_app_events_sum {
    group_label: "Event Measures"
    label: "Web App Events"
    description: "The total number of Web App client events performed by all users associated with the server on the last date the server logged user-level events.."
    type: sum
    sql: ${TABLE}.web_app_events;;
    drill_fields: [drill_set1*]
  }

  measure: desktop_events_sum {
    group_label: "Event Measures"
    label: "Desktop Events"
    description: "The total number of Desktop client events performed by all users associated with the server on the last date the server logged user-level events.."
    type: sum
    sql: ${TABLE}.desktop_events;;
    drill_fields: [drill_set1*]
  }

  measure: mobile_events_sum {
    group_label: "Event Measures"
    label: "Mobile Events"
    description: "The total number of Mobile client events performed by all users associated with the server on the last date the server logged user-level events.."
    type: sum
    sql: ${TABLE}.mobile_events;;
    drill_fields: [drill_set1*]
  }

  measure: events_alltime_sum {
    group_label: "Event Measures"
    label: "  Total Events (All Time)"
    description: "The total number of events performed by all users associated with the server since the servers install date to the last current day (on the last date the server logged user-level events.)."
    type: sum
    sql: ${TABLE}.events_alltime;;
    drill_fields: [drill_set1*]
  }

  measure: mobile_events_alltime_sum {
    group_label: "Event Measures"
    label: " Mobile Events (All Time)"
    description: "The total number of mobile events performed by all users associated with the server since the servers install date to the last current day (on the last date the server logged user-level events.)."
    type: sum
    sql: ${TABLE}.mobile_events_alltime;;
  }

  measure: version_upgrade_sum {
    label: "Version Upgrades (Sum)"
    group_label: "Upgrade Measures"
    description: "The total number of server version upgrades performed across all servers i.e. number of times servers have been upgraded to a later version per grouping."
    type: sum
    sql: ${TABLE}.version_upgrade_count ;;
  }

  measure: edition_upgrade_sum {
    label: "Edition Upgrades (Sum)"
    group_label: "Upgrade Measures"
    description: "The total number of edition upgrades performed across all servers i.e. number of times servers have been upgraded from TE to E0 per grouping."
    type: sum
    sql: ${TABLE}.edition_upgrade_count ;;
  }

  measure: edition_upgrade_avg{
    label: "Avg. Edition Upgrades"
    group_label: "Upgrade Measures"
    description: "The average number of edition upgrades performed across all servers i.e. number of times servers have been upgraded from TE to E0 per grouping."
    type: average
    sql: ${TABLE}.edition_upgrade_count ;;
  }

  measure: version_upgrade_avg {
    label: "Avg. Version Upgrades"
    group_label: "Upgrade Measures"
    description: "The average number of server version upgrades performed across all servers i.e. number of times servers have been upgraded to a later version per grouping."
    type: average
    sql: ${TABLE}.version_upgrade_count ;;
  }

  measure: registered_users {
    description: "The sum of registered users associated with all servers in the current grouping."
    type: number
    sql: sum(${max_registered_users}) ;;
    drill_fields: [drill_set1*]
  }

  measure: retained_0day_user_sum {
    label: "0-Day Retained Users"
    description: "The sum of users that performed events within 0 & 24 hours of the instances first active timestamp across all servers in the current grouping."
    type: number
    sql: sum(${retention_0day_users}) ;;
    drill_fields: [drill_set1*]
  }

  measure: retained_1day_user_sum {
    label: "1-Day Retained Users"
    description: "The sum of users that performed events within 24 & 48 hours of the instances first active timestamp across all servers in the current grouping."
    type: number
    sql: sum(${retention_1day_users}) ;;
    drill_fields: [drill_set1*]
  }

  measure: retained_7day_user_sum {
    label: "7-Day Retained Users"
    description: "The sum of users that performed events within 168 & 192 hours of the instances first active timestamp across all servers in the current grouping."
    type: number
    sql: sum(${retention_7day_users}) ;;
    drill_fields: [drill_set1*]
  }

  measure: retained_14day_user_sum {
    label: "14-Day Retained Users"
    description: "The sum of users that performed events within 336 & 360 hours of the instances first active timestamp across all servers in the current grouping."
    type: number
    sql: sum(${retention_14day_users}) ;;
    drill_fields: [drill_set1*]
  }

  measure: retained_28day_user_sum {
    label: "28-Day Retained Users"
    description: "The sum of users that performed events within 672 & 696 hours of the instances first active timestamp across all servers in the current grouping."
    type: number
    sql: sum(${retention_28day_users}) ;;
    drill_fields: [drill_set1*]
  }

  measure: user_count {
    label: "User Count"
    group_label: "User Dimensions"
    description: "Sum of Users per Instance"
    type: number
    sql: sum(${max_active_user_count}) ;;
    drill_fields: [drill_set1*]
  }

  measure: server_version_list {
    label: "Server Versions"
    type: string
    sql: listagg(${server_version_major}, '; ') within group (order by ${server_version_major_sort} desc) ;;
    description: "A list of all server versions sorted from highest to lowest within the current grouping."
  }

  measure: customer_count {
    type: number
    sql: COUNT(DISTINCT CASE WHEN ${active_paying_customer} THEN ${company_name} ELSE NULL END) ;;
    hidden: yes
  }

  measure: mau_pct_licensed {
    label: "MAU % of Licensed Users"
    type: number
    sql: ${mau_sum}/${license_server_fact.users_sum_distinct} ;;
  }

  measure: avg_days_to_install_plugins {
    type: average
    sql: ${days_to_first_plugin_install} ;;
    value_format_name: decimal_1
  }

  measure: median_days_to_install_plugins {
    type: median
    sql: ${days_to_first_plugin_install} ;;
    value_format_name: decimal_1
  }

  measure: avg_plugins_downloaded {
    type: average
    sql: ${plugins_downloaded} ;;
    value_format_name: decimal_1
  }

  measure: median_plugins_downloaded {
    type: median
    sql: ${plugins_downloaded} ;;
    value_format_name: decimal_1
  }
}
