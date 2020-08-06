# This is the view file for the analytics.mattermost.p2p_forum_activity table.
view: p2p_forum_activity {
  sql_table_name: mattermost.p2p_forum_activity ;;
  view_label: "P2P Forum Activity"

  # FILTERS

  # DIMENSIONS
  dimension: id {
    description: "Distinct record ID representing a specific day and forum site."
    type: string
    sql: ${TABLE}.id ;;
    hidden: no
  }

  dimension: forum_site {
    description: "The name of the specific Mattermost Peer-to-Peer Forum."
    type: string
    sql: ${TABLE}.forum_site ;;
    hidden: no
  }

  dimension: registrations {
    description: "Registrations made to the Mattermost Peer-to-Peer Forum."
    type: number
    sql: ${TABLE}.registrations ;;
    hidden: no
  }

  dimension: posts {
    description: "Posts created on the Mattermost Peer-to-Peer Forum."
    type: number
    sql: ${TABLE}.posts ;;
    hidden: no
  }

  dimension: users {
    description: "Users creating posts on the Mattermost Peer-to-Peer Forum."
    type: number
    sql: ${TABLE}.users ;;
    hidden: no
  }


  # DIMENSION GROUPS/DATES
  dimension_group: logging {
    description: "The date the forum activity was logged"
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

  measure: posts_sum {
    description: "The sum of posts per grouping."
    type: sum
    sql: ${posts} ;;
  }

  measure: users_sum {
    description: "The sum of users participating in forum activity per grouping (not distinct - only represents distinct when grouped at the daily level)."
    type: sum
    sql: ${users} ;;
  }


}
