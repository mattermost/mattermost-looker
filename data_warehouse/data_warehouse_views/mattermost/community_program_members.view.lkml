# This is the view file for the analytics.mattermost.community_program_members table.
view: community_program_members {
  sql_table_name: mattermost.community_program_members ;;
  view_label: "Community Program Members"

  # FILTERS

  # DIMENSIONS
  dimension: id {
    description: "" 
    type: string
    sql: ${TABLE}.id ;;
    hidden: no
  }

  dimension: full_name {
    description: "" 
    type: string
    sql: ${TABLE}.full_name ;;
    hidden: no
  }

  dimension: program_type {
    description: "" 
    type: string
    sql: ${TABLE}.program_type ;;
    hidden: no
  }

  
  # DIMENSION GROUPS/DATES
  dimension_group: start {
    description: "" 
    type: time
    timeframes: [date, month, year]
    sql: ${TABLE}.start_date ;;
    hidden: no
  }

  dimension_group: end {
    description: "" 
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


}