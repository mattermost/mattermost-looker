view: dim_board_customers {

  label: "Board Customers"
  sql_table_name: "MART_PRODUCT"."DIM_BOARD_CUSTOMERS" ;;


  dimension: server_id {
    type: string
    sql: ${TABLE}.server_id ;;
    primary_key: yes
    hidden:  yes
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
    label: "Name"
    view_label: "Customer: Contact information"
  }

  dimension: contact_first_name {
    type: string
    sql: ${TABLE}.contact_first_name ;;
    label: "First Name"
    view_label: "Customer: Contact information"
  }

  dimension: contact_last_name {
    type: string
    sql: ${TABLE}.contact_last_name ;;
    label: "Last Name"
    view_label: "Customer: Contact information"
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
    label: "Email"
    view_label: "Customer: Contact information"
  }


  dimension: stripe_customer_id {
    type: string
    sql: ${TABLE}."STRIPE_CUSTOMER_ID" ;;
    label: "Stripe Customer ID"
    view_label: "Customer: Metadata"
  }

}
