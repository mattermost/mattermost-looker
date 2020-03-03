view: delete_history {
  sql_table_name: orgm.delete_history__c ;;
  view_label: "Delete History"
  drill_fields: [name, object_type__c, object_id__c, deleted_by__c, deleted_date]

  dimension: id {
    type: number
    hidden:  yes
    sql: ${TABLE}."id" ;;
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

  dimension: createdbyid {
    type: string
    sql: ${TABLE}."createdbyid" ;;
    label: "Created By"
  }

  dimension: createddate {
    type: date
    sql: ${TABLE}."createddate" ;;
    label: "Created Date"
  }


  dimension:  date_processed__c {
    type: string
    sql: ${TABLE}."date_processed__c" ;;
    label: "Date Processed"
  }

  dimension: deleted_by__c {
    type: string
    sql: ${TABLE}."deleted_by__c" ;;
    label: "Deleted By"
  }

  dimension_group: deleted {
    type: time
    timeframes: [
      time,
      date
    ]
    sql: ${TABLE}."deleted_date_time__c" ;;
  }

  dimension: dwh_external_id__c {
    type: string
    sql: ${TABLE}."dwh_external_id__c" ;;
    label: "DWH External ID"
    group_label: "System"
  }


  dimension: lastmodifiedbyid {
    type: string
    sql: ${TABLE}."lastmodifiedbyid" ;;
    label: "Last Modified By"
  }

  dimension: lastmodifieddate {
    type: date
    sql: ${TABLE}."lastmodifieddate" ;;
    label: "Last Modified"
  }

  dimension: name {
    type: string
    sql: ${TABLE}."name" ;;
    link: {
      label: "Salesforce Record"
      # BP: Leverage constants to enable more reused
      url: "@{salesforce_link}{{sfid}}"
    }
    label: "Name"
  }

  dimension: object_id__c {
    type: string
    sql: ${TABLE}."object_id__c" ;;
    label: "Object SFID"
  }

  dimension: object_type__c {
    type: string
    sql: ${TABLE}."object_type__c" ;;
    label: "Object Type"
  }

  dimension: ownerid {
    type: string
    sql: ${TABLE}."ownerid" ;;
    label: "Owner ID"
  }

  dimension: sfid {
    type: string
    sql: ${TABLE}."sfid" ;;
    primary_key: yes
    label: "SFID"
    group_label: "System"
  }

  dimension: systemmodstamp {
    type: date
    sql: ${TABLE}."systemmodstamp" ;;
    label: "Sys Mod Stamp"
    group_label: "System"
  }

  measure: count {
    type: count
    drill_fields: [name, object_type__c, object_id__c, deleted_by__c, deleted_date]
    label: "# Deletes"
  }
}
