# Campaign data from salesforce.
#
# Groups Labels
# - Hierarchy

include: "_hc_fields.view"
include: "_sdf_fields.view"
include: "_systemmodstamp.view"

view: campaign {
  sql_table_name: ORGM.CAMPAIGN ;;
  extends: [ _hc_fields, _sdf_fields, _systemmodstamp ]

  drill_fields: [campaign_drill_fields*]

  #
  # Sets
  #

  set: campaign_drill_fields {
    fields: [id, name, campaign_member.count]
  }


  #
  # Dimensions
  #

  dimension: id {
    primary_key: yes
    sql: ${TABLE}.ID ;;
    type: number
  }

  dimension: amount_all_opportunities {
    sql: ${TABLE}.AMOUNTALLOPPORTUNITIES ;;
    type: number
  }

  dimension: amount_won_opportunities {
    sql: ${TABLE}.AMOUNTWONOPPORTUNITIES ;;
    type: number
  }

  dimension: bizible2_bizible_attribution_synctype {
    sql: ${TABLE}.BIZIBLE2__BIZIBLE_ATTRIBUTION_SYNCTYPE__C ;;
    type: string
  }

  dimension: bizible2_uniqueid {
    sql: ${TABLE}.BIZIBLE2__UNIQUEID__C ;;
    type: string
  }

  dimension: campaign_offer {
    sql: ${TABLE}.CAMPAIGN_OFFER__C ;;
    type: string
  }

  dimension: campaign_offer_detail {
    sql: ${TABLE}.CAMPAIGN_OFFER_DETAIL__C ;;
    type: string
  }

  dimension: createdbyid {
    label: "Created By ID"
    sql: ${TABLE}.CREATEDBYID ;;
    type: string
  }

  dimension_group: created {
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

  dimension: description {
    sql: ${TABLE}.DESCRIPTION ;;
    type: string
  }

  dimension: dscorgpkg_suppress_from_discoverorg {
    sql: ${TABLE}.DSCORGPKG__SUPPRESS_FROM_DISCOVERORG__C ;;
    type: yesno
  }

  dimension: expected_response {
    sql: ${TABLE}.EXPECTEDRESPONSE ;;
    type: number
  }

  dimension: hierarchy_actual_cost {
    group_item_label: "Actual Cost"
    group_label: "Hierarchy"
    sql: ${TABLE}.HIERARCHYACTUALCOST ;;
    type: number
  }

  dimension: hierarchy_amount_all_opportunities {
    group_item_label: "Amount of All Opportunities"
    group_label: "Hierarchy"
    sql: ${TABLE}.HIERARCHYAMOUNTALLOPPORTUNITIES ;;
    type: number
  }

  dimension: hierarchy_amount_won_opportunities {
    group_item_label: "Amount of Won Opportunities"
    group_label: "Hierarchy"
    sql: ${TABLE}.HIERARCHYAMOUNTWONOPPORTUNITIES ;;
    type: number
  }

  dimension: hierarchy_budgeted_cost {
    group_item_label: "Budget Cost"
    group_label: "Hierarchy"
    sql: ${TABLE}.HIERARCHYBUDGETEDCOST ;;
    type: number
  }

  dimension: hierarchy_expected_revenue {
    group_item_label: "Expected Revenue"
    group_label: "Hierarchy"
    sql: ${TABLE}.HIERARCHYEXPECTEDREVENUE ;;
    type: number
  }

  dimension: hierarchy_number_of_contacts {
    group_item_label: "# of Contacts"
    group_label: "Hierarchy"
    sql: ${TABLE}.HIERARCHYNUMBEROFCONTACTS ;;
    type: number
  }

  dimension: hierarchy_number_of_converted_leads {
    group_item_label: "# of Convered Leads"
    group_label: "Hierarchy"
    sql: ${TABLE}.HIERARCHYNUMBEROFCONVERTEDLEADS ;;
    type: number
  }

  dimension: hierarchy_number_of_leads {
    group_item_label: "# of Leads"
    group_label: "Hierarchy"
    sql: ${TABLE}.HIERARCHYNUMBEROFLEADS ;;
    type: number
  }

  dimension: hierarchy_number_of_opportunities {
    group_item_label: "# of Opportunities"
    group_label: "Hierarchy"
    sql: ${TABLE}.HIERARCHYNUMBEROFOPPORTUNITIES ;;
    type: number
  }

  dimension: hierarchy_number_of_responses {
    group_item_label: "# of Won Responses"
    group_label: "Hierarchy"
    sql: ${TABLE}.HIERARCHYNUMBEROFRESPONSES ;;
    type: number
  }

  dimension: hierarchy_number_of_won_opportunities {
    group_item_label: "# of Won Opportunities"
    group_label: "Hierarchy"
    sql: ${TABLE}.HIERARCHYNUMBEROFWONOPPORTUNITIES ;;
    type: number
  }

  dimension: hierarchy_number_sent {
    group_item_label: "# Sent"
    group_label: "Hierarchy"
    sql: ${TABLE}.HIERARCHYNUMBERSENT ;;
    type: number
  }

  dimension: is_active {
    sql: ${TABLE}.ISACTIVE ;;
    type: yesno
  }

  dimension: is_deleted {
    sql: ${TABLE}.ISDELETED ;;
    type: yesno
  }

  dimension: lastmodifiedbyid {
    label: "Last Modified By ID"
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

  dimension: name {
    sql: ${TABLE}.NAME ;;
    type: string
  }

  dimension: number_of_contacts {
    group_item_label: "# of Contacts"
    sql: ${TABLE}.NUMBEROFCONTACTS ;;
    type: number
  }

  dimension: number_of_converted_leads {
    group_item_label: "# of Converted Leads"
    sql: ${TABLE}.NUMBEROFCONVERTEDLEADS ;;
    type: number
  }

  dimension: number_of_leads {
    group_item_label: "# of Leads"
    sql: ${TABLE}.NUMBEROFLEADS ;;
    type: number
  }

  dimension: number_of_opportunities {
    group_item_label: "# of Opportunities"
    sql: ${TABLE}.NUMBEROFOPPORTUNITIES ;;
    type: number
  }

  dimension: number_of_responses {
    group_item_label: "# of Responses"
    sql: ${TABLE}.NUMBEROFRESPONSES ;;
    type: number
  }

  dimension: number_of_won_opportunities {
    group_item_label: "# of Won Opportunities"
    sql: ${TABLE}.NUMBEROFWONOPPORTUNITIES ;;
    type: number
  }

  dimension: number_sent {
    group_item_label: "# Sent"
    sql: ${TABLE}.NUMBERSENT ;;
    type: number
  }

  dimension: ownerid {
    label: "Owner ID"
    sql: ${TABLE}.OWNERID ;;
    type: string
  }

  dimension: parentid {
    label: "Parent ID"
    sql: ${TABLE}.PARENTID ;;
    type: string
  }

  dimension: sfid {
    label: "SFDC ID"
    sql: ${TABLE}.SFID ;;
    type: string
  }

  dimension: status {
    sql: ${TABLE}.STATUS ;;
    type: string
  }

  dimension: type {
    sql: ${TABLE}.TYPE ;;
    type: string
  }


  #
  # Measures
  #

  measure: count {
    drill_fields: [campaign_drill_fields*]
    label: "# of Campaigns"
    type: count
  }
}
