# This is the view file for the analytics.blapi.CONTACT_US_REQUESTS table.
view: CONTACT_US_REQUESTS {
  sql_table_name: blapi.CONTACT_US_REQUESTS ;;
  view_label: "Contact Us Requests"

  # FILTERS

  # DIMENSIONS
  dimension: id {
    description: ""
    type: string
    sql: ${TABLE}.id ;;
    hidden: no
  }

  dimension: name {
    description: ""
    type: string
    sql: ${TABLE}.name ;;
    hidden: no
  }

  dimension: email {
    description: ""
    type: string
    sql: ${TABLE}.email ;;
    hidden: no
  }

  dimension: inquiry_type {
    description: ""
    type: string
    sql: ${TABLE}.inquiry_type ;;
    hidden: no
  }

  dimension: inquiry_issue {
    description: ""
    type: string
    sql: ${TABLE}.inquiry_issue ;;
    hidden: no
  }

  dimension: comment {
    description: ""
    type: string
    sql: ${TABLE}.comment ;;
    hidden: no
  }

  dimension: customer_id {
    description: ""
    type: string
    sql: ${TABLE}.customer_id ;;
    hidden: no
  }

  dimension: source {
    description: ""
    type: string
    sql: ${TABLE}.source ;;
    hidden: no
  }

  dimension: zendesk_ticket_id {
    description: ""
    type: number
    sql: ${TABLE}.zendesk_ticket_id ;;
    hidden: no
  }

  dimension: campaign_member_sfid {
    description: ""
    type: string
    sql: ${TABLE}.campaign_member_sfid ;;
    hidden: no
  }

  dimension: _sdc_deleted_at {
    description: ""
    type: string
    sql: ${TABLE}._sdc_deleted_at ;;
    hidden: no
  }


  # DIMENSION GROUPS/DATES
  dimension_group: created_at {
  description: ""
  type: time
  timeframes: [time, week, date, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.created_at ;;
    hidden: no
  }

  dimension_group: _sdc_extracted_at {
  description: ""
  type: time
  timeframes: [time, week, date, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}._sdc_extracted_at ;;
    hidden: yes
  }

  dimension_group: _sdc_batched_at {
  description: ""
  type: time
  timeframes: [time, week, date, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}._sdc_batched_at ;;
    hidden: yes
  }


  # MEASURES
  measure: count {
    description: "Count of rows/occurrences."
    type: count
  }

  measure: id_count {
    label: " Id Count"
    description: "The distinct count of Contact Us Requests Id within each grouping."
    type: count_distinct
    sql: ${id} ;;
  }

  measure: customer_count {
    label: " Customer Count"
    description: "The distinct count of Contact Us Requests Customers within each grouping."
    type: count_distinct
    sql: ${customer_id} ;;
  }

  measure: zendesk_ticket_id_max {
    description: "The max Zendesk Ticket Ids within each grouping."
    type: max
    group_label: "Zendesk Ticket Id Measures"
    sql: ${zendesk_ticket_id} ;;
  }

  measure: zendesk_ticket_id_min {
    description: "The min Zendesk Ticket Ids within each grouping."
    type: min
    group_label: "Zendesk Ticket Id Measures"
    sql: ${zendesk_ticket_id} ;;
  }

  measure: zendesk_ticket_id_avg {
    description: "The average Zendesk Ticket Ids within each grouping."
    type: average
    group_label: "Zendesk Ticket Id Measures"
    sql: ${zendesk_ticket_id} ;;
  }

  measure: zendesk_ticket_id_median {
    description: "The median  Zendesk Ticket Ids within each grouping."
    type: median
    group_label: "Zendesk Ticket Id Measures"
    sql: ${zendesk_ticket_id} ;;
  }


}
