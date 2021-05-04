view: opportunitylineitem_daily_arr {
  sql_table_name: "FINANCE"."OPPORTUNITYLINEITEM_DAILY_ARR";;

  drill_fields: [opportunitylineitem.name, day_date, total_won_arr, total_won_new_arr, total_won_renewal_arr, total_won_expansion_arr, total_won_coterm_expansion_arr, total_won_leftover_expansion_arr, total_won_multi_arr, total_won_renewal_multi_arr]

  dimension: compound_primary {
    sql: ${TABLE}."DAY" || ${TABLE}."OPPORTUNITYLINEITEM_SFID" ;;
    primary_key: yes
    hidden: yes
  }

  dimension_group: day {
    type: time
    timeframes: [
      date,
      week,
      month,
      fiscal_quarter,
      fiscal_year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."DAY" ;;
  }

  dimension: opportunity_sfid {
    hidden: yes
    type: string
    sql: ${TABLE}."OPPORTUNITY_SFID" ;;
  }

  dimension: opportunitylineitem_sfid {
    hidden: yes
    type: string
    sql: ${TABLE}."OPPORTUNITYLINEITEM_SFID" ;;
  }

  dimension: lost_arr {
    hidden: yes
    type: number
    sql: ${TABLE}."LOST_ARR" ;;
  }

  dimension: lost_coterm_expansion_arr {
    hidden: yes
    type: number
    sql: ${TABLE}."LOST_COTERM_EXPANSION_ARR" ;;
  }

  dimension: lost_expansion_arr {
    hidden: yes
    type: number
    sql: ${TABLE}."LOST_EXPANSION_ARR" ;;
  }

  dimension: lost_leftover_expansion_arr {
    hidden: yes
    type: number
    sql: ${TABLE}."LOST_LEFTOVER_EXPANSION_ARR" ;;
  }

  dimension: lost_multi_arr {
    hidden: yes
    type: number
    sql: ${TABLE}."LOST_MULTI_ARR" ;;
  }

  dimension: lost_new_arr {
    hidden: yes
    type: number
    sql: ${TABLE}."LOST_NEW_ARR" ;;
  }

  dimension: lost_renewal_arr {
    hidden: yes
    type: number
    sql: ${TABLE}."LOST_RENEWAL_ARR" ;;
  }

  dimension: lost_renewal_multi_arr {
    hidden: yes
    type: number
    sql: ${TABLE}."LOST_RENEWAL_MULTI_ARR" ;;
  }

  dimension: open_arr {
    hidden: yes
    type: number
    sql: ${TABLE}."OPEN_ARR" ;;
  }

  dimension: open_coterm_expansion_arr {
    hidden: yes
    type: number
    sql: ${TABLE}."OPEN_COTERM_EXPANSION_ARR" ;;
  }

  dimension: open_expansion_arr {
    hidden: yes
    type: number
    sql: ${TABLE}."OPEN_EXPANSION_ARR" ;;
  }

  dimension: open_leftover_expansion_arr {
    hidden: yes
    type: number
    sql: ${TABLE}."OPEN_LEFTOVER_EXPANSION_ARR" ;;
  }

  dimension: open_multi_arr {
    hidden: yes
    type: number
    sql: ${TABLE}."OPEN_MULTI_ARR" ;;
  }

  dimension: open_new_arr {
    hidden: yes
    type: number
    sql: ${TABLE}."OPEN_NEW_ARR" ;;
  }

  dimension: open_renewal_arr {
    hidden: yes
    type: number
    sql: ${TABLE}."OPEN_RENEWAL_ARR" ;;
  }

  dimension: open_renewal_multi_arr {
    hidden: yes
    type: number
    sql: ${TABLE}."OPEN_RENEWAL_MULTI_ARR" ;;
  }

  dimension: won_arr {
    hidden: yes
    type: number
    sql: ${TABLE}."WON_ARR" ;;
  }

  dimension: won_coterm_expansion_arr {
    hidden: yes
    type: number
    sql: ${TABLE}."WON_COTERM_EXPANSION_ARR" ;;
  }

  dimension: won_expansion_arr {
    hidden: yes
    type: number
    sql: ${TABLE}."WON_EXPANSION_ARR" ;;
  }

  dimension: won_leftover_expansion_arr {
    hidden: yes
    type: number
    sql: ${TABLE}."WON_LEFTOVER_EXPANSION_ARR" ;;
  }

  dimension: won_multi_arr {
    hidden: yes
    type: number
    sql: ${TABLE}."WON_MULTI_ARR" ;;
  }

  dimension: won_new_arr {
    hidden: yes
    type: number
    sql: ${TABLE}."WON_NEW_ARR" ;;
  }

  dimension: won_renewal_arr {
    hidden: yes
    type: number
    sql: ${TABLE}."WON_RENEWAL_ARR" ;;
  }

  dimension: won_renewal_multi_arr {
    hidden: yes
    type: number
    sql: ${TABLE}."WON_RENEWAL_MULTI_ARR" ;;
  }

  measure: total_won_arr {
    type: sum_distinct
    sql: ${won_arr} ;;
    label: "Won ARR"
    group_label: "Total"
    group_item_label: "Won ARR"
  }

  measure: total_lost_arr {
    type: sum_distinct
    sql: ${lost_arr} ;;
    label: "Lost ARR"
    group_label: "Total"
    group_item_label: "Lost ARR"
  }

  measure: total_open_arr {
    type: sum_distinct
    sql: ${open_arr} ;;
    label: "Open ARR"
    group_label: "Total"
    group_item_label: "Open ARR"
  }

  measure: total_won_new_arr {
    type: sum_distinct
    sql: ${won_new_arr} ;;
    label: "Won New ARR"
    group_label: "New"
    group_item_label: "Won ARR"
  }

  measure: total_won_expansion_arr {
    type: sum_distinct
    sql: ${won_expansion_arr} ;;
    label: "Won Expansion ARR"
    group_label: "Expansion"
    group_item_label: "Won ARR"
  }

  measure: total_won_coterm_expansion_arr {
    type: sum_distinct
    sql: ${won_coterm_expansion_arr} ;;
    label: "Won CoTerm Expansion ARR"
    group_label: "CoTerm"
    group_item_label: "Won ARR"
  }

  measure: total_won_leftover_expansion_arr {
    type: sum_distinct
    sql: ${won_leftover_expansion_arr} ;;
    label: "Won LOE ARR"
    group_label: "LOE"
    group_item_label: "Won ARR"
  }

  measure: total_won_renewal_arr {
    type: sum_distinct
    sql: ${won_renewal_arr} ;;
    label: "Won Renewal ARR"
    group_label: "Renewal"
    group_item_label: "Won ARR"
  }

  measure: total_won_multi_arr {
    type: sum_distinct
    sql: ${won_multi_arr} ;;
    label: "Won Multi ARR"
    group_label: "Multi"
    group_item_label: "Won ARR"
  }

  measure: total_won_renewal_multi_arr {
    type: sum_distinct
    sql: ${won_renewal_multi_arr} ;;
    label: "Won Renewal Multi ARR"
    group_label: "Renewal Multi"
    group_item_label: "Won ARR"
  }

  measure: total_lost_new_arr {
    type: sum_distinct
    sql: ${lost_new_arr} ;;
    label: "Lost New ARR"
    group_label: "New"
    group_item_label: "Lost ARR"
  }

  measure: total_lost_expansion_arr {
    type: sum_distinct
    sql: ${lost_expansion_arr} ;;
    label: "Lost Expansion ARR"
    group_label: "Expansion"
    group_item_label: "Lost ARR"
  }

  measure: total_lost_coterm_expansion_arr {
    type: sum_distinct
    sql: ${lost_coterm_expansion_arr} ;;
    label: "Lost CoTerm ARR"
    group_label: "CoTerm"
    group_item_label: "Lost ARR"
  }

  measure: total_lost_leftover_expansion_arr {
    type: sum_distinct
    sql: ${lost_leftover_expansion_arr} ;;
    label: "Lost LOE ARR"
    group_label: "LOE"
    group_item_label: "Lost ARR"
  }

  measure: total_lost_renewal_arr {
    type: sum_distinct
    sql: ${lost_renewal_arr} ;;
    label: "Lost Renewal ARR"
    group_label: "Renewal"
    group_item_label: "Lost ARR"
  }

  measure: total_lost_multi_arr {
    type: sum_distinct
    sql: ${lost_multi_arr} ;;
    label: "Lost Multi ARR"
    group_label: "Multi"
    group_item_label: "Lost ARR"
  }

  measure: total_lost_renewal_multi_arr {
    type: sum_distinct
    sql: ${lost_renewal_multi_arr} ;;
    label: "Lost Renewal Multi ARR"
    group_label: "Renewal Multi"
    group_item_label: "Lost ARR"
  }

  measure: total_open_new_arr {
    type: sum_distinct
    sql: ${open_new_arr} ;;
    label: "Open New ARR"
    group_label: "New"
    group_item_label: "Open ARR"
  }

  measure: total_open_expansion_arr {
    type: sum_distinct
    sql: ${open_expansion_arr} ;;
    label: "Open Expansion ARR"
    group_label: "Expansion"
    group_item_label: "Open ARR"
  }

  measure: total_open_coterm_expansion_arr {
    type: sum_distinct
    sql: ${open_coterm_expansion_arr} ;;
    label: "Open CoTerm ARR"
    group_label: "CoTerm"
    group_item_label: "Open ARR"
  }

  measure: total_open_leftover_expansion_arr {
    type: sum_distinct
    sql: ${open_leftover_expansion_arr} ;;
    label: "Open LOE ARR"
    group_label: "LOE"
    group_item_label: "Open ARR"
  }

  measure: total_open_renewal_arr {
    type: sum_distinct
    sql: ${open_renewal_arr} ;;
    label: "Open Renewal ARR"
    group_label: "Renewal"
    group_item_label: "Open ARR"
  }

  measure: total_open_multi_arr {
    type: sum_distinct
    sql: ${open_multi_arr} ;;
    label: "Open Multi ARR"
    group_label: "Multi"
    group_item_label: "Open ARR"
  }

  measure: total_open_renewal_multi_arr {
    type: sum_distinct
    sql: ${open_renewal_multi_arr} ;;
    label: "Open Renewal Multi ARR"
    group_label: "Renewal Multi"
    group_item_label: "Open ARR"
  }
}
