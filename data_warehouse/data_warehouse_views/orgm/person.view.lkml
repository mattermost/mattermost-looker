view: person {
  derived_table: {
    sql:
        SELECT lead.sfid, email, 'Lead' as object, coalesce(lead.existing_account__c,lead.engagio__matched_account__c) as accountid
        FROM orgm.lead
        WHERE converteddate IS NULL

        UNION ALL

        SELECT contact.sfid, email, 'Contact' as object, accountid
        FROM orgm.contact
      ;;
  }

  dimension: sfid {
    primary_key: yes
    type: string
    sql: ${TABLE}.sfid ;;
  }

  dimension: object {
    type: string
    sql: ${TABLE}.object ;;
  }

  dimension: accountid {
    type: string
    sql: ${TABLE}.accountid ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
    link: {
      label: "Salesforce Link"
      url: "@{salesforce_link}{{sfid}}"
      icon_url: "https://mattermost.my.salesforce.com/favicon.ico"
    }
  }

  dimension: domain {
    type: string
    sql: split_part(${email},'@',2) ;;
  }

  dimension: public_domain {
    hidden: yes
    type: yesno
    sql: ${account_domain_mapping.domain} IS NOT NULL;;
  }

  dimension: object_ownerid {
    hidden: yes
    type: string
    sql: coalesce(${lead.ownerid},${contact.ownerid});;
  }

  dimension: owner_name {
    type: string
    sql: ${person_owner.name} ;;
  }

  dimension: website {
    type: string
    sql: coalesce(${lead.website},${account.cleaned_up_website});;
  }

  dimension: status {
    label: "Lead Status"
    type: string
    sql: ${lead.status};;
  }

  dimension: industry {
    type: string
    sql: coalesce(${lead.industry},${account.industry}) ;;
  }

  dimension: country_code {
    type: string
    sql: coalesce(${account.billing_country_code}, ${account.shipping_country_code}, ${lead.country_code}, ${lead.company_country_code}) ;;
  }

  dimension: company {
    label: "Lead Company/Account Name"
    description: "Coalesce value representing either the contact's SF Account Name or lead's company name."
    type: string
    sql: COALESCE(${account.name}, ${lead.company}) ;;
  }

  dimension: object_num_employees {
    group_label: "Number of Employees"
    group_item_label: "Salesforce (Primary)"
    label: "Salesforce Employee Count"
    type: number
    sql: coalesce(${account.number_of_employees},${lead.number_of_employees}, ${contact.employee_count}) ;;
  }

  dimension: market_segment {
    label: "Market Segment"
    sql: CASE
          WHEN ${object_num_employees} > 5000 OR ${account_owner.name} IN ('Lance Howden','Steve Green','Philip Roy','James Gribbon') THEN 'Enterprise'
          WHEN ${object_num_employees} > 500 OR ${account_owner.name} IN ('Gavin Beeman','Nicolas Beayfrere') THEN 'MidMarket'
          WHEN ${object_num_employees} > 0 OR ${account_owner.name} IN ('Jeff Johnson') THEN 'SMB'
          WHEN ${public_domain} THEN 'Public Domain'
          ELSE 'Unknown' END ;;
    order_by_field: market_segment_order
  }

  dimension: market_segment_order {
    hidden: yes
    sql: CASE
          WHEN ${object_num_employees} > 5000 OR ${account_owner.name} IN ('Lance Howden','Steve Green','Philip Roy','James Gribbon') THEN '1'
          WHEN ${object_num_employees} > 500 OR ${account_owner.name} IN ('Gavin Beeman','Nicolas Beayfrere') THEN '2'
          WHEN ${object_num_employees} > 0 OR ${account_owner.name} IN ('Jeff Johnson') THEN '3'
          WHEN ${public_domain} THEN '4'
          ELSE '5' END ;;
  }

  dimension: geo {
    sql: ${territory_mapping_country.geo} ;;
  }

  dimension: territory {
    sql: CASE WHEN ${territory_mapping_domain.enterprise_rep} = '0051R00000GntWRQAZ' THEN 'Federal' WHEN ${geo} IN ('AMER','ROW','APAC') THEN 'AMER/APAC' WHEN ${geo} = 'EMEA' THEN 'EMEA' ELSE 'Unknown' END ;;
  }


  dimension: object_cb_num_employees {
    group_label: "Number of Employees"
    group_item_label: "Clearbit"
    label: "Clearbit Employee Count"
    type: string
    sql: coalesce(${account.clearbit_employee_count}, ${lead.clearbit_employee_count}, ${contact.clearbit_employee_count}) ;;
  }

  dimension: object_do_num_employees {
    group_label: "Number of Employees"
    group_item_label: "DiscoverOrg"
    label: "DiscoverOrg Employee Count"
    type: string
    sql: coalesce(${account.discover_org_employee_count}, ${lead.discoverorg_employee_count}, ${contact.discoverorg_employee_count}) ;;
  }

  measure: count {
    label: "Count Cloud Workspaces"
    type: count_distinct
    sql: ${subscriptions_stripe.cws_dns} ;;
    drill_fields: [account.name, account.owner_name, email, subscriptions_stripe.cws_dns]
  }

}
