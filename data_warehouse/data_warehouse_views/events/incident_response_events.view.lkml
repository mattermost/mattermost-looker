# This is the view file for the analytics.events.incident_response_events table.
view: incident_response_events {
  sql_table_name: events.incident_response_events ;;
  view_label: "Incident Response Events"

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
    sql: CASE WHEN regexp_substr(${pluginversion}, '^[0-9]{1,2}.{1}[0-9]{1,2}.{1}[0-9]{1,2}$') IS NULL OR (COALESCE(${version_release_dates.release_date}, CURRENT_DATE + INTERVAL '1 DAY') > CURRENT_DATE AND not ${server_fact.cloud_server})
    OR ${user_id} IN  ('ctjqfcwp9ig6xnfdtxz3mgk7uy','g6mwsqa5yibutnqfggp67fbs1w', '4k15shdyrfr39m9h675xy1pssw') OR regexp_substr(${server_fact.version}, '^[0-9]{1,2}.{1}[0-9]{1,2}.{1}[0-9]{1,2}$') IS NULL THEN TRUE ELSE FALSE END ;;
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
    description: ""
    type: string
    sql: COALESCE(${TABLE}.commanderuserid, ${TABLE}.commanderuserid) ;;
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
    sql: ${TABLE}.currentstatus ;;
    hidden: no
  }

  dimension: remindertimersecond {
    group_label: "Incident Dimensions"
    label: "Reminder Timer (Seconds)"
    description: ""
    type: number
    sql: ${TABLE}.remindertimerseconds ;;
    hidden: no
  }

  dimension: remindertimerdefaultsecond {
    group_label: "Playbook Dimensions"
    label: "Reminder Timer Default (Seconds)"
    description: ""
    type: number
    sql: ${TABLE}.remindertimedefaultseconds ;;
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
    sql: ${TABLE}.useremindermessagetemplate ;;
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
    hidden: no
  }

  dimension: serverversion {
    label: "Server Version"
    description: ""
    type: string
    sql: COALESCE(${TABLE}.serverversion, ${TABLE}.server_version) ;;
    hidden: no
  }

  dimension: serverversion_major {
    label: "Server Version (Major)"
    description: ""
    type: string
    sql: SPLIT_PART(${TABLE}.serverversion, '.', 1) || '.' || SPLIT_PART(${TABLE}.serverversion, '.', 2) ;;
    hidden: no
}

  dimension: numslashcommands {
    group_label: "Playbook Dimensions"
    description: ""
    type: number
    sql: ${TABLE}.numslashcommands ;;
    hidden: no
  }

  dimension: ispublic {
    group_label: "Playbook Dimensions"
    description: ""
    type: yesno
    sql: ${TABLE}.ispublic ;;
    hidden: no
  }

  dimension: nummembers {
    group_label: "Playbook Dimensions"
    label: "# of Members"
    description: ""
    type: number
    sql: ${TABLE}.nummembers ;;
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
    description: ""
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


  # MEASURES
  measure: count {
    description: "Count of rows/occurrences."
    type: count
    drill_fields: [incidents_drill*]
  }

  measure: anonymous_count {
    label: " Anonymous ID Count"
    description: "The distinct count of Anonymouss per grouped dimension(s)."
    type: count_distinct
    sql: ${anonymous_id} ;;
    drill_fields: [incidents_drill*]
    hidden: yes
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
    label: "Checklist Items Sum"
    description: "The sum of Totalchecklistitems per grouped dimension(s)."
    type: sum
    sql: ${totalchecklistitems} ;;
    drill_fields: [incidents_drill*]
  }

  measure: checklists_sum {
    label: "Checklists Sum"
    description: "The sum of Playbook Totalchecklistitems per grouped dimension(s)."
    type: sum
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


}
