# Lead data from salesforce.
#
# Groups Labels
# -

include: "_hc_fields.view"
include: "_sdf_fields.view"
include: "_systemmodstamp.view"

view: lead {
  sql_table_name: ORGM.LEAD ;;
  extends: [ _hc_fields, _sdf_fields, _systemmodstamp ]
  drill_fields: [lead_drill_fields*]


  #
  # Sets
  #

  set: lead_drill_fields {
    fields: [id, firstname, lastname, name, campaignmember.count]
  }


  #
  # Dimensions
  #

  dimension: api_id {
    label: "API ID"
    sql: ${TABLE}.API_ID__C ;;
    type: string
  }

  dimension: assigned_owner {
    sql: ${TABLE}.ASSIGNED_OWNER__C ;;
    type: string
  }

  dimension: behavior_score {
    sql: ${TABLE}.BEHAVIOR_SCORE__C ;;
    type: number
  }

  dimension: campaign_id {
    sql: ${TABLE}.CAMPAIGN_ID__C ;;
    type: string
  }

  dimension: channel {
    sql: ${TABLE}.CHANNEL__C ;;
    type: string
  }

  dimension: channel_detail {
    sql: ${TABLE}.CHANNEL_DETAIL__C ;;
    type: string
  }

  dimension: company {
    sql: ${TABLE}.COMPANY ;;
    type: string
  }

  dimension: convertedaccountid {
    label: "Converted Account ID"
    sql: ${TABLE}.CONVERTEDACCOUNTID ;;
    type: string
  }

  dimension: convertedcontactid {
    label: "Converted Contact ID"
    sql: ${TABLE}.CONVERTEDCONTACTID ;;
    type: string
  }

  dimension_group: converted {
    sql: ${TABLE}.CONVERTEDDATE ;;
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    type: time
  }

  dimension: convertedopportunityid {
    label: "Converted Opportunity ID"
    sql: ${TABLE}.CONVERTEDOPPORTUNITYID ;;
    type: string
  }

  dimension: country {
    map_layer_name: countries
    sql: ${TABLE}.COUNTRY ;;
    type: string
  }

  dimension: country_code {
    sql: ${TABLE}.COUNTRYCODE ;;
    type: string
  }

  dimension: createdbyid {
    label: "Created By ID"
    sql: ${TABLE}.CREATEDBYID ;;
    type: string
  }

  dimension_group: created_at {
    label: "Created"
    sql: ${TABLE}.CREATEDDATE ;;
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    type: time
  }

  dimension: current_sequence_status {
    sql: ${TABLE}.CURRENT_SEQUENCE_STATUS__C ;;
    type: string
  }

  dimension: e_b {
    # description: "TODO"
    sql: ${TABLE}.E_B__C ;;
    type: string
  }

  dimension_group: ebq_added {
    sql: ${TABLE}.EBQ_ADDED__C ;;
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    type: time
  }

  dimension: ebq_cadence {
    sql: ${TABLE}.EBQ_CADENCE__C ;;
    type: string
  }

  dimension: ebq_comments {
    sql: ${TABLE}.EBQ_COMMENTS__C ;;
    type: string
  }

  dimension_group: ebq_completed {
    sql: ${TABLE}.EBQ_COMPLETED__C ;;
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    type: time
  }

  dimension_group: ebq {
    sql: ${TABLE}.EBQ_DATE__C ;;
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    type: time
  }

  dimension_group: ebq_first_touch {
    sql: ${TABLE}.EBQ_FIRST_TOUCH__C ;;
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    type: time
  }

  dimension_group: ebq_next_step {
    sql: ${TABLE}.EBQ_NEXT_STEP__C ;;
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    type: time
  }

  dimension: ebq_rating {
    sql: ${TABLE}.EBQ_RATING__C ;;
    type: string
  }

  dimension: ebq_rep {
    sql: ${TABLE}.EBQ_REP__C ;;
    type: string
  }

  dimension_group: ebq_set {
    sql: ${TABLE}.EBQ_SET__C ;;
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    type: time
  }

  dimension: ebq_touches {
    sql: ${TABLE}.EBQ_TOUCHES__C ;;
    type: number
  }

  dimension: email {
    sql: ${TABLE}.EMAIL ;;
    type: string
  }

  dimension: matched_account {
    sql: ${TABLE}.engagio__Matched_Account__c ;;
    type: string
  }

  dimension: first_action {
    sql: ${TABLE}.FIRST_ACTION__C ;;
    type: string
  }

  dimension: first_action_detail {
    sql: ${TABLE}.FIRST_ACTION_DETAIL__C ;;
    type: string
  }

  dimension: firstname {
    sql: ${TABLE}.FIRSTNAME ;;
    type: string
  }

  dimension: geo {
    sql: ${TABLE}.GEO__C ;;
    type: string
  }

  dimension: has_opted_out_of_email {
    sql: ${TABLE}.HASOPTEDOUTOFEMAIL ;;
    type: yesno
  }

  dimension: has_opted_out_of_fax {
    sql: ${TABLE}.HASOPTEDOUTOFFAX ;;
    type: yesno
  }

  dimension: inbound_outbound {
    sql: ${TABLE}.INBOUND_OUTBOUND__C ;;
    type: string
  }

  dimension: indirect_lead {
    sql: ${TABLE}.INDIRECT_LEAD__C ;;
    type: yesno
  }

  dimension: industry {
    sql: ${TABLE}.INDUSTRY ;;
    type: string
  }

  dimension: is_deleted {
    sql: ${TABLE}.ISDELETED ;;
    type: yesno
  }

  dimension: job_function {
    sql: ${TABLE}.JOB_FUNCTION__C ;;
    type: string
  }

  dimension: lastmodifiedbyid {
    sql: ${TABLE}.LASTMODIFIEDBYID ;;
    type: string
  }

  dimension_group: last_modified {
    sql: ${TABLE}.LASTMODIFIEDDATE ;;
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    type: time
  }

  dimension: lastname {
    sql: ${TABLE}.LASTNAME ;;
    type: string
  }

  dimension: lead2_conv_days {
    sql: ${TABLE}.LEAD2CONVDAYS__C ;;
    type: number
  }

  dimension: lead2_trial_days {
    sql: ${TABLE}.LEAD2TRIALDAYS__C ;;
    type: number
  }

  dimension_group: lead_created {
    sql: ${TABLE}.LEAD_CREATED_DATE__C ;;
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    type: time
  }

  dimension: lead_number {
    sql: ${TABLE}.LEAD_NUMBER__C ;;
    type: string
  }

  dimension: lead_source_detail {
    sql: ${TABLE}.LEAD_SOURCE_DETAIL__C ;;
    type: string
  }

  dimension: lead_status_at_conversion {
    sql: ${TABLE}.LEAD_STATUS_AT_CONVERSION__C ;;
    type: string
  }

  dimension: lead_type {
    sql: ${TABLE}.LEAD_TYPE__C ;;
    type: string
  }

  dimension: lead_source {
    sql: ${TABLE}.LEADSOURCE ;;
    type: string
  }

  dimension_group: mel {
    sql: ${TABLE}.MEL_DATE__C ;;
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    type: time
  }

  dimension: mobile_phone {
    sql: ${TABLE}.MOBILEPHONE ;;
    type: string
  }

  dimension: most_recent_action_detail {
    sql: ${TABLE}.MOST_RECENT_ACTION_DETAIL__C ;;
    type: string
  }

  dimension: most_recent_lead_source {
    sql: ${TABLE}.MOST_RECENT_LEAD_SOURCE__C ;;
    type: string
  }

  dimension: most_recent_lead_source_detail {
    sql: ${TABLE}.MOST_RECENT_LEAD_SOURCE_DETAIL__C ;;
    type: string
  }

  dimension: mql {
    sql: ${TABLE}.MQL__C ;;
    type: yesno
  }

  dimension_group: mql {
    sql: ${TABLE}.MQL_DATE__C ;;
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    type: time
  }

  dimension: name {
    sql: ${TABLE}.NAME ;;
    type: string
  }

  dimension: partner_email {
    sql: ${TABLE}.PARTNER_EMAIL__C ;;
    type: string
  }

  dimension: partner_name {
    sql: ${TABLE}.PARTNER_NAME__C ;;
    type: string
  }

  dimension: persona {
    sql: ${TABLE}.PERSONA__C ;;
    type: string
  }

  dimension: phone {
    sql: ${TABLE}.PHONE ;;
    type: string
  }

  dimension: postal_code {
    sql: ${TABLE}.POSTALCODE ;;
    type: string
  }

  dimension_group: pql {
    sql: ${TABLE}.PQL_DATE__C ;;
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    type: time
  }

  dimension: quality {
    sql: ${TABLE}.QUALITY__C ;;
    type: string
  }

  dimension: quality_star_rating {
    sql: ${TABLE}.QUALITY_STAR_RATING__C ;;
    type: string
  }

  dimension_group: sal {
    sql: ${TABLE}.SAL_DATE__C ;;
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    type: time
  }

  dimension: sfid {
    label: "Lead ID"
    primary_key: yes
    sql: ${TABLE}.SFID ;;
    type: string
  }

  dimension_group: sql {
    sql: ${TABLE}.SQL_DATE__C ;;
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    type: time
  }

  dimension: state {
    sql: ${TABLE}.STATE ;;
    type: string
  }

  dimension: state_code {
    sql: ${TABLE}.STATECODE ;;
    type: string
  }

  dimension: status {
    sql: ${TABLE}.STATUS ;;
    type: string
  }

  dimension: territory {
    sql: ${TABLE}.TERRITORY__C ;;
    type: string
  }

  dimension: territoryid {
    label: "Territory ID"
    sql: ${TABLE}.TERRITORYID__C ;;
    type: string
  }

  dimension: timeline {
    sql: ${TABLE}.TIMELINE__C ;;
    type: yesno
  }

  dimension: website {
    sql: ${TABLE}.WEBSITE ;;
    type: string
  }


  #
  # Measures
  #

  measure: count {
    drill_fields: [lead_drill_fields*]
    label: "# of Leads"
    type: count
  }
}
