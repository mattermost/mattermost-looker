# This is the view file for the analytics.events.incident_response_events table.
view: incident_response_events {
  sql_table_name: events.incident_response_events ;;
  view_label: "Incident Response Events"

  # DRILL SETS
  set: incidents_drill {
    fields: [timestamp_date, id, user_id, useractualid, server_fact.company_name, event, pluginversion, serverversion, incidentid, playbookid, teamid, channelids, checklists_sum, totalchecklistitems_sum, nummember_sum, numslashcommands_sum]
  }

  # DIMENSIONS
  dimension: _dbt_source_relation {
    description: ""
    type: string
    sql: ${TABLE}._dbt_source_relation ;;
    hidden: yes
  }

  dimension: pluginversion {
    description: "The version of the Incident Response plugin used to perform the incident response events."
    type: string
    sql: ${TABLE}.pluginversion ;;
    hidden: no
  }

  dimension: context_library_name {
    description: ""
    type: string
    sql: ${TABLE}.context_library_name ;;
    hidden: no
  }

  dimension: event_text {
    description: ""
    type: string
    sql: ${TABLE}.event_text ;;
    hidden: yes
  }

  dimension: useractualid {
    label: "User ID"
    description: "The user id of the user performing the incident response event."
    type: string
    sql: COALESCE(${TABLE}.useractualid, ${commanderuserid}, ${TABLE}.userid) ;;
    hidden: no
  }

  dimension: context_ip {
    description: "The IP of the server of the user performing the incident response event."
    type: string
    sql: ${TABLE}.context_ip ;;
    hidden: no
  }

  dimension: incidentid {
    label: "Incident ID"
    description: "The Incident ID associated with the Incident Response event."
    type: string
    sql: ${TABLE}.incidentid ;;
    hidden: no
  }

  dimension: anonymous_id {
    label: "Anonymous ID"
    description: "Unique User ID generated by Rudderstack."
    type: string
    sql: ${TABLE}.anonymous_id ;;
    hidden: yes
  }

  dimension: event {
    label: "Event Name"
    description: "The name of the incident response event performed."
    type: string
    sql: ${TABLE}.event ;;
    hidden: no
  }

  dimension: user_id {
    label: "Server ID"
    description: "The server id associated with the user performing the Incident Response event."
    type: string
    sql: COALESCE(${TABLE}.user_id, ${anonymous_id}) ;;
    hidden: no
  }

  dimension: serverversion {
    label: "Server Version"
    group_label: "Server Versions"
    description: "The version of the server performing the incident response event."
    type: string
    sql: ${TABLE}.serverversion ;;
    hidden: no
    order_by_field: current_server_version_major_sort
  }

  dimension: serverversion_major {
    label: "Server Version (Major)"
    group_label: "Server Versions"
    description: "The version of the server performing the incident response event."
    type: string
    sql: SPLIT_PART(${serverversion}, '.', 1) || '.' || SPLIT_PART(${serverversion}, '.', 2) ;;
    hidden: no
    order_by_field: current_server_version_major_sort
  }

  dimension: current_server_version_major_sort {
    group_label: "Server Versions"
    label: "Current Server Version: Major (Sort)"
    description: "The current server version, or if current telemetry is not available, the last recorded server version recorded for the server."
    type: number
    sql: (split_part(${serverversion}, '.', 1) ||
          CASE WHEN split_part(${serverversion}, '.', 2) = '10' THEN '99'
            ELSE split_part(${serverversion}, '.', 2) || '0' END)::int ;;
    hidden: yes
  }

  dimension: id {
    description: "The unique ID of the event performed by the user (primary key)."
    type: string
    sql: ${TABLE}.id ;;
    hidden: no
  }

  dimension: context_library_version {
    description: ""
    type: string
    sql: ${TABLE}.context_library_version ;;
    hidden: yes
  }

  dimension: channel {
    description: ""
    type: string
    sql: ${TABLE}.channel ;;
    hidden: yes
  }

  dimension: createdat {
    description: ""
    type: number
    sql: ${TABLE}.createdat ;;
    hidden: yes
  }

  dimension: channelids_0 {
    description: "The channel id associated with the incident response event."
    type: string
    sql: COALESCE(${TABLE}.channelids_0, ${channel}) ;;
    hidden: yes
  }

  dimension: postid {
    label: "Post ID"
    description: "The post ID associated with the Incident Response event."
    type: string
    sql: ${TABLE}.postid ;;
    hidden: no
  }

  dimension: teamid {
    label: "Team ID"
    group_label: "Playbook Details"
    description: "The team id of the user performing the incident response event."
    type: string
    sql: COALESCE(${TABLE}.teamid, ${playbook_teamid}) ;;
    hidden: no
  }

  dimension: isactive {
    label: "Is Active"
    description: "Boolean indicating the Playbook is active."
    group_label: "Playbook Details"
    type: yesno
    sql: ${TABLE}.isactive ;;
    hidden: no
  }

  dimension: numchecklists {
    label: "Checklists"
    group_label: "Playbook Details"
    description: "The count of total checklists associated with the incident response playbook event."
    type: number
    sql: COALESCE(${TABLE}.numchecklists, ${playbook_numchecklists}) ;;
    hidden: no
  }

  dimension: totalchecklistitems {
    label: "Checklist Items"
    group_label: "Playbook Details"
    description: "The count of total checklist items associated with the incident response playbook event."
    type: number
    sql: ${TABLE}.totalchecklistitems ;;
    hidden: no
  }

  dimension: commanderuserid {
    description: "The user id of the commander user performing the event."
    type: string
    sql: ${TABLE}.commanderuserid ;;
    hidden: yes
  }

  dimension: public {
    description: "Boolean indicating the incident response playbook associated with the incident response event is public."
    group_label: "Playbook Details"
    type: yesno
    sql: COALESCE(${TABLE}.public, ${ispublic}) ;;
    hidden: no
  }

  dimension: channelids {
    label: "Playbook Channel ID's"
    description: "The channel id's associated with the incident response playbook."
    group_label: "Playbook Details"
    type: string
    sql: ${TABLE}.channelids ;;
    hidden: no
  }

  dimension: playbook_numchecklists {
    description: ""
    type: number
    sql: ${TABLE}.playbook_numchecklists ;;
    hidden: yes
  }

  dimension: playbook_numslashcommands {
    description: ""
    type: number
    sql: ${TABLE}.playbook_numslashcommands ;;
    hidden: yes
  }

  dimension: playbook_ispublic {
    description: ""
    type: yesno
    sql: ${TABLE}.playbook_ispublic ;;
    hidden: yes
  }

  dimension: playbook_teamid {
    description: ""
    type: string
    sql: ${TABLE}.playbook_teamid ;;
    hidden: yes
  }

  dimension: playbook_totalchecklistitems {
    description: ""
    type: number
    sql: ${TABLE}.playbook_totalchecklistitems ;;
    hidden: yes
  }

  dimension: activestage {
    label: "Active Stage"
    description: "The active stage of the playbook associated with the incident response event."
    type: number
    sql: ${TABLE}.activestage ;;
    hidden: no
  }

  dimension: playbook_nummembers {
    description: ""
    type: number
    sql: ${TABLE}.playbook_nummembers ;;
    hidden: yes
  }

  dimension: playbook_playbookid {
    description: ""
    type: string
    sql: ${TABLE}.playbook_playbookid ;;
    hidden: yes
  }

  dimension: playbookid {
    label: "Playbook ID"
    group_label: "Playbook Details"
    description: "The Playbook ID associated with the incident response event."
    type: string
    sql: COALESCE(${TABLE}.playbookid, ${playbook_playbookid}) ;;
    hidden: no
  }

  dimension: ispublic {
    description: ""
    type: yesno
    sql: ${TABLE}.ispublic ;;
    hidden: yes
  }

  dimension: numslashcommands {
    label: "Slash Commands"
    group_label: "Playbook Details"
    description: "The number of slash commands associated with an incident response playbook."
    type: number
    sql: COALESCE(${TABLE}.numslashcommands, ${playbook_numslashcommands});;
    hidden: no
  }

  dimension: nummembers {
    label: "Members"
    description: "The number of members associated with an incident response playbook."
    group_label: "Playbook Details"
    type: number
    sql: coalesce(${TABLE}.nummembers, ${playbook_nummembers}) ;;
    hidden: no
  }


  # DIMENSION GROUPS/DATES
  dimension_group: sent_at {
  description: ""
  type: time
  timeframes: [date, month, year]
    sql: ${TABLE}.sent_at ;;
    hidden: no
  }

  dimension_group: timestamp {
    label: "Logging"
  description: ""
  type: time
  timeframes: [date, month, year, week, fiscal_year, fiscal_quarter]
    sql: ${TABLE}.timestamp ;;
    hidden: no
  }

  dimension_group: original_timestamp {
  description: ""
  type: time
    timeframes: [date, month, year, week, fiscal_year, fiscal_quarter]
    sql: ${TABLE}.original_timestamp ;;
    hidden: yes
  }

  dimension_group: received_at {
  description: ""
  type: time
    timeframes: [date, month, year, week, fiscal_year, fiscal_quarter]
    sql: ${TABLE}.received_at ;;
    hidden: yes
  }

  dimension_group: uuid_ts {
  description: ""
  type: time
    timeframes: [date, month, year, week, fiscal_year, fiscal_quarter]
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
    sql: CASE WHEN ${event} = 'create_playbook' THEN ${id} ELSE NULL END;;
    drill_fields: [incidents_drill*]
    hidden: no
  }

  measure: playbook_deleted_count {
    label: " Playbooks Deleted"
    group_label: "Playbook Measures"
    description: "The distinct count of Playbook delete events per grouped dimension(s) (delete_playbook)."
    type: count_distinct
    sql: CASE WHEN ${event} = 'delete_playbook' THEN ${id} ELSE NULL END;;
    drill_fields: [incidents_drill*]
    hidden: no
  }

  measure: playbook_updated_count {
    label: " Playbooks Updated"
    group_label: "Playbook Measures"
    description: "The distinct count of Playbook update events per grouped dimension(s)."
    type: count_distinct
    sql: CASE WHEN ${event} = 'update_playbook' THEN ${id} ELSE NULL END;;
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
    sql: CASE WHEN ${event} = 'create_incident' THEN ${id} ELSE NULL END;;
    drill_fields: [incidents_drill*]
  }

  measure: incidents_ended_count {
    label: "Incidents Ended"
    group_label: "Incident Measures"
    description: "The count of distinct incidents ended per grouped dimension(s) (end_incident)."
    type: count_distinct
    sql: CASE WHEN ${event} = 'end_incident' THEN ${id} ELSE NULL END;;
    drill_fields: [incidents_drill*]
  }

  measure: change_stage_count {
    label: "Stages Changed"
    group_label: "Incident Measures"
    description: "The count of distinct incident stages changed per grouped dimension(s) (change_stage)."
    type: count_distinct
    sql: CASE WHEN ${event} = 'change_stage' THEN ${id} ELSE NULL END;;
    drill_fields: [incidents_drill*]
  }

  measure: incidents_restarted_count {
    label: "Incidents Restarted"
    group_label: "Incident Measures"
    description: "The count of distinct incidents restarted per grouped dimension(s) (restart_incident)."
    type: count_distinct
    sql: CASE WHEN ${event} = 'restart_incident' THEN ${id} ELSE NULL END;;
    drill_fields: [incidents_drill*]
  }

  measure: add_checklist_item_count {
    label: "Items Added"
    group_label: "Checklist Item Measures"
    description: "The total number of checklist items added per grouped dimension(s) (check_checklist_item)."
    type: count_distinct
    sql: CASE WHEN ${event} = 'add_checklist_item' THEN ${id} ELSE NULL END;;
    drill_fields: [incidents_drill*]
  }

  measure: check_checklist_count {
    label: "Items Checked"
    group_label: "Checklist Item Measures"
    description: "The total number of checklist items marked complete per grouped dimension(s) (check_checklist_item)."
    type: count_distinct
    sql: CASE WHEN ${event} = 'check_checklist_item' THEN ${id} ELSE NULL END;;
    drill_fields: [incidents_drill*]
  }

  measure: uncheck_checklist_count {
    label: "Items Unchecked"
    group_label: "Checklist Item Measures"
    description: "The total number of checklist items unmarked complete per grouped dimension(s) (uncheck_checklist_item)."
    type: count_distinct
    sql: CASE WHEN ${event} = 'uncheck_checklist_item' THEN ${id} ELSE NULL END;;
    drill_fields: [incidents_drill*]
  }

  measure: remove_checklist_count {
    label: "Items Removed"
    group_label: "Checklist Item Measures"
    description: "The total number of checklist items removed from checklists per grouped dimension(s) (remove_checklist_items)."
    type: count_distinct
    sql: CASE WHEN ${event} = 'remove_checklist_item' THEN ${id} ELSE NULL END;;
    drill_fields: [incidents_drill*]
  }

  measure: rename_checklist_count {
    label: "Items Renamed"
    group_label: "Checklist Item Measures"
    description: "The total number of checklist items renamed per grouped dimension(s) (rename_checklist_items)."
    type: count_distinct
    sql: CASE WHEN ${event} = 'rename_checklist_item' THEN ${id} ELSE NULL END;;
    drill_fields: [incidents_drill*]
  }

  measure: move_checklist_count {
    label: "Items Moved"
    group_label: "Checklist Item Measures"
    description: "The total number of checklist items moved/rearranged within checklists per grouped dimension(s) (move_checklist_item)."
    type: count_distinct
    sql: CASE WHEN ${event} = 'move_checklist_item' THEN ${id} ELSE NULL END;;
    drill_fields: [incidents_drill*]
  }

  measure: modify_state_checklist_item_count {
    label: "Item States Modified"
    group_label: "Checklist Item Measures"
    description: "The total number of checklist item states that have been modified per grouped dimension(s) (modify_state_checklist_item)."
    type: count_distinct
    sql: CASE WHEN ${event} = 'modify_state_checklist_item' THEN ${id} ELSE NULL END;;
    drill_fields: [incidents_drill*]
  }

  measure: run_checklist_slash_command_count {
    label: "Item Slash Commands Run"
    group_label: "Checklist Item Measures"
    description: "The count of distinct checklist item slash commands run/executed per grouped dimension(s) (run_checklist_item_slash_command)."
    type: count_distinct
    sql: CASE WHEN ${event} = 'run_checklist_item_slash_command' THEN ${id} ELSE NULL END;;
    drill_fields: [incidents_drill*]
  }

  measure: set_assignees_count {
    label: "Assignees Set"
    group_label: "IR Commander/Assignee Measures"
    description: "The total number of set assignee events performed per grouped dimension(s) (set_assignee)."
    type: count_distinct
    sql: CASE WHEN ${event} = 'set_assignee' THEN ${id} ELSE NULL END;;
    drill_fields: [incidents_drill*]
  }

  measure: change_commander_count {
    label: "Commanders Changed"
    group_label: "IR Commander/Assignee Measures"
    description: "The total number of change commander events performed per grouped dimension(s) (change_commander)."
    type: count_distinct
    sql: CASE WHEN ${event} = 'change_commander' THEN ${id} ELSE NULL END;;
    drill_fields: [incidents_drill*]
  }

  measure: numslashcommands_sum {
    label: "Slash Commands Sum"
    description: "The number of slash commands per grouped dimension(s)."
    type: sum
    sql: COALESCE(${TABLE}.numslashcommands, ${playbook_numslashcommands});;
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


}
