# This is the view file for the analytics.mattermost_jira.issue_comments table.
view: issue_comments {
  sql_table_name: mattermost_jira.issue_comments ;;
  view_label: "Issue Comments"

  # FILTERS

  # DIMENSIONS
  dimension: body {
    label: "Comment"
    description: ""
    type: string
    sql: ${TABLE}.body ;;
    hidden: no
  }

  dimension: id {
    label: "Comment ID"
    description: ""
    type: string
    sql: ${TABLE}.id ;;
    hidden: no
  }

  dimension: issueid {
    label: "Issue ID"
    description: ""
    type: string
    sql: ${TABLE}.issueid ;;
    hidden: no
  }

  dimension: jsdpublic {
    description: ""
    type: yesno
    sql: ${TABLE}.jsdpublic ;;
    hidden: no
  }

  dimension: self {
    description: ""
    type: string
    sql: ${TABLE}.self ;;
    hidden: no
  }

  dimension: _sdc_sequence {
    description: ""
    type: number
    sql: ${TABLE}._sdc_sequence ;;
    hidden: no
  }

  dimension: _sdc_table_version {
    description: ""
    type: number
    sql: ${TABLE}._sdc_table_version ;;
    hidden: no
  }

  dimension: commenter {
    label: "Commenter Name"
    type: string
    sql: ${TABLE}.author:displayName::string ;;
    hidden: no
  }

  dimension: updater {
    label: "Updater Name"
    type: string
    sql: ${TABLE}.updateauthor:displayName::string ;;
    hidden: no
  }


  # DIMENSION GROUPS/DATES
  dimension_group: created {
  description: ""
  type: time
  timeframes: [date, month, year, week, fiscal_year, fiscal_quarter]
    sql: ${TABLE}.created ;;
    hidden: no
  }

  dimension_group: updated {
  description: ""
  type: time
  timeframes: [date, month, year, week, fiscal_year, fiscal_quarter]
    sql: ${TABLE}.updated ;;
    hidden: no
  }

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

  measure: comment_count {
    description: "The distinct count of comments per grouping."
    type: count_distinct
    sql: ${id} ;;
  }

  measure: issues_count {
    description: "The distinct count of issues per grouping."
    type: count_distinct
    sql: ${issueid} ;;
  }


}
