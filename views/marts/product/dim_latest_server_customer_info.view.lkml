view: dim_latest_server_customer_info {
  label: "Latest Customer Info"
  sql_table_name: "MART_PRODUCT"."DIM_LATEST_SERVER_CUSTOMER_INFO" ;;

  dimension: server_id {
    type: string
    primary_key: yes
    sql: ${TABLE}.server_id ;;
  }

  dimension: license_id {
    type: string
    sql: ${TABLE}.license_id ;;
  }

  dimension: license_name {
    type: string
    sql: ${TABLE}.license_name ;;
  }

  dimension: licensed_seats {
    type: string
    sql: ${TABLE}.licensed_seats ;;
  }

  dimension: installation_id {
    type: string
    sql: ${TABLE}.installation_id ;;
  }

  dimension: company_name {
    type: string
    sql: ${TABLE}.company_name ;;
  }

  dimension: sku {
    type: string
    sql: ${TABLE}.sku ;;
  }

  dimension_group: expires {
    description: "The timestamp that the license expires."
    type: time
    timeframes: [
      raw,
      date,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."LICENSE_EXPIRE_AT" ;;
  }
  
  dimension: is_trial_license {
    type: string
    sql: ${TABLE}.is_trial_license ;;
  }

  dimension: source {
    type: string
    sql: ${TABLE}."SOURCE" ;;
  }
  
  
}
