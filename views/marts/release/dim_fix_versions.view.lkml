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

  dimension: version_patch {
    label: "Patch Version"
    description: "The patch part of the semantic version"
    type: number
    sql: ${TABLE}."VERSION_PATCH" ;;
  }

  dimension: is_on_prem_release {
    label: "Is On-prem Fix Version?"
    description: "Whether this fix version is an on-prem fix version"
    type: yesno
    sql: ${TABLE}.is_on_prem_release ;;
  }

  dimension: is_cloud_release {
    label: "Is Cloud Fix Version?"
    description: "Whether this fix version is a Cloud fix version"
    type: yesno
    sql: ${TABLE}.is_cloud_release ;;
  }

  dimension_group: release_start_date {
    label: "Release start date"
    description: "The start date for the release."
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
    sql: ${TABLE}."RELEASE_START_DATE" ;;
  }

  dimension_group: rc1_date {
    label: "RC1 cut date"
    description: "Date that RC1 was cut."
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
    sql: ${TABLE}."RC1_DATE" ;;
  }

  dimension_group: planned_release_date {
    label: "Planned release date"
    description: "The planned date for the release."
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
    sql: ${TABLE}."PLANNED_RELEASE_DATE" ;;
  }

  dimension_group: actual_release_date {
    label: "Actual release date"
    description: "The date the release was actually cut."
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
    sql: ${TABLE}."ACTUAL_RELEASE_DATE" ;;
  }
}
