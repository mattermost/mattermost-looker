
# This is the view file for the analytics.blp.customer_conversion_onprem table.
view: customer_conversion_onprem {
sql_table_name: blp.customer_conversion_onprem ;;
view_label: "Customer Conversion Onprem"



### SETS
set: onprem_conversion_drill {
  fields: [accountid, account_name, sku, paid_conversion_date,free_to_paid, trial_date, trial_to_paid_conversion, churned, servers]
}


### DIMENSIONS



  dimension: accountid {
    label: "Accountid"
    description: "The Accountid of the instance."
    type: string
    sql: ${TABLE}.accountid ;;
  }


  dimension: account_name {
    label: "Account Name"
    description: "The Account Name of the instance."
    type: string
    sql: ${TABLE}.account_name ;;
  }


  dimension: sku {
    label: "Sku"
    description: "The Sku of the instance."
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
    description: "Indicates Churned is marked true/enabled."
    type: yesno
    sql: ${TABLE}.churned ;;
  }



  dimension: servers {
    label: "Servers"
    description: "The Servers of the instance."
    type: string
    sql: ${TABLE}.servers ;;
  }

  dimension: trial_server_id {
    label: "Trial Server Id"
    description: "The Server ID for the first trial license of the customer."
    type: string
    sql: ${TABLE}.trial_server_id ;;
  }



  dimension: accountid_match {
    label: "Accountid Match"
    description: "Indicates Accountid Match is marked true/enabled."
    type: yesno
    sql: ${TABLE}.accountid_match ;;
  }



  dimension: trial_to_paid_conversion {
    label: "Trial To Paid Conversion"
    description: "Indicates Trial To Paid Conversion is marked true/enabled."
    type: yesno
    sql: ${TABLE}.trial_to_paid_conversion ;;
  }



  dimension: hold_public {
    label: "Hold Public"
    description: "Indicates Hold Public is marked true/enabled."
    type: yesno
    sql: ${TABLE}.hold_public ;;
  }



  dimension: amount {
    label: "Amount"
    description: "The Amount of the instance."
    type: string
    sql: ${TABLE}.amount ;;
  }



  dimension: id {
    label: "Id"
    description: "The Id of the instance."
    type: string
    sql: ${TABLE}.id ;;
  }


### DATES & TIMESTAMPS



  dimension_group: first_telemetry {
    label: "First Telemetry "
    type: time
    timeframes: [date, week, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.first_telemetry_date::date ;;

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
    timeframes: [date, week, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.paid_conversion_date::date ;;

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
    timeframes: [date, week, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.paid_expire_date::date ;;

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
    timeframes: [date, week, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.last_telemetry_date::date ;;

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
    timeframes: [date, week, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.trial_date::date ;;

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
    sql: CASE WHEN ${free_to_paid} THEN ${accountid} ELSE NULL END;;
    drill_fields: [onprem_conversion_drill*]
  }

  measure: trial_server_count {
    group_label: "Instance Count"
    label: " Trial Instances"
    description: "The count of distinct first trial instance id's for customers across the grouped dimensions."
    type: count_distinct
    sql: ${trial_server_id} ;;
    drill_fields: [onprem_conversion_drill*]
  }

  measure: trial_to_paid_server_count {
    group_label: "Instance Count"
    label: " Trial-to-Paid Instances"
    description: "The count of distinct trial to paid conversion instance id's for customers across the grouped dimensions."
    type: count_distinct
    sql: case when ${trial_to_paid_conversion} then ${trial_server_id} else null end ;;
    drill_fields: [onprem_conversion_drill*]
  }



  measure: churned_count {
    group_label: "Instance Counts"
    label: "Churned"
    description: "The distinct count of servers/workspaces with Churned marked true/enabled."
    type: count_distinct
    sql: CASE WHEN ${churned} THEN ${accountid} ELSE NULL END;;
    drill_fields: [onprem_conversion_drill*]
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
    sql: CASE WHEN ${accountid_match} THEN ${accountid} ELSE NULL END;;
  }



  measure: trial_to_paid_conversion_count {
    group_label: "Instance Counts"
    label: "Trial To Paid Conversion"
    description: "The distinct count of servers/workspaces with Trial To Paid Conversion marked true/enabled."
    type: count_distinct
    sql: CASE WHEN ${trial_to_paid_conversion} THEN ${accountid} ELSE NULL END;;
    drill_fields: [onprem_conversion_drill*]
  }



  measure: hold_public_count {
    group_label: "Instance Counts"
    label: "Hold Public"
    description: "The distinct count of servers/workspaces with Hold Public marked true/enabled."
    type: count_distinct
    sql: CASE WHEN ${hold_public} THEN ${accountid} ELSE NULL END;;
  }



  measure: amount_sum {
    group_label: "Amount Measures"
    label: "Amount (Sum)"
    description: "The sum of Amount across all instances within the grouping."
    type: sum
    sql: ${amount} ;;
  }

  measure: amount_avg {
    group_label: "Amount Measures"
    label: "Amount (Avg)"
    description: "The average Amount across all instances within the grouping."
    type: average
    sql: ${amount} ;;
  }

  measure: amount_median {
    group_label: "Amount Measures"
    label: "Amount (Avg)"
    description: "The median Amount across all instances within the grouping."
    type: median
    sql: ${amount} ;;
  }




    }
