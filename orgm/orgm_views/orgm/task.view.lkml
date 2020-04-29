view: task {
  sql_table_name: orgm.task ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
    group_label: "System"
  }

  dimension: _hc_err {
    type: string
    sql: ${TABLE}."_hc_err" ;;
    group_label: "System"
  }

  dimension: _hc_lastop {
    type: string
    sql: ${TABLE}."_hc_lastop" ;;
    group_label: "System"
  }

  dimension: accountid {
    type: string
    sql: ${TABLE}."accountid" ;;
  }

  dimension_group: activitydate {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."activitydate" ;;
  }

  dimension: calldisposition {
    type: string
    sql: ${TABLE}."calldisposition" ;;
  }

  dimension: calldurationinseconds {
    type: number
    sql: ${TABLE}."calldurationinseconds" ;;
  }

  dimension: callobject {
    type: string
    sql: ${TABLE}."callobject" ;;
  }

  dimension: calltype {
    type: string
    sql: ${TABLE}."calltype" ;;
  }

  dimension_group: completeddatetime {
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
    sql: ${TABLE}."completeddatetime" ;;
  }

  dimension: createdbyid {
    type: string
    sql: ${TABLE}."createdbyid" ;;
  }

  dimension: created_name {
    type: string
    sql: ${creator.name} ;;
  }

  dimension: created_system_type {
    type: string
    sql: ${creator.system_type} ;;
  }

  dimension_group: createddate {
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
    sql: ${TABLE}."createddate" ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}."description" ;;
  }

  dimension: dwh_external_id__c {
    type: string
    sql: ${TABLE}."dwh_external_id__c" ;;
    group_label: "System"
  }

  dimension: isclosed {
    type: yesno
    sql: ${TABLE}."isclosed" ;;
  }

  dimension: isdeleted {
    type: yesno
    sql: ${TABLE}."isdeleted" ;;
    group_label: "System"
  }

  dimension: ishighpriority {
    type: yesno
    sql: ${TABLE}."ishighpriority" ;;
  }

  dimension: lastmodifiedbyid {
    type: string
    sql: ${TABLE}."lastmodifiedbyid" ;;
  }

  dimension_group: lastmodifieddate {
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
    sql: ${TABLE}."lastmodifieddate" ;;
  }

  dimension: ownerid {
    type: string
    sql: ${TABLE}."ownerid" ;;
  }

  dimension: priority {
    type: string
    sql: ${TABLE}."priority" ;;
  }

  dimension: sfid {
    type: string
    sql: ${TABLE}."sfid" ;;
    label: "Task ID"
  }

  dimension: status {
    type: string
    sql: ${TABLE}."status" ;;

  }

  dimension: subject {
    type: string
    sql: ${TABLE}."subject" ;;
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
    sql: ${TABLE}."systemmodstamp" ;;
    group_label: "System"
  }

  dimension: tasksubtype {
    type: string
    sql: ${TABLE}."tasksubtype" ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}."type" ;;
  }

  measure: count {
    type: count
    label: "# Tasks"
    drill_fields: [id]
  }
}
