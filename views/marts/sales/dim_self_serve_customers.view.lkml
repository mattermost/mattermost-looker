# The name of this view in Looker is "Dim Self Serve Customers"
view: dim_self_serve_customers {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "MART_SALES"."DIM_SELF_SERVE_CUSTOMERS" ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Contact First Name" in Explore.

  dimension: contact_first_name {
    type: string
    sql: ${TABLE}."CONTACT_FIRST_NAME" ;;
  }

  dimension: contact_last_name {
    type: string
    sql: ${TABLE}."CONTACT_LAST_NAME" ;;
  }

  dimension: customer_id {
    primary_key:  yes
    type: string
    sql: ${TABLE}."CUSTOMER_ID" ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}."EMAIL" ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}."NAME" ;;
  }
  measure: count {
    type: count
    drill_fields: [name, contact_last_name, contact_first_name]
  }
}
