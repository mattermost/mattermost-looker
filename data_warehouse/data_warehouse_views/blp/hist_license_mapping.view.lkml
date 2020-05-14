view: hist_license_mapping {
  sql_table_name: "STAGING"."HIST_LICENSE_MAPPING"
    ;;

  dimension: account_sfid {
    type: string
    sql: ${TABLE}."ACCOUNT_SFID" ;;
  }

  dimension: company {
    type: string
    sql: ${TABLE}."COMPANY" ;;
  }

  dimension: contact_sfid {
    type: string
    sql: ${TABLE}."CONTACT_SFID" ;;
  }

  dimension_group: expiresat {
    label: "Expires At"
    type: time
    timeframes: [
      date,
      month,
      fiscal_quarter,
      fiscal_year
    ]
    sql: ${TABLE}."EXPIRESAT" ;;
  }

  dimension: finalized {
    hidden: yes
    type: yesno
    sql: ${TABLE}."FINALIZED" ;;
  }

  dimension: ignore {
    hidden: yes
    type: yesno
    sql: ${TABLE}."IGNORE" ;;
  }

  dimension_group: issuedat {
    label: "Issued At"
    type: time
    timeframes: [
      raw,
      date,
      month,
      fiscal_quarter,
      fiscal_year
    ]
    sql: ${TABLE}."ISSUEDAT" ;;
  }

  dimension: license_email {
    type: string
    sql: ${TABLE}."LICENSE_EMAIL" ;;
  }

  dimension: licenseid {
    label: "License ID"
    type: string
    sql: ${TABLE}."LICENSEID" ;;
  }

  dimension: licenselength {
    label: "License Length (Days)"
    type: number
    sql: ${TABLE}."LICENSELENGTH" ;;
  }

  dimension: opportunity_sfid {
    type: string
    sql: ${TABLE}."OPPORTUNITY_SFID" ;;
  }

  dimension: trial {
    type: yesno
    sql: ${TABLE}."TRIAL" ;;
  }

  measure: count_licenses {
    type: count_distinct
    sql: ${licenseid} ;;
  }
}
