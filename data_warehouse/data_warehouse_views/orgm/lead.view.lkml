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
    fields: [sfid, contact.name, firstname, lastname, count]
  }

  #
  # Dimensions
  #

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
      date,
      week,
      month,
      fiscal_quarter,
      fiscal_year
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
      date,
      week,
      month,
      fiscal_quarter,
      fiscal_year
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
      date,
      week,
      month,
      fiscal_quarter,
      fiscal_year
    ]
    type: time
  }

  dimension_group: ebq {
    sql: ${TABLE}.EBQ_DATE__C ;;
    timeframes: [
      date,
      week,
      month,
      fiscal_quarter,
      fiscal_year
    ]
    type: time
  }

  dimension_group: ebq_first_touch {
    sql: ${TABLE}.EBQ_FIRST_TOUCH__C ;;
    timeframes: [
      date,
      week,
      month,
      fiscal_quarter,
      fiscal_year
    ]
    type: time
  }

  dimension_group: ebq_next_step {
    sql: ${TABLE}.EBQ_NEXT_STEP__C ;;
    timeframes: [
      date,
      week,
      month,
      fiscal_quarter,
      fiscal_year
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
      date,
      week,
      month,
      fiscal_quarter,
      fiscal_year
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

#   dimension: industry {
#     sql: ${TABLE}.INDUSTRY ;;
#     type: string
#   }

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
      date,
      week,
      month,
      fiscal_quarter,
      fiscal_year
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

  dimension: lead_number {
    label: "Lead #"
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
    sql: ${TABLE}.LEAD_SOURCE_TEXT__C ;;
    type: string
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

  dimension_group: first_mcl {
    group_label: "Lead Lifecycle: MCL"
    label: "First"
    sql: coalesce(${TABLE}.FIRST_MCL_DATE__C,${lead_status_dates.first_mcl_date}) ;;
    timeframes: [
      date,
      week,
      month,
      fiscal_quarter,
      fiscal_year
    ]
    type: time
  }

  dimension_group: most_recent_mcl {
    group_label: "Lead Lifecycle: MCL"
    label: "Most Recent"
    sql: coalesce(${TABLE}.MOST_RECENT_MCL_DATE__C,${lead_status_dates.most_recent_mcl_date}) ;;
    timeframes: [
      date,
      week,
      month,
      fiscal_quarter,
      fiscal_year
    ]
    type: time
  }

  dimension: hit_mcl {
    group_label: "Lead Lifecycle: MCL"
    label: "Hit MCL?"
    type: yesno
    sql: ${first_mcl_date} IS NOT NULL ;;
  }

  dimension_group: first_mel {
    group_label: "Lead Lifecycle: MEL"
    label: "First"
    sql: coalesce(${TABLE}.FIRST_MEL_DATE__C,${lead_status_dates.first_mel_date}) ;;
    timeframes: [
      date,
      week,
      month,
      fiscal_quarter,
      fiscal_year
    ]
    type: time
  }

  dimension_group: most_recent_mel {
    group_label: "Lead Lifecycle: MEL"
    label: "Most Recent"
    sql: coalesce(${TABLE}.MOST_RECENT_MEL_DATE__C,${lead_status_dates.most_recent_mel_date}) ;;
    timeframes: [
      date,
      week,
      month,
      fiscal_quarter,
      fiscal_year
    ]
    type: time
  }

  dimension: hit_mel {
    group_label: "Lead Lifecycle: MEL"
    label: "Hit MEL?"
    type: yesno
    sql: ${first_mel_date} IS NOT NULL ;;
  }

  dimension_group: first_mql {
    group_label: "Lead Lifecycle: MQL"
    label: "First"
    sql: coalesce(${TABLE}.FIRST_MQL_DATE__C,${lead_status_dates.first_mql_date}) ;;
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
    label: "Most Recent"
    sql: coalesce(${TABLE}.MOST_RECENT_MQL_DATE__C,${lead_status_dates.most_recent_mql_date}) ;;
    timeframes: [
      date,
      week,
      month,
      fiscal_quarter,
      fiscal_year
    ]
    type: time
  }

  dimension: hit_mql {
    group_label: "Lead Lifecycle: MQL"
    label: "Hit MQL?"
    type: yesno
    sql: ${first_mql_date} IS NOT NULL ;;
  }

  dimension_group: first_scl {
    group_label: "Lead Lifecycle: SCL"
    label: "First"
    sql: coalesce(${TABLE}.FIRST_SCL_DATE__C,${lead_status_dates.first_scl_date}) ;;
    timeframes: [
      date,
      week,
      month,
      fiscal_quarter,
      fiscal_year
    ]
    type: time
  }

  dimension_group: most_recent_scl {
    group_label: "Lead Lifecycle: SCL"
    label: "Most Recent"
    sql: coalesce(${TABLE}.MOST_RECENT_SCL_DATE__C,${lead_status_dates.most_recent_scl_date}) ;;
    timeframes: [
      date,
      week,
      month,
      fiscal_quarter,
      fiscal_year
    ]
    type: time
  }

  dimension: hit_scl {
    group_label: "Lead Lifecycle: SCL"
    label: "Hit SCL?"
    type: yesno
    sql: ${first_scl_date} IS NOT NULL ;;
  }

  dimension_group: first_qsc {
    group_label: "Lead Lifecycle: QSC"
    label: "First"
    sql: coalesce(${TABLE}.FIRST_QSC_DATE__C,${lead_status_dates.first_qsc_date}) ;;
    timeframes: [
      date,
      week,
      month,
      fiscal_quarter,
      fiscal_year
    ]
    type: time
  }

  dimension_group: most_recent_qsc {
    group_label: "Lead Lifecycle: QSC"
    label: "Most Recent"
    sql: coalesce(${TABLE}.MOST_RECENT_QSC_DATE__C,${lead_status_dates.most_recent_qsc_date}) ;;
    timeframes: [
      date,
      week,
      month,
      fiscal_quarter,
      fiscal_year
    ]
    type: time
  }

  dimension: hit_qsc {
    group_label: "Lead Lifecycle: QSC"
    label: "Hit QSC?"
    type: yesno
    sql: ${first_qsc_date} IS NOT NULL ;;
  }

  dimension_group: first_qso {
    group_label: "Lead Lifecycle: QSO"
    label: "First"
    sql: coalesce(${TABLE}.FIRST_QSO_DATE__C,${lead_status_dates.first_qso_date}) ;;
    timeframes: [
      date,
      week,
      month,
      fiscal_quarter,
      fiscal_year
    ]
    type: time
  }

  dimension_group: most_recent_qso {
    group_label: "Lead Lifecycle: QSO"
    label: "Most Recent"
    sql: coalesce(${TABLE}.MOST_RECENT_QSO_DATE__C,${lead_status_dates.most_recent_qso_date}) ;;
    timeframes: [
      date,
      week,
      month,
      fiscal_quarter,
      fiscal_year
    ]
    type: time
  }

  dimension: hit_qso {
    group_label: "Lead Lifecycle: QSO"
    label: "Hit QSO?"
    type: yesno
    sql: ${first_qso_date} IS NOT NULL ;;
  }

  dimension_group: first_not_a_lead {
    group_label: "Lead Lifecycle: Not a Lead"
    label: "First"
    sql: coalesce(${TABLE}.FIRST_NOT_A_LEAD_DATE__C,${lead_status_dates.first_not_a_lead_date}) ;;
    timeframes: [
      date,
      week,
      month,
      fiscal_quarter,
      fiscal_year
    ]
    type: time
  }

  dimension: hit_not_a_lead {
    group_label: "Lead Lifecycle: Not a Lead"
    label: "Hit Not a Lead?"
    type: yesno
    sql: ${first_not_a_lead_date} IS NOT NULL ;;
  }

  dimension_group: first_pql {
    group_label: "Lead Lifecycle: PQL"
    label: "First"
    sql: ${TABLE}.FIRST_PQL_DATE__c ;;
    timeframes: [
      date,
      week,
      month,
      fiscal_quarter,
      fiscal_year
    ]
    type: time
  }

  dimension: first_pql_type {
    group_label: "Lead Lifecycle: PQL"
    label: "First Type"
    sql: ${TABLE}.FIRST_PQL_TYPE__c ;;
    type: string
  }

  dimension_group: most_recent_pql {
    group_label: "Lead Lifecycle: PQL"
    label: "Most Recent"
    sql: ${TABLE}.MOST_RECENT_PQL_DATE__C ;;
    timeframes: [
      date,
      week,
      month,
      fiscal_quarter,
      fiscal_year
    ]
    type: time
  }

  dimension: most_recent_pql_type {
    group_label: "Lead Lifecycle: PQL"
    label: "Most Recent Type"
    sql: ${TABLE}.MOST_RECENT_PQL_TYPE__c ;;
    type: string
  }

  dimension_group: first_recycle {
    group_label: "Lead Lifecycle: Recycle"
    label: "First"
    sql: coalesce(${TABLE}.FIRST_RECYCLE_DATE__C,${lead_status_dates.first_recycle_date}) ;;
    timeframes: [
      date,
      week,
      month,
      fiscal_quarter,
      fiscal_year
    ]
    type: time
  }

  dimension_group: most_recent_recycle {
    group_label: "Lead Lifecycle: Recycle"
    label: "Most Recent"
    sql: coalesce(${TABLE}.MOST_RECYCLE_QSO_DATE__C,${lead_status_dates.most_recent_qso_date}) ;;
    timeframes: [
      date,
      week,
      month,
      fiscal_quarter,
      fiscal_year
    ]
    type: time
  }

  dimension: hit_recycle {
    group_label: "Lead Lifecycle: Recycle"
    label: "Hit Recycle?"
    type: yesno
    sql: ${first_recycle_date} IS NOT NULL ;;
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

  dimension: quality {
    sql: ${TABLE}.QUALITY__C ;;
    type: string
  }

  dimension: quality_star_rating {
    sql: ${TABLE}.QUALITY_STAR_RATING__C ;;
    type: string
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
  }

  dimension: state_code {
    sql: ${TABLE}.STATECODE ;;
    type: string
  }

  dimension: status {
    sql: ${TABLE}.STATUS ;;
    type: string
    order_by_field: status_order
  }

  dimension: status_order {
    hidden: yes
    case: {
      when: {
        sql: ${status} = 'Not a Lead';;
        label: "0"
      }
      when: {
        sql: ${status} = 'MCL';;
        label: "1"
      }
      when: {
        sql: ${status} = 'Recycle';;
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
    sql: ${sfid} ;;
    drill_fields: [lead_drill_fields*]
    label: "# of Leads"
    type: count_distinct
  }

  measure: count_hit_mcl {
    sql: ${sfid} ;;
    filters: {
      field: hit_mcl
      value: "yes"
    }
    drill_fields: [lead_drill_fields*]
    label: "# of Leads Hit MCL"
    type: count_distinct
  }

  measure: count_hit_mel {
    sql: ${sfid} ;;
    filters: {
      field: hit_mel
      value: "yes"
    }
    drill_fields: [lead_drill_fields*]
    label: "# of Leads Hit MEL"
    type: count_distinct
  }

  measure: count_hit_mql {
    sql: ${sfid} ;;
    filters: {
      field: hit_mql
      value: "yes"
    }
    drill_fields: [lead_drill_fields*]
    label: "# of Leads Hit MQL"
    type: count_distinct
  }

  measure: count_hit_scl {
    sql: ${sfid} ;;
    filters: {
      field: hit_scl
      value: "yes"
    }
    drill_fields: [lead_drill_fields*]
    label: "# of Leads Hit SCL"
    type: count_distinct
  }

  measure: count_hit_qsc {
    sql: ${sfid} ;;
    filters: {
      field: hit_qsc
      value: "yes"
    }
    drill_fields: [lead_drill_fields*]
    label: "# of Leads Hit QSC"
    type: count_distinct
  }

  measure: count_hit_qso {
    sql: ${sfid} ;;
    filters: {
      field: hit_qso
      value: "yes"
    }
    drill_fields: [lead_drill_fields*]
    label: "# of Leads Hit QSO"
    type: count_distinct
  }

  measure: count_hit_recycle {
    sql: ${sfid} ;;
    filters: {
      field: hit_recycle
      value: "yes"
    }
    drill_fields: [lead_drill_fields*]
    label: "# of Leads Hit Recycle"
    type: count_distinct
  }

  measure: count_not_a_lead {
    sql: ${sfid} ;;
    filters: {
      field: hit_not_a_lead
      value: "yes"
    }
    drill_fields: [lead_drill_fields*]
    label: "# of Not a Leads"
    type: count_distinct
  }
}
