view: trial_requests {
  sql_table_name: "BLAPI"."TRIAL_REQUESTS";;

  set: trial_requests_drill {
    fields: [server_id, name, site_name, email, site_url, start_date, end_date, users]
  }

  dimension: sfid {
    hidden: yes
    type: string
    sql: ${TABLE}."SFID" ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}."EMAIL" ;;
    link: {
      label: "Salesforce Link"
      url: "@{salesforce_link}{{sfid}}"
    }
  }

  dimension: lead_status {
    type: string
    sql: ${lead.status} ;;
  }

  dimension_group: end {
    type: time
    timeframes: [
      date,
      month,
      fiscal_quarter,
      fiscal_year
    ]
    sql: ${TABLE}."END_DATE" ;;
  }

  dimension: is_contact {
    hidden: yes
    type: yesno
    sql: ${TABLE}."IS_CONTACT" ;;
  }

  dimension: is_lead {
    hidden: yes
    type: yesno
    sql: ${TABLE}."IS_LEAD" ;;
  }

  dimension: license_id {
    type: string
    sql: ${TABLE}."LICENSE_ID" ;;
  }

  dimension_group: license_issued {
    type: time
    timeframes: [
      time,
      date,
      month,
      fiscal_quarter,
      fiscal_year
    ]
    sql: ${TABLE}."LICENSE_ISSUED_AT" ;;
  }

  dimension: license_payload {
    type: string
    sql: ${TABLE}."LICENSE_PAYLOAD" ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}."NAME" ;;
  }

  dimension: receive_emails_accepted {
    type: yesno
    sql: ${TABLE}."RECEIVE_EMAILS_ACCEPTED" ;;
  }

  dimension: server_id {
    type: string
    sql: ${TABLE}."SERVER_ID" ;;
  }

  dimension: site_name {
    type: string
    sql: ${TABLE}."SITE_NAME" ;;
  }

  dimension: site_url {
    type: string
    sql: ${TABLE}."SITE_URL" ;;
  }

  dimension: product_type {
    label: "Product Type"
    type: string
    sql: CASE WHEN ${site_url} LIKE '%mattermost.com%' THEN 'Website' ELSE 'In-Product' END ;;
  }

  dimension_group: start {
    type: time
    timeframes: [
      date,
      month,
      fiscal_quarter,
      fiscal_year
    ]
    sql: ${TABLE}."START_DATE" ;;
  }

  dimension: terms_accepted {
    type: yesno
    sql: ${TABLE}."TERMS_ACCEPTED" ;;
  }

  dimension: users {
    type: number
    sql: ${TABLE}."USERS" ;;
  }

  dimension: valid_email {
    type: yesno
    sql: ${TABLE}."VALID_EMAIL" ;;
  }

  measure: count {
    type: count_distinct
    sql: ${license_id} ;;
    drill_fields: [trial_requests_drill*]
  }

  measure: instance_count {
    type: count_distinct
    sql: ${server_id} ;;
    drill_fields: [trial_requests_drill*]
  }


}
