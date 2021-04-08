# This is the view file for the analytics.focalboard.focalboard_config table.
view: focalboard_config {
  sql_table_name: focalboard.focalboard_config ;;
  view_label: "Focalboard Config"

  # FILTERS

  # DIMENSIONS
  dimension: context_request_ip {
    description: "" 
    type: string
    sql: ${TABLE}.context_request_ip ;;
    hidden: no
  }

  dimension: anonymous_id {
    description: "" 
    type: string
    sql: ${TABLE}.anonymous_id ;;
    hidden: no
  }

  dimension: port {
    description: "" 
    type: yesno
    sql: ${TABLE}.port ;;
    hidden: no
  }

  dimension: user_id {
    description: "" 
    type: string
    sql: ${TABLE}.user_id ;;
    hidden: no
  }

  dimension: usessl {
    description: "" 
    type: yesno
    sql: ${TABLE}.usessl ;;
    hidden: no
  }

  dimension: id {
    description: "" 
    type: string
    sql: ${TABLE}.id ;;
    hidden: no
  }

  dimension: context_library_version {
    description: "" 
    type: string
    sql: ${TABLE}.context_library_version ;;
    hidden: no
  }

  dimension: dbtype {
    description: "" 
    type: string
    sql: ${TABLE}.dbtype ;;
    hidden: no
  }

  dimension: serverroot {
    description: "" 
    type: yesno
    sql: ${TABLE}.serverroot ;;
    hidden: no
  }

  dimension: context_ip {
    description: "" 
    type: string
    sql: ${TABLE}.context_ip ;;
    hidden: no
  }

  dimension: single_user {
    description: "" 
    type: yesno
    sql: ${TABLE}.single_user ;;
    hidden: no
  }

  dimension: event {
    description: "" 
    type: string
    sql: ${TABLE}.event ;;
    hidden: no
  }

  dimension: event_text {
    description: "" 
    type: string
    sql: ${TABLE}.event_text ;;
    hidden: no
  }

  dimension: md5(cast(
    
    coalesce(cast(config.timestamp::date as 
    varchar
), '') || '-' || coalesce(cast(config.user_id as 
    varchar
), '')

 as 
    varchar
)) {
    description: "" 
    type: string
    sql: ${TABLE}.md5(cast(
    
    coalesce(cast(config.timestamp::date as 
    varchar
), '') || '-' || coalesce(cast(config.user_id as 
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

  dimension_group: sent_at {
	description: "" 
	type: time
	timeframes: [time, week, date, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.sent_at ;;
    hidden: no
  }

  dimension_group: received_at {
	description: "" 
	type: time
	timeframes: [time, week, date, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.received_at ;;
    hidden: no
  }

  dimension_group: original_timestamp {
	description: "" 
	type: time
	timeframes: [time, week, date, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.original_timestamp ;;
    hidden: no
  }

  dimension_group: uuid_ts {
	description: "" 
	type: time
	timeframes: [time, week, date, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.uuid_ts ;;
    hidden: no
  }

  
  # MEASURES
  measure: count {
    description: "Count of rows/occurrences."
    type: count
  }

  measure: anonymous_count {
    label: " Anonymous Count"
    description: "The distinct count of Focalboard Config Anonymouss within each grouping."
    type: count_distinct
    sql: ${anonymous_id} ;;
  }

  measure: port_count {
    label: "Port Users"
    description: "The distinct count of Focalboard Config with Port marked true."
    group_label: "User Counts"
    type: count_distinct
    sql: case when ${port} then ${id} else null end ;;
  }

  measure: user_count {
    label: " User Count"
    description: "The distinct count of Focalboard Config Users within each grouping."
    type: count_distinct
    sql: ${user_id} ;;
  }

  measure: usessl_count {
    label: "Usessl Users"
    description: "The distinct count of Focalboard Config with Usessl marked true."
    group_label: "User Counts"
    type: count_distinct
    sql: case when ${usessl} then ${id} else null end ;;
  }

  measure: id_count {
    label: " Id Count"
    description: "The distinct count of Focalboard Config Id within each grouping."
    type: count_distinct
    sql: ${id} ;;
  }

  measure: serverroot_count {
    label: "Serverroot Users"
    description: "The distinct count of Focalboard Config with Serverroot marked true."
    group_label: "User Counts"
    type: count_distinct
    sql: case when ${serverroot} then ${id} else null end ;;
  }

  measure: single_user_count {
    label: "Single Users"
    description: "The distinct count of Focalboard Config with Single User marked true."
    group_label: "User Counts"
    type: count_distinct
    sql: case when ${single_user} then ${id} else null end ;;
  }

  measure: md5(cast(
    
    coalesce(cast(config.timestamp::date as 
    varchar
), '') || '-' || coalesce(cast(config.user as 
    varchar
), '')

 as 
    varchar
))_count {
    label: " Md5(Cast(
    
    Coalesce(Cast(Config.Timestamp::Date As 
    Varchar
), '') || '-' || Coalesce(Cast(Config.User As 
    Varchar
), '')

 As 
    Varchar
)) Count"
    description: "The distinct count of Focalboard Config Md5(Cast(
    
    Coalesce(Cast(Config.Timestamp::Date As 
    Varchar
), '') || '-' || Coalesce(Cast(Config.Users As 
    Varchar
), '')

 As 
    Varchar
)) within each grouping."
    type: count_distinct
    sql: ${md5(cast(
    
    coalesce(cast(config.timestamp::date as 
    varchar
), '') || '-' || coalesce(cast(config.user_id as 
    varchar
), '')

 as 
    varchar
))} ;;
  }


}