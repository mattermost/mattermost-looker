view: subscriptions {
  sql_table_name: testing_blapi.subscriptions ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}."id" ;;
  }

  dimension: created_at {
    group_label: "System"
    type: date_time
    sql: ${TABLE}."created_at" ;;
  }

  dimension: customer_id {
    type: string
    hidden: yes
    sql: ${TABLE}."customer_id" ;;
  }

  dimension: deleted_at {
    group_label: "System"
    type: date_time
    sql: ${TABLE}."deleted_at" ;;
  }

  dimension: end_date {
    group_label: "Subscription"
    type: date_time
    sql: ${TABLE}."end_date" ;;
  }

  dimension: license_issued_at {
    group_label: "Subscription"
    type: date_time
    sql: ${TABLE}."license_issued_at" ;;
  }

  dimension: license_payload {
    group_label: "Subscription"
    type: string
    sql: ${TABLE}."license_payload" ;;
  }

  dimension: num_seats {
    group_label: "Subscription"
    type: number
    sql: ${TABLE}."num_seats" ;;
  }

  dimension: previous_version_id {
    type: string
    sql: ${TABLE}."previous_version_id" ;;
  }

  dimension: product_id {
    group_label: "Subscription"
    type: string
    sql: ${TABLE}."product_id" ;;
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

  dimension: start_date {
    group_label: "Subscription"
    type: date_time
    sql: ${TABLE}."start_date" ;;
  }

  dimension: state {
    group_label: "Subscription"
    type: string
    sql: ${TABLE}."state" ;;
  }

  dimension: total_in_cents {
    group_label: "Subscription"
    type: number
    sql: ${TABLE}."total_in_cents" ;;
  }

  dimension: updated_at {
    group_label: "System"
    type: date_time
    sql: ${TABLE}."updated_at" ;;
  }

  dimension: version_id {
    type: string
    sql: ${TABLE}."version_id" ;;
  }

}
