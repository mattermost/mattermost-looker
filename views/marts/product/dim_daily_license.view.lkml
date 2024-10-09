view: dim_daily_license {
  sql_table_name: "MART_PRODUCT".dim_daily_license ;;
  label: "* License: Daily Telemetry Information"


  dimension: daily_server_id {
    type: string
    sql: ${TABLE}.daily_server_id ;;
    primary_key: yes
    hidden: yes
  }

  dimension: license_id {
    type: string
    sql: ${TABLE}.license_id ;;
    description: "The license's unique identifier."
  }

  dimension: company_name {
    type: string
    sql: ${TABLE}.company_name ;;
    description: "The name of the company. Available only if license information is reported in CWS, Legacy or Salesforce."
  }

  dimension: contact_email {
    type: string
    sql: ${TABLE}.contact_email ;;
    description: "The contact email attached to the license. Available only if license information is reported in CWS or legacy."
  }

  dimension: customer_id {
    type: string
    sql: ${TABLE}.customer_id ;;
    description: "The id of the customer assigned to the license. Taken from telemetry data."
  }

  dimension: sku_short_name {
    type: string
    sql: ${TABLE}.sku_short_name ;;
    description: "The SKU for the license or `Unknown` if it's not known (i.e. in legacy licenses)."
  }

  dimension: license_name {
    type: string
    sql: ${TABLE}.license_name ;;
    description: "The name of the current license."
  }

  dimension: licensed_seats {
    type: number
    sql: ${TABLE}.licensed_seats ;;
    description: " The number of licensed seats for the current license."
  }

  dimension: is_trial {
    type: yesno
    sql: ${TABLE}.is_trial ;;
    label: "Is trial?"
    description: "Whether the license is a trial license or not."
  }

  dimension: has_license_expired {
    type: yesno
    sql: ${TABLE}.has_license_expired ;;
    label: "Has license expired?"
  }

  dimension: salesforce_account_arr {
    type: number
    sql: ${TABLE}.salesforce_account_arr ;;
    label: "Arr (Salesforce)"
    description: "Arr (Salesforce)"
  }

  ### Dates

  dimension_group: issued {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.issued_at ;;
    description: "The date and time the license was issued at."
  }

  dimension_group: starts {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.starts_at ;;
    description: "The date and time the license started at."
  }

  dimension_group: expire {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.expire_at ;;
    description: "The date and time the license expires at."
  }

  ###
  ### Metadata
  ###

  dimension: in_cws {
    type: yesno
    sql: ${TABLE}.in_cws ;;
    label: "In CWS?"
    description: "Whether the license also appears in CWS."
  }

  dimension: in_legacy {
    type: yesno
    sql: ${TABLE}.in_legacy ;;
    label: "In Legacy?"
    description: "Whether the license also appears in legacy data."
  }

  dimension: in_salesforce {
    type: yesno
    sql: ${TABLE}.in_salesforce ;;
    label: "In Salesforce?"
    description: "Whether the license also appears in Salesforce."
  }

  ###
  ### Measures
  ###

  measure: total_licensed_seats {
    type: sum
    sql: ${licensed_seats} ;;
    description: "The total number of licensed seats."
  }
}
