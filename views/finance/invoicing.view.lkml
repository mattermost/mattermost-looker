# The name of this view in Looker is "Invoicing"
view: invoicing {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "FINANCE_OPS"."INVOICING"
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called " Sdc Row" in Explore.


  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.



  dimension: amount {
    type: number
    sql: ${TABLE}."AMOUNT" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_amount {
    type: sum
    sql: ${amount} ;;
  }

  dimension: fs_category {
    type: string
    sql: ${TABLE}."FS_CATEGORY" ;;
  }

  dimension: fy_month {
    label: "Reporting Month"
    type: date
    sql: ${TABLE}."FY_MONTH"::date ;;
  }

  dimension: fy_year {
    label: "Fiscal Year"
    type: date
    sql: ${TABLE}."FY_YEAR"::date ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
