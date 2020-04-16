view: subscriptions_version {
  sql_table_name: testing_blapi.subscriptions_version ;;
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

  dimension: created_at_mod {
    type: yesno
    sql: ${TABLE}."created_at_mod" ;;
  }

  dimension: customer_id {
    type: string
    # hidden: yes
    sql: ${TABLE}."customer_id" ;;
  }

  dimension: customer_id_mod {
    type: yesno
    sql: ${TABLE}."customer_id_mod" ;;
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

  dimension: deleted_at_mod {
    type: yesno
    sql: ${TABLE}."deleted_at_mod" ;;
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

  dimension: end_date_mod {
    type: yesno
    sql: ${TABLE}."end_date_mod" ;;
  }

  dimension: end_transaction_id {
    type: number
    sql: ${TABLE}."end_transaction_id" ;;
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

  dimension: license_issued_at_mod {
    type: yesno
    sql: ${TABLE}."license_issued_at_mod" ;;
  }

  dimension: license_payload {
    type: string
    sql: ${TABLE}."license_payload" ;;
  }

  dimension: license_payload_mod {
    type: yesno
    sql: ${TABLE}."license_payload_mod" ;;
  }

  dimension: num_seats {
    type: number
    sql: ${TABLE}."num_seats" ;;
  }

  dimension: num_seats_mod {
    type: yesno
    sql: ${TABLE}."num_seats_mod" ;;
  }

  dimension: operation_type {
    type: number
    sql: ${TABLE}."operation_type" ;;
  }

  dimension: previous_version_id {
    type: string
    sql: ${TABLE}."previous_version_id" ;;
  }

  dimension: previous_version_id_mod {
    type: yesno
    sql: ${TABLE}."previous_version_id_mod" ;;
  }

  dimension: product_id {
    type: string
    sql: ${TABLE}."product_id" ;;
  }

  dimension: product_id_mod {
    type: yesno
    sql: ${TABLE}."product_id_mod" ;;
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

  dimension: start_date_mod {
    type: yesno
    sql: ${TABLE}."start_date_mod" ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}."state" ;;
  }

  dimension: state_mod {
    type: yesno
    sql: ${TABLE}."state_mod" ;;
  }

  dimension: total_in_cents {
    type: number
    sql: ${TABLE}."total_in_cents" ;;
  }

  dimension: total_in_cents_mod {
    type: yesno
    sql: ${TABLE}."total_in_cents_mod" ;;
  }

  dimension: transaction_id {
    type: number
    sql: ${TABLE}."transaction_id" ;;
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

  dimension: updated_at_mod {
    type: yesno
    sql: ${TABLE}."updated_at_mod" ;;
  }

  dimension: version_id {
    type: string
    sql: ${TABLE}."version_id" ;;
  }

  dimension: version_id_mod {
    type: yesno
    sql: ${TABLE}."version_id_mod" ;;
  }

  measure: count {
    type: count
    drill_fields: [id, customers.id, customers.company_name, customers.name]
  }
}
