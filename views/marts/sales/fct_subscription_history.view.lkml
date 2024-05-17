# The name of this view in Looker is "Fct Subscription History"
view: fct_subscription_history {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "MART_SALES"."FCT_SUBSCRIPTION_HISTORY" ;;
  label: "Subscription History"

  dimension: subscription_history_event_id {
    type: string
    sql: ${TABLE}."SUBSCRIPTION_HISTORY_EVENT_ID" ;;
    primary_key: yes
  }


  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."CREATED_AT" ;;
    label: "Creation"
    description: "Whenvere the history event was created"
  }


  dimension: subscription_id {
    type: string
    sql: ${TABLE}."SUBSCRIPTION_ID" ;;
  }

  dimension: licensed_seats {
    type: number
    sql: coalecse(${TABLE}."LICENSED_SEATS", 0) ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_licensed_seats {
    type: sum
    sql: ${licensed_seats} ;;
  }

  measure: max_licensed_seats {
    type: max
    sql:  ${licensed_seats} ;;
  }

  measure: average_licensed_seats {
    type: average
    sql: ${licensed_seats} ;;  }



  measure: count {
    type: count
  }
}
