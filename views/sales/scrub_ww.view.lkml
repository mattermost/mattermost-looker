view: scrub_ww {
  sql_table_name: "SALES"."SCRUB_WW"
    ;;
  view_label: ""
  dimension: scrub_qtr {
    type: string
    sql: ${TABLE}."QTR" ;;
  }

  dimension: scrub_segment {
    type: string
    sql: 'WW' ;;
  }

# Net New
  measure: nn_actual {
    type: sum
    sql: ${TABLE}."NN_ACTUAL" ;;
    label: "Actual"
    group_label: "Net New"
    value_format_name: usd_0
    link: {
      label: "See Details"
    }
  }

  measure: nn_best_case_max {
    type: sum
    sql: ${TABLE}."NN_BEST_CASE_MAX" ;;
    label: "Best Case"
    group_label: "Net New"
    value_format_name: usd_0
    link: {
      label: "See Details"
      url:"https://mattermost.looker.com/looks/542?toggle&toggle=det,pik&f[opportunity.close_quarter]={{ scrub_qtr }}&f[opportunity.forecastcategoryname]=Best Case"
    }
  }

  measure: nn_forecast {
    type: sum
    sql: ${TABLE}."NN_FORECAST" ;;
    group_item_label:"Forecast"
    group_label: "Net New"
    label: "Net New Forecast"
    value_format_name: usd_0
  }

  measure: nn_commit_max {
    type: sum
    sql: ${TABLE}."NN_COMMIT_MAX" ;;
    label:"Commit"
    group_label: "Net New"
    value_format_name: usd_0
    link: {
      label: "See Details"
      url:"https://mattermost.looker.com/looks/542?toggle&toggle=det,pik&f[opportunity.close_quarter]={{ scrub_qtr }}&f[opportunity.forecastcategoryname]=Commit"
    }
  }

  measure: nn_omitted_max {
    type:sum
    sql: ${TABLE}."NN_OMITTED_MAX" ;;
    label:"Omitted"
    group_label: "Net New"
    value_format_name: usd_0
  }

  measure: nn_open_max {
    type:sum
    sql: ${TABLE}."NN_OPEN_MAX" ;;
    label: "Open (Max)"
    group_label: "Net New"
    value_format_name: usd_0
    link: {
      label: "See Details"
      url:"https://mattermost.looker.com/looks/542?toggle&toggle=det,pik&f[opportunity.close_quarter]={{ scrub_qtr }}&f[opportunity.status_wlo]=Open"
    }
  }

  measure: nn_open_weighted {
    type:sum
    sql: ${TABLE}."NN_OPEN_WEIGHTED" ;;
    label: "Open (Wtd)"
    group_label: "Net New"
    value_format_name: usd_0
  }

  measure: nn_pipeline_max {
    type:sum
    sql: ${TABLE}."NN_PIPELINE_MAX" ;;
    label:"Pipeline"
    group_label: "Net New"
    value_format_name: usd_0
    link: {
      label: "See Details"
      url:"https://mattermost.looker.com/looks/542?toggle&toggle=det,pik&f[opportunity.close_quarter]={{ scrub_qtr }}&f[opportunity.forecastcategoryname]=Pipeline"
    }
  }

  measure: nn_target {
    type:sum
    sql: ${TABLE}."NN_TARGET" ;;
    label:"Target"
    group_label: "Net New"
    value_format_name: usd_0
  }

  measure: nn_tva {
    type:sum
    sql: ${TABLE}."NN_TVA" ;;
    label:"TvA"
    group_label: "Net New"
    value_format_name: percent_1
  }

  measure: nn_upside {
    type:sum
    sql: ${TABLE}."NN_UPSIDE" ;;
    group_label: "Net New"
    group_item_label:"Upside"
    label: "Net New Upside"
    value_format_name: usd_0
  }

  measure: ren_actual {
    type:sum
    sql: ${TABLE}."REN_ACTUAL" ;;
    label:"Actual"
    group_label: "Renewal"
    value_format_name: usd_0
  }

  measure: ren_available {
    type:sum
    sql: ${TABLE}."REN_AVAILABLE" ;;
    label:"Available"
    group_label: "Available Renewal"
    value_format_name: usd_0
  }

  measure: ren_best_case_max {
    type:sum
    sql: ${TABLE}."REN_BEST_CASE_MAX" ;;
    label:"Best Case"
    group_label: "Renewal"
    value_format_name: usd_0
  }

  measure: ren_forecast {
    type:sum
    sql: ${TABLE}."REN_FORECAST" ;;
    group_item_label: "Forecast"
    group_label: "Renewal"
    label: "Renewal Forecast"
    value_format_name: usd_0
  }

  measure: ren_commit_max {
    type:sum
    sql: ${TABLE}."REN_COMMIT_MAX" ;;
    label:"Commit"
    group_label: "Renewal"
    value_format_name: usd_0
  }

  measure: ren_gross_amount {
    type:sum
    sql: ${TABLE}."REN_GROSS_AMOUNT" ;;
    label: "Gross Amt"
    group_label: "Renewal"
    value_format_name: usd_0
  }

  measure: ren_omitted_max {
    type:sum
    sql: ${TABLE}."REN_OMITTED_MAX" ;;
    label:"Omitted"
    group_label: "Renewal"
    value_format_name: usd_0
  }

  measure: ren_open_max {
    type:sum
    sql: ${TABLE}."REN_OPEN_MAX" ;;
    label:"Open (Max)"
    group_label: "Renewal"
    value_format_name: usd_0
  }

  measure: ren_open_weighted {
    type:sum
    sql: ${TABLE}."REN_OPEN_WEIGHTED" ;;
    label:"Open (Wtd)"
    group_label: "Renewal"
    value_format_name: usd_0
  }

  measure: ren_pipeline_max {
    type:sum
    sql: ${TABLE}."REN_PIPELINE_MAX" ;;
    label:"Pipeline"
    group_label: "Renewal"
    value_format_name: usd_0
  }

  measure: ren_available_renewals_won {
    type:sum
    sql: ${TABLE}.ren_available_renewals_won ;;
    label:"Available Renewals Won"
    group_item_label:"Won"
    group_label: "Available Renewal"
    value_format_name: usd_0
    link: {
      label: "List all Won"
      url:"https://mattermost.looker.com/looks/518?toggle&toggle=det,pik&f[renewal_rate_by_renewal_opportunity.renewal_qtr]={{ scrub_qtr }}"
    }
  }

  measure: ren_available_renewals_won_qtd {
    type:sum
    sql: ${TABLE}.ren_available_renewals_won_qtd ;;
    label:"Available Renewals Won QTD"
    group_item_label:"Won QTD"
    group_label: "Available Renewal"
    value_format_name: usd_0
    link: {
      label: "List all Won"
      url:"https://mattermost.looker.com/looks/512?toggle&toggle=det,pik&f[renewal_rate_by_renewal_opportunity.renewal_qtr]={{ scrub_qtr }}"
    }
  }

  measure: ren_available_renewals_open {
    type:sum
    sql: ${TABLE}.ren_available_renewals_open ;;
    label:"Available Renewals Open"
    group_item_label:"Open"
    group_label: "Available Renewal"
    value_format_name: usd_0
    link: {
      label: "List all Open"
      url:"https://mattermost.looker.com//looks/517?toggle&toggle=det,pik&f[renewal_rate_by_renewal_opportunity.renewal_qtr]={{ scrub_qtr }}"
    }
  }

  measure: ren_available_renewals_open_past_due_qtd {
    type:sum
    sql: ${TABLE}.ren_available_renewals_open_past_due_qtd ;;
    label:"Available Renewals Open Past Due QTD"
    group_item_label:"Open Past Due QTD"
    group_label: "Available Renewal"
    value_format_name: usd_0
    link: {
      label: "List all Open"
      url:"https://mattermost.looker.com/looks/515?toggle&toggle=det,pik&f[renewal_rate_by_renewal_opportunity.renewal_qtr]={{ scrub_qtr }}"
    }
  }

  measure: ren_available_renewals_lost {
    type:sum
    sql: ${TABLE}.ren_available_renewals_lost ;;
    label:"Available Renewals Lost"
    group_item_label:"Lost"
    group_label: "Available Renewal"
    value_format_name: usd_0
    link: {
      label: "List all Lost"
      url:"https://mattermost.looker.com//looks/516?toggle&toggle=det,pik&f[renewal_rate_by_renewal_opportunity.renewal_qtr]={{ scrub_qtr }}"
    }
  }

  measure: ren_available_renewals_lost_qtd {
    type:sum
    sql: ${TABLE}.ren_available_renewals_lost_qtd ;;
    label:"Available Renewals Lost QTD"
    group_item_label:"Lost QTD"
    group_label: "Available Renewal"
    value_format_name: usd_0
    link: {
      label: "List all Lost"
      url:"https://mattermost.looker.com/looks/505?toggle&toggle=det,pik&f[renewal_rate_by_renewal_opportunity.renewal_qtr]={{ scrub_qtr }}"
    }
  }

  measure: ren_rate {
    type:sum
    sql: ${TABLE}.ren_available_renewals_won_perc ;;
    label:"Ren Rate"
    group_label: "Available Renewal"
    value_format_name: percent_1
  }

  measure: ren_available_renewals_open_perc {
    type:sum
    sql: ${TABLE}.ren_available_renewals_open_perc ;;
    label:"Available Renewals Open %"
    group_item_label:"Open %"
    group_label: "Available Renewal"
    value_format_name: percent_1
  }

  measure: ren_available_renewals_lost_perc {
    type:sum
    sql: ${TABLE}.ren_available_renewals_lost_perc ;;
    label:"Available Renewals Lost %"
    group_item_label:"Lost %"
    group_label: "Available Renewal"
    value_format_name: percent_1
  }

  measure: ren_available_renewals_won_qtd_perc {
    type:sum
    sql: ${TABLE}.ren_available_renewals_won_qtd_perc ;;
    label:"Ren Rate QTD"
    group_label: "Available Renewal"
    value_format_name: percent_1
  }

  measure: ren_rate_max {
    type:sum
    sql: ${TABLE}.ren_available_renewals_won_max_perc ;;
    label:"Ren Rate Max"
    group_label: "Available Renewal"
    value_format_name: percent_1
  }

  measure: ren_available_renewals_won_in_qtr {
    type:sum
    sql: ${TABLE}.ren_available_renewals_won_in_qtr ;;
    label:"Available Renewals Won in Qtr"
    group_item_label:"Won in Qtr"
    group_label: "Available Renewal"
    value_format_name: usd_0
  }

  measure: ren_available_renewals_won_early {
    type:sum
    sql: ${TABLE}.ren_available_renewals_won_early ;;
    label:"Available Renewals Won Early"
    group_item_label:"Won Early"
    group_label: "Available Renewal"
    value_format_name: usd_0
  }

  measure: ren_available_renewals_won_late {
    type:sum
    sql: ${TABLE}.ren_available_renewals_won_late ;;
    label:"Available Renewals Won Late"
    group_item_label:"Won Late"
    group_label: "Available Renewal"
    value_format_name: usd_0
  }

  measure: ren_available_renewals_open_in_qtr {
    type:sum
    sql: ${TABLE}.ren_available_renewals_open_in_qtr ;;
    label:"Available Renewals Open in Qtr"
    group_item_label:"Open in Qtr"
    group_label: "Available Renewal"
    value_format_name: usd_0
  }

  measure: ren_target {
    type:sum
    sql: ${TABLE}."REN_TARGET" ;;
    label: "Target"
    group_label: "Renewal"
    value_format_name: usd_0
  }

  measure: ren_tva {
    type:sum
    sql: ${TABLE}."REN_TVA" ;;
    label: "TvA"
    group_label: "Renewal"
    value_format_name: percent_1
  }

  measure: ren_upside {
    type:sum
    sql: ${TABLE}."REN_UPSIDE" ;;
    group_label: "Renewal"
    group_item_label: "Upside"
    label: "Renewal Upside"
    value_format_name: usd_0
  }

}
