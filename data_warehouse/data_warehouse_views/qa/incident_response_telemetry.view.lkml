# This is the view file for the analytics.qa.incident_response_telemetry table.
view: incident_response_telemetry {
  sql_table_name: qa.incident_response_telemetry ;;
  view_label: "Incident Response Telemetry"

  # FILTERS

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
  measure: count {
    description: "Count of rows/occurrences."
    type: count
  }

  measure: user_count {
    label: " User Count"
    description: "The distinct count of Incident Response Telemetry Users within each grouping."
    type: count_distinct
    sql: ${user_id} ;;
  }

  measure: anonymous_count {
    label: " Anonymous Count"
    description: "The distinct count of Incident Response Telemetry Anonymouss within each grouping."
    type: count_distinct
    sql: ${anonymous_id} ;;
  }

  measure: isactive_count {
    label: "Isactive Users"
    description: "The distinct count of Incident Response Telemetry with Isactive marked true."
    group_label: "User Counts"
    type: count_distinct
    sql: case when ${isactive} then ${id} else null end ;;
  }

  measure: id_count {
    label: " Id Count"
    description: "The distinct count of Incident Response Telemetry Id within each grouping."
    type: count_distinct
    sql: ${id} ;;
  }

  measure: totalchecklistitems_sum {
    description: "The sum of Totalchecklistitems within each grouping."
    type: sum
    group_label: "Totalchecklistitems Measures"
    sql: ${totalchecklistitems} ;;
  }

  measure: totalchecklistitems_max {
    description: "The max Totalchecklistitems within each grouping."
    type: max
    group_label: "Totalchecklistitems Measures"
    sql: ${totalchecklistitems} ;;
  }

  measure: totalchecklistitems_min {
    description: "The min Totalchecklistitems within each grouping."
    type: min
    group_label: "Totalchecklistitems Measures"
    sql: ${totalchecklistitems} ;;
  }

  measure: totalchecklistitems_avg {
    description: "The average Totalchecklistitems within each grouping."
    type: average
    group_label: "Totalchecklistitems Measures"
    sql: ${totalchecklistitems} ;;
  }

  measure: totalchecklistitems_median {
    description: "The median  Totalchecklistitems within each grouping."
    type: median
    group_label: "Totalchecklistitems Measures"
    sql: ${totalchecklistitems} ;;
  }

  measure: numchecklists_max {
    description: "The max Numchecklists within each grouping."
    type: max
    group_label: "Numchecklists Measures"
    sql: ${numchecklists} ;;
  }

  measure: numchecklists_min {
    description: "The min Numchecklists within each grouping."
    type: min
    group_label: "Numchecklists Measures"
    sql: ${numchecklists} ;;
  }

  measure: numchecklists_avg {
    description: "The average Numchecklists within each grouping."
    type: average
    group_label: "Numchecklists Measures"
    sql: ${numchecklists} ;;
  }

  measure: numchecklists_median {
    description: "The median  Numchecklists within each grouping."
    type: median
    group_label: "Numchecklists Measures"
    sql: ${numchecklists} ;;
  }

  measure: activestage_max {
    description: "The max Activestages within each grouping."
    type: max
    group_label: "Activestage Measures"
    sql: ${activestage} ;;
  }

  measure: activestage_min {
    description: "The min Activestages within each grouping."
    type: min
    group_label: "Activestage Measures"
    sql: ${activestage} ;;
  }

  measure: activestage_avg {
    description: "The average Activestages within each grouping."
    type: average
    group_label: "Activestage Measures"
    sql: ${activestage} ;;
  }

  measure: activestage_median {
    description: "The median  Activestages within each grouping."
    type: median
    group_label: "Activestage Measures"
    sql: ${activestage} ;;
  }

  measure: createat_max {
    description: "The max Createats within each grouping."
    type: max
    group_label: "Createat Measures"
    sql: ${createat} ;;
  }

  measure: createat_min {
    description: "The min Createats within each grouping."
    type: min
    group_label: "Createat Measures"
    sql: ${createat} ;;
  }

  measure: createat_avg {
    description: "The average Createats within each grouping."
    type: average
    group_label: "Createat Measures"
    sql: ${createat} ;;
  }

  measure: createat_median {
    description: "The median  Createats within each grouping."
    type: median
    group_label: "Createat Measures"
    sql: ${createat} ;;
  }

  measure: public_count {
    label: "Public Users"
    description: "The distinct count of Incident Response Telemetry with Public marked true."
    group_label: "User Counts"
    type: count_distinct
    sql: case when ${public} then ${id} else null end ;;
  }

  measure: header_isactive_count {
    label: "Header_Isactive Users"
    description: "The distinct count of Incident Response Telemetry with Header Isactive marked true."
    group_label: "User Counts"
    type: count_distinct
    sql: case when ${header_isactive} then ${id} else null end ;;
  }

  measure: header_count {
    label: " Header Count"
    description: "The distinct count of Incident Response Telemetry Headers within each grouping."
    type: count_distinct
    sql: ${header_id} ;;
  }

  measure: header_createdat_max {
    description: "The max Header Createdats within each grouping."
    type: max
    group_label: "Header Createdat Measures"
    sql: ${header_createdat} ;;
  }

  measure: header_createdat_min {
    description: "The min Header Createdats within each grouping."
    type: min
    group_label: "Header Createdat Measures"
    sql: ${header_createdat} ;;
  }

  measure: header_createdat_avg {
    description: "The average Header Createdats within each grouping."
    type: average
    group_label: "Header Createdat Measures"
    sql: ${header_createdat} ;;
  }

  measure: header_createdat_median {
    description: "The median  Header Createdats within each grouping."
    type: median
    group_label: "Header Createdat Measures"
    sql: ${header_createdat} ;;
  }

  measure: numslashcommands_max {
    description: "The max Numslashcommands within each grouping."
    type: max
    group_label: "Numslashcommands Measures"
    sql: ${numslashcommands} ;;
  }

  measure: numslashcommands_min {
    description: "The min Numslashcommands within each grouping."
    type: min
    group_label: "Numslashcommands Measures"
    sql: ${numslashcommands} ;;
  }

  measure: numslashcommands_avg {
    description: "The average Numslashcommands within each grouping."
    type: average
    group_label: "Numslashcommands Measures"
    sql: ${numslashcommands} ;;
  }

  measure: numslashcommands_median {
    description: "The median  Numslashcommands within each grouping."
    type: median
    group_label: "Numslashcommands Measures"
    sql: ${numslashcommands} ;;
  }

  measure: ispublic_count {
    label: "Ispublic Users"
    description: "The distinct count of Incident Response Telemetry with Ispublic marked true."
    group_label: "User Counts"
    type: count_distinct
    sql: case when ${ispublic} then ${id} else null end ;;
  }

  measure: nummembers_max {
    description: "The max Nummembers within each grouping."
    type: max
    group_label: "Nummembers Measures"
    sql: ${nummembers} ;;
  }

  measure: nummembers_min {
    description: "The min Nummembers within each grouping."
    type: min
    group_label: "Nummembers Measures"
    sql: ${nummembers} ;;
  }

  measure: nummembers_avg {
    description: "The average Nummembers within each grouping."
    type: average
    group_label: "Nummembers Measures"
    sql: ${nummembers} ;;
  }

  measure: nummembers_median {
    description: "The median  Nummembers within each grouping."
    type: median
    group_label: "Nummembers Measures"
    sql: ${nummembers} ;;
  }

  measure: wascommander_count {
    label: "Wascommander Users"
    description: "The distinct count of Incident Response Telemetry with Wascommander marked true."
    group_label: "User Counts"
    type: count_distinct
    sql: case when ${wascommander} then ${id} else null end ;;
  }

  measure: wasassignee_count {
    label: "Wasassignee Users"
    description: "The distinct count of Incident Response Telemetry with Wasassignee marked true."
    group_label: "User Counts"
    type: count_distinct
    sql: case when ${wasassignee} then ${id} else null end ;;
  }


}