view: account_health_score {
  sql_table_name: "CS"."ACCOUNT_HEALTH_SCORE"
    ;;

  dimension: account_sfid {
    hidden: yes
    primary_key: yes
    type: string
    sql: ${TABLE}."ACCOUNT_SFID" ;;
  }

  dimension: risk_override_score {
    type: number
    sql: ${TABLE}."RISK_OVERRIDE_SCORE" ;;
  }

  dimension: count_tickets_prev_90 {
    description: "Number of tickets a customer has logged in last 90 days"
    label: "# of Tickets Prev 90 Days"
    type: number
    sql: ${TABLE}."COUNT_TICKETS_PREV_90" ;;
  }

  dimension: days_since_last_task {
    group_label: "Tasks"
    description: "Days since a call, email, or notes were added at the activity level in Salesforce on a cusotmer account"
    type: number
    sql: ${TABLE}."DAYS_SINCE_LAST_TASK" ;;
  }

  dimension: last_task_under_30 {
    description: "Customer call, email, or notes were logged at the activity level in Salesforce in the last 30 days on a customer account"
    group_label: "Tasks"
    label: "Last Task <= 30 Days Ago"
    type: yesno
    sql: ${days_since_last_task} <= 30;;
  }

  dimension: last_task_over_30 {
    group_label: "Tasks"
    description: "Customer activity has not been logged in over 30 days at the activity level in Salesforce on a customer account"
    label: "Last Task > 30 Days Ago"
    type: yesno
    sql: ${days_since_last_task} > 30;;
  }

  dimension: last_task_over_90 {
    description: "Customer activity has not been logged in over 90 days at the activity level in Salesforce on a customer account"
    group_label: "Tasks"
    label: "Last Task > 90 Days Ago"
    type: yesno
    sql: ${days_since_last_task} > 90;;
  }

  dimension: health_score {
    description: "Customer health score based on key metrics: Tenure, License End Date, # of Tickets Logged, Activities logged in SFDC and Oppty risk status in SFDC"
    label: "Health Score"
    type: number
    sql: ${TABLE}.health_score_w_override ;;
  }

  dimension: health_score_tier {
    label: "Health Score Big Tier"
    description: "Health Score buckted into groups of 10"
    type: tier
    style: integer
    tiers: [10, 20, 30, 40, 50, 60, 70, 80, 90]
    sql: ${health_score} ;;
  }

  dimension: health_score_no_override {
    label: "Health Score (No Risk Override)"
    hidden: yes
    type: number
    sql: ${TABLE}.health_score_no_override ;;
  }

  dimension: tenure_health_score_tier {
    description: "Tenure health score in buckets of 5"
    group_label: "Tenure"
    type: tier
    style: integer
    tiers: [5, 10, 15, 20, 25]
    sql: ${tenure_health_score} ;;
  }

  dimension: license_end_date_health_score_tier {
    description: "License end date health score in buckets of 5"
    group_label: "License End"
    group_item_label: "Health Score Tier"
    label: "License End Health Score Tier"
    type: tier
    style: integer
    tiers: [5, 10, 15, 20, 25]
    sql: ${license_end_date_health_score} ;;
  }

  dimension: task_health_score_tier {
    description: "Task health score in buckets of 5"
    group_label: "Tasks"
    type: tier
    style: integer
    tiers: [5, 10, 15, 20, 25]
    sql: ${task_health_score} ;;
  }

  dimension: ticket_health_score_tier {
    description: "# of tickets logged health score in buckets of 5"
    group_label: "Tickets"
    type: tier
    style: integer
    tiers: [5, 10, 15, 20, 25]
    sql: ${ticket_health_score} ;;
  }

  dimension_group: license_end {
    group_label: "License End"
    type: time
    timeframes: [
      date,
      month,
      fiscal_quarter,
      fiscal_year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."LICENSE_END_DATE" ;;
  }

  dimension: license_end_date_health_score {
    description: "Score based on license end date.  License End <= 15 Days From Now: 10%, License End Between 16-30 Days From Now: 25%, License End Between 31-60 Days From Now: 75%, License End Between 61-90 Days From Now: 90%
, License End > 90 Days From Now: 100%."
    group_label: "License End"
    group_item_label: "Health Score"
    label: "License End Health Score"
    type: number
    sql: ${TABLE}."LICENSE_END_DATE_HEALTH_SCORE" ;;
  }

  dimension: task_health_score {
    description: "Score based on customer activities logged in SFDC in 90 day period. Days Since Most Recent Task >= 90: 25%, Days Since Most Recent Task Between 60-90: 50%, Days Since Most Recent Task Between 30-60: 75%, Days Since Most Recent Task <= 30: 100% "
    group_label: "Tasks"
    type: number
    sql: ${TABLE}."TASK_HEALTH_SCORE" ;;
  }

  dimension: tenure_health_score {
    description: "Score based on lenght of time as a enterprise customer. Tenure <= 0.5 Years: 10%, Tenure Between 0.5-1 Years: 50%, Tenure Between 1-2 Years: 75%, Tenure > 2 Years: 100%"
    group_label: "Tenure"
    type: number
    sql: ${TABLE}."TENURE_HEALTH_SCORE" ;;
  }

  dimension: tenure_in_yrs {
    group_label: "Tenure"
    type: number
    sql: ${TABLE}."TENURE_IN_YRS" ;;
  }

  dimension: ticket_health_score {
    description: "Score based on # of tickets logged in Zendesk in 90 day period.Count of Tickets Past 90 Days >= 5: 25%, Count of Tickets Past 90 Days = 0: 50%, Count of Tickets Past 90 Days Between 3-4: 75%, Count of Tickets Past 90 Days Between 1-2: 100%"
    group_label: "Tickets"
    type: number
    sql: ${TABLE}."TICKET_HEALTH_SCORE" ;;
  }

  measure: count_accounts {
    label: "# of Accounts"
    type: count_distinct
    sql: ${account_sfid} ;;
    drill_fields: [account.name,account_csm.name,health_score,tenure_in_yrs,tenure_health_score,license_end_date,license_end_date_health_score,
                   ticket_health_score,days_since_last_task,task_health_score]
  }

  measure: count_last_task_under_30 {
    group_label: "Tasks"
    label: "# Accounts w/ Last Task <= 30 days"
    type: count_distinct
    sql: ${account_sfid} ;;
    filters: {
      field: last_task_under_30
      value: "yes"
    }
    drill_fields: [account.name, account_csm.name, days_since_last_task]
  }

  measure: count_last_task_over_30 {
    group_label: "Tasks"
    label: "# Accounts w/ Last Task > 30 days"
    type: count_distinct
    sql: ${account_sfid} ;;
    filters: {
      field: last_task_over_30
      value: "yes"
    }
    drill_fields: [account.name, account_csm.name, days_since_last_task]
  }

  measure: count_last_task_over_90 {
    group_label: "Tasks"
    label: "# Accounts w/ Last Task > 90 days"
    type: count_distinct
    sql: ${account_sfid} ;;
    filters: {
      field: last_task_over_90
      value: "yes"
    }
    drill_fields: [account.name, account_csm.name, days_since_last_task]
  }

measure: accounts_under_51_health_score {
  label: "High Risk Customers"
  description: "The count of 'High-Risk' Accounts with (Account Health Score <= 50)."
  type: count_distinct
  sql: ${account_sfid} ;;
  filters: [health_score: "<= 50"]
  drill_fields: [account.name, account_csm.name, health_score, days_since_last_task, tenure_health_score, ticket_health_score, license_end_date_health_score]
}

  measure: accounts_between_51_to_75_health_score {
    label: "Medium Risk Customers"
    description: "The count of 'Medium-Risk' Accounts (Account Health Score between 51 and 75)."
    type: count_distinct
    sql: ${account_sfid} ;;
    filters: [health_score: "> 50 AND <= 75"]
    drill_fields: [account.name, account_csm.name, health_score, days_since_last_task, tenure_health_score, ticket_health_score, license_end_date_health_score]
 }

  measure: accounts_over_75_health_score {
    label: "Low Risk Customers"
    description: "The count of 'Low-Risk' Accounts (Account Health Score > 75)."
    type: count_distinct
    sql: ${account_sfid} ;;
    filters: [health_score: "> 75"]
    drill_fields: [account.name, account_csm.name,health_score, days_since_last_task, tenure_health_score, ticket_health_score, license_end_date_health_score]
  }

  measure: avg_health_score {
    label: "Average Health Score"
    type: average_distinct
    value_format: "0"
    sql: ${health_score} ;;
  }
}
