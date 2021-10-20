# This is the view file for the analytics.incident_collaboration.incident_daily_details table.
view: incident_daily_details {
  sql_table_name: incident_collaboration.incident_daily_details ;;
  view_label: "Playbooks Daily Details"

  # SET
  set: incident {
    fields: [license_server_fact.customer_id, license_server_fact.customer_name, product_edition, server_fact.server_version_major, plugin_version_major, server_id, playbooks_created_max, playbooks_edited_max, reported_incidents_max, acknowledged_incidents_max, resolved_incidents_max, archived_incidents_max, first_active_date_max, last_active_date_max, task_slash_commands_run_max, task_assignees_set_max]
  }

  dimension: age_days {
    description: "The number of days from the first active date to the given logging date."
    label: "Age (Days)"
    sql: datediff(day, ${incident_collaboration_fact.first_active_date}::date, ${logging_date}) ;;
    type: number
  }

  dimension: age_band {
    label: "Age Band (Days)"
    description: "Displays the age in days of the incident collaboaration instance bucketed into groupings. Age is calculated as days between the first active date (first date telemetry enabled) and given logging date of the record."
    type: tier
    style: integer
    tiers: [1,31,61,91,181,366,731]
    sql: ${age_days} ;;
  }

  measure: day_active {
    description: "The distinct count of days where the instance had >= 1 active user within the grouped dimension. Use the Incident Collaboration Fact for all-time active days if you do not want this number to be impacted by the grouped dimensions."
    type: count_distinct
    sql: CASE WHEN ${active} THEN ${logging_date} ELSE NULL END ;;
  }

  dimension: active {
    type: yesno
    description: "Boolean indicating the Mattermost Instance performed an Incident Collaboration action on the given logging date."
    sql: CASE WHEN ${daily_active_users} > 0 THEN TRUE ELSE FALSE END ;;
  }

  dimension: monthly_active {
    type: yesno
    description: "Boolean indicating the Mattermost Instance performed an Incident Collaboration w/in 30 days of the given logging date."
    sql: CASE WHEN ${monthly_active_users} > 0 THEN TRUE ELSE FALSE END ;;
  }

  dimension: weekly_active {
    type: yesno
    description: "Boolean indicating the Mattermost Instance performed an Incident Collaboration w/in 30 days of the given logging date."
    sql: CASE WHEN ${weekly_active_users} > 0 THEN TRUE ELSE FALSE END ;;
  }

  dimension: product_edition {
    label: " Product Edition"
    description: "The Mattermost SKU associated with the server on the given logging date."
    type: string
    sql: CASE WHEN ${license_server_fact.edition_null} IS NOT NULL AND NOT ${license_server_fact.trial} THEN ${license_server_fact.edition}
                      WHEN ${license_server_fact.edition} = 'Mattermost Cloud' THEN 'Mattermost Cloud'
                      WHEN ${license_server_fact.edition} IS NOT NULL AND ${license_server_fact.trial} THEN 'E20 Trial'
                      WHEN ${license_server_fact.customer_id} is not null and NOT ${license_server_fact.trial} THEN 'E10'
                      ELSE COALESCE(${server_daily_details.edition}, ${server_fact.server_edition})
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
                      WHEN ${license_server_fact.customer_id} is not null and NOT COALESCE(${license_server_fact.trial}, TRUE) THEN 'E10'
                      ELSE COALESCE(${server_daily_details.edition}, ${server_fact.server_edition})
                      END = 'E20' then 1
              WHEN CASE WHEN ${license_server_fact.edition} IS NOT NULL AND NOT ${license_server_fact.trial} THEN ${license_server_fact.edition}
                      WHEN ${license_server_fact.edition} = 'Mattermost Cloud' THEN 'Mattermost Cloud'
                      WHEN ${license_server_fact.edition} IS NOT NULL AND ${license_server_fact.trial} THEN 'E20 Trial'
                      WHEN ${license_server_fact.customer_id} is not null and NOT COALESCE(${license_server_fact.trial}, TRUE) THEN 'E10'
                      ELSE COALESCE(${server_daily_details.edition}, ${server_fact.server_edition})
                      END = 'E10' then 2
              WHEN CASE WHEN ${license_server_fact.edition} IS NOT NULL AND NOT ${license_server_fact.trial} THEN ${license_server_fact.edition}
                      WHEN ${license_server_fact.edition} = 'Mattermost Cloud' THEN 'Mattermost Cloud'
                      WHEN ${license_server_fact.edition} IS NOT NULL AND ${license_server_fact.trial} THEN 'E20 Trial'
                      WHEN ${license_server_fact.customer_id} is not null and NOT COALESCE(${license_server_fact.trial}, TRUE) THEN 'E10'
                      ELSE COALESCE(${server_daily_details.edition}, ${server_fact.server_edition})
                      END = 'E20 Trial' then 3
              WHEN CASE WHEN ${license_server_fact.edition} IS NOT NULL AND NOT ${license_server_fact.trial} THEN ${license_server_fact.edition}
                      WHEN ${license_server_fact.edition} = 'Mattermost Cloud' THEN 'Mattermost Cloud'
                      WHEN ${license_server_fact.edition} IS NOT NULL AND ${license_server_fact.trial} THEN 'E20 Trial'
                      WHEN ${license_server_fact.customer_id} is not null and NOT COALESCE(${license_server_fact.trial}, TRUE) THEN 'E10'
                      ELSE COALESCE(${server_daily_details.edition}, ${server_fact.server_edition})
                      END = 'E0' then 4
              WHEN CASE WHEN ${license_server_fact.edition} IS NOT NULL AND NOT ${license_server_fact.trial} THEN ${license_server_fact.edition}
                      WHEN ${license_server_fact.edition} = 'Mattermost Cloud' THEN 'Mattermost Cloud'
                      WHEN ${license_server_fact.edition} IS NOT NULL AND ${license_server_fact.trial} THEN 'E20 Trial'
                      WHEN ${license_server_fact.customer_id} is not null and NOT COALESCE(${license_server_fact.trial}, TRUE) THEN 'E10'
                      ELSE COALESCE(${server_daily_details.edition}, ${server_fact.server_edition})
                      END = 'Mattermost Cloud' then 5
              WHEN CASE WHEN ${license_server_fact.edition} IS NOT NULL AND NOT ${license_server_fact.trial} THEN ${license_server_fact.edition}
                      WHEN ${license_server_fact.edition} = 'Mattermost Cloud' THEN 'Mattermost Cloud'
                      WHEN ${license_server_fact.edition} IS NOT NULL AND ${license_server_fact.trial} THEN 'E20 Trial'
                      WHEN ${license_server_fact.customer_id} is not null and NOT COALESCE(${license_server_fact.trial}, TRUE) THEN 'E10'
                      ELSE COALESCE(${server_daily_details.edition}, ${server_fact.server_edition})
                      END = 'TE' then 6
              ELSE 7 END
                      ;;
  }

  dimension: current_version {
    description: "Boolean indicating the instance's Incident Collaboration Plugin Version is their current version at that point in time. (Last Version Date >= Date)."
    type: yesno
    sql: ${logging_date} <= ${last_version_date} and ${logging_date} >= ${first_version_date} and ${logging_date} <= ${last_active_date};;
  }

  dimension: cloud_workspace {
    description: "Boolean indicating the instance is a cloud workspace (instance's Cloud Installation ID is not null)."
    type: yesno
    sql: ${server_fact.installation_id} IS NOT NULL ;;
  }

  dimension: dev_server {
    description: "Boolean that evaluates to true when the pluginversion is in alpha (i.e. not released to GA) or the server version has not yet been released."
    type: yesno
    sql: CASE WHEN regexp_substr(${plugin_version}, '^[0-9]{1,2}.{1}[0-9]{1,2}.{1}[0-9]{1,2}$') IS NULL
            OR ${server_id} IN  ('ctjqfcwp9ig6xnfdtxz3mgk7uy','g6mwsqa5yibutnqfggp67fbs1w', '4k15shdyrfr39m9h675xy1pssw')
            OR
            (regexp_substr(${server_fact.version}, '^[0-9]{1,2}.{1}[0-9]{1,2}.{1}[0-9]{1,2}$') IS NULL
             AND
            regexp_substr(regexp_substr(${server_fact.version},'^[0-9]{1,2}.{1}[0-9]{1,2}.{1}[0-9]{1,2}.{1}[0-9]{1,2}.{1}[0-9]{1,2}.{1}[0-9]{1,2}'), '[0-9]{0,}[.]{1}[0-9[{0,}[.]{1}[0-9]{0,}[.]{1}[0-9]{0,}$') IS NULL
            AND NOT ${server_fact.cloud_server})
            THEN TRUE ELSE FALSE END ;;
  }

  dimension: dev_testing_enabled {
    label: "Developer/Testing Enabled"
    description: "Boolean that evaluates to true when the server has resported development or testing features enabled in their configuration telemetry."
    type: yesno
    sql: COALESCE(${server_fact.dev_testing_enabled}, FALSE) ;;
  }


  dimension: community_server {
    description: "Boolean indicating the server performing the event is the Mattermost Community server."
    type: yesno
    sql: CASE WHEN ${server_id} = '93mykbogbjfrbbdqphx3zhze5c' THEN TRUE ELSE FALSE END ;;
  }

  dimension: licensed_server {
    description: "Boolean indicating the server was licensed at the time the incident response telemetry was logged."
    type: yesno
    sql: CASE WHEN ${license_server_fact.license_id} IS NOT NULL THEN TRUE ELSE FALSE END ;;
  }

  dimension: last_day_of_week {
    description: "Boolean indicating the date is the most recent date or the last day of week."
    sql: ${logging_date} = last_day(${logging_date}::date, 'week') ;;
    type: yesno
  }

  dimension: last_day_of_month {
    description: "Boolean indicating the date is the most recent date or the last day of week."
    sql: CASE WHEN ${logging_date} = CURRENT_DATE - INTERVAL '1 DAY' THEN TRUE
          WHEN ${logging_date} = last_day(${logging_date}::date) THEN TRUE
          ELSE FALSE END;;
    type: yesno
  }

  # DIMENSIONS
  dimension: id {
    description: ""
    type: string
    sql: ${TABLE}.id ;;
    hidden: no
  }

  dimension: server_id {
    label: "Instance ID"
    description: ""
    type: string
    sql: ${TABLE}.server_id ;;
    hidden: no
  }

  dimension: plugin_version {
    group_label: "Plugin Version"
    description: ""
    type: string
    sql: ${TABLE}.plugin_version ;;
    hidden: no
  }

  dimension: plugin_version_major {
    label: "Plugin Version (Major)"
    group_label: "Plugin Version"
    description: ""
    type: string
    sql: SPLIT_PART(${plugin_version}, '.', 1) || '.' || SPLIT_PART(${plugin_version}, '.', 2) ;;
    hidden: no
  }

  dimension: playbooks {
    description: ""
    type: number
    sql: ${TABLE}.playbooks ;;
    hidden: no
  }

  dimension: playbooks_created {
    group_label: "All-Time Dimensions"
    description: ""
    type: number
    sql: ${TABLE}.playbooks_created_alltime ;;
    hidden: no
  }

  dimension: playbooks_edited {
    group_label: "All-Time Dimensions"
    description: ""
    type: number
    sql: ${TABLE}.playbooks_edited_alltime ;;
    hidden: no
  }

  dimension: playbooks_deleted {
    group_label: "All-Time Dimensions"
    description: ""
    type: number
    sql: ${TABLE}.playbooks_deleted_alltime ;;
    hidden: no
  }

  dimension: reported_incidents {
    group_label: "All-Time Dimensions"
    description: ""
    type: number
    sql: ${TABLE}.reported_incidents_alltime ;;
    hidden: no
  }

  dimension: acknowledged_incidents {
    group_label: "All-Time Dimensions"
    description: ""
    type: number
    sql: ${TABLE}.acknowledged_incidents_alltime ;;
    hidden: no
  }

  dimension: archived_incidents {
    group_label: "All-Time Dimensions"
    description: ""
    type: number
    sql: ${TABLE}.archived_incidents_alltime ;;
    hidden: no
  }

  dimension: resolved_incidents {
    group_label: "All-Time Dimensions"
    description: ""
    type: number
    sql: ${TABLE}.resolved_incidents_alltime ;;
    hidden: no
  }

  dimension: incident_contributors {
    group_label: "All-Time Dimensions"
    description: ""
    type: number
    sql: ${TABLE}.incident_contributors_alltime ;;
    hidden: no
  }

  dimension: status_updates {
    group_label: "All-Time Dimensions"
    description: ""
    type: number
    sql: ${TABLE}.status_updates_alltime ;;
    hidden: no
  }

  dimension: stages_changed {
    group_label: "All-Time Dimensions"
    description: ""
    type: number
    sql: ${TABLE}.stages_changed_alltime ;;
    hidden: no
  }

  dimension: timeline_events_added {
    description: ""
    group_label: "All-Time Dimensions"
    type: number
    sql: ${TABLE}.timeline_events_added_alltime ;;
    hidden: no
  }

  dimension: commanders_changed {
    group_label: "All-Time Dimensions"
    description: ""
    type: number
    sql: ${TABLE}.commanders_changed_alltime ;;
    hidden: no
  }

  dimension: timeline_tab_clicks {
    group_label: "All-Time Dimensions"
    description: ""
    type: number
    sql: ${TABLE}.timeline_tab_clicks_alltime ;;
    hidden: no
  }

  dimension: ended_incident {
    group_label: "All-Time Dimensions"
    description: ""
    type: number
    sql: ${TABLE}.ended_incident_alltime ;;
    hidden: no
  }

  dimension: restarted_incident {
    group_label: "All-Time Dimensions"
    description: ""
    type: number
    sql: ${TABLE}.restarted_incident_alltime ;;
    hidden: no
  }

  dimension: retros_published {
    group_label: "All-Time Dimensions"
    description: ""
    type: number
    sql: ${TABLE}.retrospectives_published_alltime ;;
    hidden: no
  }

  dimension: retro_updates {
    group_label: "All-Time Dimensions"
    description: ""
    type: number
    sql: ${TABLE}.retrospectives_updated_alltime ;;
    hidden: no
  }

  dimension: task_assignees_set {
    group_label: "All-Time Dimensions"
    description: ""
    type: number
    sql: ${TABLE}.task_assignees_set_alltime ;;
    hidden: no
  }

  dimension: task_states_modified {
    group_label: "All-Time Dimensions"
    description: ""
    type: number
    sql: ${TABLE}.task_states_modified_alltime ;;
    hidden: no
  }

  dimension: tasks_added {
    group_label: "All-Time Dimensions"
    description: ""
    type: number
    sql: ${TABLE}.tasks_added_alltime ;;
    hidden: no
  }

  dimension: tasks_removed {
    group_label: "All-Time Dimensions"
    description: ""
    type: number
    sql: ${TABLE}.tasks_removed_alltime ;;
    hidden: no
  }

  dimension: tasks_renamed {
    group_label: "All-Time Dimensions"
    description: ""
    type: number
    sql: ${TABLE}.tasks_renamed_alltime ;;
    hidden: no
  }

  dimension: task_slash_commands_run {
    group_label: "All-Time Dimensions"
    description: ""
    type: number
    sql: ${TABLE}.task_slash_commands_run_alltime ;;
    hidden: no
  }

  dimension: tasks_moved {
    group_label: "All-Time Dimensions"
    description: ""
    type: number
    sql: ${TABLE}.tasks_moved_alltime ;;
    hidden: no
  }

  dimension: playbooks_created_daily {
    group_label: "Daily Dimensions"
    description: ""
    type: number
    sql: ${TABLE}.playbooks_created ;;
    hidden: no
  }

  dimension: playbooks_edited_daily {
    group_label: "Daily Dimensions"
    description: ""
    type: number
    sql: ${TABLE}.playbooks_edited ;;
    hidden: no
  }

  dimension: playbooks_deleted_daily {
    group_label: "Daily Dimensions"
    description: ""
    type: number
    sql: ${TABLE}.playbooks_deleted ;;
    hidden: no
  }

  dimension: reported_incidents_daily {
    group_label: "Daily Dimensions"
    description: ""
    type: number
    sql: ${TABLE}.reported_incidents ;;
    hidden: no
  }

  dimension: acknowledged_incidents_daily {
    group_label: "Daily Dimensions"
    description: ""
    type: number
    sql: ${TABLE}.acknowledged_incidents ;;
    hidden: no
  }

  dimension: archived_incidents_daily {
    group_label: "Daily Dimensions"
    description: ""
    type: number
    sql: ${TABLE}.archived_incidents ;;
    hidden: no
  }

  dimension: resolved_incidents_daily {
    group_label: "Daily Dimensions"
    description: ""
    type: number
    sql: ${TABLE}.resolved_incidents ;;
    hidden: no
  }

  dimension: incident_contributors_daily {
    group_label: "Daily Dimensions"
    description: ""
    type: number
    sql: ${TABLE}.incident_contributors ;;
    hidden: no
  }

  dimension: status_updates_daily {
    group_label: "Daily Dimensions"
    description: ""
    type: number
    sql: ${TABLE}.status_updates ;;
    hidden: no
  }

  dimension: stages_changed_daily {
    group_label: "Daily Dimensions"
    description: ""
    type: number
    sql: ${TABLE}.stages_changed ;;
    hidden: no
  }

  dimension: timeline_events_added_daily {
    description: ""
    group_label: "Daily Dimensions"
    type: number
    sql: ${TABLE}.timeline_events_added ;;
    hidden: no
  }

  dimension: commanders_changed_daily {
    group_label: "Daily Dimensions"
    description: ""
    type: number
    sql: ${TABLE}.commanders_changed ;;
    hidden: no
  }

  dimension: timeline_tab_clicks_daily {
    group_label: "Daily Dimensions"
    description: ""
    type: number
    sql: ${TABLE}.timeline_tab_clicks ;;
    hidden: no
  }

  dimension: ended_incident_daily {
    group_label: "Daily Dimensions"
    description: ""
    type: number
    sql: ${TABLE}.ended_incident ;;
    hidden: no
  }

  dimension: restarted_incident_daily {
    group_label: "Daily Dimensions"
    description: ""
    type: number
    sql: ${TABLE}.restarted_incident ;;
    hidden: no
  }

  dimension: retros_published_daily {
    group_label: "Daily Dimensions"
    description: ""
    type: number
    sql: ${TABLE}.retrospectives_published ;;
    hidden: no
  }

  dimension: retro_updates_daily {
    group_label: "Daily Dimensions"
    description: ""
    type: number
    sql: ${TABLE}.retrospectives_updated ;;
    hidden: no
  }

  dimension: task_assignees_set_daily {
    group_label: "Daily Dimensions"
    description: ""
    type: number
    sql: ${TABLE}.task_assignees_set ;;
    hidden: no
  }

  dimension: task_states_modified_daily {
    group_label: "Daily Dimensions"
    description: ""
    type: number
    sql: ${TABLE}.task_states_modified ;;
    hidden: no
  }

  dimension: tasks_added_daily {
    group_label: "Daily Dimensions"
    description: ""
    type: number
    sql: ${TABLE}.tasks_added ;;
    hidden: no
  }

  dimension: tasks_removed_daily_daily {
    group_label: "Daily Dimensions"
    description: ""
    type: number
    sql: ${TABLE}.tasks_removed ;;
    hidden: no
  }

  dimension: tasks_renamed_daily {
    group_label: "Daily Dimensions"
    description: ""
    type: number
    sql: ${TABLE}.tasks_renamed ;;
    hidden: no
  }

  dimension: task_slash_commands_run_daily {
    group_label: "Daily Dimensions"
    description: ""
    type: number
    sql: ${TABLE}.task_slash_commands_run ;;
    hidden: no
  }

  dimension: tasks_moved_daily {
    group_label: "Daily Dimensions"
    description: ""
    type: number
    sql: ${TABLE}.tasks_moved ;;
    hidden: no
  }
  dimension: daily_active_users {
    group_label: "Active User Dimensions"
    type: number
    description: "The count of distinct users that performed an Incident Collaboration on the given logging date."
    sql: ${TABLE}.daily_active_users ;;
  }

  dimension: weekly_active_users {
    type: number
    group_label: "Active User Dimensions"
    description: "The count of distinct users that performed an Incident Collaboration within 7 days of the given logging date."
    sql: ${TABLE}.weekly_active_users ;;
  }

  dimension: monthly_active_users {
    group_label: "Active User Dimensions"
    type: number
    description: "The count of distinct users that performed an Incident Collaboration within 30 days of the given logging date."
    sql: ${TABLE}.monthly_active_users ;;
  }

  dimension: version_users_to_date {
    type: number
    description: "The count of distinct users that have performed at least one Incident Collaboration event on the plugin version on or before the given logging date."
    sql: ${TABLE}.version_users_to_date ;;
  }


  # DIMENSION GROUPS/DATES
  dimension_group: logging {
    description: ""
    type: time
    timeframes: [week, date, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.date ;;
    hidden: no
  }

  dimension_group: first_version {
    description: ""
    type: time
    timeframes: [week, date, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.first_version_date ;;
    hidden: no
  }

  dimension_group: last_version {
    description: ""
    type: time
    timeframes: [week, date, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.last_version_date ;;
    hidden: no
  }

  dimension: latest_records {
    description: "Indicates the record displayed is the latest record for each version that instance and prevents fanning out of sums, averages, etc."
    type: yesno
    sql: ${logging_date}::date = ${last_version_date}::date ;;
  }

  dimension: current_record {
    description: "Indicates the record displayed is the between the first and last version date of the instance for (reporting purposes especially active user reporting)."
    type: yesno
    sql: ${logging_date}::date <= ${last_version_date}::date and ${logging_date} >= ${first_version_date};;
  }

  dimension_group: first_active {
    description: ""
    type: time
    timeframes: [time, week, date, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.first_active ;;
    hidden: no
  }

  dimension_group: last_active {
    description: ""
    type: time
    timeframes: [time, week, date, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.last_active ;;
    hidden: no
  }

  measure: last_active_date_max{
    group_label: "Active Date Measures (Min & Max)"
    label: "Last Active Date (Max)"
    description: ""
    type: date
    sql: MAX(${last_active_date}::date) ;;
    hidden: no
  }

  measure: first_active_date_max{
    group_label: "Active Date Measures (Min & Max)"
    label: "First Active Date (Max)"
    description: ""
    type: date
    sql: MAX(${first_active_date}::date) ;;
    hidden: no
  }


  # MEASURES
  measure: count {
    description: "Count of rows/occurrences."
    type: count
    drill_fields: [incident*]
  }

  measure: id_count {
    label: " Id Count"
    description: "The distinct count of Incident Daily Details Id within each grouping."
    type: count_distinct
    sql: ${id} ;;
    drill_fields: [incident*]
  }

  measure: server_count {
    label: " Incident Collaboration Instances"
    group_label: "Instance Counts"
    description: "The distinct count of Incident Daily Details Servers within each grouping."
    type: count_distinct
    sql: ${server_id} ;;
    drill_fields: [incident*]
  }


  measure: monthly_active_instance_count {
    label: "Monthly Acitve IC Instance (MAICI)"
    group_label: "Instance Counts"
    type: count_distinct
    sql: CASE WHEN ${monthly_active_users} > 0 THEN ${server_id} ELSE NULL END ;;
  }

  measure: daily_active_instance_count {
    label: "Daily Acitve IC Instance (DAICI)"
    group_label: "Instance Counts"
    type: count_distinct
    sql: CASE WHEN ${daily_active_users} > 0 THEN ${server_id} ELSE NULL END ;;
  }

  measure: weekly_active_instance_count {
    label: "Weekly Acitve IC Instance (DAICI)"
    group_label: "Instance Counts"
    type: count_distinct
    sql: CASE WHEN ${weekly_active_users} > 0 THEN ${server_id} ELSE NULL END ;;
  }

  measure: playbooks_sum {
    description: "The Sum of Playbook."
    type: sum
    group_label: "Playbooks Measures"
    sql: ${playbooks} ;;
    drill_fields: [incident*]
  }

  measure: playbooks_created_edited {
    description: "The sum of playbook create and edit events."
    label: "Playbooks Created/Edited Sum"
    group_label: "Playbooks Measures"
    sql: ${playbooks_created_sum} + ${playbooks_edited_sum} ;;
    type: number
    drill_fields: [incident*]
  }

  measure: playbooks_max {
    description: "The Max. Playbook."
    type: max
    group_label: "Playbooks Measures"
    sql: ${playbooks} ;;
    drill_fields: [incident*]
  }

  measure: playbooks_min {
    description: "The Min. Playbook."
    type: min
    group_label: "Playbooks Measures"
    sql: ${playbooks} ;;
    drill_fields: [incident*]
  }

  measure: playbooks_avg {
    description: "The Average Playbook."
    type: average
    group_label: "Playbooks Measures"
    sql: ${playbooks} ;;
    drill_fields: [incident*]
  }

  measure: playbooks_median {
    description: "The Median Playbook."
    type: median
    group_label: "Playbooks Measures"
    sql: ${playbooks} ;;
    drill_fields: [incident*]
  }

  measure: instances_with_playbooks_created {
    description: "The distinct count of instances that have Playbooks Created."
    label: "Instances w/ Playbooks Created"
    type: count_distinct
    group_label: "Instance Counts (All-Time)"
    sql: CASE WHEN ${playbooks_created} > 0 THEN ${server_id} ELSE NULL END ;;
    drill_fields: [incident*]
  }

  measure: instances_with_playbooks_created_edited {
    description: "The distinct count of instances that have Playbooks Created."
    label: "Instances w/ Playbooks Created/Edited"
    type: count_distinct
    group_label: "Instance Counts (All-Time)"
    sql: CASE WHEN ${playbooks_created} > 0 or ${playbooks_edited} > 0 THEN ${server_id} ELSE NULL END ;;
    drill_fields: [incident*]
  }

  measure: playbooks_created_sum {
    description: "The Sum of Playbooks Created."
    type: sum
    group_label: "Playbooks Created Measures"
    sql: ${playbooks_created} ;;
    drill_fields: [incident*]
  }

  measure: playbooks_created_max {
    description: "The Max. Playbooks Created."
    type: max
    group_label: "Playbooks Created Measures"
    sql: ${playbooks_created} ;;
    drill_fields: [incident*]
  }

  measure: playbooks_created_min {
    description: "The Min. Playbooks Created."
    type: min
    group_label: "Playbooks Created Measures"
    sql: ${playbooks_created} ;;
    drill_fields: [incident*]
  }

  measure: playbooks_created_avg {
    description: "The Average Playbooks Created."
    type: average
    group_label: "Playbooks Created Measures"
    sql: ${playbooks_created} ;;
    drill_fields: [incident*]
  }

  measure: playbooks_created_median {
    description: "The Median Playbooks Created."
    type: median
    group_label: "Playbooks Created Measures"
    sql: ${playbooks_created} ;;
    drill_fields: [incident*]
  }

  measure: instances_with_playbooks_edited {
    description: "The distinct count of instances that have Playbooks Edited."
    label: "Instances w/ Playbooks Edited"
    type: count_distinct
    group_label: "Instance Counts (All-Time)"
    sql: CASE WHEN ${playbooks_edited} > 0 THEN ${server_id} ELSE NULL END ;;
    drill_fields: [incident*]
  }

  measure: playbooks_edited_sum {
    description: "The Sum of Playbooks Edited."
    type: sum
    group_label: "Playbooks Edited Measures"
    sql: ${playbooks_edited} ;;
    drill_fields: [incident*]
  }

  measure: playbooks_edited_max {
    description: "The Max. Playbooks Edited."
    type: max
    group_label: "Playbooks Edited Measures"
    sql: ${playbooks_edited} ;;
    drill_fields: [incident*]
  }

  measure: playbooks_edited_min {
    description: "The Min. Playbooks Edited."
    type: min
    group_label: "Playbooks Edited Measures"
    sql: ${playbooks_edited} ;;
    drill_fields: [incident*]
  }

  measure: playbooks_edited_avg {
    description: "The Average Playbooks Edited."
    type: average
    group_label: "Playbooks Edited Measures"
    sql: ${playbooks_edited} ;;
    drill_fields: [incident*]
  }

  measure: playbooks_edited_median {
    description: "The Median Playbooks Edited."
    type: median
    group_label: "Playbooks Edited Measures"
    sql: ${playbooks_edited} ;;
    drill_fields: [incident*]
  }

  measure: instances_with_playbooks_deleted {
    description: "The distinct count of instances that have Playbooks Deleted."
    label: "Instances w/ Playbooks Deleted"
    type: count_distinct
    group_label: "Instance Counts (All-Time)"
    sql: CASE WHEN ${playbooks_deleted} > 0 THEN ${server_id} ELSE NULL END ;;
    drill_fields: [incident*]
  }

  measure: playbooks_deleted_sum {
    description: "The Sum of Playbooks Deleted."
    type: sum
    group_label: "Playbooks Deleted Measures"
    sql: ${playbooks_deleted} ;;
    drill_fields: [incident*]
  }

  measure: playbooks_deleted_max {
    description: "The Max. Playbooks Deleted."
    type: max
    group_label: "Playbooks Deleted Measures"
    sql: ${playbooks_deleted} ;;
    drill_fields: [incident*]
  }

  measure: playbooks_deleted_min {
    description: "The Min. Playbooks Deleted."
    type: min
    group_label: "Playbooks Deleted Measures"
    sql: ${playbooks_deleted} ;;
    drill_fields: [incident*]
  }

  measure: playbooks_deleted_avg {
    description: "The Average Playbooks Deleted."
    type: average
    group_label: "Playbooks Deleted Measures"
    sql: ${playbooks_deleted} ;;
    drill_fields: [incident*]
  }

  measure: playbooks_deleted_median {
    description: "The Median Playbooks Deleted."
    type: median
    group_label: "Playbooks Deleted Measures"
    sql: ${playbooks_deleted} ;;
    drill_fields: [incident*]
  }

  measure: instances_with_reported_incidents {
    description: "The distinct count of instances that have Reported Incidents."
    label: "Instances w/ Reported Incidents"
    type: count_distinct
    group_label: "Instance Counts (All-Time)"
    sql: CASE WHEN ${reported_incidents} > 0 THEN ${server_id} ELSE NULL END ;;
    drill_fields: [incident*]
  }

  measure: reported_incidents_sum {
    description: "The Sum of Reported Incidents."
    type: sum
    group_label: "Reported Incidents Measures"
    sql: ${reported_incidents} ;;
    drill_fields: [incident*]
  }

  measure: reported_incidents_max {
    description: "The Max. Reported Incidents."
    type: max
    group_label: "Reported Incidents Measures"
    sql: ${reported_incidents} ;;
    drill_fields: [incident*]
  }

  measure: reported_incidents_min {
    description: "The Min. Reported Incidents."
    type: min
    group_label: "Reported Incidents Measures"
    sql: ${reported_incidents} ;;
    drill_fields: [incident*]
  }

  measure: reported_incidents_avg {
    description: "The Average Reported Incidents."
    type: average
    group_label: "Reported Incidents Measures"
    sql: ${reported_incidents} ;;
    drill_fields: [incident*]
  }

  measure: reported_incidents_median {
    description: "The Median Reported Incidents."
    type: median
    group_label: "Reported Incidents Measures"
    sql: ${reported_incidents} ;;
    drill_fields: [incident*]
  }

  measure: instances_with_acknowledged_incidents {
    description: "The distinct count of instances that have Acknowledged Incidents."
    label: "Instances w/ Acknowledged Incidents"
    type: count_distinct
    group_label: "Instance Counts (All-Time)"
    sql: CASE WHEN ${acknowledged_incidents} > 0 THEN ${server_id} ELSE NULL END ;;
    drill_fields: [incident*]
  }

  measure: acknowledged_incidents_sum {
    description: "The Sum of Acknowledged Incidents."
    type: sum
    group_label: "Acknowledged Incidents Measures"
    sql: ${acknowledged_incidents} ;;
    drill_fields: [incident*]
  }

  measure: acknowledged_incidents_max {
    description: "The Max. Acknowledged Incidents."
    type: max
    group_label: "Acknowledged Incidents Measures"
    sql: ${acknowledged_incidents} ;;
    drill_fields: [incident*]
  }

  measure: acknowledged_incidents_min {
    description: "The Min. Acknowledged Incidents."
    type: min
    group_label: "Acknowledged Incidents Measures"
    sql: ${acknowledged_incidents} ;;
    drill_fields: [incident*]
  }

  measure: acknowledged_incidents_avg {
    description: "The Average Acknowledged Incidents."
    type: average
    group_label: "Acknowledged Incidents Measures"
    sql: ${acknowledged_incidents} ;;
    drill_fields: [incident*]
  }

  measure: acknowledged_incidents_median {
    description: "The Median Acknowledged Incidents."
    type: median
    group_label: "Acknowledged Incidents Measures"
    sql: ${acknowledged_incidents} ;;
    drill_fields: [incident*]
  }

  measure: instances_with_archived_incidents {
    description: "The distinct count of instances that have Archived Incidents."
    label: "Instances w/ Archived Incidents"
    type: count_distinct
    group_label: "Instance Counts (All-Time)"
    sql: CASE WHEN ${archived_incidents} > 0 THEN ${server_id} ELSE NULL END ;;
    drill_fields: [incident*]
  }

  measure: instances_with_retros_published {
    description: "The distinct count of instances that have published a retrospective."
    label: "Instances w/ Retros Published"
    type: count_distinct
    group_label: "Instance Counts (All-Time)"
    sql: CASE WHEN ${retros_published} > 0 THEN ${server_id} ELSE NULL END ;;
    drill_fields: [incident*]
  }

  measure: instances_with_retro_updates {
    description: "The distinct count of instances that have updated a retrospective."
    label: "Instances w/ Retro Updates"
    type: count_distinct
    group_label: "Instance Counts (All-Time)"
    sql: CASE WHEN ${retro_updates} > 0 THEN ${server_id} ELSE NULL END ;;
    drill_fields: [incident*]
  }

  measure: instances_with_status_updates {
    description: "The distinct count of instances that have updated a retrospective."
    label: "Instances w/ Status Updates"
    type: count_distinct
    group_label: "Instance Counts (All-Time)"
    sql: CASE WHEN ${status_updates} > 0 THEN ${server_id} ELSE NULL END ;;
    drill_fields: [incident*]
  }

  measure: archived_incidents_sum {
    description: "The Sum of Archived Incidents."
    type: sum
    group_label: "Archived Incidents Measures"
    sql: ${archived_incidents} ;;
    drill_fields: [incident*]
  }

  measure: archived_incidents_max {
    description: "The Max. Archived Incidents."
    type: max
    group_label: "Archived Incidents Measures"
    sql: ${archived_incidents} ;;
    drill_fields: [incident*]
  }

  measure: archived_incidents_min {
    description: "The Min. Archived Incidents."
    type: min
    group_label: "Archived Incidents Measures"
    sql: ${archived_incidents} ;;
    drill_fields: [incident*]
  }

  measure: archived_incidents_avg {
    description: "The Average Archived Incidents."
    type: average
    group_label: "Archived Incidents Measures"
    sql: ${archived_incidents} ;;
    drill_fields: [incident*]
  }

  measure: archived_incidents_median {
    description: "The Median Archived Incidents."
    type: median
    group_label: "Archived Incidents Measures"
    sql: ${archived_incidents} ;;
    drill_fields: [incident*]
  }

  measure: instances_with_resolved_incidents {
    description: "The distinct count of instances that have Resolved Incidents."
    label: "Instances w/ Resolved Incidents"
    type: count_distinct
    group_label: "Instance Counts (All-Time)"
    sql: CASE WHEN ${resolved_incidents} > 0 THEN ${server_id} ELSE NULL END ;;
    drill_fields: [incident*]
  }

  measure: resolved_incidents_sum {
    description: "The Sum of Resolved Incidents."
    type: sum
    group_label: "Resolved Incidents Measures"
    sql: ${resolved_incidents} ;;
    drill_fields: [incident*]
  }

  measure: resolved_incidents_max {
    description: "The Max. Resolved Incidents."
    type: max
    group_label: "Resolved Incidents Measures"
    sql: ${resolved_incidents} ;;
    drill_fields: [incident*]
  }

  measure: resolved_incidents_min {
    description: "The Min. Resolved Incidents."
    type: min
    group_label: "Resolved Incidents Measures"
    sql: ${resolved_incidents} ;;
    drill_fields: [incident*]
  }

  measure: resolved_incidents_avg {
    description: "The Average Resolved Incidents."
    type: average
    group_label: "Resolved Incidents Measures"
    sql: ${resolved_incidents} ;;
    drill_fields: [incident*]
  }

  measure: resolved_incidents_median {
    description: "The Median Resolved Incidents."
    type: median
    group_label: "Resolved Incidents Measures"
    sql: ${resolved_incidents} ;;
    drill_fields: [incident*]
  }

  measure: incident_contributors_sum {
    description: "The Sum of Incident Contributors."
    type: sum
    group_label: "Incident Contributors Measures"
    sql: ${incident_contributors} ;;
    drill_fields: [incident*]
  }

  measure: incident_contributors_max {
    description: "The Max. Incident Contributors."
    type: max
    group_label: "Incident Contributors Measures"
    sql: ${incident_contributors} ;;
    drill_fields: [incident*]
  }

  measure: incident_contributors_min {
    description: "The Min. Incident Contributors."
    type: min
    group_label: "Incident Contributors Measures"
    sql: ${incident_contributors} ;;
    drill_fields: [incident*]
  }

  measure: incident_contributors_avg {
    description: "The Average Incident Contributors."
    type: average
    group_label: "Incident Contributors Measures"
    sql: ${incident_contributors} ;;
    drill_fields: [incident*]
  }

  measure: incident_contributors_median {
    description: "The Median Incident Contributors."
    type: median
    group_label: "Incident Contributors Measures"
    sql: ${incident_contributors} ;;
    drill_fields: [incident*]
  }

  measure: status_updates_sum {
    description: "The Sum of Status Updates."
    type: sum
    group_label: "Status Updates Measures"
    sql: ${status_updates} ;;
    drill_fields: [incident*]
  }

  measure: status_updates_max {
    description: "The Max. Status Updates."
    type: max
    group_label: "Status Updates Measures"
    sql: ${status_updates} ;;
    drill_fields: [incident*]
  }

  measure: status_updates_min {
    description: "The Min. Status Updates."
    type: min
    group_label: "Status Updates Measures"
    sql: ${status_updates} ;;
    drill_fields: [incident*]
  }

  measure: status_updates_avg {
    description: "The Average Status Updates."
    type: average
    group_label: "Status Updates Measures"
    sql: ${status_updates} ;;
    drill_fields: [incident*]
  }

  measure: status_updates_median {
    description: "The Median Status Updates."
    type: median
    group_label: "Status Updates Measures"
    sql: ${status_updates} ;;
    drill_fields: [incident*]
  }

  measure: stages_changed_sum {
    description: "The Sum of Stages Changed."
    type: sum
    group_label: "Stages Changed Measures"
    sql: ${stages_changed} ;;
    drill_fields: [incident*]
  }

  measure: stages_changed_max {
    description: "The Max. Stages Changed."
    type: max
    group_label: "Stages Changed Measures"
    sql: ${stages_changed} ;;
    drill_fields: [incident*]
  }

  measure: stages_changed_min {
    description: "The Min. Stages Changed."
    type: min
    group_label: "Stages Changed Measures"
    sql: ${stages_changed} ;;
    drill_fields: [incident*]
  }

  measure: stages_changed_avg {
    description: "The Average Stages Changed."
    type: average
    group_label: "Stages Changed Measures"
    sql: ${stages_changed} ;;
    drill_fields: [incident*]
  }

  measure: stages_changed_median {
    description: "The Median Stages Changed."
    type: median
    group_label: "Stages Changed Measures"
    sql: ${stages_changed} ;;
    drill_fields: [incident*]
  }

  measure: timeline_events_added_sum {
    description: "The Sum of Timeline Events Added."
    type: sum
    group_label: "Timeline Events Added Measures"
    sql: ${timeline_events_added} ;;
    drill_fields: [incident*]
  }

  measure: timeline_events_added_max {
    description: "The Max. Timeline Events Added."
    type: max
    group_label: "Timeline Events Added Measures"
    sql: ${timeline_events_added} ;;
    drill_fields: [incident*]
  }

  measure: timeline_events_added_min {
    description: "The Min. Timeline Events Added."
    type: min
    group_label: "Timeline Events Added Measures"
    sql: ${timeline_events_added} ;;
    drill_fields: [incident*]
  }

  measure: timeline_events_added_avg {
    description: "The Average Timeline Events Added."
    type: average
    group_label: "Timeline Events Added Measures"
    sql: ${timeline_events_added} ;;
    drill_fields: [incident*]
  }

  measure: timeline_events_added_median {
    description: "The Median Timeline Events Added."
    type: median
    group_label: "Timeline Events Added Measures"
    sql: ${timeline_events_added} ;;
    drill_fields: [incident*]
  }

  measure: commanders_changed_sum {
    description: "The Sum of Commanders Changed."
    type: sum
    group_label: "Commanders Changed Measures"
    sql: ${commanders_changed} ;;
    drill_fields: [incident*]
  }

  measure: commanders_changed_max {
    description: "The Max. Commanders Changed."
    type: max
    group_label: "Commanders Changed Measures"
    sql: ${commanders_changed} ;;
    drill_fields: [incident*]
  }

  measure: commanders_changed_min {
    description: "The Min. Commanders Changed."
    type: min
    group_label: "Commanders Changed Measures"
    sql: ${commanders_changed} ;;
    drill_fields: [incident*]
  }

  measure: commanders_changed_avg {
    description: "The Average Commanders Changed."
    type: average
    group_label: "Commanders Changed Measures"
    sql: ${commanders_changed} ;;
    drill_fields: [incident*]
  }

  measure: commanders_changed_median {
    description: "The Median Commanders Changed."
    type: median
    group_label: "Commanders Changed Measures"
    sql: ${commanders_changed} ;;
    drill_fields: [incident*]
  }

  measure: timeline_tab_clicks_sum {
    description: "The Sum of Timeline Tab Clicks."
    type: sum
    group_label: "Timeline Tab Clicks Measures"
    sql: ${timeline_tab_clicks} ;;
    drill_fields: [incident*]
  }

  measure: timeline_tab_clicks_max {
    description: "The Max. Timeline Tab Clicks."
    type: max
    group_label: "Timeline Tab Clicks Measures"
    sql: ${timeline_tab_clicks} ;;
    drill_fields: [incident*]
  }

  measure: timeline_tab_clicks_min {
    description: "The Min. Timeline Tab Clicks."
    type: min
    group_label: "Timeline Tab Clicks Measures"
    sql: ${timeline_tab_clicks} ;;
    drill_fields: [incident*]
  }

  measure: timeline_tab_clicks_avg {
    description: "The Average Timeline Tab Clicks."
    type: average
    group_label: "Timeline Tab Clicks Measures"
    sql: ${timeline_tab_clicks} ;;
    drill_fields: [incident*]
  }

  measure: timeline_tab_clicks_median {
    description: "The Median Timeline Tab Clicks."
    type: median
    group_label: "Timeline Tab Clicks Measures"
    sql: ${timeline_tab_clicks} ;;
    drill_fields: [incident*]
  }

  measure: ended_incident_sum {
    description: "The Sum of Ended Incidents."
    type: sum
    group_label: "Ended Incident Measures"
    sql: ${ended_incident} ;;
    drill_fields: [incident*]
  }

  measure: ended_incident_max {
    description: "The Max. Ended Incidents."
    type: max
    group_label: "Ended Incident Measures"
    sql: ${ended_incident} ;;
    drill_fields: [incident*]
  }

  measure: ended_incident_min {
    description: "The Min. Ended Incidents."
    type: min
    group_label: "Ended Incident Measures"
    sql: ${ended_incident} ;;
    drill_fields: [incident*]
  }

  measure: ended_incident_avg {
    description: "The Average Ended Incidents."
    type: average
    group_label: "Ended Incident Measures"
    sql: ${ended_incident} ;;
    drill_fields: [incident*]
  }

  measure: ended_incident_median {
    description: "The Median Ended Incidents."
    type: median
    group_label: "Ended Incident Measures"
    sql: ${ended_incident} ;;
    drill_fields: [incident*]
  }

  measure: restarted_incident_sum {
    description: "The Sum of Restarted Incidents."
    type: sum
    group_label: "Restarted Incident Measures"
    sql: ${restarted_incident} ;;
    drill_fields: [incident*]
  }

  measure: restarted_incident_max {
    description: "The Max. Restarted Incidents."
    type: max
    group_label: "Restarted Incident Measures"
    sql: ${restarted_incident} ;;
    drill_fields: [incident*]
  }

  measure: restarted_incident_min {
    description: "The Min. Restarted Incidents."
    type: min
    group_label: "Restarted Incident Measures"
    sql: ${restarted_incident} ;;
    drill_fields: [incident*]
  }

  measure: restarted_incident_avg {
    description: "The Average Restarted Incidents."
    type: average
    group_label: "Restarted Incident Measures"
    sql: ${restarted_incident} ;;
    drill_fields: [incident*]
  }

  measure: restarted_incident_median {
    description: "The Median Restarted Incidents."
    type: median
    group_label: "Restarted Incident Measures"
    sql: ${restarted_incident} ;;
    drill_fields: [incident*]
  }

  measure: retros_published_sum {
    description: "The Sum of total number of retrospectives published within the grouped dimension(s)."
    type: sum
    group_label: "Retrospective Measures"
    sql: ${retros_published} ;;
    drill_fields: [incident*]
  }

  measure: retros_published_max {
    description: "The Max. number of retrospectives published by an instance within the grouped dimension(s)."
    type: max
    group_label: "Retrospective Measures"
    sql: ${retros_published} ;;
    drill_fields: [incident*]
  }

  measure: retros_published_min {
    description: "The Min. number of retrospectives published by an instance within the grouped dimension(s)."
    type: min
    group_label: "Retrospective Measures"
    sql: ${retros_published} ;;
    drill_fields: [incident*]
  }

  measure: retros_published_avg {
    description: "The Average number of retrospectives published by an instance within the grouped dimension(s)."
    type: average
    group_label: "Retrospective Measures"
    sql: ${retros_published} ;;
    drill_fields: [incident*]
  }

  measure: retros_published_median {
    description: "The Median number of retrospectives published by an instance within the grouped dimension(s)."
    type: median
    group_label: "Retrospective Measures"
    sql: ${retros_published} ;;
    drill_fields: [incident*]
  }

  measure: retro_updates_sum {
    description: "The Sum of total number of retrospective updates within the grouped dimension(s)."
    type: sum
    group_label: "Retrospective Measures"
    sql: ${retro_updates} ;;
    drill_fields: [incident*]
  }

  measure: retro_updates_max {
    description: "The Max. number of retrospective updates by an instance within the grouped dimension(s)."
    type: max
    group_label: "Retrospective Measures"
    sql: ${retro_updates} ;;
    drill_fields: [incident*]
  }

  measure: retro_updates_min {
    description: "The Min. number of retrospective updates by an instance within the grouped dimension(s)."
    type: min
    group_label: "Retrospective Measures"
    sql: ${retro_updates} ;;
    drill_fields: [incident*]
  }

  measure: retro_updates_avg {
    description: "The Average number of retrospective updates by an instance within the grouped dimension(s)."
    type: average
    group_label: "Retrospective Measures"
    sql: ${retro_updates} ;;
    drill_fields: [incident*]
  }

  measure: retro_updates_median {
    description: "The Median number of retrospective updates by an instance within the grouped dimension(s)."
    type: median
    group_label: "Retrospective Measures"
    sql: ${retro_updates} ;;
    drill_fields: [incident*]
  }

  measure: task_assignees_set_sum {
    description: "The Sum of Task Assignees Set."
    type: sum
    group_label: "Task Assignees Set Measures"
    sql: ${task_assignees_set} ;;
    drill_fields: [incident*]
  }

  measure: task_assignees_set_max {
    description: "The Max. Task Assignees Set."
    type: max
    group_label: "Task Assignees Set Measures"
    sql: ${task_assignees_set} ;;
    drill_fields: [incident*]
  }

  measure: task_assignees_set_min {
    description: "The Min. Task Assignees Set."
    type: min
    group_label: "Task Assignees Set Measures"
    sql: ${task_assignees_set} ;;
    drill_fields: [incident*]
  }

  measure: task_assignees_set_avg {
    description: "The Average Task Assignees Set."
    type: average
    group_label: "Task Assignees Set Measures"
    sql: ${task_assignees_set} ;;
    drill_fields: [incident*]
  }

  measure: task_assignees_set_median {
    description: "The Median Task Assignees Set."
    type: median
    group_label: "Task Assignees Set Measures"
    sql: ${task_assignees_set} ;;
    drill_fields: [incident*]
  }

  measure: task_states_modified_sum {
    description: "The Sum of Task States Modified."
    type: sum
    group_label: "Task States Modified Measures"
    sql: ${task_states_modified} ;;
    drill_fields: [incident*]
  }

  measure: task_states_modified_max {
    description: "The Max. Task States Modified."
    type: max
    group_label: "Task States Modified Measures"
    sql: ${task_states_modified} ;;
    drill_fields: [incident*]
  }

  measure: task_states_modified_min {
    description: "The Min. Task States Modified."
    type: min
    group_label: "Task States Modified Measures"
    sql: ${task_states_modified} ;;
    drill_fields: [incident*]
  }

  measure: task_states_modified_avg {
    description: "The Average Task States Modified."
    type: average
    group_label: "Task States Modified Measures"
    sql: ${task_states_modified} ;;
    drill_fields: [incident*]
  }

  measure: task_states_modified_median {
    description: "The Median Task States Modified."
    type: median
    group_label: "Task States Modified Measures"
    sql: ${task_states_modified} ;;
    drill_fields: [incident*]
  }

  measure: tasks_added_sum {
    description: "The Sum of Tasks Added."
    type: sum
    group_label: "Tasks Added Measures"
    sql: ${tasks_added} ;;
    drill_fields: [incident*]
  }

  measure: tasks_added_max {
    description: "The Max. Tasks Added."
    type: max
    group_label: "Tasks Added Measures"
    sql: ${tasks_added} ;;
    drill_fields: [incident*]
  }

  measure: tasks_added_min {
    description: "The Min. Tasks Added."
    type: min
    group_label: "Tasks Added Measures"
    sql: ${tasks_added} ;;
    drill_fields: [incident*]
  }

  measure: tasks_added_avg {
    description: "The Average Tasks Added."
    type: average
    group_label: "Tasks Added Measures"
    sql: ${tasks_added} ;;
    drill_fields: [incident*]
  }

  measure: tasks_added_median {
    description: "The Median Tasks Added."
    type: median
    group_label: "Tasks Added Measures"
    sql: ${tasks_added} ;;
    drill_fields: [incident*]
  }

  measure: tasks_removed_sum {
    description: "The Sum of Tasks Removed."
    type: sum
    group_label: "Tasks Removed Measures"
    sql: ${tasks_removed} ;;
    drill_fields: [incident*]
  }

  measure: tasks_removed_max {
    description: "The Max. Tasks Removed."
    type: max
    group_label: "Tasks Removed Measures"
    sql: ${tasks_removed} ;;
    drill_fields: [incident*]
  }

  measure: tasks_removed_min {
    description: "The Min. Tasks Removed."
    type: min
    group_label: "Tasks Removed Measures"
    sql: ${tasks_removed} ;;
    drill_fields: [incident*]
  }

  measure: tasks_removed_avg {
    description: "The Average Tasks Removed."
    type: average
    group_label: "Tasks Removed Measures"
    sql: ${tasks_removed} ;;
    drill_fields: [incident*]
  }

  measure: tasks_removed_median {
    description: "The Median Tasks Removed."
    type: median
    group_label: "Tasks Removed Measures"
    sql: ${tasks_removed} ;;
    drill_fields: [incident*]
  }

  measure: tasks_renamed_sum {
    description: "The Sum of Tasks Renamed."
    type: sum
    group_label: "Tasks Renamed Measures"
    sql: ${tasks_renamed} ;;
    drill_fields: [incident*]
  }

  measure: tasks_renamed_max {
    description: "The Max. Tasks Renamed."
    type: max
    group_label: "Tasks Renamed Measures"
    sql: ${tasks_renamed} ;;
    drill_fields: [incident*]
  }

  measure: tasks_renamed_min {
    description: "The Min. Tasks Renamed."
    type: min
    group_label: "Tasks Renamed Measures"
    sql: ${tasks_renamed} ;;
    drill_fields: [incident*]
  }

  measure: tasks_renamed_avg {
    description: "The Average Tasks Renamed."
    type: average
    group_label: "Tasks Renamed Measures"
    sql: ${tasks_renamed} ;;
    drill_fields: [incident*]
  }

  measure: tasks_renamed_median {
    description: "The Median Tasks Renamed."
    type: median
    group_label: "Tasks Renamed Measures"
    sql: ${tasks_renamed} ;;
    drill_fields: [incident*]
  }

  measure: task_slash_commands_run_sum {
    description: "The Sum of Task Slash Commands Run."
    type: sum
    group_label: "Task Slash Commands Run Measures"
    sql: ${task_slash_commands_run} ;;
    drill_fields: [incident*]
  }

  measure: task_slash_commands_run_max {
    description: "The Max. Task Slash Commands Run."
    type: max
    group_label: "Task Slash Commands Run Measures"
    sql: ${task_slash_commands_run} ;;
    drill_fields: [incident*]
  }

  measure: task_slash_commands_run_min {
    description: "The Min. Task Slash Commands Run."
    type: min
    group_label: "Task Slash Commands Run Measures"
    sql: ${task_slash_commands_run} ;;
    drill_fields: [incident*]
  }

  measure: task_slash_commands_run_avg {
    description: "The Average Task Slash Commands Run."
    type: average
    group_label: "Task Slash Commands Run Measures"
    sql: ${task_slash_commands_run} ;;
    drill_fields: [incident*]
  }

  measure: task_slash_commands_run_median {
    description: "The Median Task Slash Commands Run."
    type: median
    group_label: "Task Slash Commands Run Measures"
    sql: ${task_slash_commands_run} ;;
    drill_fields: [incident*]
  }

  measure: tasks_moved_sum {
    description: "The Sum of Tasks Moved."
    type: sum
    group_label: "Tasks Moved Measures"
    sql: ${tasks_moved} ;;
    drill_fields: [incident*]
  }

  measure: tasks_moved_max {
    description: "The Max. Tasks Moved."
    type: max
    group_label: "Tasks Moved Measures"
    sql: ${tasks_moved} ;;
    drill_fields: [incident*]
  }

  measure: tasks_moved_min {
    description: "The Min. Tasks Moved."
    type: min
    group_label: "Tasks Moved Measures"
    sql: ${tasks_moved} ;;
    drill_fields: [incident*]
  }

  measure: tasks_moved_avg {
    description: "The Average Tasks Moved."
    type: average
    group_label: "Tasks Moved Measures"
    sql: ${tasks_moved} ;;
    drill_fields: [incident*]
  }

  measure: tasks_moved_median {
    description: "The Median Tasks Moved."
    type: median
    group_label: "Tasks Moved Measures"
    sql: ${tasks_moved} ;;
    drill_fields: [incident*]
  }

  measure: daily_active_users_sum {
    description: "The Sum of Daily Active Users."
    type: sum
    group_label: "Daily Active User Measures"
    sql: ${daily_active_users} ;;
    drill_fields: [incident*]
  }

  measure: daily_active_users_avg {
    description: "The Average Daily Active Users."
    type: average
    group_label: "Daily Active User Measures"
    sql: ${daily_active_users} ;;
    drill_fields: [incident*]
  }

  measure: daily_active_users_median {
    description: "The Median Daily Active Users."
    type: median
    group_label: "Daily Active User Measures"
    sql: ${daily_active_users} ;;
    drill_fields: [incident*]
  }

  measure: weekly_active_users_sum {
    description: "The Sum of Weekly Active Users."
    type: sum
    group_label: "Weekly Active User Measures"
    sql: ${weekly_active_users} ;;
    drill_fields: [incident*]
  }

  measure: weekly_active_users_avg {
    description: "The Average Weekly Active Users on the given logging date."
    type: average
    group_label: "Weekly Active User Measures"
    sql: ${weekly_active_users} ;;
    drill_fields: [incident*]
  }

  measure: weekly_active_users_median {
    description: "The Median Weekly Active Users on the given logging date."
    type: median
    group_label: "Weekly Active User Measures"
    sql: ${weekly_active_users} ;;
    drill_fields: [incident*]
  }

  measure: monthly_active_users_sum {
    description: "The Sum of Monthly Active Users on the given logging date."
    type: sum
    group_label: "Monthly Active User Measures"
    sql: ${monthly_active_users} ;;
    drill_fields: [incident*]
  }

  measure: monthly_active_users_avg {
    description: "The Average Monthly Active Users on the given logging date."
    type: average
    group_label: "Monthly Active User Measures"
    sql: ${monthly_active_users} ;;
    drill_fields: [incident*]
  }

  measure: monthly_active_users_median {
    description: "The Median Monthly Active Users on the given logging date."
    type: median
    group_label: "Monthly Active User Measures"
    sql: ${monthly_active_users} ;;
    drill_fields: [incident*]
  }

  measure: version_users_to_date_sum {
    description: "The Sum of users that have performed an event on the given plugin versoin on or before the given logging date."
    type: sum
    group_label: "Version Active User Measures"
    sql: ${version_users_to_date} ;;
    drill_fields: [incident*]
  }

  measure: version_users_to_date_avg {
    description: "The Average # of users that have performed an event on the given plugin versoin on or before the given logging date."
    type: average
    group_label: "Version Active User Measures"
    sql: ${version_users_to_date} ;;
    drill_fields: [incident*]
  }

  measure: version_users_to_date_median {
    description: "The Median # of users that have performed an event on the given plugin versoin on or before the given logging date."
    type: median
    group_label: "Version Active User Measures"
    sql: ${version_users_to_date} ;;
    drill_fields: [incident*]
  }


}
