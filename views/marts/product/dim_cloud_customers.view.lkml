view: dim_cloud_customers {

  label: "Cloud Customers"
  sql_table_name: "MART_PRODUCT"."DIM_CLOUD_CUSTOMERS" ;;

  dimension: company_name {
    type: string
    sql: ${TABLE}."COMPANY_NAME" ;;
    label: "Company Name"
    view_label: "Cloud Customer: Contact information"
  }

  dimension: customer_email {
    type: string
    sql: ${TABLE}."CUSTOMER_EMAIL" ;;
    label: "Customer Email"
    view_label: "Cloud Customer: Contact information"
  }

  dimension: customer_id {
    type: string
    sql: ${TABLE}."CUSTOMER_ID" ;;
    label: "Customer ID"
    view_label: "Cloud Customer: Customer Metadata"
  }

  dimension: installation_id {
    type: string
    sql: ${TABLE}."INSTALLATION_ID" ;;
    label: "Installation ID"
    view_label: "Cloud Customer: Customer Metadata"
  }

  dimension: license_name {
    type: string
    sql: ${TABLE}."LICENSE_NAME" ;;
    label: "License Name"
    view_label: "Cloud Customer: Customer Metadata"
  }

  dimension: server_id {
    type: string
    sql: ${TABLE}."SERVER_ID" ;;
    label: "Server ID"
    view_label: "Cloud Customer: Customer Metadata"
    hidden: yes
  }
}
