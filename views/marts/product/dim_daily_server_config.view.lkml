view: dim_daily_server_config {
  label: "Daily Server Configuration"
  sql_table_name: "MART_PRODUCT"."DIM_DAILY_SERVER_CONFIG" ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Daily Server ID" in Explore.

  dimension: daily_server_id {
    type: string
    sql: ${TABLE}.daily_server_id ;;
    primary_key: yes
    hidden: yes
  }

  dimension: is_gitlab_enabled {
    type: yesno
    sql: ${TABLE}.is_gitlab_enabled ;;
    label: "Is Gitlab Enabled?"
    view_label: "Configuration: OAuth"
  }

  dimension: is_google_enabled {
    type: yesno
    sql: ${TABLE}.is_google_enabled ;;
    label: "Is Google Enabled?"
    view_label: "Configuration: OAuth"
  }

  dimension: is_office365_enabled {
    type: yesno
    sql: ${TABLE}.is_office365_enabled ;;
    label: "Is Office365 Enabled?"
    view_label: "Configuration: OAuth"
  }

  dimension: is_openid_enabled {
    type: yesno
    sql: ${TABLE}.is_openid_enabled ;;
    label: "Is OpenID Enabled?"
    view_label: "Configuration: OAuth"
  }

  dimension: is_openid_gitlab_enabled {
    type: yesno
    sql: ${TABLE}.is_open_id_gitlab_enabled ;;
    label: "Is OpenID - Gitlab Enabled?"
    view_label: "Configuration: OAuth"
  }

  dimension: is_openid_google_enabled {
    type: yesno
    sql: ${TABLE}.is_openid_google_enabled ;;
    label: "Is OpenID - Google Enabled?"
    view_label: "Configuration: OAuth"
  }

  dimension: is_openid_office365_enabled {
    type: yesno
    sql: ${TABLE}.is_openid_office365_enabled ;;
    label: "Is OpenID - Office365 Enabled?"
    view_label: "Configuration: OAuth"
  }

}
