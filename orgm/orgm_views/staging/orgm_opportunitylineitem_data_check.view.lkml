view: orgm_opportunitylineitem_data_check {
  sql_table_name: staging.orgm_opportunitylineitem_data_check ;;

  dimension_group: created {
    type: time
    timeframes: [
      time,
      date
    ]
    sql: ${TABLE}."createddate" ;;
    label: "Create Date"
  }

  dimension_group: processed {
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
    sql: ${TABLE}."processed_at" ;;
  }

  dimension: sfid {
    type: string
    sql: ${TABLE}."sfid" ;;
    link: {
      label: "Salesforce Opportunity Line Item"
      url: "@{salesforce_link}{{sfid}}"
    }
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
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
