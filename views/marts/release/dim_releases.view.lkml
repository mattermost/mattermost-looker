view: dim_releases {

  sql_table_name: "MART_RELEASE".dim_releases ;;

  dimension: version {
    type: string
    sql: ${TABLE}.version ;;
    primary_key: yes
    label: "Version"
    description: "The release's version number."
  }


  dimension: short_version {
    type: string
    sql: ${TABLE}.short_version ;;
    label: "Short version"
    description: "Major and minor version, prefixed with 'v'"
  }



  dimension: version_major {
    type: number
    sql: ${TABLE}."VERSION_MAJOR" ;;
    label: "Major Version"
    description: "The major part of the semantic version"
  }

  dimension: version_minor {
    type: number
    sql: ${TABLE}."VERSION_MINOR" ;;
    label: "Minor Version"
    description: "The minor part of the semantic version"

  }

  dimension: version_patch {
    type: number
    sql: ${TABLE}."VERSION_PATCH" ;;
    label: "Patch Version"
    description: "The patch part of the semantic version"
  }

  dimension_group: release_start {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.release_start_date ;;
    label: "Release Start"
  }



  dimension_group: rc1 {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.rc1_date ;;
    label: "RC1 Cut"
  }


  dimension_group: planned_release {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.planned_release_date ;;
    label: "Planned Release"
  }

  dimension_group: actual_release {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.actual_release_date ;;
    label: "Actual Release"
  }

  dimension: is_supported {
    type: yesno
    sql: ${TABLE}.is_supported ;;
    label: "Is Supported?"
  }


  dimension: release_number {
    type: number
    sql: ${TABLE}.release_number ;;
    hidden:  yes
  }

  dimension: previous_release_version {
    type: string
    sql: ${TABLE}.previous_release_version ;;
    label: "Previous release version"
    description: "The short version (major and minor parts) of the last release before current release. Patch versions are ignored. For example, let's assume that known release versions are `7.8.0`, `7.8.1`, `7.9.0`, `7.10.0`,`8.0.0` and `8.1.0`. Previous release version of `7.9.0` is `7.8.0`, previous version of `8.0.0` is `7.10.0` etc."
  }


  dimension: next_release_version {
    type: string
    sql: ${TABLE}.next_release_version ;;
    label: "Next release version"
    description: "The short version (major and minor parts) of the release following the current release. Patch versions are ignored. For example, let's assume that known release versions are `7.8.0`, `7.8.1`, `7.9.0`, `7.10.0`, `8.0.0` and `8.1.0`. Next release version of `7.8.0` is `7.9.0`, next  version of `7.10.0` is `8.0.0` etc."
  }
}
