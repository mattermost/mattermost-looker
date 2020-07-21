# This is the view file for the analytics.social_mentions.twitter table.
view: twitter {
  sql_table_name: social_mentions.twitter ;;
  view_label: "Twitter"

  # FILTERS

  # DIMENSIONS
  dimension: username {
    description: ""
    type: string
    sql: ${TABLE}.username ;;
    hidden: no
  }

  dimension: text {
    description: ""
    type: string
    sql: ${TABLE}.text ;;
    hidden: no
  }

  dimension: full_name {
    description: ""
    type: string
    sql: ${TABLE}.full_name ;;
    hidden: no
  }

  dimension: user_url {
    description: ""
    type: string
    sql: ${TABLE}.user_url ;;
    hidden: no
  }

  dimension: url {
    description: ""
    type: string
    sql: ${TABLE}.url ;;
    hidden: no
  }

  dimension: id {
    type: string
    sql: split_part(${url}, '/status/', 2) ;;
  }

  dimension: retweet_text {
    description: ""
    type: string
    sql: ${TABLE}.retweet_text ;;
    hidden: no
  }

  dimension: retweeted_status {
    description: ""
    type: yesno
    sql: ${TABLE}.retweeted_status ;;
    hidden: no
  }

  dimension: retweet_count {
    description: ""
    type: number
    sql: ${TABLE}.retweet_count ;;
    hidden: no
  }

  dimension: location {
    description: ""
    type: string
    sql: ${TABLE}.location ;;
    hidden: no
  }

  dimension: followers {
    description: ""
    type: number
    sql: ${TABLE}.followers ;;
    hidden: no
  }

  dimension: user_id {
    description: ""
    type: string
    sql: ${TABLE}.user_id ;;
    hidden: no
  }

  dimension: favorite_count {
    description: ""
    type: number
    sql: ${TABLE}.favorite_count ;;
    hidden: no
  }

  dimension: lang {
    description: ""
    type: string
    sql: ${TABLE}.lang ;;
    hidden: no
  }

  dimension: verified {
    description: ""
    type: yesno
    sql: ${TABLE}.verified ;;
    hidden: no
  }

  dimension: hashtags {
    description: ""
    type: string
    sql: ${TABLE}.hashtags ;;
    hidden: no
  }

  dimension: following_count {
    description: ""
    type: number
    sql: ${TABLE}.following_count ;;
    hidden: no
  }

  dimension: is_tweet_reply {
    description: ""
    type: yesno
    sql: ${TABLE}.is_tweet_reply ;;
    hidden: no
  }


  # DIMENSION GROUPS/DATES
  dimension_group: original_tweet_date {
  description: ""
  type: time
  timeframes: [date, month, year]
    sql: ${TABLE}.original_tweet_date ;;
    hidden: no
  }

  dimension_group: created_at {
  description: ""
  type: time
  timeframes: [date, month, year]
    sql: ${TABLE}.created_at ;;
    hidden: no
  }


  # MEASURES
  measure: count {
    description: "Count of rows/occurrences."
    type: count
  }

  measure: tweet_count {
    description: "The count of distinct tweets containing Mattermost keyword."
    type: count_distinct
    sql: ${id} ;;
  }

  measure: retweet_count_sum {
    description: "The sum of Retweet Count per grouping."
    type: sum
    sql: ${retweet_count} ;;
  }

  measure: user_count {
    label: " User Count"
    description: "The distinct count of Users per grouping."
    type: count_distinct
    sql: ${user_id} ;;
  }

  measure: favorite_count_sum {
    description: "The sum of Favorite Count per grouping."
    type: sum
    sql: ${favorite_count} ;;
  }

  measure: following_count_sum {
    description: "The sum of Following Count per grouping."
    type: sum
    sql: ${following_count} ;;
  }


}
