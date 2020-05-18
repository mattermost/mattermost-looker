view: _trigger_log {
  sql_table_name: orgm._trigger_log ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }

  dimension: action {
    type: string
    sql: ${TABLE}."action" ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      time,
      date
    ]
    sql: ${TABLE}."created_at" ;;
  }

  dimension: old {
    type: string
    sql: ${TABLE}."old" ;;
  }

  dimension_group: processed {
    type: time
    timeframes: [
      time,
      date
    ]
    sql: ${TABLE}."processed_at" ;;
  }

  dimension: processed_tx {
    type: number
    sql: ${TABLE}."processed_tx" ;;
  }

  dimension: record_id {
    type: number
    sql: ${TABLE}."record_id" ;;
  }

  dimension: record_name {
    sql: COALESCE(${account.name},${opportunity.name},${opportunitylineitem.name},${billing_entity.cust_email},${opportunitycontactrole.role},${contact.email},${lead.email},${campaignmember.email},'No Match');;
  }

  dimension: sf_message {
    type: string
    sql: ${TABLE}."sf_message" ;;
  }

  dimension: sf_result {
    type: number
    sql: ${TABLE}."sf_result" ;;
  }

  dimension: sfid {
    type: string
    sql: ${TABLE}."sfid" ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}."state" ;;
  }

  dimension: table_name {
    type: string
    sql: ${TABLE}."table_name" ;;
  }

  dimension: txid {
    type: number
    value_format_name: id
    sql: ${TABLE}."txid" ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [
      time,
      date
    ]
    sql: ${TABLE}."updated_at" ;;
  }

  dimension: values {
    type: string
    sql: ${TABLE}."values" ;;
  }

  measure: count {
    type: count
    drill_fields: [record_name,table_name,state,action,created_time,processed_time,record_id,sf_result,sf_message,values]
  }
}
