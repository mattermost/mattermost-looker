# This is the view file for the analytics.mattermost.version_release_dates table.
view: version_release_dates {
  sql_table_name: mattermost.version_release_dates ;;
  view_label: "Version Release Dates"

  # FILTERS

  # DIMENSIONS
  dimension: version {
    description: "The server version associated with the release date."
    type: string
    sql: ${TABLE}.version ;;
    hidden: no
  }

  dimension: supported {
    description: "Boolean indicating the server version is currently supported."
    type: yesno
    sql: ${TABLE}.supported ;;
    hidden: no
  }


  # DIMENSION GROUPS/DATES
  dimension_group: release {
    label: "Server Version Release"
    description: "The date the server version was released."
    type: time
    timeframes: [date, month, year, week]
    sql: ${TABLE}.release_date ;;
    hidden: no
  }


  # MEASURES
  measure: count {
    description: "Count of rows/occurrences."
    type: count
  }


}
