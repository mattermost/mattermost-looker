# This is the view file for the analytics.util.telemetry_tables table.
view: telemetry_tables {
  sql_table_name: util.telemetry_tables ;;
  view_label: "Telemetry Tables"

  # SETS
  set: table_drill {
    fields: [snapshot_week, table_schema, table_name, data_source, update_type, new_tables, updated_tables, table_updates]
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
              WHEN REGEXP_LIKE(${table}, '[a-zA-Z_]{1,100}.[a-zA-Z_]{1,100}') THEN FALSE
              ELSE TRUE END  ;;
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

  dimension: update_type {
    description: ""
    type: string
    sql: ${TABLE}.update_type ;;
    hidden: no
  }

  dimension: column_count {
    description: ""
    type: number
    sql: ${TABLE}.column_count ;;
    hidden: no
  }

  dimension: prev_day_column_count {
    description: ""
    type: number
    sql: ${TABLE}.prev_day_column_count ;;
    hidden: no
  }


  # DIMENSION GROUPS/DATES
  dimension_group: snapshot {
    label: "Date Added"
    description: ""
    type: time
    timeframes: [week, date, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.snapshot_date ;;
    hidden: no
  }


  # MEASURES
  measure: count {
    description: "Count of rows/occurrences."
    type: count
  }

  measure: column_count_sum {
    description: "The sum of Column Counts within each grouping."
    type: sum
    group_label: "Column Count Measures"
    sql: ${column_count} ;;
  }

  measure: new_tables {
    label: "Table Additions"
    description: "The distinct count of new tables added within the grouped dimension/date."
    type: count_distinct
    sql: CASE WHEN ${update_type} = 'New Table' THEN ${table} ELSE NULL END ;;
    drill_fields: [table_drill*]
  }

  measure: updated_tables {
    label: "Table Updates"
    description: "The distinct count of updated tables within the grouped dimension/date. Updates typically result of additional table properties (columns) being added."
    type: count_distinct
    sql: CASE WHEN ${update_type} = 'New Column' THEN ${table} ELSE NULL END ;;
    drill_fields: [table_drill*]
  }

  measure: table_updates {
    label: "Table Additions & Updates"
    description: " The distinct count of tables that have been added and/or updated within the grouped dimension/date."
    type: count_distinct
    sql: CASE WHEN ${update_type} IS NOT NULL THEN ${table} ELSE NULL END ;;
    drill_fields: [table_drill*]
  }

  measure: column_count_max {
    description: "The max Column Counts within each grouping."
    type: max
    group_label: "Column Count Measures"
    sql: ${column_count} ;;
  }

  measure: column_count_min {
    description: "The min Column Counts within each grouping."
    type: min
    group_label: "Column Count Measures"
    sql: ${column_count} ;;
  }

  measure: column_count_avg {
    description: "The average Column Counts within each grouping."
    type: average
    group_label: "Column Count Measures"
    sql: ${column_count} ;;
  }

  measure: column_count_median {
    description: "The median  Column Counts within each grouping."
    type: median
    group_label: "Column Count Measures"
    sql: ${column_count} ;;
  }

  measure: prev_day_column_count_sum {
    description: "The sum of Prev Day Column Counts within each grouping."
    type: sum
    group_label: "Prev Day Column Count Measures"
    sql: ${prev_day_column_count} ;;
  }

  measure: prev_day_column_count_max {
    description: "The max Prev Day Column Counts within each grouping."
    type: max
    group_label: "Prev Day Column Count Measures"
    sql: ${prev_day_column_count} ;;
  }

  measure: prev_day_column_count_min {
    description: "The min Prev Day Column Counts within each grouping."
    type: min
    group_label: "Prev Day Column Count Measures"
    sql: ${prev_day_column_count} ;;
  }

  measure: prev_day_column_count_avg {
    description: "The average Prev Day Column Counts within each grouping."
    type: average
    group_label: "Prev Day Column Count Measures"
    sql: ${prev_day_column_count} ;;
  }

  measure: prev_day_column_count_median {
    description: "The median  Prev Day Column Counts within each grouping."
    type: median
    group_label: "Prev Day Column Count Measures"
    sql: ${prev_day_column_count} ;;
  }

  measure: snapshot_date_min {
    label: "Min. Date Added"
    type: date
    sql: MIN(${snapshot_date}::DATE) ;;
  }

  measure: snapshot_date_max {
    label: "Max. Date Added"
    type: date
    sql: MAX(${snapshot_date}::DATE) ;;
  }


}
