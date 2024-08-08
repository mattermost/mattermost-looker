view: dim_date {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "MART_COMMON".dim_date ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: date_day {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.date_day ;;
    hidden: yes
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Day Name" in Explore.

  dimension: day_name {
    type: string
    sql: ${TABLE}.day_name ;;
    description: "The 3-letter name of the day. Any of `'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'."
  }

  dimension_group: last_day_of_month {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.last_day_of_month ;;
    description: "Date of the last date of the month"
  }

  dimension: week_actual {
    type: number
    sql: ${TABLE}.week_actual ;;
    label: "Week"
    description: "The number of the week the date belongs to. Integer in range 1-54."
  }

  dimension: month_actual {
    type: number
    sql: ${TABLE}.month_actual ;;
    label: "Month"
    description: "The month part of the date."
  }

  dimension: quarter_actual {
    type: number
    sql: ${TABLE}.quarter_actual ;;
    label: "Quarter"
    description: "The quarter of the year the date belongs to."
  }

  dimension: year_actual {
    type: number
    sql: ${TABLE}.year_actual ;;
    label: "Year"
    description: "The year part of the date."
  }


  ###
  ### Flags
  ###

  dimension: is_last_day_of_week {
    type: yesno
    sql: ${TABLE}.is_last_day_of_week ;;
    label: "Is Last day of the week?"
    description: "Whether the date is the last day of the week. Uses ISO-like semantics (Monday is the first day of week)."
  }

  dimension: is_last_day_of_month {
    type: yesno
    sql: ${TABLE}.is_last_day_of_month ;;
    label: "Is Last day of the month?"
    description: "Whether this is the last day of the month."
  }

  dimension: is_last_mon_of_month {
    type: yesno
    sql: ${TABLE}.is_last_mon_of_month ;;
    label: "Is Last Monday of the month?"
    description: "Whether this is the last Monday of the month the date belongs to. Note that for current month, the last Monday up to (and including) today is considered."
  }


  dimension: is_last_tue_of_month {
    type: yesno
    sql: ${TABLE}.is_last_tue_of_month ;;
    label: "Is Last Tuesday of the month?"
    description: "Whether this is the last Tuesday of the month the date belongs to. Note that for current month, the last Tuesday up to (and including) today is considered."
  }

  dimension: is_last_wed_of_month {
    type: yesno
    sql: ${TABLE}.is_last_wed_of_month ;;
    label: "Is Last Wednesday of the month?"
    description: "Whether this is the last Wednesday of the month the date belongs to. Note that for current month, the last Wednesday up to (and including) today is considered."
  }

  dimension: is_last_thu_of_month {
    type: yesno
    sql: ${TABLE}.is_last_thu_of_month ;;
    label: "Is Last Thursday of the month?"
    description: "Whether this is the last Thursday of the month the date belongs to. Note that for current month, the last Thursday up to (and including) today is considered."
  }

  dimension: is_last_fri_of_month {
    type: yesno
    sql: ${TABLE}.is_last_fri_of_month ;;
    label: "Is Last Friday of the month?"
    description: "Whether this is the last Friday of the month the date belongs to. Note that for current month, the last Friday up to (and including) today is considered."
  }

  dimension: is_last_sat_of_month {
    type: yesno
    sql: ${TABLE}.is_last_sat_of_month ;;
    label: "Is Last Saturday of the month?"
    description: "Whether this is the last Saturday of the month the date belongs to. Note that for current month, the last Saturday up to (and including) today is considered."
  }

  dimension: is_last_sun_of_month {
    type: yesno
    sql: ${TABLE}.is_last_sun_of_month ;;
    label: "Is Last Sunday of the month?"
    description: "Whether this is the last Sunday of the month the date belongs to. Note that for current month, the last Sunday up to (and including) today is considered."
  }

}
