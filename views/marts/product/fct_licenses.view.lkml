# The name of this view in Looker is "Fct Licenses"
view: fct_licenses {
  sql_table_name: "MART_PRODUCT".fct_licenses ;;
  label: "License: Information"

  dimension: license_id {
    type: string
    sql: ${TABLE}.license_id ;;
    primary_key: yes
    label: "License ID"
    description: "The ID of the license."
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


  dimension: sku_short_name {
    type: string
    sql: ${TABLE}.sku_short_name ;;
    description: "The SKU short name of the license. Available only if license information is reported in CWS or telemetry and is one of the expected valid values ('E10', 'E20',  'starter', 'professional', 'enterprise'). 'Unknown' if a value is not found."
  }

  dimension: license_name {
    type: string
    sql: ${TABLE}.license_name ;;
    description: "The name of the license. Available only if license information is reported in telemetry."
  }

  dimension: licensed_seats {
    type: number
    sql: ${TABLE}.licensed_seats ;;
    description: "The number of seats the license permits."
  }

  dimension: has_expired {
    type: yesno
    sql: ${TABLE}.has_expired ;;
    description: "Whether the license has expired (true if expiration date before today."
  }

  dimension: is_trial {
    type: yesno
    sql: ${TABLE}.is_trial ;;
    description: "Whether the license is a trial license. Available only if license is reported in CWS."
  }



  ###
  ### Coalesced dates
  ###


  dimension_group: starts_at {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: CAST(${TABLE}."STARTS_AT" AS TIMESTAMP_NTZ) ;;
    label: "Starts At"
  }


  dimension_group: expire_at {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: CAST(${TABLE}."EXPIRE_AT" AS TIMESTAMP_NTZ) ;;
    label: "Expires At"
  }


  ##
  ## Source Specific data
  ##

  ### CWS

  dimension: cws_licensed_seats {
    type: number
    sql: ${TABLE}.cws_licensed_seats ;;
    label: "Licensed Seats (CWS)"
    description: "The number of seats the license permits, as reported in CWS."
    view_label: "License: Source Data"
  }

  dimension_group: cws_starts {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.cws_starts ;;
    label: "Starts At (CWS)"
    description: "The license start date from CWS. Null if license doesn't exist in CWS."
    view_label: "License: Source Data"
  }


  dimension_group: cws_expire {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.cws_expire_at ;;
    label: "Expires At (CWS)"
    description: "The license expiration date from CWS. Null if license doesn't exist in CWS."
    view_label: "License: Source Data"
  }


  ### Legacy data

  dimension_group: legacy_starts {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.legacy_starts ;;
    label: "Starts At (Legacy)"
    description: "The license start date from Legacy license data. Null if license doesn't exist in Legacy data."
    view_label: "License: Source Data"
  }


  dimension_group: legacy_expire {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.legacy_expire ;;
    label: "Expires At (Legacy)"
    description: "The license expiration date from Legacy license data. Null if license doesn't exist in Legacy data."
    view_label: "License: Source Data"
  }


  ### Salesforce data

  dimension: salesforce_licensed_seats {
    type: number
    sql: ${TABLE}.salesforce_licensed_seats ;;
    label: "Licensed Seats (Salesforce)"
    description: "The number of seats the license permits, as reported in Salesforce."
    view_label: "License: Source Data"
 }

  dimension_group: salesforce_starts {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: CAST(${TABLE}.salesforce_starts AS TIMESTAMP_NTZ) ;;
    label: "Starts At (Salesforce)"
    description: "The license start date from Salesforce. Null if license doesn't exist in Salesforce."
    view_label: "License: Source Data"
  }

  dimension_group: salesforce_expire {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: CAST(${TABLE}.salesforce_expire AS TIMESTAMP_NTZ) ;;
    label: "Expires At (Salesforce)"
    description: "The license expiration date from Salesforce. Null if license doesn't exist in Salesforce."
    view_label: "License: Source Data"
  }


  ### Telemetry data

  dimension: telemetry_licensed_seats {
    type: number
    sql: ${TABLE}.telemetry_licensed_seats ;;
    label: "Licensed Seats (Telemetry)"
    description: "The number of seats the license permits, as reported in telemetry."
    view_label: "License: Source Data"
  }

  dimension_group: telemetry_starts {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.telemetry_starts_at ;;
    label: "Starts At (Telemetry)"
    description: "The license start date from telemetry. Null if license doesn't exist in telemetry."
    view_label: "License: Source Data"
  }


  dimension_group: telemetry_expire {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.telemetry_expire_at ;;
    label: "Expires At (Telemetry)"
    description: "The license expiration date from telemetry. Null if license doesn't exist in telemetry."
    view_label: "License: Source Data"
  }

  ###
  ### Metadata
  ###


  dimension: in_cws {
    type: yesno
    sql: ${TABLE}.in_cws ;;
    description: "Whether the license was found in CWS data."
    view_label: "License: Metadata"
  }

  dimension: in_legacy {
    type: yesno
    sql: ${TABLE}.in_legacy ;;
    description: "Whether the license was found in Legacy data."
    view_label: "License: Metadata"
  }

  dimension: in_salesforce {
    type: yesno
    sql: ${TABLE}.in_salesforce ;;
    description: "Whether the license was found in Salesforce data."
    view_label: "License: Metadata"
  }

  dimension: in_telemetry {
    type: yesno
    sql: ${TABLE}.in_telemetry ;;
    description: "Whether the license was found in Telemetry data."
    view_label: "License: Metadata"
  }


  ###
  ### Measures
  ###

  measure: count {
    type: count
    drill_fields: [license_id, company_name, sku_short_name, license_name, starts_at_date, expire_at_date]
    label: "Total licenses"
    view_label: "License: Metrics"
  }
}
