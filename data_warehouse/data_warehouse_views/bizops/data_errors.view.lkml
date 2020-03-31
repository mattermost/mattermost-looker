view: data_errors {
  sql_table_name: "BIZOPS"."DATA_ERRORS"
    ;;
  view_label: ""

  dimension: error_long {
    type: string
    sql: ${TABLE}."ERROR_LONG" ;;
  }

  dimension: error_short {
    type: string
    sql: ${TABLE}."ERROR_SHORT" ;;
  }

  dimension: object {
    type: string
    sql: ${TABLE}."OBJECT" ;;
  }

  dimension: object_id {
    type: string
    sql: ${TABLE}."OBJECT_ID" ;;
  }

  dimension: sfdc_name {
    type: string
    sql: coalesce(${account.name},${opportunity.name},'Unknown');;
    link: {
      label: "SFDC Record"
      url: "@{salesforce_link}{{object_id._value}}"
      icon_url: "https://mattermost.my.salesforce.com/favicon.ico"
    }
    label: "SFDC Record"
  }


  measure: count {
    type: count
    drill_fields: [sfdc_name, error_short, error_long]
  }
}
