# This is the view file for the analytics.incident_collaboration.focalboard_fact table.
view: focalboard_fact {
  sql_table_name: incident_collaboration.focalboard_fact ;;
  view_label: "Focalboard Fact"

  # FILTERS

  # DIMENSIONS
  
  # DIMENSION GROUPS/DATES
  
  # MEASURES
  measure: count {
    description: "Count of rows/occurrences."
    type: count
  }


}