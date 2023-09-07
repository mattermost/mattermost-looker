view: dim_version {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "MART_PRODUCT"."DIM_VERSION" ;;
  label: "Dimension: Server Version"

  ##
  ## ID
  ##


  dimension: version_id {
    type: string
    sql: ${TABLE}.version_id ;;
    primary_key: yes
    hidden: yes
  }

  ##
  ## Dimensions
  ##

  dimension: version_full {
    type: string
    sql: ${TABLE}.version_full ;;
    label: "Full version string"
    description: "Full semantic version. I.e. 7.8.1."
    view_label: "Server: Version"
  }


  dimension: version_major {
    type: string
    sql: ${TABLE}.version_major ;;
    label: "Major part"
    description: "The major part of the semantic version. I.e. for 7.8.1 it's `7`."
    view_label: "Server: Version"
  }

  dimension: version_minor {
    type: string
    sql: ${TABLE}.version_minor ;;
    label: "Minor part"
    description: "The minor part of the semantic version. I.e. for 7.8.1 it's `8`."
    view_label: "Server: Version"
  }

  dimension: version_major_minor {
    type: string
    sql: ${TABLE}.version_major_minor ;;
    label: "Major and minor part"
    description: "The major and minor part of the semantic version, concatenated using character `.`. I.e. for 7.8.1 it's `7.8`."
    view_label: "Server: Version"
  }


  dimension: version_patch {
    type: string
    sql: ${TABLE}.version_patch ;;
    label: "Patch part"
    description: "The patch part of the semantic version. I.e. for 7.8.1 it's `1`."
    view_label: "Server: Version"
  }
}
