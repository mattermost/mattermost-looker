# This is the view file for the analytics.mattermost_jira.issues table.
view: issues {
  sql_table_name: mattermost_jira.issues ;;
  view_label: "Issues"

  # FILTERS

  # DIMENSIONS
  dimension: id {
    description: "" 
    type: string
    sql: ${TABLE}.id ;;
    hidden: no
  }

  dimension: key {
    description: "" 
    type: string
    sql: ${TABLE}.key ;;
    hidden: no
  }

  dimension: self {
    description: "" 
    type: string
    sql: ${TABLE}.self ;;
    hidden: no
  }

  dimension: _sdc_table_version {
    description: "" 
    type: number
    sql: ${TABLE}._sdc_table_version ;;
    hidden: no
  }

  dimension: aggregateprogress_progress {
    description: "" 
    type: string
    sql: ${TABLE}.fields:aggregateprogress:progress::string ;;
    hidden: no
  }

	  dimension: aggregateprogress_total {
    description: "" 
    type: string
    sql: ${TABLE}.fields:aggregateprogress:total::string ;;
    hidden: no
  }

	  dimension: aggregatetimeestimate {
    description: "" 
    type: string
    sql: ${TABLE}.fields:aggregatetimeestimate::string ;;
    hidden: no
  }

  dimension: aggregatetimeoriginalestimate {
    description: "" 
    type: string
    sql: ${TABLE}.fields:aggregatetimeoriginalestimate::string ;;
    hidden: no
  }

  dimension: aggregatetimespent {
    description: "" 
    type: string
    sql: ${TABLE}.fields:aggregatetimespent::string ;;
    hidden: no
  }

  dimension: assignee_accountid {
    description: "" 
    type: string
    sql: ${TABLE}.fields:assignee:accountId::string ;;
    hidden: no
  }

	  dimension: assignee_accounttype {
    description: "" 
    type: string
    sql: ${TABLE}.fields:assignee:accountType::string ;;
    hidden: no
  }

	  dimension: assignee_active {
    description: "" 
    type: string
    sql: ${TABLE}.fields:assignee:active::string ;;
    hidden: no
  }

	  dimension: assignee_avatarurls {
    description: "" 
    type: string
    sql: ${TABLE}.fields:assignee:avatarUrls::string ;;
    hidden: no
  }

	  dimension: assignee_displayname {
    description: "" 
    type: string
    sql: ${TABLE}.fields:assignee:displayName::string ;;
    hidden: no
  }

	  dimension: assignee_self {
    description: "" 
    type: string
    sql: ${TABLE}.fields:assignee:self::string ;;
    hidden: no
  }

	  dimension: assignee_timezone {
    description: "" 
    type: string
    sql: ${TABLE}.fields:assignee:timeZone::string ;;
    hidden: no
  }

	  dimension: attachment {
    description: "" 
    type: string
    sql: ${TABLE}.fields:attachment::string ;;
    hidden: no
  }

  dimension: components {
    description: "" 
    type: string
    sql: ${TABLE}.fields:components::string ;;
    hidden: no
  }

  dimension: created {
    description: "" 
    type: string
    sql: ${TABLE}.fields:created::string ;;
    hidden: no
  }

  dimension: creator_accountid {
    description: "" 
    type: string
    sql: ${TABLE}.fields:creator:accountId::string ;;
    hidden: no
  }

	  dimension: creator_accounttype {
    description: "" 
    type: string
    sql: ${TABLE}.fields:creator:accountType::string ;;
    hidden: no
  }

	  dimension: creator_active {
    description: "" 
    type: string
    sql: ${TABLE}.fields:creator:active::string ;;
    hidden: no
  }

	  dimension: creator_avatarurls {
    description: "" 
    type: string
    sql: ${TABLE}.fields:creator:avatarUrls::string ;;
    hidden: no
  }

	  dimension: creator_displayname {
    description: "" 
    type: string
    sql: ${TABLE}.fields:creator:displayName::string ;;
    hidden: no
  }

	  dimension: creator_self {
    description: "" 
    type: string
    sql: ${TABLE}.fields:creator:self::string ;;
    hidden: no
  }

	  dimension: creator_timezone {
    description: "" 
    type: string
    sql: ${TABLE}.fields:creator:timeZone::string ;;
    hidden: no
  }

	  dimension: customfield_10000 {
    description: "" 
    type: string
    sql: ${TABLE}.fields:customfield_10000::string ;;
    hidden: no
  }

  dimension: customfield_10001 {
    description: "" 
    type: string
    sql: ${TABLE}.fields:customfield_10001::string ;;
    hidden: no
  }

  dimension: customfield_10003 {
    description: "" 
    type: string
    sql: ${TABLE}.fields:customfield_10003::string ;;
    hidden: no
  }

  dimension: customfield_10004 {
    description: "" 
    type: string
    sql: ${TABLE}.fields:customfield_10004::string ;;
    hidden: no
  }

  dimension: customfield_10006 {
    description: "" 
    type: string
    sql: ${TABLE}.fields:customfield_10006::string ;;
    hidden: no
  }

  dimension: customfield_10007 {
    description: "" 
    type: string
    sql: ${TABLE}.fields:customfield_10007::string ;;
    hidden: no
  }

  dimension: customfield_10011 {
    description: "" 
    type: string
    sql: ${TABLE}.fields:customfield_10011::string ;;
    hidden: no
  }

  dimension: customfield_10500 {
    description: "" 
    type: string
    sql: ${TABLE}.fields:customfield_10500::string ;;
    hidden: no
  }

  dimension: customfield_10600_hasepiclinkfielddependency {
    description: "" 
    type: string
    sql: ${TABLE}.fields:customfield_10600:hasEpicLinkFieldDependency::string ;;
    hidden: no
  }

	  dimension: customfield_10600_noneditablereason {
    description: "" 
    type: string
    sql: ${TABLE}.fields:customfield_10600:nonEditableReason::string ;;
    hidden: no
  }

	  dimension: customfield_10600_showfield {
    description: "" 
    type: string
    sql: ${TABLE}.fields:customfield_10600:showField::string ;;
    hidden: no
  }

	  dimension: customfield_10700 {
    description: "" 
    type: string
    sql: ${TABLE}.fields:customfield_10700::string ;;
    hidden: no
  }

  dimension: customfield_10800 {
    description: "" 
    type: string
    sql: ${TABLE}.fields:customfield_10800::string ;;
    hidden: no
  }

  dimension: customfield_10900 {
    description: "" 
    type: string
    sql: ${TABLE}.fields:customfield_10900::string ;;
    hidden: no
  }

  dimension: customfield_11100_accountid {
    description: "" 
    type: string
    sql: ${TABLE}.fields:customfield_11100:accountId::string ;;
    hidden: no
  }

	  dimension: customfield_11100_accounttype {
    description: "" 
    type: string
    sql: ${TABLE}.fields:customfield_11100:accountType::string ;;
    hidden: no
  }

	  dimension: customfield_11100_active {
    description: "" 
    type: string
    sql: ${TABLE}.fields:customfield_11100:active::string ;;
    hidden: no
  }

	  dimension: customfield_11100_avatarurls {
    description: "" 
    type: string
    sql: ${TABLE}.fields:customfield_11100:avatarUrls::string ;;
    hidden: no
  }

	  dimension: customfield_11100_displayname {
    description: "" 
    type: string
    sql: ${TABLE}.fields:customfield_11100:displayName::string ;;
    hidden: no
  }

	  dimension: customfield_11100_self {
    description: "" 
    type: string
    sql: ${TABLE}.fields:customfield_11100:self::string ;;
    hidden: no
  }

	  dimension: customfield_11100_timezone {
    description: "" 
    type: string
    sql: ${TABLE}.fields:customfield_11100:timeZone::string ;;
    hidden: no
  }

	  dimension: customfield_11101_id {
    description: "" 
    type: string
    sql: ${TABLE}.fields:customfield_11101:id::string ;;
    hidden: no
  }

	  dimension: customfield_11101_self {
    description: "" 
    type: string
    sql: ${TABLE}.fields:customfield_11101:self::string ;;
    hidden: no
  }

	  dimension: customfield_11101_value {
    description: "" 
    type: string
    sql: ${TABLE}.fields:customfield_11101:value::string ;;
    hidden: no
  }

	  dimension: customfield_11103 {
    description: "" 
    type: string
    sql: ${TABLE}.fields:customfield_11103::string ;;
    hidden: no
  }

  dimension: customfield_11104 {
    description: "" 
    type: string
    sql: ${TABLE}.fields:customfield_11104::string ;;
    hidden: no
  }

  dimension: customfield_11105 {
    description: "" 
    type: string
    sql: ${TABLE}.fields:customfield_11105::string ;;
    hidden: no
  }

  dimension: customfield_11106 {
    description: "" 
    type: string
    sql: ${TABLE}.fields:customfield_11106::string ;;
    hidden: no
  }

  dimension: customfield_11107 {
    description: "" 
    type: string
    sql: ${TABLE}.fields:customfield_11107::string ;;
    hidden: no
  }

  dimension: customfield_11108 {
    description: "" 
    type: string
    sql: ${TABLE}.fields:customfield_11108::string ;;
    hidden: no
  }

  dimension: customfield_11109 {
    description: "" 
    type: string
    sql: ${TABLE}.fields:customfield_11109::string ;;
    hidden: no
  }

  dimension: customfield_11110 {
    description: "" 
    type: string
    sql: ${TABLE}.fields:customfield_11110::string ;;
    hidden: no
  }

  dimension: customfield_11111 {
    description: "" 
    type: string
    sql: ${TABLE}.fields:customfield_11111::string ;;
    hidden: no
  }

  dimension: customfield_11112 {
    description: "" 
    type: string
    sql: ${TABLE}.fields:customfield_11112::string ;;
    hidden: no
  }

  dimension: customfield_11113 {
    description: "" 
    type: string
    sql: ${TABLE}.fields:customfield_11113::string ;;
    hidden: no
  }

  dimension: customfield_11114 {
    description: "" 
    type: string
    sql: ${TABLE}.fields:customfield_11114::string ;;
    hidden: no
  }

  dimension: customfield_11116 {
    description: "" 
    type: string
    sql: ${TABLE}.fields:customfield_11116::string ;;
    hidden: no
  }

  dimension: customfield_11117 {
    description: "" 
    type: string
    sql: ${TABLE}.fields:customfield_11117::string ;;
    hidden: no
  }

  dimension: customfield_11118 {
    description: "" 
    type: string
    sql: ${TABLE}.fields:customfield_11118::string ;;
    hidden: no
  }

  dimension: customfield_11119 {
    description: "" 
    type: string
    sql: ${TABLE}.fields:customfield_11119::string ;;
    hidden: no
  }

  dimension: customfield_11121 {
    description: "" 
    type: string
    sql: ${TABLE}.fields:customfield_11121::string ;;
    hidden: no
  }

  dimension: customfield_11122 {
    description: "" 
    type: string
    sql: ${TABLE}.fields:customfield_11122::string ;;
    hidden: no
  }

  dimension: customfield_11123 {
    description: "" 
    type: string
    sql: ${TABLE}.fields:customfield_11123::string ;;
    hidden: no
  }

  dimension: customfield_11124 {
    description: "" 
    type: string
    sql: ${TABLE}.fields:customfield_11124::string ;;
    hidden: no
  }

  dimension: customfield_11125 {
    description: "" 
    type: string
    sql: ${TABLE}.fields:customfield_11125::string ;;
    hidden: no
  }

  dimension: customfield_11126 {
    description: "" 
    type: string
    sql: ${TABLE}.fields:customfield_11126::string ;;
    hidden: no
  }

  dimension: customfield_11127 {
    description: "" 
    type: string
    sql: ${TABLE}.fields:customfield_11127::string ;;
    hidden: no
  }

  dimension: description {
    description: "" 
    type: string
    sql: ${TABLE}.fields:description::string ;;
    hidden: no
  }

  dimension: duedate {
    description: "" 
    type: string
    sql: ${TABLE}.fields:duedate::string ;;
    hidden: no
  }

  dimension: issuelinks {
    description: "" 
    type: string
    sql: ${TABLE}.fields:issuelinks::string ;;
    hidden: no
  }

  dimension: issuetype_avatarid {
    description: "" 
    type: string
    sql: ${TABLE}.fields:issuetype:avatarId::string ;;
    hidden: no
  }

	  dimension: issuetype_description {
    description: "" 
    type: string
    sql: ${TABLE}.fields:issuetype:description::string ;;
    hidden: no
  }

	  dimension: issuetype_iconurl {
    description: "" 
    type: string
    sql: ${TABLE}.fields:issuetype:iconUrl::string ;;
    hidden: no
  }

	  dimension: issuetype_id {
    description: "" 
    type: string
    sql: ${TABLE}.fields:issuetype:id::string ;;
    hidden: no
  }

	  dimension: issuetype_name {
    description: "" 
    type: string
    sql: ${TABLE}.fields:issuetype:name::string ;;
    hidden: no
  }

	  dimension: issuetype_self {
    description: "" 
    type: string
    sql: ${TABLE}.fields:issuetype:self::string ;;
    hidden: no
  }

	  dimension: issuetype_subtask {
    description: "" 
    type: string
    sql: ${TABLE}.fields:issuetype:subtask::string ;;
    hidden: no
  }

	  dimension: labels {
    description: "" 
    type: string
    sql: ${TABLE}.fields:labels::string ;;
    hidden: no
  }

  dimension: progress_progress {
    description: "" 
    type: string
    sql: ${TABLE}.fields:progress:progress::string ;;
    hidden: no
  }

	  dimension: progress_total {
    description: "" 
    type: string
    sql: ${TABLE}.fields:progress:total::string ;;
    hidden: no
  }

	  dimension: project_avatarurls {
    description: "" 
    type: string
    sql: ${TABLE}.fields:project:avatarUrls::string ;;
    hidden: no
  }

	  dimension: project_id {
    description: "" 
    type: string
    sql: ${TABLE}.fields:project:id::string ;;
    hidden: no
  }

	  dimension: project_key {
    description: "" 
    type: string
    sql: ${TABLE}.fields:project:key::string ;;
    hidden: no
  }

	  dimension: project_name {
    description: "" 
    type: string
    sql: ${TABLE}.fields:project:name::string ;;
    hidden: no
  }

	  dimension: project_projecttypekey {
    description: "" 
    type: string
    sql: ${TABLE}.fields:project:projectTypeKey::string ;;
    hidden: no
  }

	  dimension: project_self {
    description: "" 
    type: string
    sql: ${TABLE}.fields:project:self::string ;;
    hidden: no
  }

	  dimension: project_simplified {
    description: "" 
    type: string
    sql: ${TABLE}.fields:project:simplified::string ;;
    hidden: no
  }

	  dimension: reporter_accountid {
    description: "" 
    type: string
    sql: ${TABLE}.fields:reporter:accountId::string ;;
    hidden: no
  }

	  dimension: reporter_accounttype {
    description: "" 
    type: string
    sql: ${TABLE}.fields:reporter:accountType::string ;;
    hidden: no
  }

	  dimension: reporter_active {
    description: "" 
    type: string
    sql: ${TABLE}.fields:reporter:active::string ;;
    hidden: no
  }

	  dimension: reporter_avatarurls {
    description: "" 
    type: string
    sql: ${TABLE}.fields:reporter:avatarUrls::string ;;
    hidden: no
  }

	  dimension: reporter_displayname {
    description: "" 
    type: string
    sql: ${TABLE}.fields:reporter:displayName::string ;;
    hidden: no
  }

	  dimension: reporter_self {
    description: "" 
    type: string
    sql: ${TABLE}.fields:reporter:self::string ;;
    hidden: no
  }

	  dimension: reporter_timezone {
    description: "" 
    type: string
    sql: ${TABLE}.fields:reporter:timeZone::string ;;
    hidden: no
  }

	  dimension: resolution_description {
    description: "" 
    type: string
    sql: ${TABLE}.fields:resolution:description::string ;;
    hidden: no
  }

	  dimension: resolution_id {
    description: "" 
    type: string
    sql: ${TABLE}.fields:resolution:id::string ;;
    hidden: no
  }

	  dimension: resolution_name {
    description: "" 
    type: string
    sql: ${TABLE}.fields:resolution:name::string ;;
    hidden: no
  }

	  dimension: resolution_self {
    description: "" 
    type: string
    sql: ${TABLE}.fields:resolution:self::string ;;
    hidden: no
  }

	  dimension: resolutiondate {
    description: "" 
    type: string
    sql: ${TABLE}.fields:resolutiondate::string ;;
    hidden: no
  }

  dimension: security {
    description: "" 
    type: string
    sql: ${TABLE}.fields:security::string ;;
    hidden: no
  }

  dimension: status_description {
    description: "" 
    type: string
    sql: ${TABLE}.fields:status:description::string ;;
    hidden: no
  }

	  dimension: status_iconurl {
    description: "" 
    type: string
    sql: ${TABLE}.fields:status:iconUrl::string ;;
    hidden: no
  }

	  dimension: status_id {
    description: "" 
    type: string
    sql: ${TABLE}.fields:status:id::string ;;
    hidden: no
  }

	  dimension: status_name {
    description: "" 
    type: string
    sql: ${TABLE}.fields:status:name::string ;;
    hidden: no
  }

	  dimension: status_self {
    description: "" 
    type: string
    sql: ${TABLE}.fields:status:self::string ;;
    hidden: no
  }

	  dimension: status_statuscategory {
    description: "" 
    type: string
    sql: ${TABLE}.fields:status:statusCategory::string ;;
    hidden: no
  }

	  dimension: statuscategorychangedate {
    description: "" 
    type: string
    sql: ${TABLE}.fields:statuscategorychangedate::string ;;
    hidden: no
  }

  dimension: subtasks {
    description: "" 
    type: string
    sql: ${TABLE}.fields:subtasks::string ;;
    hidden: no
  }

  dimension: summary {
    description: "" 
    type: string
    sql: ${TABLE}.fields:summary::string ;;
    hidden: no
  }

  dimension: timeestimate {
    description: "" 
    type: string
    sql: ${TABLE}.fields:timeestimate::string ;;
    hidden: no
  }

  dimension: timeoriginalestimate {
    description: "" 
    type: string
    sql: ${TABLE}.fields:timeoriginalestimate::string ;;
    hidden: no
  }

  dimension: timespent {
    description: "" 
    type: string
    sql: ${TABLE}.fields:timespent::string ;;
    hidden: no
  }

  dimension: updated {
    description: "" 
    type: string
    sql: ${TABLE}.fields:updated::string ;;
    hidden: no
  }

  dimension: votes_hasvoted {
    description: "" 
    type: string
    sql: ${TABLE}.fields:votes:hasVoted::string ;;
    hidden: no
  }

	  dimension: votes_self {
    description: "" 
    type: string
    sql: ${TABLE}.fields:votes:self::string ;;
    hidden: no
  }

	  dimension: votes_votes {
    description: "" 
    type: string
    sql: ${TABLE}.fields:votes:votes::string ;;
    hidden: no
  }

	  dimension: watches_iswatching {
    description: "" 
    type: string
    sql: ${TABLE}.fields:watches:isWatching::string ;;
    hidden: no
  }

	  dimension: watches_self {
    description: "" 
    type: string
    sql: ${TABLE}.fields:watches:self::string ;;
    hidden: no
  }

	  dimension: watches_watchcount {
    description: "" 
    type: string
    sql: ${TABLE}.fields:watches:watchCount::string ;;
    hidden: no
  }

	  dimension: workratio {
    description: "" 
    type: string
    sql: ${TABLE}.fields:workratio::string ;;
    hidden: no
  }

  
  # DIMENSION GROUPS/DATES
  dimension_group: _sdc_batched_at {
	description: "" 
	type: time
	timeframes: [date, month, year]
    sql: ${TABLE}._sdc_batched_at ;;
    hidden: no
  }

  dimension_group: _sdc_extracted_at {
	description: "" 
	type: time
	timeframes: [date, month, year]
    sql: ${TABLE}._sdc_extracted_at ;;
    hidden: no
  }

  dimension_group: _sdc_received_at {
	description: "" 
	type: time
	timeframes: [date, month, year]
    sql: ${TABLE}._sdc_received_at ;;
    hidden: no
  }

  
  # MEASURES
  measure: count {
    description: "Count of rows/occurrences."
    type: count
  }

  measure: key_count {
    label: " Key Count"
    description: "The distinct count of Key per grouping."
    type: count_distinct
    sql: ${key} ;;
  }

  measure: customfield_11101_count {
    label: " Customfield_11101 Count"
    description: "The distinct count of Customfield_11101S per grouping."
    type: count_distinct
    sql: ${customfield_11101_id} ;;
  }

  measure: issuetype_count {
    label: " Issuetype Count"
    description: "The distinct count of Issuetypes per grouping."
    type: count_distinct
    sql: ${issuetype_id} ;;
  }

  measure: project_count {
    label: " Project Count"
    description: "The distinct count of Projects per grouping."
    type: count_distinct
    sql: ${project_id} ;;
  }

  measure: resolution_count {
    label: " Resolution Count"
    description: "The distinct count of Resolutions per grouping."
    type: count_distinct
    sql: ${resolution_id} ;;
  }

  measure: status_count {
    label: " Status Count"
    description: "The distinct count of Statuss per grouping."
    type: count_distinct
    sql: ${status_id} ;;
  }


}