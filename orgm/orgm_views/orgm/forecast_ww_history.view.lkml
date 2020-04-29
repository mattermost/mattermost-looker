view: forecast_ww_history {
  sql_table_name: orgm.forecast_ww_history__c ;;
  view_label: "FC WW Hist"
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
    group_label: "System"
  }

  dimension: _hc_err {
    type: string
    sql: ${TABLE}."_hc_err" ;;
    group_label: "System"
    }

  dimension: _hc_lastop {
    type: string
    sql: ${TABLE}."_hc_lastop" ;;
    group_label: "System"
    }

  dimension: createdbyid {
    type: string
    sql: ${TABLE}."createdbyid" ;;
    group_label: "System"
    }

  dimension: fc_hist_date {
    type: date
    sql: ${TABLE}."createddate" ;;
    label: " FC Date"
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
    sql: ${TABLE}."createddate" ;;
    group_label: "System"
    }

  dimension: fc_to_history {
    type: string
    sql: ${TABLE}."fc_to_history__c" ;;
    group_label: "System"
    }

  dimension: isdeleted {
    type: yesno
    sql: ${TABLE}."isdeleted" ;;
    group_label: "System"
    }

  dimension: lastmodifiedbyid {
    type: string
    sql: ${TABLE}."lastmodifiedbyid" ;;
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
    sql: ${TABLE}."lastmodifieddate" ;;
    group_label: "System"
    }

  dimension: likely {
    type: number
    sql: ${TABLE}."likely__c" ;;
  }

  dimension: max {
    type: number
    sql: ${TABLE}."max__c" ;;
    }

  dimension: name {
    type: string
    sql: ${TABLE}."name" ;;
    link: {
      label: "SFDC Record"
      url:"@{salesforce_link}{{sfid}}"
      icon_url: "https://mattermost.my.salesforce.com/favicon.ico"
    }
  }

  dimension: notes {
    type: string
    sql: ${TABLE}."notes__c" ;;
  }

  dimension: sfid {
    type: string
    sql: ${TABLE}."sfid" ;;
    group_label: "System"
    hidden: yes
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
    sql: ${TABLE}."systemmodstamp" ;;
    group_label: "System"
    }

  dimension: target {
    type: number
    sql: ${TABLE}."target__c" ;;
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
