# This is the view file for the analytics.qa.incident_response_telemetry table.
view: incident_response_telemetry {
  sql_table_name: qa.incident_response_telemetry ;;
  view_label: "Incident Management Telemetry"

  # Constructs
  set: ir_drill {
    fields: [timestamp_time, properties]
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
  }

  # DIMENSIONS
  dimension: _dbt_source_relation {
    description: ""
    type: string
    sql: ${TABLE}._dbt_source_relation ;;
    hidden: no
  }

  dimension: commanderuserid {
    description: ""
    type: string
    sql: ${TABLE}.commanderuserid ;;
    hidden: no
  }

  dimension: user_id {
    description: ""
    type: string
    sql: ${TABLE}.user_id ;;
    hidden: no
  }

  dimension: postid {
    description: ""
    type: string
    sql: ${TABLE}.postid ;;
    hidden: no
  }

  dimension: anonymous_id {
    description: ""
    type: string
    sql: ${TABLE}.anonymous_id ;;
    hidden: no
  }

  dimension: action {
    description: ""
    type: string
    sql: ${TABLE}.action ;;
    hidden: no
  }

  dimension: isactive {
    description: ""
    type: yesno
    sql: ${TABLE}.isactive ;;
    hidden: no
  }

  dimension: id {
    description: ""
    type: string
    sql: ${TABLE}.id ;;
    hidden: no
  }

  dimension: totalchecklistitems {
    description: ""
    type: number
    sql: ${TABLE}.totalchecklistitems ;;
    hidden: no
  }

  dimension: event {
    description: ""
    type: string
    sql: ${TABLE}.event ;;
    hidden: no
  }

  dimension: useractualid {
    description: ""
    type: string
    sql: ${TABLE}.useractualid ;;
    hidden: no
  }

  dimension: numchecklists {
    description: ""
    type: number
    sql: ${TABLE}.numchecklists ;;
    hidden: no
  }

  dimension: incidentid {
    description: ""
    type: string
    sql: ${TABLE}.incidentid ;;
    hidden: no
  }

  dimension: activestage {
    description: ""
    type: number
    sql: ${TABLE}.activestage ;;
    hidden: no
  }

  dimension: teamid {
    description: ""
    type: string
    sql: ${TABLE}.teamid ;;
    hidden: no
  }

  dimension: context_library_name {
    description: ""
    type: string
    sql: ${TABLE}.context_library_name ;;
    hidden: no
  }

  dimension: createat {
    description: ""
    type: number
    sql: ${TABLE}.createat ;;
    hidden: no
  }

  dimension: context_ip {
    description: ""
    type: string
    sql: ${TABLE}.context_ip ;;
    hidden: no
  }

  dimension: context_library_version {
    description: ""
    type: string
    sql: ${TABLE}.context_library_version ;;
    hidden: no
  }

  dimension: event_text {
    description: ""
    type: string
    sql: ${TABLE}.event_text ;;
    hidden: no
  }

  dimension: pluginversion {
    description: ""
    type: string
    sql: ${TABLE}.pluginversion ;;
    hidden: no
  }

  dimension: public {
    description: ""
    type: yesno
    sql: ${TABLE}.public ;;
    hidden: no
  }

  dimension: serverversion {
    description: ""
    type: string
    sql: ${TABLE}.serverversion ;;
    hidden: no
  }

  dimension: header_isactive {
    description: ""
    type: yesno
    sql: ${TABLE}.header_isactive ;;
    hidden: no
  }

  dimension: key {
    description: ""
    type: string
    sql: ${TABLE}.key ;;
    hidden: no
  }

  dimension: header_name {
    description: ""
    type: string
    sql: ${TABLE}.header_name ;;
    hidden: no
  }

  dimension: header_commanderuserid {
    description: ""
    type: string
    sql: ${TABLE}.header_commanderuserid ;;
    hidden: no
  }

  dimension: header_id {
    description: ""
    type: string
    sql: ${TABLE}.header_id ;;
    hidden: no
  }

  dimension: header_createdat {
    description: ""
    type: number
    sql: ${TABLE}.header_createdat ;;
    hidden: no
  }

  dimension: channelids_0 {
    description: ""
    type: string
    sql: ${TABLE}.channelids_0 ;;
    hidden: no
  }

  dimension: header_teamid {
    description: ""
    type: string
    sql: ${TABLE}.header_teamid ;;
    hidden: no
  }

  dimension: numslashcommands {
    description: ""
    type: number
    sql: ${TABLE}.numslashcommands ;;
    hidden: no
  }

  dimension: ispublic {
    description: ""
    type: yesno
    sql: ${TABLE}.ispublic ;;
    hidden: no
  }

  dimension: nummembers {
    description: ""
    type: number
    sql: ${TABLE}.nummembers ;;
    hidden: no
  }

  dimension: playbookid {
    description: ""
    type: string
    sql: ${TABLE}.playbookid ;;
    hidden: no
  }

  dimension: wascommander {
    description: ""
    type: yesno
    sql: ${TABLE}.wascommander ;;
    hidden: no
  }

  dimension: newstate {
    description: ""
    type: string
    sql: ${TABLE}.newstate ;;
    hidden: no
  }

  dimension: wasassignee {
    description: ""
    type: yesno
    sql: ${TABLE}.wasassignee ;;
    hidden: no
  }


  # DIMENSION GROUPS/DATES
  dimension_group: sent_at {
  description: ""
  type: time
  timeframes: [time, week, date, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.sent_at ;;
    hidden: no
  }

  dimension_group: received_at {
  description: ""
  type: time
  timeframes: [time, week, date, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.received_at ;;
    hidden: no
  }

  dimension_group: original_timestamp {
  description: ""
  type: time
  timeframes: [time, week, date, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.original_timestamp ;;
    hidden: no
  }

  dimension_group: timestamp {
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
    hidden: no
  }


  # MEASURES
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

  measure: count {
    description: "Count of rows/occurrences."
    type: count
    drill_fields: [ir_drill*]
  }

  measure: user_count {
    label: " User Id Count"
    description: "The distinct count of Incident Response Telemetry record Users Id's within each grouping."
    type: count_distinct
    drill_fields: [ir_drill*]
    sql: ${user_id} ;;
  }

  measure: user_count_notnull {
    label: " User Id Count (Non-Null)"
    description: "The count of non-null Incident Response Telemetry record User Id's within each grouping."
    type: number
    drill_fields: [ir_drill*]
    sql: count(${user_id}) ;;
  }

  measure: anonymous_count {
    label: " Anonymous Id Count"
    description: "The distinct count of Incident Response Telemetry record Anonymous Id's within each grouping."
    type: count_distinct
    drill_fields: [ir_drill*]
    sql: ${anonymous_id} ;;
  }

  measure: anonymous_count_notnull {
    label: " Anonymous Id Count (Non-Null)"
    description: "The count of non-null Incident Response Telemetry record Anonymous Id's within each grouping."
    type: number
    drill_fields: [ir_drill*]
    sql: count(${anonymous_id}) ;;
  }

  measure: isactive_count {
    label: "Isactive Users"
    description: "The distinct count of Incident Response Telemetry record with Isactive marked true."
    group_label: "Is Active (Yes/No) Measures"
    type: count_distinct
    drill_fields: [ir_drill*]
    sql: case when ${isactive} then ${id} else null end ;;
  }

  measure: isactive_count_notnull {
    label: "Is Active (Non-Nul)"
    description: "The count of non-null Incident Response Telemetry record with Isactive marked true."
    group_label: "Is Active (Yes/No) Measures"
    type: number
    drill_fields: [ir_drill*]
    sql: count(${isactive}) ;;
  }

  measure: id_count {
    label: " Id Count"
    description: "The distinct count of Incident Response Telemetry record Id's within each grouping."
    type: count_distinct
    drill_fields: [ir_drill*]
    sql: ${id} ;;
  }

  measure: id_count_notnull {
    label: " Id Count (Non-Null)"
    description: "The count of non-null Incident Response Telemetry record Id's within each grouping."
    type: number
    drill_fields: [ir_drill*]
    sql: count(${id}) ;;
  }

  measure: totalchecklistitems_sum {
    label: "Total Checklist Items (Sum)"
    description: "The sum of Totalchecklistitems within each grouping."
    type: sum
    group_label: "Totalchecklistitems Measures"
    drill_fields: [ir_drill*]
    sql: ${totalchecklistitems} ;;
  }

  measure: totalchecklistitems_notnull {
    label: "Total Checklist Items (Non-Null)"
    description: "The count of non-null Totalchecklistitem values within each grouping."
    type: number
    group_label: "Totalchecklistitems Measures"
    drill_fields: [ir_drill*]
    sql: count(${totalchecklistitems}) ;;
  }

  measure: totalchecklistitems_max {
    description: "The max Totalchecklistitems within each grouping."
    label: "Total Checklist Items (Max)"
    type: max
    group_label: "Totalchecklistitems Measures"
    drill_fields: [ir_drill*]
    sql: ${totalchecklistitems} ;;
  }

  measure: totalchecklistitems_min {
    description: "The min Totalchecklistitems within each grouping."
    label: "Total Checklist Items (Min)"
    type: min
    group_label: "Totalchecklistitems Measures"
    drill_fields: [ir_drill*]
    sql: ${totalchecklistitems} ;;
  }

  measure: totalchecklistitems_avg {
    label: "Total Checklist Items (Avg)"
    description: "The average Totalchecklistitems within each grouping."
    type: average
    group_label: "Totalchecklistitems Measures"
    drill_fields: [ir_drill*]
    sql: ${totalchecklistitems} ;;
  }

  measure: totalchecklistitems_median {
    label: "Total Checklist Items (Median)"
    description: "The median  Totalchecklistitems within each grouping."
    type: median
    group_label: "Totalchecklistitems Measures"
    drill_fields: [ir_drill*]
    sql: ${totalchecklistitems} ;;
  }

  measure: numchecklists_max {
    description: "The max Numchecklists within each grouping."
    type: max
    group_label: "Numchecklists Measures"
    label: "Num. Checklists (Max)"
    drill_fields: [ir_drill*]
    sql: ${numchecklists} ;;
  }

  measure: numchecklists_notnull {
    description: "The count of non-null Numchecklists values within each grouping."
    type: number
    group_label: "Numchecklists Measures"
    label: "Num. Checklists (Non-Null)"
    drill_fields: [ir_drill*]
    sql: count(${numchecklists}) ;;
  }

  measure: numchecklists_min {
    description: "The min Numchecklists within each grouping."
    type: min
    group_label: "Numchecklists Measures"
    label: "Num. Checklists (Min)"
    drill_fields: [ir_drill*]
    sql: ${numchecklists} ;;
  }

  measure: numchecklists_avg {
    description: "The average Numchecklists within each grouping."
    type: average
    group_label: "Numchecklists Measures"
    label: "Num. Checklists (Avg)"
    drill_fields: [ir_drill*]
    sql: ${numchecklists} ;;
  }

  measure: numchecklists_median {
    description: "The median  Numchecklists within each grouping."
    type: median
    group_label: "Numchecklists Measures"
    label: "Num. Checklists (Median)"
    drill_fields: [ir_drill*]
    sql: ${numchecklists} ;;
  }

  measure: activestage_max {
    description: "The max Activestages within each grouping."
    type: max
    group_label: "Active Stage Measures"
    label: "Active Stage (Max)"
    drill_fields: [ir_drill*]
    sql: ${activestage} ;;
  }

  measure: activestage_notnull {
    description: "The count of non-null Activestages values within each grouping."
    type: number
    group_label: "Active Stage Measures"
    label: "Active Stage (Non-Null)"
    drill_fields: [ir_drill*]
    sql: count(${activestage}) ;;
  }

  measure: activestage_min {
    description: "The min Activestages within each grouping."
    type: min
    group_label: "Active Stage Measures"
    label: "Active Stage (Min)"
    drill_fields: [ir_drill*]
    sql: ${activestage} ;;
  }

  measure: activestage_avg {
    description: "The average Activestages within each grouping."
    type: average
    group_label: "Active Stage Measures"
    label: "Active Stage (Avg)"
    drill_fields: [ir_drill*]
    sql: ${activestage} ;;
  }

  measure: activestage_median {
    description: "The median  Activestages within each grouping."
    type: median
    group_label: "Active Stage Measures"
    label: "Active Stage (Median)"
    drill_fields: [ir_drill*]
    sql: ${activestage} ;;
  }

  measure: createat_max {
    description: "The max Createats within each grouping."
    type: max
    group_label: "Create At Measures"
    drill_fields: [ir_drill*]
    sql: ${createat} ;;
  }

  measure: createat_notnull {
    description: "The count of non-null Createat values within each grouping."
    type: number
    group_label: "Create At Measures"
    label: "Create At (Non-Null)"
    drill_fields: [ir_drill*]
    sql: count(${createat}) ;;
  }

  measure: createat_min {
    description: "The min Createats within each grouping."
    type: min
    group_label: "Create At Measures"
    sql: ${createat} ;;
  }

  measure: createat_avg {
    description: "The average Createats within each grouping."
    type: average
    group_label: "Create At Measures"
    drill_fields: [ir_drill*]
    sql: ${createat} ;;
  }

  measure: createat_median {
    description: "The median  Createats within each grouping."
    type: median
    group_label: "Create At Measures"
    sql: ${createat} ;;
  }

  measure: public_count {
    label: "Public Count"
    description: "The distinct count of Incident Response Telemetry record with Public marked true."
    group_label: "Public (Yes/No) Measures"
    drill_fields: [ir_drill*]
    type: count_distinct
    sql: case when ${public} then ${id} else null end ;;
  }

  measure: public_count_notnull {
    label: "Public Count (Non-Null)"
    description: "The count of non-null Public values within each grouping."
    group_label: "Public (Yes/No) Measures"
    drill_fields: [ir_drill*]
    type: number
    sql: count(${public});;
  }

  measure: header_isactive_count {
    label: "Header Is Active Count"
    description: "The distinct count of Incident Response Telemetry record with Header Isactive marked true."
    group_label: "Header Is Active (Yes/No) Measures"
    type: count_distinct
    drill_fields: [ir_drill*]
    sql: case when ${header_isactive} then ${id} else null end ;;
  }

  measure: header_isactive_count_notnull {
    label: "Header Is Active Count (Non-Null)"
    description: "The count of non-null header isactive values within each grouping."
    group_label: "Header Is Active (Yes/No) Measures"
    drill_fields: [ir_drill*]
    type: number
    sql: count(${header_isactive}) ;;
  }

  measure: header_count_notnull {
    label: " Header Id Count (Non-Null)"
    group_label: "Header Id Measures"
    description: "The count of Incident Response Telemetry record Header Id's that are not null within each grouping."
    type: number
    drill_fields: [ir_drill*]
    sql: count(${header_id}) ;;
  }

  measure: header_count {
    label: " Header Id Count"
    group_label: "Header Id Measures"
    description: "The distinct count of Incident Response Telemetry record Header Id's within each grouping."
    type: count_distinct
    drill_fields: [ir_drill*]
    sql: ${header_id} ;;
  }

  measure: header_createdat_max {
    description: "The max Header Createdats within each grouping."
    type: max
    group_label: "Header Created At Measures"
    drill_fields: [ir_drill*]
    sql: ${header_createdat} ;;
  }

  measure: header_createdat_notnull {
    description: "The count of non-null Header Createdat values within each grouping."
    type: number
    group_label: "Header Created At Measures"
    drill_fields: [ir_drill*]
    sql: count(${header_createdat}) ;;
  }

  measure: header_createdat_min {
    description: "The min Header Createdats within each grouping."
    type: min
    group_label: "Header Created At Measures"
    drill_fields: [ir_drill*]
    sql: ${header_createdat} ;;
  }

  measure: header_createdat_avg {
    description: "The average Header Createdats within each grouping."
    type: average
    group_label: "Header Created At Measures"
    drill_fields: [ir_drill*]
    sql: ${header_createdat} ;;
  }

  measure: header_createdat_median {
    description: "The median  Header Createdats within each grouping."
    type: median
    group_label: "Header Created At Measures"
    drill_fields: [ir_drill*]
    sql: ${header_createdat} ;;
  }

  measure: numslashcommands_max {
    description: "The max Numslashcommands within each grouping."
    type: max
    group_label: "Num. Slash Commands Measures"
    drill_fields: [ir_drill*]
    sql: ${numslashcommands} ;;
  }

  measure: numslashcommands_count_notnull {
    label: "Num. Slash Commands (Non-Null)"
    description: "The count of non-null Numslashcommands values within each grouping."
    type: number
    group_label: "Num. Slash Commands Measures"
    drill_fields: [ir_drill*]
    sql: count(${numslashcommands}) ;;
  }

  measure: numslashcommands_min {
    description: "The min Numslashcommands within each grouping."
    type: min
    group_label: "Num. Slash Commands Measures"
    sql: ${numslashcommands} ;;
  }

  measure: numslashcommands_avg {
    description: "The average Numslashcommands within each grouping."
    type: average
    group_label: "Num. Slash Commands Measures"
    sql: ${numslashcommands} ;;
  }

  measure: numslashcommands_median {
    description: "The median  Numslashcommands within each grouping."
    type: median
    group_label: "Num. Slash Commands Measures"
    sql: ${numslashcommands} ;;
    drill_fields: [ir_drill*]
  }

  measure: ispublic_count {
    label: "Is Public Count"
    description: "The distinct count of Incident Response Telemetry record with Ispublic marked true."
    group_label: "Is Public (Yes/No) Measures"
    type: count_distinct
    sql: case when ${ispublic} then ${id} else null end ;;
    drill_fields: [ir_drill*]
  }

  measure: ispublic_count_notnull {
    label: "Is Public (Non-Null)"
    description: "The count of Incident Response Telemetry record with non-null Is Public values within each grouping."
    group_label: "Is Public (Yes/No) Measures"
    type: number
    sql: count(${ispublic}) ;;
    drill_fields: [ir_drill*]
  }

  measure: nummembers_max {
    description: "The max Nummembers within each grouping."
    type: max
    group_label: "Nummembers Measures"
    sql: ${nummembers} ;;
    drill_fields: [ir_drill*]
  }

  measure: nummembers_min {
    description: "The min Nummembers within each grouping."
    type: min
    group_label: "Nummembers Measures"
    sql: ${nummembers} ;;
    drill_fields: [ir_drill*]
  }

  measure: nummembers_avg {
    description: "The average Nummembers within each grouping."
    type: average
    group_label: "Nummembers Measures"
    sql: ${nummembers} ;;
    drill_fields: [ir_drill*]
  }

  measure: nummembers_median {
    description: "The median  Nummembers within each grouping."
    type: median
    group_label: "Nummembers Measures"
    sql: ${nummembers} ;;
    drill_fields: [ir_drill*]
  }

  measure: wascommander_count {
    label: "Was Commander Count"
    description: "The distinct count of Incident Response Telemetry records with Wascommander marked true."
    group_label: "Was Commander (Yes/No) Measures"
    type: count_distinct
    sql: case when ${wascommander} then ${id} else null end ;;
    drill_fields: [ir_drill*]
  }

  measure: wascommander_count_notnull {
    label: "Was Commander Count (Non-Null)"
    description: "The count of non-null Wascommander values within each grouping."
    group_label: "Was Commander (Yes/No) Measures"
    type: number
    sql: count(${wascommander}) ;;
    drill_fields: [ir_drill*]
  }

  measure: wasassignee_count {
    label: "Was Assignee Count"
    description: "The distinct count of Incident Response Telemetry records with Wasassignee marked true."
    group_label: "Was Assignee (Yes/No) Measures"
    type: count_distinct
    sql: case when ${wasassignee} then ${id} else null end ;;
    drill_fields: [ir_drill*]
  }

  measure: wasassignee_count_notnull {
    label: "Was Assignee Count (Non-Null)"
    description: "The distinct count of Incident Response Telemetry records with Wasassignee marked true."
    group_label: "Was Assignee (Yes/No) Measures"
    type: count_distinct
    sql: case when ${wasassignee} then ${id} else null end ;;
    drill_fields: [ir_drill*]
  }

  measure: _dbt_source_relation_count {
    label: " Dbt Source Relation Count (Distinct)"
    description: "The distinct count of  dbt source relation's per grouping."
    type: count_distinct
    sql: ${_dbt_source_relation} ;;
    drill_fields: [ir_drill*]
  }

  measure: _dbt_source_relation_count_all {
    label: " Dbt Source Relation Count (Non-Null)"
    description: "The count of all non-null  dbt source relation occurrences per grouping."
    type: number
    sql: COUNT(case when ${_dbt_source_relation} IS NOT NULL then ${_dbt_source_relation} else null end) ;;
    drill_fields: [ir_drill*]
  }

  measure: commanderuserid_count {
    label: "Commanderuserid Count (Distinct)"
    description: "The distinct count of commanderuserid's per grouping."
    type: count_distinct
    sql: ${commanderuserid} ;;
    drill_fields: [ir_drill*]
  }

  measure: commanderuserid_count_all {
    label: "Commanderuserid Count (Non-Null)"
    description: "The count of all non-null commanderuserid occurrences per grouping."
    type: number
    sql: COUNT(case when ${commanderuserid} IS NOT NULL then ${commanderuserid} else null end) ;;
    drill_fields: [ir_drill*]
  }

  measure: postid_count {
    label: "Postid Count (Distinct)"
    description: "The distinct count of postid's per grouping."
    type: count_distinct
    sql: ${postid} ;;
    drill_fields: [ir_drill*]
  }

  measure: postid_count_all {
    label: "Postid Count (Non-Null)"
    description: "The count of all non-null postid occurrences per grouping."
    type: number
    sql: COUNT(case when ${postid} IS NOT NULL then ${postid} else null end) ;;
    drill_fields: [ir_drill*]
  }

  measure: action_count {
    label: "Action Count (Distinct)"
    description: "The distinct count of action's per grouping."
    type: count_distinct
    sql: ${action} ;;
    drill_fields: [ir_drill*]
  }

  measure: action_count_all {
    label: "Action Count (Non-Null)"
    description: "The count of all non-null action occurrences per grouping."
    type: number
    sql: COUNT(case when ${action} IS NOT NULL then ${action} else null end) ;;
    drill_fields: [ir_drill*]
  }

  measure: event_count {
    label: "Event Count (Distinct)"
    description: "The distinct count of event's per grouping."
    type: count_distinct
    sql: ${event} ;;
    drill_fields: [ir_drill*]
  }

  measure: event_count_all {
    label: "Event Count (Non-Null)"
    description: "The count of all non-null event occurrences per grouping."
    type: number
    sql: COUNT(case when ${event} IS NOT NULL then ${event} else null end) ;;
    drill_fields: [ir_drill*]
  }

  measure: useractualid_count {
    label: "Useractualid Count (Distinct)"
    description: "The distinct count of useractualid's per grouping."
    type: count_distinct
    sql: ${useractualid} ;;
    drill_fields: [ir_drill*]
  }

  measure: useractualid_count_all {
    label: "Useractualid Count (Non-Null)"
    description: "The count of all non-null useractualid occurrences per grouping."
    type: number
    sql: COUNT(case when ${useractualid} IS NOT NULL then ${useractualid} else null end) ;;
    drill_fields: [ir_drill*]
  }

  measure: numchecklists_count {
    label: "Numchecklists Count (Distinct)"
    group_label: "Numchecklists Measures"
    description: "The distinct count of numchecklists's per grouping."
    type: count_distinct
    sql: ${numchecklists} ;;
    drill_fields: [ir_drill*]
  }

  measure: incidentid_count {
    label: "Incidentid Count (Distinct)"
    description: "The distinct count of incidentid's per grouping."
    type: count_distinct
    sql: ${incidentid} ;;
    drill_fields: [ir_drill*]
  }

  measure: incidentid_count_all {
    label: "Incidentid Count (Non-Null)"
    description: "The count of all non-null incidentid occurrences per grouping."
    type: number
    sql: COUNT(case when ${incidentid} IS NOT NULL then ${incidentid} else null end) ;;
    drill_fields: [ir_drill*]
  }

  measure: teamid_count {
    label: "Teamid Count (Distinct)"
    description: "The distinct count of teamid's per grouping."
    type: count_distinct
    sql: ${teamid} ;;
    drill_fields: [ir_drill*]
  }

  measure: teamid_count_all {
    label: "Teamid Count (Non-Null)"
    description: "The count of all non-null teamid occurrences per grouping."
    type: number
    sql: COUNT(case when ${teamid} IS NOT NULL then ${teamid} else null end) ;;
    drill_fields: [ir_drill*]
  }

  measure: context_library_name_count {
    label: "Context Library Name Count (Distinct)"
    description: "The distinct count of context library name's per grouping."
    type: count_distinct
    sql: ${context_library_name} ;;
    drill_fields: [ir_drill*]
  }

  measure: context_library_name_count_all {
    label: "Context Library Name Count (Non-Null)"
    description: "The count of all non-null context library name occurrences per grouping."
    type: number
    sql: COUNT(case when ${context_library_name} IS NOT NULL then ${context_library_name} else null end) ;;
    drill_fields: [ir_drill*]
  }

  measure: createat_count {
    label: "Createat Count (Distinct)"
    description: "The distinct count of createat's per grouping."
    type: count_distinct
    group_label: "Create At Measures"
    sql: ${createat} ;;
    drill_fields: [ir_drill*]
  }

  measure: context_ip_count {
    label: "Context Ip Count (Distinct)"
    description: "The distinct count of context ip's per grouping."
    type: count_distinct
    sql: ${context_ip} ;;
    drill_fields: [ir_drill*]
  }

  measure: context_ip_count_all {
    label: "Context Ip Count (Non-Null)"
    description: "The count of all non-null context ip occurrences per grouping."
    type: number
    sql: COUNT(case when ${context_ip} IS NOT NULL then ${context_ip} else null end) ;;
    drill_fields: [ir_drill*]
  }

  measure: context_library_version_count {
    label: "Context Library Version Count (Distinct)"
    description: "The distinct count of context library version's per grouping."
    type: count_distinct
    sql: ${context_library_version} ;;
    drill_fields: [ir_drill*]
  }

  measure: context_library_version_count_all {
    label: "Context Library Version Count (Non-Null)"
    description: "The count of all non-null context library version occurrences per grouping."
    type: number
    sql: COUNT(case when ${context_library_version} IS NOT NULL then ${context_library_version} else null end) ;;
    drill_fields: [ir_drill*]
  }

  measure: event_text_count {
    label: "Event Text Count (Distinct)"
    description: "The distinct count of event text's per grouping."
    type: count_distinct
    sql: ${event_text} ;;
    drill_fields: [ir_drill*]
  }

  measure: event_text_count_all {
    label: "Event Text Count (Non-Null)"
    description: "The count of all non-null event text occurrences per grouping."
    type: number
    sql: COUNT(case when ${event_text} IS NOT NULL then ${event_text} else null end) ;;
    drill_fields: [ir_drill*]
  }

  measure: pluginversion_count {
    label: "Pluginversion Count (Distinct)"
    description: "The distinct count of pluginversion's per grouping."
    type: count_distinct
    sql: ${pluginversion} ;;
    drill_fields: [ir_drill*]
  }

  measure: pluginversion_count_all {
    label: "Pluginversion Count (Non-Null)"
    description: "The count of all non-null pluginversion occurrences per grouping."
    type: number
    sql: COUNT(case when ${pluginversion} IS NOT NULL then ${pluginversion} else null end) ;;
    drill_fields: [ir_drill*]
  }

  measure: serverversion_count {
    label: "Serverversion Count (Distinct)"
    description: "The distinct count of serverversion's per grouping."
    type: count_distinct
    sql: ${serverversion} ;;
    drill_fields: [ir_drill*]
  }

  measure: serverversion_count_all {
    label: "Serverversion Count (Non-Null)"
    description: "The count of all non-null serverversion occurrences per grouping."
    type: number
    sql: COUNT(case when ${serverversion} IS NOT NULL then ${serverversion} else null end) ;;
    drill_fields: [ir_drill*]
  }

  measure: key_count {
    label: "Key Count (Distinct)"
    description: "The distinct count of key's per grouping."
    type: count_distinct
    sql: ${key} ;;
    drill_fields: [ir_drill*]
  }

  measure: key_count_all {
    label: "Key Count (Non-Null)"
    description: "The count of all non-null key occurrences per grouping."
    type: number
    sql: COUNT(case when ${key} IS NOT NULL then ${key} else null end) ;;
    drill_fields: [ir_drill*]
  }

  measure: header_name_count {
    label: "Header Name Count (Distinct)"
    description: "The distinct count of header name's per grouping."
    type: count_distinct
    sql: ${header_name} ;;
    drill_fields: [ir_drill*]
  }

  measure: header_name_count_all {
    label: "Header Name Count (Non-Null)"
    description: "The count of all non-null header name occurrences per grouping."
    type: number
    sql: COUNT(case when ${header_name} IS NOT NULL then ${header_name} else null end) ;;
    drill_fields: [ir_drill*]
  }

  measure: header_commanderuserid_count {
    label: "Header Commanderuserid Count (Distinct)"
    description: "The distinct count of header commanderuserid's per grouping."
    type: count_distinct
    sql: ${header_commanderuserid} ;;
    drill_fields: [ir_drill*]
  }

  measure: header_commanderuserid_count_all {
    label: "Header Commanderuserid Count (Non-Null)"
    description: "The count of all non-null header commanderuserid occurrences per grouping."
    type: number
    sql: COUNT(case when ${header_commanderuserid} IS NOT NULL then ${header_commanderuserid} else null end) ;;
    drill_fields: [ir_drill*]
  }

  measure: channelids_0_count {
    label: "Channelids 0 Count (Distinct)"
    description: "The distinct count of channelids 0's per grouping."
    type: count_distinct
    drill_fields: [ir_drill*]
    sql: ${channelids_0} ;;
  }

  measure: channelids_0_count_all {
    label: "Channelids 0 Count (Non-Null)"
    description: "The count of all non-null channelids 0 occurrences per grouping."
    type: number
    sql: COUNT(case when ${channelids_0} IS NOT NULL then ${channelids_0} else null end) ;;
    drill_fields: [ir_drill*]
  }

  measure: header_teamid_count {
    label: "Header Teamid Count (Distinct)"
    description: "The distinct count of header teamid's per grouping."
    type: count_distinct
    sql: ${header_teamid} ;;
    drill_fields: [ir_drill*]
  }

  measure: header_teamid_count_all {
    label: "Header Teamid Count (Non-Null)"
    description: "The count of all non-null header teamid occurrences per grouping."
    type: number
    sql: COUNT(case when ${header_teamid} IS NOT NULL then ${header_teamid} else null end) ;;
    drill_fields: [ir_drill*]
  }

  measure: nummembers_count {
    label: "Nummembers Count (Distinct)"
    group_label: "Nummembers Measures"
    description: "The distinct count of nummembers's per grouping."
    type: count_distinct
    sql: ${nummembers} ;;
    drill_fields: [ir_drill*]
  }

  measure: nummembers_count_all {
    label: "Num. Members Count (Non-Null)"
    group_label: "Nummembers Measures"
    description: "The count of all non-null nummembers occurrences per grouping."
    type: number
    sql: COUNT(case when ${nummembers} IS NOT NULL then ${nummembers} else null end) ;;
    drill_fields: [ir_drill*]
  }

  measure: playbookid_count {
    label: "Playbookid Count (Distinct)"
    description: "The distinct count of playbookid's per grouping."
    type: count_distinct
    drill_fields: [ir_drill*]
    sql: ${playbookid} ;;
  }

  measure: playbookid_count_all {
    label: "Playbookid Count (Non-Null)"
    description: "The count of all non-null playbookid occurrences per grouping."
    type: number
    drill_fields: [ir_drill*]
    sql: COUNT(case when ${playbookid} IS NOT NULL then ${playbookid} else null end) ;;
  }

  measure: newstate_count {
    label: "New State Count"
    description: "The distinct count of newstate's per grouping."
    group_label: "New State (Yes/No) Measures"
    type: count_distinct
    drill_fields: [ir_drill*]
    sql: ${newstate} ;;
  }

  measure: newstate_count_all {
    label: "Newstate Count (Non-Null)"
    group_label: "New State (Yes/No) Measures"
    description: "The count of all non-null newstate occurrences per grouping."
    type: number
    drill_fields: [ir_drill*]
    sql: COUNT(${newstate}) ;;
  }

  measure: sent_at_date_count {
    label: "Sent At Date Count (Distinct)"
    description: "The distinct count of sent at date's per grouping."
    type: count_distinct
    drill_fields: [ir_drill*]
    sql: ${sent_at_date} ;;
  }

  measure: sent_at_date_count_all {
    label: "Sent At Date Count (Non-Null)"
    description: "The count of all non-null sent at date occurrences per grouping."
    type: number
    drill_fields: [ir_drill*]
    sql: COUNT(case when ${sent_at_date} IS NOT NULL then ${sent_at_date} else null end) ;;
  }

  measure: received_at_date_count {
    label: "Received At Date Count (Distinct)"
    description: "The distinct count of received at date's per grouping."
    type: count_distinct
    drill_fields: [ir_drill*]
    sql: ${received_at_date} ;;
  }

  measure: received_at_date_count_all {
    label: "Received At Date Count (Non-Null)"
    description: "The count of all non-null received at date occurrences per grouping."
    type: number
    drill_fields: [ir_drill*]
    sql: COUNT(case when ${received_at_date} IS NOT NULL then ${received_at_date} else null end) ;;
  }

  measure: original_timestamp_date_count {
    label: "Original Timestamp Date Count (Distinct)"
    description: "The distinct count of original timestamp date's per grouping."
    type: count_distinct
    drill_fields: [ir_drill*]
    sql: ${original_timestamp_date} ;;
  }

  measure: original_timestamp_date_count_all {
    label: "Original Timestamp Date Count (Non-Null)"
    description: "The count of all non-null original timestamp date occurrences per grouping."
    type: number
    drill_fields: [ir_drill*]
    sql: COUNT(case when ${original_timestamp_date} IS NOT NULL then ${original_timestamp_date} else null end) ;;
  }

  measure: timestamp_date_count {
    label: "Timestamp Date Count (Distinct)"
    description: "The distinct count of timestamp date's per grouping."
    type: count_distinct
    drill_fields: [ir_drill*]
    sql: ${timestamp_date} ;;
  }

  measure: timestamp_date_count_all {
    label: "Timestamp Date Count (Non-Null)"
    description: "The count of all non-null timestamp date occurrences per grouping."
    type: number
    drill_fields: [ir_drill*]
    sql: COUNT(case when ${timestamp_date} IS NOT NULL then ${timestamp_date} else null end) ;;
  }

  measure: uuid_ts_date_count {
    label: "Uuid Ts Date Count (Distinct)"
    description: "The distinct count of uuid ts date's per grouping."
    type: count_distinct
    drill_fields: [ir_drill*]
    sql: ${uuid_ts_date} ;;
  }

  measure: uuid_ts_date_count_all {
    label: "Uuid Ts Date Count (Non-Null)"
    description: "The count of all non-null uuid ts date occurrences per grouping."
    type: number
    drill_fields: [ir_drill*]
    sql: COUNT(case when ${uuid_ts_date} IS NOT NULL then ${uuid_ts_date} else null end) ;;
  }


}
