view: forecast_ww {
  view_label: "FC WW"
  sql_table_name: orgm.forecast_ww__c ;;
  drill_fields: [quarter, target, likely, max, notes]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
    group_label: "System"
  }

  dimension: _hc_err {
    type: string
    sql: ${TABLE}._hc_err ;;
    group_label: "System"
  }

  dimension: _hc_lastop {
    type: string
    sql: ${TABLE}._hc_lastop ;;
    group_label: "System"
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
    sql: ${TABLE}.createddate ;;
    group_label: "System"
  }

  dimension: isdeleted {
    type: yesno
    sql: ${TABLE}.isdeleted ;;
    group_label: "System"
  }

  dimension: lastmodifiedbyid {
    type: string
    sql: ${TABLE}.lastmodifiedbyid ;;
    group_label: "System"
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
    sql: ${TABLE}.lastmodifieddate ;;
    group_label: "System"
  }

  dimension: likely {
    type: number
    sql: ${TABLE}.likely__c ;;
    hidden: yes
  }

  dimension: max {
    type: number
    sql: ${TABLE}.max__c ;;
    hidden: yes
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
    hidden: yes
  }

  dimension: notes {
    type: string
    sql: ${TABLE}.notes__c ;;
  }

  dimension: ownerid {
    type: string
    sql: ${TABLE}.ownerid ;;
    group_label: "System"
  }

  dimension: quarter {
    type: string
    sql: ${TABLE}.quarter__c ;;
    link: {
      label: "SFDC Record"
      url:"@{salesforce_link}{{sfid}}"
      icon_url: "https://mattermost.my.salesforce.com/favicon.ico"
    }
  }

  dimension: sfid {
    type: string
    sql: ${TABLE}.sfid ;;
    group_label: "System"
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
    sql: ${TABLE}.systemmodstamp ;;
    group_label: "System"
  }

  dimension: target {
    type: number
    sql: ${TABLE}.target__c ;;
    hidden: yes
  }

# Measures
  measure: total_likely {
    type: sum
    sql: ${likely} ;;
    label: "Likely"
    value_format_name: usd_0
  }

  measure: total_target {
    type: sum
    sql: ${target} ;;
    label: "Target"
    value_format_name: usd_0
  }

  measure: total_max {
    type: sum
    sql: ${max} ;;
    label: "Max"
    value_format_name: usd_0
  }

}
