view: account_daily_arr_deltas {
  sql_table_name: FINANCE.ACCOUNT_DAILY_ARR_DELTAS ;;

  filter: last_day_of_week {
    type: yesno
    description: "Filters so the ARR date is equal to the last day of each week (or if the current week then the last complete date recorded in the table). Useful when grouping by week to report on ARR at a weekly level."
    sql: CASE WHEN ${new_day_date} =
                                      CASE WHEN DATE_TRUNC('week', ${new_day_date}::date) = DATE_TRUNC('week', CURRENT_DATE) THEN (SELECT MAX(new_day) FROM FINANCE.ACCOUNT_DAILY_ARR_DELTAS)
                                        ELSE DATEADD(WEEK, 1, DATE_TRUNC('week',${new_day_date}::date)) - INTERVAL '1 DAY' END
          THEN TRUE ELSE FALSE END ;;
  }

  dimension: compound_primary {
    type: string
    sql: ${account_sfid}||${new_day_date} ;;
    primary_key: yes
    hidden: yes
  }

  dimension: last_and_next_12mo {
    label: "Last & Next 12 Mo."
    description: "ARR Date falls between 12 months ago and 12 months from now"
    sql: ${new_day_month} >= date_trunc('month',current_date()) - interval '12 month' AND ${new_day_month} <= date_trunc('month',current_date()) + interval '12 month'  ;;
    type: yesno
  }

  dimension: account_new_arr {
    label: "First Time ARR"
    description: "True when it is the first date an Account has ARR"
    type: yesno
    sql: ${TABLE}."ACCOUNT_NEW_ARR" ;;
  }

  dimension: account_sfid {
    hidden: yes
    type: string
    sql: ${TABLE}."ACCOUNT_SFID" ;;
    link: {
      label: "Salesforce Account Record"
      url: "https://mattermost.lightning.force.com/lightning/r/{{ value }}/view"
      icon_url: "https://mattermost.my.salesforce.com/favicon.ico"
    }
  }

  dimension: master_account_sfid {
    hidden: yes
    type: string
    sql: ${TABLE}."MASTER_ACCOUNT_SFID" ;;
    link: {
      label: "Salesforce Account Record"
      url: "https://mattermost.lightning.force.com/lightning/r/{{ value }}/view"
      icon_url: "https://mattermost.my.salesforce.com/favicon.ico"
    }
  }

  dimension_group: new_day {
    label: "ARR Day"
    type: time
    timeframes: [
      date,
      week,
      month,
      fiscal_quarter,
      fiscal_year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."NEW_DAY" ;;
  }

  dimension_group: previous_day {
    type: time
    timeframes: [
      date,
      week,
      month,
      fiscal_quarter,
      fiscal_year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."PREVIOUS_DAY" ;;
  }

  dimension: new_day_arr {
    label: "ARR on Day"
    hidden: yes
    type: number
    sql: ${TABLE}."NEW_DAY_TOTAL_ARR" ;;
    value_format_name: "usd_0"
  }

  dimension: previous_day_arr {
    label: "ARR on Previous Day"
    hidden: yes
    type: number
    sql: ${TABLE}."PREVIOUS_DAY_TOTAL_ARR" ;;
    value_format_name: "usd_0"
  }

  dimension: arr_delta {
    label: "ARR Change"
    description: "ARR on Day - Previous Day ARR"
    hidden: yes
    type: number
    sql: ${TABLE}."TOTAL_ARR_DELTA" ;;
    value_format_name: "usd_0"
    drill_fields: []
  }

  dimension: type_of_change {
    label: "Type of ARR Change"
    description: "Change is either Increase, Decrease, or No Change between date and previous day"
    type: string
    sql: CASE WHEN ${previous_day_arr} < ${new_day_arr} THEN 'Increase' WHEN ${previous_day_arr} > ${new_day_arr} THEN 'Decrease' ELSE 'No Change' END;;
    value_format_name: "usd_0"
    drill_fields: []
  }

  measure: new_day_total_arr {
    label: "Total ARR on Day"
    type: sum
    sql: ${new_day_arr} ;;
    value_format_name: "usd_0"
    group_label: "ARR"
    link: {
      label: "ARR Overview Dashboard"
      url: "https://mattermost.looker.com/dashboards/14"
    }
    drill_fields: [account.name, new_day_date, account_new_arr, new_day_total_arr, previous_day_arr, type_of_change, total_arr_delta]
  }

  measure: previous_day_total_arr {
    label: "Total ARR on Previous Day"
    type: sum
    sql: ${previous_day_arr} ;;
    value_format_name: "usd_0"
    group_label: "ARR"
    drill_fields: []
  }

  measure: total_arr_delta {
    label: "Total ARR Change"
    description: "ARR on Day - Previous Day ARR"
    type: sum
    sql: ${arr_delta} ;;
    value_format_name: "usd_0"
    group_label: "ARR"
    drill_fields: [account.name, new_day_date, account_new_arr, new_day_total_arr, previous_day_arr, type_of_change, total_arr_delta]
  }

  measure: expansion_arr {
    label: "Total Expansion ARR"
    description: "The sum of expansion ARR for all accounts w/ positive ARR change from the previous day: ARR on Day - Previous Day ARR."
    type: sum
    filters: [type_of_change: "Increase",previous_day_arr: ">0"]
    sql: ${arr_delta} ;;
    value_format_name: "usd_0"
    group_label: "ARR"
    drill_fields: [account.name, new_day_date, account_new_arr, new_day_total_arr, previous_day_arr, type_of_change, total_arr_delta]
  }

  measure: contraction_arr {
    label: "Total Contraction ARR"
    description: "The sum of contraction ARR for all accounts w/ negative ARR change from the previous day: ARR on Day - Previous Day ARR."
    type: sum
    filters: [type_of_change: "Decrease",new_day_arr: ">0"]
    sql: ${arr_delta} ;;
    value_format_name: "usd_0"
    group_label: "ARR"
    drill_fields: [account.name, new_day_date, account_new_arr, new_day_total_arr, previous_day_arr, type_of_change, total_arr_delta]
  }

  measure: churn_arr {
    label: "Total Churn ARR"
    description: "The sum of churned ARR for all accounts w/ negative ARR change from the previous day that now have ARR = $0: ARR on Day - Previous Day ARR."
    type: sum
    filters: [type_of_change: "Decrease",new_day_arr: "=0"]
    sql: ${arr_delta} ;;
    value_format_name: "usd_0"
    group_label: "ARR"
    drill_fields: [account.name, new_day_date, account_new_arr, new_day_total_arr, previous_day_arr, type_of_change, total_arr_delta]
  }

  measure: resurrection_arr {
    label: "Total Resurrection ARR"
    description: "The sum of resurrection ARR for all accounts w/ positive ARR on the current day that did not have ARR on the previous day, and that have been customers previously: ARR on Day - Previous Day ARR."
    type: sum
    filters: [type_of_change: "Increase",previous_day_arr: "=0",account_new_arr: "FALSE"]
    sql: ${arr_delta} ;;
    value_format_name: "usd_0"
    group_label: "ARR"
    drill_fields: [account.name, new_day_date, account_new_arr, new_day_total_arr, previous_day_arr, type_of_change, total_arr_delta]
  }

  measure: new_arr {
    label: "Total New ARR on Day"
    description: "The sum of new ARR on a given day. New ARR is ARR on the first date an Account has ARR."
    type: sum
    filters: [account_new_arr: "TRUE"]
    value_format_name: "usd_0"
    sql: ${new_day_arr} ;;
    group_label: "ARR"
    drill_fields: [account.name, new_day_date, account_new_arr, new_day_total_arr, previous_day_arr, type_of_change, total_arr_delta]
    }

  measure: customer_count {
    label: "Customers"
    description: "The count of distinct OrgM (Salesforce) Accounts that have > $0 ARR on a given day."
    type: count_distinct
    filters: [new_day_arr: ">0"]
    sql: ${account_sfid} ;;
    group_label: "Customer Counts"
    drill_fields: [account.name, new_day_date, account_new_arr, new_day_total_arr, previous_day_arr, type_of_change, total_arr_delta]
  }

  measure: new_customer_count {
    label: "New Customers"
    description: "The count of new, distinct OrgM (Salesforce) Accounts that have > $0 New ARR on a given day."
    type: count_distinct
    filters: [new_day_arr: ">0", account_new_arr: "TRUE"]
    sql: ${account_sfid} ;;
    group_label: "Customer Counts"
    drill_fields: [account.name, new_day_date, account_new_arr, new_day_total_arr, previous_day_arr, type_of_change, total_arr_delta]
  }

  measure: resurrected_customer_count {
    label: "Resurrected Customers"
    description: "The count of resurrected, distinct OrgM (Salesforce) Accounts that have > $0 New ARR on the given day, $0 ARR on the previous day, and have previously had >$0 ARR."
    type: count_distinct
    filters: [new_day_arr: ">0", account_new_arr: "FALSE", previous_day_arr: "0"]
    sql: ${account_sfid} ;;
    group_label: "Customer Counts"
    drill_fields: [account.name, new_day_date, account_new_arr, new_day_total_arr, previous_day_arr, type_of_change, total_arr_delta]
  }

  measure: lost_customer_count {
    label: "Churned Customers"
    description: "The count of churned, distinct OrgM (Salesforce) Accounts that have $0 ARR on a given day and >$0 ARR on the previous day."
    type: count_distinct
    filters: [type_of_change: "Decrease",new_day_arr: "=0"]
    sql: ${account_sfid} ;;
    group_label: "Customer Counts"
    drill_fields: [account.name, new_day_date, account_new_arr, new_day_total_arr, previous_day_arr, type_of_change, total_arr_delta]
  }
}
