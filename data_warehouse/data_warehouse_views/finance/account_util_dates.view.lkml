view: account_util_dates {
  sql_table_name: FINANCE.ACCOUNT_UTIL_DATES ;;

  dimension: compound_primary {
    type: string
    sql: ${account_sfid}||${day_date} ;;
    primary_key: yes
    hidden: yes
  }

  dimension: account_sfid {
    type: string
    sql: ${TABLE}."ACCOUNT_SFID" ;;
  }

  dimension_group: day {
    type: time
    timeframes: [
      date,
      month,
      fiscal_quarter,
      year,
      fiscal_year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."DAY" ;;
  }

  dimension: master_account_sfid {
    type: string
    sql: ${TABLE}."MASTER_ACCOUNT_SFID" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
