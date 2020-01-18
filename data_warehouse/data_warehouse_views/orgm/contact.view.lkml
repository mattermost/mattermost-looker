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

  dimension_group: mel {
    sql: ${TABLE}.MEL_DATE__C ;;
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

  dimension: is_mql {
    sql: ${TABLE}.MQL__C ;;
    type: yesno
  }

  dimension_group: mql {
    sql: ${TABLE}.MQL_DATE__C ;;
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

  dimension: name {
    sql: ${TABLE}.NAME ;;
    type: string
  }

  dimension: ownerid {
    sql: ${TABLE}.OWNERID ;;
    type: string
  }

  dimension_group: sal {
    sql: ${TABLE}.SAL_DATE__C ;;
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

  dimension: sfid {
    label: "Contact ID"
    primary_key: yes
    sql: ${TABLE}.SFID ;;
    type: string
  }

  dimension_group: sql {
    sql: ${TABLE}.SQL_DATE__C ;;
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


  #
  # Measures
  #

  measure: count {
    drill_fields: [contact_drill_fields*]
    label: "# of Contacts"
    type: count
  }
}
