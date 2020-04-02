view: territory__c {
  sql_table_name: orgm.territory__c ;;
  view_label: ""

  drill_fields: [sfid, name, country_name__c, state_name__c, geo__c, territory__c, region__c]

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

  dimension: commercial_rep__c {
    type: string
    sql: ${TABLE}."commercial_rep__c" ;;
    label: "Commercial Rep"
    group_label: "Sales Org"
  }

  dimension: country_code__c {
    type: string
    sql: ${TABLE}."country_code__c" ;;
    label: "Country Code"
    group_label: "Geo"
  }

  dimension: country_name__c {
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

  dimension: csm__c {
    type: string
    sql: ${TABLE}."csm__c" ;;
    label: "CSM"
    group_label: "Sales Org"
  }

  dimension: dwh_external_id__c {
    type: string
    sql: ${TABLE}."dwh_external_id__c" ;;
    group_label: "HC"
  }

  dimension: field_rep__c {
    type: string
    sql: ${TABLE}."field_rep__c" ;;
    label: "Field Rep"
    group_label: "Sales Org"
    }

  dimension: former_commercial_rep__c {
    type: string
    sql: ${TABLE}."former_commercial_rep__c" ;;
    label: "Former Commercial Rep"
    group_label: "Sales Org"
    }

  dimension: former_field_rep__c {
    type: string
    sql: ${TABLE}."former_field_rep__c" ;;
    label: "Former Field Rep"
    group_label: "Sales Org"
    }

  dimension: geo__c {
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

  dimension: name {
    type: string
    sql: ${TABLE}."name" ;;
    label: "Name"
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

  dimension: region__c {
    type: string
    sql: ${TABLE}."region__c" ;;
    label: "Region"
    group_label: "Geo"
  }

  dimension: renewal_rep__c {
    type: string
    sql: ${TABLE}."renewal_rep__c" ;;
    label: "Renewal Rep"
    group_label: "Sales Org"
  }

  dimension: sfid {
    type: string
    sql: ${TABLE}."sfid" ;;
    label: "SFID"
    group_label: "HC"
  }

  dimension: solution_architect_1__c {
    type: string
    sql: ${TABLE}."solution_architect_1__c" ;;
    label: "SA 1"
    group_label: "Sales Org"
  }

  dimension: solution_architect_2__c {
    type: string
    sql: ${TABLE}."solution_architect_2__c" ;;
    label: "SA 1"
    group_label: "Sales Org"
    }

  dimension: state_code__c {
    type: string
    sql: ${TABLE}."state_code__c" ;;
    label: "State Code"
    group_label: "Geo"
  }

  dimension: state_name__c {
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

  dimension: territory__c {
    type: string
    sql: ${TABLE}."territory__c" ;;
    label: "Territory"
  }

  measure: count {
    type: count
    drill_fields: [sfid, name, country_name__c, state_name__c, geo__c, territory__c, region__c]
    label: "# Terr"
  }
}
