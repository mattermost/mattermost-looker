view: dim_self_hosted_customers {

  label: "Self-Hosted Customers"
  sql_table_name: "MART_PRODUCT"."DIM_SELF_HOSTED_CUSTOMERS" ;;

  dimension: company_name {
    type: string
    sql: ${TABLE}."COMPANY_NAME" ;;
    label: "Company Name"
    view_label: "Self-Hosted Customer: Contact information"
  }

  dimension: customer_email {
    type: string
    sql: ${TABLE}."CUSTOMER_EMAIL" ;;
    label: "Customer Email"
    view_label: "Self-Hosted Customer: Contact information"
  }

  dimension: customer_id {
    type: string
    sql: ${TABLE}."CUSTOMER_ID" ;;
    label: "Customer ID"
    view_label: "Self-Hosted Customer: Customer Metadata"
  }

  dimension: license_id {
    type: string
    sql: ${TABLE}."LICENSE_ID" ;;
    label: "License ID"
    view_label: "Self-Hosted Customer: Customer Metadata"
  }

  dimension: license_name {
    type: string
    sql: ${TABLE}."LICENSE_NAME" ;;
    label: "License Name"
    view_label: "Self-Hosted Customer: Customer Metadata"
  }

  dimension: server_id {
    type: string
    sql: ${TABLE}."SERVER_ID" ;;
    label: "Server ID"
    view_label: "Self-Hosted Customer: Customer Metadata"
  }
}
