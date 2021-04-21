# This is the view file for the analytics.incident_collaboration.playbook_fact table.
view: playbook_fact {
  sql_table_name: incident_collaboration.playbook_fact ;;
  view_label: "Playbook Fact"

  # FILTERS

  # DIMENSIONS
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

  dimension: id {
    description: "" 
    type: string
    sql: ${TABLE}.id ;;
    hidden: no
  }

  dimension: plugin_version {
    description: "" 
    type: string
    sql: ${TABLE}.plugin_version ;;
    hidden: no
  }

  dimension: server_version {
    description: "" 
    type: string
    sql: ${TABLE}.server_version ;;
    hidden: no
  }

  dimension: plugin_versions {
    description: "" 
    type: number
    sql: ${TABLE}.plugin_versions ;;
    hidden: no
  }

  dimension: server_versions {
    description: "" 
    type: number
    sql: ${TABLE}.server_versions ;;
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

  dimension: playbook_users {
    description: "" 
    type: number
    sql: ${TABLE}.playbook_users ;;
    hidden: no
  }

  dimension: incidents {
    description: "" 
    type: number
    sql: ${TABLE}.incidents ;;
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

  dimension: resolved_incidents {
    description: "" 
    type: number
    sql: ${TABLE}.resolved_incidents ;;
    hidden: no
  }

  dimension: archived_incidents {
    description: "" 
    type: number
    sql: ${TABLE}.archived_incidents ;;
    hidden: no
  }

  dimension: latest_incident_server_version {
    description: "" 
    type: string
    sql: ${TABLE}.latest_incident_server_version ;;
    hidden: no
  }

  dimension: latest_incident_plugin_version {
    description: "" 
    type: string
    sql: ${TABLE}.latest_incident_plugin_version ;;
    hidden: no
  }

  dimension: max_incident_users {
    description: "" 
    type: number
    sql: ${TABLE}.max_incident_users ;;
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

  dimension_group: last_edit_date {
	description: "" 
	type: time
	timeframes: [time, week, date, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.last_edit_date ;;
    hidden: no
  }

  dimension_group: deleted_date {
	description: "" 
	type: time
	timeframes: [time, week, date, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.deleted_date ;;
    hidden: no
  }

  dimension_group: last_active_date {
	description: "" 
	type: time
	timeframes: [time, week, date, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.last_active_date ;;
    hidden: no
  }

  dimension_group: first_incident_start_date {
	description: "" 
	type: time
	timeframes: [time, week, date, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.first_incident_start_date ;;
    hidden: no
  }

  dimension_group: last_incident_start_date {
	description: "" 
	type: time
	timeframes: [time, week, date, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.last_incident_start_date ;;
    hidden: no
  }

  dimension_group: last_incident_activity_date {
	description: "" 
	type: time
	timeframes: [time, week, date, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.last_incident_activity_date ;;
    hidden: no
  }

  
  # MEASURES
  measure: count {
    description: "Count of rows/occurrences."
    type: count
  }

  measure: server_count {
    label: " Server Count"
    description: "The distinct count of Playbook Fact Servers within each grouping."
    type: count_distinct
    sql: ${server_id} ;;
  }

  measure: playbook_count {
    label: " Playbook Count"
    description: "The distinct count of Playbook Fact Playbooks within each grouping."
    type: count_distinct
    sql: ${playbook_id} ;;
  }

  measure: id_count {
    label: " Id Count"
    description: "The distinct count of Playbook Fact Id within each grouping."
    type: count_distinct
    sql: ${id} ;;
  }

  measure: plugin_versions_max {
    description: "The max Plugin Versions within each grouping."
    type: max
    group_label: "Plugin Versions Measures"
    sql: ${plugin_versions} ;;
  }

  measure: plugin_versions_min {
    description: "The min Plugin Versions within each grouping."
    type: min
    group_label: "Plugin Versions Measures"
    sql: ${plugin_versions} ;;
  }

  measure: plugin_versions_avg {
    description: "The average Plugin Versions within each grouping."
    type: average
    group_label: "Plugin Versions Measures"
    sql: ${plugin_versions} ;;
  }

  measure: plugin_versions_median {
    description: "The median  Plugin Versions within each grouping."
    type: median
    group_label: "Plugin Versions Measures"
    sql: ${plugin_versions} ;;
  }

  measure: server_versions_max {
    description: "The max Server Versions within each grouping."
    type: max
    group_label: "Server Versions Measures"
    sql: ${server_versions} ;;
  }

  measure: server_versions_min {
    description: "The min Server Versions within each grouping."
    type: min
    group_label: "Server Versions Measures"
    sql: ${server_versions} ;;
  }

  measure: server_versions_avg {
    description: "The average Server Versions within each grouping."
    type: average
    group_label: "Server Versions Measures"
    sql: ${server_versions} ;;
  }

  measure: server_versions_median {
    description: "The median  Server Versions within each grouping."
    type: median
    group_label: "Server Versions Measures"
    sql: ${server_versions} ;;
  }

  measure: playbooks_created_max {
    description: "The max Playbooks Createds within each grouping."
    type: max
    group_label: "Playbooks Created Measures"
    sql: ${playbooks_created} ;;
  }

  measure: playbooks_created_min {
    description: "The min Playbooks Createds within each grouping."
    type: min
    group_label: "Playbooks Created Measures"
    sql: ${playbooks_created} ;;
  }

  measure: playbooks_created_avg {
    description: "The average Playbooks Createds within each grouping."
    type: average
    group_label: "Playbooks Created Measures"
    sql: ${playbooks_created} ;;
  }

  measure: playbooks_created_median {
    description: "The median  Playbooks Createds within each grouping."
    type: median
    group_label: "Playbooks Created Measures"
    sql: ${playbooks_created} ;;
  }

  measure: playbooks_edited_max {
    description: "The max Playbooks Editeds within each grouping."
    type: max
    group_label: "Playbooks Edited Measures"
    sql: ${playbooks_edited} ;;
  }

  measure: playbooks_edited_min {
    description: "The min Playbooks Editeds within each grouping."
    type: min
    group_label: "Playbooks Edited Measures"
    sql: ${playbooks_edited} ;;
  }

  measure: playbooks_edited_avg {
    description: "The average Playbooks Editeds within each grouping."
    type: average
    group_label: "Playbooks Edited Measures"
    sql: ${playbooks_edited} ;;
  }

  measure: playbooks_edited_median {
    description: "The median  Playbooks Editeds within each grouping."
    type: median
    group_label: "Playbooks Edited Measures"
    sql: ${playbooks_edited} ;;
  }

  measure: playbooks_deleted_max {
    description: "The max Playbooks Deleteds within each grouping."
    type: max
    group_label: "Playbooks Deleted Measures"
    sql: ${playbooks_deleted} ;;
  }

  measure: playbooks_deleted_min {
    description: "The min Playbooks Deleteds within each grouping."
    type: min
    group_label: "Playbooks Deleted Measures"
    sql: ${playbooks_deleted} ;;
  }

  measure: playbooks_deleted_avg {
    description: "The average Playbooks Deleteds within each grouping."
    type: average
    group_label: "Playbooks Deleted Measures"
    sql: ${playbooks_deleted} ;;
  }

  measure: playbooks_deleted_median {
    description: "The median  Playbooks Deleteds within each grouping."
    type: median
    group_label: "Playbooks Deleted Measures"
    sql: ${playbooks_deleted} ;;
  }

  measure: playbook_users_sum {
    description: "The sum of Playbook Users within each grouping."
    type: sum
    group_label: "Playbook Users Measures"
    sql: ${playbook_users} ;;
  }

  measure: playbook_users_max {
    description: "The max Playbook Users within each grouping."
    type: max
    group_label: "Playbook Users Measures"
    sql: ${playbook_users} ;;
  }

  measure: playbook_users_min {
    description: "The min Playbook Users within each grouping."
    type: min
    group_label: "Playbook Users Measures"
    sql: ${playbook_users} ;;
  }

  measure: playbook_users_avg {
    description: "The average Playbook Users within each grouping."
    type: average
    group_label: "Playbook Users Measures"
    sql: ${playbook_users} ;;
  }

  measure: playbook_users_median {
    description: "The median  Playbook Users within each grouping."
    type: median
    group_label: "Playbook Users Measures"
    sql: ${playbook_users} ;;
  }

  measure: incidents_max {
    description: "The max Incidents within each grouping."
    type: max
    group_label: "Incidents Measures"
    sql: ${incidents} ;;
  }

  measure: incidents_min {
    description: "The min Incidents within each grouping."
    type: min
    group_label: "Incidents Measures"
    sql: ${incidents} ;;
  }

  measure: incidents_avg {
    description: "The average Incidents within each grouping."
    type: average
    group_label: "Incidents Measures"
    sql: ${incidents} ;;
  }

  measure: incidents_median {
    description: "The median  Incidents within each grouping."
    type: median
    group_label: "Incidents Measures"
    sql: ${incidents} ;;
  }

  measure: reported_incidents_max {
    description: "The max Reported Incidents within each grouping."
    type: max
    group_label: "Reported Incidents Measures"
    sql: ${reported_incidents} ;;
  }

  measure: reported_incidents_min {
    description: "The min Reported Incidents within each grouping."
    type: min
    group_label: "Reported Incidents Measures"
    sql: ${reported_incidents} ;;
  }

  measure: reported_incidents_avg {
    description: "The average Reported Incidents within each grouping."
    type: average
    group_label: "Reported Incidents Measures"
    sql: ${reported_incidents} ;;
  }

  measure: reported_incidents_median {
    description: "The median  Reported Incidents within each grouping."
    type: median
    group_label: "Reported Incidents Measures"
    sql: ${reported_incidents} ;;
  }

  measure: acknowledged_incidents_max {
    description: "The max Acknowledged Incidents within each grouping."
    type: max
    group_label: "Acknowledged Incidents Measures"
    sql: ${acknowledged_incidents} ;;
  }

  measure: acknowledged_incidents_min {
    description: "The min Acknowledged Incidents within each grouping."
    type: min
    group_label: "Acknowledged Incidents Measures"
    sql: ${acknowledged_incidents} ;;
  }

  measure: acknowledged_incidents_avg {
    description: "The average Acknowledged Incidents within each grouping."
    type: average
    group_label: "Acknowledged Incidents Measures"
    sql: ${acknowledged_incidents} ;;
  }

  measure: acknowledged_incidents_median {
    description: "The median  Acknowledged Incidents within each grouping."
    type: median
    group_label: "Acknowledged Incidents Measures"
    sql: ${acknowledged_incidents} ;;
  }

  measure: resolved_incidents_max {
    description: "The max Resolved Incidents within each grouping."
    type: max
    group_label: "Resolved Incidents Measures"
    sql: ${resolved_incidents} ;;
  }

  measure: resolved_incidents_min {
    description: "The min Resolved Incidents within each grouping."
    type: min
    group_label: "Resolved Incidents Measures"
    sql: ${resolved_incidents} ;;
  }

  measure: resolved_incidents_avg {
    description: "The average Resolved Incidents within each grouping."
    type: average
    group_label: "Resolved Incidents Measures"
    sql: ${resolved_incidents} ;;
  }

  measure: resolved_incidents_median {
    description: "The median  Resolved Incidents within each grouping."
    type: median
    group_label: "Resolved Incidents Measures"
    sql: ${resolved_incidents} ;;
  }

  measure: archived_incidents_max {
    description: "The max Archived Incidents within each grouping."
    type: max
    group_label: "Archived Incidents Measures"
    sql: ${archived_incidents} ;;
  }

  measure: archived_incidents_min {
    description: "The min Archived Incidents within each grouping."
    type: min
    group_label: "Archived Incidents Measures"
    sql: ${archived_incidents} ;;
  }

  measure: archived_incidents_avg {
    description: "The average Archived Incidents within each grouping."
    type: average
    group_label: "Archived Incidents Measures"
    sql: ${archived_incidents} ;;
  }

  measure: archived_incidents_median {
    description: "The median  Archived Incidents within each grouping."
    type: median
    group_label: "Archived Incidents Measures"
    sql: ${archived_incidents} ;;
  }

  measure: max_incident_users_max {
    description: "The max Max Incident Users within each grouping."
    type: max
    group_label: "Max Incident Users Measures"
    sql: ${max_incident_users} ;;
  }

  measure: max_incident_users_min {
    description: "The min Max Incident Users within each grouping."
    type: min
    group_label: "Max Incident Users Measures"
    sql: ${max_incident_users} ;;
  }

  measure: max_incident_users_avg {
    description: "The average Max Incident Users within each grouping."
    type: average
    group_label: "Max Incident Users Measures"
    sql: ${max_incident_users} ;;
  }

  measure: max_incident_users_median {
    description: "The median  Max Incident Users within each grouping."
    type: median
    group_label: "Max Incident Users Measures"
    sql: ${max_incident_users} ;;
  }


}