# This is the view file for the analytics.experimental.hacktoberboard_dev table.
view: hacktoberboard_dev {
  sql_table_name: experimental.hacktoberboard_dev ;;
  view_label: "Hacktoberboard Dev"

  # FILTERS
  dimension: properties {
    sql: OBJECT_CONSTRUCT(*) ;;
    html:
    {% assign words = {{value}} | replace: '}', '' | replace: '{', '' | replace: ', ', '; ' | split: ',' %}
    <ul>
    {% for word in words %}
    <li>{{ word }}</li>
    {% endfor %} ;;
    }

  # DIMENSIONS
  dimension: _dbt_source_relation {
    description: ""
    type: string
    sql: ${TABLE}._dbt_source_relation ;;
    hidden: no
  }

  dimension: dbtype {
    description: ""
    type: string
    sql: ${TABLE}.dbtype ;;
    hidden: no
  }

  dimension: anonymous_id {
    description: ""
    type: string
    sql: ${TABLE}.anonymous_id ;;
    hidden: no
  }

  dimension: event {
    description: ""
    type: string
    sql: ${TABLE}.event ;;
    hidden: no
  }

  dimension: usessl {
    description: ""
    type: yesno
    sql: ${TABLE}.usessl ;;
    hidden: no
  }

  dimension: user_id {
    description: ""
    type: string
    sql: ${TABLE}.user_id ;;
    hidden: no
  }

  dimension: context_ip {
    description: ""
    type: string
    sql: ${TABLE}.context_ip ;;
    hidden: no
  }

  dimension: context_request_ip {
    description: ""
    type: string
    sql: ${TABLE}.context_request_ip ;;
    hidden: no
  }

  dimension: port {
    description: ""
    type: yesno
    sql: ${TABLE}.port ;;
    hidden: no
  }

  dimension: event_text {
    description: ""
    type: string
    sql: ${TABLE}.event_text ;;
    hidden: no
  }

  dimension: serverroot {
    description: ""
    type: yesno
    sql: ${TABLE}.serverroot ;;
    hidden: no
  }

  dimension: context_library_version {
    description: ""
    type: string
    sql: ${TABLE}.context_library_version ;;
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

  dimension: version {
    description: ""
    type: string
    sql: ${TABLE}.version ;;
    hidden: no
  }

  dimension: operating_system {
    description: ""
    type: string
    sql: ${TABLE}.operating_system ;;
    hidden: no
  }

  dimension: build_number {
    description: ""
    type: string
    sql: ${TABLE}.build_number ;;
    hidden: no
  }

  dimension: edition {
    description: ""
    type: string
    sql: ${TABLE}.edition ;;
    hidden: no
  }

  dimension: build_hash {
    description: ""
    type: string
    sql: ${TABLE}.build_hash ;;
    hidden: no
  }


  # DIMENSION GROUPS/DATES
  dimension_group: timestamp {
  description: ""
  type: time
  timeframes: [time, week, date, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.timestamp ;;
    hidden: no
  }

  dimension_group: received_at {
  description: ""
  type: time
  timeframes: [time, week, date, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.received_at ;;
    hidden: no
  }

  dimension_group: uuid_ts {
  description: ""
  type: time
  timeframes: [time, week, date, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.uuid_ts ;;
    hidden: no
  }

  dimension_group: sent_at {
  description: ""
  type: time
  timeframes: [time, week, date, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.sent_at ;;
    hidden: no
  }

  dimension_group: original_timestamp {
  description: ""
  type: time
  timeframes: [time, week, date, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.original_timestamp ;;
    hidden: no
  }


  # MEASURES
  measure: count {
    description: "Count of rows/occurrences."
    type: count
  }

  measure: anonymous_count {
    label: " Anonymous Count"
    description: "The distinct count of Hacktoberboard Dev Anonymouss within each grouping."
    type: count_distinct
    sql: ${anonymous_id} ;;
  }

  measure: usessl_count {
    label: "Usessl Servers"
    description: "The distinct count of Hacktoberboard Dev Servers with Usessl marked true."
    group_label: "User Counts"
    type: count_distinct
    sql: case when ${usessl} then ${user_id} else null end ;;
  }

  measure: user_count {
    label: " Server Count"
    description: "The distinct count of Hacktoberboard Dev Users within each grouping."
    type: count_distinct
    sql: ${user_id} ;;
  }

  measure: port_count {
    label: "Port Servers"
    description: "The distinct count of Hacktoberboard Dev Servers with Port marked true."
    group_label: "User Counts"
    type: count_distinct
    sql: case when ${port} then ${user_id} else null end ;;
  }

  measure: serverroot_count {
    label: "Serverroot Servers"
    description: "The distinct count of Hacktoberboard Dev Servers with Serverroot marked true."
    group_label: "User Counts"
    type: count_distinct
    sql: case when ${serverroot} then ${user_id} else null end ;;
  }

  measure: id_count {
    label: " Id Count"
    description: "The distinct count of Hacktoberboard Dev unique row id's within each grouping."
    type: count_distinct
    sql: ${id} ;;
  }

}
