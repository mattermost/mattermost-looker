view: github_repo_categorization {
  sql_table_name: "MATTERMOST"."GITHUB_REPO_CATEGORIZATION"
    ;;

  dimension: category {
    label: "Repo Category"
    type: string
    sql: ${TABLE}."CATEGORY" ;;
  }

  dimension: repo {
    type: string
    sql: ${TABLE}."REPO" ;;
    hidden: yes
  }
}
