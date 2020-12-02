view: territory_mapping {
  sql_table_name: "ORGM"."TERRITORY_MAPPING__C";;

  dimension: area {
    type: string
    sql: ${TABLE}."AREA__C" ;;
  }

  dimension: commercial_rep {
    type: string
    sql: ${TABLE}."COMMERCIAL_REP__C" ;;
  }

  dimension: country_code {
    type: string
    sql: ${TABLE}."COUNTRY_CODE__C" ;;
  }

  dimension: country_name {
    type: string
    sql: ${TABLE}."COUNTRY_NAME__C" ;;
  }

  dimension: domain {
    type: string
    sql: ${TABLE}."DOMAIN__C" ;;
  }

  dimension: enterprise_rep {
    type: string
    sql: ${TABLE}."ENTERPRISE_REP__C" ;;
  }

  dimension: geo {
    type: string
    sql: ${TABLE}."GEO__C" ;;
  }

  dimension: isdeleted {
    type: yesno
    sql: ${TABLE}."ISDELETED" ;;
  }

  dimension: mapping_type {
    type: string
    sql: ${TABLE}."MAPPING_TYPE__C" ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}."NAME" ;;
  }

  dimension: region {
    type: string
    sql: ${TABLE}."REGION__C" ;;
  }

  dimension: rvp {
    type: string
    sql: ${TABLE}."RVP__C" ;;
  }

  dimension: sfid {
    primary_key: yes
    type: string
    sql: ${TABLE}."SFID" ;;
  }

  dimension: state_code {
    type: string
    sql: ${TABLE}."STATE_CODE__C" ;;
  }

  dimension: state_name {
    type: string
    sql: ${TABLE}."STATE_NAME__C" ;;
  }

  dimension: territory {
    type: string
    sql: ${TABLE}."TERRITORY__C" ;;
  }

}
