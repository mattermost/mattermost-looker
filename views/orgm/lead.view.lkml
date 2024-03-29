# Lead data from salesforce.
#
# Groups Labels
# -

view: lead {
  sql_table_name: ORGM.LEAD ;;
  drill_fields: [lead_drill_fields*]


  #
  # Sets
  #

  set: lead_drill_fields {
    fields: [fullname, email, company, status, lead_source, first_action, first_mcl_date, first_mql_date, count]
  }



  #
  # Filters
  #


  #
  # Dimensions
  #


  dimension: behavior_score {
    sql: ${TABLE}.BEHAVIOR_SCORE__C ;;
    type: number
    group_label: "Marketing"

  }

  dimension: campaign_id {
    sql: ${TABLE}.CAMPAIGN_ID__C ;;
    type: string
    group_label: "Marketing"
    }

  dimension: channel {
    sql: ${TABLE}.CHANNEL__C ;;
    type: string
    group_label: "Marketing"
    }

  dimension: channel_detail {
    sql: ${TABLE}.CHANNEL_DETAIL__C ;;
    type: string
    group_label: "Marketing"
  }

  dimension: company {
    sql: ${TABLE}.COMPANY ;;
    type: string
  }

  dimension: company_country_code {
    sql: ${TABLE}.DSCORGPKG__Company_HQ_Country_Code__c ;;
    type: string
  }


  dimension: convertedaccountid {
    label: "Converted Account ID"
    sql: ${TABLE}.CONVERTEDACCOUNTID ;;
    type: string
    group_label: "Lead Lifecycle: Converted"
  }

  dimension: convertedcontactid {
    label: "Converted Contact ID"
    sql: ${TABLE}.CONVERTEDCONTACTID ;;
    type: string
    group_label: "Lead Lifecycle: Converted"
  }

  dimension_group: converted {
    sql: ${TABLE}.CONVERTEDDATE ;;
    timeframes: [
      date,
      week,
      month,
      fiscal_quarter,
      fiscal_year
    ]
    type: time
    group_label: "Lead Lifecycle: Converted"

  }

  dimension: converted_yn {
    label: "Converted?"
    sql: CASE WHEN ${TABLE}.CONVERTEDDATE IS NULL THEN False ELSE True END ;;
    type: yesno
    group_label: "Lead Lifecycle: Converted"
  }

  dimension: convertedopportunityid {
    label: "Converted Opportunity ID"
    sql: ${TABLE}.CONVERTEDOPPORTUNITYID ;;
    type: string
    group_label: "Lead Lifecycle: Converted"
    }

  dimension: country {
    map_layer_name: countries
    sql: ${TABLE}.COUNTRY ;;
    type: string
    group_label: "Geo"
    }

  dimension: country_code {
    sql: ${TABLE}.COUNTRYCODE ;;
    type: string
    group_label: "Geo"
    }

  dimension: createdbyid {
    label: "Created By ID"
    sql: ${TABLE}.CREATEDBYID ;;
    type: string
    group_label: "Lead Lifecycle: Created"
  }

  dimension_group: created {
    label: "Created"
    sql: ${TABLE}.CREATEDDATE ;;
    timeframes: [
      date,
      week,
      month,
      fiscal_quarter,
      fiscal_year
    ]
    type: time
    group_label: "Lead Lifecycle: Created"
  }

#  dimension: current_sequence_status {
#    sql: ${TABLE}.CURRENT_SEQUENCE_STATUS__C ;;
#    type: string
 # }


  dimension: email {
    sql: ${TABLE}.EMAIL ;;
    type: string
    link: {
      label: "Salesforce Lead"
      # BP: Leverage constants to enable more reused
      url: "@{salesforce_link}{{sfid}}"
    }
  }

  dimension: is_public_domain {
    type: yesno
    sql: ${account_domain_mapping.domain} IS NOT NULL ;;
  }

  dimension: existing_account__c {
    sql: ${TABLE}.EXISTING_ACCOUNT__C ;;
    type: string
  }

  dimension: first_action {
    sql: ${TABLE}.FIRST_ACTION__C ;;
    type: string
    group_label: "Marketing"
    }

  dimension: first_action_detail {
    sql: ${TABLE}.FIRST_ACTION_DETAIL__C ;;
    type: string
    group_label: "Marketing"
    }

  dimension: firstname {
    label: "First Name"
    sql: ${TABLE}.FIRSTNAME ;;
    type: string
  }

  dimension: geo {
    sql: coalesce(${TABLE}.GEO__C,${territory_mapping_country.geo}) ;;
    type: string
    group_label: "Geo"
  }

  dimension: has_opted_out_of_email {
    sql: ${TABLE}.HASOPTEDOUTOFEMAIL ;;
    type: yesno
    group_label: "Marketing"
    }

  dimension: has_opted_out_of_fax {
    sql: ${TABLE}.HASOPTEDOUTOFFAX ;;
    type: yesno
    group_label: "Marketing"
    }

  dimension: how_did_you_hear_about_mattermost {
    sql: ${TABLE}.how_did_you_hear_about_mattermost__c;;
    type: string
  }

  dimension: inbound_outbound {
    sql: ${TABLE}.INBOUND_OUTBOUND__C ;;
    type: string
    group_label: "Marketing"
    }

  dimension: indirect_lead {
    sql: ${TABLE}.INDIRECT_LEAD__C ;;
    type: yesno
  }

  dimension: industry {
    sql: ${TABLE}.INDUSTRY_TEXT__C ;;
    type: string
  }

  dimension: is_deleted {
    sql: ${TABLE}.ISDELETED ;;
    type: yesno
    group_label: "System"
  }

  dimension: job_function {
    sql: ${TABLE}.JOB_FUNCTION__C ;;
    type: string
  }

  dimension: lastmodifiedbyid {
    sql: ${TABLE}.LASTMODIFIEDBYID ;;
    type: string
    group_label: "System"

  }

  dimension_group: last_modified {
    sql: ${TABLE}.LASTMODIFIEDDATE ;;
    timeframes: [
      date,
      week,
      month,
      fiscal_quarter,
      fiscal_year
    ]
    type: time
    group_label: "System"
  }

  dimension: fullname {
    sql: ${TABLE}.LASTNAME || ', ' || ${TABLE}.FIRSTNAME ;;
    type: string
    link: {
      label: "Salesforce Lead"
      # BP: Leverage constants to enable more reused
      url: "@{salesforce_link}{{sfid}}"
    }
  }

  dimension: lastname {
    label: "Last Name"
    sql: ${TABLE}.LASTNAME ;;
    type: string
  }

  dimension: lead2_conv_days {
    sql: ${TABLE}.LEAD2CONVDAYS__C ;;
    type: number
    group_label: "Lead Lifecycle: Converted"
  }

#  dimension: lead2_trial_days {
#    sql: ${TABLE}.LEAD2TRIALDAYS__C ;;
#    type: number
#  }

  dimension: lead_number {
    label: "Lead #"
    sql: ${TABLE}.LEAD_NUMBER__C ;;
    type: string
    group_label: "System"
  }

  dimension: lead_source {
    sql: ${TABLE}.LEAD_SOURCE_TEXT__C ;;
    type: string
    group_label: "Marketing"
  }

  dimension: lead_source_detail {
    sql: ${TABLE}.LEAD_SOURCE_DETAIL__C ;;
    type: string
    group_label: "Marketing"
  }

  dimension: lead_status_at_conversion {
    sql: ${TABLE}.LEAD_STATUS_AT_CONVERSION__C ;;
    type: string
    group_label: "Lead Lifecycle: Converted"
  }

  dimension: lead_type {
    sql: ${TABLE}.LEAD_TYPE__C ;;
    type: string
  }


  dimension: matched_account {
    sql: ${TABLE}.existing_account__c ;;
    type: string
    group_label: "Marketing"
  }

  dimension: mobile_phone {
    sql: ${TABLE}.MOBILEPHONE ;;
    type: string
  }

  dimension: most_recent_action {
    sql: ${TABLE}.MOST_RECENT_ACTION__C ;;
    type: string
    group_label: "Marketing"
  }

  dimension: most_recent_action_detail {
    sql: ${TABLE}.MOST_RECENT_ACTION_DETAIL__C ;;
    type: string
    group_label: "Marketing"
  }

  dimension: most_recent_lead_source {
    sql: ${TABLE}.MOST_RECENT_LEAD_SOURCE__C ;;
    type: string
    group_label: "Marketing"
  }

  dimension: most_recent_lead_source_detail {
    sql: ${TABLE}.MOST_RECENT_LEAD_SOURCE_DETAIL__C ;;
    type: string
    group_label: "Marketing"
  }

  dimension: number_of_employees {
    group_label: "Employee Counts"
    sql: ${TABLE}.NUMBEROFEMPLOYEES ;;
    type: number
  }

  dimension: number_of_end_users {
    sql: ${TABLE}.Number_of_End_Users__c ;;
    type: number
  }


  dimension: company_type {
    sql: case when ${number_of_employees} >= 5000 then 'Enterprise' when ${number_of_employees} > 500 then 'Midmarket' when ${number_of_employees} is not null and ${number_of_employees} !=0 then 'SMB' else 'Unknown Employee Count' end;;
  }

  dimension: unknown_number_of_employees {
    sql: ${number_of_employees} IS NULL;;
    type: yesno
    hidden: yes
  }

  dimension: unknown_country {
    sql: ${country} IS NULL OR ${country} = '';;
    type: yesno
    hidden: yes
  }

  dimension: lead_routing_catgeory {
    sql: CASE WHEN ${unknown_country} AND ${unknown_number_of_employees} THEN 'Both Unknown'
              WHEN NOT ${unknown_country} AND NOT ${unknown_number_of_employees} THEN 'Both Known'
              WHEN NOT ${unknown_country} AND ${unknown_number_of_employees} THEN '# Employees Unknown'
              WHEN ${unknown_country} AND NOT ${unknown_number_of_employees} THEN 'Country Unknown'
              ELSE 'Unknown' END;;
    type: string
  }

  dimension_group: first_mcl {
    group_label: "Lead Lifecycle: MCL"
    label: "MCL First"
    sql: COALESCE(${TABLE}.FIRST_MCL_DATE__C,${created_date}) ;;
    timeframes: [
      date,
      week,
      month,
      fiscal_quarter,
      fiscal_year
    ]
    type: time

  }

  dimension: mcl_yn {
    group_label: "Lead Lifecycle: MCL"
    label: "MCL?"
    type: yesno
    sql: ${first_mcl_date} IS NOT NULL ;;
  }

#  dimension_group: first_mel {
#    group_label: "Lead Lifecycle: MEL"
#    label: "MEL First"
#    sql: ${TABLE}.FIRST_MEL_DATE__C ;;
#    timeframes: [
#      date,
#      week,
#      month,
#      fiscal_quarter,
#      fiscal_year
#    ]
#    type: time
#  }

#  dimension_group: most_recent_mel {
#    group_label: "Lead Lifecycle: MEL"
#    label: "MEL Most Recent"
#    sql: ${TABLE}.MOST_RECENT_MEL_DATE__C ;;
#    timeframes: [
#      date,
#      week,
#      month,
#      fiscal_quarter,
#      fiscal_year
#    ]
#    type: time
#  }

#  dimension: hit_mel {
#    group_label: "Lead Lifecycle: MEL"
#    label: "MEL?"
#    type: yesno
#    sql: ${first_mel_date} IS NOT NULL ;;
#  }

  dimension_group: first_mql {
    group_label: "Lead Lifecycle: MQL"
    label: "MQL First"
    sql: ${TABLE}.FIRST_MQL_DATE__C ;;
    timeframes: [
      date,
      week,
      month,
      fiscal_quarter,
      fiscal_year
    ]
    type: time
  }

  dimension_group: most_recent_mql {
    group_label: "Lead Lifecycle: MQL"
    label: "MQL Most Recent"
    sql: ${TABLE}.MOST_RECENT_MQL_DATE__C ;;
    timeframes: [
      date,
      week,
      month,
      fiscal_quarter_of_year,
      fiscal_quarter,
      fiscal_year
    ]
    type: time
  }

  dimension: most_recent_mql_quarter_string {
    type:  string
    sql:${most_recent_mql_fiscal_year} || '-' || ${most_recent_mql_fiscal_quarter_of_year};;
    label: "MQL Most Recent Fiscal Quarter"
    group_item_label: "MQL Most Recent Fiscal Quarter (String)"
    group_label: "Lead Lifecycle: MQL"
  }

  dimension: mql_yn {
    group_label: "Lead Lifecycle: MQL"
    label: "MQL?"
    type: yesno
    sql: ${first_mql_date} IS NOT NULL ;;
  }

  dimension_group: first_scl {
    group_label: "Lead Lifecycle: SCL"
    label: "SCL First"
    sql: ${TABLE}.FIRST_SCL_DATE__C ;;
    timeframes: [
      date,
      week,
      month,
      fiscal_quarter,
      fiscal_year
    ]
    type: time
  }

  dimension: scl_since_most_recent_mql {
    sql: ${most_recent_scl_date} >= ${most_recent_mql_date} ;;
    type: yesno
    label: "SCL Since Most Recent MQL?"
    group_label: "Lead Lifecycle: SCL"
  }

  dimension_group: most_recent_scl {
    group_label: "Lead Lifecycle: SCL"
    label: "SCL Most Recent"
    sql:${TABLE}.MOST_RECENT_SCL_DATE__C;;
    timeframes: [
      date,
      week,
      month,
      fiscal_quarter,
      fiscal_year
    ]
    type: time
  }

  dimension: time_since_scl {
    group_label: "Lead Lifecycle: SCL"
    sql: case when ${status} = 'SCL' then datediff('day', ${most_recent_scl_date},current_date) else null end ;;
    type: tier
    tiers: [0, 5, 10, 15, 20, 25, 30, 35, 40, 45]
    style: integer
  }

  dimension: time_since_mql {
    group_label: "Lead Lifecycle: MQL"
    sql: case when ${status} = 'MQL' then datediff('day', ${most_recent_mql_date},current_date) else null end ;;
    type: tier
    tiers: [0, 5, 10, 15, 20, 25, 30, 35, 40, 45]
    style: integer
  }

  dimension: scl_yn {
    group_label: "Lead Lifecycle: SCL"
    label: "SCL?"
    type: yesno
    sql: ${first_scl_date} IS NOT NULL ;;
  }

  dimension: mql_to_scl {
    group_label: "Time To"
    label: "Days from MQL to SCL"
    sql: case when ${scl_since_most_recent_mql} then datediff('day', ${most_recent_mql_date},${most_recent_scl_date}) else null end ;;
    type: number
  }

  dimension: scl_to_converted {
    group_label: "Time To"
    label: "Days from SCL to Converted"
    sql: datediff('day', ${most_recent_scl_date},${converted_date}) ;;
    type: number
  }

  dimension_group: first_qsc {
    group_label: "Lead Lifecycle: QSC"
    label: "QSC First"
    sql: ${TABLE}.FIRST_QSC_DATE__C;;
    timeframes: [
      date,
      week,
      month,
      fiscal_quarter,
      fiscal_year
    ]
    type: time
  }

  dimension: qsc_since_most_recent_mql {
    sql: ${first_qsc_date} >= ${most_recent_mql_date} ;;
    type: yesno
    label: "QSC Since Most Recent MQL?"
    group_label: "Lead Lifecycle: QSC"
  }

  dimension: qsc_yn {
    group_label: "Lead Lifecycle: QSC"
    label: "QSC?"
    type: yesno
    sql: ${first_qsc_date} IS NOT NULL ;;
  }

  dimension_group: first_qso {
    group_label: "Lead Lifecycle: QSO"
    label: "QSO First"
    sql: ${TABLE}.FIRST_QSO_DATE__C;;
    timeframes: [
      date,
      week,
      month,
      fiscal_quarter,
      fiscal_year
    ]
    type: time
  }

  dimension: qso_since_most_recent_mql {
    sql: ${first_qso_date} >= ${most_recent_mql_date} ;;
    type: yesno
    label: "QSO Since Most Recent MQL?"
    group_label: "Lead Lifecycle: QSO"
  }

  dimension: qso_yn {
    group_label: "Lead Lifecycle: QSO"
    label: "QSO?"
    type: yesno
    sql: ${first_qso_date} IS NOT NULL ;;
  }

  dimension_group: first_junk {
    group_label: "Lead Lifecycle: Junk"
    label: "Junk"
    sql: ${TABLE}.FIRST_NOT_A_LEAD_DATE__C ;;
    timeframes: [
      date,
      week,
      month,
      fiscal_quarter,
      fiscal_year
    ]
    type: time
  }

  dimension: junk_yn {
    group_label: "Lead Lifecycle: Junk"
    label: "Junk?"
    type: yesno
    sql: ${first_junk_date} IS NOT NULL ;;
  }

  dimension: junk_reason {
    group_label: "Lead Lifecycle: Junk"
    label: "Junk Reason"
    type: string
    sql: ${TABLE}.JUNK_REASON__C ;;
  }

#  dimension_group: first_pql {
#    group_label: "Lead Lifecycle: PQL"
#    label: "PQL First"
#    sql: ${TABLE}.FIRST_PQL_DATE__c ;;
#    timeframes: [
#      date,
#      week,
#      month,
#      fiscal_quarter,
#      fiscal_year
#    ]
#    type: time
#  }

#  dimension: first_pql_type {
#    group_label: "Lead Lifecycle: PQL"
#    label: "PQL First Type"
#    sql: ${TABLE}.FIRST_PQL_TYPE__c ;;
#    type: string
#  }

#  dimension_group: most_recent_pql {
#    group_label: "Lead Lifecycle: PQL"
#    label: "PQL Most Recent"
#    sql: ${TABLE}.MOST_RECENT_PQL_DATE__C ;;
#    timeframes: [
#      date,
#      week,
#      month,
#      fiscal_quarter,
#      fiscal_year
#    ]
#    type: time
#  }

#  dimension: most_recent_pql_type {
#    group_label: "Lead Lifecycle: PQL"
#    label: "PQL Most Recent Type"
#    sql: ${TABLE}.MOST_RECENT_PQL_TYPE__c ;;
#    type: string
#  }

  dimension: actively_being_sequenced {
    group_item_label: "Actively Sequenced?"
    type: yesno
    sql: ${TABLE}.ACTIVELY_BEING_SEQUENCED__C;;
    group_label: "Outreach"
    label: "Outreach Actively Sequenced?"
  }

  dimension: outreach_since_most_recent_mql {
    sql: ${outreach_date} >= ${most_recent_mql_date} ;;
    type: yesno
    label: "Outreach Since Most Recent MQL?"
    group_label: "SCL Minor: Outreach"
  }

  dimension_group: outreach {
    group_label: "SCL Minor: Outreach"
    label: "Outreach"
    sql: ${TABLE}.OUTREACH__C;;
    timeframes: [
      date,
      week,
      month,
      fiscal_quarter,
      fiscal_year
    ]
    type: time
  }

  dimension: clearbit_employee_count{
    group_label: "Employee Counts"
    sql: ${TABLE}.Clearbit_Employee_Count__c ;;
    type: number
  }

  dimension: connected_since_most_recent_mql {
    sql: ${connected_date} >= ${most_recent_mql_date} ;;
    type: yesno
    label: "Connected Since Most Recent MQL?"
    group_label: "SCL Minor: Connected"
  }

  dimension_group: connected {
    group_label: "SCL Minor: Connected"
    label: "Connected"
    sql: ${TABLE}.CONNECTED__C;;
    timeframes: [
      date,
      week,
      month,
      fiscal_quarter,
      fiscal_year
    ]
    type: time
  }


  dimension: never_connected_since_most_recent_mql {
    sql: ${never_connected_date} >= ${most_recent_mql_date} ;;
    type: yesno
    label: "Never Connected Since Most Recent MQL?"
    group_label: "SCL Minor: Never Connected"
  }


  dimension_group: never_connected {
    group_label: "SCL Minor: Never Connected"
    label: "Never Connected"
    sql: ${TABLE}.NEVER_CONNECTED__C;;
    timeframes: [
      date,
      week,
      month,
      fiscal_quarter,
      fiscal_year
    ]
    type: time
  }

  dimension: discovery_call_booked_since_most_recent_mql {
    sql: ${discovery_call_booked_date} >= ${most_recent_mql_date} ;;
    type: yesno
    label: "Discovery Call Booked Since Most Recent MQL?"
    group_label: "SCL Minor: Discovery Call Booked"
  }

  dimension_group: discovery_call_booked {
    group_label: "SCL Minor: Discovery Call Booked"
    label: "Discovery Call Booked"
    sql: ${TABLE}.DISCOVERY_CALL_BOOKED__C;;
    timeframes: [
      date,
      week,
      month,
      fiscal_quarter,
      fiscal_year
    ]
    type: time
  }

  dimension: discovery_call_completed_since_most_recent_mql {
    sql: ${discovery_call_completed_date} >= ${most_recent_mql_date} ;;
    type: yesno
    label: "Discovery Call Completed Since Most Recent MQL?"
    group_label: "SCL Minor: Discovery Call Completed"
  }

  dimension_group: discovery_call_completed {
    group_label: "SCL Minor: Discovery Call Completed"
    label: "Discovery Call Completed"
    sql: ${TABLE}.DISCOVERY_CALL_COMPLETED__C;;
    timeframes: [
      date,
      week,
      month,
      fiscal_quarter,
      fiscal_year
    ]
    type: time
  }

  dimension: discoverorg_employee_count{
    group_label: "Employee Counts"
    sql: ${TABLE}.DiscoverOrg_Employee_Count__c ;;
    type: number
  }

  dimension: employee_count_override {
    group_label: "Employee Counts"
    sql: ${TABLE}.Employee_Count_Override__c ;;
    type: number
  }

  dimension_group: first_recycle {
    group_label: "Lead Lifecycle: Recycle"
    label: "Recycle First"
    sql: ${TABLE}.FIRST_RECYCLE_DATE__C;;
    timeframes: [
      date,
      week,
      month,
      fiscal_quarter,
      fiscal_year
    ]
    type: time
  }

  dimension:recycle_since_most_recent_mql {
    sql: ${most_recent_recycle_date} >= ${most_recent_mql_date} ;;
    type: yesno
    label: "Recycled Since Most Recent MQL?"
    group_label: "Lead Lifecycle: Recycle"
  }

  dimension_group: most_recent_recycle {
    group_label: "Lead Lifecycle: Recycle"
    label: "Recycle Most Recent"
    sql: ${TABLE}.MOST_RECENT_RECYCLE_DATE__C ;;
    timeframes: [
      date,
      week,
      month,
      fiscal_quarter,
      fiscal_year
    ]
    type: time
  }

  dimension: recycle_yn {
    group_label: "Lead Lifecycle: Recycle"
    label: "Recycle?"
    type: yesno
    sql: ${first_recycle_date} IS NOT NULL ;;
  }

  dimension: recycle_reason {
    group_label: "Lead Lifecycle: Recycle"
    label: "Recycle Reason"
    type: string
    sql: ${TABLE}.Recycle_Reason__c ;;
  }

  dimension: name {
    sql: ${TABLE}.NAME ;;
    type: string
    link: {
      label: "SFDC Record"
      url: "@{salesforce_link}{{sfid}}"
      icon_url: "https://mattermost.my.salesforce.com/favicon.ico"
      }
  }

  dimension: ownerid {
    sql: ${TABLE}.ownerid ;;
    type: string
  }

  dimension: owner_name {
    sql: CASE WHEN ${owner.name} IS NOT NULL THEN ${owner.name}
              WHEN ${owner.sfid} = '00G1R000003KGjFUAW' THEN 'Queue: Unassigned'
              WHEN ${owner.sfid} LIKE '00G360000026ZoQ%' THEN 'Queue: Junk'
              WHEN ${owner.sfid} LIKE '00G3p000005V9UP%' THEN 'Queue: Recycled'
              ELSE 'Queue: Undefined'
              END ;;
    type: string
    label: "Owner Name Current"
  }

  dimension: owner_segment {
    type: string
    label: "Lead Owner Segment"
    sql: case when ${owner.sales_segment} is not null then ${owner.sales_segment} when ${junk_yn} then 'Junk' else 'Recycled' end ;;
  }

  dimension: lead_segment {
    type: string
    label: "Lead Segment"
    sql: case when ${owner.sales_segment} is not null AND ${owner.sales_segment} != 'SMB' then ${owner.sales_segment} when ${geo} IN ('AMER','APAC','ROW') then 'AMER/APAC' WHEN ${geo} IS NOT NULL then ${geo} ELSE 'Unknown' end ;;
  }

  dimension: original_owner__c {
    hidden: yes
    sql: coalesce(${TABLE}.original_owner__c, ${ownerid});;
  }

  dimension: original_owner_name {
    type: string
    label: "Owner Name Original"
    sql: ${original_owner.name} ;;
  }

  dimension: partner_email {
    sql: ${TABLE}.PARTNER_EMAIL__C ;;
    type: string
    group_label: "Partner"
  }

  dimension: partner_name {
    sql: ${TABLE}.PARTNER_NAME__C ;;
    type: string
    group_label: "Partner"
    }

  dimension: persona {
    sql: ${TABLE}.PERSONA__C ;;
    type: string
    group_label: "Marketing"
    }

  dimension: phone {
    sql: ${TABLE}.PHONE ;;
    type: string
  }

  dimension: postal_code {
    sql: ${TABLE}.POSTALCODE ;;
    type: string
    group_label: "Geo"
  }

  dimension: quality {
    sql: ${TABLE}.QUALITY__C ;;
    type: string
    group_label: "Marketing"
  }

  dimension: quality_star_rating {
    sql: ${TABLE}.QUALITY_STAR_RATING__C ;;
    type: string
    group_label: "Marketing"
  }

  dimension_group: trial_request {
    label: "Trial Request"
    sql: ${TABLE}.REQUEST_A_TRIAL_DATE__C ;;
    timeframes: [
      date,
      week,
      month,
      fiscal_quarter,
      fiscal_year
    ]
    type: time
  }


  dimension: sfid {
    label: "Lead ID"
    primary_key: yes
    sql: ${TABLE}.SFID ;;
    type: string
    link: {
      label: "Salesforce Lead"
      # BP: Leverage constants to enable more reused
      url: "@{salesforce_link}{{sfid}}"
    }
  }

  dimension: state {
    sql: ${TABLE}.STATE ;;
    type: string
    group_label: "Geo"
  }

  dimension: state_code {
    sql: ${TABLE}.STATECODE ;;
    type: string
    group_label: "Geo"
 }

  dimension: status {
    sql: CASE
           WHEN ${TABLE}.STATUS = 'Not a Lead' THEN 'Junk'
           WHEN ${TABLE}.STATUS = 'MEL' THEN 'MCL'
           ELSE ${TABLE}.STATUS
         END ;;
    type: string
    order_by_field: status_order
  }

  dimension: status_order {
    hidden: yes
    case: {
      when: {
        sql: ${status} = 'Junk';;
        label: "0"
      }
      when: {
        sql: ${status} = 'Recycle';;
        label: "1"
      }
      when: {
        sql: ${status} = 'MCL';;
        label: "2"
      }
      when: {
        sql: ${status} = 'MEL';;
        label: "3"
      }
      when: {
        sql: ${status} = 'MQL';;
        label: "4"
      }
      when: {
        sql: ${status} = 'SCL';;
        label: "5"
      }
      when: {
        sql: ${status} = 'QSC';;
        label: "6"
      }
      when: {
        sql: ${status} = 'QSO';;
        label: "7"
      }
      else: "null"
    }
    type: string
  }

  dimension: lead_status_minor {
    label: "Status Minor"
    sql: CASE WHEN ${status} = 'SCL' THEN coalesce(${TABLE}.LEAD_STATUS_MINOR__C,'') WHEN ${status} = 'Recycle' THEN ${recycle_reason} WHEN ${status} = 'Junk' THEN ${junk_reason} ELSE '' END;;
    type: string
    order_by_field: status_minor_order
  }

  dimension: status_minor_order {
    hidden: yes
    case: {
      when: {
        sql: ${status} = 'Outreach';;
        label: "0"
      }
      when: {
        sql: ${status} = 'Connected';;
        label: "1"
      }
      when: {
        sql: ${status} = 'Discovery Call Booked';;
        label: "2"
      }
      when: {
        sql: ${status} = 'Discovery Call Completed';;
        label: "3"
      }
      when: {
        sql: ${status} = 'Never Connected';;
        label: "4"
      }
      else: "5"
    }
    type: string
  }

  dimension: lead_status_combined {
    label: "Status & Status Minor"
    sql: ${status} || case when ${lead_status_minor} != '' THEN (' - ' || ${lead_status_minor}) ELSE '' END ;;
    type: string
    order_by_field: lead_status_combined_order
  }

  dimension: lead_status_combined_order {
    hidden: yes
    sql: ${status_order}||${status_minor_order};;
    type: string
  }


#  dimension: territory {
 #   sql: ${TABLE}.TERRITORY__C ;;
#    type: string
 # }

#  dimension: territoryid {
#    label: "Territory ID"
#    sql: ${TABLE}.TERRITORYID__C ;;
#    type: string
#  }

  dimension: timeline {
    sql: ${TABLE}.TIMELINE__C ;;
    type: yesno
  }

  dimension: website {
    sql: ${TABLE}.CLEANED_UP_WEBSITE__C ;;
    type: string
  }

  dimension: where_are_you_with_mattermost {
    sql: ${TABLE}.WHERE_ARE_YOU_WITH_MATTERMOST__C ;;
    type: string
  }

  dimension: outreach_cadence_add {
    sql: ${TABLE}.OUTREACH_CADENCE_ADD__C ;;
    type: string
    group_label: "Outreach"
    label: "Outreach Cadence Add"
    group_item_label: "Cadence Add"
  }

  dimension: outreach_manual_create {
    sql: ${TABLE}.OUTREACH_MANUAL_CREATE__C ;;
    type: string
    group_label: "Outreach"
    label: "Outreach Manual Create"
    group_item_label: "Manual Create"
  }

  dimension: name_of_active_sequence {
    sql: ${TABLE}.NAME_OF_CURRENTLY_ACTIVE_SEQUENCE__C ;;
    type: string
    group_label: "Outreach"
    label: "Outreach Sequence Name"
    group_item_label: "Sequence Name"
  }

  dimension: current_sequence_task_due_date {
    sql: ${TABLE}.CURRENT_SEQUENCE_TASK_DUE_DATE__C ;;
    type: date
    group_label: "Outreach"
    label: "Outreach Task Due Date"
    group_item_label: "Task Due Date"
  }

  dimension: current_sequence_step_type {
    sql: ${TABLE}.CURRENT_SEQUENCE_STEP_TYPE__C ;;
    type: string
    group_label: "Outreach"
    label: "Outreach Step Type"
    group_item_label: "Step Type"
  }

  dimension: current_sequence_status {
    sql: ${TABLE}.CURRENT_SEQUENCE_STATUS__C ;;
    type: string
    group_label: "Outreach"
    label: "Outreach Status"
    group_item_label: "Status"
  }

  dimension: current_sequence_step_number {
    sql: ${TABLE}.CURRENT_SEQUENCE_STEP_NUMBER__C ;;
    type: string
    group_label: "Outreach"
    label: "Outreach Step Number"
    group_item_label: "Step Number"
  }

  dimension: current_sequence_user_name {
    sql: ${TABLE}.CURRENT_SEQUENCE_USER_NAME__C ;;
    type: string
    group_label: "Outreach"
    label: "Outreach User Name"
    group_item_label: "User Name"
  }


  #
  # Measures
  #

  measure: companies {
    sql: ${company} ;;
    drill_fields: [lead_drill_fields*]
    label: "# Companies"
    type: count_distinct
  }

  measure: count {
    sql: ${sfid} ;;
    drill_fields: [lead_drill_fields*]
    label: "# Leads"
    type: count_distinct
  }

  measure: count_scl_since_most_recent_mql {
    sql: ${sfid} ;;
    drill_fields: [lead_drill_fields*]
    label: "# SCL Since Most Recent MQL"
    group_item_label: "# SCL"
    group_label: "Since Most Recent MQL Counts"
    filters: [scl_since_most_recent_mql: "yes"]
    type: count_distinct
  }

  measure: count_outreach_since_most_recent_mql {
    sql: ${sfid} ;;
    drill_fields: [lead_drill_fields*]
    label: "# Outreach Since Most Recent MQL"
    group_item_label: "# Outreach"
    group_label: "Since Most Recent MQL Counts"
    filters: [outreach_since_most_recent_mql: "yes"]
    type: count_distinct
  }

  measure: count_connected_call_booked_since_most_recent_mql {
    sql: ${sfid} ;;
    drill_fields: [lead_drill_fields*]
    label: "# Connected Since Most Recent MQL"
    group_item_label: "# Connected"
    group_label: "Since Most Recent MQL Counts"
    filters: [connected_since_most_recent_mql: "yes"]
    type: count_distinct
  }

  measure: count_never_connected_call_booked_since_most_recent_mql {
    sql: ${sfid} ;;
    drill_fields: [lead_drill_fields*]
    label: "# Never Connected Since Most Recent MQL"
    group_item_label: "# Never Connected"
    group_label: "Since Most Recent MQL Counts"
    filters: [never_connected_since_most_recent_mql: "yes"]
    type: count_distinct
  }

  measure: count_discovery_call_booked_since_most_recent_mql {
    sql: ${sfid} ;;
    drill_fields: [lead_drill_fields*]
    label: "# Discovery Call Booked Since Most Recent MQL"
    group_item_label: "# Discovery Call Booked"
    group_label: "Since Most Recent MQL Counts"
    filters: [discovery_call_booked_since_most_recent_mql: "yes"]
    type: count_distinct
  }

  measure: count_discovery_call_completed_since_most_recent_mql {
    sql: ${sfid} ;;
    drill_fields: [lead_drill_fields*]
    label: "# Discovery Call Completed Since Most Recent MQL"
    group_item_label: "# Discovery Call Completed"
    group_label: "Since Most Recent MQL Counts"
    filters: [discovery_call_completed_since_most_recent_mql: "yes"]
    type: count_distinct
  }

  measure: count_qsc_since_most_recent_mql {
    sql: ${sfid} ;;
    drill_fields: [lead_drill_fields*]
    label: "# QSC Since Most Recent MQL"
    group_item_label: "# QSC"
    group_label: "Since Most Recent MQL Counts"
    filters: [qsc_since_most_recent_mql: "yes"]
    type: count_distinct
  }

  measure: count_qso_since_most_recent_mql {
    sql: ${sfid} ;;
    drill_fields: [lead_drill_fields*]
    label: "# QSO Since Most Recent MQL"
    group_item_label: "# QSO"
    group_label: "Since Most Recent MQL Counts"
    filters: [qso_since_most_recent_mql: "yes"]
    type: count_distinct
  }

  measure: count_recycle_since_most_recent_mql {
    sql: ${sfid} ;;
    drill_fields: [lead_drill_fields*]
    label: "# Recycle Since Most Recent MQL"
    group_item_label: "# Recycled"
    group_label: "Since Most Recent MQL Counts"
    filters: [recycle_since_most_recent_mql: "yes"]
    type: count_distinct
  }

  measure: count_conv_y {
    sql: ${sfid} ;;
    filters: {
      field: converted_yn
      value: "yes"
    }
    drill_fields: [lead_drill_fields*]
    label: "# Conv=Y"
    type: count_distinct
  }

  measure: count_conv_n {
    sql: ${sfid} ;;
    filters: {
      field: converted_yn
      value: "no"
    }
    drill_fields: [lead_drill_fields*]
    label: "# Conv=N"
    type: count_distinct
  }


  measure: count_hit_mcl {
    sql: ${sfid} ;;
    filters: {
      field: mcl_yn
      value: "yes"
    }
    drill_fields: [lead_drill_fields*]
    label: "# MCL"
    type: count_distinct
  }

#  measure: count_hit_mel {
#    sql: ${sfid} ;;
#    filters: {
#      field: hit_mel
#      value: "yes"
#    }
#    drill_fields: [lead_drill_fields*]
#    label: "# of Leads Hit MEL"
#    type: count_distinct
#  }

  measure: count_hit_mql {
    sql: ${sfid} ;;
    filters: {
      field: mql_yn
      value: "yes"
    }
    drill_fields: [lead_drill_fields*]
    label: "# MQL"
    type: count_distinct
  }

  measure: count_hit_scl {
    sql: ${sfid} ;;
    filters: {
      field: scl_yn
      value: "yes"
    }
    drill_fields: [lead_drill_fields*]
    label: "# SCL"
    type: count_distinct
  }

  measure: count_hit_qsc {
    sql: ${sfid} ;;
    filters: {
      field: qsc_yn
      value: "yes"
    }
    drill_fields: [lead_drill_fields*]
    label: "# QSC"
    type: count_distinct
  }

  measure: count_hit_qso {
    sql: ${sfid} ;;
    filters: {
      field: qso_yn
      value: "yes"
    }
    drill_fields: [lead_drill_fields*]
    label: "# QSO"
    type: count_distinct
  }

  measure: count_hit_recycle {
    sql: ${sfid} ;;
    filters: {
      field: recycle_yn
      value: "yes"
    }
    drill_fields: [lead_drill_fields*]
    label: "# Recycle"
    type: count_distinct
  }

  measure: count_junk {
    sql: ${sfid} ;;
    filters: {
      field: junk_yn
      value: "yes"
    }
    drill_fields: [lead_drill_fields*]
    label: "# Junk"
    type: count_distinct
  }

  measure: avg_mql_to_scl {
    group_label: "Time To"
    label: "Avg Days from MQL to SCL"
    type: average_distinct
    sql: ${mql_to_scl} ;;
  }

  measure: avg_scl_to_converted {
    group_label: "Time To"
    label: "Avg Days from SCL to Converted"
    type: average_distinct
    sql: ${scl_to_converted} ;;
  }

}
