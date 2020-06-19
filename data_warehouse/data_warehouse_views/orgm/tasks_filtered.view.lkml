view: tasks_filtered {
  sql_table_name: "ORGM"."TASKS_FILTERED"
    ;;

  dimension: __sdc_primary_key {
    type: string
    sql: ${TABLE}."__SDC_PRIMARY_KEY" ;;
  }

  dimension_group: _sdc_batched {
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
    sql: ${TABLE}."_SDC_BATCHED_AT" ;;
  }

  dimension_group: _sdc_extracted {
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
    sql: ${TABLE}."_SDC_EXTRACTED_AT" ;;
  }

  dimension_group: _sdc_received {
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
    sql: ${TABLE}."_SDC_RECEIVED_AT" ;;
  }

  dimension: _sdc_sequence {
    type: number
    sql: ${TABLE}."_SDC_SEQUENCE" ;;
  }

  dimension: _sdc_table_version {
    type: number
    sql: ${TABLE}."_SDC_TABLE_VERSION" ;;
  }

  dimension: accountid {
    type: string
    sql: ${TABLE}."ACCOUNTID" ;;
  }

  dimension: sub_type {
    type: string
    group_label: "Customer Feedback"
    sql: ${TABLE}.SUB_TYPE__C ;;
  }

  dimension: sub_type_customer_feedback {
    label: "Customer Feedback"
    group_label: "Customer Feedback"
    type: yesno
    sql: ${sub_type} = 'Customer Feedback' ;;
  }

  dimension: customer_feedback_recording {
    label: "Customer Recording"
    group_label: "Customer Feedback"
   type: yesno
    sql: ${sub_type_customer_feedback} and ${description} like '%#customer-recording%' ;;
}

  dimension_group: activitydate {
    label: "Due Date"
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
    sql: ${TABLE}."ACTIVITYDATE" ;;
  }

  dimension: calldisposition {
    type: string
    sql: ${TABLE}."CALLDISPOSITION" ;;
  }

  dimension: calldurationinseconds {
    type: number
    sql: ${TABLE}."CALLDURATIONINSECONDS" ;;
  }

  dimension: calltype {
    type: string
    sql: ${TABLE}."CALLTYPE" ;;
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
    sql: ${TABLE}."COMPLETEDDATETIME" ;;
  }

  dimension: createdbyid {
    type: string
    sql: ${TABLE}."CREATEDBYID" ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      fiscal_quarter,
      fiscal_year
    ]
    sql: ${TABLE}."CREATEDDATE" ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}."DESCRIPTION" ;;
  }

  dimension: isclosed {
    type: yesno
    sql: ${TABLE}."ISCLOSED" ;;
  }

  dimension: isdeleted {
    type: yesno
    sql: ${TABLE}."ISDELETED" ;;
  }

  dimension: ishighpriority {
    type: yesno
    sql: ${TABLE}."ISHIGHPRIORITY" ;;
  }

  dimension: lastmodifiedbyid {
    type: string
    sql: ${TABLE}."LASTMODIFIEDBYID" ;;
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
    sql: ${TABLE}."LASTMODIFIEDDATE" ;;
  }

  dimension: ownerid {
    type: string
    sql: ${TABLE}."OWNERID" ;;
    hidden: yes
  }

  dimension: owner_name {
    label: "Assigned To"
    type: string
    sql: ${task_owner.name} ;;
  }

  dimension: priority {
    type: string
    sql: ${TABLE}."PRIORITY" ;;
  }

  dimension: sfid {
    type: string
    primary_key: yes
    sql: ${TABLE}."SFID" ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}."STATUS" ;;
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
    sql: ${TABLE}."SYSTEMMODSTAMP" ;;
  }

  dimension: tasksubtype {
    type: string
    sql: ${TABLE}."TASKSUBTYPE" ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}."TYPE" ;;
  }

  dimension_group: updated {
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
    sql: ${TABLE}."UPDATED_AT" ;;
  }

  measure: count_of_tasks {
    type: count_distinct
    sql: ${sfid} ;;
  }

  measure: count_of_customer_feedback_calls {
    group_label: "Customer Feedback"
    label: "# of Customer Feedback Calls"
    type: count_distinct
    sql: ${sfid};;
    filters: {
      field: sub_type_customer_feedback
      value: "yes"
    }
  }

  measure: count_of_customer_recordings {
    group_label: "Customer Feedback"
    label: "# of Customer Recordings"
    type: count_distinct
    sql: ${sfid} ;;
    filters: {
      field: customer_feedback_recording
      value: "yes"
    }
  }

  measure: count_of_accounts_w_tasks {
    type: count_distinct
    sql: ${accountid} ;;
  }
}
