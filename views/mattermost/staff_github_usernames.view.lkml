view: staff_github_usernames {
  sql_table_name: MATTERMOST.STAFF_GITHUB_USERNAMES ;;

  dimension: username {
    type: string
    sql: ${TABLE}."USERNAME" ;;
    description: "Mattermost staff GitHub usernames"
  }

}
