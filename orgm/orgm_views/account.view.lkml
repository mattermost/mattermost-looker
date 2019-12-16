view: account {
  sql_table_name: orgm.account ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }

  dimension: _hc_err {
    type: string
    sql: ${TABLE}."_hc_err" ;;
    group_label: "Heroku Connect"
    label: "Error"
  }

  dimension: _hc_lastop {
    type: string
    sql: ${TABLE}."_hc_lastop" ;;
    group_label: "Heroku Connect"
    label: "Last Ops"
  }

  dimension: account_arr__c {
    type: number
    sql: ${TABLE}."account_arr__c" ;;
    label: "ARR"
  }

  dimension: annualrevenue {
    type: number
    sql: ${TABLE}."annualrevenue" ;;
    label: "Annual Revenue"
  }

  dimension: company_type__c {
    type: string
    sql: ${TABLE}."company_type__c" ;;
    label: "Company Type"
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
  }

  dimension: isdeleted {
    type: yesno
    sql: ${TABLE}."isdeleted" ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}."name";;
    label: "Account Name"
  }

  dimension: named_account__c {
    type: yesno
    sql: ${TABLE}."named_account__c" ;;
    label: "Named Account"
  }

  dimension: named_account_tier__c {
    type: string
    sql: ${TABLE}."named_account_tier__c" ;;
    label: "Account Tier"
  }

  dimension: ownerid {
    type: string
    sql: ${TABLE}."ownerid" ;;
  }

  dimension: parentid {
    type: string
    sql: ${TABLE}."parentid" ;;
  }

  dimension: sfid {
    type: string
    sql: ${TABLE}."sfid" ;;
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
  }

  dimension: territory__c {
    type: string
    sql: ${TABLE}."territory__c" ;;
  }

  dimension: territoryid__c {
    type: string
    sql: ${TABLE}."territoryid__c" ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}."type" ;;
  }

  dimension: website {
    type: string
    sql: ${TABLE}."website" ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name]
    label: "# Accounts"

  }
}
