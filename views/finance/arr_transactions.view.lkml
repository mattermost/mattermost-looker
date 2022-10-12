# The name of this view in Looker is "Arr Transactions"
view: arr_transactions {
  sql_table_name: "FINANCE"."ARR_TRANSACTIONS"
    ;;

dimension: unique_key {
  primary_key: yes
  type: string
  description: "Unique identifier of an arr transaction"
  sql: ${TABLE}."UNIQUE_KEY" ;;
}

dimension: parent_name {
  description: "Parent name of a child account"
  type: string
  hidden: yes
  sql: ${TABLE}."PARENT_NAME" ;;
}

dimension: parent {
  description: "Parent name of child account"
  type: string
  sql: split_part(${parent_name},'-',1) ;;
}

dimension: parent_id {
  description: "Parent ID of parent account name"
  type: string
  sql: ${TABLE}."PARENT_ID" ;;
}

dimension: child_no {
  description: "Numeric sequence of child account created based on cohort month"
  type:  number
  sql: ${TABLE}."CHILD_NO" ;;
}

dimension: account_name {
  description: "Account name of child account"
  type: string
  sql: ${TABLE}."ACCOUNT_NAME" ;;
}

dimension: account_id {
  description: "Account id of child account"
  type: string
  sql: ${TABLE}."ACCOUNT_ID" ;;
}

measure: active_licenses {
  description: "Active licenses per latest opportunity closed"
  type:  sum
  sql: ${TABLE}."ACTIVE_LICENSES" ;;
}

measure: active_arr_value {
  description: "Latest value of active licenses per account id of current month end"
  type: sum
  sql: ${TABLE}."ACTIVE_ARR" ;;
}

dimension: opportunity_id {
  type: string
  description: "Opportunity SFID of closed won ARR"
  hidden: yes
  sql: ${TABLE}."OPPORTUNITY_ID";;
}

dimension: opportunity_sfid {
  type: string
  description: "Opportunity SFID"
  sql: iff(${opportunity_id} is null,'Expiry',${opportunity_id}) ;;
}

dimension: product {
  type: string
  sql: ${TABLE}."PRODUCT";;
}

dimension: plan {
  type: string
  hidden: yes
  sql: ${TABLE}."PLAN" ;;
}

dimension: plan_type {
  type: string
  sql: upper(${plan}) ;;
}

dimension: fiscal_yr {
  type: string
  sql: ${TABLE}."FISCAL_YEAR"::varchar ;;
}

dimension: fiscal_qtr {
  type: string
  sql:${TABLE}."FISCAL_QUARTER"::varchar  ;;
}

dimension: report_mo {
  type: string
  sql: ${TABLE}."REPORT_MONTH"::varchar ;;
}

  dimension: report_date {
    type: date
    datatype: date
    sql: ${TABLE}."REPORT_DATE" ;;
  }

  dimension: report_wk {
    type: string
    sql: ${TABLE}."REPORT_WEEK"::varchar ;;
  }

  dimension: report_day {
    type: date
    datatype: date
    sql: ${TABLE}."REPORT_DATE" ;;
  }

  dimension: closing_date {
    type: date
    datatype: date
    sql: ${TABLE}."CLOSING_DATE" ;;
  }

  dimension: license_start {
    type: date
    datatype: date
    sql: ${TABLE}."LICENSE_START_DATE" ;;
  }

  dimension: license_end {
    type: date
    datatype: date
    sql: ${TABLE}."LICENSE_END_DATE" ;;
  }

  dimension: new_logo {
    type: string
    description: "New Logo as defined by the first transaction of an account id/child account if part of parent id"
    sql: ${TABLE}."NEWLOGO" ;;
  }

  dimension: trans_no {
    description: "Transaction sequence by account id based on report_month and closing date"
    type: number
    sql: ${TABLE}."TRANS_NO" ;;
  }

  dimension: opp_type {
    description: "Opportunity type as described on salesforce"
    type: string
    sql: ${TABLE}."OPP_TYPE" ;;
  }

  dimension: term_months {
    description: "Term length of license"
    type: number
    sql: ${TABLE}."TERM_MONTHS" ;;
  }

  measure: tcv {
    description: "Total Contract Value won and signed"
    type: sum
    sql: ${TABLE}."BILLING_AMT" ;;
  }

  measure: 1st_yr_bill {
    description: "Estimated billing amount of 1st year"
    type: sum
    sql:  ${TABLE}."FIRST_YR_BILL" ;;
  }

  measure: opportunity_arr {
    description: "ARR component of TCV"
    type: sum
    sql:  ${TABLE}."OPPORTUNITY_ARR" ;;
  }

  measure: expire_arr {
    description: "ARR expired on license end date + 1"
    type: sum
    sql:  ${TABLE}."EXPIRE_ARR" ;;
  }

  measure: renew_arr {
    description: "ARR renewed but may include expansion or contraction"
    type: sum
    sql:  ${TABLE}."RENEW_ARR" ;;
  }

  measure: arr_change {
    description: "ARR delta as a result of the transaction.  Equal to New ARR less Expiry. Cumulative sum is outstanding ARR"
    type: sum
    sql:  ${TABLE}."ARR_CHANGE" ;;
  }

  dimension: ending_arr {
    description: "Ending ARR of an account id for the period "
    type: number
    sql:  ${TABLE}."ENDING_ARR" ;;
  }

  measure: new_arr {
    description: "New ARR signed for an account id for the period "
    hidden: yes
    type: sum
    sql:  ${TABLE}."NEW_ARR" ;;
  }

  dimension: description {
    description: "SFDC opportunity description"
    type: string
    sql: ${TABLE}."DESCRIPTION" ;;
  }

  dimension: government {
    type: string
    sql: ${TABLE}."GOVERNMENT" ;;
  }

  dimension: tier {
    type: string
    sql: ${TABLE}."CUSTOMER_TIER" ;;
  }

  dimension: company_type {
    type: string
    sql: ${TABLE}."COMPANY_TYPE" ;;
  }

  dimension: co_size {
    type: string
    sql: ${TABLE}."COSIZE" ;;
  }

  dimension: industry {
    type: string
    sql: ${TABLE}."INDUSTRY" ;;
  }

  dimension: geo {
    type: string
    sql: ${TABLE}."GEO";;
  }

  dimension: country {
    type: string
    sql: ${TABLE}."COUNTRY" ;;
  }

  dimension: health_score {
    type: string
    sql: ${TABLE}."HEALTH_SCORE" ;;
  }

  dimension: account_owner {
    type: string
    sql: ${TABLE}."ACCOUNT_OWNER" ;;
  }

  dimension: opportunity_owner {
    type: string
    sql: ${TABLE}."OPPORTUNITY_OWNER" ;;
  }

  dimension: account_start {
    type: date_month
    description: "Month Year the account id started as a paying customer of Mattermost"
    datatype: date
    sql: ${TABLE}."ACCOUNT_START" ;;
  }

  dimension: max_license {
    type: date_month
    datatype: date
    description: "Maximum license end date account id has signed up for"
    sql: ${TABLE}."MAX_LICENSE" ;;
  }

  dimension: beg_tenure_yr {
    type: number
    description: "Tenure yr account id has with Mattermost based on license start date"
    sql: ${TABLE}."BEG_TENURE_YR" ;;
  }
  dimension: end_tenure_yr {
    type: number
    description: "Tenure yr account id has with Mattermost based on license end date"
    sql: ${TABLE}."END_TENURE_YR" ;;
  }
}
