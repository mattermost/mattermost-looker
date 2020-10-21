# This is the view file for the analytics.blapi.PURCHASE_FACT table.
view: PURCHASE_FACT {
  sql_table_name: blapi.PURCHASE_FACT ;;
  view_label: "Purchase Fact"

  # FILTERS

  # DIMENSIONS
  dimension: id {
    description: ""
    type: string
    sql: ${TABLE}.id ;;
    hidden: no
  }

  dimension: customer_id {
    description: ""
    type: string
    sql: ${TABLE}.customer_id ;;
    hidden: no
  }

  dimension: customer_version_id {
    description: ""
    type: string
    sql: ${TABLE}.customer_version_id ;;
    hidden: no
  }

  dimension: company_address_version_id {
    description: ""
    type: string
    sql: ${TABLE}.company_address_version_id ;;
    hidden: no
  }

  dimension: billing_address_version_id {
    description: ""
    type: string
    sql: ${TABLE}.billing_address_version_id ;;
    hidden: no
  }

  dimension: subscription_id {
    description: ""
    type: string
    sql: ${TABLE}.subscription_id ;;
    hidden: no
  }

  dimension: subscription_version_id {
    description: ""
    type: string
    sql: ${TABLE}.subscription_version_id ;;
    hidden: no
  }

  dimension: payment_method_id {
    description: ""
    type: string
    sql: ${TABLE}.payment_method_id ;;
    hidden: no
  }

  dimension: payment_method_version_id {
    description: ""
    type: string
    sql: ${TABLE}.payment_method_version_id ;;
    hidden: no
  }

  dimension: payment_version_id {
    description: ""
    type: string
    sql: ${TABLE}.payment_version_id ;;
    hidden: no
  }

  dimension: customer_stripe_id {
    description: ""
    type: string
    sql: ${TABLE}.customer_stripe_id ;;
    hidden: no
  }

  dimension: subscription_stripe_id {
    description: ""
    type: string
    sql: ${TABLE}.subscription_stripe_id ;;
    hidden: no
  }

  dimension: payment_stripe_id {
    description: ""
    type: string
    sql: ${TABLE}.payment_stripe_id ;;
    hidden: no
  }

  dimension: payment_method_stripe_id {
    description: ""
    type: string
    sql: ${TABLE}.payment_method_stripe_id ;;
    hidden: no
  }

  dimension: charge_stripe_id {
    description: ""
    type: string
    sql: ${TABLE}.charge_stripe_id ;;
    hidden: no
  }

  dimension: product_stripe_id {
    description: ""
    type: string
    sql: ${TABLE}.product_stripe_id ;;
    hidden: no
  }

  dimension: has_premier_support {
    description: ""
    type: yesno
    sql: ${TABLE}.has_premier_support ;;
    hidden: no
  }

  dimension: payment_id {
    description: ""
    type: string
    sql: ${TABLE}.payment_id ;;
    hidden: no
  }

  dimension: _sdc_deleted_at {
    description: ""
    type: string
    sql: ${TABLE}._sdc_deleted_at ;;
    hidden: no
  }

  dimension: installation_id {
    description: ""
    type: string
    sql: ${TABLE}.installation_id ;;
    hidden: no
  }


  # DIMENSION GROUPS/DATES
  dimension_group: created_at {
  description: ""
  type: time
  timeframes: [time, week, date, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}.created_at ;;
    hidden: no
  }

  dimension_group: _sdc_extracted_at {
  description: ""
  type: time
  timeframes: [time, week, date, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}._sdc_extracted_at ;;
    hidden: yes
  }

  dimension_group: _sdc_batched_at {
  description: ""
  type: time
  timeframes: [time, week, date, month, year, fiscal_quarter, fiscal_year]
    sql: ${TABLE}._sdc_batched_at ;;
    hidden: yes
  }


  # MEASURES
  measure: count {
    description: "Count of rows/occurrences."
    type: count
  }

  measure: id_count {
    label: " Id Count"
    description: "The distinct count of Purchase Fact Id within each grouping."
    type: count_distinct
    sql: ${id} ;;
  }

  measure: customer_count {
    label: " Customer Count"
    description: "The distinct count of Purchase Fact Customers within each grouping."
    type: count_distinct
    sql: ${customer_id} ;;
  }

  measure: customer_version_count {
    label: " Customer Version Count"
    description: "The distinct count of Purchase Fact Customer Versions within each grouping."
    type: count_distinct
    sql: ${customer_version_id} ;;
    hidden: yes
  }

  measure: company_address_version_count {
    label: " Company Address Version Count"
    description: "The distinct count of Purchase Fact Company Address Versions within each grouping."
    type: count_distinct
    sql: ${company_address_version_id} ;;
  }

  measure: billing_address_version_count {
    label: " Billing Address Version Count"
    description: "The distinct count of Purchase Fact Billing Address Versions within each grouping."
    type: count_distinct
    sql: ${billing_address_version_id} ;;
  }

  measure: subscription_count {
    label: " Subscription Count"
    description: "The distinct count of Purchase Fact Subscriptions within each grouping."
    type: count_distinct
    sql: ${subscription_id} ;;
  }

  measure: subscription_version_count {
    label: " Subscription Version Count"
    description: "The distinct count of Purchase Fact Subscription Versions within each grouping."
    type: count_distinct
    sql: ${subscription_version_id} ;;
    hidden: yes
  }

  measure: payment_method_count {
    label: " Payment Method Count"
    description: "The distinct count of Purchase Fact Payment Methods within each grouping."
    type: count_distinct
    sql: ${payment_method_id} ;;
  }

  measure: payment_method_version_count {
    label: " Payment Method Version Count"
    description: "The distinct count of Purchase Fact Payment Method Versions within each grouping."
    type: count_distinct
    sql: ${payment_method_version_id} ;;
    hidden: yes
  }

  measure: payment_version_count {
    label: " Payment Version Count"
    description: "The distinct count of Purchase Fact Payment Versions within each grouping."
    type: count_distinct
    sql: ${payment_version_id} ;;
    hidden: yes
  }

  measure: customer_stripe_count {
    label: " Customer Stripe Count"
    description: "The distinct count of Purchase Fact Customer Stripe Id's within each grouping."
    type: count_distinct
    sql: ${customer_stripe_id} ;;
  }

  measure: subscription_stripe_count {
    label: " Subscription Stripe Count"
    description: "The distinct count of Purchase Fact Subscription Stripe Id's within each grouping."
    type: count_distinct
    sql: ${subscription_stripe_id} ;;
  }

  measure: payment_stripe_count {
    label: " Payment Stripe Count"
    description: "The distinct count of Purchase Fact Payment Stripe Id's within each grouping."
    type: count_distinct
    sql: ${payment_stripe_id} ;;
  }

  measure: payment_method_stripe_count {
    label: " Payment Method Stripe Count"
    description: "The distinct count of Purchase Fact Payment Method Stripe Id's within each grouping."
    type: count_distinct
    sql: ${payment_method_stripe_id} ;;
  }

  measure: charge_stripe_count {
    label: " Charge Stripe Count"
    description: "The distinct count of Purchase Fact Charge Stripe Id's within each grouping."
    type: count_distinct
    sql: ${charge_stripe_id} ;;
  }

  measure: product_stripe_count {
    label: " Product Stripe Count"
    description: "The distinct count of Purchase Fact Product Stripe Id's within each grouping."
    type: count_distinct
    sql: ${product_stripe_id} ;;
  }

  measure: has_premier_support_count {
    label: "Has_Premier_Support Users"
    description: "The distinct count of customers with Has Premier Support marked true."
    group_label: "User Counts"
    type: count_distinct
    sql: case when ${has_premier_support} then ${customer_id} else null end ;;
  }

  measure: payment_count {
    label: " Payment Count"
    description: "The distinct count of Purchase Fact Payments within each grouping."
    type: count_distinct
    sql: ${payment_id} ;;
  }

  measure: installation_count {
    label: " Installation Count"
    description: "The distinct count of Purchase Fact Cloud Installations within each grouping."
    type: count_distinct
    sql: ${installation_id} ;;
  }


}
