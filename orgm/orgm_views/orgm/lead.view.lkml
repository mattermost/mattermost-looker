view: lead {
  sql_table_name: ORGM.LEAD ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.ID ;;
  }

  dimension: _hc_lastop {
    type: string
    sql: ${TABLE}._HC_LASTOP ;;
  }

  dimension_group: _sdc_batched {
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
    sql: ${TABLE}._SDC_BATCHED_AT ;;
  }

  dimension_group: _sdc_extracted {
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
    sql: ${TABLE}._SDC_EXTRACTED_AT ;;
  }

  dimension_group: _sdc_received {
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
    sql: ${TABLE}._SDC_RECEIVED_AT ;;
  }

  dimension: _sdc_sequence {
    type: number
    sql: ${TABLE}._SDC_SEQUENCE ;;
  }

  dimension: _sdc_table_version {
    type: number
    sql: ${TABLE}._SDC_TABLE_VERSION ;;
  }

  dimension: api_id {
    type: string
    sql: ${TABLE}.API_ID__C ;;
  }

  dimension: assigned_owner {
    type: string
    sql: ${TABLE}.ASSIGNED_OWNER__C ;;
  }

  dimension: behavior_score {
    type: number
    sql: ${TABLE}.BEHAVIOR_SCORE__C ;;
  }

  dimension: campaign_id {
    type: string
    sql: ${TABLE}.CAMPAIGN_ID__C ;;
  }

  dimension: channel {
    type: string
    sql: ${TABLE}.CHANNEL__C ;;
  }

  dimension: channel_detail {
    type: string
    sql: ${TABLE}.CHANNEL_DETAIL__C ;;
  }

  dimension: company {
    type: string
    sql: ${TABLE}.COMPANY ;;
  }

  dimension: convertedaccountid {
    type: string
    sql: ${TABLE}.CONVERTEDACCOUNTID ;;
  }

  dimension: convertedcontactid {
    type: string
    sql: ${TABLE}.CONVERTEDCONTACTID ;;
  }

  dimension_group: converteddate {
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
    sql: ${TABLE}.CONVERTEDDATE ;;
  }

  dimension: convertedopportunityid {
    type: string
    sql: ${TABLE}.CONVERTEDOPPORTUNITYID ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.COUNTRY ;;
  }

  dimension: countrycode {
    type: string
    sql: ${TABLE}.COUNTRYCODE ;;
  }

  dimension: createdbyid {
    type: string
    sql: ${TABLE}.CREATEDBYID ;;
  }

  dimension_group: createddate {
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
    sql: ${TABLE}.CREATEDDATE ;;
  }

  dimension: current_sequence_status {
    type: string
    sql: ${TABLE}.CURRENT_SEQUENCE_STATUS__C ;;
  }

  dimension: e_b {
    type: string
    sql: ${TABLE}.E_B__C ;;
  }

  dimension_group: ebq_added {
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
    sql: ${TABLE}.EBQ_ADDED__C ;;
  }

  dimension: ebq_cadence {
    type: string
    sql: ${TABLE}.EBQ_CADENCE__C ;;
  }

  dimension: ebq_comments {
    type: string
    sql: ${TABLE}.EBQ_COMMENTS__C ;;
  }

  dimension_group: ebq_completed {
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
    sql: ${TABLE}.EBQ_COMPLETED__C ;;
  }

  dimension_group: ebq_date {
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
    sql: ${TABLE}.EBQ_DATE__C ;;
  }

  dimension_group: ebq_first_touch {
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
    sql: ${TABLE}.EBQ_FIRST_TOUCH__C ;;
  }

  dimension_group: ebq_next_step {
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
    sql: ${TABLE}.EBQ_NEXT_STEP__C ;;
  }

  dimension: ebq_rating {
    type: string
    sql: ${TABLE}.EBQ_RATING__C ;;
  }

  dimension: ebq_rep {
    type: string
    sql: ${TABLE}.EBQ_REP__C ;;
  }

  dimension_group: ebq_set {
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
    sql: ${TABLE}.EBQ_SET__C ;;
  }

  dimension: ebq_touches {
    type: number
    sql: ${TABLE}.EBQ_TOUCHES__C ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.EMAIL ;;
  }

  dimension: first_action {
    type: string
    sql: ${TABLE}.FIRST_ACTION__C ;;
  }

  dimension: first_action_detail {
    type: string
    sql: ${TABLE}.FIRST_ACTION_DETAIL__C ;;
  }

  dimension: firstname {
    type: string
    sql: ${TABLE}.FIRSTNAME ;;
  }

  dimension: geo {
    type: string
    sql: ${TABLE}.GEO__C ;;
  }

  dimension: hasoptedoutofemail {
    type: yesno
    sql: ${TABLE}.HASOPTEDOUTOFEMAIL ;;
  }

  dimension: hasoptedoutoffax {
    type: yesno
    sql: ${TABLE}.HASOPTEDOUTOFFAX ;;
  }

  dimension: inbound_outbound {
    type: string
    sql: ${TABLE}.INBOUND_OUTBOUND__C ;;
  }

  dimension: indirect_lead {
    type: yesno
    sql: ${TABLE}.INDIRECT_LEAD__C ;;
  }

  dimension: industry {
    type: string
    sql: ${TABLE}.INDUSTRY ;;
  }

  dimension: isdeleted {
    type: yesno
    sql: ${TABLE}.ISDELETED ;;
  }

  dimension: job_function {
    type: string
    sql: ${TABLE}.JOB_FUNCTION__C ;;
  }

  dimension: lastmodifiedbyid {
    type: string
    sql: ${TABLE}.LASTMODIFIEDBYID ;;
  }

  dimension_group: lastmodifieddate {
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
    sql: ${TABLE}.LASTMODIFIEDDATE ;;
  }

  dimension: lastname {
    type: string
    sql: ${TABLE}.LASTNAME ;;
  }

  dimension: lead2_convdays {
    type: number
    sql: ${TABLE}.LEAD2CONVDAYS__C ;;
  }

  dimension: lead2_trialdays {
    type: number
    sql: ${TABLE}.LEAD2TRIALDAYS__C ;;
  }

  dimension_group: lead_created_date {
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
    sql: ${TABLE}.LEAD_CREATED_DATE__C ;;
  }

  dimension: lead_number {
    type: string
    sql: ${TABLE}.LEAD_NUMBER__C ;;
  }

  dimension: lead_source_detail {
    type: string
    sql: ${TABLE}.LEAD_SOURCE_DETAIL__C ;;
  }

  dimension: lead_status_at_conversion {
    type: string
    sql: ${TABLE}.LEAD_STATUS_AT_CONVERSION__C ;;
  }

  dimension: lead_type {
    type: string
    sql: ${TABLE}.LEAD_TYPE__C ;;
  }

  dimension: leadsource {
    type: string
    sql: ${TABLE}.LEADSOURCE ;;
  }

  dimension_group: mel_date {
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
    sql: ${TABLE}.MEL_DATE__C ;;
  }

  dimension: mobilephone {
    type: string
    sql: ${TABLE}.MOBILEPHONE ;;
  }

  dimension: most_recent_action_detail {
    type: string
    sql: ${TABLE}.MOST_RECENT_ACTION_DETAIL__C ;;
  }

  dimension: most_recent_lead_source {
    type: string
    sql: ${TABLE}.MOST_RECENT_LEAD_SOURCE__C ;;
  }

  dimension: most_recent_lead_source_detail {
    type: string
    sql: ${TABLE}.MOST_RECENT_LEAD_SOURCE_DETAIL__C ;;
  }

  dimension: mql {
    type: yesno
    sql: ${TABLE}.MQL__C ;;
  }

  dimension_group: mql_date {
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
    sql: ${TABLE}.MQL_DATE__C ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.NAME ;;
  }

  dimension: partner_email {
    type: string
    sql: ${TABLE}.PARTNER_EMAIL__C ;;
  }

  dimension: partner_name {
    type: string
    sql: ${TABLE}.PARTNER_NAME__C ;;
  }

  dimension: persona {
    type: string
    sql: ${TABLE}.PERSONA__C ;;
  }

  dimension: phone {
    type: string
    sql: ${TABLE}.PHONE ;;
  }

  dimension: postalcode {
    type: string
    sql: ${TABLE}.POSTALCODE ;;
  }

  dimension_group: pql_date {
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
    sql: ${TABLE}.PQL_DATE__C ;;
  }

  dimension: quality {
    type: string
    sql: ${TABLE}.QUALITY__C ;;
  }

  dimension: quality_star_rating {
    type: string
    sql: ${TABLE}.QUALITY_STAR_RATING__C ;;
  }

  dimension_group: sal_date {
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
    sql: ${TABLE}.SAL_DATE__C ;;
  }

  dimension: sfid {
    type: string
    sql: ${TABLE}.SFID ;;
  }

  dimension_group: sql_date {
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
    sql: ${TABLE}.SQL_DATE__C ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.STATE ;;
  }

  dimension: statecode {
    type: string
    sql: ${TABLE}.STATECODE ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.STATUS ;;
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
    sql: ${TABLE}.SYSTEMMODSTAMP ;;
  }

  dimension: territory {
    type: string
    sql: ${TABLE}.TERRITORY__C ;;
  }

  dimension: territoryid {
    type: string
    sql: ${TABLE}.TERRITORYID__C ;;
  }

  dimension: timeline {
    type: yesno
    sql: ${TABLE}.TIMELINE__C ;;
  }

  dimension: website {
    type: string
    sql: ${TABLE}.WEBSITE ;;
  }

  measure: count {
    type: count
    drill_fields: [id, firstname, lastname, name, campaignmember.count]
  }
}
