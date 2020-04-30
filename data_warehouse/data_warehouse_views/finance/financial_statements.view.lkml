view: financial_statements {
  sql_table_name: "FINANCE"."FINANCIAL_STATEMENTS";;


  dimension_group: financial {
    type: time
    timeframes: [
      month,
      fiscal_quarter,
      fiscal_year
    ]
    sql: ${TABLE}."MONTH"::date ;;
  }

  measure: account_payable_and_accrued_expenses {
    type: sum
    sql: ${TABLE}."ACCOUNT_PAYABLE_AND_ACCRUED_EXPENSES" ;;
    group_label: "Liabilities & Stockholders' Equity"
    value_format_name: usd_0
  }

  measure: accounts_payable {
    type: sum
    sql: ${TABLE}."ACCOUNTS_PAYABLE" ;;
    value_format_name: usd_0
  }

  measure: accounts_receivable_and_unbilled_revenue {
    type: sum
    sql: ${TABLE}."ACCOUNTS_RECEIVABLE_AND_UNBILLED_REVENUE" ;;
    group_label: "Assets"
    value_format_name: usd_0
  }

  measure: accounts_receivable_net {
    type: sum
    sql: ${TABLE}."ACCOUNTS_RECEIVABLE_NET" ;;
    group_label: "Operating Activities"
    value_format_name: usd_0
  }

  measure: accrued_liabilities_and_other_liabilities {
    type: sum
    sql: ${TABLEvalue_format_name: usd_0}."ACCRUED_LIABILITIES_AND_OTHER_LIABILITIES" ;;
    value_format_name: usd_0
  }

  measure: accum_amortization {
    type: sum
    sql: ${TABLE}."ACCUM_AMORTIZATION" ;;
    group_label: "Assets"
    value_format_name: usd_0
  }

  measure: accum_depreciation {
    type: sum
    sql: ${TABLE}."ACCUM_DEPRECIATION" ;;
    group_label: "Assets"
    value_format_name: usd_0
  }

  measure: adjustment_reconcile_netloss_to_net_cash_provided_by_operating_activities {
    type: sum
    sql: ${TABLE}."ADJUSTMENT_RECONCILE_NETLOSS_TO_NET_CASH_PROVIDED_BY_OPERATING_ACTIVITIES" ;;
    group_label: "Operating Activities"
    value_format_name: usd_0
  }

  measure: cash {
    type: sum
    sql: ${TABLE}."CASH" ;;
    group_label: "Assets"
    value_format_name: usd_0
  }

  measure: cash_bop {
    type: sum
    sql: ${TABLE}."CASH_BOP" ;;
    value_format_name: usd_0
  }

  measure: cash_eop {
    type: sum
    sql: ${TABLE}."CASH_EOP" ;;
    value_format_name: usd_0
  }

  measure: change_in_apic_due_to_reclass {
    type: sum
    sql: ${TABLE}."CHANGE_IN_APIC_DUE_TO_RECLASS" ;;
    value_format_name: usd_0
  }

  measure: cost_of_sales {
    type: sum
    sql: ${TABLE}."COST_OF_SALES" ;;
    group_label: "Income Statement"
    value_format_name: usd_0
  }

  measure: current_assets {
    type: sum
    sql: ${TABLE}."CURRENT_ASSETS" ;;
    group_label: "Assets"
    value_format_name: usd_0
  }

  measure: current_liabilities {
    type: sum
    sql: ${TABLE}."CURRENT_LIABILITIES" ;;
    group_label: "Liabilities & Stockholders' Equity"
    value_format_name: usd_0
  }

  measure: deferred_revenue {
    type: sum
    sql: ${TABLE}."DEFERRED_REVENUE" ;;
    group_label: "Liabilities & Stockholders' Equity"
    value_format_name: usd_0
  }

  measure: deferred_revenues {
    type: sum
    sql: ${TABLE}."DEFERRED_REVENUES" ;;
    value_format_name: usd_0
  }

  measure: depreciation_and_amortization {
    type: sum
    sql: ${TABLE}."DEPRECIATION_AND_AMORTIZATION" ;;
    group_label: "Operating Activities"
    value_format_name: usd_0
  }

  measure: effect_of_exchange_rate_changes_on_cash {
    type: sum
    sql: ${TABLE}."EFFECT_OF_EXCHANGE_RATE_CHANGES_ON_CASH" ;;
    value_format_name: usd_0
  }

  measure: fixed_assets {
    type: sum
    sql: ${TABLE}."FIXED_ASSETS" ;;
    group_label: "Assets"
    value_format_name: usd_0
  }

  measure: general_and_administrative {
    type: sum
    sql: ${TABLE}."GENERAL_AND_ADMINISTRATIVE" ;;
    group_label: "Income Statement"
    value_format_name: usd_0
  }

  measure: gross_profit {
    type: sum
    sql: ${TABLE}."GROSS_PROFIT" ;;
    group_label: "Income Statement"
    value_format_name: usd_0
  }

  measure: intangible_assets {
    type: sum
    sql: ${TABLE}."INTANGIBLE_ASSETS" ;;
    group_label: "Assets"
    value_format_name: usd_0
  }

  measure: interest_expense_accrued_expenses {
    type: sum
    sql: ${TABLE}."INTEREST_EXPENSE_ACCRUED_EXPENSES" ;;
    group_label: "Operating Activities"
    value_format_name: usd_0
  }

  measure: investment_in_sub {
    type: sum
    sql: ${TABLE}."INVESTMENT_IN_SUB" ;;
    value_format_name: usd_0
  }

  measure: long_term_liabilities {
    type: sum
    sql: ${TABLE}."LONG_TERM_LIABILITIES" ;;
    group_label: "Liabilities & Stockholders' Equity"
    value_format_name: usd_0
  }

  measure: net_cash_provided_by_financing_activities {
    type: sum
    sql: ${TABLE}."NET_CASH_PROVIDED_BY_FINANCING_ACTIVITIES" ;;
    value_format_name: usd_0
  }

  measure: net_cash_provided_by_used_in_operating_activities {
    type: sum
    sql: ${TABLE}."NET_CASH_PROVIDED_BY_USED_IN_OPERATING_ACTIVITIES" ;;
    value_format_name: usd_0
  }

  measure: net_cash_used_in_investing_activities {
    type: sum
    sql: ${TABLE}."NET_CASH_USED_IN_INVESTING_ACTIVITIES" ;;
    value_format_name: usd_0
  }

  measure: net_fixed_assets {
    type: sum
    sql: ${TABLE}."NET_FIXED_ASSETS" ;;
    group_label: "Assets"
    value_format_name: usd_0
  }

  measure: net_income {
    type: sum
    sql: ${TABLE}."NET_INCOME" ;;
    group_label: "Income Statement"
    value_format_name: usd_0
  }

  measure: net_increase_decrease_in_cash {
    type: sum
    sql: ${TABLE}."NET_INCREASE_DECREASE_IN_CASH" ;;
    value_format_name: usd_0
  }

  measure: net_intangibles {
    type: sum
    sql: ${TABLE}."NET_INTANGIBLES" ;;
    value_format_name: usd_0
  }

  measure: net_loss {
    type: sum
    sql: ${TABLE}."NET_LOSS" ;;
    group_label: "Operating Activities"
    value_format_name: usd_0
  }

  measure: net_proceeds_from_issuance_of_common_stock {
    type: sum
    sql: ${TABLE}."NET_PROCEEDS_FROM_ISSUANCE_OF_COMMON_STOCK" ;;
    value_format_name: usd_0
  }

  measure: net_proceeds_from_series_a_preferred_stock {
    type: sum
    sql: ${TABLE}."NET_PROCEEDS_FROM_SERIES_A_PREFERRED_STOCK" ;;
    value_format_name: usd_0
  }

  measure: net_proceeds_from_series_b_preferred_stock {
    type: sum
    sql: ${TABLE}."NET_PROCEEDS_FROM_SERIES_B_PREFERRED_STOCK" ;;
    value_format_name: usd_0
  }

  measure: operating_income_losses {
    type: sum
    sql: ${TABLE}."OPERATING_INCOME_LOSSES" ;;
    group_label: "Income Statement"
    value_format_name: usd_0
  }

  measure: operation_expenses {
    type: sum
    sql: ${TABLE}."OPERATION_EXPENSES" ;;
    group_label: "Income Statement"
    value_format_name: usd_0
  }

  measure: other_assets {
    type: sum
    sql: ${TABLE}."OTHER_ASSETS" ;;
    group_label: "Assets"
    value_format_name: usd_0
  }

  measure: other_income {
    type: sum
    sql: ${TABLE}."OTHER_INCOM" ;;
    group_label: "Income Statement"
    value_format_name: usd_0
  }

  measure: paid_in_capital {
    type: sum
    sql: ${TABLE}."PAID_IN_CAPITAL" ;;
    group_label: "Liabilities & Stockholders' Equity"
    value_format_name: usd_0
  }

  measure: prepaid_commissions {
    type: sum
    sql: ${TABLE}."PREPAID_COMMISSIONS" ;;
    group_label: "Assets"
    value_format_name: usd_0
  }

  measure: prepaid_expense {
    type: sum
    sql: ${TABLE}."PREPAID_EXPENSE" ;;
    group_label: "Assets"
    value_format_name: usd_0
  }

  measure: prepaid_expenses_and_other_assets {
    type: sum
    sql: ${TABLE}."PREPAID_EXPENSES_AND_OTHER_ASSETS" ;;
    value_format_name: usd_0
  }

  measure: purchases_of_intangible_assets {
    type: sum
    sql: ${TABLE}."PURCHASES_OF_INTANGIBLE_ASSETS" ;;
    value_format_name: usd_0
  }

  measure: purchases_of_property_and_equipment {
    type: sum
    sql: ${TABLE}."PURCHASES_OF_PROPERTY_AND_EQUIPMENT" ;;
    value_format_name: usd_0
  }

  measure: research_and_development {
    type: sum
    sql: ${TABLE}."RESEARCH_AND_DEVELOPMENT" ;;
    group_label: "Income Statement"
    value_format_name: usd_0
  }

  measure: retained_earnings {
    type: sum
    sql: ${TABLE}."RETAINED_EARNINGS" ;;
    group_label: "Liabilities & Stockholders' Equity"
    value_format_name: usd_0
  }

  measure: revenues_net {
    type: sum
    sql: ${TABLE}."REVENUES_NET" ;;
    group_label: "Income Statement"
    value_format_name: usd_0
  }

  measure: sales_and_marketing {
    type: sum
    sql: ${TABLE}."SALES_AND_MARKETING" ;;
    group_label: "Income Statement"
    value_format_name: usd_0
  }

  measure: stockholders_equity {
    type: sum
    sql: ${TABLE}."STOCKHOLDERS_EQUITY" ;;
    value_format_name: usd_0
  }

  measure: total_assets {
    type: sum
    sql: ${TABLE}."TOTAL_ASSETS" ;;
    group_label: "Assets"
    value_format_name: usd_0
  }

  measure: total_liabilities {
    type: sum
    sql: ${TABLE}."TOTAL_LIABILITIES" ;;
    group_label: "Liabilities & Stockholders' Equity"
    value_format_name: usd_0
  }

  measure: total_liabilities_and_stockholders_equity {
    type: sum
    sql: ${TABLE}."TOTAL_LIABILITIES_AND_STOCKHOLDERS_EQUITY" ;;
    group_label: "Liabilities & Stockholders' Equity"
    value_format_name: usd_0
  }

  measure: total_stockholders_equity {
    type: sum
    sql: ${TABLE}."TOTAL_STOCKHOLDERS_EQUITY" ;;
    group_label: "Liabilities & Stockholders' Equity"
    value_format_name: usd_0
  }

  measure: writeoffof_fully_depreciated_assets {
    type: sum
    sql: ${TABLE}."WRITEOFFOF_FULLY_DEPRECIATED_ASSETS" ;;
    group_label: "Operating Activities"
    value_format_name: usd_0
  }

  measure: count {
    type: count
    drill_fields: []
    value_format_name: usd_0
  }
}
