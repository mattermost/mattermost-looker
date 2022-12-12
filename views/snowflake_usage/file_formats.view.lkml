# The name of this view in Looker is "File Formats"
view: file_formats {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "ACCOUNT_USAGE"."FILE_FORMATS"
    ;;
  drill_fields: [file_format_id]
  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: file_format_id {
    primary_key: yes
    type: number
    sql: ${TABLE}."FILE_FORMAT_ID" ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Binary Format" in Explore.

  dimension: binary_format {
    type: string
    sql: ${TABLE}."BINARY_FORMAT" ;;
  }

  dimension: comment {
    type: string
    sql: ${TABLE}."COMMENT" ;;
  }

  dimension: compression {
    type: string
    sql: ${TABLE}."COMPRESSION" ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."CREATED" ;;
  }

  dimension: date_format {
    type: string
    sql: ${TABLE}."DATE_FORMAT" ;;
  }

  dimension_group: deleted {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."DELETED" ;;
  }

  dimension: error_on_column_count_mismatch {
    type: yesno
    sql: ${TABLE}."ERROR_ON_COLUMN_COUNT_MISMATCH" ;;
  }

  dimension: escape {
    type: string
    sql: ${TABLE}."ESCAPE" ;;
  }

  dimension: escape_unenclosed_field {
    type: string
    sql: ${TABLE}."ESCAPE_UNENCLOSED_FIELD" ;;
  }

  dimension: field_delimiter {
    type: string
    sql: ${TABLE}."FIELD_DELIMITER" ;;
  }

  dimension: field_optionally_enclosed_by {
    type: string
    sql: ${TABLE}."FIELD_OPTIONALLY_ENCLOSED_BY" ;;
  }

  dimension: file_format_catalog {
    type: string
    sql: ${TABLE}."FILE_FORMAT_CATALOG" ;;
  }

  dimension: file_format_catalog_id {
    type: number
    sql: ${TABLE}."FILE_FORMAT_CATALOG_ID" ;;
  }

  dimension: file_format_name {
    type: string
    sql: ${TABLE}."FILE_FORMAT_NAME" ;;
  }

  dimension: file_format_owner {
    type: string
    sql: ${TABLE}."FILE_FORMAT_OWNER" ;;
  }

  dimension: file_format_schema {
    type: string
    sql: ${TABLE}."FILE_FORMAT_SCHEMA" ;;
  }

  dimension: file_format_schema_id {
    type: number
    sql: ${TABLE}."FILE_FORMAT_SCHEMA_ID" ;;
  }

  dimension: file_format_type {
    type: string
    sql: ${TABLE}."FILE_FORMAT_TYPE" ;;
  }

  dimension_group: last_altered {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."LAST_ALTERED" ;;
  }

  dimension: null_if {
    type: string
    sql: ${TABLE}."NULL_IF" ;;
  }

  dimension: record_delimiter {
    type: string
    sql: ${TABLE}."RECORD_DELIMITER" ;;
  }

  dimension: skip_header {
    type: number
    sql: ${TABLE}."SKIP_HEADER" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_skip_header {
    type: sum
    sql: ${skip_header} ;;
  }

  measure: average_skip_header {
    type: average
    sql: ${skip_header} ;;
  }

  dimension: time_format {
    type: string
    sql: ${TABLE}."TIME_FORMAT" ;;
  }

  dimension: timestamp_format {
    type: string
    sql: ${TABLE}."TIMESTAMP_FORMAT" ;;
  }

  dimension: trim_space {
    type: yesno
    sql: ${TABLE}."TRIM_SPACE" ;;
  }

  measure: count {
    type: count
    drill_fields: [file_format_id, file_format_name]
  }
}
