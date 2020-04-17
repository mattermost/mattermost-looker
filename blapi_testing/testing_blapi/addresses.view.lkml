view: addresses {
  sql_table_name: testing_blapi.addresses ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}."id" ;;
  }

  dimension: address_type {
    group_label: "Address"
    type: string
    sql: ${TABLE}."address_type" ;;
  }

  dimension: city {
    group_label: "Address"
    type: string
    sql: ${TABLE}."city" ;;
  }

  dimension: country {
    group_label: "Address"
    type: string
    map_layer_name: countries
    sql: ${TABLE}."country" ;;
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

  dimension: line1 {
    group_label: "Address"
    type: string
    sql: ${TABLE}."line1" ;;
  }

  dimension: line2 {
    group_label: "Address"
    type: string
    sql: ${TABLE}."line2" ;;
  }

  dimension: postal_code {
    group_label: "Address"
    type: string
    sql: ${TABLE}."postal_code" ;;
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

  dimension: state {
    group_label: "Address"
    type: string
    sql: ${TABLE}."state" ;;
  }

  dimension: updated_at {
    group_label: "System"
    type: date_time
    sql: ${TABLE}."updated_at" ;;
  }

}
