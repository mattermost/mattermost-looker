view: form_attribution {
  sql_table_name: "MATTERMOST"."FORM_ATTRIBUTION";;

  dimension: anonymous_id {
    hidden: yes
    type: string
    sql: ${TABLE}."ANONYMOUS_ID" ;;
  }

  dimension: campaignname {
    label: "Campaign Name"
    type: string
    sql: ${TABLE}."CAMPAIGNNAME" ;;
  }

  dimension: contactid {
    hidden: yes
    type: string
    sql: ${TABLE}."CONTACTID" ;;
  }

  dimension: page_path {
    type: string
    sql: ${TABLE}."CONTEXT_PAGE_PATH" ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}."EMAIL" ;;
  }

  dimension: form_id {
    type: string
    sql: ${TABLE}."FORM_ID" ;;
  }

  dimension: form_name {
    type: string
    sql: ${TABLE}."FORM_NAME" ;;
  }

  dimension: form_fill_id {
    primary_key: yes
    type: string
    sql: ${TABLE}."FORM_FILL_ID" ;;
  }

  dimension: lead_status {
    hidden: yes
    type: string
    sql: ${TABLE}."LEAD_STATUS" ;;
  }

  dimension: leadid {
    hidden: yes
    type: string
    sql: ${TABLE}."LEADID" ;;
  }

  dimension_group: form_filled {
    type: time
    timeframes: [
      date,
      week,
      month,
      fiscal_quarter,
      fiscal_year
    ]
    sql: ${TABLE}."TIMESTAMP" ;;
  }

  measure: count_form_fills {
    type: count_distinct
    sql: ${form_fill_id} ;;
    drill_fields: [email, form_name, campaignname]
  }

  measure: count_users {
    type: count_distinct
    sql: ${anonymous_id} ;;
    drill_fields: [anonymous_id]
  }
}
