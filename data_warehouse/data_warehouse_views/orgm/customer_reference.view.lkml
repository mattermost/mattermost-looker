view: customer_reference {
  sql_table_name: "ORGM"."CUSTOMER_REFERENCE__C"
    ;;
  drill_fields: [id]

  dimension: id {
    hidden: yes
    type: number
    sql: ${TABLE}."ID" ;;
  }

  dimension: account {
    type: string
    sql: ${TABLE}."ACCOUNT__C" ;;
    hidden: yes
  }

  dimension: account_name {
    label: "Account Name"
    type: string
    link: {
      label: "Salesforce Account"
      url: "@{salesforce_link}{{account}}"
      icon_url: "https://mattermost.my.salesforce.com/favicon.ico"
    }
    sql: ${account.name} ;;
  }

  dimension: approved_by_legal {
    label: "Approved by Customer Legal"
    type: string
    sql: ${TABLE}."APPROVED_BY_LEGAL__C" ;;
  }

  dimension: audience {
    label: "Audience"
    type: string
    sql: ${TABLE}."AUDIENCE__C" ;;
  }

  dimension: createdbyid {
    label: "Created By"
    type: string
    sql: ${TABLE}."CREATEDBYID" ;;
    hidden: yes
  }

  dimension: creator {
    label: "Creator"
    type: string
    sql: ${creator.name} ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      date,
      month,
      fiscal_quarter,
      fiscal_year
    ]
    sql: CAST(${TABLE}."CREATEDDATE" AS TIMESTAMP_NTZ) ;;
  }

  dimension: customer_reference_contact {
    label: "Customer Contact"
    type: string
    sql: ${TABLE}."CUSTOMER_REFERENCE_CONTACT__C" ;;
  }

  dimension: internal_or_external {
    label: "Internal/External"
    type: string
    sql: ${TABLE}."INTERNAL_OR_EXTERNAL__C" ;;
  }

  dimension: isdeleted {
    hidden: yes
    type: yesno
    sql: ${TABLE}."ISDELETED" ;;
  }

  dimension: lastmodifiedbyid {
    hidden: yes
    type: string
    sql: ${TABLE}."LASTMODIFIEDBYID" ;;
  }

  dimension_group: lastmodifieddate {
    hidden: yes
    type: time
    timeframes: [
      date,
      month,
      fiscal_quarter,
      fiscal_year
    ]
    sql: CAST(${TABLE}."LASTMODIFIEDDATE" AS TIMESTAMP_NTZ) ;;
  }

  dimension: mattermost_legal_sign_off {
    label: "Mattermost Legal Sign Off"
    type: string
    sql: ${TABLE}."MATTERMOST_LEGAL_SIGN_OFF__C" ;;
  }

  dimension: name {
    label: "Customer Reference Name"
    type: string
    link: {
      label: "Salesforce Customer Reference"
      # BP: Leverage constants to enable more reused
      url: "@{salesforce_link}{{sfid}}"
      icon_url: "https://mattermost.my.salesforce.com/favicon.ico"
    }
    sql: ${TABLE}."NAME" ;;
  }

  dimension: notes {
    label: "Notes"
    type: string
    sql: ${TABLE}."NOTES__C" ;;
  }

  dimension: ownerid {
    type: string
    sql: ${TABLE}."OWNERID" ;;
    hidden: yes
  }

  dimension: owner {
    label: "Owner"
    type: string
    sql: ${owner.name} ;;
  }

  dimension: published_reference_url {
    label: "Published Reference URL"
    type: string
    sql: ${TABLE}."PUBLISHED_REFERENCE_URL__C" ;;
  }

  dimension: reference_category {
    label: "Reference Category"
    type: string
    sql: ${TABLE}."REFERENCE_CATEGORY__C" ;;
  }

  dimension_group: reference_end {
    label: "Reference End"
    type: time
    timeframes: [
      date,
      month,
      fiscal_quarter,
      fiscal_year
    ]
    sql: CAST(${TABLE}."REFERENCE_END_DATE__C" AS TIMESTAMP_NTZ) ;;
  }

  dimension: reference_notes {
    label: "Cool Use Case"
    type: string
    sql: ${TABLE}."REFERENCE_NOTES__C" ;;
  }

  dimension_group: reference_start {
    label: "Reference Start"
    type: time
    timeframes: [
      date,
      month,
      fiscal_quarter,
      fiscal_year
    ]
    sql: CAST(${TABLE}."REFERENCE_START_DATE__C" AS TIMESTAMP_NTZ) ;;
  }

  dimension: reference_type {
    label: "Reference Type"
    type: string
    sql: ${TABLE}."REFERENCE_TYPE__C" ;;
  }

  dimension: sfid {
    primary_key: yes
    type: string
    sql: ${TABLE}."SFID" ;;
    hidden: yes
  }

  dimension: status {
    label: "Status"
    type: string
    sql: ${TABLE}."STATUS__C" ;;
  }

  dimension_group: systemmodstamp {
    type: time
    timeframes: [
      date,
      month,
      fiscal_quarter,
      fiscal_year
    ]
    sql: CAST(${TABLE}."SYSTEMMODSTAMP" AS TIMESTAMP_NTZ) ;;
    hidden: yes
  }

  dimension_group: target_completion {
    label: "Target Completion"
    type: time
    timeframes: [
      date,
      month,
      fiscal_quarter,
      fiscal_year
    ]
    sql: CAST(${TABLE}."TARGET_COMPLETION_DATE__C" AS TIMESTAMP_NTZ) ;;
  }

  measure: count {
    label: "# of references"
    type: count
    drill_fields: [name, account.name, owner, creator, reference_start_date, reference_category, reference_type]
  }
}
