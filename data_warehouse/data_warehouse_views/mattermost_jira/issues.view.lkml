# This is the view file for the analytics.mattermost_jira.issues table.
view: issues {
  sql_table_name: mattermost_jira.issues ;;
  view_label: "Issues"

  # FILTERS

  # DIMENSIONS
  dimension: id {
    description: "The Jira ticket ID."
    type: string
    sql: ${TABLE}.id ;;
    hidden: no
  }

  dimension: key {
    description: "The Jira Ticket Key (format AA-1234)."
    type: string
    link: {
      label: "Go to Jira Issue"
      url: "https://mattermost.atlassian.net/browse/{{ value }}"
      icon_url: "https://mattermost.atlassian.net/images/jira-safari-pintab-icon.svg"
    }
    link: {
      label: "Filter Dashboard On {{ value }}"
      url: "/dashboards/173?Issue%20ID={{ id._value }}"
      icon_url: "https://mattermost.looker.com//images/favicon.ico"
    }
    link: {
      label: "Clear Dashboard Filters"
      url: "/dashboards/173"
      icon_url: "https://mattermost.looker.com//images/favicon.ico"
    }
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
    label: "Assignee: Account Type"
    description: ""
    type: string
    sql: ${TABLE}.fields:assignee:accountType::string ;;
    hidden: no
  }

    dimension: assignee_active {
    label: "Assignee: Active"
    description: ""
    type: yesno
    sql: ${TABLE}.fields:assignee:active::boolean ;;
    hidden: no
  }

    dimension: assignee_avatarurls {
    label: "Assignee: Avatar URLs"
    description: ""
    type: string
    sql: ${TABLE}.fields:assignee:avatarUrls::string ;;
    hidden: no
  }

    dimension: assignee_displayname {
    label: "Assignee"
    description: ""
    type: string
    sql: ${TABLE}.fields:assignee:displayName::string ;;
    hidden: no
  }

    dimension: assignee_self {
    label: "Assignee: Self"
    description: ""
    type: string
    sql: ${TABLE}.fields:assignee:self::string ;;
    hidden: no
  }

    dimension: assignee_timezone {
    label: "Assignee: Timezone"
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
    label: "Components"
    description: ""
    type: string
    sql: ${TABLE}.fields:components::string ;;
    hidden: no
  }

  dimension_group: created {
    description: ""
    type: time
    timeframes: [date, week, month, year, fiscal_quarter, fiscal_year]
    sql: LEFT(${TABLE}.fields:created::string, 10)::DATE ;;
    hidden: no
  }

  dimension: creator_accountid {
    label: "Creator: Account ID"
    description: ""
    type: string
    sql: ${TABLE}.fields:creator:accountId::string ;;
    hidden: no
  }

    dimension: creator_accounttype {
    label: "Creator: Account Type"
    description: ""
    type: string
    sql: ${TABLE}.fields:creator:accountType::string ;;
    hidden: no
  }

    dimension: creator_active {
    label: "Creator: Active"
    description: ""
    type: yesno
    sql: ${TABLE}.fields:creator:active::boolean ;;
    hidden: no
  }

    dimension: creator_avatarurls {
    label: "Creator: Avatar URLs"
    description: ""
    type: string
    sql: ${TABLE}.fields:creator:avatarUrls::string ;;
    hidden: no
  }

    dimension: creator_displayname {
    label: "Creator"
    description: ""
    type: string
    sql: ${TABLE}.fields:creator:displayName::string ;;
    hidden: no
  }

    dimension: creator_self {
    label: "Creator: Self"
    description: ""
    type: string
    sql: ${TABLE}.fields:creator:self::string ;;
    hidden: no
  }

    dimension: creator_timezone {
    label: "Creator: Timezone"
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
    label: "Mana"
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
    label: "QA Assignee: Account ID"
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
    description: "QA Assignee: Active"
    type: yesno
    sql: ${TABLE}.fields:customfield_11100:active::boolean ;;
    hidden: no
  }

    dimension: customfield_11100_avatarurls {
    description: "QA Assignee: Avatar URLs"
    type: string
    sql: ${TABLE}.fields:customfield_11100:avatarUrls::string ;;
    hidden: no
  }

    dimension: customfield_11100_displayname {
    label: "QA Assignee"
    description: "The name of the QA rep assigned to quality check the Jira Issue."
    type: string
    sql: ${TABLE}.fields:customfield_11100:displayName::string ;;
    hidden: no
  }

    dimension: customfield_11100_self {
    label: "QA Assignee: Self"
    description: ""
    type: string
    sql: ${TABLE}.fields:customfield_11100:self::string ;;
    hidden: no
  }

    dimension: customfield_11100_timezone {
    label: "QA Assignee: Timezone"
    description: ""
    type: string
    sql: ${TABLE}.fields:customfield_11100:timeZone::string ;;
    hidden: no
  }

    dimension: customfield_11101_id {
    label: "QA Assignee: ID"
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
    label: "Mattermost Team"
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
    label: "Description"
    description: ""
    type: string
    sql: ${TABLE}.fields:description::string ;;
    hidden: no
  }

  dimension: duedate {
    label: "Due Date"
    description: ""
    type: string
    sql: ${TABLE}.fields:duedate::string ;;
    hidden: no
  }

  dimension: fix_version {
    label: "Fix Version"
    description: ""
    type: string
    sql: split_part(replace(split_part(replace(replace(${TABLE}.fields:fixVersions::string, '[',''), ']', ''), '"name":', 2), '"', ''), ',', 1) ;;
    hidden: no
    link: {
      label: "Mattermost Handbook: Fix Versions"
      url: "https://handbook.mattermost.com/operations/research-and-development/product/development-process/new-bug-tickets/jira-fix-versions"
      icon_url: "https://gblobscdn.gitbook.com/orgs%2F-LorO8UtLPwxE06BcHq5%2Favatar.png?alt=media"
    }
    link: {
      label: "Filter Dasbhoard On Fix Version"
      url: "/dashboards/173?Fix%20Version={{ value }}"
      icon_url: "https://mattermost.looker.com//images/favicon.ico"
    }
    link: {
      label: "Clear Dashboard Filters"
      url: "/dashboards/173"
      icon_url: "https://mattermost.looker.com//images/favicon.ico"
    }
  }

  dimension: issuelinks {
    label: "Issue Links"
    description: ""
    type: string
    sql: ${TABLE}.fields:issuelinks::string ;;
    hidden: no
  }

  dimension: issuetype_avatarid {
    label: "Issue Type: Avatar ID"
    description: ""
    type: string
    sql: ${TABLE}.fields:issuetype:avatarId::string ;;
    hidden: no
  }

    dimension: issuetype_description {
    label: "Issue Type: Description"
    description: ""
    type: string
    sql: ${TABLE}.fields:issuetype:description::string ;;
    hidden: no
  }

    dimension: issuetype_iconurl {
    label: "Issue Type: Icon URL"
    description: ""
    type: string
    sql: ${TABLE}.fields:issuetype:iconUrl::string ;;
    hidden: no
  }

    dimension: issuetype_id {
    label: "Issue Type: ID"
    description: ""
    type: string
    sql: ${TABLE}.fields:issuetype:id::string ;;
    hidden: no
  }

    dimension: issuetype_name {
    label: "Issue Type"
    description: ""
    type: string
    sql: ${TABLE}.fields:issuetype:name::string ;;
    hidden: no
  }

    dimension: issuetype_self {
    label: "Issue Type: Self"
    description: ""
    type: string
    sql: ${TABLE}.fields:issuetype:self::string ;;
    hidden: no
  }

    dimension: issuetype_subtask {
    label: "Issue Type: Sub-Task"
    description: ""
    type: string
    sql: ${TABLE}.fields:issuetype:subtask::string ;;
    hidden: no
  }

    dimension: labels {
    label: "Labels"
    description: "The Jira Ticket labels used to classify the ticket into one or multiple categories of ticket."
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
    label: "Reporter: Account ID"
    description: ""
    type: string
    sql: ${TABLE}.fields:reporter:accountId::string ;;
    hidden: no
  }

    dimension: reporter_accounttype {
    label: "Reporter: Account Type"
    description: ""
    type: string
    sql: ${TABLE}.fields:reporter:accountType::string ;;
    hidden: no
  }

    dimension: reporter_active {
    label: "Reporter: Active"
    description: ""
    type: yesno
    sql: ${TABLE}.fields:reporter:active::boolean ;;
    hidden: no
  }

    dimension: reporter_avatarurls {
    label: "Reporter: Avatar URLs"
    description: ""
    type: string
    sql: ${TABLE}.fields:reporter:avatarUrls::string ;;
    hidden: no
  }

    dimension: reporter_displayname {
    label: "Reporter"
    description: ""
    type: string
    sql: ${TABLE}.fields:reporter:displayName::string ;;
    hidden: no
  }

    dimension: reporter_self {
    label: "Reporter: Self"
    description: ""
    type: string
    sql: ${TABLE}.fields:reporter:self::string ;;
    hidden: no
  }

    dimension: reporter_timezone {
    label: "Reporter: Timezone"
    description: ""
    type: string
    sql: ${TABLE}.fields:reporter:timeZone::string ;;
    hidden: no
  }

    dimension: resolution_description {
    label: "Resolution: Description"
    description: ""
    type: string
    sql: ${TABLE}.fields:resolution:description::string ;;
    hidden: no
  }

    dimension: resolution_id {
    label: "Resolution: ID"
    description: ""
    type: string
    sql: ${TABLE}.fields:resolution:id::string ;;
    hidden: no
  }

    dimension: resolution_name {
    label: "Resolution Status"
    description: ""
    type: string
    sql: COALESCE(${TABLE}.fields:resolution:name::string, 'Open') ;;
      link: {
        label: "Filter Dasbhoard On Resolution Status"
        url: "/dashboards/173?Resolution%20Status={{ value }}"
        icon_url: "https://mattermost.looker.com//images/favicon.ico"
      }
      link: {
        label: "Clear Dashboard Filters"
        url: "/dashboards/173"
        icon_url: "https://mattermost.looker.com//images/favicon.ico"
      }
    hidden: no
  }

    dimension: resolution_self {
    label: "Resolution: Self"
    description: ""
    type: string
    sql: ${TABLE}.fields:resolution:self::string ;;
    hidden: no
  }

    dimension_group: resolutiondate {
    label: "Resolution"
    description: ""
    type: time
    timeframes: [date, month, week, year, fiscal_quarter, fiscal_year]
    sql: LEFT(${TABLE}.fields:resolutiondate::string, 10)::DATE ;;
    hidden: no
  }

  dimension: security {
    label: "Security"
    description: ""
    type: string
    sql: ${TABLE}.fields:security::string ;;
    hidden: no
  }

  dimension: status_description {
    label: "Status: Description"
    description: ""
    type: string
    sql: ${TABLE}.fields:status:description::string ;;
    hidden: no
  }

    dimension: status_iconurl {
    label: "Status: Icon URL"
    description: ""
    type: string
    sql: ${TABLE}.fields:status:iconUrl::string ;;
    hidden: no
  }

    dimension: status_id {
    label: "Status: ID"
    description: ""
    type: string
    sql: ${TABLE}.fields:status:id::string ;;
    hidden: no
  }

    dimension: status_name {
    label: "Status"
    description: ""
    type: string
    sql: ${TABLE}.fields:status:name::string ;;
    hidden: no
  }

    dimension: status_self {
    label: "Status: Self"
    description: ""
    type: string
    sql: ${TABLE}.fields:status:self::string ;;
    hidden: no
  }

    dimension: status_statuscategory {
    label: "Status Category"
    description: ""
    type: string
    sql: ${TABLE}.fields:status:statusCategory::string ;;
    hidden: no
  }

    dimension_group: statuscategorychangedate {
    label: "Status Category Change"
    description: ""
    type: time
    timeframes: [date, week, month, year, fiscal_quarter, fiscal_year]
    sql: LEFT(${TABLE}.fields:statuscategorychangedate::string, 10)::DATE ;;
    hidden: no
  }

  dimension: subtasks {
    label: "Sub-Tasks"
    description: ""
    type: string
    sql: ${TABLE}.fields:subtasks::string ;;
    hidden: no
  }

  dimension: summary {
    label: "Issue Summary"
    description: ""
    type: string
    sql: ${TABLE}.fields:summary::string ;;
    hidden: no
  }

  dimension: timeestimate {
    label: "Time Estimate"
    description: ""
    type: string
    sql: ${TABLE}.fields:timeestimate::string ;;
    hidden: no
  }

  dimension: timeoriginalestimate {
    label: "Time Estimate (Original)"
    description: ""
    type: string
    sql: ${TABLE}.fields:timeoriginalestimate::string ;;
    hidden: no
  }

  dimension: timespent {
    label: "Time Spent"
    description: ""
    type: string
    sql: ${TABLE}.fields:timespent::string ;;
    hidden: no
  }

  dimension_group: updated {
    description: ""
    type: time
    timeframes: [date, week, month, year, fiscal_quarter, fiscal_year]
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
    label: "Watch Count"
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
