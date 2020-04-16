view: customers {
  sql_table_name: testing_blapi.customers ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}."id" ;;
  }

  dimension: company_name {
    type: string
    sql: ${TABLE}."company_name" ;;
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

  dimension: email {
    type: string
    sql: ${TABLE}."email" ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}."name" ;;
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

  dimension: stripe_id {
    type: string
    sql: ${TABLE}."stripe_id" ;;
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
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      company_name,
      name,
      addresses.count,
      subscriptions.count,
      subscriptions_version.count
    ]
  }
}
