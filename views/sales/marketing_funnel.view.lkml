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
    type: sum
    sql: ${count_web_traffic} ;;
  }


  measure: total_count_lead_creation {
    type: sum
    sql: ${count_lead_creation} ;;
  }

  measure: total_count_mql {
    type: sum
    sql: ${count_mql} ;;
  }

  measure: total_count_sal {
    type: sum
    sql: ${count_sal} ;;
  }

  measure: total_count_sql {
    type: sum
    sql: ${count_sql} ;;
  }

  measure: total_count_new_business_opportunity_creation {
    type: sum
    sql: ${count_new_business_opportunity_creation} ;;
  }

  measure: total_pipeline_amount {
    type: sum
    sql: ${pipeline_amount} ;;
  }

  measure: total_count_new_logo {
    type: sum
    sql: ${count_new_logo} ;;
  }

  measure: total_arr {
    type: sum
    sql: ${arr} ;;
  }

  measure: webtraffic_to_lead_ratio {
    label: "Web Traffic:Lead Coverage Rate (X:1)"
    type: number
    sql: ${total_count_web_traffic}/nullif(${total_count_lead_creation},0) ;;
    value_format_name: decimal_2
  }

  measure: lead_to_mql_ratio {
    label: "Lead:MQL Coverage Rate (X:1)"
    type: number
    sql: ${total_count_lead_creation}/nullif(${total_count_mql},0) ;;
    value_format_name: decimal_2
  }

  measure: mql_to_sal_ratio {
    label: "MQL:SAL Coverage Rate (X:1)"
    type: number
    sql: ${total_count_mql}/nullif(${total_count_sal},0) ;;
    value_format_name: decimal_2
  }

  measure: sal_to_sql_ratio {
    label: "SAL:SQL Coverage Rate (X:1)"
    type: number
    sql: ${total_count_sal}/nullif(${total_count_sql},0) ;;
    value_format_name: decimal_2
  }

  measure: sql_to_oppt_ratio {
    label: "SQL:Oppt Coverage Rate (X:1)"
    type: number
    sql: ${total_count_sql}/nullif(${total_count_new_business_opportunity_creation},0) ;;
    value_format_name: decimal_2
  }

  measure: oppt_to_newlogo_ratio {
    label: "Oppt:New Logo Coverage Rate (X:1)"
    type: number
    sql: ${total_count_new_business_opportunity_creation}/nullif(${total_count_new_logo},0) ;;
    value_format_name: decimal_2
  }

  measure: pipeline_to_arr_ratio {
    label: "Pipeline:ARR Coverage Rate (X:1)"
    type: number
    sql: ${total_pipeline_amount}/nullif(${total_arr},0) ;;
    value_format_name: decimal_2
  }

}
