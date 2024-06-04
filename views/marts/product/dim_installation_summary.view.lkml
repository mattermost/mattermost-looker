# The name of this view in Looker is "Dim Installation Summary"
view: dim_installation_summary {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "MART_PRODUCT"."DIM_INSTALLATION_SUMMARY" ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Count Server Ids" in Explore.

  dimension: count_server_ids {
    type: number
    value_format_name: id
    sql: ${TABLE}."COUNT_SERVER_IDS" ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: first_activity {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."FIRST_ACTIVITY_DATE" ;;
  }

  dimension: first_binary_edition {
    type: string
    sql: ${TABLE}."FIRST_BINARY_EDITION" ;;
  }

  dimension: first_count_registered_active_users {
    type: number
    sql: ${TABLE}."FIRST_COUNT_REGISTERED_ACTIVE_USERS" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_first_count_registered_active_users {
    type: sum
    sql: ${first_count_registered_active_users} ;;  }
  measure: average_first_count_registered_active_users {
    type: average
    sql: ${first_count_registered_active_users} ;;  }

  dimension: installation_id {
    type: string
    sql: ${TABLE}."INSTALLATION_ID" ;;
    primary_key: yes
  }

  dimension_group: last_activity {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."LAST_ACTIVITY_DATE" ;;
  }

  dimension: last_binary_edition {
    type: string
    sql: ${TABLE}."LAST_BINARY_EDITION" ;;
  }

  dimension: last_count_registered_active_users {
    type: number
    sql: ${TABLE}."LAST_COUNT_REGISTERED_ACTIVE_USERS" ;;
  }

  dimension: last_daily_active_users {
    type: number
    sql: ${TABLE}."LAST_DAILY_ACTIVE_USERS" ;;
  }

  dimension: last_monthly_active_users {
    type: number
    sql: ${TABLE}."LAST_MONTHLY_ACTIVE_USERS" ;;
  }

  dimension: last_server_id {
    type: string
    sql: ${TABLE}."LAST_SERVER_ID" ;;
  }
  measure: count {
    type: count
  }
}
