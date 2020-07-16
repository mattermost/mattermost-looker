view: scrub_ww {
  sql_table_name: "SALES"."SCRUB_WW"
    ;;
  view_label: ""
  dimension: scrub_qtr {
    type: string
    sql: ${TABLE}."QTR" ;;
  }

# Net New
  measure: nn_actual {
    type: sum
    sql: ${TABLE}."NN_ACTUAL" ;;
    label: "Actual"
    group_label: "Net New"
    value_format_name: usd_0
    link: {
      label: "List all actuals"
      url:"/looks/373?toggle&toggle=det,pik&f[opportunity.close_quarter]={{ scrub_qtr }}"
    }
  }

  measure: nn_best_case_max {
    type: sum
    sql: ${TABLE}."NN_BEST_CASE_MAX" ;;
    label: "Best Case"
    group_label: "Net New"
    value_format_name: usd_0
  }

  measure: nn_forecast {
    type: sum
    sql: ${TABLE}."NN_FORECAST" ;;
    label:"Forecast"
    group_label: "Net New"
    value_format_name: usd_0
  }

  measure: nn_forecast_update {
    type: sum
    sql: ${TABLE}."NN_FORECAST" ;;
    label:"Net New Forecast Update"
    group_label: "Updates"
    action: {
      label: "Update Net New Forecast"
      url: "https://hooks.zapier.com/hooks/catch/6573053/osne36z/"
      form_param: {
        name: "new_value"
        label: "What would you like Net New Forecast updated to?"
        default: "{{ value }}"
        type: string
        required: yes
      }
      param: {
        name: "field_name"
        value: "nn_forecast"
      }
      param: {
        name: "old_value"
        value: "{{ value }}"
      }
      param: {
        name: "table"
        value: "scrub_ww"
      }
      param: {
        name: "other_params"
        value: "qtr:{{ scrub_qtr }}"
      }
      user_attribute_param: {
        user_attribute: email
        name: "action_performed_by"
      }
    }
    value_format_name: usd_0
    required_access_grants: [sales_mgmt_data_access]
  }

  measure: nn_commit_max {
    type: sum
    sql: ${TABLE}."NN_COMMIT_MAX" ;;
    label:"Commit"
    group_label: "Net New"
    value_format_name: usd_0
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
    label:"Upside"
    value_format_name: usd_0
  }

  measure: nn_upside_update {
    type:sum
    sql: ${TABLE}."NN_UPSIDE" ;;
    group_label: "Updates"
    label:"New New Upside Update"
    action: {
      label: "Update Net New Upside"
      url: "https://hooks.zapier.com/hooks/catch/6573053/osne36z/"
      form_param: {
        name: "new_value"
        label: "What would you like Net New Upside updated to?"
        default: "{{ value }}"
        type: string
        required: yes
      }
      param: {
        name: "field_name"
        value: "nn_upside"
      }
      param: {
        name: "old_value"
        value: "{{ value }}"
      }
      param: {
        name: "table"
        value: "scrub_ww"
      }
      param: {
        name: "other_params"
        value: "qtr:{{ scrub_qtr }}"
      }
      user_attribute_param: {
        user_attribute: email
        name: "action_performed_by"
      }
    }
    value_format_name: usd_0
    required_access_grants: [sales_mgmt_data_access]
  }


  measure: ren_actual {
    type:sum
    sql: ${TABLE}."REN_ACTUAL" ;;
    label:"Actual"
    group_label: "Renewal"
    value_format_name: usd_0
    link: {
      label: "List all actuals"
      url:"/looks/374?toggle&toggle=det,pik&f[opportunity.close_quarter]={{ scrub_qtr }}"
    }
  }

  measure: ren_available {
    type:sum
    sql: ${TABLE}."REN_AVAILABLE" ;;
    label:"Available"
    group_label: "Renewal"
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
    label: "Forecast"
    group_label: "Renewal"
    value_format_name: usd_0
  }

  measure: ren_forecast_update {
    type:sum
    sql: ${TABLE}."REN_FORECAST" ;;
    label: "Renewal Forecast Update"
    group_label: "Updates"
    action: {
      label: "Update Renewal Forecast"
      url: "https://hooks.zapier.com/hooks/catch/6573053/osne36z/"
      form_param: {
        name: "new_value"
        label: "What would you like Renewal Forecast updated to?"
        default: "{{ value }}"
        type: string
        required: yes
      }
      param: {
        name: "field_name"
        value: "ren_forecast"
      }
      param: {
        name: "old_value"
        value: "{{ value }}"
      }
      param: {
        name: "table"
        value: "scrub_ww"
      }
      param: {
        name: "other_params"
        value: "qtr:{{ scrub_qtr }}"
      }
      user_attribute_param: {
        user_attribute: email
        name: "action_performed_by"
      }
    }
    value_format_name: usd_0
    required_access_grants: [sales_mgmt_data_access]
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

  measure: ren_omitted_orig_amount_max {
    type:sum
    sql: ${TABLE}."REN_OMITTED_ORIG_AMOUNT_MAX" ;;
    label:"Lost"
    group_label: "Renewal"
    value_format_name: usd_0
    link: {
      label: "List all lost"
      url:"/looks/379?toggle&toggle=det,pik&f[opportunity.close_quarter]={{ scrub_qtr }}"
    }
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

  measure: ren_rate {
    type:sum
    sql: ${TABLE}."REN_RATE" ;;
    label:"Ren Rate"
    group_label: "Renewal"
    value_format_name: percent_1
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
    label: "Upside"
    value_format_name: usd_0
  }

  measure: ren_upside_update {
    type:sum
    sql: ${TABLE}."REN_UPSIDE" ;;
    group_label: "Updates"
    label: "Renewal Upside Update"
    action: {
      label: "Update Renewal Upside"
      url: "https://hooks.zapier.com/hooks/catch/6573053/osne36z/"
      form_param: {
        name: "new_value"
        label: "What would you like Renewal Upside updated to?"
        default: "{{ value }}"
        type: string
        required: yes
      }
      param: {
        name: "field_name"
        value: "ren_upside"
      }
      param: {
        name: "old_value"
        value: "{{ value }}"
      }
      param: {
        name: "table"
        value: "scrub_ww"
      }
      param: {
        name: "other_params"
        value: "qtr:{{ scrub_qtr }}"
      }
      user_attribute_param: {
        user_attribute: email
        name: "action_performed_by"
      }
    }
    value_format_name: usd_0
    required_access_grants: [sales_mgmt_data_access]
  }

}
