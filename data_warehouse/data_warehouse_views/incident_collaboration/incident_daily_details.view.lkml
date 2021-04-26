# This is the view file for the analytics.incident_collaboration.incident_daily_details table.
view: incident_daily_details {
  sql_table_name: incident_collaboration.incident_daily_details ;;
  view_label: "Incident Daily Details"

  # FILTERS

  # DIMENSIONS
  dimension: id {
    description: ""
    type: string
    sql: ${TABLE}.id ;;
    hidden: no
  }

  dimension: server_id {
    description: ""
    type: string
    sql: ${TABLE}.server_id ;;
    hidden: yes
  }

  dimension: plugin_version {
    description: ""
    type: string
    sql: ${TABLE}.plugin_version ;;
    hidden: no
  }

  dimension: playbooks {
    description: ""
    type: number
    sql: ${TABLE}.playbooks ;;
    hidden: no
  }

  dimension: playbooks_created {
    description: ""
    type: number
    sql: ${TABLE}.playbooks_created ;;
    hidden: no
  }

  dimension: playbooks_edited {
    description: ""
    type: number
    sql: ${TABLE}.playbooks_edited ;;
    hidden: no
  }

  dimension: playbooks_deleted {
    description: ""
    type: number
    sql: ${TABLE}.playbooks_deleted ;;
    hidden: no
  }

  dimension: reported_incidents {
    description: ""
    type: number
    sql: ${TABLE}.reported_incidents ;;
    hidden: no
  }

  dimension: acknowledged_incidents {
    description: ""
    type: number
    sql: ${TABLE}.acknowledged_incidents ;;
    hidden: no
  }

  dimension: archived_incidents {
    description: ""
    type: number
    sql: ${TABLE}.archived_incidents ;;
    hidden: no
  }

  dimension: resolved_incidents {
    description: ""
    type: number
    sql: ${TABLE}.resolved_incidents ;;
    hidden: no
  }

  dimension: incident_contributors {
    description: ""
    type: number
    sql: ${TABLE}.incident_contributors ;;
    hidden: no
  }

  dimension: status_updates {
    description: ""
    type: number
    sql: ${TABLE}.status_updates ;;
    hidden: no
  }

  dimension: stages_changed {
    description: ""
    type: number
    sql: ${TABLE}.stages_changed ;;
    hidden: no
  }

  dimension: timeline_events_added {
    description: ""
    type: number
    sql: ${TABLE}.timeline_events_added ;;
    hidden: no
  }

  dimension: commanders_changed {
    description: ""
    type: number
    sql: ${TABLE}.commanders_changed ;;
    hidden: no
  }

  dimension: timeline_tab_clicks {
    description: ""
    type: number
    sql: ${TABLE}.timeline_tab_clicks ;;
    hidden: no
  }

  dimension: ended_incident {
    description: ""
    type: number
    sql: ${TABLE}.ended_incident ;;
    hidden: no
  }

  dimension: restarted_incident {
    description: ""
    type: number
    sql: ${TABLE}.restarted_incident ;;
    hidden: no
  }

  dimension: task_assignees_set {
    description: ""
    type: number
    sql: ${TABLE}.task_assignees_set ;;
    hidden: no
  }

  dimension: task_states_modified {
    description: ""
    type: number
    sql: ${TABLE}.task_states_modified ;;
    hidden: no
  }

  dimension: tasks_added {
    description: ""
    type: number
    sql: ${TABLE}.tasks_added ;;
    hidden: no
  }

  dimension: tasks_removed {
    description: ""
    type: number
    sql: ${TABLE}.tasks_removed ;;
    hidden: no
  }

  dimension: tasks_renamed {
    description: ""
    type: number
    sql: ${TABLE}.tasks_renamed ;;
    hidden: no
  }

  dimension: task_slash_commands_run {
    description: ""
    type: number
    sql: ${TABLE}.task_slash_commands_run ;;
    hidden: no
  }

  dimension: tasks_moved {
    description: ""
    type: number
    sql: ${TABLE}.tasks_moved ;;
    hidden: no
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


  # MEASURES
  measure: count {
    description: "Count of rows/occurrences."
    type: count
  }

  measure: id_count {
    label: " Id Count"
    description: "The distinct count of Incident Daily Details Id within each grouping."
    type: count_distinct
    sql: ${id} ;;
  }

  measure: server_count {
    label: " Incident Collaboration Instances"
    group_label: "Instance Counts"
    description: "The distinct count of Incident Daily Details Servers within each grouping."
    type: count_distinct
    sql: ${server_id} ;;
  }

  measure: playbooks_sum {
    description: "The Sum of Playbook."
    type: sum
    group_label: "Playbooks Measures"
    sql: ${playbooks} ;;
  }

  measure: playbooks_max {
    description: "The Max. Playbook."
    type: max
    group_label: "Playbooks Measures"
    sql: ${playbooks} ;;
  }

  measure: playbooks_min {
    description: "The Min. Playbook."
    type: min
    group_label: "Playbooks Measures"
    sql: ${playbooks} ;;
  }

  measure: playbooks_avg {
    description: "The Average Playbook."
    type: average
    group_label: "Playbooks Measures"
    sql: ${playbooks} ;;
  }

  measure: playbooks_median {
    description: "The Median Playbook."
    type: median
    group_label: "Playbooks Measures"
    sql: ${playbooks} ;;
  }

  measure: instances_with_playbooks_created {
    description: "The distinct count of instances that have Playbooks Created."
    type: count_distinct
    group_label: "Instance Counts"
    sql: CASE WHEN ${playbooks_created} > 0 THEN ${server_id} ELSE NULL END ;;
  }

  measure: playbooks_created_sum {
    description: "The Sum of Playbooks Created."
    type: sum
    group_label: "Playbooks Created Measures"
    sql: ${playbooks_created} ;;
  }

  measure: playbooks_created_max {
    description: "The Max. Playbooks Created."
    type: max
    group_label: "Playbooks Created Measures"
    sql: ${playbooks_created} ;;
  }

  measure: playbooks_created_min {
    description: "The Min. Playbooks Created."
    type: min
    group_label: "Playbooks Created Measures"
    sql: ${playbooks_created} ;;
  }

  measure: playbooks_created_avg {
    description: "The Average Playbooks Created."
    type: average
    group_label: "Playbooks Created Measures"
    sql: ${playbooks_created} ;;
  }

  measure: playbooks_created_median {
    description: "The Median Playbooks Created."
    type: median
    group_label: "Playbooks Created Measures"
    sql: ${playbooks_created} ;;
  }

  measure: instances_with_playbooks_edited {
    description: "The distinct count of instances that have Playbooks Edited."
    type: count_distinct
    group_label: "Instance Counts"
    sql: CASE WHEN ${playbooks_edited} > 0 THEN ${server_id} ELSE NULL END ;;
  }

  measure: playbooks_edited_sum {
    description: "The Sum of Playbooks Edited."
    type: sum
    group_label: "Playbooks Edited Measures"
    sql: ${playbooks_edited} ;;
  }

  measure: playbooks_edited_max {
    description: "The Max. Playbooks Edited."
    type: max
    group_label: "Playbooks Edited Measures"
    sql: ${playbooks_edited} ;;
  }

  measure: playbooks_edited_min {
    description: "The Min. Playbooks Edited."
    type: min
    group_label: "Playbooks Edited Measures"
    sql: ${playbooks_edited} ;;
  }

  measure: playbooks_edited_avg {
    description: "The Average Playbooks Edited."
    type: average
    group_label: "Playbooks Edited Measures"
    sql: ${playbooks_edited} ;;
  }

  measure: playbooks_edited_median {
    description: "The Median Playbooks Edited."
    type: median
    group_label: "Playbooks Edited Measures"
    sql: ${playbooks_edited} ;;
  }

  measure: instances_with_playbooks_deleted {
    description: "The distinct count of instances that have Playbooks Deleted."
    type: count_distinct
    group_label: "Instance Counts"
    sql: CASE WHEN ${playbooks_deleted} > 0 THEN ${server_id} ELSE NULL END ;;
  }

  measure: playbooks_deleted_sum {
    description: "The Sum of Playbooks Deleted."
    type: sum
    group_label: "Playbooks Deleted Measures"
    sql: ${playbooks_deleted} ;;
  }

  measure: playbooks_deleted_max {
    description: "The Max. Playbooks Deleted."
    type: max
    group_label: "Playbooks Deleted Measures"
    sql: ${playbooks_deleted} ;;
  }

  measure: playbooks_deleted_min {
    description: "The Min. Playbooks Deleted."
    type: min
    group_label: "Playbooks Deleted Measures"
    sql: ${playbooks_deleted} ;;
  }

  measure: playbooks_deleted_avg {
    description: "The Average Playbooks Deleted."
    type: average
    group_label: "Playbooks Deleted Measures"
    sql: ${playbooks_deleted} ;;
  }

  measure: playbooks_deleted_median {
    description: "The Median Playbooks Deleted."
    type: median
    group_label: "Playbooks Deleted Measures"
    sql: ${playbooks_deleted} ;;
  }

  measure: instances_with_reported_incidents {
    description: "The distinct count of instances that have Reported Incident."
    type: count_distinct
    group_label: "Instance Counts"
    sql: CASE WHEN ${reported_incidents} > 0 THEN ${server_id} ELSE NULL END ;;
  }

  measure: reported_incidents_sum {
    description: "The Sum of Reported Incident."
    type: sum
    group_label: "Reported Incidents Measures"
    sql: ${reported_incidents} ;;
  }

  measure: reported_incidents_max {
    description: "The Max. Reported Incident."
    type: max
    group_label: "Reported Incidents Measures"
    sql: ${reported_incidents} ;;
  }

  measure: reported_incidents_min {
    description: "The Min. Reported Incident."
    type: min
    group_label: "Reported Incidents Measures"
    sql: ${reported_incidents} ;;
  }

  measure: reported_incidents_avg {
    description: "The Average Reported Incident."
    type: average
    group_label: "Reported Incidents Measures"
    sql: ${reported_incidents} ;;
  }

  measure: reported_incidents_median {
    description: "The Median Reported Incident."
    type: median
    group_label: "Reported Incidents Measures"
    sql: ${reported_incidents} ;;
  }

  measure: instances_with_acknowledged_incidents {
    description: "The distinct count of instances that have Acknowledged Incident."
    type: count_distinct
    group_label: "Instance Counts"
    sql: CASE WHEN ${acknowledged_incidents} > 0 THEN ${server_id} ELSE NULL END ;;
  }

  measure: acknowledged_incidents_sum {
    description: "The Sum of Acknowledged Incident."
    type: sum
    group_label: "Acknowledged Incidents Measures"
    sql: ${acknowledged_incidents} ;;
  }

  measure: acknowledged_incidents_max {
    description: "The Max. Acknowledged Incident."
    type: max
    group_label: "Acknowledged Incidents Measures"
    sql: ${acknowledged_incidents} ;;
  }

  measure: acknowledged_incidents_min {
    description: "The Min. Acknowledged Incident."
    type: min
    group_label: "Acknowledged Incidents Measures"
    sql: ${acknowledged_incidents} ;;
  }

  measure: acknowledged_incidents_avg {
    description: "The Average Acknowledged Incident."
    type: average
    group_label: "Acknowledged Incidents Measures"
    sql: ${acknowledged_incidents} ;;
  }

  measure: acknowledged_incidents_median {
    description: "The Median Acknowledged Incident."
    type: median
    group_label: "Acknowledged Incidents Measures"
    sql: ${acknowledged_incidents} ;;
  }

  measure: instances_with_archived_incidents {
    description: "The distinct count of instances that have Archived Incident."
    type: count_distinct
    group_label: "Instance Counts"
    sql: CASE WHEN ${archived_incidents} > 0 THEN ${server_id} ELSE NULL END ;;
  }

  measure: archived_incidents_sum {
    description: "The Sum of Archived Incident."
    type: sum
    group_label: "Archived Incidents Measures"
    sql: ${archived_incidents} ;;
  }

  measure: archived_incidents_max {
    description: "The Max. Archived Incident."
    type: max
    group_label: "Archived Incidents Measures"
    sql: ${archived_incidents} ;;
  }

  measure: archived_incidents_min {
    description: "The Min. Archived Incident."
    type: min
    group_label: "Archived Incidents Measures"
    sql: ${archived_incidents} ;;
  }

  measure: archived_incidents_avg {
    description: "The Average Archived Incident."
    type: average
    group_label: "Archived Incidents Measures"
    sql: ${archived_incidents} ;;
  }

  measure: archived_incidents_median {
    description: "The Median Archived Incident."
    type: median
    group_label: "Archived Incidents Measures"
    sql: ${archived_incidents} ;;
  }

  measure: instances_with_resolved_incidents {
    description: "The distinct count of instances that have Resolved Incident."
    type: count_distinct
    group_label: "Instance Counts"
    sql: CASE WHEN ${resolved_incidents} > 0 THEN ${server_id} ELSE NULL END ;;
  }

  measure: resolved_incidents_sum {
    description: "The Sum of Resolved Incident."
    type: sum
    group_label: "Resolved Incidents Measures"
    sql: ${resolved_incidents} ;;
  }

  measure: resolved_incidents_max {
    description: "The Max. Resolved Incident."
    type: max
    group_label: "Resolved Incidents Measures"
    sql: ${resolved_incidents} ;;
  }

  measure: resolved_incidents_min {
    description: "The Min. Resolved Incident."
    type: min
    group_label: "Resolved Incidents Measures"
    sql: ${resolved_incidents} ;;
  }

  measure: resolved_incidents_avg {
    description: "The Average Resolved Incident."
    type: average
    group_label: "Resolved Incidents Measures"
    sql: ${resolved_incidents} ;;
  }

  measure: resolved_incidents_median {
    description: "The Median Resolved Incident."
    type: median
    group_label: "Resolved Incidents Measures"
    sql: ${resolved_incidents} ;;
  }

  measure: incident_contributors_sum {
    description: "The Sum of Incident Contributor."
    type: sum
    group_label: "Incident Contributors Measures"
    sql: ${incident_contributors} ;;
  }

  measure: incident_contributors_max {
    description: "The Max. Incident Contributor."
    type: max
    group_label: "Incident Contributors Measures"
    sql: ${incident_contributors} ;;
  }

  measure: incident_contributors_min {
    description: "The Min. Incident Contributor."
    type: min
    group_label: "Incident Contributors Measures"
    sql: ${incident_contributors} ;;
  }

  measure: incident_contributors_avg {
    description: "The Average Incident Contributor."
    type: average
    group_label: "Incident Contributors Measures"
    sql: ${incident_contributors} ;;
  }

  measure: incident_contributors_median {
    description: "The Median Incident Contributor."
    type: median
    group_label: "Incident Contributors Measures"
    sql: ${incident_contributors} ;;
  }

  measure: status_updates_sum {
    description: "The Sum of Status Update."
    type: sum
    group_label: "Status Updates Measures"
    sql: ${status_updates} ;;
  }

  measure: status_updates_max {
    description: "The Max. Status Update."
    type: max
    group_label: "Status Updates Measures"
    sql: ${status_updates} ;;
  }

  measure: status_updates_min {
    description: "The Min. Status Update."
    type: min
    group_label: "Status Updates Measures"
    sql: ${status_updates} ;;
  }

  measure: status_updates_avg {
    description: "The Average Status Update."
    type: average
    group_label: "Status Updates Measures"
    sql: ${status_updates} ;;
  }

  measure: status_updates_median {
    description: "The Median Status Update."
    type: median
    group_label: "Status Updates Measures"
    sql: ${status_updates} ;;
  }

  measure: stages_changed_sum {
    description: "The Sum of Stages Changed."
    type: sum
    group_label: "Stages Changed Measures"
    sql: ${stages_changed} ;;
  }

  measure: stages_changed_max {
    description: "The Max. Stages Changed."
    type: max
    group_label: "Stages Changed Measures"
    sql: ${stages_changed} ;;
  }

  measure: stages_changed_min {
    description: "The Min. Stages Changed."
    type: min
    group_label: "Stages Changed Measures"
    sql: ${stages_changed} ;;
  }

  measure: stages_changed_avg {
    description: "The Average Stages Changed."
    type: average
    group_label: "Stages Changed Measures"
    sql: ${stages_changed} ;;
  }

  measure: stages_changed_median {
    description: "The Median Stages Changed."
    type: median
    group_label: "Stages Changed Measures"
    sql: ${stages_changed} ;;
  }

  measure: timeline_events_added_sum {
    description: "The Sum of Timeline Events Added."
    type: sum
    group_label: "Timeline Events Added Measures"
    sql: ${timeline_events_added} ;;
  }

  measure: timeline_events_added_max {
    description: "The Max. Timeline Events Added."
    type: max
    group_label: "Timeline Events Added Measures"
    sql: ${timeline_events_added} ;;
  }

  measure: timeline_events_added_min {
    description: "The Min. Timeline Events Added."
    type: min
    group_label: "Timeline Events Added Measures"
    sql: ${timeline_events_added} ;;
  }

  measure: timeline_events_added_avg {
    description: "The Average Timeline Events Added."
    type: average
    group_label: "Timeline Events Added Measures"
    sql: ${timeline_events_added} ;;
  }

  measure: timeline_events_added_median {
    description: "The Median Timeline Events Added."
    type: median
    group_label: "Timeline Events Added Measures"
    sql: ${timeline_events_added} ;;
  }

  measure: commanders_changed_sum {
    description: "The Sum of Commanders Changed."
    type: sum
    group_label: "Commanders Changed Measures"
    sql: ${commanders_changed} ;;
  }

  measure: commanders_changed_max {
    description: "The Max. Commanders Changed."
    type: max
    group_label: "Commanders Changed Measures"
    sql: ${commanders_changed} ;;
  }

  measure: commanders_changed_min {
    description: "The Min. Commanders Changed."
    type: min
    group_label: "Commanders Changed Measures"
    sql: ${commanders_changed} ;;
  }

  measure: commanders_changed_avg {
    description: "The Average Commanders Changed."
    type: average
    group_label: "Commanders Changed Measures"
    sql: ${commanders_changed} ;;
  }

  measure: commanders_changed_median {
    description: "The Median Commanders Changed."
    type: median
    group_label: "Commanders Changed Measures"
    sql: ${commanders_changed} ;;
  }

  measure: timeline_tab_clicks_sum {
    description: "The Sum of Timeline Tab Click."
    type: sum
    group_label: "Timeline Tab Clicks Measures"
    sql: ${timeline_tab_clicks} ;;
  }

  measure: timeline_tab_clicks_max {
    description: "The Max. Timeline Tab Click."
    type: max
    group_label: "Timeline Tab Clicks Measures"
    sql: ${timeline_tab_clicks} ;;
  }

  measure: timeline_tab_clicks_min {
    description: "The Min. Timeline Tab Click."
    type: min
    group_label: "Timeline Tab Clicks Measures"
    sql: ${timeline_tab_clicks} ;;
  }

  measure: timeline_tab_clicks_avg {
    description: "The Average Timeline Tab Click."
    type: average
    group_label: "Timeline Tab Clicks Measures"
    sql: ${timeline_tab_clicks} ;;
  }

  measure: timeline_tab_clicks_median {
    description: "The Median Timeline Tab Click."
    type: median
    group_label: "Timeline Tab Clicks Measures"
    sql: ${timeline_tab_clicks} ;;
  }

  measure: ended_incident_sum {
    description: "The Sum of Ended Incident."
    type: sum
    group_label: "Ended Incident Measures"
    sql: ${ended_incident} ;;
  }

  measure: ended_incident_max {
    description: "The Max. Ended Incident."
    type: max
    group_label: "Ended Incident Measures"
    sql: ${ended_incident} ;;
  }

  measure: ended_incident_min {
    description: "The Min. Ended Incident."
    type: min
    group_label: "Ended Incident Measures"
    sql: ${ended_incident} ;;
  }

  measure: ended_incident_avg {
    description: "The Average Ended Incident."
    type: average
    group_label: "Ended Incident Measures"
    sql: ${ended_incident} ;;
  }

  measure: ended_incident_median {
    description: "The Median Ended Incident."
    type: median
    group_label: "Ended Incident Measures"
    sql: ${ended_incident} ;;
  }

  measure: restarted_incident_sum {
    description: "The Sum of Restarted Incident."
    type: sum
    group_label: "Restarted Incident Measures"
    sql: ${restarted_incident} ;;
  }

  measure: restarted_incident_max {
    description: "The Max. Restarted Incident."
    type: max
    group_label: "Restarted Incident Measures"
    sql: ${restarted_incident} ;;
  }

  measure: restarted_incident_min {
    description: "The Min. Restarted Incident."
    type: min
    group_label: "Restarted Incident Measures"
    sql: ${restarted_incident} ;;
  }

  measure: restarted_incident_avg {
    description: "The Average Restarted Incident."
    type: average
    group_label: "Restarted Incident Measures"
    sql: ${restarted_incident} ;;
  }

  measure: restarted_incident_median {
    description: "The Median Restarted Incident."
    type: median
    group_label: "Restarted Incident Measures"
    sql: ${restarted_incident} ;;
  }

  measure: task_assignees_set_sum {
    description: "The Sum of Task Assignees Set."
    type: sum
    group_label: "Task Assignees Set Measures"
    sql: ${task_assignees_set} ;;
  }

  measure: task_assignees_set_max {
    description: "The Max. Task Assignees Set."
    type: max
    group_label: "Task Assignees Set Measures"
    sql: ${task_assignees_set} ;;
  }

  measure: task_assignees_set_min {
    description: "The Min. Task Assignees Set."
    type: min
    group_label: "Task Assignees Set Measures"
    sql: ${task_assignees_set} ;;
  }

  measure: task_assignees_set_avg {
    description: "The Average Task Assignees Set."
    type: average
    group_label: "Task Assignees Set Measures"
    sql: ${task_assignees_set} ;;
  }

  measure: task_assignees_set_median {
    description: "The Median Task Assignees Set."
    type: median
    group_label: "Task Assignees Set Measures"
    sql: ${task_assignees_set} ;;
  }

  measure: task_states_modified_sum {
    description: "The Sum of Task States Modified."
    type: sum
    group_label: "Task States Modified Measures"
    sql: ${task_states_modified} ;;
  }

  measure: task_states_modified_max {
    description: "The Max. Task States Modified."
    type: max
    group_label: "Task States Modified Measures"
    sql: ${task_states_modified} ;;
  }

  measure: task_states_modified_min {
    description: "The Min. Task States Modified."
    type: min
    group_label: "Task States Modified Measures"
    sql: ${task_states_modified} ;;
  }

  measure: task_states_modified_avg {
    description: "The Average Task States Modified."
    type: average
    group_label: "Task States Modified Measures"
    sql: ${task_states_modified} ;;
  }

  measure: task_states_modified_median {
    description: "The Median Task States Modified."
    type: median
    group_label: "Task States Modified Measures"
    sql: ${task_states_modified} ;;
  }

  measure: tasks_added_sum {
    description: "The Sum of Tasks Added."
    type: sum
    group_label: "Tasks Added Measures"
    sql: ${tasks_added} ;;
  }

  measure: tasks_added_max {
    description: "The Max. Tasks Added."
    type: max
    group_label: "Tasks Added Measures"
    sql: ${tasks_added} ;;
  }

  measure: tasks_added_min {
    description: "The Min. Tasks Added."
    type: min
    group_label: "Tasks Added Measures"
    sql: ${tasks_added} ;;
  }

  measure: tasks_added_avg {
    description: "The Average Tasks Added."
    type: average
    group_label: "Tasks Added Measures"
    sql: ${tasks_added} ;;
  }

  measure: tasks_added_median {
    description: "The Median Tasks Added."
    type: median
    group_label: "Tasks Added Measures"
    sql: ${tasks_added} ;;
  }

  measure: tasks_removed_sum {
    description: "The Sum of Tasks Removed."
    type: sum
    group_label: "Tasks Removed Measures"
    sql: ${tasks_removed} ;;
  }

  measure: tasks_removed_max {
    description: "The Max. Tasks Removed."
    type: max
    group_label: "Tasks Removed Measures"
    sql: ${tasks_removed} ;;
  }

  measure: tasks_removed_min {
    description: "The Min. Tasks Removed."
    type: min
    group_label: "Tasks Removed Measures"
    sql: ${tasks_removed} ;;
  }

  measure: tasks_removed_avg {
    description: "The Average Tasks Removed."
    type: average
    group_label: "Tasks Removed Measures"
    sql: ${tasks_removed} ;;
  }

  measure: tasks_removed_median {
    description: "The Median Tasks Removed."
    type: median
    group_label: "Tasks Removed Measures"
    sql: ${tasks_removed} ;;
  }

  measure: tasks_renamed_sum {
    description: "The Sum of Tasks Renamed."
    type: sum
    group_label: "Tasks Renamed Measures"
    sql: ${tasks_renamed} ;;
  }

  measure: tasks_renamed_max {
    description: "The Max. Tasks Renamed."
    type: max
    group_label: "Tasks Renamed Measures"
    sql: ${tasks_renamed} ;;
  }

  measure: tasks_renamed_min {
    description: "The Min. Tasks Renamed."
    type: min
    group_label: "Tasks Renamed Measures"
    sql: ${tasks_renamed} ;;
  }

  measure: tasks_renamed_avg {
    description: "The Average Tasks Renamed."
    type: average
    group_label: "Tasks Renamed Measures"
    sql: ${tasks_renamed} ;;
  }

  measure: tasks_renamed_median {
    description: "The Median Tasks Renamed."
    type: median
    group_label: "Tasks Renamed Measures"
    sql: ${tasks_renamed} ;;
  }

  measure: task_slash_commands_run_sum {
    description: "The Sum of Task Slash Commands Run."
    type: sum
    group_label: "Task Slash Commands Run Measures"
    sql: ${task_slash_commands_run} ;;
  }

  measure: task_slash_commands_run_max {
    description: "The Max. Task Slash Commands Run."
    type: max
    group_label: "Task Slash Commands Run Measures"
    sql: ${task_slash_commands_run} ;;
  }

  measure: task_slash_commands_run_min {
    description: "The Min. Task Slash Commands Run."
    type: min
    group_label: "Task Slash Commands Run Measures"
    sql: ${task_slash_commands_run} ;;
  }

  measure: task_slash_commands_run_avg {
    description: "The Average Task Slash Commands Run."
    type: average
    group_label: "Task Slash Commands Run Measures"
    sql: ${task_slash_commands_run} ;;
  }

  measure: task_slash_commands_run_median {
    description: "The Median Task Slash Commands Run."
    type: median
    group_label: "Task Slash Commands Run Measures"
    sql: ${task_slash_commands_run} ;;
  }

  measure: tasks_moved_sum {
    description: "The Sum of Tasks Moved."
    type: sum
    group_label: "Tasks Moved Measures"
    sql: ${tasks_moved} ;;
  }

  measure: tasks_moved_max {
    description: "The Max. Tasks Moved."
    type: max
    group_label: "Tasks Moved Measures"
    sql: ${tasks_moved} ;;
  }

  measure: tasks_moved_min {
    description: "The Min. Tasks Moved."
    type: min
    group_label: "Tasks Moved Measures"
    sql: ${tasks_moved} ;;
  }

  measure: tasks_moved_avg {
    description: "The Average Tasks Moved."
    type: average
    group_label: "Tasks Moved Measures"
    sql: ${tasks_moved} ;;
  }

  measure: tasks_moved_median {
    description: "The Median Tasks Moved."
    type: median
    group_label: "Tasks Moved Measures"
    sql: ${tasks_moved} ;;
  }


}
