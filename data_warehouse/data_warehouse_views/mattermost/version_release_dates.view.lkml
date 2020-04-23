# This is the view file for the analytics.mattermost.version_release_dates table.
view: version_release_dates {
  sql_table_name: mattermost.version_release_dates ;;
  view_label: "Version Release Dates"

  # FILTERS

  # DIMENSIONS
  dimension: version {
    description: "" 
    type: string
    sql: ${TABLE}.version ;;
    hidden: no
  }

  
  # DIMENSION GROUPS/DATES
  dimension_group: release {
    description: "" 
    type: time
    timeframes: [date, month, year]
    sql: ${TABLE}.release_date ;;
    hidden: no
  }

  
  # MEASURES
  measure: count {
    description: "Count of rows/occurrences."
    type: count
  }


}