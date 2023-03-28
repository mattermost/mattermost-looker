view: dim_projects {
  label: "Projects"
  sql_table_name: "MART_RELEASE"."DIM_PROJECTS"
    ;;

  dimension: project_id {
    type: string
    primary_key: yes
    hidden: yes
    sql: ${TABLE}."PROJECT_ID" ;;
  }

  dimension: name {
    description: "The name of the project"
    type: string
    sql: ${TABLE}."NAME" ;;
  }

  dimension: project_key {
    description: "The project's key (i.e. MM for project MATTERMOST)"
    type: string
    sql: ${TABLE}."PROJECT_KEY" ;;
  }

  measure: count {
    type: count
    drill_fields: [name]
  }
}
