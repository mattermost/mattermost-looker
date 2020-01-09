# User data from salesforce.
#
# Groups Labels
# -

include: "_hc_fields.view"
include: "_sdf_fields.view"
include: "_systemmodstamp.view"

view: user {
  sql_table_name: orgm."USER" ;;
  extends: [ _hc_fields, _sdf_fields, _systemmodstamp ]
  drill_fields: [user_drill_fields*]


  #
  # Sets
  #

  set: user_drill_fields {
    fields: [id, sender_name, name, username]
  }


  #
  # Dimensions
  #

  dimension: id {
    primary_key: yes
    sql: ${TABLE}.ID ;;
    type: number
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

  dimension: department {
    sql: ${TABLE}.DEPARTMENT ;;
    type: string
  }

  dimension: email {
    sql: ${TABLE}.EMAIL ;;
    type: string
  }

  dimension: is_active {
    sql: ${TABLE}.ISACTIVE ;;
    type: yesno
  }

  dimension: managerid {
    label: "Manager ID"
    sql: ${TABLE}.MANAGERID ;;
    type: string
  }

  dimension: name {
    sql: ${TABLE}.NAME ;;
    type: string
  }

  dimension: owner_type {
    sql: ${TABLE}.OWNER_TYPE__C ;;
    type: string
  }

  dimension: sales_ops {
    sql: ${TABLE}.SALES_OPS__C ;;
    type: yesno
  }

  dimension: sender_email {
    sql: ${TABLE}.SENDEREMAIL ;;
    type: string
  }

  dimension: sender_name {
    sql: ${TABLE}.SENDERNAME ;;
    type: string
  }

  dimension: sfid {
    sql: ${TABLE}.SFID ;;
    type: string
  }

  dimension: signature {
    sql: ${TABLE}.SIGNATURE ;;
    type: string
  }

  dimension_group: start {
    sql: ${TABLE}.START_DATE__C ;;
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

  dimension: territory {
    sql: ${TABLE}.TERRITORY__C ;;
    type: string
  }

  dimension: title {
    sql: ${TABLE}.TITLE ;;
    type: string
  }

  dimension: username {
    sql: ${TABLE}.USERNAME ;;
    type: string
  }

  dimension: userroleid {
    label: "User Role ID"
    sql: ${TABLE}.USERROLEID ;;
    type: string
  }

  dimension: user_type {
    sql: ${TABLE}.USERTYPE ;;
    type: string
  }


  #
  # Measures
  #

  measure: count {
    drill_fields: [user_drill_fields*]
    label: "# of Users"
    type: count
  }
}
