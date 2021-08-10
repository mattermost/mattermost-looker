view: marketing_funnel {
  sql_table_name: "SALES"."MARKETING_FUNNEL";;

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

  dimension: count_new_business_opportunity_creation {
    type: number
    sql: ${TABLE}."COUNT_NEW_BUSINESS_OPPORTUNITY_CREATION" ;;
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

  measure: total_count_web_traffic {
    label: "Web Traffic (Unique Visitors)"
    type: sum
    sql: ${count_web_traffic} ;;
  }


  measure: total_count_lead_creation {
    label: "Leads Created"
    type: sum
    sql: ${count_lead_creation} ;;
  }

  measure: total_count_mql {
    label: "MQLs"
    type: sum
    sql: ${count_mql} ;;
  }

  measure: total_count_sal {
    label: "SALs"
    type: sum
    sql: ${count_sal} ;;
  }

  measure: total_count_sql {
    label: "SQLs"
    type: sum
    sql: ${count_sql} ;;
  }

  measure: total_count_new_business_opportunity_creation {
    label: "New Business Opportunities Created"
    type: sum
    sql: ${count_new_business_opportunity_creation} ;;
  }

  measure: total_pipeline_amount {
    label: "Pipeline Created"
    type: sum
    sql: ${pipeline_amount} ;;
  }

  measure: total_count_new_logo {
    label: "New Logos"
    type: sum
    sql: ${count_new_logo} ;;
  }

  measure: total_arr {
    label: "New ARR"
    type: sum
    sql: ${arr} ;;
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
    sql: ${total_count_sql}/nullif(${total_count_new_business_opportunity_creation},0) ;;
    value_format_name: decimal_2
  }

  measure: oppt_to_newlogo_ratio {
    group_label: "Coverage Rates"
    label: "Oppt:New Logo Coverage Rate (X:1)"
    group_item_label: "7. Oppt:New Logo Coverage Rate (X:1)"
    type: number
    sql: ${total_count_new_business_opportunity_creation}/nullif(${total_count_new_logo},0) ;;
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

}
