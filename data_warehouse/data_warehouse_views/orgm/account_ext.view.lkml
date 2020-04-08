view: account_ext {
  sql_table_name: "ORGM"."ACCOUNT_EXT"
    ;;

  dimension: account_sfid {
    type: string
    sql: ${TABLE}."ACCOUNT_SFID" ;;
    hidden: yes
  }

  dimension: count_lost_oppt {
    group_label: "Opportunities"
    group_item_label: "Count Lost"
    label: "Count Lost Oppt"
    type: number
    sql: ${TABLE}."COUNT_LOST_OPPT" ;;
  }

  dimension: count_open_oppt {
    group_label: "Opportunities"
    group_item_label: "Count Open"
    label: "Count Open Oppt"
    type: number
    sql: ${TABLE}."COUNT_OPEN_OPPT" ;;
  }

  dimension: count_won_oppt {
    group_label: "Opportunities"
    group_item_label: "Count Won"
    label: "Count Won Oppt"
    type: number
    sql: ${TABLE}."COUNT_WON_OPPT" ;;
  }

  dimension: sum_expansion_amount_won {
    group_label: "Amounts"
    group_item_label: "Expansion Won"
    type: number
    sql: ${TABLE}."SUM_EXPANSION_AMOUNT" ;;
  }

  dimension: sum_multi_amount_won {
    group_label: "Amounts"
    group_item_label: "Multi Won"
    type: number
    sql: ${TABLE}."SUM_MULTI_AMOUNT" ;;
  }

  dimension: sum_new_amount_won {
    group_label: "Amounts"
    group_item_label: "New Won"
    type: number
    sql: ${TABLE}."SUM_NEW_AMOUNT" ;;
  }

  dimension: sum_renewal_amount_won {
    group_label: "Amounts"
    group_item_label: "Renewal Won"
    type: number
    sql: ${TABLE}."SUM_RENEWAL_AMOUNT" ;;
  }

  dimension: sum_expansion_amount_open {
    group_label: "Amounts"
    group_item_label: "Expansion Open"
    type: number
    sql: ${TABLE}."SUM_EXPANSION_AMOUNT" ;;
  }

  dimension: sum_multi_amount_open {
    group_label: "Amounts"
    group_item_label: "Multi Open"
    type: number
    sql: ${TABLE}."SUM_MULTI_AMOUNT" ;;
  }

  dimension: sum_new_amount_open {
    group_label: "Amounts"
    group_item_label: "New Open"
    type: number
    sql: ${TABLE}."SUM_NEW_AMOUNT" ;;
  }

  dimension: sum_renewal_amount_open {
    group_label: "Amounts"
    group_item_label: "Renewal Open"
    type: number
    sql: ${TABLE}."SUM_RENEWAL_AMOUNT" ;;
  }

  dimension: sum_expansion_amount_lost {
    group_label: "Amounts"
    group_item_label: "Expansion Lost"
    type: number
    sql: ${TABLE}."SUM_EXPANSION_AMOUNT" ;;
  }

  dimension: sum_multi_amount_lost {
    group_label: "Amounts"
    group_item_label: "Multi Lost"
    type: number
    sql: ${TABLE}."SUM_MULTI_AMOUNT" ;;
  }

  dimension: sum_new_amount_lost {
    group_label: "Amounts"
    group_item_label: "New Lost"
    type: number
    sql: ${TABLE}."SUM_NEW_AMOUNT" ;;
  }

  dimension: sum_renewal_amount_lost {
    group_label: "Amounts"
    group_item_label: "Renewal Lost"
    type: number
    sql: ${TABLE}."SUM_RENEWAL_AMOUNT" ;;
  }
}
