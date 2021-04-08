# This is the view file for the analytics.focalboard.focalboard_server table.
view: focalboard_server {
  sql_table_name: focalboard.focalboard_server ;;
  view_label: "Focalboard Server"

  # FILTERS

  # DIMENSIONS
  dimension: version {
    description: "" 
    type: string
    sql: ${TABLE}.version ;;
    hidden: no
  }

  dimension: context_ip {
    description: "" 
    type: string
    sql: ${TABLE}.context_ip ;;
    hidden: no
  }

  dimension: event {
    description: "" 
    type: string
    sql: ${TABLE}.event ;;
    hidden: no
  }

  dimension: build_number {
    description: "" 
    type: string
    sql: ${TABLE}.build_number ;;
    hidden: no
  }

  dimension: build_hash {
    description: "" 
    type: string
    sql: ${TABLE}.build_hash ;;
    hidden: no
  }

  dimension: context_library_version {
    description: "" 
    type: string
    sql: ${TABLE}.context_library_version ;;
    hidden: no
  }

  dimension: edition {
    description: "" 
    type: string
    sql: ${TABLE}.edition ;;
    hidden: no
  }

  dimension: event_text {
    description: "" 
    type: string
    sql: ${TABLE}.event_text ;;
    hidden: no
  }

  dimension: anonymous_id {
    description: "" 
    type: string
    sql: ${TABLE}.anonymous_id ;;
    hidden: no
  }

  dimension: context_request_ip {
    description: "" 
    type: string
    sql: ${TABLE}.context_request_ip ;;
    hidden: no
  }

  dimension: user_id {
    description: "" 
    type: string
    sql: ${TABLE}.user_id ;;
    hidden: no
  }

  dimension: operating_system {
    description: "" 
    type: string
    sql: ${TABLE}.operating_system ;;
    hidden: no
  }

  dimension: id {
    description: "" 
    type: string
    sql: ${TABLE}.id ;;
    hidden: no
  }

  dimension: context_library_name {
    description: "" 
    type: string
    sql: ${TABLE}.context_library_name ;;
    hidden: no
  }

  dimension: md5(cast(
    
    coalesce(cast(server.timestamp::date as 
    varchar
), '') || '-' || coalesce(cast(server.user_id as 
    varchar
), '')

 as 
    varchar
)) {
    description: "" 
    type: string
    sql: ${TABLE}.md5(cast(
    
    coalesce(cast(server.timestamp::date as 
    varchar
), '') || '-' || coalesce(cast(server.user_id as 
    varchar
), '')

 as 
    varchar
)) ;;
    hidden: no
  }

  
  # DIMENSION GROUPS/DATES
  dimension_group: logging {
    description: "" 
    type: time
    timeframes: [week, date, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.logging_date ;;
    hidden: no
  }

  dimension_group: timestamp {
	description: "" 
	type: time
	timeframes: [time, week, date, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.timestamp ;;
    hidden: no
  }

  dimension_group: original_timestamp {
	description: "" 
	type: time
	timeframes: [time, week, date, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.original_timestamp ;;
    hidden: no
  }

  dimension_group: sent_at {
	description: "" 
	type: time
	timeframes: [time, week, date, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.sent_at ;;
    hidden: no
  }

  dimension_group: uuid_ts {
	description: "" 
	type: time
	timeframes: [time, week, date, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.uuid_ts ;;
    hidden: no
  }

  dimension_group: received_at {
	description: "" 
	type: time
	timeframes: [time, week, date, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.received_at ;;
    hidden: no
  }

  
  # MEASURES
  measure: count {
    description: "Count of rows/occurrences."
    type: count
  }

  measure: anonymous_count {
    label: " Anonymous Count"
    description: "The distinct count of Focalboard Server Anonymouss within each grouping."
    type: count_distinct
    sql: ${anonymous_id} ;;
  }

  measure: user_count {
    label: " User Count"
    description: "The distinct count of Focalboard Server Users within each grouping."
    type: count_distinct
    sql: ${user_id} ;;
  }

  measure: id_count {
    label: " Id Count"
    description: "The distinct count of Focalboard Server Id within each grouping."
    type: count_distinct
    sql: ${id} ;;
  }

  measure: md5(cast(
    
    coalesce(cast(server.timestamp::date as 
    varchar
), '') || '-' || coalesce(cast(server.user as 
    varchar
), '')

 as 
    varchar
))_count {
    label: " Md5(Cast(
    
    Coalesce(Cast(Server.Timestamp::Date As 
    Varchar
), '') || '-' || Coalesce(Cast(Server.User As 
    Varchar
), '')

 As 
    Varchar
)) Count"
    description: "The distinct count of Focalboard Server Md5(Cast(
    
    Coalesce(Cast(Server.Timestamp::Date As 
    Varchar
), '') || '-' || Coalesce(Cast(Server.Users As 
    Varchar
), '')

 As 
    Varchar
)) within each grouping."
    type: count_distinct
    sql: ${md5(cast(
    
    coalesce(cast(server.timestamp::date as 
    varchar
), '') || '-' || coalesce(cast(server.user_id as 
    varchar
), '')

 as 
    varchar
))} ;;
  }


}