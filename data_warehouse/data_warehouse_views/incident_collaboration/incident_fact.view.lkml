# This is the view file for the analytics.incident_collaboration.incident_fact table.
view: incident_fact {
  sql_table_name: incident_collaboration.incident_fact ;;
  view_label: "Incident Fact"

  # FILTERS

  # DIMENSIONS
  dimension: id {
    description: "" 
    type: string
    sql: ${TABLE}.id ;;
    hidden: no
  }

  dimension: incident_id {
    description: "" 
    type: string
    sql: ${TABLE}.incident_id ;;
    hidden: no
  }

  dimension: server_id {
    description: "" 
    type: string
    sql: ${TABLE}.server_id ;;
    hidden: no
  }

  dimension: playbook_id {
    description: "" 
    type: string
    sql: ${TABLE}.playbook_id ;;
    hidden: no
  }

  dimension: reported {
    description: "" 
    type: yesno
    sql: ${TABLE}.reported ;;
    hidden: no
  }

  dimension: acknowledged {
    description: "" 
    type: yesno
    sql: ${TABLE}.acknowledged ;;
    hidden: no
  }

  dimension: resolved {
    description: "" 
    type: yesno
    sql: ${TABLE}.resolved ;;
    hidden: no
  }

  dimension: archived {
    description: "" 
    type: yesno
    sql: ${TABLE}.archived ;;
    hidden: no
  }

  dimension: incident_users {
    description: "" 
    type: number
    sql: ${TABLE}.incident_users ;;
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

  dimension: server_version {
    description: "" 
    type: string
    sql: ${TABLE}.server_version ;;
    hidden: no
  }

  dimension: plugin_version {
    description: "" 
    type: string
    sql: ${TABLE}.plugin_version ;;
    hidden: no
  }

  
  # DIMENSION GROUPS/DATES
  dimension_group: created_date {
	description: "" 
	type: time
	timeframes: [time, week, date, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.created_date ;;
    hidden: no
  }

  dimension_group: last_activity_date {
	description: "" 
	type: time
	timeframes: [time, week, date, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.last_activity_date ;;
    hidden: no
  }

  dimension_group: resolved_date {
	description: "" 
	type: time
	timeframes: [time, week, date, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.resolved_date ;;
    hidden: no
  }

  dimension_group: archived_date {
	description: "" 
	type: time
	timeframes: [time, week, date, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.archived_date ;;
    hidden: no
  }

  
  # MEASURES
  measure: count {
    description: "Count of rows/occurrences."
    type: count
  }

  measure: id_count {
    label: " Id Count"
    description: "The distinct count of Incident Fact Id within each grouping."
    type: count_distinct
    sql: ${id} ;;
  }

  measure: incident_count {
    label: " Incident Count"
    description: "The distinct count of Incident Fact Incidents within each grouping."
    type: count_distinct
    sql: ${incident_id} ;;
  }

  measure: server_count {
    label: " Server Count"
    description: "The distinct count of Incident Fact Servers within each grouping."
    type: count_distinct
    sql: ${server_id} ;;
  }

  measure: playbook_count {
    label: " Playbook Count"
    description: "The distinct count of Incident Fact Playbooks within each grouping."
    type: count_distinct
    sql: ${playbook_id} ;;
  }

  measure: reported_count {
    label: "Reported Users"
    description: "The distinct count of Incident Fact with Reported marked true."
    group_label: "User Counts"
    type: count_distinct
    sql: case when ${reported} then ${id} else null end ;;
  }

  measure: acknowledged_count {
    label: "Acknowledged Users"
    description: "The distinct count of Incident Fact with Acknowledged marked true."
    group_label: "User Counts"
    type: count_distinct
    sql: case when ${acknowledged} then ${id} else null end ;;
  }

  measure: resolved_count {
    label: "Resolved Users"
    description: "The distinct count of Incident Fact with Resolved marked true."
    group_label: "User Counts"
    type: count_distinct
    sql: case when ${resolved} then ${id} else null end ;;
  }

  measure: archived_count {
    label: "Archived Users"
    description: "The distinct count of Incident Fact with Archived marked true."
    group_label: "User Counts"
    type: count_distinct
    sql: case when ${archived} then ${id} else null end ;;
  }

  measure: incident_users_sum {
    description: "The sum of Incident Users within each grouping."
    type: sum
    group_label: "Incident Users Measures"
    sql: ${incident_users} ;;
  }

  measure: incident_users_max {
    description: "The max Incident Users within each grouping."
    type: max
    group_label: "Incident Users Measures"
    sql: ${incident_users} ;;
  }

  measure: incident_users_min {
    description: "The min Incident Users within each grouping."
    type: min
    group_label: "Incident Users Measures"
    sql: ${incident_users} ;;
  }

  measure: incident_users_avg {
    description: "The average Incident Users within each grouping."
    type: average
    group_label: "Incident Users Measures"
    sql: ${incident_users} ;;
  }

  measure: incident_users_median {
    description: "The median  Incident Users within each grouping."
    type: median
    group_label: "Incident Users Measures"
    sql: ${incident_users} ;;
  }

  measure: status_updates_max {
    description: "The max Status Updates within each grouping."
    type: max
    group_label: "Status Updates Measures"
    sql: ${status_updates} ;;
  }

  measure: status_updates_min {
    description: "The min Status Updates within each grouping."
    type: min
    group_label: "Status Updates Measures"
    sql: ${status_updates} ;;
  }

  measure: status_updates_avg {
    description: "The average Status Updates within each grouping."
    type: average
    group_label: "Status Updates Measures"
    sql: ${status_updates} ;;
  }

  measure: status_updates_median {
    description: "The median  Status Updates within each grouping."
    type: median
    group_label: "Status Updates Measures"
    sql: ${status_updates} ;;
  }

  measure: stages_changed_max {
    description: "The max Stages Changeds within each grouping."
    type: max
    group_label: "Stages Changed Measures"
    sql: ${stages_changed} ;;
  }

  measure: stages_changed_min {
    description: "The min Stages Changeds within each grouping."
    type: min
    group_label: "Stages Changed Measures"
    sql: ${stages_changed} ;;
  }

  measure: stages_changed_avg {
    description: "The average Stages Changeds within each grouping."
    type: average
    group_label: "Stages Changed Measures"
    sql: ${stages_changed} ;;
  }

  measure: stages_changed_median {
    description: "The median  Stages Changeds within each grouping."
    type: median
    group_label: "Stages Changed Measures"
    sql: ${stages_changed} ;;
  }

  measure: timeline_events_added_sum {
    description: "The sum of Timeline Events Addeds within each grouping."
    type: sum
    group_label: "Timeline Events Added Measures"
    sql: ${timeline_events_added} ;;
  }

  measure: timeline_events_added_max {
    description: "The max Timeline Events Addeds within each grouping."
    type: max
    group_label: "Timeline Events Added Measures"
    sql: ${timeline_events_added} ;;
  }

  measure: timeline_events_added_min {
    description: "The min Timeline Events Addeds within each grouping."
    type: min
    group_label: "Timeline Events Added Measures"
    sql: ${timeline_events_added} ;;
  }

  measure: timeline_events_added_avg {
    description: "The average Timeline Events Addeds within each grouping."
    type: average
    group_label: "Timeline Events Added Measures"
    sql: ${timeline_events_added} ;;
  }

  measure: timeline_events_added_median {
    description: "The median  Timeline Events Addeds within each grouping."
    type: median
    group_label: "Timeline Events Added Measures"
    sql: ${timeline_events_added} ;;
  }

  measure: commanders_changed_max {
    description: "The max Commanders Changeds within each grouping."
    type: max
    group_label: "Commanders Changed Measures"
    sql: ${commanders_changed} ;;
  }

  measure: commanders_changed_min {
    description: "The min Commanders Changeds within each grouping."
    type: min
    group_label: "Commanders Changed Measures"
    sql: ${commanders_changed} ;;
  }

  measure: commanders_changed_avg {
    description: "The average Commanders Changeds within each grouping."
    type: average
    group_label: "Commanders Changed Measures"
    sql: ${commanders_changed} ;;
  }

  measure: commanders_changed_median {
    description: "The median  Commanders Changeds within each grouping."
    type: median
    group_label: "Commanders Changed Measures"
    sql: ${commanders_changed} ;;
  }

  measure: timeline_tab_clicks_max {
    description: "The max Timeline Tab Clicks within each grouping."
    type: max
    group_label: "Timeline Tab Clicks Measures"
    sql: ${timeline_tab_clicks} ;;
  }

  measure: timeline_tab_clicks_min {
    description: "The min Timeline Tab Clicks within each grouping."
    type: min
    group_label: "Timeline Tab Clicks Measures"
    sql: ${timeline_tab_clicks} ;;
  }

  measure: timeline_tab_clicks_avg {
    description: "The average Timeline Tab Clicks within each grouping."
    type: average
    group_label: "Timeline Tab Clicks Measures"
    sql: ${timeline_tab_clicks} ;;
  }

  measure: timeline_tab_clicks_median {
    description: "The median  Timeline Tab Clicks within each grouping."
    type: median
    group_label: "Timeline Tab Clicks Measures"
    sql: ${timeline_tab_clicks} ;;
  }

  measure: ended_incident_max {
    description: "The max Ended Incidents within each grouping."
    type: max
    group_label: "Ended Incident Measures"
    sql: ${ended_incident} ;;
  }

  measure: ended_incident_min {
    description: "The min Ended Incidents within each grouping."
    type: min
    group_label: "Ended Incident Measures"
    sql: ${ended_incident} ;;
  }

  measure: ended_incident_avg {
    description: "The average Ended Incidents within each grouping."
    type: average
    group_label: "Ended Incident Measures"
    sql: ${ended_incident} ;;
  }

  measure: ended_incident_median {
    description: "The median  Ended Incidents within each grouping."
    type: median
    group_label: "Ended Incident Measures"
    sql: ${ended_incident} ;;
  }

  measure: restarted_incident_max {
    description: "The max Restarted Incidents within each grouping."
    type: max
    group_label: "Restarted Incident Measures"
    sql: ${restarted_incident} ;;
  }

  measure: restarted_incident_min {
    description: "The min Restarted Incidents within each grouping."
    type: min
    group_label: "Restarted Incident Measures"
    sql: ${restarted_incident} ;;
  }

  measure: restarted_incident_avg {
    description: "The average Restarted Incidents within each grouping."
    type: average
    group_label: "Restarted Incident Measures"
    sql: ${restarted_incident} ;;
  }

  measure: restarted_incident_median {
    description: "The median  Restarted Incidents within each grouping."
    type: median
    group_label: "Restarted Incident Measures"
    sql: ${restarted_incident} ;;
  }

  measure: task_assignees_set_max {
    description: "The max Task Assignees Sets within each grouping."
    type: max
    group_label: "Task Assignees Set Measures"
    sql: ${task_assignees_set} ;;
  }

  measure: task_assignees_set_min {
    description: "The min Task Assignees Sets within each grouping."
    type: min
    group_label: "Task Assignees Set Measures"
    sql: ${task_assignees_set} ;;
  }

  measure: task_assignees_set_avg {
    description: "The average Task Assignees Sets within each grouping."
    type: average
    group_label: "Task Assignees Set Measures"
    sql: ${task_assignees_set} ;;
  }

  measure: task_assignees_set_median {
    description: "The median  Task Assignees Sets within each grouping."
    type: median
    group_label: "Task Assignees Set Measures"
    sql: ${task_assignees_set} ;;
  }

  measure: task_states_modified_max {
    description: "The max Task States Modifieds within each grouping."
    type: max
    group_label: "Task States Modified Measures"
    sql: ${task_states_modified} ;;
  }

  measure: task_states_modified_min {
    description: "The min Task States Modifieds within each grouping."
    type: min
    group_label: "Task States Modified Measures"
    sql: ${task_states_modified} ;;
  }

  measure: task_states_modified_avg {
    description: "The average Task States Modifieds within each grouping."
    type: average
    group_label: "Task States Modified Measures"
    sql: ${task_states_modified} ;;
  }

  measure: task_states_modified_median {
    description: "The median  Task States Modifieds within each grouping."
    type: median
    group_label: "Task States Modified Measures"
    sql: ${task_states_modified} ;;
  }

  measure: tasks_added_max {
    description: "The max Tasks Addeds within each grouping."
    type: max
    group_label: "Tasks Added Measures"
    sql: ${tasks_added} ;;
  }

  measure: tasks_added_min {
    description: "The min Tasks Addeds within each grouping."
    type: min
    group_label: "Tasks Added Measures"
    sql: ${tasks_added} ;;
  }

  measure: tasks_added_avg {
    description: "The average Tasks Addeds within each grouping."
    type: average
    group_label: "Tasks Added Measures"
    sql: ${tasks_added} ;;
  }

  measure: tasks_added_median {
    description: "The median  Tasks Addeds within each grouping."
    type: median
    group_label: "Tasks Added Measures"
    sql: ${tasks_added} ;;
  }

  measure: tasks_removed_max {
    description: "The max Tasks Removeds within each grouping."
    type: max
    group_label: "Tasks Removed Measures"
    sql: ${tasks_removed} ;;
  }

  measure: tasks_removed_min {
    description: "The min Tasks Removeds within each grouping."
    type: min
    group_label: "Tasks Removed Measures"
    sql: ${tasks_removed} ;;
  }

  measure: tasks_removed_avg {
    description: "The average Tasks Removeds within each grouping."
    type: average
    group_label: "Tasks Removed Measures"
    sql: ${tasks_removed} ;;
  }

  measure: tasks_removed_median {
    description: "The median  Tasks Removeds within each grouping."
    type: median
    group_label: "Tasks Removed Measures"
    sql: ${tasks_removed} ;;
  }

  measure: tasks_renamed_max {
    description: "The max Tasks Renameds within each grouping."
    type: max
    group_label: "Tasks Renamed Measures"
    sql: ${tasks_renamed} ;;
  }

  measure: tasks_renamed_min {
    description: "The min Tasks Renameds within each grouping."
    type: min
    group_label: "Tasks Renamed Measures"
    sql: ${tasks_renamed} ;;
  }

  measure: tasks_renamed_avg {
    description: "The average Tasks Renameds within each grouping."
    type: average
    group_label: "Tasks Renamed Measures"
    sql: ${tasks_renamed} ;;
  }

  measure: tasks_renamed_median {
    description: "The median  Tasks Renameds within each grouping."
    type: median
    group_label: "Tasks Renamed Measures"
    sql: ${tasks_renamed} ;;
  }

  measure: task_slash_commands_run_max {
    description: "The max Task Slash Commands Runs within each grouping."
    type: max
    group_label: "Task Slash Commands Run Measures"
    sql: ${task_slash_commands_run} ;;
  }

  measure: task_slash_commands_run_min {
    description: "The min Task Slash Commands Runs within each grouping."
    type: min
    group_label: "Task Slash Commands Run Measures"
    sql: ${task_slash_commands_run} ;;
  }

  measure: task_slash_commands_run_avg {
    description: "The average Task Slash Commands Runs within each grouping."
    type: average
    group_label: "Task Slash Commands Run Measures"
    sql: ${task_slash_commands_run} ;;
  }

  measure: task_slash_commands_run_median {
    description: "The median  Task Slash Commands Runs within each grouping."
    type: median
    group_label: "Task Slash Commands Run Measures"
    sql: ${task_slash_commands_run} ;;
  }

  measure: tasks_moved_max {
    description: "The max Tasks Moveds within each grouping."
    type: max
    group_label: "Tasks Moved Measures"
    sql: ${tasks_moved} ;;
  }

  measure: tasks_moved_min {
    description: "The min Tasks Moveds within each grouping."
    type: min
    group_label: "Tasks Moved Measures"
    sql: ${tasks_moved} ;;
  }

  measure: tasks_moved_avg {
    description: "The average Tasks Moveds within each grouping."
    type: average
    group_label: "Tasks Moved Measures"
    sql: ${tasks_moved} ;;
  }

  measure: tasks_moved_median {
    description: "The median  Tasks Moveds within each grouping."
    type: median
    group_label: "Tasks Moved Measures"
    sql: ${tasks_moved} ;;
  }


}