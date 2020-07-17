view: renewal_rate_by_renewal_opportunity {
  sql_table_name: "CS"."OPPORTUNITY_RENEWAL_RATE"
    ;;

  dimension: accountid {
    type: string
    sql: ${TABLE}."ACCOUNTID" ;;
    hidden: yes
  }

  dimension: available_renewal {
    type: number
    sql: ${TABLE}."AVAILABLE_RENEWAL" ;;
    value_format_name: usd_0
  }

  dimension: lost_renewal_gross {
    group_label: "Gross Amounts"
    type: number
    sql: ${TABLE}."LOST_RENEWAL_GROSS_TOTAL" ;;
    value_format_name: usd_0
  }

  dimension: lost_renewal_net {
    group_label: "Net Amounts"
    sql: ${TABLE}."LOST_RENEWAL_NET_TOTAL" ;;
    value_format_name: usd_0
  }

  dimension: open_renewal_gross {
    group_label: "Gross Amounts"
    type: number
    sql: ${TABLE}."OPEN_RENEWAL_GROSS_TOTAL" ;;
    value_format_name: usd_0
  }

  dimension: open_renewal_net {
    group_label: "Net Amounts"
    sql: ${TABLE}."OPEN_RENEWAL_NET_TOTAL" ;;
    value_format_name: usd_0
  }

  dimension: opportunityid {
    type: string
    sql: ${TABLE}."OPPORTUNITYID" ;;
    hidden: yes
    primary_key: yes
  }

  dimension: ren_rate {
    type: number
    sql: ${TABLE}."REN_RATE" ;;
    value_format_name: percent_1
    hidden: yes
  }

  dimension: renewal_qtr {
    type: string
    sql: ${TABLE}."RENEWAL_QTR" ;;
  }

  dimension: won_renewal_gross {
    group_label: "Gross Amounts"
    sql: ${TABLE}."WON_RENEWAL_GROSS_TOTAL" ;;
    value_format_name: usd_0
  }

  dimension: won_renewal_net {
    group_label: "Net Amounts"
    sql: ${TABLE}."WON_RENEWAL_NET_TOTAL" ;;
    value_format_name: usd_0
  }

  measure: available_renewal_total {
    type: sum_distinct
    sql_distinct_key: opportunityid ;;
    sql: ${available_renewal} ;;
    value_format_name: usd_0
  }

  measure: lost_renewal_gross_total {
    group_label: "Gross Amounts"
    type: sum_distinct
    sql_distinct_key: opportunityid ;;
    sql: ${lost_renewal_gross} ;;
    value_format_name: usd_0
  }

  measure: lost_renewal_net_total {
    group_label: "Net Amounts"
    type: sum_distinct
    sql_distinct_key: opportunityid ;;
    sql: ${lost_renewal_net} ;;
    value_format_name: usd_0
  }

  measure: open_renewal_gross_total {
    group_label: "Gross Amounts"
    type: sum_distinct
    sql_distinct_key: opportunityid ;;
    sql: ${open_renewal_gross} ;;
    value_format_name: usd_0
  }

  measure: open_renewal_net_total {
    group_label: "Net Amounts"
    type: sum_distinct
    sql_distinct_key: opportunityid ;;
    sql: ${open_renewal_net} ;;
    value_format_name: usd_0
  }

  measure: won_renewal_gross_total {
    group_label: "Gross Amounts"
    type: sum_distinct
    sql_distinct_key: opportunityid ;;
    sql: ${won_renewal_gross} ;;
    value_format_name: usd_0
  }

  measure: won_renewal_net_total {
    group_label: "Net Amounts"
    type: sum_distinct
    sql_distinct_key: opportunityid ;;
    sql: ${won_renewal_net} ;;
    value_format_name: usd_0
  }

  measure: renewal_rate {
    description: "Won Gross Amount/Available Renewal"
    type: number
    sql: ${won_renewal_gross_total} / ${available_renewal_total} ;;
    value_format_name: percent_1
    drill_fields: [account.name, account.owner_name, account.csm_name, opportunity.name, opportunity.owner_name, opportunity.csm_name, opportunity.status_wlo,
                   available_renewal, won_renewal_gross_total, open_renewal_gross_total, lost_renewal_gross_total, renewal_rate]
  }

  measure: max_renewal_rate {
    description: "Won & Open Gross Amount/Available Renewal"
    type: number
    sql: (${won_renewal_gross_total}+${open_renewal_gross_total}) / ${available_renewal_total} ;;
    value_format_name: percent_1
    drill_fields: [account.name, account.owner_name, account.csm_name, opportunity.name, opportunity.owner_name, opportunity.csm_name, opportunity.status_wlo,
                    available_renewal, won_renewal_gross_total, open_renewal_gross_total, lost_renewal_gross_total, renewal_rate, max_renewal_rate]
  }
}
