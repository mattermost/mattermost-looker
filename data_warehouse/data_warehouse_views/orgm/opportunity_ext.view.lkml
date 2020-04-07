view: opportunity_ext {
  sql_table_name: "ORGM"."OPPORTUNITY_EXT";;

  dimension: opportunityid {
    hidden: yes
    type: string
    sql: ${TABLE}."OPPORTUNITYID" ;;
  }

  dimension: expansion_amount {
    group_label: "Product Line Type Totals"
    value_format_name: usd_0
    type: number
    sql: ${TABLE}."SUM_EXPANSION_AMOUNT" ;;
  }

  dimension: multi_amount {
    group_label: "Product Line Type Totals"
    value_format_name: usd_0
    type: number
    sql: ${TABLE}."SUM_MULTI_AMOUNT" ;;
  }

  dimension: new_amount {
    group_label: "Product Line Type Totals"
    value_format_name: usd_0
    type: number
    sql: ${TABLE}."SUM_NEW_AMOUNT" ;;
  }

  dimension: renewal_amount {
    group_label: "Product Line Type Totals"
    value_format_name: usd_0
    type: number
    sql: ${TABLE}."SUM_RENEWAL_AMOUNT" ;;
  }

  dimension: new_and_expansion_amount {
    group_label: "Product Line Type Totals"
    label: "New & Expansion Amount"
    value_format_name: usd_0
    type: number
    sql: ${new_amount} + ${expansion_amount} ;;
  }

}
