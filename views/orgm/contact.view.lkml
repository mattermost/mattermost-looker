# Contact data from salesforce.
#
# Groups Labels
# -


view: contact {
  sql_table_name: orgm.contact ;;

  #
  # Dimensions
  #

  dimension: accountid {
    sql: ${TABLE}.ACCOUNTID ;;
    type: string
  }

  dimension: createdbyid {
    sql: ${TABLE}.CREATEDBYID ;;
    type: string
  }

  dimension_group: created {
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

  dimension: clearbit_employee_count {
    group_label: "Employee Counts"
    sql: ${TABLE}.Clearbit_Employee_Count__c ;;
    type: number
  }

  dimension: discoverorg_employee_count {
    group_label: "Employee Counts"
    sql: ${TABLE}.DiscoverOrg_Employee_Count__c ;;
    type: number
  }

  dimension: do_not_call {
    sql: ${TABLE}.DONOTCALL ;;
    type: yesno
  }

  dimension: email {
    sql: ${TABLE}.EMAIL ;;
    type: string
    link: {
      label: "Salesforce Lead"
      url: "@{salesforce_link}{{sfid}}"
    }
  }

  dimension: employee_count {
    group_label: "Employee Counts"
    sql: ${TABLE}.Employees__c ;;
    type: number
  }

  dimension: employee_count_override {
    group_label: "Employee Counts"
    sql: ${TABLE}.Employee_Count_Override__c ;;
    type: number
  }

  dimension: is_deleted {
    sql: ${TABLE}.ISDELETED ;;
    type: yesno
  }

  dimension_group: first_mcl {
    group_label: "Lead Lifecycle: MCL"
    label: "MCL First"
    sql: ${TABLE}.FIRST_MCL_DATE__C ;;
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
    label: "MCL Most Recent"
    sql: ${TABLE}.MOST_RECENT_MCL_DATE__C ;;
    timeframes: [
      date,
      week,
      month,
      fiscal_quarter,
      fiscal_year
    ]
    type: time
  }

  dimension_group: first_mel {
    group_label: "Lead Lifecycle: MEL"
    label: "MEL First"
    sql: ${TABLE}.FIRST_MEL_DATE__C ;;
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
    label: "MEL Most Recent"
    sql: ${TABLE}.MOST_RECENT_MEL_DATE__C ;;
    timeframes: [
      date,
      week,
      month,
      fiscal_quarter,
      fiscal_year
    ]
    type: time
  }

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

  dimension: how_did_you_hear_about_mattermost {
    sql: ${TABLE}.HOW_DID_YOU_HEAR_ABOUT_MATTERMOST__C ;;
    type: string
  }

  dimension_group: most_recent_mql {
    group_label: "Lead Lifecycle: MQL"
    label: "MQL Most Recent"
    sql: ${TABLE}.MOST_RECENT_MQL_DATE__C ;;
    timeframes: [
      date,
      week,
      month,
      fiscal_quarter,
      fiscal_year
    ]
    type: time
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

  dimension_group: most_recent_scl {
    group_label: "Lead Lifecycle: SCL"
    label: "SCL Most Recent"
    sql: ${TABLE}.MOST_RECENT_SCL_DATE__C ;;
    timeframes: [
      date,
      week,
      month,
      fiscal_quarter,
      fiscal_year
    ]
    type: time
  }

  dimension_group: first_qsc {
    group_label: "Lead Lifecycle: QSC"
    label: "QSC First"
    sql: ${TABLE}.FIRST_QSC_DATE__C ;;
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
    label: "QSC Most Recent"
    sql: ${TABLE}.MOST_RECENT_QSC_DATE__C ;;
    timeframes: [
      date,
      week,
      month,
      fiscal_quarter,
      fiscal_year
    ]
    type: time
  }

  dimension_group: first_qso {
    group_label: "Lead Lifecycle: QSO"
    label: "QSO First"
    sql: ${TABLE}.FIRST_QSO_DATE__C ;;
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
    label: "QSO Most Recent"
    sql: ${TABLE}.MOST_RECENT_QSO_DATE__C ;;
    timeframes: [
      date,
      week,
      month,
      fiscal_quarter,
      fiscal_year
    ]
    type: time
  }

  dimension_group: first_junk {
    group_label: "Lead Lifecycle: Junk"
    label: "Junk First"
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

  dimension_group: first_pql {
    group_label: "Lead Lifecycle: PQL"
    label: "PQL First"
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
    label: "PQL First Type"
    sql: ${TABLE}.FIRST_PQL_TYPE__c ;;
    type: string
  }

  dimension_group: most_recent_pql {
    group_label: "Lead Lifecycle: PQL"
    label: "PQL Most Recent"
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
    label: "PQL Most Recent Type"
    sql: ${TABLE}.MOST_RECENT_PQL_TYPE__c ;;
    type: string
  }

  dimension_group: first_recycled {
    group_label: "Lead Lifecycle: Recycled"
    label: "Recycled First"
    sql: ${TABLE}.FIRST_RECYCLED_DATE__C ;;
    timeframes: [
      date,
      week,
      month,
      fiscal_quarter,
      fiscal_year
    ]
    type: time
  }

  dimension_group: most_recent_recycled {
    group_label: "Lead Lifecycle: Recycled"
    label: "Recycled Most Recent"
    sql: ${TABLE}.MOST_RECYCLED_QSO_DATE__C ;;
    timeframes: [
      date,
      week,
      month,
      fiscal_quarter,
      fiscal_year
    ]
    type: time
  }

  dimension: name {
    sql: ${TABLE}.NAME ;;
    type: string
  }

  dimension: ownerid {
    label: "Owner ID"
    sql: ${TABLE}.OWNERID ;;
    type: string
  }

  dimension: sfid {
    label: "Contact ID"
    primary_key: yes
    sql: ${TABLE}.SFID ;;
    type: string
  }


  #
  # Measures
  #

  measure: count {
    label: "# of Contacts"
    type: count
  }
}
