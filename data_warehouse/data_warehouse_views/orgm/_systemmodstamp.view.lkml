view: _systemmodstamp {
  extension: required

  dimension_group: systemmodstamp {
    group_label: "System"
    label: "System Mod Stamp"
    sql: ${TABLE}.systemmodstamp ;;
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    type: time
  }
}
