view: target_fact {
  sql_table_name: "TVA"."TARGET_FACT";;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."ID" ;;
  }

  dimension: category {
    type: string
    sql: ${TABLE}."CATEGORY" ;;
  }

  dimension: ga {
    type: yesno
    sql: ${TABLE}."GA" ;;
  }

  dimension: metric_period_logic {
    type: string
    sql: ${TABLE}."METRIC_PERIOD_LOGIC" ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}."NAME" ;;
  }

  dimension: name_by_period {
    type: string
    sql: ${TABLE}."NAME_BY_PERIOD" ;;
  }

  dimension: period {
    type: string
    sql: ${TABLE}."PERIOD" ;;
  }

  dimension: slug {
    type: string
    sql: ${TABLE}."SLUG" ;;
  }

  dimension: target_definition {
    type: string
    sql: ${TABLE}."TARGET_DEFINITION" ;;
  }

  dimension: visibility {
    type: string
    sql: ${TABLE}."VISIBILITY" ;;
  }
}
