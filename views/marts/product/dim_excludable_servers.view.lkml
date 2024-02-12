# The name of this view in Looker is "Dim Excludable Servers"
view: dim_excludable_servers {
  sql_table_name: "MART_PRODUCT"."DIM_EXCLUDABLE_SERVERS" ;;

  label: "Dimension: Excludable Servers"

  dimension: server_id {
    type: string
    sql: ${TABLE}.server_id ;;
    primary_key: yes
    label: "Server ID"
    description: " The server's ID"
    hidden: yes
  }

  # Telemetry

  dimension: has_reason_single_day_security_only {
    type: yesno
    sql: ${TABLE}.has_reason_single_day_security_only ;;
    label: "Single day (security)"
    description: "Whether the server has a single day of reported data from security update check endpoint."
    view_label: "Server: Exclusion Reasons"
  }


  dimension: has_reason_single_day_server_side_telemetry_only {
    type: yesno
    sql: ${TABLE}.has_reason_single_day_server_side_telemetry_only ;;
    label: "Single day (telemetry - server side)"
    description: "Whether the server has reported telemetry (from server) only for a single day."
    view_label: "Server: Exclusion Reasons"
  }


  dimension: has_reason_single_day_user_telemetry_only {
    type: yesno
    sql: ${TABLE}.has_reason_single_day_user_telemetry_only ;;
    label: "Single day (telemetry - front-end)"
    description: "Whether the server has reported telemetry (from front-end) only for a single day."
    view_label: "Server: Exclusion Reasons"
  }

  dimension: has_reason_single_day_telemetry_only {
    type: yesno
    sql: ${TABLE}.has_reason_single_day_telemetry_only ;;
    label: "Single day (telemetry - all)"
    description: "Whether the server has reported telemetry (both from front-end and server) only for a single day."
    view_label: "Server: Exclusion Reasons"
  }


  # Test server indications

  dimension: has_reason_custom_build_version_format {
    type: yesno
    sql: ${TABLE}.has_reason_custom_build_version_format ;;
    label: "Custom build version"
    description: "Whether the server reported a custom build version format in security update check endpoint."
    view_label: "Server: Exclusion Reasons"
  }

  dimension: has_reason_ran_tests {
    type: yesno
    sql: ${TABLE}.has_reason_ran_tests ;;
    label: "Ran tests"
    description: "Whether the server reported tests ran in security update check."
    view_label: "Server: Exclusion Reasons"
  }

  dimension: has_reason_internal_email {
    type: yesno
    sql: ${TABLE}.has_reason_internal_email ;;
    label: "Internal Email"
    description: "Whether the server is registered with an internal email (i.e. `@mattermost.com`)."
    view_label: "Server: Exclusion Reasons"
  }

  dimension: has_reason_test_server {
    type: yesno
    sql: ${TABLE}.has_reason_test_server ;;
    label: "Test server"
    description: "Whether the server is in the seed file with known test servers. Data originates from seed file."
    view_label: "Server: Exclusion Reasons"
  }

  dimension: has_reason_community {
    type: yesno
    sql: ${TABLE}.has_reason_community ;;
    label: "Community"
    description: "Whether the server is the community server. Data originated from seed file."
    view_label: "Server: Exclusion Reasons"
  }

  # Spam or invalid telemetry

  dimension: has_reason_active_users__registered_users {
    type: yesno
    sql: ${TABLE}.has_reason_active_users__registered_users ;;
    label: "Active users > registered users"
    description: "Whether the server has more active users than registered users."
    view_label: "Server: Exclusion Reasons"
  }

  dimension: has_reason_no_stripe_installation_found {
    type: yesno
    sql: ${TABLE}.has_reason_no_stripe_installation_found ;;
    label: "Not reported in Stripe"
    description: "Whether the server has no installation registered in stripe."
    view_label: "Server: Exclusion Reasons"
  }

  dimension: has_reason_restricted_ip {
    type: yesno
    sql: ${TABLE}.has_reason_restricted_ip ;;
    label: "Restricted IP"
    description: "Whether the server's IP belongs to the list of restricted IP addresses."
    view_label: "Server: Exclusion Reasons"
  }

  dimension: has_reason_invalid_server_id {
    type: yesno
    sql: ${TABLE}.has_reason_invalid_server_id ;;
    label: "Invalid Server ID"
    description: "Whether the server has reported an invalid server id."
    view_label: "Server: Exclusion Reasons"
  }

  # Aggregate all reasons in order to help users that want to select all of them

  dimension: has_any_reason {
    type: yesno
    sql:  ${has_reason_single_day_security_only} or ${has_reason_custom_build_version_format} or ${has_reason_single_day_server_side_telemetry_only} or ${has_reason_single_day_telemetry_only} or ${has_reason_ran_tests} or ${has_reason_active_users__registered_users} or ${has_reason_no_stripe_installation_found} or ${has_reason_single_day_user_telemetry_only} or ${has_reason_restricted_ip} or ${has_reason_invalid_server_id} or ${has_reason_internal_email} or ${has_reason_test_server} or ${has_reason_community};;
    label: "Any reason"
    description: "Whether the server has reported any reason for exclusion"
    view_label: "Server: Exclusion Reasons"
  }

  dimension: always_exclude {
    type: yesno
    sql:  ${has_reason_single_day_security_only} or ${has_reason_custom_build_version_format} or ${has_reason_single_day_server_side_telemetry_only} or ${has_reason_single_day_telemetry_only} or ${has_reason_ran_tests} or ${has_reason_single_day_user_telemetry_only} or ${has_reason_restricted_ip} or ${has_reason_invalid_server_id} or ${has_reason_internal_email} or ${has_reason_test_server} or ${has_reason_community};;
    label: "Always Exclude"
    description: "A combination of exclusion reasons which have to be excluded from production data analyses"
    view_label: "Server: Exclusion Reasons"
  }

}
