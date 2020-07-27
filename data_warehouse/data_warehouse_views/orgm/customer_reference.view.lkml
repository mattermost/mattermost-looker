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
    label: "Account SFID"
    type: string
    sql: ${TABLE}."ACCOUNT__C" ;;
    hidden: yes
  }

  dimension: account_name {
    label: "Account Name"
    description: "Salesforce Account Name"
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
    group_label: "Legal"
    description: "Customer contact has approval from their legal team."
    type: string
    sql: ${TABLE}."APPROVED_BY_LEGAL__C" ;;
  }

  dimension: audience {
    label: "Audience"
    description: "Who is this reference for? (e.g. DevOps, ChatOps, Everyone)."
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
    description: "Original creator of the customer reference."
    type: string
    sql: ${creator.name} ;;
  }

  dimension: current_arr {
    type: number
    sql: ${account.arr_current} ;;
    label: "Current Account ARR"
    value_format_name: usd_0
  }

  dimension: account_csm {
    group_label: "Owners"
    label: "Account CSM"
    description: "Assigned CSM for the Account in Salesforce."
    type: string
    sql: ${account_csm.name} ;;
  }

  dimension: account_owner {
    group_label: "Owners"
    label: "Account Owner"
    description: "Assigned Sales Rep for the Account in Salesforce."
    type: string
    sql: ${account_owner.name} ;;
  }

  dimension_group: created {
    label: "Created"
    group_label: "Dates"
    description: "Date, month, FQ or FY the customer reference was created."
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
    description: "Main contact for the reference."
    type: string
    sql: ${TABLE}."CUSTOMER_REFERENCE_CONTACT__C" ;;
  }

  dimension: customer_segmentation_tier {
    type: string
    sql: ${account.customer_segmentation_tier} ;;
    label: "Customer Segmentation Tier"
  }

  dimension: internal_or_external {
    label: "Internal/External"
    group_label: "Legal"
    description: "Can this reference be discussed outside of the walls of Mattermost?"
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
    group_label: "Legal"
    description: "Owner of the reference has reached out to Mattermost legal to ensure there are no clauses in the MSA that the
    Mattermost cannot use their logo or publish case studies."
    type: string
    sql: ${TABLE}."MATTERMOST_LEGAL_SIGN_OFF__C" ;;
  }

  dimension: name {
    label: "Customer Reference Name"
    description: "Name of the reference.  IE: Customer XZY Case Study."
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
    description: "Additional reference details."
    type: string
    sql: ${TABLE}."NOTES__C" ;;
  }

  dimension: ownerid {
    type: string
    sql: ${TABLE}."OWNERID" ;;
    hidden: yes
  }

  dimension: owner {
    group_label: "Owners"
    description: "Owner of the reference.  Could be different from original creator."
    label: "Reference Owner"
    type: string
    sql: ${owner.name} ;;
  }

  dimension: published_reference_url {
    label: "Published Reference URL"
    description: "Link for published case study, LinkedIn story, blog, etc."
    type: string
    sql: ${TABLE}."PUBLISHED_REFERENCE_URL__C" ;;
  }

  dimension: reference_category {
    label: "Reference Category"
    description: "What is the theme for this reference? (e.g. DevOps, Integration, Just Chat, ChatOps)."
    type: string
    sql: ${TABLE}."REFERENCE_CATEGORY__C" ;;
  }

  dimension_group: reference_end {
    label: "Reference End"
    group_label: "Dates"
    description: "Populate if the customer will no longer allow us to use their case study, logo, LinkedIn post, etc.
    Please add to the notes section on why the customer has an end date."
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
    description: "Brief description of how Mattermost impacted the customer."
    type: string
    sql: ${TABLE}."REFERENCE_NOTES__C" ;;
  }

  dimension_group: reference_start {
    label: "Reference Start"
    group_label: "Dates"
    description: "From what date is the reference usable."
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
    description: "How will the reference be shared? (e.g. Case Study, LinkedIn post, Customer Logo)."
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
    description: "Is the reference in progress, identified, completed?"
    type: string
    sql: ${TABLE}."STATUS__C" ;;
    order_by_field: status_order
  }

  dimension: status_order {
    type: number
    sql:  CASE WHEN ${status} = 'Identified' THEN 1
               WHEN ${status} = 'Initiating' THEN 2
               WHEN ${status} = 'Marketing Engaged' THEN 3
               WHEN ${status} = 'In Progress' THEN 4
               WHEN ${status} = 'Final Review' THEN 5
               WHEN ${status} = 'Completed' THEN 6
               WHEN ${status} = 'Declined' THEN 7
               WHEN ${status} = 'Expired' THEN 8
               WHEN ${status} = 'Do Not Use' THEN 9
          ELSE 10 END;;
    hidden: yes
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
    group_label: "Dates"
    description: "If the reference is not completed, what is the expected date of completion?"
    type: time
    timeframes: [
      date,
      month,
      fiscal_quarter,
      fiscal_year
    ]
    sql: CAST(${TABLE}."TARGET_COMPLETION_DATE__C" AS TIMESTAMP_NTZ) ;;
  }

  measure: number_of_accounts {
    label: "# of accounts"
    type: count_distinct
    sql: ${account} ;;
    drill_fields: [name, account.name, account_csm, owner, creator, reference_start_date, reference_category, reference_type, notes, current_arr, customer_segmentation_tier]
  }

  measure: total_current_arr {
    type: sum_distinct
    sql: ${current_arr} ;;
    sql_distinct_key: ${account} ;;
    label: "Current Account ARR"
    value_format_name: usd_0
    drill_fields: [name, account.name, account_csm, owner, creator, reference_start_date, reference_category, reference_type, notes, current_arr, customer_segmentation_tier]
  }

  measure: count {
    label: "# of References"
    type: count
    drill_fields: [name, account.name, account_csm, owner, creator, reference_start_date, reference_category, reference_type, notes, current_arr, customer_segmentation_tier]
  }
}
