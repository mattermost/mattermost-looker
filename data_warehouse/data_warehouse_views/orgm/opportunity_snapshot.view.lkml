view: opportunity_snapshot {
  sql_table_name: "ORGM"."OPPORTUNITY_SNAPSHOT"
    ;;
view_label: ""

  set: stand_drill_fields {
    fields: [name, stagename, forecastcategoryname, ownerid, ownername, close_date, total_amount, sales_segment, sales_segment_current]
  }

  dimension: amount {
    type: number
    sql: ${TABLE}."AMOUNT" ;;
    group_label: "Amounts"
  }

  dimension: amount_net_new {
    type: number
    sql: ${TABLE}."NET_NEW_AMOUNT" ;;
    group_label: "Amounts"
  }

  dimension: amount_renewal {
    type: number
    sql: ${TABLE}."RENEWAL_AMOUNT" ;;
    group_label: "Amounts"
  }


  dimension: arr_contributed {
    type: number
    sql: ${TABLE}."ARR_CONTRIBUTED__C" ;;
    label: "ARR"
    group_label: "Amounts"
  }

  dimension_group: close {
    type: time
    timeframes: [
      date,
      week,
      month,
      fiscal_quarter,
      fiscal_quarter_of_year,
      fiscal_year
    ]
    sql: CAST(${TABLE}."CLOSEDATE" AS TIMESTAMP_NTZ) ;;
  }

  dimension: close_quarter {
    type:  string
    sql:${close_fiscal_year} || '-' || ${close_fiscal_quarter_of_year};;
    label: "Close Fiscal Quarter"
    group_item_label: "Fiscal Quarter (String)"
    group_label: "Close Date"
  }

  dimension: close_yyyy_qq {
    type: string
    sql: ${close_fiscal_year} || '-' || ${close_fiscal_quarter_of_year};;
    label: "Fiscal YYYY-QQ"
    group_label: "Close Date"
  }

  dimension: expectedrevenue {
    type: number
    sql: ${TABLE}."EXPECTEDREVENUE" ;;
    group_label: "Amounts"
  }

  dimension: forecastcategoryname {
    type: string
    sql: ${TABLE}."FORECASTCATEGORYNAME" ;;
    order_by_field: forecastcategoryname_sort
    label: "Forecast Category"
  }

  dimension: forecastcategoryname_sort {
    type: number
    sql: CASE
            WHEN ${forecastcategoryname} = 'Closed' THEN 1
            WHEN ${forecastcategoryname} = 'Commit' THEN 2
            WHEN ${forecastcategoryname} = 'Best Case' THEN 3
            WHEN ${forecastcategoryname} = 'Pipeline' THEN 4
            WHEN ${forecastcategoryname} = 'Omitted' THEN 5
          ELSE 6 END ;;
    group_label: "Forecasting"
    label: "Forecast Category Name"
    hidden: yes
  }

  dimension: isclosed {
    type: yesno
    sql: ${TABLE}."ISCLOSED" ;;
    label: "Closed?"
  }

  dimension: iswon {
    type: yesno
    sql: ${TABLE}."ISWON" ;;
    label: "Won?"
  }

  dimension: name {
    type: string
    sql: ${TABLE}."NAME" ;;
    link: {
      url: "@{salesforce_link}{{sfid}}"
      label: "Salesforce Opportunity"
    }
  }

  dimension: ownerid {
    type: string
    sql: ${TABLE}."OWNERID" ;;
    hidden: yes
  }

  dimension: ownername {
    type: string
    sql: ${opportunity_owner.name} ;;
    label: "Owner"
  }

  dimension: probability {
    type: number
    sql: ${TABLE}."PROBABILITY" ;;
    label: "Prob"
  }

  dimension: opportunityid {
    type: string
    sql: ${TABLE}."SFID" ;;
    label: "SFDC ID"
  }

  dimension_group: snapshot {
    type: time
    timeframes: [
      date,
      day_of_week,
      day_of_week_index,
      week,
      month,
      fiscal_quarter,
      fiscal_quarter_of_year,
      fiscal_year
    ]
    sql: CAST(${TABLE}."SNAPSHOT_DATE" AS TIMESTAMP_NTZ) ;;
    group_label: "Snapshot"
  }

  dimension: snapshot_yyyy_qq {
    type: string
    sql: ${snapshot_fiscal_year} || '-' || ${snapshot_fiscal_quarter_of_year};;
    label: "Snapshot YYYY-QQ"
    group_label: "Snapshot"
  }

  dimension: stagename {
    type: string
    sql: ${TABLE}."STAGENAME" ;;
    label: "Stage"
  }

  dimension: status_wlo {
    type: string
    sql: ${TABLE}."STATUS_WLO__C" ;;
    label: "Status"
    description: "(W)on, (O)pen, (L)ost"
  }

  dimension: sales_segment {
    type: string
    sql: CASE WHEN ${TABLE}.territory_segment__c  = 'AMER_APAC' THEN 'AMER/APAC' ELSE ${TABLE}.territory_segment__c END ;;
    label: "Sales Segment"
    description: "Sales Segment at snapshot"
  }

  dimension: sales_segment_current {
    type: string
    sql: ${opportunity.territory_sales_segment};;
    label: "Sales Segment (Current)"
    description: "Sales Segment of current opportunity"
  }

  dimension: type {
    type: string
    sql: ${TABLE}."TYPE" ;;
  }

  dimension: net_new_type {
    type: string
    sql: CASE WHEN ${type} IN ('Renewal','Contract Expansion','Account Expansion') AND ${amount_net_new} > 0 THEN 'Expansion' WHEN ${type}='New Subscription' THEN 'New' ELSE 'Unknown' END;;
  }

#measures

  measure: count {
    type: count_distinct
    sql: ${opportunityid} ;;
    drill_fields: [opportunity.name, opportunity.owner_name, opportunity.csm_name, opportunity.stagename, opportunity.created_date, opportunity.close_date, opportunity.type, total_amount_net_new, total_amount_renewal, close_date]
  }

  measure: total_amount {
    type: sum
    sql: ${amount} ;;
    label: "Total"
    value_format_name: usd_0
    drill_fields: [opportunity.name, opportunity.owner_name, opportunity.csm_name, opportunity.stagename, opportunity.created_date, opportunity.close_date, opportunity.type, total_amount_net_new, total_amount_renewal, close_date]
  }

  measure: total_amount_net_new {
    type: sum
    sql: ${amount_net_new} ;;
    label: "Net New"
    value_format_name: usd_0
    drill_fields: [opportunity.name, opportunity.owner_name, opportunity.csm_name, opportunity.stagename, opportunity.created_date, opportunity.close_date, opportunity.type, total_amount, total_amount_net_new, close_date]
  }

  measure: total_amount_renewal {
    type: sum
    sql: ${amount_renewal} ;;
    label: "Renewal"
    value_format_name: usd_0
    drill_fields: [opportunity.name, opportunity.owner_name, opportunity.csm_name, opportunity.stagename, opportunity.created_date, opportunity.close_date, opportunity.type, total_amount, total_amount_renewal, close_date]
  }
}
