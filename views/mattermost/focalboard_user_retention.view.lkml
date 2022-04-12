view: focalboard_user_retention {

  sql_table_name: "MATTERMOST"."FOCALBOARD_USER_RETENTION"
    ;;
  drill_fields: [id]


  dimension: months_since_first_active {
    type: string
    sql: ROUND(MONTHS_BETWEEN(${max_original_timestamp_raw},${first_active_timestamp_raw}),0);;
  }

  dimension: month_name {
    type: string
    sql: ${first_active_timestamp_month_name} || ' - ' || ${first_active_timestamp_year};;
    order_by_field: first_active_timestamp_month
  }


  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}."ID" ;;
  }

  dimension: age {
    type: string
    sql: ${TABLE}."AGE" ;;
  }

  dimension: sorting_order {
    case: {
      when: {
        sql: ${age} = 'AGE 0' ;;
        label: "AGE 0"
      }
      when: {
        sql: ${age} = 'AGE 1 - 6' ;;
        label: "AGE 1 - 6"
      }
      when: {
        sql: ${age} = 'AGE 7 - 27' ;;
        label: "AGE 7 - 27"
      }
      when: {
        sql: ${age} = 'AGE 28+' ;;
        label: "AGE 28+"
      }
    }
  }

  dimension_group: max_original_timestamp {
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
    sql: ${TABLE}."MAX_ORIGINAL_TIMESTAMP" ;;
  }

  dimension_group: first_active_timestamp {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      month_name,
      quarter,
      year
    ]
    sql: ${TABLE}."FIRST_ACTIVE_TIMESTAMP" ;;
  }

  dimension: first_server_edition {
    type: string
    sql: ${TABLE}."FIRST_SERVER_EDITION" ;;
  }

  dimension: installation_id {
    type: string
    sql: ${TABLE}."INSTALLATION_ID" ;;
  }

  dimension_group: max_active_timestamp {
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
    sql: ${TABLE}."MAX_ACTIVE_TIMESTAMP" ;;
  }

  dimension: server_id {
    label: " Instance ID"
    type: string
    sql: ${TABLE}."SERVER_ID" ;;
  }

  dimension: user_id {
    label: " User ID"
    type: string
    sql: ${TABLE}."USER_ID" ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }

  measure: user_count {
    label: " User Count"
    type: number
    sql:  COALESCE(COUNT(DISTINCT ${user_id}),0) ;;
    drill_fields: [id]
  }
}
