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
    label: "Is GA?"
    type: yesno
    sql: ${TABLE}."GA" ;;
  }

  dimension: metric_period_logic {
    type: string
    sql: CASE WHEN ${TABLE}."METRIC_PERIOD_LOGIC" = 'EoP' THEN 'End of Period' WHEN ${TABLE}."METRIC_PERIOD_LOGIC" = 'SoP' THEN 'Sum Over Period' ELSE NULL END ;;
  }

  dimension: tva_enabled {
    label: "TD Enabled"
    type: yesno
    sql: true ;;
  }

  dimension: td_enabled {
    label: "TD Enabled"
    type: yesno
    sql: CASE WHEN ${TABLE}."METRIC_PERIOD_LOGIC" != 'EoP' THEN true ELSE false END ;;
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
    sql: CASE WHEN ${TABLE}."PERIOD" = 'mo' THEN 'Month' WHEN ${TABLE}."PERIOD" = 'qtr' THEN 'Quarter' WHEN ${TABLE}."PERIOD" = 'fy' THEN 'Fiscal Year' END;;
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

  measure: period_hierarchy_rank {
    hidden: yes
    type: min
    sql: CASE WHEN ${TABLE}."PERIOD" = 'mo' THEN 1 WHEN ${TABLE}."PERIOD" = 'qtr' THEN 2 WHEN ${TABLE}."PERIOD" = 'fy' THEN 3 END;;
  }

  measure: most_granular_period {
    type: string
    sql: CASE WHEN ${period_hierarchy_rank} = 1 THEN 'Month' WHEN ${period_hierarchy_rank} = 2 THEN 'Quarter' WHEN ${period_hierarchy_rank} = 1 THEN 'Fiscal Year' END;;
  }
}
