view: financial_statement_2 {
  sql_table_name: "FINANCE"."FINANCIAL_STATEMENT_2";;

  dimension: period {
    type: string
    sql: ${TABLE}."PERIOD" ;;
  }

  dimension: period_fiscal_year {
    type: string
    sql: CASE WHEN ${period_type} = 'Fiscal Quarter' THEN util.fiscal_year(util.fiscal_quarter_start(${period}))
              WHEN ${period_type} = 'Fiscal Quarter' THEN ${period}
         ELSE 'Unknown' END;;
  }

  dimension: period_status {
    label: "Period Completed?"
    type: yesno
    sql: ${TABLE}."PERIOD_STATUS" = 'completed';;
  }

  dimension: period_type {
    description: "Month, Fiscal Quarter, or Fiscal Year"
    type: string
    sql: CASE WHEN ${TABLE}."PERIOD_TYPE" = 'fiscal_quarter' THEN 'Fiscal Quarter'
              WHEN ${TABLE}."PERIOD_TYPE" = 'fiscal_year' THEN 'Fiscal Year'
         ELSE 'Unknown' END;;
  }

  measure: arr_yoy_growth {
    label: "ARR YoY Growth"
    type: sum
    sql: ${TABLE}."ARR_YOY_GROWTH" ;;
    value_format_name: percent_0
  }

  measure: asp {
    label: "ASP - New ARR/New Customers  ($k)"
    type: sum
    sql: ${TABLE}."ASP" ;;
    value_format_name: usd_0
  }

  measure: cac {
    label: "CAC - S&M spend/# new customers ($k)"
    type: sum
    sql: ${TABLE}."CAC" ;;
    value_format_name: usd_0
  }

  measure: cash_balance {
    label: "Cash Balance ($k)"
    type: sum
    sql: ${TABLE}."CASH_BALANCE" ;;
    value_format_name: usd_0
  }

  measure: cash_burn_adj_for_financings {
    label: "Cash Burn Adj. for Financings ($k)"
    type: sum
    sql: ${TABLE}."CASH_BURN_ADJ_FOR_FINANCINGS" ;;
    value_format_name: usd_0
  }

  measure: cash_runway_months {
    label: "Cash Runway Months (End of Period)"
    type: sum
    sql: ${TABLE}."CASH_RUNWAY_MONTHS" ;;
    value_format_name: usd_0
  }

  measure: cogs {
    label: "COGS ($k)"
    type: sum
    sql: ${TABLE}."COGS" ;;
    value_format_name: usd_0
  }

  measure: contract_churn_arr {
    label: "Contraction/Churn ARR ($k)"
    type: sum
    sql: ${TABLE}."CONTRACT_CHURN_ARR" ;;
    value_format_name: usd_0
  }

  measure: g_and_a {
    label: "G&A ($k)"
    type: sum
    sql: ${TABLE}."G_AND_A" ;;
    value_format_name: usd_0
  }

  measure: g_and_a_2 {
    label: "G&A "
    type: sum
    sql: ${TABLE}."G_AND_A_2" ;;
    value_format_name: percent_0
  }

  measure: gross_margin {
    label: "Gross Margin"
    type: sum
    sql: ${TABLE}."GROSS_MARGIN" ;;
    value_format_name: percent_0
  }

  measure: gross_margin_2 {
    label: "Gross Margin "
    type: sum
    sql: ${TABLE}."GROSS_MARGIN_2" ;;
    value_format_name: percent_0
  }

  measure: gross_profit {
    label: "Gross Profit ($k)"
    type: sum
    sql: ${TABLE}."GROSS_PROFIT" ;;
    value_format_name: usd_0
  }

  measure: ltv_cac {
    label: "LTV:CAC"
    type: sum
    sql: ${TABLE}."LTV_CAC" ;;
    value_format_name: decimal_0
  }

  measure: magic_number_gm_burdened {
    label: "Magic Number (GM Burdened)"
    type: sum
    sql: ${TABLE}."MAGIC_NUMBER_GM_BURDENED" ;;
    value_format_name: decimal_2
  }

  measure: new_exp_arr {
    label: "New + Expansion ARR ($k)"
    type: sum
    sql: ${TABLE}."NEW_EXP_ARR" ;;
    value_format_name: usd_0
  }

  measure: new_exp_arr_yoy_growth {
    label: "New + Expansion ARR YoY Growth"
    type: sum
    sql: ${TABLE}."NEW_EXP_ARR_YOY_GROWTH" ;;
    value_format_name: percent_0
  }

  measure: operating_loss {
    label: "Operating Loss ($k)"
    type: sum
    sql: ${TABLE}."OPERATING_LOSS" ;;
    value_format_name: usd_0
  }

  measure: operating_stats {
    label: "Operating Stats"
    type: string
    sql: '' ;;
  }

  measure: payback_months_not_gm_burdened {
    label: "Payback Months (Not GM Burdened)"
    type: sum
    sql: ${TABLE}."PAYBACK_MONTHS_NOT_GM_BURDENED" ;;
    value_format_name: decimal_0
  }

  measure: r_and_d {
    label: "R&D ($k)"
    type: sum
    sql: ${TABLE}."R_AND_D" ;;
    value_format_name: usd_0
  }

  measure: r_and_d_2 {
    label: "R&D "
    type: sum
    sql: ${TABLE}."R_AND_D_2" ;;
    value_format_name: percent_0
  }

  measure: revenue {
    label: "Revenue ($k)"
    type: sum
    sql: ${TABLE}."REVENUE" ;;
    value_format_name: usd_0
  }

  measure: revenue_per_staff_member {
    label: "Revenue per Staff Member ($k)"
    type: sum
    sql: ${TABLE}."REVENUE_PER_STAFF_MEMBER" ;;
    value_format_name: usd_0
  }

  measure: revenue_yoy_growth {
    label: "Revenue YoY Growth"
    type: sum
    sql: ${TABLE}."REVENUE_YOY_GROWTH" ;;
    value_format_name: percent_0
  }

  measure: s_and_m {
    label: "S&M ($k)"
    type: sum
    sql: ${TABLE}."S_AND_M" ;;
    value_format_name: usd_0
  }

  measure: s_and_m_2 {
    label: "S&M "
    type: sum
    sql: ${TABLE}."S_AND_M_2" ;;
    value_format_name: percent_0
  }

  measure: total_arr {
    label: "Total ARR ($k)"
    type: sum
    sql: ${TABLE}."TOTAL_ARR" ;;
    value_format_name: usd_0
  }

  measure: total_arr_qoq_growth {
    label: "Total ARR QoQ Growth"
    type: sum
    sql: ${TABLE}."TOTAL_ARR_QOQ_GROWTH" ;;
    value_format_name: percent_0
  }

  measure: total_arr_yoy_growth {
    label: "Total ARR YoY Growth"
    type: sum
    sql: ${TABLE}."TOTAL_ARR_YOY_GROWTH" ;;
    value_format_name: percent_0
  }

  measure: total_opex {
    label: "Total OpEx ($k)"
    type: sum
    sql: ${TABLE}."TOTAL_OPEX" ;;
    value_format_name: usd_0
  }

  measure: blank_line_1 {
    hidden: yes
    label: " "
    type: string
    sql: '' ;;
  }

  measure: blank_line_2 {
    hidden: yes
    label: "  "
    type: string
    sql: '' ;;
  }

  measure: blank_line_3 {
    hidden: yes
    label: "   "
    type: string
    sql: '' ;;
  }

  measure: blank_line_4 {
    hidden: yes
    label: "    "
    type: string
    sql: '' ;;
  }

  measure: blank_line_5 {
    hidden: yes
    label: "     "
    type: string
    sql: '' ;;
  }

  measure: blank_line_6 {
    hidden: yes
    label: "      "
    type: string
    sql: '' ;;
  }

  measure: blank_line_7 {
    hidden: yes
    label: "       "
    type: string
    sql: '' ;;
  }

  measure: blank_line_8 {
    hidden: yes
    label: "        "
    type: string
    sql: '' ;;
  }

  measure: blank_line_9 {
    hidden: yes
    label: "          "
    type: string
    sql: '' ;;
  }

  measure: blank_line_10 {
    hidden: yes
    label: "           "
    type: string
    sql: '' ;;
  }

  measure: blank_line_11 {
    hidden: yes
    label: "            "
    type: string
    sql: '' ;;
  }
}
