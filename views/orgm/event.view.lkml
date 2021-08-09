view: event {
  sql_table_name: "ORGM"."EVENT";;
  drill_fields: [sfid]

  dimension: sfid {
    primary_key: yes
    type: string
    sql: ${TABLE}."ID" ;;
  }

  dimension: accountid {
    type: string
    sql: ${TABLE}."ACCOUNTID" ;;
    hidden: yes
  }

  dimension_group: activity {
    type: time
    timeframes: [
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: CAST(${TABLE}."ACTIVITYDATE" AS TIMESTAMP_NTZ) ;;
  }

  dimension: assigned_to_manager {
    type: string
    sql: ${TABLE}."ASSIGNED_TO_MANAGER__C" ;;
  }

  dimension: createdbyid {
    type: string
    sql: ${TABLE}."CREATEDBYID" ;;
    hidden: yes
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: CAST(${TABLE}."CREATEDDATE" AS TIMESTAMP_NTZ) ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}."DESCRIPTION" ;;
  }

  dimension: durationinminutes {
    type: number
    sql: ${TABLE}."DURATIONINMINUTES" ;;
    hidden: yes
  }

  dimension_group: end {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: CAST(${TABLE}."ENDDATETIME" AS TIMESTAMP_NTZ) ;;
  }

  dimension: event_subtype {
    type: string
    sql: ${TABLE}."EVENTSUBTYPE" ;;
  }

  dimension: groupeventtype {
    type: string
    sql: ${TABLE}."GROUPEVENTTYPE" ;;
    hidden: yes
  }

  dimension: isalldayevent {
    type: yesno
    sql: ${TABLE}."ISALLDAYEVENT" ;;
  }

  dimension: isarchived {
    type: yesno
    sql: ${TABLE}."ISARCHIVED" ;;
    hidden: yes
  }

  dimension: ischild {
    type: yesno
    sql: ${TABLE}."ISCHILD" ;;
    hidden: yes
  }

  dimension: isgroupevent {
    type: yesno
    sql: ${TABLE}."ISGROUPEVENT" ;;
    hidden: yes
  }

  dimension: isprivate {
    type: yesno
    sql: ${TABLE}."ISPRIVATE" ;;
    hidden: yes
  }

  dimension: isrecurrence {
    type: yesno
    sql: ${TABLE}."ISRECURRENCE" ;;
    hidden: yes
  }

  dimension: isreminderset {
    type: yesno
    sql: ${TABLE}."ISREMINDERSET" ;;
    hidden: yes
  }

  dimension: lastmodifiedbyid {
    type: string
    sql: ${TABLE}."LASTMODIFIEDBYID" ;;
    hidden: yes
  }

  dimension_group: last_modified {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: CAST(${TABLE}."LASTMODIFIEDDATE" AS TIMESTAMP_NTZ) ;;
  }

  dimension: location {
    type: string
    sql: ${TABLE}."LOCATION" ;;
  }

  dimension: ownerid {
    type: string
    sql: ${TABLE}."OWNERID" ;;
    hidden: yes
  }

  dimension: showas {
    type: string
    sql: ${TABLE}."SHOWAS" ;;
    hidden: yes
  }

  dimension_group: start {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: CAST(${TABLE}."STARTDATETIME" AS TIMESTAMP_NTZ) ;;
  }

  dimension: subject {
    type: string
    sql: ${TABLE}."SUBJECT" ;;
  }

  dimension_group: systemmodstamp {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: CAST(${TABLE}."SYSTEMMODSTAMP" AS TIMESTAMP_NTZ) ;;
    hidden: yes
  }

  dimension: type {
    type: string
    sql: ${TABLE}."TYPE" ;;
  }

  dimension: whatcount {
    type: number
    sql: ${TABLE}."WHATCOUNT" ;;
    hidden: yes
  }

  dimension: whatid {
    type: string
    sql: ${TABLE}."WHATID" ;;
    hidden: yes
  }

  dimension: whocount {
    type: number
    sql: ${TABLE}."WHOCOUNT" ;;
    hidden: yes
  }

  dimension: whoid {
    type: string
    sql: ${TABLE}."WHOID" ;;
    hidden: yes
  }

  measure: count_events {
    type: count_distinct
    sql: ${sfid} ;;
  }

  measure: count_customers {
    type: count_distinct
    sql: ${whoid} ;;
  }
}
