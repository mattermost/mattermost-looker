  view: territory_mapping {
  sql_table_name: orgm.territory_mapping__c ;;
  view_label: ""

  set: all_drill_fields {
      fields: [territory_name, country_name, state_name, geo, area, region, domain,
               enterprise_rep_name, commercial_rep_name]
  }

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
    group_label: "HC"
  }

  dimension: _hc_err {
    type: string
    sql: ${TABLE}."_hc_err" ;;
    group_label: "HC"
  }

  dimension: _hc_lastop {
    type: string
    sql: ${TABLE}."_hc_lastop" ;;
    group_label: "HC"
  }


  dimension: commercial_rep {
    type: string
    sql: ${TABLE}."commercial_rep__c" ;;
    label: "Commercial Rep ID"
    group_label: "Sales Org"
  }

    dimension: commercial_rep_name {
      type: string
      sql: ${commercial_rep.name} ;;
      label: "Commercial Rep Name"
      group_label: "Sales Org"
    }

  dimension: country_code {
    type: string
    sql: ${TABLE}."country_code__c" ;;
    label: "Country Code"
    group_label: "Geo"
  }

  dimension: country_name {
    type: string
    sql: ${TABLE}."country_name__c" ;;
    label: "Country Name"
    group_label: "Geo"
  }

  dimension: createdbyid {
    type: string
    sql: ${TABLE}."createdbyid" ;;
    label: "Created By"
    group_label: "System"
  }

  dimension: createddate {
    type: date
    sql: ${TABLE}."createddate" ;;
    label: "Created Date"
    group_label: "System"
  }


  dimension: dwh_external_id {
    type: string
    sql: ${TABLE}."dwh_external_id__c" ;;
    group_label: "HC"
  }

  dimension: domain {
      type: string
      sql: ${TABLE}."domain__c" ;;
      label: "Domain"
    }

  dimension: enterprise_rep {
    type: string
    sql: ${TABLE}."enterprise_rep__c" ;;
    label: "Enterprise Rep ID"
    group_label: "Sales Org"
  }

    dimension: enterprise_rep_name {
      type: string
      sql: ${enterprise_rep.name} ;;
      label: "Enterprise Rep Name"
      group_label: "Sales Org"
    }

  dimension: geo {
      type: string
      sql: ${TABLE}."geo__c" ;;
      label: "Geo"
      group_label: "Geo"
    }

  dimension: isdeleted {
    type: yesno
    sql: ${TABLE}."isdeleted" ;;
    group_label: "System"
  }

  dimension: lastactivitydate {
    type: date
    convert_tz: no
    datatype: date
    sql: ${TABLE}."lastactivitydate" ;;
    label: "Last Activity"
    group_label: "System"
  }

  dimension: lastmodifiedbyid {
    type: string
    sql: ${TABLE}."lastmodifiedbyid" ;;
    group_label: "System"  }

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

  dimension_group: lastreferenceddate {
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
    sql: ${TABLE}."lastreferenceddate" ;;
    group_label: "System"
  }

  dimension_group: lastvieweddate {
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
    sql: ${TABLE}."lastvieweddate" ;;
    group_label: "System"
  }

    dimension: mapping_type {
      type: string
      sql: ${TABLE}."mapping_type__c" ;;
      label: "Mapping Type"
      group_label: "System"
    }


  dimension: territory_name {
    type: string
    sql: ${TABLE}."name" ;;
    label: "Territory Name"
    link: {
      label: "SFDC Record"
      url: "@{salesforce_link}{{sfid._value}}"
      icon_url: "https://mattermost.my.salesforce.com/favicon.ico"
    }
  }

  dimension: ownerid {
    type: string
    sql: ${TABLE}."ownerid" ;;
    group_label: "System"
  }

  dimension: region {
    type: string
    sql: ${TABLE}."region__c" ;;
    label: "Region"
    group_label: "Geo"
  }

  dimension: sfid {
    type: string
    sql: ${TABLE}."sfid" ;;
    label: "SFID"
    group_label: "HC"
  }


  dimension: state_code {
    type: string
    sql: ${TABLE}."state_code__c" ;;
    label: "State Code"
    group_label: "Geo"
  }

  dimension: state_name {
    type: string
    sql: ${TABLE}."state_name__c" ;;
    label: "State Name"
    group_label: "Geo"

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

    dimension: area {
      type: string
      sql: ${TABLE}."area__c" ;;
      label: "Area"
      group_label: "Geo"
    }
  measure: count {
    type: count
    drill_fields: [all_drill_fields*]
    label: "# Terr"
  }
}
