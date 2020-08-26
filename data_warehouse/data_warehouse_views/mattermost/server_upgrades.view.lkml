# This is the view file for the analytics.mattermost.server_upgrades table.
view: server_upgrades {
  sql_table_name: mattermost.server_upgrades ;;
  view_label: " Server Upgrades"

  # SETS
  set: drill_set1 {
    fields: [logging_date, server_id, prev_version, current_version, prev_edition, current_edition]
  }
  # FILTERS
  filter: is_version_upgrade_date {
    description: "Boolean indicating a version upgrade took place on the given logging date."
    type: yesno
    sql: CASE WHEN ${current_version} > COALESCE(${prev_version}, ${current_version}) THEN TRUE ELSE FALSE END ;;
  }

    filter: is_edition_upgrade_date {
    description: "Boolean indicating a version upgrade took place on the given logging date."
    type: yesno
    sql: CASE WHEN ${current_edition} = 'E0' AND ${prev_edition} = 'TE' THEN TRUE ELSE FALSE END ;;
  }

  # DIMENSIONS
  dimension: server_id {
    description: "The unique server id."
    type: string
    sql: ${TABLE}.server_id ;;
    hidden: no
  }

  dimension: account_sfid {
    description: "The Salesforce Account ID associated with the server on the given logging date."
    type: string
    sql: ${TABLE}.account_sfid ;;
    hidden: no
  }

  dimension: license_id {
    description: "The license id associated with the server on the given logging date."
    type: string
    sql: ${TABLE}.license_id ;;
    hidden: no
  }

  dimension: prev_version {
    label: "Previous Server Version"
    group_label: " Server Versions"
    description: "The previous days server version for the server on the given logging date. Useful for tracking origin of server upgrades (i.e. Server upgraded from this version to their current version)."
    type: string
    sql: CASE WHEN regexp_substr(regexp_substr(${TABLE}.prev_version,'[0-9]{0,}[.]{1}[0-9[{0,}[.]{1}[0-9]{0,}[.]{1}[0-9]{0,}[.]{1}[0-9]{0,}[.]{1}[0-9]{0,}[.]{1}[0-9]{0,}'), '[0-9]{0,}[.]{1}[0-9[{0,}[.]{1}[0-9]{0,}[.]{1}[0-9]{0,}$') IS NULL THEN
              regexp_substr(${TABLE}.prev_version,'^[0-9]{0,}[.]{1}[0-9[{0,}[.]{1}[0-9]{0,}[.]{1}[0-9]{0,}')
            ELSE regexp_substr(regexp_substr(${TABLE}.prev_version,'[0-9]{0,}[.]{1}[0-9[{0,}[.]{1}[0-9]{0,}[.]{1}[0-9]{0,}[.]{1}[0-9]{0,}[.]{1}[0-9]{0,}[.]{1}[0-9]{0,}'), '[0-9]{0,}[.]{1}[0-9[{0,}[.]{1}[0-9]{0,}[.]{1}[0-9]{0,}$') END;;
    hidden: no
  }

  dimension: prev_version_major {
    label: "Previous Server Version (Major)"
    group_label: " Server Versions"
    description: "The previous days server version major (truncating dot release) for the server on the given logging date. Useful for tracking origin of server upgrades (i.e. Server upgraded from this version to their current version)."
    type: string
    sql: split_part(${prev_version}, '.', 1) || '.' || split_part(${prev_version}, '.', 2)  ;;
    hidden: no
    order_by_field: prev_server_version_major_sort
  }

  dimension: prev_server_version_major_sort {
    group_label: " Server Versions"
    label: "Previous Server Version: Major (Sort)"
    description: "The current server version, or if current telemetry is not available, the last recorded server version recorded for the server."
    type: number
    sql: (split_part(${prev_version}, '.', 1) ||
          CASE WHEN split_part(${prev_version}, '.', 2) = '10' THEN '99'
            ELSE split_part(${prev_version}, '.', 2) || '0' END)::int ;;
    hidden: yes
  }

  dimension: current_version {
    label: "Current Server Version"
    group_label: " Server Versions"
    description: "The current server version of the server on the given logging date."
    type: string
    sql: CASE WHEN regexp_substr(regexp_substr(${TABLE}.current_version,'[0-9]{0,}[.]{1}[0-9[{0,}[.]{1}[0-9]{0,}[.]{1}[0-9]{0,}[.]{1}[0-9]{0,}[.]{1}[0-9]{0,}[.]{1}[0-9]{0,}'), '[0-9]{0,}[.]{1}[0-9[{0,}[.]{1}[0-9]{0,}[.]{1}[0-9]{0,}$') IS NULL THEN
     regexp_substr(${TABLE}.current_version,'^[0-9]{0,}[.]{1}[0-9[{0,}[.]{1}[0-9]{0,}[.]{1}[0-9]{0,}')
    ELSE regexp_substr(regexp_substr(${TABLE}.current_version,'[0-9]{0,}[.]{1}[0-9[{0,}[.]{1}[0-9]{0,}[.]{1}[0-9]{0,}[.]{1}[0-9]{0,}[.]{1}[0-9]{0,}[.]{1}[0-9]{0,}'), '[0-9]{0,}[.]{1}[0-9[{0,}[.]{1}[0-9]{0,}[.]{1}[0-9]{0,}$') END;;
    hidden: no
  }

  dimension: current_version_major {
    label: "Current Server Version (Major)"
    group_label: " Server Versions"
    description: "The current server version major (truncating dot release) of the server on the given logging date."
    type: string
    sql: split_part(${current_version}, '.', 1) || '.' || split_part(${current_version}, '.', 2)  ;;
    hidden: no
    order_by_field: current_server_version_major_sort
  }

  dimension: current_server_version_major_sort {
    group_label: " Server Versions"
    label: "Current Server Version: Major (Sort)"
    description: "The current server version, or if current telemetry is not available, the last recorded server version recorded for the server."
    type: number
    sql: (split_part(${current_version}, '.', 1) ||
          CASE WHEN split_part(${current_version}, '.', 2) = '10' THEN '99'
            ELSE split_part(${current_version}, '.', 2) || '0' END)::int ;;
    hidden: yes
  }

  dimension: prev_edition {
    label: "Previous Day Server Edition"
    group_label: "Server Edition"
    description: "The previous day's server edition on the given logging date."
    type: string
    sql: CASE WHEN ${TABLE}.prev_edition = 'true' THEN 'E0' ELSE 'TE' END ;;
    hidden: no
  }

  dimension: current_edition {
    label: "Current Server Edition"
    group_label: "Server Edition"
    description: "The current server edition on the given logging date."
    type: string
    sql: CASE WHEN ${TABLE}.current_edition = 'true' THEN 'E0' ELSE 'TE' END ;;
    hidden: no
  }

  dimension: gitlab_install {
    label: "  Gitlab Install"
    description: "Boolean indicating the server's OAuth enable gitlab flag = True on the date of server activation (first logged diagnostics activity date)."
    type: yesno
    sql: ${server_fact.gitlab_install} ;;
  }


  # DIMENSION GROUPS/DATES
  dimension_group: logging {
    description: "The date each row of data was logged."
    type: time
    timeframes: [date, month, year, week, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.date ;;
    hidden: no
  }


  # MEASURES
  measure: count {
    description: "Count of rows/occurrences."
    type: count
  }

  measure: server_count {
    label: " Server Count"
    description: "The distinct count of Servers per grouping."
    type: count_distinct
    sql: ${server_id} ;;
    drill_fields: [drill_set1*]
  }

  measure: server_version_upgrades {
    group_label: "Server Upgrades"
    label: "Server Version Upgrades"
    description: "The distinct count of server version upgrades i.e. a server upgrades from an older Mattermost Server Version to a newer Mattermost Server Version."
    type: count_distinct
    sql: CASE WHEN ${current_version} > COALESCE(${prev_version}, ${current_version}) THEN ${server_id} ELSE NULL END ;;
    drill_fields: [drill_set1*]
  }

  measure: server_edition_upgrades {
    group_label: "Server Upgrades"
    label: "Server Edition Upgrades"
    description: "The distinct count of server edition upgrades i.e. a server upgrades from team edition to enterprise edition."
    type: count_distinct
    sql: CASE WHEN ${current_edition} = 'E0' AND ${prev_edition} = 'TE' THEN ${server_id} ELSE NULL END ;;
    drill_fields: [drill_set1*]
  }

  measure: license_count {
    label: " License Count"
    description: "The distinct count of Licenses per grouping."
    type: count_distinct
    sql: ${license_id} ;;
    drill_fields: [drill_set1*]
  }


}
