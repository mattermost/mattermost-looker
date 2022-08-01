# The name of this view in Looker is "Invoicingweekly"
view: invoicingweekly {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "FINANCE_OPS"."INVOICINGWEEKLY"
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called " Sdc Row" in Explore.



  dimension: AMOUNT {
    type: number
    value_format: "$#,##0"
    sql: ${TABLE}."AMOUNT"::number ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: TOTAL_AMT {
    type: sum
    value_format: "$#,##0"
    sql: ${AMOUNT}::number ;;
  }

  dimension: FS_CATEGORY {
    type: string
    sql: ${TABLE}."FS_CATEGORY" ;;
  }

  dimension: WEEK_ENDED {
    type: date
    sql: ${TABLE}."FS_WEEK_ENDED"::date ;;
  }

  dimension: WEEK_NO {
    type: number
    sql: week(${WEEK_ENDED}) ;;
  }

  dimension: MONTH {
    type: date
    sql: ${TABLE}."FY_MONTH"::date ;;
  }

  dimension: FY_YEAR {
    type: number
    value_format: "0"
    sql: date_part(year,${TABLE}."FY_YEAR"::date) ;;
  }

}
