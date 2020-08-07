# This is the view file for the analytics.mattermost.community_program_members table.
view: community_program_members {
  sql_table_name: mattermost.community_program_members ;;
  view_label: "Community Program Members"

  # FILTERS

  # DIMENSIONS
  dimension: id {
    description: "The unique ID of the Mattermost Community Program Member."
    type: string
    sql: ${TABLE}.id ;;
    hidden: no
  }

  dimension: full_name {
    description: "The Full Name of the Mattermost Community Program Member."
    type: string
    sql: ${TABLE}.full_name ;;
    hidden: no
  }

  dimension: program_type {
    description: "The program the Member and/or Partner is part of (Mattermost Superstar vs. Trusted Partner)"
    type: string
    sql: ${TABLE}.program_type ;;
    hidden: no
  }


  # DIMENSION GROUPS/DATES
  dimension_group: start {
    description: "The start date the member began participation in the program."
    type: time
    timeframes: [date, month, year]
    sql: ${TABLE}.start_date ;;
    hidden: no
  }

  dimension_group: end {
    description: "The end date the member completes participation in the program."
    type: time
    timeframes: [date, month, year]
    sql: ${TABLE}.end_date ;;
    hidden: no
  }


  # MEASURES
  measure: count {
    description: "Count of rows/occurrences."
    type: count
  }

  measure: member_count {
    description: "The distinct count of program members within the grouping."
  }


}
