view: financial_statements {
  sql_table_name: "FINANCE"."FINANCIAL_STATEMENTS";;


  dimension: period {
    type: string
    sql: ${TABLE}."PERIOD" ;;
  }

  dimension: period_fiscal_year {
    type: string
    sql: CASE WHEN ${period_type} = 'Month' THEN util.fiscal_year((${period}||-01)::date)
              WHEN ${period_type} = 'Fiscal Quarter' THEN util.fiscal_year(util.fiscal_quarter_start(${period}))
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
    sql: CASE WHEN ${TABLE}."PERIOD_TYPE" = 'month' THEN 'Month'
              WHEN ${TABLE}."PERIOD_TYPE" = 'fiscal_quarter' THEN 'Fiscal Quarter'
              WHEN ${TABLE}."PERIOD_TYPE" = 'fiscal_year' THEN 'Fiscal Year'
         ELSE 'Unknown' END;;
  }

  measure: account_payable_and_accrued_expenses {
    type: sum
    sql: ${TABLE}."ACCOUNT_PAYABLE_AND_ACCRUED_EXPENSES" / 1000;;
    group_label: "Liabilities & Stockholders' Equity"
    label: "Accounts Payable and Accrued Expenses ($k)"
    group_item_label: " 1. Accounts Payable and Accrued Expenses"
    value_format_name: usd_0
  }

  measure: accounts_payable_accrued_liabilities_and_other_liabilities {
    type: sum
    sql: ${TABLE}."ACCOUNTS_PAYABLE_ACCRUED_LIABILITIES_AND_OTHER_LIABILITIES" / 1000;;
    group_label: "Operating Activities"
    label: " -    Accounts Payable, Accrued Liabilities & Other Liabilities ($k)"
    group_item_label: "10. Accounts Payable, Accrued Liabilities & Other Liabilities"
    value_format_name: usd_0
  }

  measure: accounts_receivable_and_unbilled_revenue {
    type: sum
    sql: ${TABLE}."ACCOUNTS_RECEIVABLE_AND_UNBILLED_REVENUE" / 1000;;
    group_label: "Assets"
    label: "Accounts Receivable & Unbilled Revenue ($k)"
    group_item_label: " 2. Accounts Receivable & Unbilled Revenue"
    value_format_name: usd_0
  }

  measure: accounts_receivable_net {
    type: sum
    sql: ${TABLE}."ACCOUNTS_RECEIVABLE_NET" / 1000;;
    group_label: "Operating Activities"
    label: " -    Accounts receivable, Net ($k)"
    group_item_label: " 8. Accounts receivable, Net"
    value_format_name: usd_0
  }

  measure: accum_amortization {
    type: sum
    sql: ${TABLE}."ACCUM_AMORTIZATION" / 1000;;
    group_label: "Assets"
    label: "Accum Amortization ($k)"
    group_item_label: "10. Accum Amortization"
    value_format_name: usd_0
  }

  measure: accum_depreciation {
    type: sum
    sql: ${TABLE}."ACCUM_DEPRECIATION" / 1000;;
    group_label: "Assets"
    label: "Accum Depreciation ($k)"
    group_item_label: " 7. Accum Depreciation"
    value_format_name: usd_0
  }

  measure: bad_debt_expense {
    type: sum
    sql: ${TABLE}."BAD_DEBT_EXPENSE" / 1000;;
    group_label: "Operating Activities"
    label: " -    Bad Debt Expense ($k)"
    group_item_label: " 6. Bad Debt Expense"
    value_format_name: usd_0
  }

  measure: cash {
    type: sum
    sql: ${TABLE}."CASH" / 1000;;
    group_label: "Assets"
    label: "Cash ($k)"
    group_item_label: " 1. Cash"
    value_format_name: usd_0
  }

  measure: cash_bop {
    type: sum
    sql: ${TABLE}."CASH_BOP" / 1000;;
    group_label: "Totals"
    label: "Cash - Beginning of Period ($k)"
    group_item_label: " 2. Cash - Beginning of Period"
    value_format_name: usd_0
  }

  measure: cash_eop {
    type: sum
    sql: ${TABLE}."CASH_EOP" / 1000;;
    group_label: "Totals"
    label: "Cash - End of Period ($k)"
    group_item_label: " 3. Cash - End of Period"
    value_format_name: usd_0
  }

  measure: change_in_apic_due_to_reclass {
    type: sum
    sql: ${TABLE}."CHANGE_IN_APIC_DUE_TO_RECLASS" / 1000;;
    group_label: "Financing Activities"
    label: "Change in APIC Due to Reclass ($k)"
    group_item_label: " 4. Change in APIC Due to Reclass"
    value_format_name: usd_0
  }

  measure: cost_of_sales {
    type: sum
    sql: ${TABLE}."COST_OF_SALES" / 1000;;
    group_label: "Income Statement"
    label: "Cost of Sales ($k)"
    group_item_label: " 2. Cost of Sales"
    value_format_name: usd_0
  }

  measure: current_assets {
    type: sum
    sql: ${TABLE}."CURRENT_ASSETS" / 1000;;
    description: "Sum of Cash, Accounts Receivable & Unbilled Revenue, Prepaid Expense, and Prepaid Commissions"
    group_label: "Assets"
    label: "Current Assets ($k)"
    group_item_label: " 5. Current Assets"
    value_format_name: usd_0
  }

  measure: current_liabilities {
    type: sum
    sql: ${TABLE}."CURRENT_LIABILITIES" / 1000;;
    description: "Sum of Accounts Payable & Accrued Expenses and Deferred Revenues"
    group_label: "Liabilities & Stockholders' Equity"
    label: "Current Liabilities ($k)"
    group_item_label: " 3. Current Liabilities"
    value_format_name: usd_0
  }

  measure: deferred_revenue {
    type: sum
    sql: ${TABLE}."DEFERRED_REVENUE" / 1000;;
    group_label: "Operating Activities"
    label: " -    Deferred Revenue ($k)"
    group_item_label: "11. Deferred Revenue"
    value_format_name: usd_0
  }

  measure: deferred_revenues {
    type: sum
    sql: ${TABLE}."DEFERRED_REVENUES" / 1000;;
    group_label: "Liabilities & Stockholders' Equity"
    label: "Deferred Revenues ($k)"
    group_item_label: " 2. Deferred Revenues"
    value_format_name: usd_0
  }

  measure: depreciation_and_amortization {
    type: sum
    sql: ${TABLE}."DEPRECIATION_AND_AMORTIZATION" / 1000;;
    group_label: "Operating Activities"
    label: " -    Depreciation & Amortization ($k)"
    group_item_label: " 3. Depreciation & Amortization"
    value_format_name: usd_0
  }

  measure: effect_of_exchange_rate_changes_on_cash {
    type: sum
    sql: ${TABLE}."EFFECT_OF_EXCHANGE_RATE_CHANGES_ON_CASH" / 1000;;
    label: "Effect of Exchange Rate Changes on Cash ($k)"
    value_format_name: usd_0
  }

  measure: fixed_assets {
    type: sum
    sql: ${TABLE}."FIXED_ASSETS" / 1000;;
    group_label: "Assets"
    label: "Fixed Assets ($k)"
    group_item_label: " 6. Fixed Assets"
    value_format_name: usd_0
  }

  measure: general_and_administrative {
    type: sum
    sql: ${TABLE}."GENERAL_AND_ADMINISTRATIVE" / 1000;;
    group_label: "Income Statement"
    label: "General & Administrative ($k)"
    group_item_label: " 6. General & Administrative"
    value_format_name: usd_0
  }

  measure: gross_profit {
    type: sum
    sql: ${TABLE}."GROSS_PROFIT" / 1000;;
    description: "Sum of Revenues Net and Cost of Sales"
    group_label: "Income Statement"
    label: "Gross Profit ($k)"
    group_item_label: " 3. Gross Profit"
    value_format_name: usd_0
  }

  measure: intangible_assets {
    type: sum
    sql: ${TABLE}."INTANGIBLE_ASSETS" / 1000;;
    group_label: "Assets"
    label: "Intangible Assets ($k)"
    group_item_label: " 9. Intangible Assets"
    value_format_name: usd_0
  }

  measure: interest_expense_accrued_expenses {
    type: sum
    sql: ${TABLE}."INTEREST_EXPENSE_ACCRUED_EXPENSES" / 1000;;
    group_label: "Operating Activities"
    label: " -    Interest Expense (Accrued Expenses) ($k)"
    group_item_label: " 4. Interest Expense (Accrued Expenses)"
    value_format_name: usd_0
  }

  measure: investment_in_sub {
    type: sum
    sql: ${TABLE}."INVESTMENT_IN_SUB" / 1000;;
    group_label: "Investing Activities"
    label: "Investment in Sub ($k)"
    group_item_label: " 3. Investment in Sub"
    value_format_name: usd_0
  }

  measure: long_term_liabilities {
    type: sum
    sql: ${TABLE}."LONG_TERM_LIABILITIES" / 1000;;
    group_label: "Liabilities & Stockholders' Equity"
    label: "Long-term Liabilities ($k)"
    group_item_label: " 4. Long-term Liabilities"
    value_format_name: usd_0
  }

  measure: net_cash_provided_by_financing_activities {
    type: sum
    sql: ${TABLE}."NET_CASH_PROVIDED_BY_FINANCING_ACTIVITIES" / 1000;;
    group_label: "Financing Activities"
    label: "Net Cash Provided by Financing Activities ($k)"
    value_format_name: usd_0
  }

  measure: net_cash_provided_by_used_in_operating_activities {
    type: sum
    sql: ${TABLE}."NET_CASH_PROVIDED_BY_USED_IN_OPERATING_ACTIVITIES" / 1000;;
    value_format_name: usd_0
    group_label: "Operating Activities"
    label: "Net Cash Provided by (Used in) Operating Activities ($k)"
  }

  measure: net_cash_used_in_investing_activities {
    type: sum
    sql: ${TABLE}."NET_CASH_USED_IN_INVESTING_ACTIVITIES" / 1000;;
    value_format_name: usd_0
    group_label: "Investing Activities"
    label: "Net Cash Used in Investing Activities ($k)"
  }

  measure: net_fixed_assets {
    type: sum
    sql: ${TABLE}."NET_FIXED_ASSETS" / 1000;;
    description: "Sum of Fixed Assets and Accum Depreciation"
    group_label: "Assets"
    label: "Net Fixed Assets ($k)"
    group_item_label: " 8. Net Fixed Assets"
    value_format_name: usd_0
  }

  measure: net_income {
    type: sum
    sql: ${TABLE}."NET_INCOME" / 1000;;
    group_label: "Income Statement"
    label: "Total Net Income ($k)"
    value_format_name: usd_0
  }

  measure: net_increase_decrease_in_cash {
    type: sum
    sql: ${TABLE}."NET_INCREASE_DECREASE_IN_CASH" / 1000;;
    group_label: "Totals"
    label: "Net Increase (Decrease) in Cash ($k)"
    group_item_label: " 1. Net Increase (Decrease) in Cash"
    value_format_name: usd_0
  }

  measure: net_intangibles {
    type: sum
    sql: ${TABLE}."NET_INTANGIBLES" / 1000;;
    description: "Sum of Intangible Assets and Accum Amortization"
    group_label:"Assets"
    label: "Net Intangibles ($k)"
    group_item_label: "11. Net Intangibles"
    value_format_name: usd_0
  }

  measure: net_loss {
    type: sum
    sql: ${TABLE}."NET_LOSS" / 1000;;
    group_label: "Operating Activities"
   label: "Net Loss ($k)"
    group_item_label: " 1. Net Loss"
    value_format_name: usd_0
  }

  measure: net_proceeds_from_issuance_of_common_stock {
    type: sum
    sql: ${TABLE}."NET_PROCEEDS_FROM_ISSUANCE_OF_COMMON_STOCK" / 1000;;
    group_label: "Financing Activities"
    label: "Net Proceeds From Issuance of Common Stock ($k)"
    group_item_label: " 5. Net Proceeds From Issuance of Common Stock"
    value_format_name: usd_0
  }

  measure: net_proceeds_from_issuance_of_convertible_preferred_stock {
    type: sum
    sql: ${TABLE}."NET_PROCEEDS_FROM_ISSUANCE_OF_CONVERTIBLE_PREFERRED_STOCK" / 1000;;
    group_label: "Financing Activities"
    label: "Net Proceeds From Issuance of Convertible Preferred Stock ($k)"
    group_item_label: " 1. Net Proceeds From Issuance of Convertible Preferred Stock"
    value_format_name: usd_0
  }

  measure: net_proceeds_from_series_a_preferred_stock {
    type: sum
    sql: ${TABLE}."NET_PROCEEDS_FROM_SERIES_A_PREFERRED_STOCK" / 1000;;
    value_format_name: usd_0
    group_label: "Financing Activities"
    label: "Net Proceeds From Series A Preferred Stock ($k)"
    group_item_label: " 2. Net Proceeds From Series A Preferred Stock"
  }

  measure: net_proceeds_from_series_b_preferred_stock {
    type: sum
    sql: ${TABLE}."NET_PROCEEDS_FROM_SERIES_B_PREFERRED_STOCK" / 1000;;
    value_format_name: usd_0
    group_label: "Financing Activities"
    label: "Net Proceeds From Series B Preferred Stock ($k)"
    group_item_label: " 3. Net Proceeds From Series B Preferred Stock"
  }

  measure: operating_income_losses {
    type: sum
    sql: ${TABLE}."OPERATING_INCOME_LOSSES" / 1000;;
    group_label: "Income Statement"
    label: "Operating Income (Loss) ($k)"
    group_item_label: " 8. Operating Income (Loss)"
    value_format_name: usd_0
  }

  measure: operation_expenses {
    type: sum
    sql: ${TABLE}."OPERATION_EXPENSES" / 1000;;
    description: "Sum of Research & development, Sales & marketing, and General & administrative"
    group_label: "Income Statement"
    label: "Operating Expenses ($k)"
    group_item_label: " 7. Operating Expenses"
    value_format_name: usd_0
  }

  measure: adjustment_to_reconcile_net_loss_to_net_cash_provided_by_used_in_operating_activities {
    type: string
    sql: '' ;;
    description: "Adjustment to reconcile net loss to net cash provided by (used in) operating activities"
    group_label: "Operating Activities"
    label: "Adjustment to Reconcile Net Loss to Net Cash Provided by (Used in) Operating Activities ($k)"
    group_item_label: " 2. Adjustment to Reconcile Net Loss to Net Cash Provided by (Used in) Operating Activities"
    hidden: yes
    value_format_name: usd_0
  }

  measure: changes_in_operating_assets_and_liabilities {
    type: string
    sql: '' ;;
    description: "Changes in operating assets and liabilities"
    group_label: "Operating Activities"
    label: "Changes in Operating Assets and Liabilities ($k)"
    group_item_label: " 7. Changes in Operating Assets and Liabilities"
    hidden: yes
    value_format_name: usd_0
  }

  measure: other_assets {
    type: sum
    sql: ${TABLE}."OTHER_ASSETS" / 1000;;
    group_label: "Assets"
    label: "Other Assets ($k)"
    group_item_label: "12. Other Assets"
    value_format_name: usd_0
  }

  measure: other_income {
    type: sum
    sql: ${TABLE}."OTHER_INCOM" / 1000;;
    group_label: "Income Statement"
    label: "Operating Income ($k)"
    group_item_label: " 9. Operating Income"
    value_format_name: usd_0
  }

  measure: paid_in_capital {
    type: sum
    sql: ${TABLE}."PAID_IN_CAPITAL" / 1000;;
    group_label: "Liabilities & Stockholders' Equity"
    label: "Paid in Capital ($k)"
    group_item_label: " 7. Paid in Capital"
    value_format_name: usd_0
  }

  measure: prepaid_commissions {
    type: sum
    sql: ${TABLE}."PREPAID_COMMISSIONS" / 1000;;
    group_label: "Assets"
    label: "Prepaid Commissions ($k)"
    group_item_label: " 4. Prepaid Commissions"
    value_format_name: usd_0
  }

  measure: prepaid_expense {
    type: sum
    sql: ${TABLE}."PREPAID_EXPENSE" / 1000;;
    group_label: "Assets"
    label: "Prepaid Expense ($k)"
    group_item_label: " 3. Prepaid Expense"
    value_format_name: usd_0
  }

  measure: prepaid_expenses_and_other_assets {
    type: sum
    sql: ${TABLE}."PREPAID_EXPENSES_AND_OTHER_ASSETS" / 1000;;
    group_label: "Operating Activities"
    group_item_label: " 9. Prepaid Expenses & Other Assets"
    label: " -    Prepaid Expenses & Other Assets ($k)"
    value_format_name: usd_0
  }

  measure: purchases_of_intangible_assets {
    type: sum
    sql: ${TABLE}."PURCHASES_OF_INTANGIBLE_ASSETS" / 1000;;
    group_label: "Investing Activities"
    label: "Purchases of Intangible Assets ($k)"
    group_item_label: " 2. Purchases of Intangible Assets"
    value_format_name: usd_0
  }

  measure: purchases_of_property_and_equipment {
    type: sum
    sql: ${TABLE}."PURCHASES_OF_PROPERTY_AND_EQUIPMENT" / 1000;;
    group_label: "Investing Activities"
    label: "Purchases of Property & Equipment ($k)"
    group_item_label: " 1. Purchases of Property & Equipment"
    value_format_name: usd_0
  }

  measure: research_and_development {
    type: sum
    sql: ${TABLE}."RESEARCH_AND_DEVELOPMENT" / 1000;;
    group_label: "Income Statement"
    label: "Research & Development ($k)"
    group_item_label: " 4. Research & Development"
    value_format_name: usd_0
  }

  measure: retained_earnings {
    type: sum
    sql: ${TABLE}."RETAINED_EARNINGS" / 1000;;
    group_label: "Liabilities & Stockholders' Equity"
    label: "Retained Earnings ($k)"
    group_item_label: " 8. Retained Earnings"
    value_format_name: usd_0
  }

  measure: revenues_net {
    type: sum
    sql: ${TABLE}."REVENUES_NET" / 1000;;
    group_label: "Income Statement"
    label: "Revenues, Net ($k)"
    group_item_label: " 1. Revenues, Net"
    value_format_name: usd_0
  }

  measure: sales_and_marketing {
    type: sum
    sql: ${TABLE}."SALES_AND_MARKETING" / 1000;;
    group_label: "Income Statement"
    label: "Sales & Marketing ($k)"
    group_item_label: " 5. Sales & Marketing"
    value_format_name: usd_0
  }

  measure: stockholders_equity {
    type: sum
    sql: ${TABLE}."STOCKHOLDERS_EQUITY" / 1000;;
    group_label: "Liabilities & Stockholders' Equity"
    label: "Stockholders' Equity ($k)"
    group_item_label: " 6. Stockholders' Equity"
    value_format_name: usd_0
  }

  measure: total_assets {
    type: sum
    sql: ${TABLE}."TOTAL_ASSETS" / 1000;;
    group_label: "Assets"
    label: "Total Assets ($k)"
    value_format_name: usd_0
  }

  measure: total_liabilities {
    type: sum
    sql: ${TABLE}."TOTAL_LIABILITIES" / 1000;;
    group_label: "Liabilities & Stockholders' Equity"
    label: "Total Liabilities ($k)"
    group_item_label: " 5. Total Liabilities"
    value_format_name: usd_0
  }

  measure: total_liabilities_and_stockholders_equity {
    type: sum
    sql: ${TABLE}."TOTAL_LIABILITIES_AND_STOCKHOLDERS_EQUITY" / 1000;;
    group_label: "Liabilities & Stockholders' Equity"
    label: "Total Liabilities & Stockholders Equity ($k)"
    value_format_name: usd_0
  }

  measure: total_stockholders_equity {
    type: sum
    sql: ${TABLE}."TOTAL_STOCKHOLDERS_EQUITY" / 1000;;
    group_label: "Liabilities & Stockholders' Equity"
    label: "Stockholders' Equity ($k)"
    group_item_label: " 9. Total Stockholders' Equity"
    value_format_name: usd_0
  }

  measure: writeoffof_fully_depreciated_assets {
    type: sum
    sql: ${TABLE}."WRITEOFFOF_FULLY_DEPRECIATED_ASSETS" / 1000;;
    group_label: "Operating Activities"
    label: " -    Write-off of Fully Depreciated Assets ($k)"
    group_item_label: " 5. Write-off of Fully Depreciated Assets"
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
