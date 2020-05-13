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
    fields: [id, name, username]
  }


  #
  # Dimensions
  #

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

  dimension: employeenumber {
    sql: ${TABLE}.EMPLOYEENUMBER ;;
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

  dimension: sfid {
    label: "User ID"
    primary_key: yes
    sql: ${TABLE}.SFID ;;
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

  dimension: sales_segment {
    type: string
    sql: CASE WHEN  ${TABLE}.SALES_SEGMENT__C = 'AMER_APAC' THEN 'AMER/APAC' ELSE ${TABLE}.SALES_SEGMENT__C END;;
  }

  dimension: system_type {
    type: string
    sql: ${TABLE}.SYSTEM_TYPE__C ;;
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

  dimension: validation_exempt {
    sql: ${TABLE}.VALIDATION_EXEMPT__C ;;
    type: yesno
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
