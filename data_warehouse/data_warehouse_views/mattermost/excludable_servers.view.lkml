# This is the view file for the analytics.mattermost.excludable_servers table.
view: excludable_servers {
  sql_table_name: mattermost.excludable_servers ;;
  view_label: "Excludable Servers"

  # FILTERS

  # DIMENSIONS
  dimension: reason {
    label: "Excludability Reason"
    group_label: "Excludability Filters"
    description: "The excludability reason for manually identified testing (or other excludable) servers."
    type: string
    sql: ${TABLE}.reason ;;
    hidden: no
  }

  dimension: server_id {
    description: ""
    type: string
    sql: ${TABLE}.server_id ;;
    hidden: no
  }


  # DIMENSION GROUPS/DATES

  # MEASURES
  measure: count {
    description: "Count of rows/occurrences."
    type: count
  }

  measure: server_count {
    label: " Server Count"
    description: "The distinct count of Servers per grouping."
    type: count_distinct
    sql: ${server_id} ;;
  }


}
