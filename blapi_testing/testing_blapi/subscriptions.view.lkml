view: subscriptions {
  sql_table_name: testing_blapi.subscriptions ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}."id" ;;
  }

  dimension_group: created {
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
    sql: ${TABLE}."created_at" ;;
  }

  dimension: customer_id {
    type: string
    # hidden: yes
    sql: ${TABLE}."customer_id" ;;
  }

  dimension_group: deleted {
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
    sql: ${TABLE}."deleted_at" ;;
  }

  dimension_group: end {
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
    sql: ${TABLE}."end_date" ;;
  }

  dimension_group: license_issued {
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
    sql: ${TABLE}."license_issued_at" ;;
  }

  dimension: license_payload {
    type: string
    sql: ${TABLE}."license_payload" ;;
  }

  dimension: num_seats {
    type: number
    sql: ${TABLE}."num_seats" ;;
  }

  dimension: previous_version_id {
    type: string
    sql: ${TABLE}."previous_version_id" ;;
  }

  dimension: product_id {
    type: string
    sql: ${TABLE}."product_id" ;;
  }

  dimension: scenario {
    type: string
    sql: ${TABLE}."scenario" ;;
  }

  dimension: scenario_category {
    type: string
    sql: ${TABLE}."scenario_category" ;;
  }

  dimension_group: start {
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
    sql: ${TABLE}."start_date" ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}."state" ;;
  }

  dimension: total_in_cents {
    type: number
    sql: ${TABLE}."total_in_cents" ;;
  }

  dimension_group: updated {
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
    sql: ${TABLE}."updated_at" ;;
  }

  dimension: version_id {
    type: string
    sql: ${TABLE}."version_id" ;;
  }

  measure: count {
    type: count
    drill_fields: [id, customers.id, customers.company_name, customers.name]
  }
}
