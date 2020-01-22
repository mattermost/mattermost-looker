view: staff_github_usernames {
  sql_table_name: EMPLOYEE.STAFF_GITHUB_USERNAMES ;;

  dimension: username {
    type: string
    sql: ${TABLE}."USERNAME" ;;
  }

}
