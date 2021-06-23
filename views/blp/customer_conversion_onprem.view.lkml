
# This is the view file for the analytics.blp.customer_conversion_onprem table.
view: customer_conversion_onprem {
sql_table_name: blp.customer_conversion_onprem ;;
view_label: "Customer Conversion Onprem"



### SETS


    
### DIMENSIONS



  dimension: accountid {
    label: "Account Id"
    description: "The Salesforce Accountid of the instance."
    type: string
    sql: ${TABLE}.accountid ;;
  }


  dimension: account_name {
    label: "Account Name"
    description: "The Salesforce Account Name of the instance."
    type: string
    sql: ${TABLE}.account_name ;;
  }


  dimension: sku {
    label: "Sku"
    description: "The SKU of the instance."
    type: string
    sql: ${TABLE}.sku ;;
  }


  dimension: free_to_paid {
    label: "Free To Paid"
    description: "Indicates Free To Paid is marked true/enabled."
    type: yesno
    sql: ${TABLE}.free_to_paid ;;
  }



  dimension: churned {
    label: "Churned"
    description: "Indicates Churned is marked true."
    type: yesno
    sql: ${TABLE}.churned ;;
  }



  dimension: servers {
    label: "Servers"
    description: "The Server count associated with the Salesforce Account during its lifetime."
    type: string
    sql: ${TABLE}.servers ;;
  }



  dimension: accountid_match {
    label: "Accountid Match"
    description: "Indicates Accountid Match is marked true/enabled."
    type: yesno
    sql: ${TABLE}.accountid_match ;;
    hidden: yes
  }



  dimension: license_key_match {
    label: "License Key Match"
    description: "Indicates License Key Match is marked true/enabled."
    type: yesno
    sql: ${TABLE}.license_key_match ;;
    hidden: yes
  }



  dimension: trial_to_paid_conversion {
    label: "Trial To Paid Conversion"
    description: "Indicates Trial To Paid Conversion is marked true/enabled."
    type: yesno
    sql: ${TABLE}.trial_to_paid_conversion ;;
  }



  dimension: hold_public {
    label: "Hold Public"
    description: "Indicates the Mattermost Customer is represented as an opportunity in the Salesforce Hold Public Account i.e. the customer purchased using a public domain."
    type: yesno
    sql: ${TABLE}.hold_public ;;
  }



  dimension: id {
    label: "Id"
    description: "The Id of the instance."
    type: string
    sql: ${TABLE}.id ;;
    hidden: yes
  }


### DATES & TIMESTAMPS



  dimension_group: first_telemetry {
    label: "First Telemetry "
    type: time
    timeframes: [, date, week, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.first_telemetry_date ;;
    ::date
  }

  dimension: first_telemetry_date_dayname {
    group_label: "First Telemetry "
    label: "First Telemetry Date Day Name"
    description: "The name of the day of the week that the First Telemetry Date occurred on (i.e. Monday ,Tuesday, Wednesday)."
    type: string
    sql: dayname(${first_telemetry_date}::date) ;;
    
  } 

  dimension: first_telemetry_date_dayofweek {
    group_label: "First Telemetry "
    label: "First Telemetry Date Day of Week"
    description: "The day number within the week that the First Telemetry Date occurred on (i.e. 1-7)."
    type: number
    sql: extract(dayofweek from ${first_telemetry_date}::date) ;;
    
  }

  dimension: first_telemetry_date_dayofyear {
    group_label: "First Telemetry "
    label: "First Telemetry Date Day of Year"
    description: "The week number within the year that the First Telemetry Date occurred on (i.e. 1-52)."
    type: number
    sql: extract(weekofyear from ${first_telemetry_date}::date) ;;
    
  }  



  dimension_group: paid_conversion {
    label: "Paid Conversion "
    type: time
    timeframes: [, date, week, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.paid_conversion_date ;;
    ::date
  }

  dimension: paid_conversion_date_dayname {
    group_label: "Paid Conversion "
    label: "Paid Conversion Date Day Name"
    description: "The name of the day of the week that the Paid Conversion Date occurred on (i.e. Monday ,Tuesday, Wednesday)."
    type: string
    sql: dayname(${paid_conversion_date}::date) ;;
    
  } 

  dimension: paid_conversion_date_dayofweek {
    group_label: "Paid Conversion "
    label: "Paid Conversion Date Day of Week"
    description: "The day number within the week that the Paid Conversion Date occurred on (i.e. 1-7)."
    type: number
    sql: extract(dayofweek from ${paid_conversion_date}::date) ;;
    
  }

  dimension: paid_conversion_date_dayofyear {
    group_label: "Paid Conversion "
    label: "Paid Conversion Date Day of Year"
    description: "The week number within the year that the Paid Conversion Date occurred on (i.e. 1-52)."
    type: number
    sql: extract(weekofyear from ${paid_conversion_date}::date) ;;
    
  }  



  dimension_group: paid_expire {
    label: "Paid Expire "
    type: time
    timeframes: [, date, week, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.paid_expire_date ;;
    ::date
  }

  dimension: paid_expire_date_dayname {
    group_label: "Paid Expire "
    label: "Paid Expire Date Day Name"
    description: "The name of the day of the week that the Paid Expire Date occurred on (i.e. Monday ,Tuesday, Wednesday)."
    type: string
    sql: dayname(${paid_expire_date}::date) ;;
    
  } 

  dimension: paid_expire_date_dayofweek {
    group_label: "Paid Expire "
    label: "Paid Expire Date Day of Week"
    description: "The day number within the week that the Paid Expire Date occurred on (i.e. 1-7)."
    type: number
    sql: extract(dayofweek from ${paid_expire_date}::date) ;;
    
  }

  dimension: paid_expire_date_dayofyear {
    group_label: "Paid Expire "
    label: "Paid Expire Date Day of Year"
    description: "The week number within the year that the Paid Expire Date occurred on (i.e. 1-52)."
    type: number
    sql: extract(weekofyear from ${paid_expire_date}::date) ;;
    
  }  



  dimension_group: last_telemetry {
    label: "Last Telemetry "
    type: time
    timeframes: [, date, week, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.last_telemetry_date ;;
    ::date
  }

  dimension: last_telemetry_date_dayname {
    group_label: "Last Telemetry "
    label: "Last Telemetry Date Day Name"
    description: "The name of the day of the week that the Last Telemetry Date occurred on (i.e. Monday ,Tuesday, Wednesday)."
    type: string
    sql: dayname(${last_telemetry_date}::date) ;;
    
  } 

  dimension: last_telemetry_date_dayofweek {
    group_label: "Last Telemetry "
    label: "Last Telemetry Date Day of Week"
    description: "The day number within the week that the Last Telemetry Date occurred on (i.e. 1-7)."
    type: number
    sql: extract(dayofweek from ${last_telemetry_date}::date) ;;
    
  }

  dimension: last_telemetry_date_dayofyear {
    group_label: "Last Telemetry "
    label: "Last Telemetry Date Day of Year"
    description: "The week number within the year that the Last Telemetry Date occurred on (i.e. 1-52)."
    type: number
    sql: extract(weekofyear from ${last_telemetry_date}::date) ;;
    
  }  



  dimension_group: trial {
    label: "Trial "
    type: time
    timeframes: [, date, week, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.trial_date ;;
    ::date
  }

  dimension: trial_date_dayname {
    group_label: "Trial "
    label: "Trial Date Day Name"
    description: "The name of the day of the week that the Trial Date occurred on (i.e. Monday ,Tuesday, Wednesday)."
    type: string
    sql: dayname(${trial_date}::date) ;;
    
  } 

  dimension: trial_date_dayofweek {
    group_label: "Trial "
    label: "Trial Date Day of Week"
    description: "The day number within the week that the Trial Date occurred on (i.e. 1-7)."
    type: number
    sql: extract(dayofweek from ${trial_date}::date) ;;
    
  }

  dimension: trial_date_dayofyear {
    group_label: "Trial "
    label: "Trial Date Day of Year"
    description: "The week number within the year that the Trial Date occurred on (i.e. 1-52)."
    type: number
    sql: extract(weekofyear from ${trial_date}::date) ;;
    
  }  



### MEASURES



  measure: free_to_paid_count {
    group_label: "Instance Counts"
    label: "Free To Paid"
    description: "The distinct count of servers/workspaces with Free To Paid marked true/enabled."
    type: count_distinct
    sql: CASE WHEN ${free_to_paid} THEN {} ELSE NULL END;;
  }



  measure: churned_count {
    group_label: "Instance Counts"
    label: "Churned"
    description: "The distinct count of servers/workspaces with Churned marked true/enabled."
    type: count_distinct
    sql: CASE WHEN ${churned} THEN {} ELSE NULL END;;
  }



  measure: servers_sum {
    group_label: "Servers Measures"
    label: "Servers (Sum)"
    description: "The sum of Servers across all instances within the grouping."
    type: sum
    sql: ${servers} ;;
  }

  measure: servers_avg {
    group_label: "Servers Measures"
    label: "Servers (Avg)"
    description: "The average Servers across all instances within the grouping."
    type: average
    sql: ${servers} ;;
  }

  measure: servers_median {
    group_label: "Servers Measures"
    label: "Servers (Avg)"
    description: "The median Servers across all instances within the grouping."
    type: median
    sql: ${servers} ;;
  }



  measure: accountid_match_count {
    group_label: "Instance Counts"
    label: "Accountid Match"
    description: "The distinct count of servers/workspaces with Accountid Match marked true/enabled."
    type: count_distinct
    sql: CASE WHEN ${accountid_match} THEN {} ELSE NULL END;;
  }



  measure: license_key_match_count {
    group_label: "Instance Counts"
    label: "License Key Match"
    description: "The distinct count of servers/workspaces with License Key Match marked true/enabled."
    type: count_distinct
    sql: CASE WHEN ${license_key_match} THEN {} ELSE NULL END;;
  }



  measure: trial_to_paid_conversion_count {
    group_label: "Instance Counts"
    label: "Trial To Paid Conversion"
    description: "The distinct count of servers/workspaces with Trial To Paid Conversion marked true/enabled."
    type: count_distinct
    sql: CASE WHEN ${trial_to_paid_conversion} THEN {} ELSE NULL END;;
  }



  measure: hold_public_count {
    group_label: "Instance Counts"
    label: "Hold Public"
    description: "The distinct count of servers/workspaces with Hold Public marked true/enabled."
    type: count_distinct
    sql: CASE WHEN ${hold_public} THEN {} ELSE NULL END;;
  }


