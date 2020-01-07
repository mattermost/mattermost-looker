view: license_overview {
  sql_table_name: BLP.LICENSE_OVERVIEW ;;

  dimension: account_name {
    type: string
    sql: ${TABLE}."ACCOUNT_NAME" ;;
  }

  dimension: account_sfid {
    type: string
    sql: ${TABLE}."ACCOUNT_SFID" ;;
  }

  dimension: company {
    type: string
    sql: ${TABLE}."COMPANY" ;;
  }

  dimension: contact_email {
    type: string
    sql: ${TABLE}."CONTACT_EMAIL" ;;
  }

  dimension: contact_sfid {
    type: string
    sql: ${TABLE}."CONTACT_SFID" ;;
  }

  dimension: customerid {
    type: string
    sql: ${TABLE}."CUSTOMERID" ;;
  }

  dimension_group: expiresat {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."EXPIRESAT" ;;
  }

  dimension_group: issuedat {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."ISSUEDAT" ;;
  }

  dimension: license_email {
    type: string
    sql: ${TABLE}."LICENSE_EMAIL" ;;
  }

  dimension: licenseid {
    type: string
    sql: ${TABLE}."LICENSEID" ;;
  }

  dimension: licenselength {
    type: number
    sql: ${TABLE}."LICENSELENGTH" ;;
  }

  dimension: master_account_name {
    type: string
    sql: ${TABLE}."MASTER_ACCOUNT_NAME" ;;
  }

  dimension: master_account_sfid {
    type: string
    sql: ${TABLE}."MASTER_ACCOUNT_SFID" ;;
  }

  dimension: opportunity_name {
    type: string
    sql: ${TABLE}."OPPORTUNITY_NAME" ;;
  }

  dimension: opportunity_sfid {
    type: string
    sql: ${TABLE}."OPPORTUNITY_SFID" ;;
  }

  dimension: stripeid {
    type: string
    sql: ${TABLE}."STRIPEID" ;;
  }

  measure: count {
    type: count
    drill_fields: [opportunity_name, account_name, master_account_name]
  }
}
