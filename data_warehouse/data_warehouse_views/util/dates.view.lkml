view: dates {
  sql_table_name: UTIL.DATES ;;

  dimension_group: date {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."DATE" ;;
  }

  dimension: day_num {
    type: number
    sql: ${TABLE}."DAY_NUM" ;;
  }

  dimension: fiscal_month {
    type: string
    sql: ${TABLE}."FISCAL_MONTH" ;;
  }

  dimension: fiscal_quarter {
    type: string
    sql: ${TABLE}."FISCAL_QUARTER" ;;
  }

  dimension: fiscal_year {
    type: number
    sql: ${TABLE}."FISCAL_YEAR" ;;
  }

  dimension_group: month {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."MONTH_DATE" ;;
  }

  dimension: month_name_short_string {
    type: string
    sql: ${TABLE}."MONTH_NAME_SHORT_STRING" ;;
  }

  dimension: month_name_string {
    type: string
    sql: ${TABLE}."MONTH_NAME_STRING" ;;
  }

  dimension: month_num {
    type: number
    sql: ${TABLE}."MONTH_NUM" ;;
  }

  dimension: month_num_string {
    type: string
    sql: ${TABLE}."MONTH_NUM_STRING" ;;
  }

  dimension_group: year {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."YEAR_DATE" ;;
  }

  dimension: year_num {
    type: number
    sql: ${TABLE}."YEAR_NUM" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
