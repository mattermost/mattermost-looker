view: account_domain_mapping {
  sql_table_name: "ORGM"."ACCOUNT_DOMAIN_MAPPING"
    ;;

  dimension: account_external_id {
    type: string
    sql: ${TABLE}."ACCOUNT_EXTERNAL_ID" ;;
  }

  dimension: accountid {
    type: string
    sql: ${TABLE}."ACCOUNTID" ;;
  }

  dimension: domain {
    type: string
    sql: ${TABLE}."DOMAIN" ;;
  }

  dimension: public {
    sql: CASE WHEN ${domain} IS NOT NULL THEN 'Public Domain' ELSE 'Business Domain' END;;
    type: string
  }
}
