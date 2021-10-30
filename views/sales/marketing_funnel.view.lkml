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

  dimension: federal_bdr_pipeline_amount {
    type: number
    sql:  ${TABLE}.federal_bdr_pipeline_amount ;;
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

  dimension: federal_bdr_created {
    type: number
    sql:  ${TABLE}.federal_bdr_created ;;
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

  dimension: federal_bdr_new_logo {
    type: number
    sql:  ${TABLE}.federal_bdr_new_logo ;;
    hidden: yes
  }

  dimension: commercial_bdr_new_logo {
    type: number
    sql:  ${TABLE}.commercial_bdr_new_logo ;;
    hidden: yes
  }

  dimension: enterprise_bdr_new_logo {
    type: number
    sql:  ${TABLE}.enterprise_bdr_new_logo ;;
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

  dimension: federal_bdr_arr {
    type: number
    sql:  ${TABLE}.federal_bdr_arr ;;
    hidden: yes
  }

  dimension: commercial_bdr_arr {
    type: number
    sql:  ${TABLE}.commercial_bdr_arr ;;
    hidden: yes
  }

  dimension: enterprise_bdr_arr {
    type: number
    sql:  ${TABLE}.enterprise_bdr_arr ;;
    hidden: yes
  }

  dimension: commercial_m18_arr {
    type: number
    sql:  ${TABLE}.commercial_m18_arr ;;
    hidden: yes
  }

  dimension: enterprise_m18_arr {
    type: number
    sql:  ${TABLE}.enterprise_m18_arr ;;
    hidden: yes
  }

  dimension: federal_m18_arr {
    type: number
    sql:  ${TABLE}.federal_m18_arr ;;
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

  dimension: run_rate_assumption {
    type: number
    sql: ${TABLE}.RUN_RATE_ASSUMPTION ;;
    hidden: yes
    group_label: "Assumption"
  }

  dimension: budget_assumption {
    type: number
    sql: ${TABLE}.BUDGET_ASSUMPTION ;;
    hidden: yes
    group_label: "Assumption"
  }

  dimension: cpl_assumption {
    type: number
    sql: ${TABLE}.CPL_ASSUMPTION ;;
    hidden: yes
    group_label: "Assumption"
  }

  dimension: traffic_lead_assumption {
    type: number
    sql: ${TABLE}.TRAFFIC_LEAD_ASSUMPTION ;;
    hidden: yes
    group_label: "Assumption"
  }

  dimension: lead_mql_assumption {
    type: number
    sql: ${TABLE}.LEAD_MQL_ASSUMPTION ;;
    hidden: yes
    group_label: "Assumption"
  }

  dimension: mql_sal_assumption {
    type: number
    sql: ${TABLE}.MQL_SAL_ASSUMPTION ;;
    hidden: yes
    group_label: "Assumption"
  }

  dimension: sal_sql_assumption {
    type: number
    sql: ${TABLE}.SAL_SQL_ASSUMPTION ;;
    hidden: yes
    group_label: "Assumption"
  }

  dimension: sql_opp_assumption {
    type: number
    sql: ${TABLE}.SQL_OPP_ASSUMPTION ;;
    hidden: yes
    group_label: "Assumption"
  }

  dimension: opp_newlogo_assumption {
    type: number
    sql: ${TABLE}.OPP_NEWLOGO_ASSUMPTION ;;
    hidden: yes
    group_label: "Assumption"
  }

  dimension: lead_mql_coverage_assumption {
    type: number
    sql: ${TABLE}.LEAD_MQL_COVERAGE_ASSUMPTION ;;
    hidden: yes
    group_label: "Assumption"
  }

  dimension: mql_sal_coverage_assumption {
    type: number
    sql: ${TABLE}.MQL_SAL_COVERAGE_ASSUMPTION ;;
    hidden: yes
    group_label: "Assumption"
  }

  dimension: sal_sql_coverage_assumption {
    type: number
    sql: ${TABLE}.SAL_SQL_COVERAGE_ASSUMPTION ;;
    hidden: yes
    group_label: "Assumption"
  }

  dimension: sql_opp_coverage_assumption {
    type: number
    sql: ${TABLE}.SQL_OPP_COVERAGE_ASSUMPTION ;;
    hidden: yes
    group_label: "Assumption"
  }

  dimension: opp_logo_coverage_assumption {
    type: number
    sql: ${TABLE}.OPP_LOGO_COVERAGE_ASSUMPTION ;;
    hidden: yes
    group_label: "Assumption"
  }

  dimension: pipeline_arr_coverage_assumption {
    type: number
    sql: ${TABLE}.PIPELINE_ARR_COVERAGE_ASSUMPTION ;;
    hidden: yes
    group_label: "Assumption"
  }

  dimension: avg_quota_achievement_assumption {
    type: number
    sql: ${TABLE}.AVG_QUOTA_ACHIEVEMENT_ASSUMPTION ;;
    hidden: yes
    group_label: "Assumption"
  }

  dimension: percent_fed_logos_assumption {
    type: number
    sql: ${TABLE}.PERCENT_FED_LOGOS_ASSUMPTION ;;
    hidden: yes
    group_label: "Assumption"
  }

  dimension: percent_comm_logos_assumption {
    type: number
    sql: ${TABLE}.PERCENT_COMM_LOGOS_ASSUMPTION ;;
    hidden: yes
    group_label: "Assumption"
  }

  dimension: percent_ent_logos_assumption {
    type: number
    sql: ${TABLE}.PERCENT_ENT_LOGOS_ASSUMPTION ;;
    hidden: yes
    group_label: "Assumption"
  }

  dimension: asp_fed_assumption {
    type: number
    sql: ${TABLE}.ASP_FED_ASSUMPTION ;;
    hidden: yes
    group_label: "Assumption"
  }

  dimension: asp_comm_assumption {
    type: number
    sql: ${TABLE}.ASP_COMM_ASSUMPTION ;;
    hidden: yes
    group_label: "Assumption"
  }

  dimension: asp_ent_assumption {
    type: number
    sql: ${TABLE}.ASP_ENT_ASSUMPTION ;;
    hidden: yes
    group_label: "Assumption"
  }

  dimension: avg_sales_cyle_fed_assumption {
    type: number
    sql: ${TABLE}.AVG_SALES_CYLE_FED_ASSUMPTION ;;
    hidden: yes
    group_label: "Assumption"
  }

  dimension: avg_sales_cycle_comm_assumption {
    type: number
    sql: ${TABLE}.AVG_SALES_CYCLE_COMM_ASSUMPTION ;;
    hidden: yes
    group_label: "Assumption"
  }

  dimension: avg_sales_cycle_ent_assumption {
    type: number
    sql: ${TABLE}.AVG_SALES_CYCLE_ENT_ASSUMPTION ;;
    hidden: yes
    group_label: "Assumption"
  }

  dimension: fed_expansion_assumption {
    type: number
    sql: ${TABLE}.FED_EXPANSION_ASSUMPTION ;;
    hidden: yes
    group_label: "Assumption"
  }

  dimension: comm_expansion_assumption {
    type: number
    sql: ${TABLE}.COMM_EXPANSION_ASSUMPTION ;;
    hidden: yes
    group_label: "Assumption"
  }

  dimension: ent_expansion_assumption {
    type: number
    sql: ${TABLE}.ENT_EXPANSION_ASSUMPTION ;;
    hidden: yes
    group_label: "Assumption"
  }

  dimension: comm_bdr_quota_opps_assumption {
    type: number
    sql: ${TABLE}.COMM_BDR_QUOTA_OPPS_ASSUMPTION ;;
    hidden: yes
    group_label: "Assumption"
  }

  dimension: comm_bdr_quota_pipeline_assumption {
    type: number
    sql: ${TABLE}.COMM_BDR_QUOTA_PIPELINE_ASSUMPTION ;;
    hidden: yes
    group_label: "Assumption"
  }

  dimension: comm_bdr_logos_assumption {
    type: number
    sql: ${TABLE}.COMM_BDR_LOGOS_ASSUMPTION ;;
    hidden: yes
    group_label: "Assumption"
  }

  dimension: comm_bdr_new_arr_assumption {
    type: number
    sql: ${TABLE}.COMM_BDR_NEW_ARR_ASSUMPTION ;;
    hidden: yes
    group_label: "Assumption"
  }

  dimension: ent_fed_bdr_quota_opps_assumption {
    type: number
    sql: ${TABLE}.ENT_FED_BDR_QUOTA_OPPS_ASSUMPTION ;;
    hidden: yes
    group_label: "Assumption"
  }

  dimension: ent_fed_bdr_quota_pipeline_assumption {
    type: number
    sql: ${TABLE}.ENT_FED_BDR_QUOTA_PIPELINE_ASSUMPTION ;;
    hidden: yes
    group_label: "Assumption"
  }

  dimension: fed_ae_quota_opps_assumption {
    type: number
    sql: ${TABLE}.FED_AE_QUOTA_OPPS_ASSUMPTION ;;
    hidden: yes
    group_label: "Assumption"
  }

  dimension: fed_ae_quota_pipeline_assumption {
    type: number
    sql: ${TABLE}.FED_AE_QUOTA_PIPELINE_ASSUMPTION ;;
    hidden: yes
    group_label: "Assumption"
  }

  dimension: fed_ae_quota_logos_assumption {
    type: number
    sql: ${TABLE}.FED_AE_QUOTA_LOGOS_ASSUMPTION ;;
    hidden: yes
    group_label: "Assumption"
  }

  dimension: fed_ae_quota_arr_assumption {
    type: number
    sql: ${TABLE}.FED_AE_QUOTA_ARR_ASSUMPTION ;;
    hidden: yes
    group_label: "Assumption"
  }

  dimension: comm_ae_quota_opps_assumption {
    type: number
    sql: ${TABLE}.COMM_AE_QUOTA_OPPS_ASSUMPTION ;;
    hidden: yes
    group_label: "Assumption"
  }

  dimension: comm_ae_quota_pipeline_assumption {
    type: number
    sql: ${TABLE}.COMM_AE_QUOTA_PIPELINE_ASSUMPTION ;;
    hidden: yes
    group_label: "Assumption"
  }

  dimension: comm_ae_logos_assumption {
    type: number
    sql: ${TABLE}.COMM_AE_LOGOS_ASSUMPTION ;;
    hidden: yes
    group_label: "Assumption"
  }

  dimension: comm_ae_new_arr_assumption {
    type: number
    sql: ${TABLE}.COMM_AE_NEW_ARR_ASSUMPTION ;;
    hidden: yes
    group_label: "Assumption"
  }

  dimension: ent_ae_quota_opps_assumption {
    type: number
    sql: ${TABLE}.ENT_AE_QUOTA_OPPS_ASSUMPTION ;;
    hidden: yes
    group_label: "Assumption"
  }

  dimension: ent_ae_quota_pipeline_assumption {
    type: number
    sql: ${TABLE}.ENT_AE_QUOTA_PIPELINE_ASSUMPTION ;;
    hidden: yes
    group_label: "Assumption"
  }

  dimension: ent_ae_logos_assumption {
    type: number
    sql: ${TABLE}.ENT_AE_LOGOS_ASSUMPTION ;;
    hidden: yes
    group_label: "Assumption"
  }

  dimension: ent_ae_new_arr_assumption {
    type: number
    sql: ${TABLE}.ENT_AE_NEW_ARR_ASSUMPTION ;;
    hidden: yes
    group_label: "Assumption"
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

  measure: total_federal_bdr_pipeline_amount {
    type: sum
    sql:  ${federal_bdr_pipeline_amount} ;;
    group_label: "Pipeline"
    label: "Federal BDR Pipeline Amount"
    group_item_label: "Federal BDR Amount"
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

  measure: total_federal_bdr_created {
    type: sum
    sql:  ${federal_bdr_created} ;;
    group_label: "Pipeline"
    label: "Federal BDR Pipeline Count"
    group_item_label: "Federal BDR Count"
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

  measure: total_federal_bdr_new_logo {
    type: sum
    sql:  ${federal_bdr_new_logo} ;;
    group_label: "New Logo"
    label: "Federal BDR New Logo Count"
    group_item_label: "Federal BDR New Logo"
  }

  measure: total_commercial_bdr_new_logo {
    type: sum
    sql:  ${commercial_bdr_new_logo} ;;
    group_label: "New Logo"
    label: "Commercial BDR New Logo Count"
    group_item_label: "Commercial BDR New Logo"
  }

  measure: total_enterprise_bdr_new_logo {
    type: sum
    sql:  ${enterprise_bdr_new_logo} ;;
    group_label: "New Logo"
    label: "Enterprise BDR New Logo Count"
    group_item_label: "Enterprise BDR New Logo"
  }

  measure: total_perc_federal_new_logo {
    type: number
    sql:  1.0*${total_federal_new_logo}/nullif(${total_count_new_logo},0) ;;
    group_label: "New Logo"
    label: "Federal New Logo %"
    group_item_label: "Federal New %"
    value_format_name: percent_1
  }

  measure: total_perc_commercial_new_logo {
    type: number
    sql:  1.0*${total_commercial_new_logo}/nullif(${total_count_new_logo},0) ;;
    group_label: "New Logo"
    label: "Commercial New Logo %"
    group_item_label: "Commercial New %"
    value_format_name: percent_1
  }

  measure: total_perc_enterprise_new_logo {
    type: number
    sql:  1.0*${total_enterprise_new_logo}/nullif(${total_count_new_logo},0) ;;
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

  measure: total_federal_bdr_arr {
    type: sum
    sql:  ${federal_bdr_arr} ;;
    group_label: "ARR"
    label: "Federal BDR ARR"
    group_item_label: "Federal BDR"
    value_format_name: usd_0
  }

  measure: total_commercial_bdr_arr {
    type: sum
    sql:  ${commercial_bdr_arr} ;;
    group_label: "ARR"
    label: "Commercial BDR ARR"
    group_item_label: "Commercial BDR"
    value_format_name: usd_0
  }

  measure: total_enterprise_bdr_arr {
    type: sum
    sql:  ${enterprise_bdr_arr} ;;
    group_label: "ARR"
    label: "Enterprise BDR ARR"
    group_item_label: "Enterprise BDR"
    value_format_name: usd_0
  }

  measure: total_federal_m18_arr {
    type: sum
    sql:  ${federal_m18_arr} ;;
    group_label: "ARR"
    label: "Federal M18 ARR"
    group_item_label: "Federal M18"
    value_format_name: usd_0
  }

  measure: total_commercial_m18_arr {
    type: sum
    sql:  ${commercial_m18_arr} ;;
    group_label: "ARR"
    label: "Commercial M18 ARR"
    group_item_label: "Commercial M18"
    value_format_name: usd_0
  }

  measure: total_enterprise_m18_arr {
    type: sum
    sql:  ${enterprise_m18_arr} ;;
    group_label: "ARR"
    label: "Enterprise M18 ARR"
    group_item_label: "Enterprise M18"
    value_format_name: usd_0
  }


  measure: total_federal_m18_perc {
    type: number
    sql:  ${total_federal_m18_arr}/nullif(${total_federal_arr},0) ;;
    group_label: "ARR"
    label: "Federal M18 %"
    group_item_label: "Federal M18 %"
    value_format_name: percent_1
  }

  measure: total_commercial_m18_perc {
    type: number
    sql:  ${total_commercial_m18_arr}/nullif(${total_commercial_arr},0) ;;
    group_label: "ARR"
    label: "Commercial M18 %"
    group_item_label: "Commercial M18 %"
    value_format_name: percent_1
  }

  measure: total_enterprise_m18_perc {
    type: number
    sql:  ${total_enterprise_m18_arr}/nullif(${total_enterprise_arr},0) ;;
    group_label: "ARR"
    label: "Enterprise M18 %"
    group_item_label: "Enterprise M18 %"
    value_format_name: percent_1
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
    value_format_name: decimal_2
  }

  measure: average_commercial_age {
    type: number
    sql:  (1.0*${total_commercial_age}/nullif(${total_commercial_new_logo},0))/30 ;;
    group_label: "Avg Sales Cycle"
    label: "Commercial Avg Sales Cycle"
    group_item_label: "Commercial"
    value_format_name: decimal_2
  }

  measure: average_enterprise_age {
    type: number
    sql:  (1.0*${total_enterprise_age}/nullif(${total_enterprise_new_logo},0))/30 ;;
    group_label: "Avg Sales Cycle"
    label: "Enterprise Avg Sales Cycle"
    group_item_label: "Enterprise"
    value_format_name: decimal_2
  }

  measure: total_run_rate_assumption {
    sql: ${run_rate_assumption} ;;
    type: sum
    group_label: "Key Assumptions"
  }

  measure: total_budget_assumption {
    sql: ${budget_assumption} ;;
    type: sum
    group_label: "Key Assumptions"
  }

  measure: total_cpl_assumption {
    sql: ${cpl_assumption} ;;
    type: sum
    group_label: "Key Assumptions"
  }

  measure: total_traffic_lead_assumption {
    sql: ${traffic_lead_assumption} ;;
    type: sum
    group_label: "Key Assumptions"
  }

  measure: total_lead_mql_assumption {
    sql: ${lead_mql_assumption} ;;
    type: sum
    group_label: "Key Assumptions"
  }

  measure: total_mql_sal_assumption {
    sql: ${mql_sal_assumption} ;;
    type: sum
    group_label: "Key Assumptions"
  }

  measure: total_sal_sql_assumption {
    sql: ${sal_sql_assumption} ;;
    type: sum
    group_label: "Key Assumptions"
  }

  measure: total_sql_opp_assumption {
    sql: ${sql_opp_assumption} ;;
    type: sum
    group_label: "Key Assumptions"
  }

  measure: total_opp_newlogo_assumption {
    sql: ${opp_newlogo_assumption} ;;
    type: sum
    group_label: "Key Assumptions"
    value_format_name: decimal_2
  }

  measure: total_lead_mql_coverage_assumption {
    sql: ${lead_mql_coverage_assumption} ;;
    label: "Lead:MQL Coverage Assumption"
    type: sum
    group_label: "Key Assumptions"
    value_format_name: decimal_2
  }

  measure: total_mql_sal_coverage_assumption {
    sql: ${mql_sal_coverage_assumption} ;;
    label: "MQL:SAL Coverage Assumption"
    type: sum
    group_label: "Key Assumptions"
    value_format_name: decimal_2
  }

  measure: total_sal_sql_coverage_assumption {
    sql: ${sal_sql_coverage_assumption} ;;
    label: "SAL:SQL Coverage Assumption"
    type: sum
    group_label: "Key Assumptions"
    value_format_name: decimal_2
  }

  measure: total_sql_opp_coverage_assumption {
    sql: ${sql_opp_coverage_assumption} ;;
    label: "SQL:Oppt Coverage Assumption"
    type: sum
    group_label: "Key Assumptions"
    value_format_name: decimal_2
  }

  measure: total_opp_logo_coverage_assumption {
    sql: ${opp_logo_coverage_assumption} ;;
    label: "Oppt:New Logo Coverage Assumption"
    type: sum
    group_label: "Key Assumptions"
    value_format_name: decimal_2
  }

  measure: total_pipeline_arr_coverage_assumption {
    sql: ${pipeline_arr_coverage_assumption} ;;
    label: "Pipeline:ARR Coverage Assumption"
    type: sum
    group_label: "Key Assumptions"
    value_format_name: decimal_2
  }

  measure: total_avg_quota_achievement_assumption {
    sql: ${avg_quota_achievement_assumption} ;;
    label: "Quota AttainmEnterprise Assumption"
    type: sum
    group_label: "Key Assumptions"
  }

  measure: total_percent_fed_logos_assumption {
    sql: ${percent_fed_logos_assumption} ;;
    label: "Federal Logo AttainmEnterprise Assumption"
    type: sum
    group_label: "Key Assumptions"
  }

  measure: total_percent_comm_logos_assumption {
    sql: ${percent_comm_logos_assumption} ;;
    label: "Commercial Logo AttainmEnterprise Assumption"
    type: sum
    group_label: "Key Assumptions"
  }

  measure: total_percent_ent_logos_assumption {
    sql: ${percent_ent_logos_assumption} ;;
    label: "Enterprise Logo AttainmEnterprise Assumption"
    type: sum
    group_label: "Key Assumptions"
  }

  measure: total_asp_fed_assumption {
    sql: ${asp_fed_assumption} ;;
    label: "Federal ASP Assumption"
    type: sum
    group_label: "Key Assumptions"
    value_format_name: usd_0
  }

  measure: total_asp_comm_assumption {
    sql: ${asp_comm_assumption} ;;
    label: "Commercial ASP Assumption"
    type: sum
    group_label: "Key Assumptions"
    value_format_name: usd_0
  }

  measure: total_asp_ent_assumption {
    sql: ${asp_ent_assumption} ;;
    label: "Enterprise ASP Assumption"
    type: sum
    group_label: "Key Assumptions"
    value_format_name: usd_0
  }

  measure: total_avg_sales_cyle_fed_assumption {
    sql: ${avg_sales_cyle_fed_assumption} ;;
    label: "Sales Cycle Assumption"
    type: sum
    group_label: "Key Assumptions"
  }

  measure: total_avg_sales_cycle_comm_assumption {
    sql: ${avg_sales_cycle_comm_assumption} ;;
    label: "Commercial Sales Cycle Assumption"
    type: sum
    group_label: "Key Assumptions"
  }

  measure: total_avg_sales_cycle_ent_assumption {
    sql: ${avg_sales_cycle_ent_assumption} ;;
    label: "Enterprise Sales Cycle Assumption"
    type: sum
    group_label: "Key Assumptions"
  }

  measure: total_fed_expansion_assumption {
    label: "Federal Sales Cycle Assumption"
    sql: ${fed_expansion_assumption} ;;
    type: sum
    group_label: "Key Assumptions"
    value_format_name: percent_1
  }

  measure: total_comm_expansion_assumption {
    label: "Commercial Expansion Assumption"
    sql: ${comm_expansion_assumption} ;;
    type: sum
    group_label: "Key Assumptions"
    value_format_name: percent_1
  }

  measure: total_ent_expansion_assumption {
    label: "Enterprise Expansion Assumption"
    sql: ${ent_expansion_assumption} ;;
    type: sum
    group_label: "Key Assumptions"
    value_format_name: percent_1
  }

  measure: total_comm_bdr_quota_opps_assumption {
    label: "Commercial BRD Quota Assumption"
    sql: ${comm_bdr_quota_opps_assumption} ;;
    type: sum
    group_label: "Key Assumptions"
  }

  measure: total_comm_bdr_quota_pipeline_assumption {
    label: "Commercial BRD Pipeline Assumption"
    sql: ${comm_bdr_quota_pipeline_assumption} ;;
    type: sum
    group_label: "Key Assumptions"
  }

  measure: total_comm_bdr_logos_assumption {
    label: "Commercial BRD Logos Assumption"
    sql: ${comm_bdr_logos_assumption} ;;
    type: sum
    group_label: "Key Assumptions"
  }

  measure: total_comm_bdr_new_arr_assumption {
    label: "Commercial BRD New ARR Assumption"
    sql: ${comm_bdr_new_arr_assumption} ;;
    type: sum
    group_label: "Key Assumptions"
  }

  measure: total_ent_fed_bdr_quota_opps_assumption {
    sql: ${ent_fed_bdr_quota_opps_assumption} ;;
    type: sum
    group_label: "Key Assumptions"
  }

  measure: total_ent_fed_bdr_quota_pipeline_assumption {
    sql: ${ent_fed_bdr_quota_pipeline_assumption} ;;
    type: sum
    group_label: "Key Assumptions"
  }

  measure: total_fed_ae_quota_opps_assumption {
    sql: ${fed_ae_quota_opps_assumption} ;;
    type: sum
    group_label: "Key Assumptions"
  }

  measure: total_fed_ae_quota_pipeline_assumption {
    sql: ${fed_ae_quota_pipeline_assumption} ;;
    label: "Federal Pipeline Assumption"
    type: sum
    group_label: "Key Assumptions"
  }

  measure: total_fed_ae_quota_logos_assumption {
    sql: ${fed_ae_quota_logos_assumption} ;;
    label: "Federal New Logo Quota Assumption"
    type: sum
    group_label: "Key Assumptions"
    value_format_name: percent_1
  }

  measure: total_fed_ae_quota_arr_assumption {
    sql: ${fed_ae_quota_arr_assumption} ;;
    label: "Federal New ARR Assumption"
    type: sum
    group_label: "Key Assumptions"
  }

  measure: total_comm_ae_quota_opps_assumption {
    sql: ${comm_ae_quota_opps_assumption} ;;
    label: "Commercial Opportunities Assumption"
    type: sum
    group_label: "Key Assumptions"
  }

  measure: total_comm_ae_quota_pipeline_assumption {
    sql: ${comm_ae_quota_pipeline_assumption} ;;
    label: "Commercial Pipeline Quota Assumption"
    type: sum
    group_label: "Key Assumptions"
  }

  measure: total_comm_ae_logos_assumption {
    sql: ${comm_ae_logos_assumption} ;;
    label: "Commercial New Logo Quota Assumption"
    type: sum
    group_label: "Key Assumptions"
    value_format_name: percent_1
  }

  measure: total_comm_ae_new_arr_assumption {
    sql: ${comm_ae_new_arr_assumption} ;;
    label: "Commercial New ARR Assumption"
    type: sum
    group_label: "Key Assumptions"
  }

  measure: total_ent_ae_quota_opps_assumption {
    sql: ${ent_ae_quota_opps_assumption} ;;
    label: "Enterprise Opportunities Assumption"
    type: sum
    group_label: "Key Assumptions"
  }

  measure: total_ent_ae_quota_pipeline_assumption {
    sql: ${ent_ae_quota_pipeline_assumption} ;;
    label: "Enterprise Pipeline Quota Assumption"
    type: sum
    group_label: "Key Assumptions"
  }

  measure: total_ent_ae_logos_assumption {
    sql: ${ent_ae_logos_assumption} ;;
    label: "Enterprise New Logo Quota Assumption"
    type: sum
    group_label: "Key Assumptions"
    value_format_name: percent_1
  }

  measure: total_ent_ae_new_arr_assumption {
    sql: ${ent_ae_new_arr_assumption} ;;
    label: "Enterprise New ARR Assumption"
    type: sum
    group_label: "Key Assumptions"
  }

}
