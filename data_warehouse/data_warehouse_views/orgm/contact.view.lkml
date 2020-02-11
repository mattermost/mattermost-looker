# Contact data from salesforce.
#
# Groups Labels
# -

include: "_hc_fields.view"
include: "_sdf_fields.view"
include: "_systemmodstamp.view"


view: contact {
  sql_table_name: orgm.contact ;;
  extends: [ _hc_fields, _sdf_fields, _systemmodstamp ]
  drill_fields: [contact_drill_fields*]


  #
  # Sets
  #

  set: contact_drill_fields {
    fields: [id]
  }


  #
  # Dimensions
  #

  dimension: accountid {
    sql: ${TABLE}.ACCOUNTID ;;
    type: string
  }

  dimension: createdbyid {
    sql: ${TABLE}.CREATEDBYID ;;
    type: string
  }

  dimension_group: created {
    sql: ${TABLE}.CREATEDDATE ;;
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    type: time
  }

  dimension: do_not_call {
    sql: ${TABLE}.DONOTCALL ;;
    type: yesno
  }

  dimension: email {
    sql: ${TABLE}.EMAIL ;;
    type: string
  }

  dimension: is_deleted {
    sql: ${TABLE}.ISDELETED ;;
    type: yesno
  }

  dimension_group: first_mcl {
    group_label: "Lead Lifecycle"
    sql: ${TABLE}.FIRST_MCL_DATE__C ;;
    timeframes: [
      time,
      date,
      week,
      month,
      fiscal_quarter,
      year,
      fiscal_year
    ]
    type: time
  }

  dimension_group: most_recent_mcl {
    group_label: "Lead Lifecycle"
    sql: ${TABLE}.MOST_RECENT_MCL_DATE__C ;;
    timeframes: [
      time,
      date,
      week,
      month,
      fiscal_quarter,
      year,
      fiscal_year
    ]
    type: time
  }

  dimension_group: first_mel {
    group_label: "Lead Lifecycle"
    sql: ${TABLE}.MEL_DATE__C ;;
    timeframes: [
      time,
      date,
      week,
      month,
      fiscal_quarter,
      year,
      fiscal_year
    ]
    type: time
  }

  dimension_group: most_recent_mel {
    group_label: "Lead Lifecycle"
    sql: ${TABLE}.MOST_RECENT_MEL_DATE__C ;;
    timeframes: [
      time,
      date,
      week,
      month,
      fiscal_quarter,
      year,
      fiscal_year
    ]
    type: time
  }

  dimension_group: first_mql {
    group_label: "Lead Lifecycle"
    sql: ${TABLE}.MQL_DATE__C ;;
    timeframes: [
      time,
      date,
      week,
      month,
      fiscal_quarter,
      year,
      fiscal_year
    ]
    type: time
  }

  dimension_group: most_recent_mql {
    group_label: "Lead Lifecycle"
    sql: ${TABLE}.MOST_RECENT_MQL_DATE__C ;;
    timeframes: [
      time,
      date,
      week,
      month,
      fiscal_quarter,
      year,
      fiscal_year
    ]
    type: time
  }

  dimension_group: first_scl {
    group_label: "Lead Lifecycle"
    sql: ${TABLE}.FIRST_SCL_DATE__C ;;
    timeframes: [
      time,
      date,
      week,
      month,
      fiscal_quarter,
      year,
      fiscal_year
    ]
    type: time
  }

  dimension_group: most_recent_scl {
    group_label: "Lead Lifecycle"
    sql: ${TABLE}.MOST_RECENT_SCL_DATE__C ;;
    timeframes: [
      time,
      date,
      week,
      month,
      fiscal_quarter,
      year,
      fiscal_year
    ]
    type: time
  }

  dimension_group: first_qsc {
    group_label: "Lead Lifecycle"
    sql: ${TABLE}.FIRST_QSC_DATE__C ;;
    timeframes: [
      time,
      date,
      week,
      month,
      fiscal_quarter,
      year,
      fiscal_year
    ]
    type: time
  }

  dimension_group: most_recent_qsc {
    group_label: "Lead Lifecycle"
    sql: ${TABLE}.MOST_RECENT_QSC_DATE__C ;;
    timeframes: [
      time,
      date,
      week,
      month,
      fiscal_quarter,
      year,
      fiscal_year
    ]
    type: time
  }

  dimension_group: first_qso {
    group_label: "Lead Lifecycle"
    sql: ${TABLE}.FIRST_QSO_DATE__C ;;
    timeframes: [
      time,
      date,
      week,
      month,
      fiscal_quarter,
      year,
      fiscal_year
    ]
    type: time
  }

  dimension_group: most_recent_qso {
    group_label: "Lead Lifecycle"
    sql: ${TABLE}.MOST_RECENT_QSO_DATE__C ;;
    timeframes: [
      time,
      date,
      week,
      month,
      fiscal_quarter,
      year,
      fiscal_year
    ]
    type: time
  }

  dimension_group: first_not_a_lead {
    group_label: "Lead Lifecycle"
    sql: ${TABLE}.FIRST_NOT_A_LEAD_DATE__C ;;
    timeframes: [
      time,
      date,
      week,
      month,
      fiscal_quarter,
      year,
      fiscal_year
    ]
    type: time
  }

  dimension_group: first_pql {
    group_label: "Lead Lifecycle"
    sql: ${TABLE}.PQL_DATE__c ;;
    timeframes: [
      time,
      date,
      week,
      month,
      fiscal_quarter,
      year,
      fiscal_year
    ]
    type: time
  }

  dimension: first_pql_type {
    group_label: "Lead Lifecycle"
    sql: ${TABLE}.FIRST_PQL_TYPE__c ;;
    type: string
  }

  dimension_group: most_recent_pql {
    group_label: "Lead Lifecycle"
    sql: ${TABLE}.MOST_RECENT_PQL_DATE__C ;;
    timeframes: [
      time,
      date,
      week,
      month,
      fiscal_quarter,
      year,
      fiscal_year
    ]
    type: time
  }

  dimension: most_recent_pql_type {
    group_label: "Lead Lifecycle"
    sql: ${TABLE}.MOST_RECENT_PQL_TYPE__c ;;
    type: string
  }

  dimension_group: first_recycled {
    group_label: "Lead Lifecycle"
    sql: ${TABLE}.FIRST_RECYCLED_DATE__C ;;
    timeframes: [
      time,
      date,
      week,
      month,
      fiscal_quarter,
      year,
      fiscal_year
    ]
    type: time
  }

  dimension_group: most_recent_recycled {
    group_label: "Lead Lifecycle"
    sql: ${TABLE}.MOST_RECYCLED_QSO_DATE__C ;;
    timeframes: [
      time,
      date,
      week,
      month,
      fiscal_quarter,
      year,
      fiscal_year
    ]
    type: time
  }

  dimension: name {
    sql: ${TABLE}.NAME ;;
    type: string
  }

  dimension: ownerid {
    label: "Owner ID"
    sql: ${TABLE}.OWNERID ;;
    type: string
  }

  dimension: sfid {
    label: "Contact ID"
    primary_key: yes
    sql: ${TABLE}.SFID ;;
    type: string
  }


  #
  # Measures
  #

  measure: count {
    drill_fields: [contact_drill_fields*]
    label: "# of Contacts"
    type: count
  }
}
