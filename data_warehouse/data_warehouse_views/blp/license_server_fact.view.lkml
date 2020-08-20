# This is the view file for the analytics.blp.license_server_fact table.
view: license_server_fact {
  sql_table_name: blp.license_server_fact ;;
  view_label: "License Server Fact"

  # SETS
  set: licensed_server_drill {
    fields: [server_id, license_id, company, edition, users, trial, issued_date, start_date, expire_date, license_activation_date, last_active_date]
  }

  # DIMENSIONS
  dimension: id {
    description: ""
    type: string
    sql: ${TABLE}.id ;;
    hidden: no
  }

  dimension: server_id {
    description: ""
    type: string
    sql: ${TABLE}.server_id ;;
    hidden: no
  }

  dimension: license_id {
    description: ""
    type: string
    sql: ${TABLE}.license_id ;;
    hidden: no
  }

  dimension: company {
    description: ""
    type: string
    sql: ${TABLE}.company ;;
    hidden: no
  }

  dimension: edition {
    label: "License Edition"
    description: ""
    type: string
    sql: ${TABLE}.edition ;;
    hidden: no
  }

  dimension: users {
    label: "Licensed Users"
    description: ""
    type: number
    sql: ${TABLE}.users ;;
    hidden: no
  }

  dimension: trial {
    description: ""
    type: yesno
    sql: ${TABLE}.trial ;;
    hidden: no
  }

  dimension: license_email {
    description: ""
    type: string
    sql: ${TABLE}.license_email ;;
    hidden: no
  }

  dimension: contact_sfid {
    description: ""
    type: string
    sql: ${TABLE}.contact_sfid ;;
    hidden: no
  }

  dimension: latest_license {
    description: "Boolean indicating the license is the last license activated and associated with a server."
    type: yesno
    sql: CASE WHEN ${TABLE}.license_priority_rank = 1 THEN TRUE ELSE FALSE END ;;
    hidden: no
  }


  # DIMENSION GROUPS/DATES
  dimension_group: issued {
    label: "License Issued"
    description: ""
    type: time
    timeframes: [date, month, year]
    sql: ${TABLE}.issued_date ;;
    hidden: no
  }

  dimension_group: start {
    label: "License Start"
    description: ""
    type: time
    timeframes: [date, month, year]
    sql: ${TABLE}.start_date ;;
    hidden: no
  }

  dimension_group: expire {
    label: "License Expire"
    description: ""
    type: time
    timeframes: [date, month, year]
    sql: ${TABLE}.expire_date ;;
    hidden: no
  }

  dimension_group: license_activation {
    description: ""
    type: time
    timeframes: [date, week, month, year, fiscal_year, fiscal_quarter]
    sql: ${TABLE}.license_activation_date ;;
    hidden: no
  }

  dimension_group: last_active {
  description: ""
  type: time
  timeframes: [date, week, month, year, fiscal_year, fiscal_quarter]
    sql: ${TABLE}.last_active_date ;;
    hidden: no
  }


  # MEASURES
  measure: count {
    description: "Count of rows/occurrences."
    type: count
    drill_fields: [licensed_server_drill*]
  }

  measure: server_count {
    label: " Server Count"
    description: "The distinct count of Servers per grouping."
    type: count_distinct
    sql: ${server_id} ;;
    drill_fields: [licensed_server_drill*]
  }

  measure: license_count {
    label: " License Count"
    description: "The distinct count of Licenses per grouping."
    type: count_distinct
    sql: ${license_id} ;;
    drill_fields: [licensed_server_drill*]
  }

  measure: users_sum {
    description: "The sum of Users per grouping."
    type: sum
    sql: ${users} ;;
    drill_fields: [licensed_server_drill*]
  }


}
