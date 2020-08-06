# This is the view file for the analytics.mattermost.p2p_forum_activity table.
view: p2p_forum_activity {
  sql_table_name: mattermost.p2p_forum_activity ;;
  view_label: "P2P Forum Activity"

  # FILTERS

  # DIMENSIONS
  dimension: id {
    description: "" 
    type: string
    sql: ${TABLE}.id ;;
    hidden: no
  }

  dimension: forum_site {
    description: "" 
    type: string
    sql: ${TABLE}.forum_site ;;
    hidden: no
  }

  dimension: registrations {
    description: "" 
    type: number
    sql: ${TABLE}.registrations ;;
    hidden: no
  }

  dimension: posts {
    description: "" 
    type: number
    sql: ${TABLE}.posts ;;
    hidden: no
  }

  dimension: users {
    description: "" 
    type: number
    sql: ${TABLE}.users ;;
    hidden: no
  }

  
  # DIMENSION GROUPS/DATES
  dimension_group: logging {
    description: "" 
    type: time
    timeframes: [date, month, year]
    sql: ${TABLE}.date ;;
    hidden: no
  }

  
  # MEASURES
  measure: count {
    description: "Count of rows/occurrences."
    type: count
  }

  measure: users_sum {
    description: "The sum of Users per grouping."
    type: sum
    sql: ${users} ;;
  }


}