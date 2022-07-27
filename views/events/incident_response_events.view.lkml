# This is the view file for the analytics.events.incident_response_events table.
view: incident_response_events {
  sql_table_name: events.incident_response_events ;;
  view_label: "User Events Telemetry (Playbooks)"

  # DRILL SETS
  set: incidents_drill {
    fields: [timestamp_date, id, user_id, useractualid, license_server_fact.customer_name, server_fact.company_name, event, pluginversion, serverversion, incidentid, playbookid, teamid, checklists_sum, totalchecklistitems_sum, nummember_sum, numslashcommands_sum]
  }

  set: customer_drill {
    fields: [license_server_fact.customer_name, user_id, playbook_count, incidentid_count, modify_state_checklist_item_count, user_count]
  }

  # DIMENSIONS
  dimension: product_edition {
    description: "The Mattermost SKU associated with the server on the given logging date."
    type: string
    sql: CASE WHEN ${license_current.edition} is not null AND NOT ${license_current.trial} then ${license_current.edition}
              WHEN ${license_current.edition} = 'Mattermost Cloud' THEN 'Mattermost Cloud'
              WHEN ${license_current.edition} IS NOT NULL AND ${license_current.trial} THEN 'E20 Trial'
              WHEN ${license_current.customer_id} is not null and NOT COALESCE(${license_current.trial}, TRUE) THEN 'E10'
        ELSE CASE WHEN ${license_server_fact.edition} IS NOT NULL AND NOT ${license_server_fact.trial} THEN ${license_server_fact.edition}
                      WHEN ${license_server_fact.edition} = 'Mattermost Cloud' THEN 'Mattermost Cloud'
                      WHEN ${license_server_fact.edition} IS NOT NULL AND ${license_server_fact.trial} THEN 'E20 Trial'
                      WHEN ${license_server_fact.customer_id} is not null and NOT COALESCE(${license_server_fact.trial}, TRUE) THEN 'E10'
                      ELSE COALESCE(${license_current.edition}, ${server_daily_details.edition}, ${server_fact.server_edition})
                      END
        END;;
  }

  dimension: dev_server {
    description: "Boolean that evaluates to true when the pluginversion is in alpha (i.e. not released to GA) or the server version has not yet been released."
    type: yesno
    sql: CASE WHEN ${user_id} IN  ('ctjqfcwp9ig6xnfdtxz3mgk7uy','g6mwsqa5yibutnqfggp67fbs1w', '4k15shdyrfr39m9h675xy1pssw')
            OR
            (regexp_substr(${server_fact.version}, '^[0-9]{1,2}.{1}[0-9]{1,2}.{1}[0-9]{1,2}$') IS NULL
             AND
            regexp_substr(regexp_substr(${server_fact.version},'^[0-9]{1,2}.{1}[0-9]{1,2}.{1}[0-9]{1,2}.{1}[0-9]{1,2}.{1}[0-9]{1,2}.{1}[0-9]{1,2}'), '[0-9]{0,}[.]{1}[0-9[{0,}[.]{1}[0-9]{0,}[.]{1}[0-9]{0,}$') IS NULL
            AND NOT ${server_fact.cloud_server})
            THEN TRUE ELSE FALSE END ;;
  }

  dimension: community_server {
    description: "Boolean indicating the server performing the event is the Mattermost Community server."
    type: yesno
    sql: CASE WHEN ${user_id} = '93mykbogbjfrbbdqphx3zhze5c' THEN TRUE ELSE FALSE END ;;
  }

  dimension: licensed_server {
    description: "Boolean indicating the server was licensed at the time the incident response telemetry was logged."
    type: yesno
    sql: CASE WHEN ${license_server_fact.license_id} IS NOT NULL THEN TRUE ELSE FALSE END ;;
  }

  dimension: _dbt_source_relation {
    description: ""
    type: string
    sql: ${TABLE}._dbt_source_relation ;;
    hidden: yes
  }

  dimension: attribute_source {
    description: "The source of the attribute or property being reported on (i.e. Tasks, Incidents, Playbooks, Frontend, Notify Admins, &/or Start Trial). Can be used to identify/filter data sources of interest."
    type: string
    sql: INITCAP(lower(replace(split_part(${_dbt_source_relation}, '.', 3), '_', ' '))) ;;
  }

  dimension: properties {
    sql: OBJECT_CONSTRUCT(*) ;;
    html:
    {% assign words = value | replace: '}', '' | replace: '{', '' | replace: ', ', '; ' | split: ',' %}
    <ul>
    {% for word in words %}
    <li>{{ word }}</li>
    {% endfor %} ;;
  }

  dimension: group {
    label: "Non-Null"
    type: string
    sql: 'QA & Release Candidate' ;;
    hidden: yes
  }

  dimension: commanderuserid {
    label: "Commander User ID"
    description: ""
    type: string
    sql: COALESCE(${TABLE}.commanderuserid,, ${commander_user_id}) ;;
    hidden: yes
  }

  dimension: user_id {
    label: "Instance ID"
    description: "The server or workspace ID associated with the Mattermost Instance performing the Incident Collaboration Event."
    type: string
    sql: COALESCE(${TABLE}.user_id, ${TABLE}.anonymous_id) ;;
    hidden: no
  }

  dimension: postid {
    description: ""
    type: string
    sql: ${TABLE}.postid ;;
    hidden: yes
  }

  dimension: currentstatus {
    group_label: "Incident Dimensions"
    label: "Current Status"
    description: ""
    type: string
    sql: COALESCE(${TABLE}.currentstatus, ${current_status}) ;;
    hidden: no
  }

  dimension: remindertimersecond {
    group_label: "Incident Dimensions"
    label: "Reminder Timer (Seconds)"
    description: ""
    type: number
    sql: COALESCE(${TABLE}.remindertimerseconds, ${reminder_timer_seconds}) ;;
    hidden: no
  }

  dimension: remindertimerdefaultsecond {
    group_label: "Playbook Dimensions"
    label: "Reminder Timer Default (Seconds)"
    description: ""
    type: number
    sql: COALESCE(${TABLE}.remindertimedefaultseconds, ${reminder_timer_default_seconds}, ${remindertimerdefaultseconds}) ;;
    hidden: no
  }

  dimension: broadcastchannelid {
    group_label: "Playbook Dimensions"
    label: "Broadcast Channel ID"
    description: ""
    type: string
    sql: ${TABLE}.broadcastchannelid ;;
    hidden: no
  }

  dimension: useremindermessagetemplate {
    group_label: "Playbook Dimensions"
    label: "Use Reminder Message Template"
    description: ""
    type: yesno
    sql: COALESCE(${TABLE}.useremindermessagetemplate, ${usesremindermessagetemplate}, ${uses_reminder_message_template}) ;;
    hidden: no
  }

  dimension: anonymous_id {
    description: ""
    type: string
    sql: ${TABLE}.anonymous_id ;;
    hidden: yes
  }

  dimension: action {
    label: "Event Action"
    description: ""
    type: string
    sql: ${TABLE}.action ;;
    hidden: no
  }

  dimension: action_type {
    label: "Action Type"
    description: "Action Type"
    type: string
    sql: ${TABLE}.action_type ;;
    hidden: no
  }


  dimension: trigger_type {
    label: "Trigger Type"
    description: "Trigger Type"
    type: string
    sql: ${TABLE}.trigger_type ;;
    hidden: no
  }


  dimension: isactive {
    description: ""
    type: yesno
    sql: COALESCE(${TABLE}.isactive, ${TABLE}.is_active) ;;
    hidden: no
  }

  dimension: id {
    description: ""
    type: string
    sql: ${TABLE}.id ;;
    hidden: yes
  }

  dimension: totalchecklistitems {
    label: "Total Checklist Items"
    description: ""
    type: number
    sql: COALESCE(${TABLE}.totalchecklistitems, ${TABLE}.total_checklist_items) ;;
    hidden: no
  }

  dimension: event {
    label: "Event Type"
    description: ""
    type: string
    sql: ${TABLE}.event ;;
    hidden: no
  }

  dimension: useractualid {
    label: "User ID"
    description: ""
    type: string
    sql: COALESCE(${TABLE}.useractualid, ${TABLE}.user_actual_id) ;;
    hidden: no
  }

  dimension: numchecklists {
    label: "# of Checklists"
    description: ""
    type: number
    sql: COALESCE(${TABLE}.numchecklists, ${TABLE}.num_checklists) ;;
    hidden: no
  }

  dimension: incidentid {
    label: "Incident ID"
    description: ""
    type: string
    sql: COALESCE(${TABLE}.incidentid, ${TABLE}.incident_id);;
    hidden: no
  }

  dimension: activestage {
    label: "Active Stage"
    description: ""
    type: number
    sql: COALESCE(${TABLE}.activestage, ${TABLE}.active_stage) ;;
    hidden: yes
  }

  dimension: teamid {
    label: "Team ID"
    description: ""
    type: string
    sql: COALESCE(${TABLE}.teamid, ${TABLE}.team_id) ;;
    hidden: no
  }

  dimension: context_library_name {
    description: ""
    type: string
    sql: ${TABLE}.context_library_name ;;
    hidden: yes
  }

  dimension: createat {
    description: ""
    type: number
    sql: ${TABLE}.createat ;;
    hidden: yes
  }

  dimension: context_ip {
    description: ""
    type: string
    sql: ${TABLE}.context_ip ;;
    hidden: yes
  }

  dimension: context_library_version {
    description: ""
    type: string
    sql: ${TABLE}.context_library_version ;;
    hidden: yes
  }

  dimension: event_text {
    description: ""
    type: string
    sql: ${TABLE}.event_text ;;
    hidden: yes
  }

  dimension: pluginversion {
    label: "Plugin Version"
    description: ""
    type: string
    sql: COALESCE(${TABLE}.pluginversion, ${TABLE}.plugin_version) ;;
    hidden: no
  }

  dimension: public {
    group_label: "Incident Dimensions"
    description: ""
    type: yesno
    sql: ${TABLE}.public ;;
    hidden: yes
  }

  dimension: serverversion {
    group_label: " Server Versions"
    label: "  Server Version"
    description: "The Server Version of the instance that is stamped on the Incident Collaboration event as it occurs (as a telemetry property)."
    type: string
    sql: COALESCE(${TABLE}.serverversion, ${TABLE}.server_version, ${server_daily_details.version}) ;;
    hidden: no
  }

  dimension: serverversion_major {
    group_label: " Server Versions"
    label: "  Server Version (Major)"
    description: ""
    type: string
    sql: SPLIT_PART(${serverversion}, '.', 1) || '.' || SPLIT_PART(${serverversion}, '.', 2) ;;
    hidden: no
}

  dimension: numslashcommands {
    group_label: "Playbook Dimensions"
    description: ""
    type: number
    sql: COALESCE(${TABLE}.numslashcommands, ${num_slash_commands}) ;;
    hidden: no
  }

  dimension: ispublic {
    group_label: "Playbook Dimensions"
    description: ""
    type: yesno
    sql:${TABLE}.ispublic ;;
    hidden: yes
  }

  dimension: nummembers {
    group_label: "Playbook Dimensions"
    label: "# of Members"
    description: ""
    type: number
    sql: COALESCE(${TABLE}.nummembers, ${num_members}) ;;
    hidden: no
  }

  dimension: playbookid {
    group_label: "Playbook Dimensions"
    label: "Playbook ID"
    description: ""
    type: string
    sql: COALESCE(${TABLE}.playbookid, ${TABLE}.playbook_id) ;;
    hidden: no
  }

  dimension: usesremindermessagetemplate {
    label: "Usesremindermessagetemplate"
    description: "Indicates Usesremindermessagetemplate is marked true/enabled."
    type: yesno
    sql: ${TABLE}.usesremindermessagetemplate ;;
    hidden: yes
  }

  dimension: reminder_timer_seconds {
    label: "Reminder Timer Seconds"
    description: "The Reminder Timer Seconds of the instance."
    type: string
    sql: ${TABLE}.reminder_timer_seconds ;;
    hidden: yes
  }

  dimension: remindertimerdefaultseconds {
    label: "Remindertimerdefaultseconds"
    description: "The Remindertimerdefaultseconds of the instance."
    type: string
    sql: ${TABLE}.remindertimerdefaultseconds ;;
    hidden: yes
  }

  dimension: wascommander {
    description: ""
    type: yesno
    sql: ${TABLE}.wascommander ;;
    hidden: yes
  }

  dimension: newstate {
    group_label: "Task Dimensions"
    label: "New State"
    description: ""
    type: string
    sql: ${TABLE}.newstate ;;
    hidden: no
  }

  dimension: wasassignee {
    description: ""
    type: yesno
    sql: ${TABLE}.wasassignee ;;
    hidden: yes
  }

  dimension: new_state {
    label: "New State"
    description: "The New State of the instance."
    type: string
    sql: ${TABLE}.new_state ;;
  }


  dimension: was_commander {
    label: "Was Commander"
    description: "Indicates Was Commander is marked true/enabled."
    type: yesno
    sql: COALESCE(${TABLE}.was_commander, ${wascommander}) ;;
  }



  dimension: was_assignee {
    label: "Was Assignee"
    description: "Indicates Was Assignee is marked true/enabled."
    type: yesno
    sql: ${TABLE}.was_assignee ;;
  }



  dimension: command_last_run {
    label: "Command Last Run"
    description: "The Command Last Run of the instance."
    type: string
    sql: ${TABLE}.command_last_run ;;
  }



  dimension: assignee_id {
    label: "Assignee Id"
    description: "The Assignee Id of the instance."
    type: string
    sql: ${TABLE}.assignee_id ;;
  }


  dimension: has_command {
    label: "Has Command"
    description: "Indicates Has Command is marked true/enabled."
    type: yesno
    sql: ${TABLE}.has_command ;;
  }



  dimension: task_id {
    label: "Task Id"
    description: "The Task Id of the instance."
    type: string
    sql: ${TABLE}.task_id ;;
  }


  dimension: state {
    label: "State"
    description: "The State of the instance."
    type: string
    sql: ${TABLE}.state ;;
  }


  # DIMENSION GROUPS/DATES
  dimension_group: sent_at {
    description: ""
    type: time
    timeframes: [time, week, date, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.sent_at ;;
    hidden: yes
  }

  dimension_group: received_at {
    description: ""
    type: time
    timeframes: [time, week, date, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.received_at ;;
    hidden: yes
  }

  dimension_group: original_timestamp {
    description: ""
    type: time
    timeframes: [time, week, date, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.original_timestamp ;;
    hidden: yes
  }

  dimension_group: timestamp {
    label: " Logging"
    description: "The date/time the incident collaboration event occurred on."
    type: time
    timeframes: [time, week, date, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.timestamp ;;
    hidden: no
  }

  dimension_group: uuid_ts {
    description: ""
    type: time
    timeframes: [time, week, date, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.uuid_ts ;;
    hidden: yes
  }


  dimension: context_request_ip {
    label: "Context Request Ip"
    description: "The Context Request Ip of the instance."
    type: string
    sql: ${TABLE}.context_request_ip ;;
  }


  dimension: incident_id {
    label: "Incident Id"
    description: "The Incident Id of the instance."
    type: string
    sql: ${TABLE}.incident_id ;;
    hidden: yes
  }


  dimension_group: create_at {
    label: "Create At"
    description: "The Create At date/time of the playbook/incident."
    timeframes: [date, week, month, year, time]
    type: time
    sql: coalesce(TO_TIMESTAMP(${TABLE}.create_at/1000)::TIMESTAMP, TO_TIMESTAMP(${createat}/1000)::TIMESTAMP) ;;
  }



  dimension: commander_user_id {
    label: "Commander User Id"
    description: "The Commander User Id of the instance."
    type: string
    sql: ${TABLE}.commander_user_id ;;
    hidden: yes
  }


  dimension: user_actual_id {
    label: "User Actual Id"
    description: "The User Actual Id of the instance."
    type: string
    sql: ${TABLE}.user_actual_id ;;
    hidden: yes
  }


  dimension: total_checklist_items {
    label: "Total Checklist Items"
    description: "The Total Checklist Items of the instance."
    type: string
    sql: ${TABLE}.total_checklist_items ;;
    hidden: yes
  }



  dimension: current_status {
    label: "Current Status"
    description: "The Current Status of the instance."
    type: string
    sql: ${TABLE}.current_status ;;
    hidden: yes
  }


  dimension: server_version {
    group_label: " Server Version"
    label: " IC Server Version"
    description: "The Server Version of the instance that is stamped on the Incident Collaboration event as it occurs (as a telemetry property)."
    type: string
    sql: ${TABLE}.server_version ;;
    hidden: yes
  }


  dimension: plugin_version {
    label: "Plugin Version"
    description: "The Plugin Version of the instance."
    type: string
    sql: ${TABLE}.plugin_version ;;
    hidden: yes
  }


  dimension: team_id {
    label: "Team Id"
    description: "The Team Id of the instance."
    type: string
    sql: ${TABLE}.team_id ;;
    hidden: yes
  }


  dimension: num_checklists {
    label: "Num Checklists"
    description: "The Num Checklists of the instance."
    type: number
    sql: ${TABLE}.num_checklists ;;
    hidden: yes
  }



  dimension: post_id {
    label: "Post Id"
    description: "The Post Id of the instance."
    type: string
    sql: ${TABLE}.post_id ;;
  }


  dimension: previous_reminder {
    label: "Previous Reminder"
    description: "The Previous Reminder of the instance."
    type: string
    sql: ${TABLE}.previous_reminder ;;
  }



  dimension: reporter_user_id {
    label: "Reporter User Id"
    description: "The Reporter User Id of the instance."
    type: string
    sql: ${TABLE}.reporter_user_id ;;
  }


  dimension: num_timeline_events {
    label: "Num Timeline Events"
    description: "The Num Timeline Events of the instance."
    type: number
    sql: ${TABLE}.num_timeline_events ;;
  }

  dimension: checklist_items_with_due_date {
    label: "Checklist Items with Due Date"
    description: "Checklist Items with Due Date."
    type: number
    sql: ${TABLE}.checklist_items_with_due_date ;;
  }



  dimension_group: end_at {
    label: "End At"
    description: "The End At date/time of the incident."
    timeframes: [date, week, month, year, time]
    type: time
    sql: TO_TIMESTAMP(${TABLE}.end_at/1000)::DATE ;;
  }



  dimension: num_status_posts {
    label: "Num Status Posts"
    description: "The Num Status Posts of the instance."
    type: string
    sql: ${TABLE}.num_status_posts ;;
  }



  dimension_group: delete_at {
    label: "Delete At"
    description: "The Deleted At date/time of the incident or playbook."
    timeframes: [date, week, month, year, time]
    type: time
    sql: TO_TIMESTAMP(${TABLE}.delete_at/1000)::DATE ;;
  }



  dimension: channel_id {
    label: "Channel Id"
    description: "The Channel Id of the instance."
    type: string
    sql: ${TABLE}.channel_id ;;
  }


  dimension: has_description {
    label: "Has Description"
    description: "Indicates Has Description is marked true/enabled."
    type: yesno
    sql: ${TABLE}.has_description ;;
  }



  dimension: is_public {
    group_label: "Playbook Dimensions"
    label: "Is Public"
    description: "Indicates Is Public is marked true/enabled."
    type: yesno
    sql: coalesce(${TABLE}.is_public, ${ispublic}, ${public}) ;;
  }



  dimension: webhook_on_creation_enabled {
    label: "Webhook On Creation Enabled"
    description: "Indicates Webhook On Creation Enabled is marked true/enabled."
    type: yesno
    sql: ${TABLE}.webhook_on_creation_enabled ;;
  }



  dimension: default_commander_enabled {
    label: "Default Commander Enabled"
    description: "Indicates Default Commander Enabled is marked true/enabled."
    type: yesno
    sql: ${TABLE}.default_commander_enabled ;;
  }



  dimension: num_invited_group_i_ds {
    label: "Num Invited Group IDs"
    description: "The Num Invited Group IDs of the instance."
    type: number
    sql: ${TABLE}.num_invited_group_i_ds ;;
  }



  dimension: num_members {
    label: "Num Members"
    description: "The Num Members of the instance."
    type: number
    sql: ${TABLE}.num_members ;;
    hidden: yes
  }



  dimension: broadcast_channel_id {
    label: "Broadcast Channel Id"
    description: "The Broadcast Channel Id of the instance."
    type: string
    sql: ${TABLE}.broadcast_channel_id ;;
  }


  dimension: num_signal_any_keywords {
    label: "Num Signal Any Keywords"
    description: "The Num Signal Any Keywords of the instance."
    type: number
    sql: ${TABLE}.num_signal_any_keywords ;;
  }



  dimension: signal_any_keywords_enabled {
    label: "Signal Any Keywords Enabled"
    description: "Indicates Signal Any Keywords Enabled is marked true/enabled."
    type: yesno
    sql: ${TABLE}.signal_any_keywords_enabled ;;
  }



  dimension: num_webhook_on_creation_ur_ls {
    label: "Num Webhook On Creation URL's"
    description: "The Num Webhook On Creation URL's of the instance."
    type: number
    sql: ${TABLE}.num_webhook_on_creation_ur_ls ;;
  }



  dimension: reminder_timer_default_seconds {
    label: "Reminder Timer Default Seconds"
    description: "The Reminder Timer Default Seconds of the instance."
    type: number
    sql: ${TABLE}.reminder_timer_default_seconds ;;
    hidden: yes
  }



  dimension: num_invited_user_i_ds {
    label: "Num Invited User IDs"
    description: "The Num Invited User IDs of the instance."
    type: number
    sql: ${TABLE}.num_invited_user_i_ds ;;
  }



  dimension: announcement_channel_enabled {
    label: "Announcement Channel Enabled"
    description: "Indicates Announcement Channel Enabled is marked true/enabled."
    type: yesno
    sql: ${TABLE}.announcement_channel_enabled ;;
  }



  dimension: num_slash_commands {
    label: "Num Slash Commands"
    description: "The Num Slash Commands of the instance."
    type: number
    sql: ${TABLE}.num_slash_commands ;;
    hidden: yes
  }



  dimension: invite_users_enabled {
    label: "Invite Users Enabled"
    description: "Indicates Invite Users Enabled is marked true/enabled."
    type: yesno
    sql: ${TABLE}.invite_users_enabled ;;
  }



  dimension: uses_reminder_message_template {
    label: "Uses Reminder Message Template"
    description: "Indicates Uses Reminder Message Template is marked true/enabled."
    type: yesno
    sql: ${TABLE}.uses_reminder_message_template ;;
    hidden: yes
  }



  dimension: announcement_channel_id {
    label: "Announcement Channel Id"
    description: "The Announcement Channel Id of the instance."
    type: string
    sql: ${TABLE}.announcement_channel_id ;;
  }


  dimension: default_commander_id {
    label: "Default Commander Id"
    description: "The Default Commander Id of the instance."
    type: string
    sql: ${TABLE}.default_commander_id ;;
  }


  dimension: template_name {
    label: "Template Name"
    description: "The Template Name of the instance."
    type: string
    sql: ${TABLE}.template_name ;;
  }

  dimension_group: active_user_date {
    label: "Active User"
    description: "Use with Active User/Instance Dimensions to enable Daily, Weekly & Monthly active user/instance functionality with this explore."
    type: time
    timeframes: [date, week, month, year, fiscal_quarter, fiscal_year, day_of_week, fiscal_month_num,
      week_of_year, day_of_year, day_of_week_index, month_name, day_of_month, fiscal_quarter_of_year]
    sql: ${dates.date_date}::date ;;

  }


  # MEASURES
  measure: count {
    description: "Count of rows/occurrences."
    type: count
    drill_fields: [incidents_drill*]
  }

  measure: daily_active_users {
    group_label: "Active User Measures (DAU, WAU, MAU)"
    label: "Daily Active Users"
    description: "The count of daily active users on the given active user date."
    type: count_distinct
    sql: CASE WHEN ${active_user_date_date}::DATE = ${timestamp_date}::DATE THEN ${useractualid} ELSE NULL END ;;
  }

  measure: weekly_active_users {
    group_label: "Active User Measures (DAU, WAU, MAU)"
    label: "Weekly Active Users"
    description: "The count of Weekly active users on the given active user date."
    type: count_distinct
    sql: CASE WHEN ${timestamp_date}::DATE <= ${active_user_date_date}::DATE and ${timestamp_date}::DATE >= ${active_user_date_date}::DATE - interval '7 days' THEN ${useractualid} ELSE NULL END ;;
  }

  measure: monthly_active_users {
    group_label: "Active User Measures (DAU, WAU, MAU)"
    label: "Monthly Active Users"
    description: "The count of monthly active users on the given active user date."
    type: count_distinct
    sql: CASE WHEN ${active_user_date_date}::DATE IS NOT NULL THEN ${useractualid} ELSE NULL END ;;
  }

  measure: daily_active_instances {
    group_label: "Active Instance Measures (DAI, WAI, MAI)"
    label: "Daily Active Instances"
    description: "The count of daily active instances on the given active user date."
    type: count_distinct
    sql: CASE WHEN ${active_user_date_date}::DATE = ${timestamp_date}::DATE THEN ${user_id} ELSE NULL END ;;
  }

  measure: weekly_active_instances {
    group_label: "Active Instance Measures (DAI, WAI, MAI)"
    label: "Weekly Active Instances"
    description: "The count of Weekly active instances on the given active user date."
    type: count_distinct
    sql: CASE WHEN ${timestamp_date}::DATE <= ${active_user_date_date}::DATE and ${timestamp_date}::DATE >= ${active_user_date_date}::DATE - interval '7 days' THEN ${user_id} ELSE NULL END ;;
  }

  measure: monthly_active_instances {
    group_label: "Active Instance Measures (DAI, WAI, MAI)"
    label: "Monthly Active Instances"
    description: "The count of monthly active instances on the given active user date."
    type: count_distinct
    sql: CASE WHEN ${active_user_date_date}::DATE IS NOT NULL THEN ${user_id} ELSE NULL END ;;
  }

  measure: announcement_channel_id_count {
    group_label: "Announcement_Channel Counts"
    label: "Announcement Channel Id"
    description: "The distinct count of announcement channel id's within the grouping."
    type: count_distinct
    sql: ${announcement_channel_id} ;;
  }

  measure: anonymous_count {
    label: " Anonymous ID Count"
    description: "The distinct count of Anonymouss per grouped dimension(s)."
    type: count_distinct
    sql: ${anonymous_id} ;;
    drill_fields: [incidents_drill*]
    hidden: yes
  }

  measure: invite_users_enabled_count {
    group_label: "Instance Counts"
    label: "Invite Users Enabled"
    description: "The distinct count of servers/workspaces with Invite Users Enabled marked true/enabled."
    type: count_distinct
    sql: CASE WHEN ${invite_users_enabled} THEN ${user_id} ELSE NULL END;;
  }

  measure: playbook_count {
    label: " Playbooks Created"
    group_label: "Playbook Measures"
    description: "The distinct count of Playbook create events per grouped dimension(s) (create_playbook)."
    type: count_distinct
    sql: CASE WHEN ${event} = 'playbook' and ${action} = 'create' THEN ${id} ELSE NULL END;;
    drill_fields: [incidents_drill*]
    hidden: no
  }

  measure: playbook_deleted_count {
    label: " Playbooks Deleted"
    group_label: "Playbook Measures"
    description: "The distinct count of Playbook delete events per grouped dimension(s) (delete_playbook)."
    type: count_distinct
    sql: CASE WHEN ${event} = 'playbook' and ${action} = 'delete' THEN ${id} ELSE NULL END;;
    drill_fields: [incidents_drill*]
    hidden: no
  }

  measure: playbook_updated_count {
    label: " Playbooks Updated"
    group_label: "Playbook Measures"
    description: "The distinct count of Playbook update events per grouped dimension(s)."
    type: count_distinct
    sql: CASE WHEN ${event} = 'playbook' and ${action} = 'update' THEN ${id} ELSE NULL END;;
    drill_fields: [incidents_drill*]
    hidden: no
  }

  measure: nummember_sum {
    label: "Members Sum"
    description: "The sum of members per grouped dimension(s)."
    type: sum
    sql: ${nummembers} ;;
    drill_fields: [incidents_drill*]
  }

  measure: num_members_avg {
    group_label: "Num Members Measures"
    label: "Num Members (Avg)"
    description: "The average Num Members per instance across all instances within the grouping."
    type: average
    sql: ${num_members} ;;
  }

  measure: num_members_median {
    group_label: "Num Members Measures"
    label: "Num Members (Median)"
    description: "The median Num Members per instance across all instances within the grouping."
    type: median
    sql: ${num_members} ;;
  }

  measure: incidentid_count {
    label: "Incidents Created"
    group_label: "Incident Measures"
    description: "The count of distinct incidents created per grouped dimension(s) (create_incident)."
    type: count_distinct
    sql: CASE WHEN ${event} = 'incident' and ${action} = 'create' THEN ${id} ELSE NULL END;;
    drill_fields: [incidents_drill*]
  }

  measure: incidents_ended_count {
    label: "Incidents Ended"
    group_label: "Incident Measures"
    description: "The count of distinct incidents ended per grouped dimension(s) (end_incident)."
    type: count_distinct
    sql: CASE WHEN ${event} = 'incident' and ${action} = 'end' THEN ${id} ELSE NULL END;;
    drill_fields: [incidents_drill*]
  }

  measure: change_stage_count {
    label: "Incident Stages Changed"
    group_label: "Incident Measures"
    description: "The count of distinct incident stages changed per grouped dimension(s) (change_stage)."
    type: count_distinct
    sql: CASE WHEN ${event} = 'incident' and ${action} = 'change_stage' THEN ${id} ELSE NULL END;;
    drill_fields: [incidents_drill*]
  }

  measure: incidents_restarted_count {
    label: "Incidents Restarted"
    group_label: "Incident Measures"
    description: "The count of distinct incidents restarted per grouped dimension(s) (restart_incident)."
    type: count_distinct
    sql: CASE WHEN ${event} = 'incident' and ${action} = 'restart' THEN ${id} ELSE NULL END;;
    drill_fields: [incidents_drill*]
  }

  # measure: add_checklist_item_count {
  #   label: "Items Added"
  #   group_label: "Checklist Item Measures"
  #   description: "The total number of checklist items added per grouped dimension(s) (check_checklist_item)."
  #   type: count_distinct
  #   sql: CASE WHEN ${event} = 'add_checklist_item' THEN ${id} ELSE NULL END;;
  #   drill_fields: [incidents_drill*]
  # }

  # measure: check_checklist_count {
  #   label: "Items Checked"
  #   group_label: "Checklist Item Measures"
  #   description: "The total number of checklist items marked complete per grouped dimension(s) (check_checklist_item)."
  #   type: count_distinct
  #   sql: CASE WHEN ${event} = 'check_checklist_item' THEN ${id} ELSE NULL END;;
  #   drill_fields: [incidents_drill*]
  # }

  # measure: uncheck_checklist_count {
  #   label: "Items Unchecked"
  #   group_label: "Checklist Item Measures"
  #   description: "The total number of checklist items unmarked complete per grouped dimension(s) (uncheck_checklist_item)."
  #   type: count_distinct
  #   sql: CASE WHEN ${event} = 'uncheck_checklist_item' THEN ${id} ELSE NULL END;;
  #   drill_fields: [incidents_drill*]
  # }

  # measure: remove_checklist_count {
  #   label: "Items Removed"
  #   group_label: "Checklist Item Measures"
  #   description: "The total number of checklist items removed from checklists per grouped dimension(s) (remove_checklist_items)."
  #   type: count_distinct
  #   sql: CASE WHEN ${event} = 'remove_checklist_item' THEN ${id} ELSE NULL END;;
  #   drill_fields: [incidents_drill*]
  # }

  # measure: rename_checklist_count {
  #   label: "Items Renamed"
  #   group_label: "Checklist Item Measures"
  #   description: "The total number of checklist items renamed per grouped dimension(s) (rename_checklist_items)."
  #   type: count_distinct
  #   sql: CASE WHEN ${event} = 'rename_checklist_item' THEN ${id} ELSE NULL END;;
  #   drill_fields: [incidents_drill*]
  # }

  # measure: move_checklist_count {
  #   label: "Items Moved"
  #   group_label: "Checklist Item Measures"
  #   description: "The total number of checklist items moved/rearranged within checklists per grouped dimension(s) (move_checklist_item)."
  #   type: count_distinct
  #   sql: CASE WHEN ${event} = 'move_checklist_item' THEN ${id} ELSE NULL END;;
  #   drill_fields: [incidents_drill*]
  # }

  measure: modify_state_checklist_item_count {
    label: "Tasks Modified"
    group_label: "Checklist Item Measures"
    description: "The total number of checklist item states that have been modified per grouped dimension(s) (modify_state_checklist_item)."
    type: count_distinct
    sql: CASE WHEN ${event} = 'tasks' and ${action} = 'modify_task_state' THEN ${id} ELSE NULL END;;
    drill_fields: [incidents_drill*]
  }

  measure: run_checklist_slash_command_count {
    label: "Tasks Slash Commands Run"
    group_label: "Checklist Item Measures"
    description: "The count of distinct checklist item slash commands run/executed per grouped dimension(s) (run_checklist_item_slash_command)."
    type: count_distinct
    sql: CASE WHEN ${event} = 'tasks' and ${action} = 'run_task_slash_command' THEN ${id} ELSE NULL END;;
    drill_fields: [incidents_drill*]
  }

  measure: set_assignees_count {
    label: "Assignees Set"
    group_label: "IR Commander/Assignee Measures"
    description: "The total number of set assignee events performed per grouped dimension(s) (set_assignee)."
    type: count_distinct
    sql: CASE WHEN ${event} = 'tasks' and ${action} = 'set_assignee_for_task' THEN ${id} ELSE NULL END;;
    drill_fields: [incidents_drill*]
  }

  measure: change_commander_count {
    label: "Commanders Changed"
    group_label: "IR Commander/Assignee Measures"
    description: "The total number of change commander events performed per grouped dimension(s) (change_commander)."
    type: count_distinct
    sql: CASE WHEN ${event} = 'incident' and ${action} = 'change_commander' THEN ${id} ELSE NULL END;;
    drill_fields: [incidents_drill*]
  }

  measure: numslashcommands_sum {
    label: "Slash Commands Sum"
    description: "The number of slash commands per grouped dimension(s)."
    type: sum
    sql: COALESCE(${TABLE}.numslashcommands, 0);;
    drill_fields: [incidents_drill*]
    hidden: no
  }

  measure: team_count {
    label: " Teams Count"
    description: "The distinct count of Teams per grouped dimension(s)."
    type: count_distinct
    sql: ${teamid} ;;
    drill_fields: [incidents_drill*]
    hidden: no
  }

  measure: user_count {
    label: " User Count"
    group_label: "User Counts"
    description: "The distinct count of Users per grouped dimension(s)."
    type: count_distinct
    sql: ${useractualid} ;;
    drill_fields: [incidents_drill*]
  }

  measure: totalchecklistitems_sum {
    group_label: "Checklist Item Measures"
    label: "Checklist Items Sum"
    description: "The sum of Totalchecklistitems per grouped dimension(s)."
    type: sum
    sql: ${totalchecklistitems} ;;
    drill_fields: [incidents_drill*]
  }

  measure: checklists_sum {
    group_label: "Checklist Measures"
    label: "Checklists (Sum)"
    description: "The sum of Playbook checklists per grouped dimension(s)."
    type: sum
    sql: ${numchecklists} ;;
    drill_fields: [incidents_drill*]
  }

  measure: checklist_items_with_due_date_sum {
    group_label: "Checklist Measures"
    label: "Checklist Items with Due Date (Sum)"
    description: "The sum of Playbook checklist items with due date per grouped dimension(s)."
    type: sum
    sql: ${checklist_items_with_due_date} ;;
    drill_fields: [incidents_drill*]
  }

  measure: checklists_avg {
    group_label: "Checklist Measures"
    label: "Checklists (Avg)"
    description: "The average Playbook checklists per grouped dimension(s)."
    type: average
    sql: ${numchecklists} ;;
    drill_fields: [incidents_drill*]
  }

  measure: checklists_median {
    group_label: "Checklist Measures"
    label: "Checklists (Avg)"
    description: "The median Playbook checklists per grouped dimension(s)."
    type: median
    sql: ${numchecklists} ;;
    drill_fields: [incidents_drill*]
  }

  measure: server_count {
    group_label: "Server Counts"
    description: "The distinct count of servers within each grouping."
    type: count_distinct
    sql: ${user_id} ;;
    drill_fields: [incidents_drill*]
  }

  measure: server_w_playbooks {
    group_label: "Server Counts"
    label: "Servers Created Playbook"
    description: "The distinct count of servers that have created a playbook."
    type: count_distinct
    sql: CASE WHEN ${event} = 'playbook' and ${action} = 'create' THEN ${user_id} ELSE NULL END ;;
    drill_fields: [incidents_drill*]
  }


  measure: users_w_playbooks {
    group_label: "User Counts"
    label: "Users Created Playbook"
    description: "The distinct count of users that have created a playbook."
    type: count_distinct
    sql: CASE WHEN ${event} = 'playbook' and ${action} = 'create' THEN ${useractualid} ELSE NULL END ;;
    drill_fields: [incidents_drill*]
  }

  measure: server_w_incidents {
    group_label: "Server Counts"
    label: "Servers Created Incident"
    description: "The distinct count of servers that have created/started an incident."
    type: count_distinct
    sql: CASE WHEN ${event} = 'incident' and ${action} = 'create' THEN ${user_id} ELSE NULL END ;;
    drill_fields: [incidents_drill*]
  }

  measure: users_w_incidents {
    group_label: "User Counts"
    label: "Users Created Incident"
    description: "The distinct count of users that have created/started an incident."
    type: count_distinct
    sql: CASE WHEN ${event} = 'incident' and ${action} = 'create' THEN ${useractualid} ELSE NULL END ;;
    drill_fields: [incidents_drill*]
  }

  measure: server_w_stage_changes {
    group_label: "Server Counts"
    label: "Servers Changed Incident Stages"
    description: "The distinct count of servers that have changed an incident stage i.e. progressed the incident down the incident workflow pipeline."
    type: count_distinct
    sql: CASE WHEN ${event} = 'incident' and ${action} = 'change_stage' THEN ${user_id} ELSE NULL END ;;
    drill_fields: [incidents_drill*]
  }

  measure: server_w_checklist_items {
    group_label: "Server Counts"
    label: "Servers Performing Tasks"
    description: "The distinct count of servers that have added and/or updated checklist items within a playbook."
    type: count_distinct
    sql: CASE WHEN ${event} = 'tasks' THEN ${user_id} ELSE NULL END ;;
    drill_fields: [incidents_drill*]
  }

  measure: users_w_checklist_items {
    group_label: "User Counts"
    label: "Users Performing Tasks"
    description: "The distinct count of users that have added and/or updated checklist items within a playbook."
    type: count_distinct
    sql: CASE WHEN ${event} = 'tasks' THEN ${useractualid} ELSE NULL END ;;
    drill_fields: [incidents_drill*]
  }

  measure: num_signal_any_keywords_sum {
    group_label: "Num Signal Any Keywords Measures"
    label: "Num Signal Any Keywords (Sum)"
    description: "The sum of Num Signal Any Keywords across all instances within the grouping."
    type: sum
    sql: ${num_signal_any_keywords} ;;
  }

  measure: num_signal_any_keywords_avg {
    group_label: "Num Signal Any Keywords Measures"
    label: "Num Signal Any Keywords (Avg)"
    description: "The average Num Signal Any Keywords across all instances within the grouping."
    type: average
    sql: ${num_signal_any_keywords} ;;
  }

  measure: num_signal_any_keywords_median {
    group_label: "Num Signal Any Keywords Measures"
    label: "Num Signal Any Keywords (Median)"
    description: "The median Num Signal Any Keywords across all instances within the grouping."
    type: median
    sql: ${num_signal_any_keywords} ;;
  }



  measure: signal_any_keywords_enabled_count {
    group_label: "Instance Counts"
    label: "Signal Any Keywords Enabled"
    description: "The distinct count of servers/workspaces with Signal Any Keywords Enabled marked true/enabled."
    type: count_distinct
    sql: CASE WHEN ${signal_any_keywords_enabled} THEN ${user_id} ELSE NULL END;;
  }

  measure: webhook_on_creation_enabled_count {
    group_label: "Instance Counts"
    label: "Webhook On Creation Enabled"
    description: "The distinct count of servers/workspaces with Webhook On Creation Enabled marked true/enabled."
    type: count_distinct
    sql: CASE WHEN ${webhook_on_creation_enabled} THEN ${user_id} ELSE NULL END;;
  }



  measure: num_webhook_on_creation_ur_ls_sum {
    group_label: "Num Webhook On Creation URL's Measures"
    label: "Num Webhook On Creation URL's (Sum)"
    description: "The sum of Num Webhook On Creation URL's across all instances within the grouping."
    type: sum
    sql: ${num_webhook_on_creation_ur_ls} ;;
  }

  measure: num_webhook_on_creation_ur_ls_avg {
    group_label: "Num Webhook On Creation URL's Measures"
    label: "Num Webhook On Creation URL's (Avg)"
    description: "The average Num Webhook On Creation URL's across all instances within the grouping."
    type: average
    sql: ${num_webhook_on_creation_ur_ls} ;;
  }

  measure: num_webhook_on_creation_ur_ls_median {
    group_label: "Num Webhook On Creation URL's Measures"
    label: "Num Webhook On Creation URL's (Median)"
    description: "The median Num Webhook On Creation URL's across all instances within the grouping."
    type: median
    sql: ${num_webhook_on_creation_ur_ls} ;;
  }



  measure: reminder_timer_default_seconds_sum {
    group_label: "Reminder Timer Default Seconds Measures"
    label: "Reminder Timer Default Seconds (Sum)"
    description: "The sum of Reminder Timer Default Seconds across all instances within the grouping."
    type: sum
    sql: ${reminder_timer_default_seconds} ;;
  }

  measure: reminder_timer_default_seconds_avg {
    group_label: "Reminder Timer Default Seconds Measures"
    label: "Reminder Timer Default Seconds (Avg)"
    description: "The average Reminder Timer Default Seconds across all instances within the grouping."
    type: average
    sql: ${reminder_timer_default_seconds} ;;
  }

  measure: reminder_timer_default_seconds_median {
    group_label: "Reminder Timer Default Seconds Measures"
    label: "Reminder Timer Default Seconds (Median)"
    description: "The median Reminder Timer Default Seconds across all instances within the grouping."
    type: median
    sql: ${reminder_timer_default_seconds} ;;
  }

  measure: num_invited_group_i_ds_sum {
    group_label: "Num Invited Group ID's Measures"
    label: "Num Invited Group ID's (Sum)"
    description: "The sum of Num Invited Group ID's across all instances within the grouping."
    type: sum
    sql: ${num_invited_group_i_ds} ;;
  }

  measure: num_invited_group_i_ds_avg {
    group_label: "Num Invited Group ID's Measures"
    label: "Num Invited Group ID's (Avg)"
    description: "The average Num Invited Group ID's across all instances within the grouping."
    type: average
    sql: ${num_invited_group_i_ds} ;;
  }

  measure: num_invited_group_i_ds_median {
    group_label: "Num Invited Group ID's Measures"
    label: "Num Invited Group ID's (Median)"
    description: "The median Num Invited Group ID's across all instances within the grouping."
    type: median
    sql: ${num_invited_group_i_ds} ;;
  }

  measure: num_invited_user_i_ds_sum {
    group_label: "Num Invited User ID's Measures"
    label: "Num Invited User ID's (Sum)"
    description: "The sum of Num Invited User ID's across all instances within the grouping."
    type: sum
    sql: ${num_invited_user_i_ds} ;;
  }

  measure: num_invited_user_i_ds_avg {
    group_label: "Num Invited User ID's Measures"
    label: "Num Invited User ID's (Avg)"
    description: "The average Num Invited User ID's across all instances within the grouping."
    type: average
    sql: ${num_invited_user_i_ds} ;;
  }

  measure: num_invited_user_i_ds_median {
    group_label: "Num Invited User ID's Measures"
    label: "Num Invited User ID's (Median)"
    description: "The median Num Invited User ID's across all instances within the grouping."
    type: median
    sql: ${num_invited_user_i_ds} ;;
  }


  measure: num_status_posts_sum {
    group_label: "Num Status Posts Measures"
    label: "Num Status Posts (Sum)"
    description: "The sum of Num Status Posts across all instances within the grouping."
    type: sum
    sql: ${num_status_posts} ;;
  }

  measure: num_status_posts_avg {
    group_label: "Num Status Posts Measures"
    label: "Num Status Posts (Avg)"
    description: "The average Num Status Posts across all instances within the grouping."
    type: average
    sql: ${num_status_posts} ;;
  }

  measure: num_status_posts_median {
    group_label: "Num Status Posts Measures"
    label: "Num Status Posts (Median)"
    description: "The median Num Status Posts across all instances within the grouping."
    type: median
    sql: ${num_status_posts} ;;
  }



  measure: channel_id_count {
    group_label: "Channel Counts"
    label: "Channel Id"
    description: "The distinct count of channel id's within the grouping."
    type: count_distinct
    sql: ${channel_id} ;;
  }



  measure: has_description_count {
    group_label: "Instance Counts"
    label: "Has Description"
    description: "The distinct count of servers/workspaces with Has Description marked true/enabled."
    type: count_distinct
    sql: CASE WHEN ${has_description} THEN ${user_id} ELSE NULL END;;
  }



  measure: is_public_count {
    group_label: "Instance Counts"
    label: "Is Public"
    description: "The distinct count of servers/workspaces with Is Public marked true/enabled."
    type: count_distinct
    sql: CASE WHEN ${is_public} THEN ${user_id} ELSE NULL END;;
  }

  measure: post_id_count {
    group_label: "Post Counts"
    label: "Posts Count"
    description: "The distinct count of post id's within the grouping."
    type: count_distinct
    sql: ${post_id} ;;
  }



  measure: previous_reminder_sum {
    group_label: "Previous Reminder Measures"
    label: "Previous Reminder (Sum)"
    description: "The sum of Previous Reminder across all instances within the grouping."
    type: sum
    sql: ${previous_reminder} ;;
  }

  measure: previous_reminder_avg {
    group_label: "Previous Reminder Measures"
    label: "Previous Reminder (Avg)"
    description: "The average Previous Reminder across all instances within the grouping."
    type: average
    sql: ${previous_reminder} ;;
  }

  measure: previous_reminder_median {
    group_label: "Previous Reminder Measures"
    label: "Previous Reminder (Median)"
    description: "The median Previous Reminder across all instances within the grouping."
    type: median
    sql: ${previous_reminder} ;;
  }



  measure: reporter_user_id_count {
    group_label: "User Counts"
    label: "Reporter Users"
    description: "The distinct count of reporter user id's within the grouping."
    type: count_distinct
    sql: ${reporter_user_id} ;;
  }



  measure: num_timeline_events_sum {
    group_label: "Num Timeline Events Measures"
    label: "Num Timeline Events (Sum)"
    description: "The sum of Num Timeline Events across all instances within the grouping."
    type: sum
    sql: ${num_timeline_events} ;;
  }

  measure: num_timeline_events_avg {
    group_label: "Num Timeline Events Measures"
    label: "Num Timeline Events (Avg)"
    description: "The average Num Timeline Events across all instances within the grouping."
    type: average
    sql: ${num_timeline_events} ;;
  }

  measure: num_timeline_events_median {
    group_label: "Num Timeline Events Measures"
    label: "Num Timeline Events (Median)"
    description: "The median Num Timeline Events across all instances within the grouping."
    type: median
    sql: ${num_timeline_events} ;;
  }

  measure: team_id_count {
    group_label: "Team Counts"
    label: "Teams"
    description: "The distinct count of team id's within the grouping."
    type: count_distinct
    sql: ${team_id} ;;
  }

  measure: totalchecklistitems_avg {
    group_label: "Checklist Item Measures"
    label: "Total Checklist Items (Avg)"
    description: "The average Totalchecklistitems across all instances within the grouping."
    type: average
    sql: ${totalchecklistitems} ;;
  }

  measure: totalchecklistitems_median {
    group_label: "Checklist Item Measures"
    label: "Total Checklist Items (Median)"
    description: "The median Totalchecklistitems across all instances within the grouping."
    type: median
    sql: ${totalchecklistitems} ;;
  }



  measure: commanderuserid_count {
    group_label: "Commanderuserid"
    label: "Commanderuserid"
    description: "The distinct count of commanderuserid's within the grouping."
    type: count_distinct
    sql: ${commanderuserid} ;;
  }

}
