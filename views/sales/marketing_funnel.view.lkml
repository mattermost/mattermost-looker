view: marketing_funnel {
  sql_table_name: "SALES"."MARKETING_FUNNEL";;

  dimension: month {
    type: date
    sql: ${TABLE}."MONTH" ;;
    hidden: yes
    primary_key: yes
  }

  dimension_group: month {
    type: time
    timeframes: [
      month,
      fiscal_quarter,
      fiscal_year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."MONTH" ;;
  }

  dimension: arr {
    type: number
    sql: ${TABLE}."ARR" ;;
    hidden: yes
  }

  dimension: count_lead_creation {
    type: number
    sql: ${TABLE}."COUNT_LEAD_CREATION" ;;
    hidden: yes
  }

  dimension: count_mql {
    type: number
    sql: ${TABLE}."COUNT_MQL" ;;
    hidden: yes
  }

  dimension: count_creation {
    type: number
    sql: ${TABLE}.count_creation ;;
    hidden: yes
  }

  dimension: count_new_logo {
    type: number
    sql: ${TABLE}."COUNT_NEW_LOGO" ;;
    hidden: yes
  }

  dimension: count_sal {
    type: number
    sql: ${TABLE}."COUNT_SAL" ;;
    hidden: yes
  }

  dimension: count_sql {
    type: number
    sql: ${TABLE}."COUNT_SQL" ;;
    hidden: yes
  }

  dimension: marketing_spend {
    type: number
    sql: ${TABLE}."MARKETING_SPEND" ;;
    hidden: yes
  }

  dimension: pipeline_amount {
    type: number
    sql: ${TABLE}."PIPELINE_AMOUNT" ;;
    hidden: yes
  }

  dimension: count_web_traffic {
    type: number
    sql: ${TABLE}."COUNT_WEB_TRAFFIC" ;;
    hidden: yes
  }

  dimension: federal_pipeline_amount {
    type: number
    sql:  ${TABLE}.federal_pipeline_amount ;;
    hidden: yes
  }

  dimension: commercial_ae_pipeline_amount {
    type: number
    sql:  ${TABLE}.commercial_ae_pipeline_amount ;;
    hidden: yes
  }

  dimension: enterprise_ae_pipeline_amount {
    type: number
    sql:  ${TABLE}.enterprise_ae_pipeline_amount ;;
    hidden: yes
  }

  dimension: commercial_bdr_pipeline_amount {
    type: number
    sql:  ${TABLE}.commercial_bdr_pipeline_amount ;;
    hidden: yes
  }

  dimension: enterprise_bdr_pipeline_amount {
    type: number
    sql:  ${TABLE}.enterprise_bdr_pipeline_amount ;;
    hidden: yes
  }

  dimension: federal_created {
    type: number
    sql:  ${TABLE}.federal_created ;;
    hidden: yes
  }

  dimension: commercial_ae_created {
    type: number
    sql:  ${TABLE}.commercial_ae_created ;;
    hidden: yes
  }

  dimension: enterprise_ae_created {
    type: number
    sql:  ${TABLE}.enterprise_ae_created ;;
    hidden: yes
  }

  dimension: commercial_bdr_created {
    type: number
    sql:  ${TABLE}.commercial_bdr_created ;;
    hidden: yes
  }

  dimension: enterprise_bdr_created {
    type: number
    sql:  ${TABLE}.enterprise_bdr_created ;;
    hidden: yes
  }

  dimension: federal_new_logo {
    type: number
    sql:  ${TABLE}.federal_new_logo ;;
    hidden: yes
  }

  dimension: commercial_new_logo {
    type: number
    sql:  ${TABLE}.commercial_new_logo ;;
    hidden: yes
  }

  dimension: enterprise_new_logo {
    type: number
    sql:  ${TABLE}.enterprise_new_logo ;;
    hidden: yes
  }

  dimension: federal_arr {
    type: number
    sql:  ${TABLE}.federal_arr ;;
    hidden: yes
  }

  dimension: commercial_arr {
    type: number
    sql:  ${TABLE}.commercial_arr ;;
    hidden: yes
  }

  dimension: enterprise_arr {
    type: number
    sql:  ${TABLE}.enterprise_arr ;;
    hidden: yes
  }

  dimension: federal_sum_age {
    type: number
    sql:  ${TABLE}.federal_sum_age ;;
    hidden: yes
  }

  dimension: commercial_sum_age {
    type: number
    sql:  ${TABLE}.commercial_sum_age ;;
    hidden: yes
  }

  dimension: enterprise_sum_age {
    type: number
    sql:  ${TABLE}.enterprise_sum_age ;;
    hidden: yes
  }

  measure: total_count_web_traffic {
    label: "Web Traffic (Unique Visitors)"
    type: sum
    sql: ${count_web_traffic} ;;
  }


  measure: total_count_lead_creation {
    group_label: "Lead Lifecycle"
    label: "Leads Created"
    type: sum
    sql: ${count_lead_creation} ;;
  }

  measure: total_count_mql {
    group_label: "Lead Lifecycle"
    label: "MQLs"
    type: sum
    sql: ${count_mql} ;;
  }

  measure: total_count_sal {
    group_label: "Lead Lifecycle"
    label: "SALs"
    type: sum
    sql: ${count_sal} ;;
  }

  measure: total_count_sql {
    group_label: "Lead Lifecycle"
    label: "SQLs"
    type: sum
    sql: ${count_sql} ;;
  }

  measure: total_count_creation {
    group_label: "Pipeline"
    label: "Combined Count"
    group_item_label: "Combined Count"
    type: sum
    sql: ${count_creation} ;;
  }

  measure: total_pipeline_amount {
    group_label: "Pipeline"
    label: "Combined Amount"
    group_item_label: "Combined Amount"
    type: sum
    sql: ${pipeline_amount} ;;
    value_format_name: usd_0
  }

  measure: total_count_new_logo {
    group_label: "New Logo"
    label: "Combined New Logo Count"
    group_item_label: "Combined"
    type: sum
    sql: ${count_new_logo} ;;
  }

  measure: total_arr {
    group_label: "ARR"
    label: "Combined ARR"
    group_item_label: "Combined"
    type: sum
    sql: ${arr} ;;
    value_format_name: usd_0
  }

  measure: total_marketing_spend {
    label: "Marketing Spend"
    type: sum
    sql: ${marketing_spend} ;;
    value_format_name: usd_0
  }

  measure: webtraffic_to_lead_ratio {
    group_label: "Coverage Rates"
    label: "Web Traffic:Lead Coverage Rate (X:1)"
    group_item_label: "2. Web Traffic:Lead Coverage Rate (X:1)"
    type: number
    sql: ${total_count_web_traffic}/nullif(${total_count_lead_creation},0) ;;
    value_format_name: decimal_2
  }

  measure: marketing_spend_per_lead {
    group_label: "Coverage Rates"
    label: "Marketing Spend:Lead Coverage Rate (X:1)"
    group_item_label: "1. Marketing Spend:Lead Coverage Rate (X:1)"
    type: number
    sql: ${total_marketing_spend}/nullif(${total_count_lead_creation},0) ;;
    value_format_name: decimal_2
  }

  measure: lead_to_mql_ratio {
    group_label: "Coverage Rates"
    label: "Lead:MQL Coverage Rate (X:1)"
    group_item_label: "3. Lead:MQL Coverage Rate (X:1)"
    type: number
    sql: ${total_count_lead_creation}/nullif(${total_count_mql},0) ;;
    value_format_name: decimal_2
  }

  measure: mql_to_sal_ratio {
    group_label: "Coverage Rates"
    label: "MQL:SAL Coverage Rate (X:1)"
    group_item_label: "4. MQL:SAL Coverage Rate (X:1)"
    type: number
    sql: ${total_count_mql}/nullif(${total_count_sal},0) ;;
    value_format_name: decimal_2
  }

  measure: sal_to_sql_ratio {
    group_label: "Coverage Rates"
    label: "SAL:SQL Coverage Rate (X:1)"
    group_item_label: "5. SAL:SQL Coverage Rate (X:1)"
    type: number
    sql: ${total_count_sal}/nullif(${total_count_sql},0) ;;
    value_format_name: decimal_2
  }

  measure: sql_to_oppt_ratio {
    group_label: "Coverage Rates"
    label: "SQL:Oppt Coverage Rate (X:1)"
    group_item_label: "6. SQL:Oppt Coverage Rate (X:1)"
    type: number
    sql: ${total_count_sql}/nullif(${total_count_creation},0) ;;
    value_format_name: decimal_2
  }

  measure: oppt_to_newlogo_ratio {
    group_label: "Coverage Rates"
    label: "Oppt:New Logo Coverage Rate (X:1)"
    group_item_label: "7. Oppt:New Logo Coverage Rate (X:1)"
    type: number
    sql: ${total_count_creation}/nullif(${total_count_new_logo},0) ;;
    value_format_name: decimal_2
  }

  measure: pipeline_to_arr_ratio {
    group_label: "Coverage Rates"
    label: "Pipeline:ARR Coverage Rate (X:1)"
    group_item_label: "8. Pipeline:ARR Coverage Rate (X:1)"
    type: number
    sql: ${total_pipeline_amount}/nullif(${total_arr},0) ;;
    value_format_name: decimal_2
  }

  measure: total_federal_pipeline_amount {
    type: sum
    sql:  ${federal_pipeline_amount} ;;
    group_label: "Pipeline"
    label: "Federal Pipeline Amount"
    group_item_label: "Federal Amount"
    value_format_name: usd_0
  }

  measure: total_commercial_ae_pipeline_amount {
    type: sum
    sql:  ${commercial_ae_pipeline_amount} ;;
    group_label: "Pipeline"
    label: "Commercial AE Pipeline Amount"
    group_item_label: "Commercial AE Amount"
    value_format_name: usd_0
  }

  measure: total_enterprise_ae_pipeline_amount {
    type: sum
    sql:  ${enterprise_ae_pipeline_amount} ;;
    group_label: "Pipeline"
    label: "Enterprise AE Pipeline Amount"
    group_item_label: "Enterprise AE Amount"
    value_format_name: usd_0
  }

  measure: total_commercial_bdr_pipeline_amount {
    type: sum
    sql:  ${commercial_bdr_pipeline_amount} ;;
    group_label: "Pipeline"
    label: "Commercial BDR Pipeline Amount"
    group_item_label: "Commercial BDR Amount"
    value_format_name: usd_0
  }

  measure: total_enterprise_bdr_pipeline_amount {
    type: sum
    sql:  ${enterprise_bdr_pipeline_amount} ;;
    group_label: "Pipeline"
    label: "Enterprise BDR Pipeline Amount"
    group_item_label: "Enterprise BDR Amount"
    value_format_name: usd_0
  }

  measure: total_federal_created {
    type: sum
    sql:  ${federal_created} ;;
    group_label: "Pipeline"
    label: "Federal Pipeline Count"
    group_item_label: "Federal Count"
  }

  measure: total_commercial_ae_created {
    type: sum
    sql:  ${commercial_ae_created} ;;
    group_label: "Pipeline"
    label: "Commercial AE Pipeline Count"
    group_item_label: "Commercial AE Count"
  }

  measure: total_enterprise_ae_created {
    type: sum
    sql:  ${enterprise_ae_created} ;;
    group_label: "Pipeline"
    label: "Enterprise AE Pipeline Count"
    group_item_label: "Enterprise AE Count"
  }

  measure: total_commercial_bdr_created {
    type: sum
    sql:  ${commercial_bdr_created} ;;
    group_label: "Pipeline"
    label: "Commercial BDR Pipeline Count"
    group_item_label: "Commercial BDR Count"
  }

  measure: total_enterprise_bdr_created {
    type: sum
    sql:  ${enterprise_bdr_created} ;;
    group_label: "Pipeline"
    label: "Enterprise BDR Pipeline Count"
    group_item_label: "Enterprise BDR Count"
  }

  measure: total_federal_new_logo {
    type: sum
    sql:  ${federal_new_logo} ;;
    group_label: "New Logo"
    label: "Federal New Logo Count"
    group_item_label: "Federal New Logo"
  }

  measure: total_commercial_new_logo {
    type: sum
    sql:  ${commercial_new_logo} ;;
    group_label: "New Logo"
    label: "Commercial New Logo Count"
    group_item_label: "Commercial New Logo"
  }

  measure: total_enterprise_new_logo {
    type: sum
    sql:  ${enterprise_new_logo} ;;
    group_label: "New Logo"
    label: "Enterprise New Logo Count"
    group_item_label: "Enterprise New Logo"
  }

  measure: total_perc_federal_new_logo {
    type: number
    sql:  1.0*${total_federal_new_logo}/${total_count_new_logo} ;;
    group_label: "New Logo"
    label: "Federal New Logo %"
    group_item_label: "Federal New %"
    value_format_name: percent_1
  }

  measure: total_perc_commercial_new_logo {
    type: number
    sql:  1.0*${total_commercial_new_logo}/${total_count_new_logo} ;;
    group_label: "New Logo"
    label: "Commercial New Logo %"
    group_item_label: "Commercial New %"
    value_format_name: percent_1
  }

  measure: total_perc_enterprise_new_logo {
    type: number
    sql:  1.0*${total_enterprise_new_logo}/${total_count_new_logo} ;;
    group_label: "New Logo"
    label: "Enterprise New Logo %"
    group_item_label: "Enterprise New Logo %"
    value_format_name: percent_1
  }

  measure: total_federal_arr {
    type: sum
    sql:  ${federal_arr} ;;
    group_label: "ARR"
    label: "Federal ARR"
    group_item_label: "Federal"
    value_format_name: usd_0
  }

  measure: total_commercial_arr {
    type: sum
    sql:  ${commercial_arr} ;;
    group_label: "ARR"
    label: "Commercial ARR"
    group_item_label: "Commercial"
    value_format_name: usd_0
  }

  measure: total_enterprise_arr {
    type: sum
    sql:  ${enterprise_arr} ;;
    group_label: "ARR"
    label: "Enterprise ARR"
    group_item_label: "Enterprise"
    value_format_name: usd_0
  }


  measure: total_federal_age {
    type: sum
    sql:  ${federal_sum_age} ;;
    hidden: yes
  }

  measure: total_commercial_age {
    type: sum
    sql:  ${commercial_sum_age} ;;
    hidden: yes
  }

  measure: total_enterprise_age {
    type: sum
    sql:  ${enterprise_sum_age} ;;
    hidden: yes
  }

  measure: average_federal_amount {
    type: number
    sql:  ${total_federal_arr}/nullif(${total_federal_new_logo},0) ;;
    group_label: "ASP"
    label: "Federal ASP"
    group_item_label: "Federal"
    value_format_name: usd_0
  }

  measure: average_commercial_amount {
    type: number
    sql:  ${total_commercial_arr}/nullif(${total_commercial_new_logo},0) ;;
    group_label: "ASP"
    label: "Commercial ASP"
    group_item_label: "Commercial"
    value_format_name: usd_0
  }

  measure: average_enterprise_amount {
    type: number
    sql:  ${total_enterprise_arr}/nullif(${total_enterprise_new_logo},0) ;;
    group_label: "ASP"
    label: "Enterprise ASP"
    group_item_label: "Enterprise"
    value_format_name: usd_0
  }

  measure: average_federal_age {
    type: number
    sql:  (1.0*${total_federal_age}/nullif(${total_federal_new_logo},0))/30 ;;
    group_label: "Avg Sales Cycle"
    label: "Federal Avg Sales Cycle"
    group_item_label: "Federal"
    value_format_name: decimal_1
  }

  measure: average_commercial_age {
    type: number
    sql:  (1.0*${total_commercial_age}/nullif(${total_commercial_new_logo},0))/30 ;;
    group_label: "Avg Sales Cycle"
    label: "Commercial Avg Sales Cycle"
    group_item_label: "Commercial"
    value_format_name: decimal_1
  }

  measure: average_enterprise_age {
    type: number
    sql:  (1.0*${total_enterprise_age}/nullif(${total_enterprise_new_logo},0))/30 ;;
    group_label: "Avg Sales Cycle"
    label: "Enterprise Avg Sales Cycle"
    group_item_label: "Enterprise"
    value_format_name: decimal_1
  }

}
