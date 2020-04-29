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

  dimension: created_at {
    group_label: "System"
    type: date_time
    sql: ${TABLE}."created_at" ;;
  }

  dimension: deleted_at {
    group_label: "System"
    type: date_time
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
    type: string
    sql: ${TABLE}."state" ;;
  }

  dimension: stripe_id {
    type: string
    sql: ${TABLE}."stripe_id" ;;
  }

  dimension: updated_at {
    group_label: "System"
    type: date_time
    sql: ${TABLE}."updated_at" ;;
  }

}
