
# This is the view file for the analytics.blp.customer_conversion_cloud table.
view: customer_conversion_cloud {
sql_table_name: blp.customer_conversion_cloud ;;
view_label: "Customer Conversion Cloud"



### SETS



### DIMENSIONS



  dimension: account_id {
    label: "Account Id"
    description: "The Salesforce Account Id of the Mattermost customer."
    type: string
    sql: ${TABLE}.account_id ;;
  }


  dimension: account_name {
    label: "Account Name"
    description: "The Salesforce Account Name of the Mattermost customer."
    type: string
    sql: ${TABLE}.account_name ;;
  }


  dimension: customer_email {
    label: "Customer Email"
    description: "The Customer Email of the Mattermost customer."
    type: string
    sql: ${TABLE}.customer_email ;;
  }


  dimension: stripe_customer_id {
    label: "Stripe Customer Id"
    description: "The Stripe Customer Id of the  Mattermost customer."
    type: string
    sql: ${TABLE}.stripe_customer_id ;;
  }


  dimension: blapi_subscription_id {
    label: "Blapi Subscription Id"
    description: "The Blapi Subscription Id of the Mattermost customer."
    type: string
    sql: ${TABLE}.blapi_subscription_id ;;
  }


  dimension: subscription_id {
    label: "Subscription Id"
    description: "The Subscription Id of the Mattermost customer."
    type: string
    sql: ${TABLE}.subscription_id ;;
  }


  dimension: cloud_installation_id {
    label: "Cloud Installation Id"
    description: "The Cloud Installation Id of the Mattermost customer."
    type: string
    sql: ${TABLE}.cloud_installation_id ;;
  }


  dimension: id {
    label: "Id"
    description: "The Id of the Mattermost customer."
    type: string
    sql: ${TABLE}.id ;;
    hidden: yes
  }


### DATES & TIMESTAMPS



  dimension_group: first_active {
    label: "First Active "
    type: time
    timeframes: [date, week, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.first_active_date::date ;;
  }

  dimension: first_active_date_dayname {
    group_label: "First Active "
    label: "First Active Date Day Name"
    description: "The name of the day of the week that the First Active Date occurred on (i.e. Monday ,Tuesday, Wednesday)."
    type: string
    sql: dayname(${first_active_date}::date) ;;

  }

  dimension: first_active_date_dayofweek {
    group_label: "First Active "
    label: "First Active Date Day of Week"
    description: "The day number within the week that the First Active Date occurred on (i.e. 1-7)."
    type: number
    sql: extract(dayofweek from ${first_active_date}::date) ;;

  }

  dimension: first_active_date_dayofyear {
    group_label: "First Active "
    label: "First Active Date Day of Year"
    description: "The week number within the year that the First Active Date occurred on (i.e. 1-52)."
    type: number
    sql: extract(weekofyear from ${first_active_date}::date) ;;

  }



  dimension_group: last_active {
    label: "Last Active "
    type: time
    timeframes: [, date, week, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.last_active_date::date ;;
  }

  dimension: last_active_date_dayname {
    group_label: "Last Active "
    label: "Last Active Date Day Name"
    description: "The name of the day of the week that the Last Active Date occurred on (i.e. Monday ,Tuesday, Wednesday)."
    type: string
    sql: dayname(${last_active_date}::date) ;;

  }

  dimension: last_active_date_dayofweek {
    group_label: "Last Active "
    label: "Last Active Date Day of Week"
    description: "The day number within the week that the Last Active Date occurred on (i.e. 1-7)."
    type: number
    sql: extract(dayofweek from ${last_active_date}::date) ;;

  }

  dimension: last_active_date_dayofyear {
    group_label: "Last Active "
    label: "Last Active Date Day of Year"
    description: "The week number within the year that the Last Active Date occurred on (i.e. 1-52)."
    type: number
    sql: extract(weekofyear from ${last_active_date}::date) ;;

  }



  dimension_group: paid_conversion {
    label: "Paid Conversion "
    type: time
    timeframes: [, date, week, month, year, fiscal_quarter, fiscal_year]
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



### MEASURES



  measure: account_id_count {
    group_label: "Account Counts"
    label: "Account Id"
    description: "The distinct count of account id's within the grouping."
    type: count_distinct
    sql: ${account_id} ;;
  }



  measure: stripe_customer_id_count {
    group_label: "Stripe_Customer Counts"
    label: "Stripe Customer Id"
    description: "The distinct count of stripe customer id's within the grouping."
    type: count_distinct
    sql: ${stripe_customer_id} ;;
  }



  measure: blapi_subscription_id_count {
    group_label: "Blapi_Subscription Counts"
    label: "Blapi Subscription Id"
    description: "The distinct count of blapi subscription id's within the grouping."
    type: count_distinct
    sql: ${blapi_subscription_id} ;;
  }



  measure: subscription_id_count {
    group_label: "Subscription Counts"
    label: "Subscription Id"
    description: "The distinct count of subscription id's within the grouping."
    type: count_distinct
    sql: ${subscription_id} ;;
  }



  measure: cloud_installation_id_count {
    group_label: "Cloud_Installation Counts"
    label: "Cloud Installation Id"
    description: "The distinct count of cloud installation id's within the grouping."
    type: count_distinct
    sql: ${cloud_installation_id} ;;
  }

}
