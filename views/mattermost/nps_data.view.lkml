view: nps_data {
  sql_table_name: MATTERMOST.NPS_DATA ;;
  view_label: "NPS Data"

  dimension: compound_primary {
    sql: ${user_id} || ${response_date} ;;
    primary_key: yes
    hidden: yes
  }

  dimension: version_support_flag {
    type: string
    sql: CASE WHEN ${license_server_fact.edition} LIKE '%Cloud%' THEN 'Supported'
        WHEN ${license_server_fact.edition} NOT LIKE '%Cloud%'
        AND ${nps_data.response_date} BETWEEN ${version_release_dt.lifecycle_start_date} AND ${version_release_dt.lifecycle_end_date} THEN 'Supported'
        ELSE 'Not Supported' END ;;
  }


  dimension_group: response {
    type: time
    timeframes: [
      date,
      month,
      fiscal_quarter,
      year,
      fiscal_year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."DATE" ;;
  }

  dimension: user_feedback {
    type: string
    sql: ${TABLE}."FEEDBACK" ;;
  }

  dimension: license_id {
    group_label: "License"
    type: string
    sql: ${TABLE}."LICENSE_ID" ;;
  }

  dimension: is_licensed {
    label: "Is Licensed?"
    group_label: "License"
    type: yesno
    sql: ${license_id} IS NOT NULL ;;
  }

  dimension: license_sku {
    group_label: "License"
    type: string
    sql: ${TABLE}."LICENSE_SKU" ;;
  }

  dimension: promoter_type {
    type: string
    sql: ${TABLE}."PROMOTER_TYPE" ;;
  }

  dimension: score {
    type: number
    sql: ${TABLE}."SCORE" ;;
  }

  dimension: server_id {
    group_label: "Server"
    type: string
    sql: ${TABLE}."SERVER_ID" ;;
  }

  dimension_group: server_install {
    group_label: "Server"
    type: time
    timeframes: [
      date,
      month,
      fiscal_quarter,
      year,
      fiscal_year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."SERVER_INSTALL_DATE" ;;
  }

  dimension: server_version {
    group_label: "Server"
    type: string
    sql: ${TABLE}."SERVER_VERSION" ;;
  }

  dimension_group: user_create {
    group_label: "User"
    type: time
    timeframes: [
      date,
      month,
      fiscal_quarter,
      year,
      fiscal_year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."USER_CREATE_AT" ;;
  }

  dimension: user_id {
    group_label: "User"
    type: string
    sql: ${TABLE}."USER_ID" ;;
  }

  dimension: user_role {
    group_label: "User"
    type: string
    sql: ${TABLE}."USER_ROLE" ;;
  }

  measure: count_users {
    group_label: "Users"
    type: count_distinct
    sql: ${user_id} ;;
  }

  measure: count_promoters {
    group_label: "Users"
    filters: {
      field: promoter_type
      value: "Promoter"
    }
    type: count_distinct
    sql: ${user_id} ;;
  }

  measure: count_detractor {
    group_label: "Users"
    filters: {
      field: promoter_type
      value: "Detractor"
    }
    type: count_distinct
    sql: ${user_id} ;;
  }

  measure: count_passive {
    group_label: "Users"
    filters: {
      field: promoter_type
      value: "Passive"
    }
    type: count_distinct
    sql: ${user_id} ;;
  }

  measure: sum_score {
    group_label: "Sums"
    type: sum
    sql: ${score} ;;
  }

  measure: sum_promoter_score {
    group_label: "Sums"
    filters: {
      field: promoter_type
      value: "Promoter"
    }
    type: sum
    sql: ${score} ;;
  }

  measure: sum_detractor_score {
    group_label: "Sums"
    filters: {
      field: promoter_type
      value: "Detractor"
    }
    type: sum
    sql: ${score} ;;
  }

  measure: sum_passive_score {
    group_label: "Sums"
    filters: {
      field: promoter_type
      value: "Passive"
    }
    type: sum
    sql: ${score} ;;
  }

  measure: perc_promoter_score {
    group_label: "Percents"
    type: number
    value_format: "@{percent}"
    sql: ${count_promoters}::float/NULLIF(${count_users}::float, 0) ;;
  }

  measure: perc_detractor_score {
    group_label: "Percents"
    type: number
    value_format: "@{percent}"
    sql: ${count_detractor}::float/NULLIF(${count_users}::float, 0) ;;
  }

  measure: perc_passive_score {
    group_label: "Percents"
    type: number
    value_format: "@{percent}"
    sql: ${count_passive}::float/NULLIF(${count_users}::float, 0) ;;
  }

  measure: nps_score {
    label: "NPS Score"
    value_format: "@{decimal}"
    type: number
    sql: 100*(${perc_promoter_score} - ${perc_detractor_score}) ;;
  }

  measure: avg_score {
    group_label: "Averages"
    value_format: "@{decimal}"
    type: average
    sql: ${score} ;;
  }

  measure: avg_promoter_score {
    group_label: "Averages"
    value_format: "@{decimal}"
    filters: {
      field: promoter_type
      value: "Promoter"
    }
    type: average
    sql: ${score} ;;
  }

  measure: avg_detractor_score {
    group_label: "Averages"
    value_format: "@{decimal}"
    filters: {
      field: promoter_type
      value: "Detractor"
    }
    type: average
    sql: ${score} ;;
  }

  measure: avg_passive_score {
    group_label: "Averages"
    value_format: "@{decimal}"
    filters: {
      field: promoter_type
      value: "Passive"
    }
    type: average
    sql: ${score} ;;
  }
}
