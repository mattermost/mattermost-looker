view: historical_rep_attainment {
  sql_table_name: "SALES"."HISTORICAL_REP_ATTAINMENT"
    ;;

  dimension: bookings {
    description: "New + Expansion + Co-Term + LOE"
    type: number
    sql: ${TABLE}."BOOKINGS" ;;
    value_format_name: usd_0
  }

  dimension: employee_num {
    type: number
    sql: ${TABLE}."EMPLOYEE_NUM" ;;
  }

  dimension: fiscal_quarter {
    type: string
    sql: ${TABLE}."FISCAL_QUARTER" ;;
  }

  dimension: fiscal_year {
    type: string
    sql: ${TABLE}."FISCAL_YEAR" ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}."NAME" ;;
  }

  dimension: quota {
    type: number
    sql: ${TABLE}."QUOTA" ;;
    value_format_name: usd_0
  }

  dimension: region {
    type: string
    sql: ${TABLE}."REGION" ;;
  }

  dimension: segment {
    type: string
    sql: ${TABLE}."SEGMENT" ;;
  }

  measure: attainment_perc {
    label: "Attainment Percent"
    type: sum
    sql: ${bookings}/${quota};;
    value_format_name: percent_1
  }
}
