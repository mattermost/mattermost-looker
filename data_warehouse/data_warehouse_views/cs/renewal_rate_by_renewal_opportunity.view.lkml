view: renewal_rate_by_renewal_opportunity {
  sql_table_name: "CS"."RENEWAL_RATE_BY_RENEWAL_OPPORTUNITY"
    ;;

  dimension: accountid {
    type: string
    sql: ${TABLE}."ACCOUNTID" ;;
    hidden: yes
  }

  dimension: available_renewal {
    group_label: "Amounts"
    type: number
    sql: ${TABLE}."AVAILABLE_RENEWAL" ;;
    value_format_name: usd_0
  }

  dimension: lost_renewal_gross {
    label: "Lost"
    group_label: "Amounts"
    type: number
    sql: ${TABLE}."LOST_RENEWAL_GROSS_TOTAL" ;;
    value_format_name: usd_0
  }

  dimension: lost_renewal_net {
    hidden: yes
    group_label: "Net Amounts"
    sql: ${TABLE}."LOST_RENEWAL_NET_TOTAL" ;;
    value_format_name: usd_0
  }

  dimension: open_renewal_gross {
    label: "Open"
    group_label: "Amounts"
    type: number
    sql: ${TABLE}."OPEN_RENEWAL_GROSS_TOTAL" ;;
    value_format_name: usd_0
  }

  dimension: open_renewal_net {
    hidden: yes
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
    hidden: yes
  }

  dimension_group: renewal_license_start {
    type: time
    sql: ${TABLE}.renewal_license_start ;;
    timeframes: [
      date,
      month,
      fiscal_quarter,
      fiscal_year
    ]
  }

  dimension_group: renewal {
    type: time
    sql: ${TABLE}.renewal_date ;;
    timeframes: [
      date,
      month,
      fiscal_quarter,
      fiscal_year
    ]
  }

  dimension: past_renewal_date {
    type: yesno
    sql: ${renewal_date} < current_date ;;
    hidden: yes
  }

  dimension: won_renewal_gross {
    label: "Won"
    group_label: "Amounts"
    sql: ${TABLE}."WON_RENEWAL_GROSS_TOTAL" ;;
    value_format_name: usd_0
  }

  dimension: won_renewal_net {
    hidden: yes
    group_label: "Net Amounts"
    sql: ${TABLE}."WON_RENEWAL_NET_TOTAL" ;;
    value_format_name: usd_0
  }

  measure: available_renewal_total {
    group_label: "Amounts"
    label: "Available Renewal"
    type: sum_distinct
    sql_distinct_key: opportunityid ;;
    sql: ${available_renewal} ;;
    value_format_name: usd_0
    drill_fields: [account.name, account.owner_name, account.csm_name, opportunity.name, opportunity.owner_name, opportunity.csm_name, opportunity.status_wlo,
      available_renewal]
  }

  measure: lost_renewal_gross_total {
    label: "Lost"
    group_label: "Amounts"
    type: sum_distinct
    sql_distinct_key: opportunityid ;;
    sql: ${lost_renewal_gross} ;;
    filters: {
      field: opportunity.status_wlo
      value: "Lost"
    }
    value_format_name: usd_0
    drill_fields: [account.name, account.owner_name, account.csm_name, opportunity.name, opportunity.owner_name, opportunity.csm_name, opportunity.status_wlo,
      available_renewal, lost_renewal_gross_total]
  }

  measure: lost_renewal_net_total {
    hidden: yes
    group_label: "Net Amounts"
    type: sum_distinct
    sql_distinct_key: opportunityid ;;
    sql: ${lost_renewal_net} ;;
    value_format_name: usd_0
  }

  measure: open_renewal_gross_total {
    label: "Open"
    group_label: "Amounts"
    type: sum_distinct
    sql_distinct_key: opportunityid ;;
    sql: ${open_renewal_gross} ;;
    filters: {
      field: opportunity.status_wlo
      value: "Open"
    }
    value_format_name: usd_0
    drill_fields: [account.name, account.owner_name, account.csm_name, opportunity.name, opportunity.owner_name, opportunity.csm_name, opportunity.status_wlo,
      available_renewal, open_renewal_gross_total]
  }

  measure: open_renewal_net_total {
    hidden: yes
    group_label: "Net Amounts"
    type: sum_distinct
    sql_distinct_key: opportunityid ;;
    sql: ${open_renewal_net} ;;
    value_format_name: usd_0
  }

  measure: won_renewal_gross_total {
    label: "Won"
    group_label: "Amounts"
    type: sum_distinct
    sql_distinct_key: opportunityid ;;
    sql: ${won_renewal_gross} ;;
    filters: {
      field: opportunity.status_wlo
      value: "Won"
    }
    value_format_name: usd_0
    drill_fields: [account.name, account.owner_name, account.csm_name, opportunity.name, opportunity.owner_name, opportunity.csm_name, opportunity.status_wlo,
      available_renewal, won_renewal_gross_total]
  }

  measure: won_renewal_net_total {
    hidden: yes
    group_label: "Net Amounts"
    type: sum_distinct
    sql_distinct_key: opportunityid ;;
    sql: ${won_renewal_net} ;;
    value_format_name: usd_0
  }

  measure: available_renewal_qtd {
    label: "TD Available Renewal"
    group_label: "To Date"
    type: sum_distinct
    sql: ${available_renewal};;
    filters: {
      field: past_renewal_date
      value: "yes"
    }
    drill_fields: [account.name, account.owner_name, account.csm_name, opportunity.name, opportunity.owner_name, opportunity.csm_name, opportunity.status_wlo,
      available_renewal, won_renewal_gross_total, open_renewal_gross_total, lost_renewal_gross_total, available_renewal_qtd]
  }

  measure: won_renewal_gross_qtd {
    label: "TD Won"
    group_label: "To Date"
    type: sum_distinct
    sql: ${won_renewal_gross};;
    filters: {
        field: past_renewal_date
        value: "yes"
    }
    drill_fields: [account.name, account.owner_name, account.csm_name, opportunity.name, opportunity.owner_name, opportunity.csm_name, opportunity.status_wlo,
      available_renewal, won_renewal_gross_total, open_renewal_gross_total, lost_renewal_gross_total, renewal_rate]
  }

  measure: renewal_rate_qtd {
    group_label: "To Date"
    label: "TD Renewal Rate"
    description: "Won TD / Available Renewal TD"
    type: number
    sql: ${won_renewal_gross_qtd} / nullif(${available_renewal_qtd},0) ;;
    value_format_name: percent_1
    drill_fields: [account.name, account.owner_name, account.csm_name, opportunity.name, opportunity.owner_name, opportunity.csm_name, opportunity.status_wlo,
      available_renewal, won_renewal_gross_total, open_renewal_gross_total, lost_renewal_gross_total, renewal_rate_qtd]
  }

  measure: renewal_rate {
    group_label: "Renewal Rates"
    description: "Won / Available"
    type: number
    sql: ${won_renewal_gross_total} / ${available_renewal_total} ;;
    value_format_name: percent_1
    drill_fields: [account.name, account.owner_name, account.csm_name, opportunity.name, opportunity.owner_name, opportunity.csm_name, opportunity.status_wlo,
      available_renewal, won_renewal_gross_total, open_renewal_gross_total, lost_renewal_gross_total, renewal_rate]
  }

  measure: max_renewal_rate {
    group_label: "Renewal Rates"
    description: "Won & Open Gross Amount/Available Renewal"
    type: number
    sql: (${won_renewal_gross_total}+${open_renewal_gross_total}) / ${available_renewal_total} ;;
    value_format_name: percent_1
    drill_fields: [account.name, account.owner_name, account.csm_name, opportunity.name, opportunity.owner_name, opportunity.csm_name, opportunity.status_wlo,
      available_renewal, won_renewal_gross_total, open_renewal_gross_total, lost_renewal_gross_total, renewal_rate, max_renewal_rate]
  }
}
