view: target_fact {
  sql_table_name: "TVA"."TARGET_FACT";;

  dimension: id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}."ID" ;;
  }

  dimension: category {
    group_label: "Target Info"
    label: "Target Category"
    type: string
    sql: ${TABLE}."CATEGORY" ;;
  }

  dimension: ga {
    hidden: yes
    label: "Is GA?"
    type: yesno
    sql: ${TABLE}."GA" ;;
  }

  dimension: metric_period_logic {
    type: string
    hidden: yes
    sql: CASE WHEN ${TABLE}."METRIC_PERIOD_LOGIC" = 'EoP' THEN 'End of Period' WHEN ${TABLE}."METRIC_PERIOD_LOGIC" = 'SoP' THEN 'Sum Over Period' ELSE NULL END ;;
  }

  dimension: tva_enabled {
    label: "TvA Enabled"
    hidden: yes
    type: yesno
    sql: true ;;
  }

  dimension: td_enabled {
    label: "TD Enabled"
    hidden: yes
    type: yesno
    sql: CASE WHEN ${TABLE}."METRIC_PERIOD_LOGIC" != 'EoP' THEN true ELSE false END ;;
  }

  dimension: name {
    group_label: "Target Info"
    label: " Target Name"
    type: string
    sql: ${TABLE}."NAME" ;;
  }

  dimension: name_by_period {
    hidden: yes
    type: string
    sql: ${TABLE}."NAME_BY_PERIOD" ;;
  }

  dimension: period {
    hidden: yes
    type: string
    sql: CASE WHEN ${TABLE}."PERIOD" = 'mo' THEN 'Month' WHEN ${TABLE}."PERIOD" = 'qtr' THEN 'Quarter' WHEN ${TABLE}."PERIOD" = 'fy' THEN 'Fiscal Year' END;;
  }

  dimension: slug {
    hidden: yes
    type: string
    sql: ${TABLE}."SLUG" ;;
  }

  dimension: target_definition {
    group_label: "Target Info"
    label: "Target Definition"
    type: string
    sql: ${TABLE}."TARGET_DEFINITION" ;;
  }

  dimension: visibility {
    hidden: yes
    type: string
    sql: ${TABLE}."VISIBILITY" ;;
  }

  measure: period_hierarchy_rank {
    hidden: yes
    type: min
    sql: CASE WHEN ${TABLE}."PERIOD" = 'mo' THEN 1 WHEN ${TABLE}."PERIOD" = 'qtr' THEN 2 WHEN ${TABLE}."PERIOD" = 'fy' THEN 3 END;;
  }

  measure: most_granular_period {
    hidden: yes
    type: string
    sql: CASE WHEN ${period_hierarchy_rank} = 1 THEN 'Month' WHEN ${period_hierarchy_rank} = 2 THEN 'Quarter' WHEN ${period_hierarchy_rank} = 1 THEN 'Fiscal Year' END;;
  }
}
