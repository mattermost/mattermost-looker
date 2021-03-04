# This is the view file for the analytics.util.telemetry_columns table.
view: telemetry_columns {
  sql_table_name: util.telemetry_columns ;;
  view_label: "Telemetry Columns"

  # SETS
  set: telemetry_table_drill {
    fields: [date_added_week, table, data_source, columns_added_c, date_added_min, date_added_max]
  }

  set: telemetry_column_drill {
    fields: [date_added_week, table, data_source, column_name, data_type, date_added_min, date_added_max]
  }

  # DIMENSIONS
  dimension: table_catalog {
    description: ""
    type: string
    sql: ${TABLE}.table_catalog ;;
    hidden: no
  }

  dimension: table_schema {
    description: ""
    type: string
    sql: ${TABLE}.table_schema ;;
    hidden: no
  }

  dimension: table_name {
    description: ""
    type: string
    sql: ${TABLE}.table_name ;;
    hidden: no
  }

  dimension: table {
    description: "String concatenation of both the table schema and table name."
    type: string
    sql: ${table_schema} || '.' || ${table_name} ;;
  }

  dimension: junk_table {
    description: "Boolean indicating the table is a junk table generated from testing, hackathons, or other atypical events."
    type: yesno
    sql: CASE WHEN ${table_name} like 'EVENT_%' THEN TRUE
              WHEN REGEXP_LIKE(${table_name}, '^[A-Za-z]{20}$') THEN TRUE
              WHEN ${table_name} IN ('TRACKS', 'IDENTIFIES', 'RUDDER_DISCARDS', 'USERS', 'SCREENS') THEN TRUE
              WHEN ${table_name} IN ('PAGES') AND ${table_schema} NOT IN ('MATTERMOSTCOM', 'SUPPORT_PORTAL_PROD', 'PORTAL_PROD', 'MATTERMOST_DOCS','PORTAL_TEST') THEN TRUE
              WHEN REGEXP_LIKE(${table}, '[a-zA-Z_]{1,100}.[a-zA-Z_]{1,100}') THEN FALSE
              ELSE TRUE END  ;;
  }

  dimension: column_name {
    description: ""
    type: string
    sql: ${TABLE}.column_name ;;
    hidden: no
  }

  dimension: junk_column {
    description: "Boolean indicating the column is a junk property generated from testing, hackathons, or other atypical events."
    sql: CASE WHEN REGEXP_LIKE(${column_name}, 'CONTEXT_TRAITS_[0-9]{1,100}$') THEN TRUE
              WHEN REGEXP_LIKE(${column_name}, '[_0-9]{1,100}') THEN TRUE
              WHEN REGEXP_LIKE(${column_name}, '[A-Za-z_]{1,100}') THEN FALSE
              ELSE FALSE END ;;
    type: yesno
  }

  dimension: update_type {
    description: "Identifies whether the column additions were a result of a new telemetry property being added to an existing table or if it's an entirely new source of data."
    sql: CASE WHEN ${telemetry_tables.update_type} = 'New Table' THEN 'New Table'
          ELSE 'New Columns' END ;;
    type: string
  }

  dimension: rank {
    description: ""
    type: number
    sql: ${TABLE}.rank ;;
    hidden: no
  }

  dimension: data_type {
    description: "The data type of the new column added to the table."
    type: string
    sql: ${TABLE}.data_type ;;
    hidden: no
  }

  dimension: data_source {
    description: "The source of the table data i.e. Release Candidate (Dev/Test), Quality Assurance or Production. "
    type: string
    sql: CASE WHEN ${table_schema} LIKE '%_QA' THEN 'Quality Assurance'
              WHEN ${table_schema} LIKE '%_DEV' THEN 'Release Candidate (Dev/Test)'
              WHEN ${table_schema} LIKE '%_RC' THEN 'Release Candidate (Dev/Test)'
              WHEN ${table_schema} LIKE '%_TEST' THEN 'Release Candidate (Dev/Test)'
              WHEN ${table_schema} LIKE '%_BETA' THEN 'Release Candidate (Dev/Test)'
              ELSE 'Production' END ;;
  }

  dimension: ordinal_position {
    description: ""
    type: number
    sql: ${TABLE}.ordinal_position ;;
    hidden: no
  }


  # DIMENSION GROUPS/DATES
  dimension_group: date_added {
    description: ""
    type: time
    timeframes: [week, date, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.date_added ;;
    hidden: no
  }


  # MEASURES
  measure: count {
    description: "Count of rows/occurrences."
    type: count
  }

  measure: columns_added {
    label: "Columns Added (T)"
    description: "Counts the distinct columns added to the grouped dimension/date with table-level drill field available."
    type: count_distinct
    sql: ${table} || '.' || ${column_name} ;;
    drill_fields: [telemetry_table_drill*]
  }

  measure: columns_added_c {
    label: "Columns Added (C)"
    description: "Counts the distinct columns added to the grouped dimension/date with column-level drill field available to drill into the columns added."
    type: count_distinct
    sql: ${table} || '.' || ${column_name} ;;
    drill_fields: [telemetry_column_drill*]

  }

  measure: rank_max {
    description: "The max Ranks within each grouping."
    type: max
    group_label: "Rank Measures"
    sql: ${rank} ;;
  }

  measure: rank_min {
    description: "The min Ranks within each grouping."
    type: min
    group_label: "Rank Measures"
    sql: ${rank} ;;
  }

  measure: rank_avg {
    description: "The average Ranks within each grouping."
    type: average
    group_label: "Rank Measures"
    sql: ${rank} ;;
  }

  measure: rank_median {
    description: "The median  Ranks within each grouping."
    type: median
    group_label: "Rank Measures"
    sql: ${rank} ;;
  }

  measure: ordinal_position_max {
    description: "The max Ordinal Positions within each grouping."
    type: max
    group_label: "Ordinal Position Measures"
    sql: ${ordinal_position} ;;
  }

  measure: ordinal_position_min {
    description: "The min Ordinal Positions within each grouping."
    type: min
    group_label: "Ordinal Position Measures"
    sql: ${ordinal_position} ;;
  }

  measure: ordinal_position_avg {
    description: "The average Ordinal Positions within each grouping."
    type: average
    group_label: "Ordinal Position Measures"
    sql: ${ordinal_position} ;;
  }

  measure: ordinal_position_median {
    description: "The median  Ordinal Positions within each grouping."
    type: median
    group_label: "Ordinal Position Measures"
    sql: ${ordinal_position} ;;
  }

  measure: date_added_min {
    label: "Min. Column Added Date"
    type: date
    sql: MIN(${date_added_date}::DATE) ;;
  }

  measure: date_added_max {
    label: "Max. Column Added Date"
    type: date
    sql: MAX(${date_added_date}::DATE) ;;
  }


}
