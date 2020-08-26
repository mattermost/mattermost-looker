# This is the view file for the analytics.events.incident_response_events table.
view: incident_response_events {
  sql_table_name: events.incident_response_events ;;
  view_label: "Incident Response Events"

  # FILTERS

  # DIMENSIONS
  dimension: _dbt_source_relation {
    description: "" 
    type: string
    sql: ${TABLE}._dbt_source_relation ;;
    hidden: no
  }

  dimension: pluginversion {
    description: "" 
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
    hidden: no
  }

  dimension: userid {
    description: "" 
    type: string
    sql: ${TABLE}.userid ;;
    hidden: no
  }

  dimension: context_ip {
    description: "" 
    type: string
    sql: ${TABLE}.context_ip ;;
    hidden: no
  }

  dimension: incidentid {
    description: "" 
    type: string
    sql: ${TABLE}.incidentid ;;
    hidden: no
  }

  dimension: anonymous_id {
    description: "" 
    type: string
    sql: ${TABLE}.anonymous_id ;;
    hidden: no
  }

  dimension: event {
    description: "" 
    type: string
    sql: ${TABLE}.event ;;
    hidden: no
  }

  dimension: user_id {
    description: "" 
    type: string
    sql: ${TABLE}.user_id ;;
    hidden: no
  }

  dimension: serverversion {
    description: "" 
    type: string
    sql: ${TABLE}.serverversion ;;
    hidden: no
  }

  dimension: id {
    description: "" 
    type: string
    sql: ${TABLE}.id ;;
    hidden: no
  }

  dimension: context_library_version {
    description: "" 
    type: string
    sql: ${TABLE}.context_library_version ;;
    hidden: no
  }

  dimension: channel {
    description: "" 
    type: string
    sql: ${TABLE}.channel ;;
    hidden: no
  }

  dimension: useractualid {
    description: "" 
    type: string
    sql: ${TABLE}.useractualid ;;
    hidden: no
  }

  dimension: createdat {
    description: "" 
    type: number
    sql: ${TABLE}.createdat ;;
    hidden: no
  }

  dimension: channelids_0 {
    description: "" 
    type: string
    sql: ${TABLE}.channelids_0 ;;
    hidden: no
  }

  dimension: postid {
    description: "" 
    type: string
    sql: ${TABLE}.postid ;;
    hidden: no
  }

  dimension: teamid {
    description: "" 
    type: string
    sql: ${TABLE}.teamid ;;
    hidden: no
  }

  dimension: isactive {
    description: "" 
    type: yesno
    sql: ${TABLE}.isactive ;;
    hidden: no
  }

  dimension: numchecklists {
    description: "" 
    type: number
    sql: ${TABLE}.numchecklists ;;
    hidden: no
  }

  dimension: totalchecklistitems {
    description: "" 
    type: number
    sql: ${TABLE}.totalchecklistitems ;;
    hidden: no
  }

  dimension: commanderuserid {
    description: "" 
    type: string
    sql: ${TABLE}.commanderuserid ;;
    hidden: no
  }

  dimension: public {
    description: "" 
    type: yesno
    sql: ${TABLE}.public ;;
    hidden: no
  }

  dimension: channelids {
    description: "" 
    type: string
    sql: ${TABLE}.channelids ;;
    hidden: no
  }

  dimension: playbook_numchecklists {
    description: "" 
    type: number
    sql: ${TABLE}.playbook_numchecklists ;;
    hidden: no
  }

  dimension: playbook_numslashcommands {
    description: "" 
    type: number
    sql: ${TABLE}.playbook_numslashcommands ;;
    hidden: no
  }

  dimension: playbook_ispublic {
    description: "" 
    type: yesno
    sql: ${TABLE}.playbook_ispublic ;;
    hidden: no
  }

  dimension: playbook_teamid {
    description: "" 
    type: string
    sql: ${TABLE}.playbook_teamid ;;
    hidden: no
  }

  dimension: playbook_totalchecklistitems {
    description: "" 
    type: number
    sql: ${TABLE}.playbook_totalchecklistitems ;;
    hidden: no
  }

  dimension: activestage {
    description: "" 
    type: number
    sql: ${TABLE}.activestage ;;
    hidden: no
  }

  dimension: playbook_nummembers {
    description: "" 
    type: number
    sql: ${TABLE}.playbook_nummembers ;;
    hidden: no
  }

  dimension: playbook_playbookid {
    description: "" 
    type: string
    sql: ${TABLE}.playbook_playbookid ;;
    hidden: no
  }

  dimension: playbookid {
    description: "" 
    type: string
    sql: ${TABLE}.playbookid ;;
    hidden: no
  }

  dimension: ispublic {
    description: "" 
    type: yesno
    sql: ${TABLE}.ispublic ;;
    hidden: no
  }

  dimension: numslashcommands {
    description: "" 
    type: number
    sql: ${TABLE}.numslashcommands ;;
    hidden: no
  }

  dimension: nummembers {
    description: "" 
    type: number
    sql: ${TABLE}.nummembers ;;
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
	description: "" 
	type: time
	timeframes: [date, month, year]
    sql: ${TABLE}.timestamp ;;
    hidden: no
  }

  dimension_group: original_timestamp {
	description: "" 
	type: time
	timeframes: [date, month, year]
    sql: ${TABLE}.original_timestamp ;;
    hidden: no
  }

  dimension_group: received_at {
	description: "" 
	type: time
	timeframes: [date, month, year]
    sql: ${TABLE}.received_at ;;
    hidden: no
  }

  dimension_group: uuid_ts {
	description: "" 
	type: time
	timeframes: [date, month, year]
    sql: ${TABLE}.uuid_ts ;;
    hidden: no
  }

  
  # MEASURES
  measure: count {
    description: "Count of rows/occurrences."
    type: count
  }

  measure: anonymous_count {
    label: " Anonymous Count"
    description: "The distinct count of Anonymouss per grouping."
    type: count_distinct
    sql: ${anonymous_id} ;;
  }

  measure: user_count {
    label: " User Count"
    description: "The distinct count of Users per grouping."
    type: count_distinct
    sql: ${user_id} ;;
  }

  measure: totalchecklistitems_sum {
    description: "The sum of Totalchecklistitems per grouping."
    type: sum
    sql: ${totalchecklistitems} ;;
  }

  measure: playbook_totalchecklistitems_sum {
    description: "The sum of Playbook Totalchecklistitems per grouping."
    type: sum
    sql: ${playbook_totalchecklistitems} ;;
  }


}