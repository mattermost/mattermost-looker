view: dim_fix_versions {
  label: "Fix Versions"
  sql_table_name: "MART_RELEASE"."DIM_FIX_VERSIONS"
    ;;

  dimension: issue_id {
    type: string
    hidden:  yes
    sql: ${TABLE}."ISSUE_ID" ;;
  }

  dimension_group: cloud_release {
    label: "Cloud Release"
    description: "The planned date of the Cloud release"
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."CLOUD_RELEASE_DATE" ;;
  }

  dimension: component {
    description: "The component this release refers to"
    type: string
    sql: ${TABLE}."COMPONENT" ;;
  }

  dimension: fix_version {
    description: "The raw fix version string"
    type: string
    sql: ${TABLE}."FIX_VERSION" ;;
  }

  dimension: semver {
    label: "Version (Semver)"
    description: "The full semantic version (vX.Y), extracted from the fix version string"
    type: string
    sql: ${TABLE}."SEMVER" ;;
  }

  dimension: version_major {
    label: "Major Version"
    description: "The major part of the semantic version"
    type: number
    sql: ${TABLE}."VERSION_MAJOR" ;;
  }

  dimension: version_minor {
    label: "Minor Version"
    description: "The minor part of the semantic version"
    type: number
    sql: ${TABLE}."VERSION_MINOR" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
