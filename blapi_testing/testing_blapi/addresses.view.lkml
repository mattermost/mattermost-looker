view: addresses {
  sql_table_name: testing_blapi.addresses ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}."id" ;;
  }

  dimension: address_type {
    type: string
    sql: ${TABLE}."address_type" ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}."city" ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}."country" ;;
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

  dimension: line1 {
    type: string
    sql: ${TABLE}."line1" ;;
  }

  dimension: line2 {
    type: string
    sql: ${TABLE}."line2" ;;
  }

  dimension: postal_code {
    type: string
    sql: ${TABLE}."postal_code" ;;
  }

  dimension: previous_version_id {
    type: string
    sql: ${TABLE}."previous_version_id" ;;
  }

  dimension: scenario {
    type: string
    sql: ${TABLE}."scenario" ;;
  }

  dimension: scenario_category {
    type: string
    sql: ${TABLE}."scenario_category" ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}."state" ;;
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
