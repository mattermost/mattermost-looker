connection: "snowflake"

include: "home_page.dashboard"

view: _home_page {
  sql_table_name: orgm.account ;;

  measure: _html {
    sql: 1 ;;
    html:
    {% if _user_attributes['is_group_mlt'] %}
      <a href="google.com">Is MLT</a>
    {% else %}
      <a href="google.com">Is NOT MLT</a>
    {% endif %} ;;
  }
}
