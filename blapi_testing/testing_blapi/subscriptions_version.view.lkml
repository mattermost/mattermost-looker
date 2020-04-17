view: subscriptions_version {
  sql_table_name: testing_blapi.subscriptions_version ;;
  drill_fields: [id]

  dimension: id {
    group_label: "Subscription"
    primary_key: yes
    type: string
    sql: ${TABLE}."id" ;;
  }

  dimension: created_at {
    group_label: "Subscription"
    type: date_time
    sql: ${TABLE}."created_at" ;;
  }

  dimension: created_at_mod {
    group_label: "Mod"
    type: yesno
    sql: ${TABLE}."created_at_mod" ;;
  }

  dimension: customer_id {
    group_label: "Subscription"
    type: string
    hidden: yes
    sql: ${TABLE}."customer_id" ;;
  }

  dimension: customer_id_mod {
    group_label: "Mod"
    type: yesno
    sql: ${TABLE}."customer_id_mod" ;;
  }

  dimension: deleted_at {
    group_label: "Subscription"
    type: date_time
    sql: ${TABLE}."deleted_at" ;;
  }

  dimension: deleted_at_mod {
    group_label: "Mod"
    type: yesno
    sql: ${TABLE}."deleted_at_mod" ;;
  }

  dimension: end_date {
    group_label: "Subscription"
    type: date_time
    sql: ${TABLE}."end_date" ;;
  }

  dimension: end_date_mod {
    group_label: "Mod"
    type: yesno
    sql: ${TABLE}."end_date_mod" ;;
  }

  dimension: end_transaction_id {
    group_label: "Transaction"
    type: number
    sql: ${TABLE}."end_transaction_id" ;;
  }

  dimension: license_issued_at {
    group_label: "Subscription"
    type: date_time
    sql: ${TABLE}."license_issued_at" ;;
  }

  dimension: license_issued_at_mod {
    group_label: "Mod"
    type: yesno
    sql: ${TABLE}."license_issued_at_mod" ;;
  }

  dimension: license_payload {
    group_label: "Subscription"
    type: string
    sql: ${TABLE}."license_payload" ;;
  }

  dimension: license_payload_mod {
    group_label: "Mod"
    type: yesno
    sql: ${TABLE}."license_payload_mod" ;;
  }

  dimension: num_seats {
    group_label: "Subscription"
    type: number
    sql: ${TABLE}."num_seats" ;;
  }

  dimension: num_seats_mod {
    group_label: "Mod"
    type: yesno
    sql: ${TABLE}."num_seats_mod" ;;
  }

  dimension: operation_type {
    group_label: "Transaction"
    type: number
    sql: ${TABLE}."operation_type" ;;
  }

  dimension: previous_version_id {
    group_label: "Subscription"
    type: string
    sql: ${TABLE}."previous_version_id" ;;
  }

  dimension: previous_version_id_mod {
    group_label: "Mod"
    type: yesno
    sql: ${TABLE}."previous_version_id_mod" ;;
  }

  dimension: product_id {
    group_label: "Subscription"
    type: string
    sql: ${TABLE}."product_id" ;;
  }

  dimension: product_id_mod {
    group_label: "Mod"
    type: yesno
    sql: ${TABLE}."product_id_mod" ;;
  }

  dimension: scenario {
    group_label: "Scenario"
    type: string
    sql: ${TABLE}."scenario" ;;
  }

  dimension: scenario_category {
    group_label: "Scenario"
    type: string
    sql: ${TABLE}."scenario_category" ;;
  }

  dimension: start_date{
    group_label: "Subscription"
    type: date_time
    sql: ${TABLE}."start_date" ;;
  }

  dimension: start_date_mod {
    group_label: "Mod"
    type: yesno
    sql: ${TABLE}."start_date_mod" ;;
  }

  dimension: state {
    group_label: "Subscription"
    type: string
    sql: ${TABLE}."state" ;;
  }

  dimension: state_mod {
    group_label: "Mod"
    type: yesno
    sql: ${TABLE}."state_mod" ;;
  }

  dimension: total_in_cents {
    group_label: "Subscription"
    type: number
    sql: ${TABLE}."total_in_cents" ;;
  }

  dimension: total_in_cents_mod {
    group_label: "Mod"
    type: yesno
    sql: ${TABLE}."total_in_cents_mod" ;;
  }

  dimension: transaction_id {
    group_label: "Transaction"
    type: number
    sql: ${TABLE}."transaction_id" ;;
  }

  dimension: updated_at {
    group_label: "Subscription"
    type: date_time
    sql: ${TABLE}."updated_at" ;;
  }

  dimension: updated_at_mod {
    group_label: "Mod"
    type: yesno
    sql: ${TABLE}."updated_at_mod" ;;
  }

  dimension: version_id {
    group_label: "Subscription"
    type: string
    sql: ${TABLE}."version_id" ;;
  }

  dimension: version_id_mod {
    group_label: "Mod"
    type: yesno
    sql: ${TABLE}."version_id_mod" ;;
  }

}
