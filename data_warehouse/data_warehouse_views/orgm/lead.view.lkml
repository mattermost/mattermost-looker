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
    sql: ${TABLE}.FIRSTNAME ;;
    type: string
  }

  dimension: geo {
    sql: ${TABLE}.GEO__C ;;
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

  dimension: inbound_outbound {
    sql: ${TABLE}.INBOUND_OUTBOUND__C ;;
    type: string
    group_label: "Marketing"
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

  dimension: lastname {
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
    sql: ${TABLE}.engagio__Matched_Account__c ;;
    type: string
    group_label: "Marketing"
  }

  dimension: mobile_phone {
    sql: ${TABLE}.MOBILEPHONE ;;
    type: string
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
#    sql: coalesce(${TABLE}.FIRST_MEL_DATE__C,${lead_status_dates.first_mel_date}) ;;
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
#    sql: coalesce(${TABLE}.MOST_RECENT_MEL_DATE__C,${lead_status_dates.most_recent_mel_date}) ;;
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
    label: "MQL Most Recent"
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

  dimension: mql_yn {
    group_label: "Lead Lifecycle: MQL"
    label: "MQL?"
    type: yesno
    sql: ${first_mql_date} IS NOT NULL ;;
  }

  dimension_group: first_scl {
    group_label: "Lead Lifecycle: SCL"
    label: "SCL First"
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
    label: "SCL Most Recent"
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

  dimension: scl_yn {
    group_label: "Lead Lifecycle: SCL"
    label: "SCL?"
    type: yesno
    sql: ${first_scl_date} IS NOT NULL ;;
  }

  dimension_group: first_qsc {
    group_label: "Lead Lifecycle: QSC"
    label: "QSC First"
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



  dimension: qsc_yn {
    group_label: "Lead Lifecycle: QSC"
    label: "QSC?"
    type: yesno
    sql: ${first_qsc_date} IS NOT NULL ;;
  }

  dimension_group: first_qso {
    group_label: "Lead Lifecycle: QSO"
    label: "QSO First"
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


  dimension: qso_yn {
    group_label: "Lead Lifecycle: QSO"
    label: "QSO?"
    type: yesno
    sql: ${first_qso_date} IS NOT NULL ;;
  }

  dimension_group: first_junk {
    group_label: "Lead Lifecycle: Junk"
    label: "Junk"
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

  dimension: junk_yn {
    group_label: "Lead Lifecycle: Junk"
    label: "Junk?"
    type: yesno
    sql: ${first_junk_date} IS NOT NULL ;;
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

  dimension_group: first_recycle {
    group_label: "Lead Lifecycle: Recycle"
    label: "Recycle First"
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
    label: "Recycle Most Recent"
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

  dimension: recycle_yn {
    group_label: "Lead Lifecycle: Recycle"
    label: "Recycle?"
    type: yesno
    sql: ${first_recycle_date} IS NOT NULL ;;
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
    label: "Owner Name"
  }

#  dimension: owner_name {
#    sql: CASE WHEN ${owner.name} IS NOT NULL THEN ${owner.name}
#              WHEN ${owner.sfid} = '00G1R000003KGjFUAW' THEN 'Queue: Unassigned'
#              WHEN ${owner.sfid} LIKE '00G360000026ZoQ%' THEN 'Queue: Junk'
#              WHEN ${owner.sfid} LIKE '00G3p000005V9UP%' THEN 'Queue: Recycled'
#              ELSE 'Queue: Undefined'
#              END ;;
#    type: string
#    label: "Owner Name"
#  }

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


  #
  # Measures
  #

  measure: count {
    sql: ${sfid} ;;
    drill_fields: [lead_drill_fields*]
    label: "# Leads"
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
}
