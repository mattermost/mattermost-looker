# This is the view file for the analytics.mattermost.server_upgrades table.
view: server_upgrades {
  sql_table_name: mattermost.server_upgrades ;;
  view_label: "Server Upgrades"

  # FILTERS

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
    sql: regexp_substr(${TABLE}.prev_version,'^[0-9]{0,}[.]{1}[0-9[{0,}[.]{1}[0-9]{0,}[.]{1}[0-9]{0,}') ;;
    hidden: no
  }

  dimension: current_version {
    label: "Current Server Version"
    group_label: " Server Version "
    description: "The current server version of the server on the given logging date."
    type: string
    sql: regexp_substr(${TABLE}.current_version,'^[0-9]{0,}[.]{1}[0-9[{0,}[.]{1}[0-9]{0,}[.]{1}[0-9]{0,}') ;;
    hidden: no
  }

  dimension: prev_edition {
    label: "Previous Day Server Edition"
    group_label: "Server Edition"
    description: "The previous day's server edition on the given logging date."
    type: string
    sql: CASE WHEN ${TABLE}.prev_edition = 'true' THEN 'Enterprise Edition' ELSE 'Team Edition' END ;;
    hidden: no
  }

  dimension: current_edition {
    label: "Current Server Edition"
    group_label: "Server Edition"
    description: "The current server edition on the given logging date."
    type: string
    sql: CASE WHEN ${TABLE}.current_edition = 'true' THEN 'Enterprise Edition' ELSE 'Team Edition' END ;;
    hidden: no
  }


  # DIMENSION GROUPS/DATES
  dimension_group: logging {
    description: "The date each row of data was logged."
    type: time
    timeframes: [date, month, year]
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
  }

  measure: server_version_upgrades {
    group_label: "Server Upgrades"
    label: "Server Version Upgrades"
    description: "The distinct count of server version upgrades i.e. a server upgrades from an older Mattermost Server Version to a newer Mattermost Server Version."
    type: count_distinct
    sql: CASE WHEN ${current_version} > COALESCE(${prev_version}, ${current_version}) THEN ${server_id} ELSE NULL END ;;
  }

  measure: server_edition_upgrades {
    group_label: "Server Upgrades"
    label: "Server Edition Upgrades"
    description: "The distinct count of server edition upgrades i.e. a server upgrades from team edition to enterprise edition."
    type: count_distinct
    sql: CASE WHEN ${current_edition} = 'Enterprise Edition' AND ${prev_edition} = 'Team Edition' THEN ${server_id} ELSE NULL END ;;
  }

  measure: license_count {
    label: " License Count"
    description: "The distinct count of Licenses per grouping."
    type: count_distinct
    sql: ${license_id} ;;
  }


}
