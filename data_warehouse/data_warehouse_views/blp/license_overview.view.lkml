view: license_overview {
  sql_table_name: BLP.LICENSE_OVERVIEW ;;

  dimension: account_name {
    group_label: "Salesforce Data"
    type: string
    sql: ${TABLE}."ACCOUNT_NAME" ;;
    description: "Salesforce Account Name"
  }

  dimension: account_sfid {
    group_label: "Salesforce Data"
    type: string
    sql: ${TABLE}."ACCOUNT_SFID" ;;
    description: "Salesforce Account SFID"
  }

  dimension: company {
    group_label: "Licensing Server Data"
    type: string
    sql: ${TABLE}."COMPANY" ;;
    description: "Company name entered in Licensing Server"
  }

  dimension: contact_sfid {
    group_label: "Salesforce Data"
    type: string
    sql: ${TABLE}."CONTACT_SFID" ;;
    description: "Contact SFID of email entered in Licensing Server"
  }

  dimension: customerid {
    group_label: "Licensing Server Data"
    type: string
    sql: ${TABLE}."CUSTOMERID" ;;
    description: "Customer ID of email entered into Licensing Server"
  }

  dimension_group: expires_at {
    group_label: "Licensing Server Data"
    type: time
    timeframes: [
      date,
      month,
      fiscal_quarter,
      fiscal_year
    ]
    sql: ${TABLE}."EXPIRESAT" ;;
  }

  dimension_group: issued_at {
    group_label: "Licensing Server Data"
    type: time
    timeframes: [
      date,
      month,
      fiscal_quarter,
      fiscal_year
    ]
    sql: ${TABLE}."ISSUEDAT" ;;
  }

  dimension: license_email {
    group_label: "Licensing Server Data"
    description: "Email entered in Licensing Server"
    type: string
    sql: ${TABLE}."LICENSE_EMAIL" ;;
  }

  dimension: licenseid {
    group_label: "Licensing Server Data"
    label: "License ID"
    type: string
    sql: ${TABLE}."LICENSEID" ;;
  }

  dimension: license_length {
    group_label: "Licensing Server Data"
    type: number
    sql: ${TABLE}."LICENSELENGTH" ;;
  }

  dimension: opportunity_sfid {
    group_label: "Salesforce Data"
    label: "Opportunity SFID"
    type: string
    sql: ${TABLE}."OPPORTUNITY_SFID" ;;
    description: "Salesforce Opportunity related to license"
  }

  dimension: stripeid {
    group_label: "Licensing Server Data"
    label: "Strip ID"
    type: string
    sql: ${TABLE}."STRIPEID" ;;
  }

  measure: count_licenses {
    label: "# of Licenses"
    type: count_distinct
    drill_fields: [account_name, company, opportunity.name, license_email, contact.email, issued_at_date, expires_at_date]
  }
}
